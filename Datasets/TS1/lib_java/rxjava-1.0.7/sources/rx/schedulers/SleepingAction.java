package rx.schedulers;

import rx.Scheduler;
import rx.functions.Action0;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/SleepingAction.class */
class SleepingAction implements Action0 {
    private final Action0 underlying;
    private final Scheduler.Worker innerScheduler;
    private final long execTime;

    public SleepingAction(Action0 underlying, Scheduler.Worker scheduler, long execTime) {
        this.underlying = underlying;
        this.innerScheduler = scheduler;
        this.execTime = execTime;
    }

    @Override // rx.functions.Action0
    public void call() {
        if (this.innerScheduler.isUnsubscribed()) {
            return;
        }
        if (this.execTime > this.innerScheduler.now()) {
            long delay = this.execTime - this.innerScheduler.now();
            if (delay > 0) {
                try {
                    Thread.sleep(delay);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    throw new RuntimeException(e);
                }
            }
        }
        if (this.innerScheduler.isUnsubscribed()) {
            return;
        }
        this.underlying.call();
    }
}
