package org.greenrobot.eventbus;

/* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/Subscription.class */
final class Subscription {
    final Object subscriber;
    final SubscriberMethod subscriberMethod;
    volatile boolean active = true;

    Subscription(Object subscriber, SubscriberMethod subscriberMethod) {
        this.subscriber = subscriber;
        this.subscriberMethod = subscriberMethod;
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
