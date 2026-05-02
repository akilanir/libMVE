package zmq;

import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: jeromq-0.3.5.jar:zmq/PollerBase.class */
abstract class PollerBase {
    private final AtomicInteger load = new AtomicInteger(0);
    private final Map<Long, TimerInfo> timers = new MultiMap();
    private final Map<Long, TimerInfo> addingTimers = new MultiMap();
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !PollerBase.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/PollerBase$TimerInfo.class */
    private final class TimerInfo {
        IPollEvents sink;
        int id;

        public TimerInfo(IPollEvents sink, int id) {
            this.sink = sink;
            this.id = id;
        }
    }

    protected PollerBase() {
    }

    public final int getLoad() {
        return this.load.get();
    }

    protected void adjustLoad(int amount) {
        this.load.addAndGet(amount);
    }

    public void addTimer(long timeout, IPollEvents sink, int id) {
        long expiration = Clock.nowMS() + timeout;
        TimerInfo info = new TimerInfo(sink, id);
        this.addingTimers.put(Long.valueOf(expiration), info);
    }

    public void cancelTimer(IPollEvents sink, int id) {
        if (!this.addingTimers.isEmpty()) {
            this.timers.putAll(this.addingTimers);
            this.addingTimers.clear();
        }
        Iterator<Map.Entry<Long, TimerInfo>> it = this.timers.entrySet().iterator();
        while (it.hasNext()) {
            TimerInfo v = it.next().getValue();
            if (v.sink == sink && v.id == id) {
                it.remove();
                return;
            }
        }
        if (!$assertionsDisabled) {
            throw new AssertionError();
        }
    }

    protected long executeTimers() {
        if (!this.addingTimers.isEmpty()) {
            this.timers.putAll(this.addingTimers);
            this.addingTimers.clear();
        }
        if (this.timers.isEmpty()) {
            return 0L;
        }
        long current = Clock.nowMS();
        Iterator<Map.Entry<Long, TimerInfo>> it = this.timers.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Long, TimerInfo> o = it.next();
            if (o.getKey().longValue() > current) {
                return o.getKey().longValue() - current;
            }
            o.getValue().sink.timerEvent(o.getValue().id);
            it.remove();
        }
        if (!this.addingTimers.isEmpty()) {
            return executeTimers();
        }
        return 0L;
    }
}
