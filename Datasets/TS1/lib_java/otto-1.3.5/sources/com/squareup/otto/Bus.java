package com.squareup.otto;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: otto-1.3.5.jar:com/squareup/otto/Bus.class */
public class Bus {
    public static final String DEFAULT_IDENTIFIER = "default";
    private final ConcurrentMap<Class<?>, Set<EventHandler>> handlersByType;
    private final ConcurrentMap<Class<?>, EventProducer> producersByType;
    private final String identifier;
    private final ThreadEnforcer enforcer;
    private final HandlerFinder handlerFinder;
    private final ThreadLocal<ConcurrentLinkedQueue<EventWithHandler>> eventsToDispatch;
    private final ThreadLocal<Boolean> isDispatching;
    private final Map<Class<?>, Set<Class<?>>> flattenHierarchyCache;

    public Bus() {
        this(DEFAULT_IDENTIFIER);
    }

    public Bus(String identifier) {
        this(ThreadEnforcer.MAIN, identifier);
    }

    public Bus(ThreadEnforcer enforcer) {
        this(enforcer, DEFAULT_IDENTIFIER);
    }

    public Bus(ThreadEnforcer enforcer, String identifier) {
        this(enforcer, identifier, HandlerFinder.ANNOTATED);
    }

    Bus(ThreadEnforcer enforcer, String identifier, HandlerFinder handlerFinder) {
        this.handlersByType = new ConcurrentHashMap();
        this.producersByType = new ConcurrentHashMap();
        this.eventsToDispatch = new ThreadLocal<ConcurrentLinkedQueue<EventWithHandler>>() { // from class: com.squareup.otto.Bus.1
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public ConcurrentLinkedQueue<EventWithHandler> initialValue() {
                return new ConcurrentLinkedQueue<>();
            }
        };
        this.isDispatching = new ThreadLocal<Boolean>() { // from class: com.squareup.otto.Bus.2
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public Boolean initialValue() {
                return false;
            }
        };
        this.flattenHierarchyCache = new HashMap();
        this.enforcer = enforcer;
        this.identifier = identifier;
        this.handlerFinder = handlerFinder;
    }

    public String toString() {
        return "[Bus \"" + this.identifier + "\"]";
    }

    public void register(Object object) {
        if (object == null) {
            throw new NullPointerException("Object to register must not be null.");
        }
        this.enforcer.enforce(this);
        Map<Class<?>, EventProducer> foundProducers = this.handlerFinder.findAllProducers(object);
        for (Class<?> type : foundProducers.keySet()) {
            EventProducer producer = foundProducers.get(type);
            EventProducer previousProducer = this.producersByType.putIfAbsent(type, producer);
            if (previousProducer != null) {
                throw new IllegalArgumentException("Producer method for type " + type + " found on type " + producer.target.getClass() + ", but already registered by type " + previousProducer.target.getClass() + ".");
            }
            Set<EventHandler> handlers = this.handlersByType.get(type);
            if (handlers != null && !handlers.isEmpty()) {
                for (EventHandler handler : handlers) {
                    dispatchProducerResultToHandler(handler, producer);
                }
            }
        }
        Map<Class<?>, Set<EventHandler>> foundHandlersMap = this.handlerFinder.findAllSubscribers(object);
        for (Class<?> type2 : foundHandlersMap.keySet()) {
            Set<EventHandler> handlers2 = this.handlersByType.get(type2);
            if (handlers2 == null) {
                Set<EventHandler> handlersCreation = new CopyOnWriteArraySet<>();
                handlers2 = this.handlersByType.putIfAbsent(type2, handlersCreation);
                if (handlers2 == null) {
                    handlers2 = handlersCreation;
                }
            }
            Set<EventHandler> foundHandlers = foundHandlersMap.get(type2);
            handlers2.addAll(foundHandlers);
        }
        for (Map.Entry<Class<?>, Set<EventHandler>> entry : foundHandlersMap.entrySet()) {
            EventProducer producer2 = this.producersByType.get(entry.getKey());
            if (producer2 != null && producer2.isValid()) {
                Set<EventHandler> foundHandlers2 = entry.getValue();
                for (EventHandler foundHandler : foundHandlers2) {
                    if (!producer2.isValid()) {
                        break;
                    } else if (foundHandler.isValid()) {
                        dispatchProducerResultToHandler(foundHandler, producer2);
                    }
                }
            }
        }
    }

    private void dispatchProducerResultToHandler(EventHandler handler, EventProducer producer) {
        Object event = null;
        try {
            event = producer.produceEvent();
        } catch (InvocationTargetException e) {
            throwRuntimeException("Producer " + producer + " threw an exception.", e);
        }
        if (event == null) {
            return;
        }
        dispatch(event, handler);
    }

    public void unregister(Object object) {
        if (object == null) {
            throw new NullPointerException("Object to unregister must not be null.");
        }
        this.enforcer.enforce(this);
        Map<Class<?>, EventProducer> producersInListener = this.handlerFinder.findAllProducers(object);
        for (Map.Entry<Class<?>, EventProducer> entry : producersInListener.entrySet()) {
            Class<?> key = entry.getKey();
            EventProducer producer = getProducerForEventType(key);
            EventProducer value = entry.getValue();
            if (value == null || !value.equals(producer)) {
                throw new IllegalArgumentException("Missing event producer for an annotated method. Is " + object.getClass() + " registered?");
            }
            this.producersByType.remove(key).invalidate();
        }
        Map<Class<?>, Set<EventHandler>> handlersInListener = this.handlerFinder.findAllSubscribers(object);
        for (Map.Entry<Class<?>, Set<EventHandler>> entry2 : handlersInListener.entrySet()) {
            Set<EventHandler> currentHandlers = getHandlersForEventType(entry2.getKey());
            Collection<EventHandler> eventMethodsInListener = entry2.getValue();
            if (currentHandlers == null || !currentHandlers.containsAll(eventMethodsInListener)) {
                throw new IllegalArgumentException("Missing event handler for an annotated method. Is " + object.getClass() + " registered?");
            }
            for (EventHandler handler : currentHandlers) {
                if (eventMethodsInListener.contains(handler)) {
                    handler.invalidate();
                }
            }
            currentHandlers.removeAll(eventMethodsInListener);
        }
    }

    public void post(Object event) {
        if (event == null) {
            throw new NullPointerException("Event to post must not be null.");
        }
        this.enforcer.enforce(this);
        Set<Class<?>> dispatchTypes = flattenHierarchy(event.getClass());
        boolean dispatched = false;
        for (Class<?> eventType : dispatchTypes) {
            Set<EventHandler> wrappers = getHandlersForEventType(eventType);
            if (wrappers != null && !wrappers.isEmpty()) {
                dispatched = true;
                for (EventHandler wrapper : wrappers) {
                    enqueueEvent(event, wrapper);
                }
            }
        }
        if (!dispatched && !(event instanceof DeadEvent)) {
            post(new DeadEvent(this, event));
        }
        dispatchQueuedEvents();
    }

    protected void enqueueEvent(Object event, EventHandler handler) {
        this.eventsToDispatch.get().offer(new EventWithHandler(event, handler));
    }

    protected void dispatchQueuedEvents() {
        if (this.isDispatching.get().booleanValue()) {
            return;
        }
        this.isDispatching.set(true);
        while (true) {
            try {
                EventWithHandler eventWithHandler = this.eventsToDispatch.get().poll();
                if (eventWithHandler != null) {
                    if (eventWithHandler.handler.isValid()) {
                        dispatch(eventWithHandler.event, eventWithHandler.handler);
                    }
                } else {
                    return;
                }
            } finally {
                this.isDispatching.set(Boolean.valueOf(false));
            }
        }
    }

    protected void dispatch(Object event, EventHandler wrapper) {
        try {
            wrapper.handleEvent(event);
        } catch (InvocationTargetException e) {
            throwRuntimeException("Could not dispatch event: " + event.getClass() + " to handler " + wrapper, e);
        }
    }

    EventProducer getProducerForEventType(Class<?> type) {
        return this.producersByType.get(type);
    }

    Set<EventHandler> getHandlersForEventType(Class<?> type) {
        return this.handlersByType.get(type);
    }

    Set<Class<?>> flattenHierarchy(Class<?> concreteClass) {
        Set<Class<?>> classes = this.flattenHierarchyCache.get(concreteClass);
        if (classes == null) {
            classes = getClassesFor(concreteClass);
            this.flattenHierarchyCache.put(concreteClass, classes);
        }
        return classes;
    }

    private Set<Class<?>> getClassesFor(Class<?> concreteClass) {
        List<Class<?>> parents = new LinkedList<>();
        Set<Class<?>> classes = new HashSet<>();
        parents.add(concreteClass);
        while (!parents.isEmpty()) {
            Class<?> clazz = parents.remove(0);
            classes.add(clazz);
            Class<?> parent = clazz.getSuperclass();
            if (parent != null) {
                parents.add(parent);
            }
        }
        return classes;
    }

    private static void throwRuntimeException(String msg, InvocationTargetException e) {
        Throwable cause = e.getCause();
        if (cause != null) {
            throw new RuntimeException(msg + ": " + cause.getMessage(), cause);
        }
        throw new RuntimeException(msg + ": " + e.getMessage(), e);
    }

    /* loaded from: otto-1.3.5.jar:com/squareup/otto/Bus$EventWithHandler.class */
    static class EventWithHandler {
        final Object event;
        final EventHandler handler;

        public EventWithHandler(Object event, EventHandler handler) {
            this.event = event;
            this.handler = handler;
        }
    }
}
