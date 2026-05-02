package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.SetMultimap;
import com.google.common.reflect.TypeToken;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.logging.Level;
import java.util.logging.Logger;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/eventbus/EventBus.class */
public class EventBus {
    private static final LoadingCache<Class<?>, Set<Class<?>>> flattenHierarchyCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader<Class<?>, Set<Class<?>>>() { // from class: com.google.common.eventbus.EventBus.1
        @Override // com.google.common.cache.CacheLoader
        public Set<Class<?>> load(Class<?> concreteClass) {
            return TypeToken.of((Class) concreteClass).getTypes().rawTypes();
        }
    });
    private final SetMultimap<Class<?>, EventHandler> handlersByType;
    private final ReadWriteLock handlersByTypeLock;
    private final Logger logger;
    private final HandlerFindingStrategy finder;
    private final ThreadLocal<Queue<EventWithHandler>> eventsToDispatch;
    private final ThreadLocal<Boolean> isDispatching;

    public EventBus() {
        this("default");
    }

    public EventBus(String identifier) {
        this.handlersByType = HashMultimap.create();
        this.handlersByTypeLock = new ReentrantReadWriteLock();
        this.finder = new AnnotatedHandlerFinder();
        this.eventsToDispatch = new ThreadLocal<Queue<EventWithHandler>>() { // from class: com.google.common.eventbus.EventBus.2
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public Queue<EventWithHandler> initialValue() {
                return new LinkedList();
            }
        };
        this.isDispatching = new ThreadLocal<Boolean>() { // from class: com.google.common.eventbus.EventBus.3
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public Boolean initialValue() {
                return false;
            }
        };
        this.logger = Logger.getLogger(EventBus.class.getName() + "." + ((String) Preconditions.checkNotNull(identifier)));
    }

    public void register(Object object) {
        Multimap<Class<?>, EventHandler> methodsInListener = this.finder.findAllHandlers(object);
        this.handlersByTypeLock.writeLock().lock();
        try {
            this.handlersByType.putAll(methodsInListener);
            this.handlersByTypeLock.writeLock().unlock();
        } catch (Throwable th) {
            this.handlersByTypeLock.writeLock().unlock();
            throw th;
        }
    }

    public void unregister(Object object) {
        Multimap<Class<?>, EventHandler> methodsInListener = this.finder.findAllHandlers(object);
        for (Map.Entry<Class<?>, Collection<EventHandler>> entry : methodsInListener.asMap().entrySet()) {
            Class<?> eventType = entry.getKey();
            Collection<EventHandler> eventMethodsInListener = entry.getValue();
            this.handlersByTypeLock.writeLock().lock();
            try {
                Set<EventHandler> currentHandlers = this.handlersByType.get((SetMultimap<Class<?>, EventHandler>) eventType);
                if (!currentHandlers.containsAll(eventMethodsInListener)) {
                    throw new IllegalArgumentException("missing event handler for an annotated method. Is " + object + " registered?");
                }
                currentHandlers.removeAll(eventMethodsInListener);
                this.handlersByTypeLock.writeLock().unlock();
            } catch (Throwable th) {
                this.handlersByTypeLock.writeLock().unlock();
                throw th;
            }
        }
    }

    public void post(Object event) {
        Set<Class<?>> dispatchTypes = flattenHierarchy(event.getClass());
        boolean dispatched = false;
        for (Class<?> eventType : dispatchTypes) {
            this.handlersByTypeLock.readLock().lock();
            try {
                Set<EventHandler> wrappers = this.handlersByType.get((SetMultimap<Class<?>, EventHandler>) eventType);
                if (!wrappers.isEmpty()) {
                    dispatched = true;
                    for (EventHandler wrapper : wrappers) {
                        enqueueEvent(event, wrapper);
                    }
                }
            } finally {
                this.handlersByTypeLock.readLock().unlock();
            }
        }
        if (!dispatched && !(event instanceof DeadEvent)) {
            post(new DeadEvent(this, event));
        }
        dispatchQueuedEvents();
    }

    void enqueueEvent(Object event, EventHandler handler) {
        this.eventsToDispatch.get().offer(new EventWithHandler(event, handler));
    }

    void dispatchQueuedEvents() {
        if (this.isDispatching.get().booleanValue()) {
            return;
        }
        this.isDispatching.set(true);
        try {
            Queue<EventWithHandler> events = this.eventsToDispatch.get();
            while (true) {
                EventWithHandler eventWithHandler = events.poll();
                if (eventWithHandler != null) {
                    dispatch(eventWithHandler.event, eventWithHandler.handler);
                } else {
                    return;
                }
            }
        } finally {
            this.isDispatching.remove();
            this.eventsToDispatch.remove();
        }
    }

    void dispatch(Object event, EventHandler wrapper) {
        try {
            wrapper.handleEvent(event);
        } catch (InvocationTargetException e) {
            this.logger.log(Level.SEVERE, "Could not dispatch event: " + event + " to handler " + wrapper, (Throwable) e);
        }
    }

    @VisibleForTesting
    Set<Class<?>> flattenHierarchy(Class<?> concreteClass) {
        try {
            return flattenHierarchyCache.getUnchecked(concreteClass);
        } catch (UncheckedExecutionException e) {
            throw Throwables.propagate(e.getCause());
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/eventbus/EventBus$EventWithHandler.class */
    static class EventWithHandler {
        final Object event;
        final EventHandler handler;

        public EventWithHandler(Object event, EventHandler handler) {
            this.event = Preconditions.checkNotNull(event);
            this.handler = (EventHandler) Preconditions.checkNotNull(handler);
        }
    }
}
