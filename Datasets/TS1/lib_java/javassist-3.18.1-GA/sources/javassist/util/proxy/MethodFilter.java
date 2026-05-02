package javassist.util.proxy;

import java.lang.reflect.Method;

/* loaded from: javassist-3.18.1-GA.jar:javassist/util/proxy/MethodFilter.class */
public interface MethodFilter {
    boolean isHandled(Method method);
}
