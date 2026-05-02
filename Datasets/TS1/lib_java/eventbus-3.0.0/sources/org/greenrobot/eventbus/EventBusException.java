package org.greenrobot.eventbus;

/* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/EventBusException.class */
public class EventBusException extends RuntimeException {
    private static final long serialVersionUID = -2912559384646531479L;

    public EventBusException(String detailMessage) {
        super(detailMessage);
    }

    public EventBusException(Throwable throwable) {
        super(throwable);
    }

    public EventBusException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }
}
