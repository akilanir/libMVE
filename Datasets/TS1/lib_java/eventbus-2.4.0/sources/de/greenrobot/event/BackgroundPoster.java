package de.greenrobot.event;

import android.util.Log;

/* loaded from: eventbus-2.4.0.jar:de/greenrobot/event/BackgroundPoster.class */
final class BackgroundPoster implements Runnable {
    private final PendingPostQueue queue = new PendingPostQueue();
    private final EventBus eventBus;
    private volatile boolean executorRunning;

    BackgroundPoster(EventBus eventBus) {
        this.eventBus = eventBus;
    }

    public void enqueue(Subscription subscription, Object event) {
        PendingPost pendingPost = PendingPost.obtainPendingPost(subscription, event);
        synchronized (this) {
            this.queue.enqueue(pendingPost);
            if (!this.executorRunning) {
                this.executorRunning = true;
                this.eventBus.getExecutorService().execute(this);
            }
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        while (true) {
            try {
                try {
                    PendingPost pendingPost = this.queue.poll(1000);
                    if (pendingPost == null) {
                        synchronized (this) {
                            pendingPost = this.queue.poll();
                            if (pendingPost == null) {
                                this.executorRunning = false;
                                return;
                            }
                        }
                    }
                    this.eventBus.invokeSubscriber(pendingPost);
                } catch (InterruptedException e) {
                    Log.w("Event", Thread.currentThread().getName() + " was interruppted", e);
                    this.executorRunning = false;
                    return;
                }
            } finally {
                this.executorRunning = false;
            }
        }
    }
}
