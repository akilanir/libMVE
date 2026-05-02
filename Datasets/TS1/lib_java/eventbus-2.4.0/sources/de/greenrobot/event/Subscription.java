package de.greenrobot.event;

/* loaded from: eventbus-2.4.0.jar:de/greenrobot/event/Subscription.class */
final class Subscription {
    final Object subscriber;
    final SubscriberMethod subscriberMethod;
    final int priority;
    volatile boolean active = true;

    Subscription(Object subscriber, SubscriberMethod subscriberMethod, int priority) {
        this.subscriber = subscriber;
        this.subscriberMethod = subscriberMethod;
        this.priority = priority;
    }

    public boolean equals(Object other) {
        if (other instanceof Subscription) {
            Subscription otherSubscription = (Subscription) other;
            return this.subscriber == otherSubscription.subscriber && this.subscriberMethod.equals(otherSubscription.subscriberMethod);
        }
        return false;
    }

    public int hashCode() {
        return this.subscriber.hashCode() + this.subscriberMethod.methodString.hashCode();
    }
}
