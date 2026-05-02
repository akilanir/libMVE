package org.zeromq;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZLoop.class */
public class ZLoop {
    private int pollSize;
    private ZMQ.Poller pollset;
    private SPoller[] pollact;
    private boolean dirty;
    private boolean verbose;
    static final /* synthetic */ boolean $assertionsDisabled;
    private final List<SPoller> pollers = new ArrayList();
    private final List<STimer> timers = new ArrayList();
    private final List<Object> zombies = new ArrayList();
    private final List<STimer> newTimers = new ArrayList();

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZLoop$IZLoopHandler.class */
    public interface IZLoopHandler {
        int handle(ZLoop zLoop, ZMQ.PollItem pollItem, Object obj);
    }

    static {
        $assertionsDisabled = !ZLoop.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZLoop$SPoller.class */
    private class SPoller {
        ZMQ.PollItem item;
        IZLoopHandler handler;
        Object arg;
        int errors = 0;

        protected SPoller(ZMQ.PollItem item, IZLoopHandler handler, Object arg) {
            this.item = item;
            this.handler = handler;
            this.arg = arg;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZLoop$STimer.class */
    private class STimer {
        int delay;
        int times;
        IZLoopHandler handler;
        Object arg;
        long when = -1;

        public STimer(int delay, int times, IZLoopHandler handler, Object arg) {
            this.delay = delay;
            this.times = times;
            this.handler = handler;
            this.arg = arg;
        }
    }

    public void destroy() {
    }

    private void rebuild() {
        this.pollact = null;
        this.pollSize = this.pollers.size();
        this.pollset = new ZMQ.Poller(this.pollSize);
        this.pollact = new SPoller[this.pollSize];
        int itemNbr = 0;
        for (SPoller poller : this.pollers) {
            this.pollset.register(poller.item);
            this.pollact[itemNbr] = poller;
            itemNbr++;
        }
        this.dirty = false;
    }

    private long ticklessTimer() {
        long tickless = System.currentTimeMillis() + 3600000;
        for (STimer timer : this.timers) {
            if (timer.when == -1) {
                timer.when = timer.delay + System.currentTimeMillis();
            }
            if (tickless > timer.when) {
                tickless = timer.when;
            }
        }
        long timeout = tickless - System.currentTimeMillis();
        if (timeout < 0) {
            timeout = 0;
        }
        if (this.verbose) {
            System.out.printf("I: zloop: polling for %d msec\n", Long.valueOf(timeout));
        }
        return timeout;
    }

    public int addPoller(ZMQ.PollItem pollItem, IZLoopHandler handler, Object arg) {
        if (pollItem.getRawSocket() == null && pollItem.getSocket() == null) {
            return -1;
        }
        SPoller poller = new SPoller(pollItem, handler, arg);
        this.pollers.add(poller);
        this.dirty = true;
        if (this.verbose) {
            PrintStream printStream = System.out;
            Object[] objArr = new Object[3];
            objArr[0] = pollItem.getSocket() != null ? Integer.valueOf(pollItem.getSocket().getType()) : "RAW";
            objArr[1] = pollItem.getSocket();
            objArr[2] = pollItem.getRawSocket();
            printStream.printf("I: zloop: register %s poller (%s, %s)\n", objArr);
            return 0;
        }
        return 0;
    }

    public void removePoller(ZMQ.PollItem pollItem) {
        Iterator<SPoller> it = this.pollers.iterator();
        while (it.hasNext()) {
            SPoller p = it.next();
            if (pollItem.equals(p.item)) {
                it.remove();
                this.dirty = true;
            }
        }
        if (this.verbose) {
            PrintStream printStream = System.out;
            Object[] objArr = new Object[3];
            objArr[0] = pollItem.getSocket() != null ? Integer.valueOf(pollItem.getSocket().getType()) : "RAW";
            objArr[1] = pollItem.getSocket();
            objArr[2] = pollItem.getRawSocket();
            printStream.printf("I: zloop: cancel %s poller (%s, %s)", objArr);
        }
    }

    public int addTimer(int delay, int times, IZLoopHandler handler, Object arg) {
        STimer timer = new STimer(delay, times, handler, arg);
        this.newTimers.add(timer);
        if (this.verbose) {
            System.out.printf("I: zloop: register timer delay=%d times=%d\n", Integer.valueOf(delay), Integer.valueOf(times));
            return 0;
        }
        return 0;
    }

    public int removeTimer(Object arg) {
        if (!$assertionsDisabled && arg == null) {
            throw new AssertionError();
        }
        this.zombies.add(arg);
        if (this.verbose) {
            System.out.printf("I: zloop: cancel timer\n", new Object[0]);
            return 0;
        }
        return 0;
    }

    public void verbose(boolean verbose) {
        this.verbose = verbose;
    }

    public int start() {
        int rc = 0;
        this.timers.addAll(this.newTimers);
        this.newTimers.clear();
        Iterator i$ = this.timers.iterator();
        while (i$.hasNext()) {
            i$.next().when = r0.delay + System.currentTimeMillis();
        }
        while (true) {
            if (Thread.currentThread().isInterrupted()) {
                break;
            }
            if (this.dirty) {
                rebuild();
            }
            long wait = ticklessTimer();
            rc = this.pollset.poll(wait);
            if (rc == -1) {
                if (this.verbose) {
                    System.out.printf("I: zloop: interrupted (%d)\n", Integer.valueOf(rc));
                }
                rc = 0;
            } else {
                Iterator<STimer> it = this.timers.iterator();
                while (it.hasNext()) {
                    STimer timer = it.next();
                    if (System.currentTimeMillis() >= timer.when && timer.when != -1) {
                        if (this.verbose) {
                            System.out.println("I: zloop: call timer handler");
                        }
                        rc = timer.handler.handle(this, null, timer.arg);
                        if (rc == -1) {
                            break;
                        }
                        if (timer.times != 0) {
                            int i = timer.times - 1;
                            timer.times = i;
                            if (i == 0) {
                                it.remove();
                            }
                        }
                        timer.when = timer.delay + System.currentTimeMillis();
                    }
                }
                if (rc == -1) {
                    break;
                }
                for (int itemNbr = 0; itemNbr < this.pollSize; itemNbr++) {
                    SPoller poller = this.pollact[itemNbr];
                    if (this.pollset.getItem(itemNbr).isError()) {
                        if (this.verbose) {
                            PrintStream printStream = System.out;
                            Object[] objArr = new Object[3];
                            objArr[0] = poller.item.getSocket() != null ? Integer.valueOf(poller.item.getSocket().getType()) : "RAW";
                            objArr[1] = poller.item.getSocket();
                            objArr[2] = poller.item.getRawSocket();
                            printStream.printf("I: zloop: can't poll %s socket (%s, %s)\n", objArr);
                        }
                        int i2 = poller.errors;
                        poller.errors = i2 + 1;
                        if (i2 > 0) {
                            removePoller(poller.item);
                        }
                    } else {
                        poller.errors = 0;
                    }
                    if (this.pollset.getItem(itemNbr).readyOps() > 0) {
                        if (this.verbose) {
                            PrintStream printStream2 = System.out;
                            Object[] objArr2 = new Object[3];
                            objArr2[0] = poller.item.getSocket() != null ? Integer.valueOf(poller.item.getSocket().getType()) : "RAW";
                            objArr2[1] = poller.item.getSocket();
                            objArr2[2] = poller.item.getRawSocket();
                            printStream2.printf("I: zloop: call %s socket handler (%s, %s)\n", objArr2);
                        }
                        rc = poller.handler.handle(this, poller.item, poller.arg);
                        if (rc == -1) {
                            break;
                        }
                    }
                }
                for (Object arg : this.zombies) {
                    Iterator<STimer> it2 = this.timers.iterator();
                    while (it2.hasNext()) {
                        if (it2.next().arg == arg) {
                            it2.remove();
                        }
                    }
                }
                this.timers.addAll(this.newTimers);
                this.newTimers.clear();
                if (rc == -1) {
                    break;
                }
            }
        }
        return rc;
    }
}
