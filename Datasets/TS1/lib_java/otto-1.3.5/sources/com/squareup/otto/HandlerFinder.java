package com.squareup.otto;

import java.util.Map;
import java.util.Set;

/* loaded from: otto-1.3.5.jar:com/squareup/otto/HandlerFinder.class */
interface HandlerFinder {
    public static final HandlerFinder ANNOTATED = new HandlerFinder() { // from class: com.squareup.otto.HandlerFinder.1
        @Override // com.squareup.otto.HandlerFinder
        public Map<Class<?>, EventProducer> findAllProducers(Object listener) {
            return AnnotatedHandlerFinder.findAllProducers(listener);
        }

        @Override // com.squareup.otto.HandlerFinder
        public Map<Class<?>, Set<EventHandler>> findAllSubscribers(Object listener) {
            return AnnotatedHandlerFinder.findAllSubscribers(listener);
        }
    };

    Map<Class<?>, EventProducer> findAllProducers(Object obj);

    Map<Class<?>, Set<EventHandler>> findAllSubscribers(Object obj);
}
