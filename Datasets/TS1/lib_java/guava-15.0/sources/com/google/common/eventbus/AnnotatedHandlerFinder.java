package com.google.common.eventbus;

import com.google.common.base.Objects;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import com.google.common.reflect.TypeToken;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

/* loaded from: guava-15.0.jar:com/google/common/eventbus/AnnotatedHandlerFinder.class */
class AnnotatedHandlerFinder implements HandlerFindingStrategy {
    private static final LoadingCache<Class<?>, ImmutableList<Method>> handlerMethodsCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader<Class<?>, ImmutableList<Method>>() { // from class: com.google.common.eventbus.AnnotatedHandlerFinder.1
        @Override // com.google.common.cache.CacheLoader
        public ImmutableList<Method> load(Class<?> concreteClass) throws Exception {
            return AnnotatedHandlerFinder.getAnnotatedMethodsInternal(concreteClass);
        }
    });

    AnnotatedHandlerFinder() {
    }

    @Override // com.google.common.eventbus.HandlerFindingStrategy
    public Multimap<Class<?>, EventHandler> findAllHandlers(Object listener) {
        Multimap<Class<?>, EventHandler> methodsInListener = HashMultimap.create();
        Class<?> clazz = listener.getClass();
        Iterator i$ = getAnnotatedMethods(clazz).iterator();
        while (i$.hasNext()) {
            Method method = (Method) i$.next();
            Class<?>[] parameterTypes = method.getParameterTypes();
            Class<?> eventType = parameterTypes[0];
            EventHandler handler = makeHandler(listener, method);
            methodsInListener.put(eventType, handler);
        }
        return methodsInListener;
    }

    private static ImmutableList<Method> getAnnotatedMethods(Class<?> clazz) {
        try {
            return handlerMethodsCache.getUnchecked(clazz);
        } catch (UncheckedExecutionException e) {
            throw Throwables.propagate(e.getCause());
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier.class */
    private static final class MethodIdentifier {
        private final String name;
        private final List<Class<?>> parameterTypes;

        MethodIdentifier(Method method) {
            this.name = method.getName();
            this.parameterTypes = Arrays.asList(method.getParameterTypes());
        }

        public int hashCode() {
            return Objects.hashCode(this.name, this.parameterTypes);
        }

        public boolean equals(@Nullable Object o) {
            if (o instanceof MethodIdentifier) {
                MethodIdentifier ident = (MethodIdentifier) o;
                return this.name.equals(ident.name) && this.parameterTypes.equals(ident.parameterTypes);
            }
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ImmutableList<Method> getAnnotatedMethodsInternal(Class<?> clazz) {
        Set<? extends Class<?>> supers = TypeToken.of((Class) clazz).getTypes().rawTypes();
        Map<MethodIdentifier, Method> identifiers = Maps.newHashMap();
        for (Class<?> superClazz : supers) {
            Method[] arr$ = superClazz.getMethods();
            for (Method superClazzMethod : arr$) {
                if (superClazzMethod.isAnnotationPresent(Subscribe.class)) {
                    Class<?>[] parameterTypes = superClazzMethod.getParameterTypes();
                    if (parameterTypes.length != 1) {
                        throw new IllegalArgumentException("Method " + superClazzMethod + " has @Subscribe annotation, but requires " + parameterTypes.length + " arguments.  Event handler methods must require a single argument.");
                    }
                    MethodIdentifier ident = new MethodIdentifier(superClazzMethod);
                    if (!identifiers.containsKey(ident)) {
                        identifiers.put(ident, superClazzMethod);
                    }
                }
            }
        }
        return ImmutableList.copyOf((Collection) identifiers.values());
    }

    private static EventHandler makeHandler(Object listener, Method method) {
        EventHandler wrapper;
        if (methodIsDeclaredThreadSafe(method)) {
            wrapper = new EventHandler(listener, method);
        } else {
            wrapper = new SynchronizedEventHandler(listener, method);
        }
        return wrapper;
    }

    private static boolean methodIsDeclaredThreadSafe(Method method) {
        return method.getAnnotation(AllowConcurrentEvents.class) != null;
    }
}
