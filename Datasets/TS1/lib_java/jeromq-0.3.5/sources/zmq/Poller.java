package zmq;

import java.io.IOException;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/Poller.class */
public class Poller extends PollerBase implements Runnable {
    private final Map<SelectableChannel, PollSet> fdTable;
    private final AtomicBoolean retired;
    private volatile boolean stopping;
    private volatile boolean stopped;
    private Thread worker;
    private Selector selector;
    private final String name;

    @Override // zmq.PollerBase
    public /* bridge */ /* synthetic */ void cancelTimer(IPollEvents x0, int x1) {
        super.cancelTimer(x0, x1);
    }

    @Override // zmq.PollerBase
    public /* bridge */ /* synthetic */ void addTimer(long x0, IPollEvents x1, int x2) {
        super.addTimer(x0, x1, x2);
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Poller$PollSet.class */
    private static class PollSet {
        protected IPollEvents handler;
        protected SelectionKey key = null;
        protected boolean cancelled = false;
        protected int ops = 0;

        protected PollSet(IPollEvents handler) {
            this.handler = handler;
        }
    }

    public Poller() {
        this("poller");
    }

    public Poller(String name) {
        this.retired = new AtomicBoolean(false);
        this.name = name;
        this.stopping = false;
        this.stopped = false;
        this.fdTable = new HashMap();
        try {
            this.selector = Selector.open();
        } catch (IOException e) {
            throw new ZError.IOException(e);
        }
    }

    public void destroy() {
        if (!this.stopped) {
            try {
                this.worker.join();
            } catch (InterruptedException e) {
            }
        }
        try {
            this.selector.close();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public final void addHandle(SelectableChannel fd, IPollEvents events) {
        this.fdTable.put(fd, new PollSet(events));
        adjustLoad(1);
    }

    public final void removeHandle(SelectableChannel handle) {
        this.fdTable.get(handle).cancelled = true;
        this.retired.set(true);
        adjustLoad(-1);
    }

    public final void setPollIn(SelectableChannel handle) {
        register(handle, 1, false);
    }

    public final void resetPollOn(SelectableChannel handle) {
        register(handle, 1, true);
    }

    public final void setPollOut(SelectableChannel handle) {
        register(handle, 4, false);
    }

    public final void resetPollOut(SelectableChannel handle) {
        register(handle, 4, true);
    }

    public final void setPollConnect(SelectableChannel handle) {
        register(handle, 8, false);
    }

    public final void setPollAccept(SelectableChannel handle) {
        register(handle, 16, false);
    }

    private final void register(SelectableChannel handle, int ops, boolean negate) {
        PollSet pollset = this.fdTable.get(handle);
        if (negate) {
            pollset.ops &= ops ^ (-1);
        } else {
            pollset.ops |= ops;
        }
        if (pollset.key != null) {
            pollset.key.interestOps(pollset.ops);
        } else {
            this.retired.set(true);
        }
    }

    public void start() {
        this.worker = new Thread(this, this.name);
        this.worker.setDaemon(true);
        this.worker.start();
    }

    public void stop() {
        this.stopping = true;
        this.selector.wakeup();
    }

    @Override // java.lang.Runnable
    public void run() {
        int returnsImmediately = 0;
        while (!this.stopping) {
            long timeout = executeTimers();
            while (this.retired.compareAndSet(true, false)) {
                Iterator<Map.Entry<SelectableChannel, PollSet>> it = this.fdTable.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry<SelectableChannel, PollSet> entry = it.next();
                    SelectableChannel ch = entry.getKey();
                    PollSet pollset = entry.getValue();
                    if (pollset.key == null) {
                        try {
                            pollset.key = ch.register(this.selector, pollset.ops, pollset.handler);
                        } catch (ClosedChannelException e) {
                        }
                    }
                    if (pollset.cancelled || !ch.isOpen()) {
                        if (pollset.key != null) {
                            pollset.key.cancel();
                        }
                        it.remove();
                    }
                }
            }
            long start = System.currentTimeMillis();
            try {
                int rc = this.selector.select(timeout);
                if (rc == 0) {
                    if (timeout == 0 || System.currentTimeMillis() - start < timeout / 2) {
                        returnsImmediately++;
                    } else {
                        returnsImmediately = 0;
                    }
                    if (returnsImmediately > 10) {
                        rebuildSelector();
                        returnsImmediately = 0;
                    }
                } else {
                    Iterator<SelectionKey> it2 = this.selector.selectedKeys().iterator();
                    while (it2.hasNext()) {
                        SelectionKey key = it2.next();
                        IPollEvents evt = (IPollEvents) key.attachment();
                        it2.remove();
                        try {
                            if (key.isReadable()) {
                                evt.inEvent();
                            } else if (key.isAcceptable()) {
                                evt.acceptEvent();
                            } else if (key.isConnectable()) {
                                evt.connectEvent();
                            }
                            if (key.isWritable()) {
                                evt.outEvent();
                            }
                        } catch (CancelledKeyException e2) {
                        }
                    }
                }
            } catch (IOException e3) {
                throw new ZError.IOException(e3);
            }
        }
        this.stopped = true;
    }

    private void rebuildSelector() {
        try {
            Selector newSelector = Selector.open();
            try {
                this.selector.close();
            } catch (IOException e) {
            }
            this.selector = newSelector;
            for (PollSet pollSet : this.fdTable.values()) {
                pollSet.key = null;
            }
            this.retired.set(true);
        } catch (IOException e2) {
            throw new ZError.IOException(e2);
        }
    }
}
