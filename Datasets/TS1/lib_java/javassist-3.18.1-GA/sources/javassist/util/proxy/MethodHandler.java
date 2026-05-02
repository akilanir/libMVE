package javassist.util.proxy;

import java.lang.reflect.Method;

/* loaded from: javassist-3.18.1-GA.jar:javassist/util/proxy/MethodHandler.class */
public interface MethodHandler {
    Object invoke(Object obj, Method method, Method method2, Object[] objArr) throws Throwable;
}
