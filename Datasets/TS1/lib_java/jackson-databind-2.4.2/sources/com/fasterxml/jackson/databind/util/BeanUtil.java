package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/util/BeanUtil.class */
public class BeanUtil {
    public static String okNameForGetter(AnnotatedMethod am) {
        String name = am.getName();
        String str = okNameForIsGetter(am, name);
        if (str == null) {
            str = okNameForRegularGetter(am, name);
        }
        return str;
    }

    public static String okNameForRegularGetter(AnnotatedMethod am, String name) {
        if (name.startsWith("get")) {
            if ("getCallbacks".equals(name)) {
                if (isCglibGetCallbacks(am)) {
                    return null;
                }
            } else if ("getMetaClass".equals(name) && isGroovyMetaClassGetter(am)) {
                return null;
            }
            return manglePropertyName(name.substring(3));
        }
        return null;
    }

    public static String okNameForIsGetter(AnnotatedMethod am, String name) {
        if (name.startsWith("is")) {
            Class<?> rt = am.getRawType();
            if (rt != Boolean.class && rt != Boolean.TYPE) {
                return null;
            }
            return manglePropertyName(name.substring(2));
        }
        return null;
    }

    public static String okNameForSetter(AnnotatedMethod am) {
        String name = okNameForMutator(am, "set");
        if (name != null) {
            if ("metaClass".equals(name) && isGroovyMetaClassSetter(am)) {
                return null;
            }
            return name;
        }
        return null;
    }

    public static String okNameForMutator(AnnotatedMethod am, String prefix) {
        String name = am.getName();
        if (name.startsWith(prefix)) {
            return manglePropertyName(name.substring(prefix.length()));
        }
        return null;
    }

    protected static boolean isCglibGetCallbacks(AnnotatedMethod am) {
        Class<?> rt = am.getRawType();
        if (rt == null || !rt.isArray()) {
            return false;
        }
        Class<?> compType = rt.getComponentType();
        Package pkg = compType.getPackage();
        if (pkg != null) {
            String pname = pkg.getName();
            if (pname.startsWith("net.sf.cglib") || pname.startsWith("org.hibernate.repackage.cglib")) {
                return true;
            }
            return false;
        }
        return false;
    }

    protected static boolean isGroovyMetaClassSetter(AnnotatedMethod am) {
        Class<?> argType = am.getRawParameterType(0);
        Package pkg = argType.getPackage();
        if (pkg != null && pkg.getName().startsWith("groovy.lang")) {
            return true;
        }
        return false;
    }

    protected static boolean isGroovyMetaClassGetter(AnnotatedMethod am) {
        Package pkg;
        Class<?> rt = am.getRawType();
        if (rt != null && !rt.isArray() && (pkg = rt.getPackage()) != null && pkg.getName().startsWith("groovy.lang")) {
            return true;
        }
        return false;
    }

    protected static String manglePropertyName(String basename) {
        char upper;
        char lower;
        int len = basename.length();
        if (len == 0) {
            return null;
        }
        StringBuilder sb = null;
        for (int i = 0; i < len && upper != (lower = Character.toLowerCase((upper = basename.charAt(i)))); i++) {
            if (sb == null) {
                sb = new StringBuilder(basename);
            }
            sb.setCharAt(i, lower);
        }
        return sb == null ? basename : sb.toString();
    }
}
