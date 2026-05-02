package org.apache.commons.beanutils;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/MethodUtils.class */
public class MethodUtils {
    private static boolean loggedAccessibleWarning = false;
    private static boolean CACHE_METHODS = true;
    private static final Class[] EMPTY_CLASS_PARAMETERS = new Class[0];
    private static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];
    private static final Map cache = Collections.synchronizedMap(new WeakHashMap());
    static Class class$org$apache$commons$beanutils$MethodUtils;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Float;
    static Class class$java$lang$Long;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Short;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Double;
    static Class class$java$lang$Character;

    public static synchronized void setCacheMethods(boolean cacheMethods) {
        CACHE_METHODS = cacheMethods;
        if (!CACHE_METHODS) {
            clearCache();
        }
    }

    public static synchronized int clearCache() {
        int size = cache.size();
        cache.clear();
        return size;
    }

    public static Object invokeMethod(Object object, String methodName, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Object[] args = {arg};
        return invokeMethod(object, methodName, args);
    }

    public static Object invokeMethod(Object object, String methodName, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeMethod(object, methodName, args, parameterTypes);
    }

    public static Object invokeMethod(Object object, String methodName, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        Method method = getMatchingAccessibleMethod(object.getClass(), methodName, parameterTypes);
        if (method == null) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible method: ").append(methodName).append("() on object: ").append(object.getClass().getName()).toString());
        }
        return method.invoke(object, args);
    }

    public static Object invokeExactMethod(Object object, String methodName, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Object[] args = {arg};
        return invokeExactMethod(object, methodName, args);
    }

    public static Object invokeExactMethod(Object object, String methodName, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeExactMethod(object, methodName, args, parameterTypes);
    }

    public static Object invokeExactMethod(Object object, String methodName, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        Method method = getAccessibleMethod(object.getClass(), methodName, parameterTypes);
        if (method == null) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible method: ").append(methodName).append("() on object: ").append(object.getClass().getName()).toString());
        }
        return method.invoke(object, args);
    }

    public static Object invokeExactStaticMethod(Class objectClass, String methodName, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        Method method = getAccessibleMethod(objectClass, methodName, parameterTypes);
        if (method == null) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible method: ").append(methodName).append("() on class: ").append(objectClass.getName()).toString());
        }
        return method.invoke(null, args);
    }

    public static Object invokeStaticMethod(Class objectClass, String methodName, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Object[] args = {arg};
        return invokeStaticMethod(objectClass, methodName, args);
    }

    public static Object invokeStaticMethod(Class objectClass, String methodName, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeStaticMethod(objectClass, methodName, args, parameterTypes);
    }

    public static Object invokeStaticMethod(Class objectClass, String methodName, Object[] args, Class[] parameterTypes) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (parameterTypes == null) {
            parameterTypes = EMPTY_CLASS_PARAMETERS;
        }
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        Method method = getMatchingAccessibleMethod(objectClass, methodName, parameterTypes);
        if (method == null) {
            throw new NoSuchMethodException(new StringBuffer().append("No such accessible method: ").append(methodName).append("() on class: ").append(objectClass.getName()).toString());
        }
        return method.invoke(null, args);
    }

    public static Object invokeExactStaticMethod(Class objectClass, String methodName, Object arg) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Object[] args = {arg};
        return invokeExactStaticMethod(objectClass, methodName, args);
    }

    public static Object invokeExactStaticMethod(Class objectClass, String methodName, Object[] args) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (args == null) {
            args = EMPTY_OBJECT_ARRAY;
        }
        int arguments = args.length;
        Class[] parameterTypes = new Class[arguments];
        for (int i = 0; i < arguments; i++) {
            parameterTypes[i] = args[i].getClass();
        }
        return invokeExactStaticMethod(objectClass, methodName, args, parameterTypes);
    }

    public static Method getAccessibleMethod(Class clazz, String methodName, Class parameterType) {
        Class[] parameterTypes = {parameterType};
        return getAccessibleMethod(clazz, methodName, parameterTypes);
    }

    public static Method getAccessibleMethod(Class clazz, String methodName, Class[] parameterTypes) {
        try {
            MethodDescriptor md = new MethodDescriptor(clazz, methodName, parameterTypes, true);
            Method method = getCachedMethod(md);
            if (method != null) {
                return method;
            }
            Method method2 = getAccessibleMethod(clazz, clazz.getMethod(methodName, parameterTypes));
            cacheMethod(md, method2);
            return method2;
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static Method getAccessibleMethod(Method method) {
        if (method == null) {
            return null;
        }
        return getAccessibleMethod(method.getDeclaringClass(), method);
    }

    public static Method getAccessibleMethod(Class clazz, Method method) {
        if (method == null || !Modifier.isPublic(method.getModifiers())) {
            return null;
        }
        boolean sameClass = true;
        if (clazz == null) {
            clazz = method.getDeclaringClass();
        } else {
            sameClass = clazz.equals(method.getDeclaringClass());
            if (!method.getDeclaringClass().isAssignableFrom(clazz)) {
                throw new IllegalArgumentException(new StringBuffer().append(clazz.getName()).append(" is not assignable from ").append(method.getDeclaringClass().getName()).toString());
            }
        }
        if (Modifier.isPublic(clazz.getModifiers())) {
            if (!sameClass && !Modifier.isPublic(method.getDeclaringClass().getModifiers())) {
                setMethodAccessible(method);
            }
            return method;
        }
        String methodName = method.getName();
        Class[] parameterTypes = method.getParameterTypes();
        Method method2 = getAccessibleMethodFromInterfaceNest(clazz, methodName, parameterTypes);
        if (method2 == null) {
            method2 = getAccessibleMethodFromSuperclass(clazz, methodName, parameterTypes);
        }
        return method2;
    }

    private static Method getAccessibleMethodFromSuperclass(Class clazz, String methodName, Class[] parameterTypes) {
        Class superclass = clazz.getSuperclass();
        while (true) {
            Class parentClazz = superclass;
            if (parentClazz != null) {
                if (Modifier.isPublic(parentClazz.getModifiers())) {
                    try {
                        return parentClazz.getMethod(methodName, parameterTypes);
                    } catch (NoSuchMethodException e) {
                        return null;
                    }
                }
                superclass = parentClazz.getSuperclass();
            } else {
                return null;
            }
        }
    }

    private static Method getAccessibleMethodFromInterfaceNest(Class clazz, String methodName, Class[] parameterTypes) {
        Method method = null;
        while (clazz != null) {
            Class[] interfaces = clazz.getInterfaces();
            for (int i = 0; i < interfaces.length; i++) {
                if (Modifier.isPublic(interfaces[i].getModifiers())) {
                    try {
                        method = interfaces[i].getDeclaredMethod(methodName, parameterTypes);
                    } catch (NoSuchMethodException e) {
                    }
                    if (method != null) {
                        return method;
                    }
                    method = getAccessibleMethodFromInterfaceNest(interfaces[i], methodName, parameterTypes);
                    if (method != null) {
                        return method;
                    }
                }
            }
            clazz = clazz.getSuperclass();
        }
        return null;
    }

    public static Method getMatchingAccessibleMethod(Class clazz, String methodName, Class[] parameterTypes) {
        Class cls;
        if (class$org$apache$commons$beanutils$MethodUtils == null) {
            cls = class$("org.apache.commons.beanutils.MethodUtils");
            class$org$apache$commons$beanutils$MethodUtils = cls;
        } else {
            cls = class$org$apache$commons$beanutils$MethodUtils;
        }
        Log log = LogFactory.getLog(cls);
        if (log.isTraceEnabled()) {
            log.trace(new StringBuffer().append("Matching name=").append(methodName).append(" on ").append(clazz).toString());
        }
        MethodDescriptor md = new MethodDescriptor(clazz, methodName, parameterTypes, false);
        try {
            Method method = getCachedMethod(md);
            if (method != null) {
                return method;
            }
            Method method2 = clazz.getMethod(methodName, parameterTypes);
            if (log.isTraceEnabled()) {
                log.trace(new StringBuffer().append("Found straight match: ").append(method2).toString());
                log.trace(new StringBuffer().append("isPublic:").append(Modifier.isPublic(method2.getModifiers())).toString());
            }
            setMethodAccessible(method2);
            cacheMethod(md, method2);
            return method2;
        } catch (NoSuchMethodException e) {
            int paramSize = parameterTypes.length;
            Method bestMatch = null;
            Method[] methods = clazz.getMethods();
            float bestMatchCost = Float.MAX_VALUE;
            int size = methods.length;
            for (int i = 0; i < size; i++) {
                if (methods[i].getName().equals(methodName)) {
                    if (log.isTraceEnabled()) {
                        log.trace("Found matching name:");
                        log.trace(methods[i]);
                    }
                    Class[] methodsParams = methods[i].getParameterTypes();
                    int methodParamSize = methodsParams.length;
                    if (methodParamSize == paramSize) {
                        boolean match = true;
                        int n = 0;
                        while (true) {
                            if (n >= methodParamSize) {
                                break;
                            }
                            if (log.isTraceEnabled()) {
                                log.trace(new StringBuffer().append("Param=").append(parameterTypes[n].getName()).toString());
                                log.trace(new StringBuffer().append("Method=").append(methodsParams[n].getName()).toString());
                            }
                            if (isAssignmentCompatible(methodsParams[n], parameterTypes[n])) {
                                n++;
                            } else {
                                if (log.isTraceEnabled()) {
                                    log.trace(new StringBuffer().append(methodsParams[n]).append(" is not assignable from ").append(parameterTypes[n]).toString());
                                }
                                match = false;
                            }
                        }
                        if (match) {
                            Method method3 = getAccessibleMethod(clazz, methods[i]);
                            if (method3 != null) {
                                if (log.isTraceEnabled()) {
                                    log.trace(new StringBuffer().append(method3).append(" accessible version of ").append(methods[i]).toString());
                                }
                                setMethodAccessible(method3);
                                float myCost = getTotalTransformationCost(parameterTypes, method3.getParameterTypes());
                                if (myCost < bestMatchCost) {
                                    bestMatch = method3;
                                    bestMatchCost = myCost;
                                }
                            }
                            log.trace("Couldn't find accessible method.");
                        }
                    }
                }
            }
            if (bestMatch != null) {
                cacheMethod(md, bestMatch);
            } else {
                log.trace("No match found.");
            }
            return bestMatch;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x006f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void setMethodAccessible(java.lang.reflect.Method r4) {
        /*
            r0 = r4
            boolean r0 = r0.isAccessible()     // Catch: java.lang.SecurityException -> Lf
            if (r0 != 0) goto Lc
            r0 = r4
            r1 = 1
            r0.setAccessible(r1)     // Catch: java.lang.SecurityException -> Lf
        Lc:
            goto L91
        Lf:
            r5 = move-exception
            java.lang.Class r0 = org.apache.commons.beanutils.MethodUtils.class$org$apache$commons$beanutils$MethodUtils
            if (r0 != 0) goto L22
            java.lang.String r0 = "org.apache.commons.beanutils.MethodUtils"
            java.lang.Class r0 = class$(r0)
            r1 = r0
            org.apache.commons.beanutils.MethodUtils.class$org$apache$commons$beanutils$MethodUtils = r1
            goto L25
        L22:
            java.lang.Class r0 = org.apache.commons.beanutils.MethodUtils.class$org$apache$commons$beanutils$MethodUtils
        L25:
            org.apache.commons.logging.Log r0 = org.apache.commons.logging.LogFactory.getLog(r0)
            r6 = r0
            boolean r0 = org.apache.commons.beanutils.MethodUtils.loggedAccessibleWarning
            if (r0 != 0) goto L88
            r0 = 0
            r7 = r0
            java.lang.String r0 = "java.specification.version"
            java.lang.String r0 = java.lang.System.getProperty(r0)     // Catch: java.lang.SecurityException -> L74
            r8 = r0
            r0 = r8
            r1 = 0
            char r0 = r0.charAt(r1)     // Catch: java.lang.SecurityException -> L74
            r1 = 49
            if (r0 != r1) goto L71
            r0 = r8
            r1 = 2
            char r0 = r0.charAt(r1)     // Catch: java.lang.SecurityException -> L74
            r1 = 48
            if (r0 == r1) goto L6f
            r0 = r8
            r1 = 2
            char r0 = r0.charAt(r1)     // Catch: java.lang.SecurityException -> L74
            r1 = 49
            if (r0 == r1) goto L6f
            r0 = r8
            r1 = 2
            char r0 = r0.charAt(r1)     // Catch: java.lang.SecurityException -> L74
            r1 = 50
            if (r0 == r1) goto L6f
            r0 = r8
            r1 = 2
            char r0 = r0.charAt(r1)     // Catch: java.lang.SecurityException -> L74
            r1 = 51
            if (r0 != r1) goto L71
        L6f:
            r0 = 1
            r7 = r0
        L71:
            goto L78
        L74:
            r8 = move-exception
            r0 = 1
            r7 = r0
        L78:
            r0 = r7
            if (r0 == 0) goto L84
            r0 = r6
            java.lang.String r1 = "Current Security Manager restricts use of workarounds for reflection bugs  in pre-1.4 JVMs."
            r0.warn(r1)
        L84:
            r0 = 1
            org.apache.commons.beanutils.MethodUtils.loggedAccessibleWarning = r0
        L88:
            r0 = r6
            java.lang.String r1 = "Cannot setAccessible on method. Therefore cannot use jvm access bug workaround."
            r2 = r5
            r0.debug(r1, r2)
        L91:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.beanutils.MethodUtils.setMethodAccessible(java.lang.reflect.Method):void");
    }

    private static float getTotalTransformationCost(Class[] srcArgs, Class[] destArgs) {
        float totalCost = 0.0f;
        for (int i = 0; i < srcArgs.length; i++) {
            Class srcClass = srcArgs[i];
            Class destClass = destArgs[i];
            totalCost += getObjectTransformationCost(srcClass, destClass);
        }
        return totalCost;
    }

    private static float getObjectTransformationCost(Class srcClass, Class destClass) {
        float cost = 0.0f;
        while (true) {
            if (destClass != null && !destClass.equals(srcClass)) {
                if (destClass.isInterface() && isAssignmentCompatible(destClass, srcClass)) {
                    cost += 0.25f;
                    break;
                }
                cost += 1.0f;
                destClass = destClass.getSuperclass();
            } else {
                break;
            }
        }
        if (destClass == null) {
            cost += 1.5f;
        }
        return cost;
    }

    public static final boolean isAssignmentCompatible(Class parameterType, Class parameterization) {
        Class parameterWrapperClazz;
        if (parameterType.isAssignableFrom(parameterization)) {
            return true;
        }
        if (parameterType.isPrimitive() && (parameterWrapperClazz = getPrimitiveWrapper(parameterType)) != null) {
            return parameterWrapperClazz.equals(parameterization);
        }
        return false;
    }

    public static Class getPrimitiveWrapper(Class primitiveType) {
        if (Boolean.TYPE.equals(primitiveType)) {
            if (class$java$lang$Boolean != null) {
                return class$java$lang$Boolean;
            }
            Class class$ = class$("java.lang.Boolean");
            class$java$lang$Boolean = class$;
            return class$;
        }
        if (Float.TYPE.equals(primitiveType)) {
            if (class$java$lang$Float != null) {
                return class$java$lang$Float;
            }
            Class class$2 = class$("java.lang.Float");
            class$java$lang$Float = class$2;
            return class$2;
        }
        if (Long.TYPE.equals(primitiveType)) {
            if (class$java$lang$Long != null) {
                return class$java$lang$Long;
            }
            Class class$3 = class$("java.lang.Long");
            class$java$lang$Long = class$3;
            return class$3;
        }
        if (Integer.TYPE.equals(primitiveType)) {
            if (class$java$lang$Integer != null) {
                return class$java$lang$Integer;
            }
            Class class$4 = class$("java.lang.Integer");
            class$java$lang$Integer = class$4;
            return class$4;
        }
        if (Short.TYPE.equals(primitiveType)) {
            if (class$java$lang$Short != null) {
                return class$java$lang$Short;
            }
            Class class$5 = class$("java.lang.Short");
            class$java$lang$Short = class$5;
            return class$5;
        }
        if (Byte.TYPE.equals(primitiveType)) {
            if (class$java$lang$Byte != null) {
                return class$java$lang$Byte;
            }
            Class class$6 = class$("java.lang.Byte");
            class$java$lang$Byte = class$6;
            return class$6;
        }
        if (Double.TYPE.equals(primitiveType)) {
            if (class$java$lang$Double != null) {
                return class$java$lang$Double;
            }
            Class class$7 = class$("java.lang.Double");
            class$java$lang$Double = class$7;
            return class$7;
        }
        if (Character.TYPE.equals(primitiveType)) {
            if (class$java$lang$Character != null) {
                return class$java$lang$Character;
            }
            Class class$8 = class$("java.lang.Character");
            class$java$lang$Character = class$8;
            return class$8;
        }
        return null;
    }

    public static Class getPrimitiveType(Class wrapperType) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class cls9;
        if (class$java$lang$Boolean == null) {
            cls = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls;
        } else {
            cls = class$java$lang$Boolean;
        }
        if (cls.equals(wrapperType)) {
            return Boolean.TYPE;
        }
        if (class$java$lang$Float == null) {
            cls2 = class$("java.lang.Float");
            class$java$lang$Float = cls2;
        } else {
            cls2 = class$java$lang$Float;
        }
        if (cls2.equals(wrapperType)) {
            return Float.TYPE;
        }
        if (class$java$lang$Long == null) {
            cls3 = class$("java.lang.Long");
            class$java$lang$Long = cls3;
        } else {
            cls3 = class$java$lang$Long;
        }
        if (cls3.equals(wrapperType)) {
            return Long.TYPE;
        }
        if (class$java$lang$Integer == null) {
            cls4 = class$("java.lang.Integer");
            class$java$lang$Integer = cls4;
        } else {
            cls4 = class$java$lang$Integer;
        }
        if (cls4.equals(wrapperType)) {
            return Integer.TYPE;
        }
        if (class$java$lang$Short == null) {
            cls5 = class$("java.lang.Short");
            class$java$lang$Short = cls5;
        } else {
            cls5 = class$java$lang$Short;
        }
        if (cls5.equals(wrapperType)) {
            return Short.TYPE;
        }
        if (class$java$lang$Byte == null) {
            cls6 = class$("java.lang.Byte");
            class$java$lang$Byte = cls6;
        } else {
            cls6 = class$java$lang$Byte;
        }
        if (cls6.equals(wrapperType)) {
            return Byte.TYPE;
        }
        if (class$java$lang$Double == null) {
            cls7 = class$("java.lang.Double");
            class$java$lang$Double = cls7;
        } else {
            cls7 = class$java$lang$Double;
        }
        if (cls7.equals(wrapperType)) {
            return Double.TYPE;
        }
        if (class$java$lang$Character == null) {
            cls8 = class$("java.lang.Character");
            class$java$lang$Character = cls8;
        } else {
            cls8 = class$java$lang$Character;
        }
        if (cls8.equals(wrapperType)) {
            return Character.TYPE;
        }
        if (class$org$apache$commons$beanutils$MethodUtils == null) {
            cls9 = class$("org.apache.commons.beanutils.MethodUtils");
            class$org$apache$commons$beanutils$MethodUtils = cls9;
        } else {
            cls9 = class$org$apache$commons$beanutils$MethodUtils;
        }
        Log log = LogFactory.getLog(cls9);
        if (log.isDebugEnabled()) {
            log.debug(new StringBuffer().append("Not a known primitive wrapper class: ").append(wrapperType).toString());
            return null;
        }
        return null;
    }

    public static Class toNonPrimitiveClass(Class clazz) {
        if (clazz.isPrimitive()) {
            Class primitiveClazz = getPrimitiveWrapper(clazz);
            if (primitiveClazz != null) {
                return primitiveClazz;
            }
            return clazz;
        }
        return clazz;
    }

    private static Method getCachedMethod(MethodDescriptor md) {
        Reference methodRef;
        if (CACHE_METHODS && (methodRef = (Reference) cache.get(md)) != null) {
            return (Method) methodRef.get();
        }
        return null;
    }

    private static void cacheMethod(MethodDescriptor md, Method method) {
        if (CACHE_METHODS && method != null) {
            cache.put(md, new WeakReference(method));
        }
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/MethodUtils$MethodDescriptor.class */
    private static class MethodDescriptor {
        private Class cls;
        private String methodName;
        private Class[] paramTypes;
        private boolean exact;
        private int hashCode;

        public MethodDescriptor(Class cls, String methodName, Class[] paramTypes, boolean exact) {
            if (cls == null) {
                throw new IllegalArgumentException("Class cannot be null");
            }
            if (methodName != null) {
                paramTypes = paramTypes == null ? MethodUtils.EMPTY_CLASS_PARAMETERS : paramTypes;
                this.cls = cls;
                this.methodName = methodName;
                this.paramTypes = paramTypes;
                this.exact = exact;
                this.hashCode = methodName.length();
                return;
            }
            throw new IllegalArgumentException("Method Name cannot be null");
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof MethodDescriptor)) {
                return false;
            }
            MethodDescriptor md = (MethodDescriptor) obj;
            return this.exact == md.exact && this.methodName.equals(md.methodName) && this.cls.equals(md.cls) && Arrays.equals(this.paramTypes, md.paramTypes);
        }

        public int hashCode() {
            return this.hashCode;
        }
    }
}
