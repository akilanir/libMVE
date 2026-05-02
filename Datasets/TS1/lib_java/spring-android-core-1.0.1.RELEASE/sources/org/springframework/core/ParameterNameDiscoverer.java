package org.springframework.core;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/ParameterNameDiscoverer.class */
public interface ParameterNameDiscoverer {
    String[] getParameterNames(Method method);

    String[] getParameterNames(Constructor<?> constructor);
}
