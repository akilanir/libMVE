package org.zeromq;

import java.io.Closeable;
import java.io.IOException;
import java.nio.channels.SelectableChannel;
import java.nio.channels.Selector;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.zeromq.ZMQ;
import zmq.PollItem;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller.class */
public class ZPoller implements Closeable {
    public static final int POLLIN = 1;
    public static final int POLLOUT = 2;
    public static final int POLLERR = 4;
    public static final int IN = 1;
    public static final int OUT = 2;
    public static final int ERR = 4;
    private final Selector selector;
    private final ItemCreator creator;
    private final Map<Object, Set<ItemHolder>> items;
    private final Set<ItemHolder> all;
    private EventsHandler globalHandler;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller$EventsHandler.class */
    public interface EventsHandler {
        boolean events(ZMQ.Socket socket, int i);

        boolean events(SelectableChannel selectableChannel, int i);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller$ItemCreator.class */
    public interface ItemCreator {
        ItemHolder create(ZMQ.Socket socket, EventsHandler eventsHandler, int i);

        ItemHolder create(SelectableChannel selectableChannel, EventsHandler eventsHandler, int i);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller$ItemHolder.class */
    public interface ItemHolder {
        PollItem item();

        ZMQ.Socket socket();

        EventsHandler handler();
    }

    static {
        $assertionsDisabled = !ZPoller.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller$ZPollItem.class */
    public static class ZPollItem extends ZMQ.PollItem implements ItemHolder {
        private final EventsHandler handler;

        public ZPollItem(ZMQ.Socket socket, EventsHandler handler, int ops) {
            super(socket, ops);
            this.handler = handler;
        }

        public ZPollItem(SelectableChannel channel, EventsHandler handler, int ops) {
            super(channel, ops);
            this.handler = handler;
        }

        @Override // org.zeromq.ZPoller.ItemHolder
        public PollItem item() {
            return base();
        }

        @Override // org.zeromq.ZPoller.ItemHolder
        public ZMQ.Socket socket() {
            return getSocket();
        }

        @Override // org.zeromq.ZMQ.PollItem
        public int hashCode() {
            int result = (31 * 1) + (item() == null ? 0 : item().hashCode());
            return (31 * ((31 * ((31 * result) + (getRawSocket() == null ? 0 : getRawSocket().hashCode()))) + (socket() == null ? 0 : socket().hashCode()))) + (handler() == null ? 0 : handler().hashCode());
        }

        @Override // org.zeromq.ZMQ.PollItem
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || !(obj instanceof ItemHolder)) {
                return false;
            }
            ItemHolder other = (ItemHolder) obj;
            if (item() == null) {
                if (other.item() != null) {
                    return false;
                }
            } else if (!item().equals(other.item())) {
                return false;
            }
            if (item().getRawSocket() == null) {
                if (other.item().getRawSocket() != null) {
                    return false;
                }
            } else if (!item().getRawSocket().equals(other.item().getRawSocket())) {
                return false;
            }
            if (socket() == null) {
                if (other.socket() != null) {
                    return false;
                }
            } else if (!socket().equals(other.socket())) {
                return false;
            }
            if (handler() == null) {
                if (other.handler() != null) {
                    return false;
                }
                return true;
            }
            if (!handler().equals(other.handler())) {
                return false;
            }
            return true;
        }

        @Override // org.zeromq.ZPoller.ItemHolder
        public EventsHandler handler() {
            return this.handler;
        }
    }

    public ZPoller(ZPoller poller) {
        this(poller.creator, poller.selector);
    }

    public ZPoller(Selector selector) {
        this(new SimpleCreator(), selector);
    }

    public ZPoller(ItemCreator creator, ZPoller poller) {
        this(creator, poller.selector);
    }

    public ZPoller(ItemCreator creator, Selector selector) {
        this.creator = creator;
        this.selector = selector;
        this.items = new HashMap();
        this.all = createContainer(0);
    }

    protected ItemHolder create(ZMQ.Socket socket, EventsHandler handler, int events) {
        if ($assertionsDisabled || socket != null) {
            return this.creator.create(socket, handler, events);
        }
        throw new AssertionError();
    }

    protected ItemHolder create(SelectableChannel channel, EventsHandler handler, int events) {
        if ($assertionsDisabled || channel != null) {
            return this.creator.create(channel, handler, events);
        }
        throw new AssertionError();
    }

    public void setGlobalHandler(EventsHandler globalHandler) {
        this.globalHandler = globalHandler;
    }

    public EventsHandler getGlobalHandler() {
        return this.globalHandler;
    }

    public final boolean register(ZMQ.Socket socket, EventsHandler handler, int events) {
        if (socket == null) {
            return false;
        }
        return add(socket, create(socket, handler, events));
    }

    public final boolean register(ZMQ.Socket socket, EventsHandler handler) {
        return register(socket, handler, 7);
    }

    public final boolean register(ZMQ.Socket socket, int events) {
        return register(socket, this.globalHandler, events);
    }

    public final boolean register(SelectableChannel channel, EventsHandler handler, int events) {
        if (channel == null) {
            return false;
        }
        return add(channel, create(channel, handler, events));
    }

    public final boolean register(SelectableChannel channel, EventsHandler handler) {
        return register(channel, handler, 7);
    }

    public final boolean register(SelectableChannel channel, int events) {
        return register(channel, this.globalHandler, events);
    }

    public final boolean register(ItemHolder item) {
        return add(null, item);
    }

    public final boolean unregister(Object socketOrChannel) {
        if (socketOrChannel == null) {
            return false;
        }
        Set<ItemHolder> items = this.items.remove(socketOrChannel);
        boolean rc = items != null;
        if (rc) {
            this.all.removeAll(items);
        }
        return rc;
    }

    public int poll(long timeout) {
        return poll(timeout, true);
    }

    protected int poll(long timeout, boolean dispatchEvents) {
        Collection<ItemHolder> all = items();
        Set<PollItem> pollItems = new HashSet<>(all.size());
        for (ItemHolder holder : all) {
            pollItems.add(holder.item());
        }
        int rc = poll(this.selector, timeout, pollItems);
        if (!dispatchEvents) {
            return rc;
        }
        if (dispatch(all, pollItems.size())) {
            return rc;
        }
        return -1;
    }

    protected int poll(Selector selector, long tout, Collection<PollItem> items) {
        int size = items.size();
        return zmq.ZMQ.poll(selector, (PollItem[]) items.toArray(new PollItem[size]), size, tout);
    }

    protected boolean dispatch(Collection<ItemHolder> all, int size) {
        ItemHolder[] array = (ItemHolder[]) all.toArray(new ItemHolder[all.size()]);
        for (ItemHolder holder : array) {
            EventsHandler handler = holder.handler();
            if (handler == null) {
                handler = this.globalHandler;
            }
            if (handler != null) {
                PollItem item = holder.item();
                int events = item.readyOps();
                if (events <= 0) {
                    continue;
                } else {
                    ZMQ.Socket socket = holder.socket();
                    SelectableChannel channel = holder.item().getRawSocket();
                    if (socket != null) {
                        if (!$assertionsDisabled && channel != null) {
                            throw new AssertionError();
                        }
                        if (!handler.events(socket, events)) {
                            return false;
                        }
                    }
                    if (channel == null) {
                        continue;
                    } else {
                        if (!$assertionsDisabled && socket != null) {
                            throw new AssertionError();
                        }
                        if (!handler.events(channel, events)) {
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }

    public boolean dispatch() {
        return dispatch(this.all, this.all.size());
    }

    public boolean isReadable(SelectableChannel channel) {
        return readable((Object) channel);
    }

    public boolean readable(SelectableChannel channel) {
        return readable((Object) channel);
    }

    public boolean isReadable(ZMQ.Socket socket) {
        return readable(socket);
    }

    public boolean readable(ZMQ.Socket socket) {
        return readable((Object) socket);
    }

    public boolean readable(Object socketOrChannel) {
        PollItem it = filter(socketOrChannel, 1);
        if (it == null) {
            return false;
        }
        return it.isReadable();
    }

    public boolean isWritable(SelectableChannel channel) {
        return writable((Object) channel);
    }

    public boolean writable(SelectableChannel channel) {
        return writable((Object) channel);
    }

    public boolean isWritable(ZMQ.Socket socket) {
        return writable((Object) socket);
    }

    public boolean writable(ZMQ.Socket socket) {
        return writable((Object) socket);
    }

    public boolean writable(Object socketOrChannel) {
        PollItem it = filter(socketOrChannel, 2);
        if (it == null) {
            return false;
        }
        return it.isWritable();
    }

    public boolean isError(SelectableChannel channel) {
        return error((Object) channel);
    }

    public boolean error(SelectableChannel channel) {
        return error((Object) channel);
    }

    public boolean isError(ZMQ.Socket socket) {
        return error((Object) socket);
    }

    public boolean error(ZMQ.Socket socket) {
        return error((Object) socket);
    }

    public boolean error(Object socketOrChannel) {
        PollItem it = filter(socketOrChannel, 4);
        if (it == null) {
            return false;
        }
        return it.isError();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    public void destroy() {
        try {
            close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZPoller$SimpleCreator.class */
    private static class SimpleCreator implements ItemCreator {
        private SimpleCreator() {
        }

        @Override // org.zeromq.ZPoller.ItemCreator
        public ItemHolder create(ZMQ.Socket socket, EventsHandler handler, int events) {
            return new ZPollItem(socket, handler, events);
        }

        @Override // org.zeromq.ZPoller.ItemCreator
        public ItemHolder create(SelectableChannel channel, EventsHandler handler, int events) {
            return new ZPollItem(channel, handler, events);
        }
    }

    protected boolean add(Object socketOrChannel, ItemHolder holder) {
        if (socketOrChannel == null) {
            ZMQ.Socket socket = holder.socket();
            SelectableChannel ch = holder.item().getRawSocket();
            if (socket == null) {
                if (!$assertionsDisabled && ch == null) {
                    throw new AssertionError();
                }
                socketOrChannel = ch;
            }
            if (ch == null) {
                if (!$assertionsDisabled && socket == null) {
                    throw new AssertionError();
                }
                socketOrChannel = socket;
            }
        }
        if (!$assertionsDisabled && socketOrChannel == null) {
            throw new AssertionError();
        }
        Set<ItemHolder> holders = this.items.get(socketOrChannel);
        if (holders == null) {
            holders = createContainer(1);
            this.items.put(socketOrChannel, holders);
        }
        boolean rc = holders.add(holder);
        if (rc) {
            this.all.add(holder);
        }
        return rc;
    }

    protected Set<ItemHolder> createContainer(int size) {
        return new HashSet(size);
    }

    protected Collection<ItemHolder> items() {
        return this.all;
    }

    protected Iterable<ItemHolder> items(Object socketOrChannel) {
        Set<ItemHolder> set = this.items.get(socketOrChannel);
        if (set == null) {
            return Collections.emptySet();
        }
        return set;
    }

    protected PollItem filter(Object socketOrChannel, int events) {
        if (socketOrChannel == null) {
            return null;
        }
        Iterable<ItemHolder> items = items(socketOrChannel);
        for (ItemHolder item : items) {
            PollItem it = item.item();
            if ((it.interestOps() & events) > 0) {
                return it;
            }
        }
        return null;
    }
}
