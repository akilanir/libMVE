package com.google.common.eventbus;

import com.google.common.collect.Multimap;

/* loaded from: guava-15.0.jar:com/google/common/eventbus/HandlerFindingStrategy.class */
interface HandlerFindingStrategy {
    Multimap<Class<?>, EventHandler> findAllHandlers(Object obj);
}
