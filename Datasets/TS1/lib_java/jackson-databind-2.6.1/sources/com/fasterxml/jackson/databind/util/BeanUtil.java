package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/util/BeanUtil.class */
public class BeanUtil {
    public static String okNameForGetter(AnnotatedMethod am, boolean stdNaming) {
        String name = am.getName();
        String str = okNameForIsGetter(am, name, stdNaming);
        if (str == null) {
            str = okNameForRegularGetter(am, name, stdNaming);
        }
        return str;
    }

    public static String okNameForRegularGetter(AnnotatedMethod am, String name, boolean stdNaming) {
        if (name.startsWith("get")) {
            if ("getCallbacks".equals(name)) {
                if (isCglibGetCallbacks(am)) {
                    return null;
                }
            } else if ("getMetaClass".equals(name) && isGroovyMetaClassGetter(am)) {
                return null;
            }
            return stdNaming ? stdManglePropertyName(name, 3) : legacyManglePropertyName(name, 3);
        }
        return null;
    }

    public static String okNameForIsGetter(AnnotatedMethod am, String name, boolean stdNaming) {
        if (name.startsWith("is")) {
            Class<?> rt = am.getRawType();
            if (rt == Boolean.class || rt == Boolean.TYPE) {
                return stdNaming ? stdManglePropertyName(name, 2) : legacyManglePropertyName(name, 2);
            }
            return null;
        }
        return null;
    }

    public static String okNameForSetter(AnnotatedMethod am, boolean stdNaming) {
        String name = okNameForMutator(am, "set", stdNaming);
        if (name == null) {
            return null;
        }
        if (!"metaClass".equals(name) || !isGroovyMetaClassSetter(am)) {
            return name;
        }
        return null;
    }

    public static String okNameForMutator(AnnotatedMethod am, String prefix, boolean stdNaming) {
        String name = am.getName();
        if (name.startsWith(prefix)) {
            return stdNaming ? stdManglePropertyName(name, prefix.length()) : legacyManglePropertyName(name, prefix.length());
        }
        return null;
    }

    @Deprecated
    public static String okNameForGetter(AnnotatedMethod am) {
        return okNameForGetter(am, false);
    }

    @Deprecated
    public static String okNameForRegularGetter(AnnotatedMethod am, String name) {
        return okNameForRegularGetter(am, name, false);
    }

    @Deprecated
    public static String okNameForIsGetter(AnnotatedMethod am, String name) {
        return okNameForIsGetter(am, name, false);
    }

    @Deprecated
    public static String okNameForSetter(AnnotatedMethod am) {
        return okNameForSetter(am, false);
    }

    @Deprecated
    public static String okNameForMutator(AnnotatedMethod am, String prefix) {
        return okNameForMutator(am, prefix, false);
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
            if (pname.contains(".cglib")) {
                if (pname.startsWith("net.sf.cglib") || pname.startsWith("org.hibernate.repackage.cglib") || pname.startsWith("org.springframework.cglib")) {
                    return true;
                }
                return false;
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

    protected static String legacyManglePropertyName(String basename, int offset) {
        char upper;
        char lower;
        int end = basename.length();
        if (end == offset) {
            return null;
        }
        StringBuilder sb = null;
        for (int i = offset; i < end && upper != (lower = Character.toLowerCase((upper = basename.charAt(i)))); i++) {
            if (sb == null) {
                int l = end - offset;
                sb = new StringBuilder(l);
                sb.append((CharSequence) basename, offset, end);
            }
            sb.setCharAt(i - offset, lower);
        }
        return sb == null ? basename.substring(offset) : sb.toString();
    }

    protected static String stdManglePropertyName(String basename, int offset) {
        int end = basename.length();
        if (end == offset) {
            return null;
        }
        char c0 = basename.charAt(offset);
        char c1 = Character.toLowerCase(c0);
        if (c0 == c1) {
            return basename.substring(offset);
        }
        if (offset + 1 < end && Character.isUpperCase(basename.charAt(offset + 1))) {
            return basename.substring(offset);
        }
        StringBuilder sb = new StringBuilder(end - offset);
        sb.append(c1);
        sb.append((CharSequence) basename, offset + 1, end);
        return sb.toString();
    }
}
