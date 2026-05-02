package org.greenrobot.eventbus.meta;

import org.greenrobot.eventbus.SubscriberMethod;

/* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/meta/SubscriberInfo.class */
public interface SubscriberInfo {
    Class<?> getSubscriberClass();

    SubscriberMethod[] getSubscriberMethods();

    SubscriberInfo getSuperSubscriberInfo();

    boolean shouldCheckSuperclass();
}
