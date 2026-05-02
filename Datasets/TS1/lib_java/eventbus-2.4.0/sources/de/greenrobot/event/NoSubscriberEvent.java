package de.greenrobot.event;

/* loaded from: eventbus-2.4.0.jar:de/greenrobot/event/NoSubscriberEvent.class */
public final class NoSubscriberEvent {
    public final EventBus eventBus;
    public final Object originalEvent;

    public NoSubscriberEvent(EventBus eventBus, Object originalEvent) {
        this.eventBus = eventBus;
        this.originalEvent = originalEvent;
    }
}
