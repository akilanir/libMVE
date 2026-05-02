package javax.jmdns.impl;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicReference;
import javax.jmdns.impl.tasks.RecordReaper;
import javax.jmdns.impl.tasks.Responder;
import javax.jmdns.impl.tasks.resolver.ServiceInfoResolver;
import javax.jmdns.impl.tasks.resolver.ServiceResolver;
import javax.jmdns.impl.tasks.resolver.TypeResolver;
import javax.jmdns.impl.tasks.state.Announcer;
import javax.jmdns.impl.tasks.state.Canceler;
import javax.jmdns.impl.tasks.state.Prober;
import javax.jmdns.impl.tasks.state.Renewer;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSTaskStarter.class */
public interface DNSTaskStarter {
    void purgeTimer();

    void purgeStateTimer();

    void cancelTimer();

    void cancelStateTimer();

    void startProber();

    void startAnnouncer();

    void startRenewer();

    void startCanceler();

    void startReaper();

    void startServiceInfoResolver(ServiceInfoImpl serviceInfoImpl);

    void startTypeResolver();

    void startServiceResolver(String str);

    void startResponder(DNSIncoming dNSIncoming, int i);

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSTaskStarter$Factory.class */
    public static final class Factory {
        private static volatile Factory _instance;
        private final ConcurrentMap<JmDNSImpl, DNSTaskStarter> _instances = new ConcurrentHashMap(20);
        private static final AtomicReference<ClassDelegate> _databaseClassDelegate = new AtomicReference<>();

        /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSTaskStarter$Factory$ClassDelegate.class */
        public interface ClassDelegate {
            DNSTaskStarter newDNSTaskStarter(JmDNSImpl jmDNSImpl);
        }

        private Factory() {
        }

        public static void setClassDelegate(ClassDelegate delegate) {
            _databaseClassDelegate.set(delegate);
        }

        public static ClassDelegate classDelegate() {
            return _databaseClassDelegate.get();
        }

        protected static DNSTaskStarter newDNSTaskStarter(JmDNSImpl jmDNSImpl) {
            DNSTaskStarter instance = null;
            ClassDelegate delegate = _databaseClassDelegate.get();
            if (delegate != null) {
                instance = delegate.newDNSTaskStarter(jmDNSImpl);
            }
            return instance != null ? instance : new DNSTaskStarterImpl(jmDNSImpl);
        }

        public static Factory getInstance() {
            if (_instance == null) {
                synchronized (Factory.class) {
                    if (_instance == null) {
                        _instance = new Factory();
                    }
                }
            }
            return _instance;
        }

        public DNSTaskStarter getStarter(JmDNSImpl jmDNSImpl) {
            DNSTaskStarter starter = this._instances.get(jmDNSImpl);
            if (starter == null) {
                this._instances.putIfAbsent(jmDNSImpl, newDNSTaskStarter(jmDNSImpl));
                starter = this._instances.get(jmDNSImpl);
            }
            return starter;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSTaskStarter$DNSTaskStarterImpl.class */
    public static final class DNSTaskStarterImpl implements DNSTaskStarter {
        private final JmDNSImpl _jmDNSImpl;
        private final Timer _timer;
        private final Timer _stateTimer;

        /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSTaskStarter$DNSTaskStarterImpl$StarterTimer.class */
        public static class StarterTimer extends Timer {
            private volatile boolean _cancelled;

            public StarterTimer() {
                this._cancelled = false;
            }

            public StarterTimer(boolean isDaemon) {
                super(isDaemon);
                this._cancelled = false;
            }

            public StarterTimer(String name, boolean isDaemon) {
                super(name, isDaemon);
                this._cancelled = false;
            }

            public StarterTimer(String name) {
                super(name);
                this._cancelled = false;
            }

            @Override // java.util.Timer
            public synchronized void cancel() {
                if (this._cancelled) {
                    return;
                }
                this._cancelled = true;
                super.cancel();
            }

            @Override // java.util.Timer
            public synchronized void schedule(TimerTask task, long delay) {
                if (this._cancelled) {
                    return;
                }
                super.schedule(task, delay);
            }

            @Override // java.util.Timer
            public synchronized void schedule(TimerTask task, Date time) {
                if (this._cancelled) {
                    return;
                }
                super.schedule(task, time);
            }

            @Override // java.util.Timer
            public synchronized void schedule(TimerTask task, long delay, long period) {
                if (this._cancelled) {
                    return;
                }
                super.schedule(task, delay, period);
            }

            @Override // java.util.Timer
            public synchronized void schedule(TimerTask task, Date firstTime, long period) {
                if (this._cancelled) {
                    return;
                }
                super.schedule(task, firstTime, period);
            }

            @Override // java.util.Timer
            public synchronized void scheduleAtFixedRate(TimerTask task, long delay, long period) {
                if (this._cancelled) {
                    return;
                }
                super.scheduleAtFixedRate(task, delay, period);
            }

            @Override // java.util.Timer
            public synchronized void scheduleAtFixedRate(TimerTask task, Date firstTime, long period) {
                if (this._cancelled) {
                    return;
                }
                super.scheduleAtFixedRate(task, firstTime, period);
            }
        }

        public DNSTaskStarterImpl(JmDNSImpl jmDNSImpl) {
            this._jmDNSImpl = jmDNSImpl;
            this._timer = new StarterTimer("JmDNS(" + this._jmDNSImpl.getName() + ").Timer", true);
            this._stateTimer = new StarterTimer("JmDNS(" + this._jmDNSImpl.getName() + ").State.Timer", false);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void purgeTimer() {
            this._timer.purge();
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void purgeStateTimer() {
            this._stateTimer.purge();
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void cancelTimer() {
            this._timer.cancel();
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void cancelStateTimer() {
            this._stateTimer.cancel();
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startProber() {
            new Prober(this._jmDNSImpl).start(this._stateTimer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startAnnouncer() {
            new Announcer(this._jmDNSImpl).start(this._stateTimer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startRenewer() {
            new Renewer(this._jmDNSImpl).start(this._stateTimer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startCanceler() {
            new Canceler(this._jmDNSImpl).start(this._stateTimer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startReaper() {
            new RecordReaper(this._jmDNSImpl).start(this._timer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startServiceInfoResolver(ServiceInfoImpl info) {
            new ServiceInfoResolver(this._jmDNSImpl, info).start(this._timer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startTypeResolver() {
            new TypeResolver(this._jmDNSImpl).start(this._timer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startServiceResolver(String type) {
            new ServiceResolver(this._jmDNSImpl, type).start(this._timer);
        }

        @Override // javax.jmdns.impl.DNSTaskStarter
        public void startResponder(DNSIncoming in, int port) {
            new Responder(this._jmDNSImpl, in, port).start(this._timer);
        }
    }
}
