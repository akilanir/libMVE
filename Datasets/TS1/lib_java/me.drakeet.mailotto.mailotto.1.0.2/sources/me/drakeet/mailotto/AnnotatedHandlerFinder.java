package me.drakeet.mailotto;

import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/AnnotatedHandlerFinder.class */
final class AnnotatedHandlerFinder {
    private static final ConcurrentMap<Class<?>, Method> SUBSCRIBER_CACHE = new ConcurrentHashMap();

    private AnnotatedHandlerFinder() {
    }

    private static Method loadAnnotatedMethod(Class<?> listenerClass) {
        for (Method method : listenerClass.getDeclaredMethods()) {
            if (!method.isBridge() && method.isAnnotationPresent(OnMailReceived.class)) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length != 1) {
                    throw new IllegalArgumentException("Method " + method + " has @OnMailReceived annotation but requires " + parameterTypes.length + " arguments.  Methods must require a single argument.");
                }
                Class<?> mailType = parameterTypes[0];
                if (mailType.isInterface()) {
                    throw new IllegalArgumentException("Method " + method + " has @OnMailReceived annotation on " + mailType + " which is an interface.  Subscription must be on a concrete class type.");
                }
                if ((method.getModifiers() & 1) == 0) {
                    throw new IllegalArgumentException("Method " + method + " has @OnMailReceived annotation on " + mailType + " but is not 'public'.");
                }
                return method;
            }
        }
        return null;
    }

    static MailHandler findOnMailReceived(Object listener) {
        Class<?> listenerClass = listener.getClass();
        Method method = SUBSCRIBER_CACHE.get(listenerClass);
        if (method == null) {
            method = loadAnnotatedMethod(listenerClass);
            if (method == null) {
                throw new IllegalStateException("You must set a @OnMailReceived method for handle mail.");
            }
            SUBSCRIBER_CACHE.put(listenerClass, method);
        }
        return new MailHandler(listener, method);
    }
}
