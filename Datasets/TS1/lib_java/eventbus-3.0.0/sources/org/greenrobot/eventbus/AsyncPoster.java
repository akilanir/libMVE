package org.greenrobot.eventbus;

/* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/AsyncPoster.class */
class AsyncPoster implements Runnable {
    private final PendingPostQueue queue = new PendingPostQueue();
    private final EventBus eventBus;

    AsyncPoster(EventBus eventBus) {
        this.eventBus = eventBus;
    }

    public void enqueue(Subscription subscription, Object event) {
        PendingPost pendingPost = PendingPost.obtainPendingPost(subscription, event);
        this.queue.enqueue(pendingPost);
        this.eventBus.getExecutorService().execute(this);
    }

    @Override // java.lang.Runnable
    public void run() {
        PendingPost pendingPost = this.queue.poll();
        if (pendingPost == null) {
            throw new IllegalStateException("No pending post available");
        }
        this.eventBus.invokeSubscriber(pendingPost);
    }
}
