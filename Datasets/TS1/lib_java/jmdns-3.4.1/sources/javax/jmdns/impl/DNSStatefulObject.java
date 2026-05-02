package javax.jmdns.impl;

import java.util.Collection;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.impl.constants.DNSState;
import javax.jmdns.impl.tasks.DNSTask;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSStatefulObject.class */
public interface DNSStatefulObject {
    JmDNSImpl getDns();

    void associateWithTask(DNSTask dNSTask, DNSState dNSState);

    void removeAssociationWithTask(DNSTask dNSTask);

    boolean isAssociatedWithTask(DNSTask dNSTask, DNSState dNSState);

    boolean advanceState(DNSTask dNSTask);

    boolean revertState();

    boolean cancelState();

    boolean closeState();

    boolean recoverState();

    boolean isProbing();

    boolean isAnnouncing();

    boolean isAnnounced();

    boolean isCanceling();

    boolean isCanceled();

    boolean isClosing();

    boolean isClosed();

    boolean waitForAnnounced(long j);

    boolean waitForCanceled(long j);

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSStatefulObject$DNSStatefulObjectSemaphore.class */
    public static final class DNSStatefulObjectSemaphore {
        private static Logger logger = Logger.getLogger(DNSStatefulObjectSemaphore.class.getName());
        private final String _name;
        private final ConcurrentMap<Thread, Semaphore> _semaphores = new ConcurrentHashMap(50);

        public DNSStatefulObjectSemaphore(String name) {
            this._name = name;
        }

        public void waitForEvent(long timeout) {
            Thread thread = Thread.currentThread();
            Semaphore semaphore = this._semaphores.get(thread);
            if (semaphore == null) {
                Semaphore semaphore2 = new Semaphore(1, true);
                semaphore2.drainPermits();
                this._semaphores.putIfAbsent(thread, semaphore2);
            }
            Semaphore semaphore3 = this._semaphores.get(thread);
            try {
                semaphore3.tryAcquire(timeout, TimeUnit.MILLISECONDS);
            } catch (InterruptedException exception) {
                logger.log(Level.FINER, "Exception ", (Throwable) exception);
            }
        }

        public void signalEvent() {
            Collection<Semaphore> semaphores = this._semaphores.values();
            for (Semaphore semaphore : semaphores) {
                semaphore.release();
                semaphores.remove(semaphore);
            }
        }

        public String toString() {
            StringBuilder aLog = new StringBuilder(1000);
            aLog.append("Semaphore: ");
            aLog.append(this._name);
            if (this._semaphores.size() == 0) {
                aLog.append(" no semaphores.");
            } else {
                aLog.append(" semaphores:\n");
                for (Thread thread : this._semaphores.keySet()) {
                    aLog.append("\tThread: ");
                    aLog.append(thread.getName());
                    aLog.append(' ');
                    aLog.append(this._semaphores.get(thread));
                    aLog.append('\n');
                }
            }
            return aLog.toString();
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSStatefulObject$DefaultImplementation.class */
    public static class DefaultImplementation extends ReentrantLock implements DNSStatefulObject {
        private static Logger logger = Logger.getLogger(DefaultImplementation.class.getName());
        private static final long serialVersionUID = -3264781576883412227L;
        private volatile JmDNSImpl _dns = null;
        protected volatile DNSTask _task = null;
        protected volatile DNSState _state = DNSState.PROBING_1;
        private final DNSStatefulObjectSemaphore _announcing = new DNSStatefulObjectSemaphore("Announce");
        private final DNSStatefulObjectSemaphore _canceling = new DNSStatefulObjectSemaphore("Cancel");

        @Override // javax.jmdns.impl.DNSStatefulObject
        public JmDNSImpl getDns() {
            return this._dns;
        }

        protected void setDns(JmDNSImpl dns) {
            this._dns = dns;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public void associateWithTask(DNSTask task, DNSState state) {
            if (this._task == null && this._state == state) {
                lock();
                try {
                    if (this._task == null && this._state == state) {
                        setTask(task);
                    }
                } finally {
                    unlock();
                }
            }
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public void removeAssociationWithTask(DNSTask task) {
            if (this._task == task) {
                lock();
                try {
                    if (this._task == task) {
                        setTask(null);
                    }
                } finally {
                    unlock();
                }
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
        @Override // javax.jmdns.impl.DNSStatefulObject
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public boolean isAssociatedWithTask(javax.jmdns.impl.tasks.DNSTask r4, javax.jmdns.impl.constants.DNSState r5) {
            /*
                r3 = this;
                r0 = r3
                r0.lock()
                r0 = r3
                javax.jmdns.impl.tasks.DNSTask r0 = r0._task     // Catch: java.lang.Throwable -> L20
                r1 = r4
                if (r0 != r1) goto L18
                r0 = r3
                javax.jmdns.impl.constants.DNSState r0 = r0._state     // Catch: java.lang.Throwable -> L20
                r1 = r5
                if (r0 != r1) goto L18
                r0 = 1
                goto L19
            L18:
                r0 = 0
            L19:
                r6 = r0
                r0 = r3
                r0.unlock()
                r0 = r6
                return r0
            L20:
                r7 = move-exception
                r0 = r3
                r0.unlock()
                r0 = r7
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: javax.jmdns.impl.DNSStatefulObject.DefaultImplementation.isAssociatedWithTask(javax.jmdns.impl.tasks.DNSTask, javax.jmdns.impl.constants.DNSState):boolean");
        }

        protected void setTask(DNSTask task) {
            this._task = task;
        }

        protected void setState(DNSState state) {
            lock();
            try {
                this._state = state;
                if (isAnnounced()) {
                    this._announcing.signalEvent();
                }
                if (isCanceled()) {
                    this._canceling.signalEvent();
                    this._announcing.signalEvent();
                }
            } finally {
                unlock();
            }
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean advanceState(DNSTask task) {
            if (this._task == task) {
                lock();
                try {
                    if (this._task == task) {
                        setState(this._state.advance());
                    } else {
                        logger.warning("Trying to advance state whhen not the owner. owner: " + this._task + " perpetrator: " + task);
                    }
                } finally {
                    unlock();
                }
            }
            return true;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean revertState() {
            if (!willCancel()) {
                lock();
                try {
                    if (!willCancel()) {
                        setState(this._state.revert());
                        setTask(null);
                    }
                } finally {
                    unlock();
                }
            }
            return true;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean cancelState() {
            boolean result = false;
            if (!willCancel()) {
                lock();
                try {
                    if (!willCancel()) {
                        setState(DNSState.CANCELING_1);
                        setTask(null);
                        result = true;
                    }
                } finally {
                    unlock();
                }
            }
            return result;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean closeState() {
            boolean result = false;
            if (!willClose()) {
                lock();
                try {
                    if (!willClose()) {
                        setState(DNSState.CLOSING);
                        setTask(null);
                        result = true;
                    }
                } finally {
                    unlock();
                }
            }
            return result;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean recoverState() {
            lock();
            try {
                setState(DNSState.PROBING_1);
                setTask(null);
                unlock();
                return false;
            } catch (Throwable th) {
                unlock();
                throw th;
            }
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isProbing() {
            return this._state.isProbing();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isAnnouncing() {
            return this._state.isAnnouncing();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isAnnounced() {
            return this._state.isAnnounced();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isCanceling() {
            return this._state.isCanceling();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isCanceled() {
            return this._state.isCanceled();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isClosing() {
            return this._state.isClosing();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean isClosed() {
            return this._state.isClosed();
        }

        private boolean willCancel() {
            return this._state.isCanceled() || this._state.isCanceling();
        }

        private boolean willClose() {
            return this._state.isClosed() || this._state.isClosing();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean waitForAnnounced(long timeout) {
            if (!isAnnounced() && !willCancel()) {
                this._announcing.waitForEvent(timeout);
            }
            if (!isAnnounced()) {
                if (willCancel() || willClose()) {
                    logger.fine("Wait for announced cancelled: " + this);
                } else {
                    logger.warning("Wait for announced timed out: " + this);
                }
            }
            return isAnnounced();
        }

        @Override // javax.jmdns.impl.DNSStatefulObject
        public boolean waitForCanceled(long timeout) {
            if (!isCanceled()) {
                this._canceling.waitForEvent(timeout);
            }
            if (!isCanceled() && !willClose()) {
                logger.warning("Wait for canceled timed out: " + this);
            }
            return isCanceled();
        }

        @Override // java.util.concurrent.locks.ReentrantLock
        public String toString() {
            return (this._dns != null ? "DNS: " + this._dns.getName() : "NO DNS") + " state: " + this._state + " task: " + this._task;
        }
    }
}
