package freemarker.ext.beans;

import freemarker.template.utility.UndeclaredThrowableException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/MethodUtilities.class */
class MethodUtilities {
    static final Class OBJECT_CLASS;
    private static final Method METHOD_IS_VARARGS;
    private static final Method CONSTRUCTOR_IS_VARARGS;
    static Class class$java$lang$Object;
    static Class class$java$lang$reflect$Method;
    static Class class$java$lang$reflect$Constructor;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Short;
    static Class class$java$lang$Character;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Float;
    static Class class$java$lang$Long;
    static Class class$java$lang$Double;

    MethodUtilities() {
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        Class cls2;
        Class cls3;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        OBJECT_CLASS = cls;
        if (class$java$lang$reflect$Method == null) {
            cls2 = class$("java.lang.reflect.Method");
            class$java$lang$reflect$Method = cls2;
        } else {
            cls2 = class$java$lang$reflect$Method;
        }
        METHOD_IS_VARARGS = getIsVarArgsMethod(cls2);
        if (class$java$lang$reflect$Constructor == null) {
            cls3 = class$("java.lang.reflect.Constructor");
            class$java$lang$reflect$Constructor = cls3;
        } else {
            cls3 = class$java$lang$reflect$Constructor;
        }
        CONSTRUCTOR_IS_VARARGS = getIsVarArgsMethod(cls3);
    }

    static Class getMostSpecificCommonType(Class c1, Class c2) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        if (c1 == c2) {
            return c1;
        }
        if (c2.isPrimitive()) {
            if (c2 == Byte.TYPE) {
                if (class$java$lang$Byte == null) {
                    cls7 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls7;
                } else {
                    cls7 = class$java$lang$Byte;
                }
                c2 = cls7;
            } else if (c2 == Short.TYPE) {
                if (class$java$lang$Short == null) {
                    cls6 = class$("java.lang.Short");
                    class$java$lang$Short = cls6;
                } else {
                    cls6 = class$java$lang$Short;
                }
                c2 = cls6;
            } else if (c2 == Character.TYPE) {
                if (class$java$lang$Character == null) {
                    cls5 = class$("java.lang.Character");
                    class$java$lang$Character = cls5;
                } else {
                    cls5 = class$java$lang$Character;
                }
                c2 = cls5;
            } else if (c2 == Integer.TYPE) {
                if (class$java$lang$Integer == null) {
                    cls4 = class$("java.lang.Integer");
                    class$java$lang$Integer = cls4;
                } else {
                    cls4 = class$java$lang$Integer;
                }
                c2 = cls4;
            } else if (c2 == Float.TYPE) {
                if (class$java$lang$Float == null) {
                    cls3 = class$("java.lang.Float");
                    class$java$lang$Float = cls3;
                } else {
                    cls3 = class$java$lang$Float;
                }
                c2 = cls3;
            } else if (c2 == Long.TYPE) {
                if (class$java$lang$Long == null) {
                    cls2 = class$("java.lang.Long");
                    class$java$lang$Long = cls2;
                } else {
                    cls2 = class$java$lang$Long;
                }
                c2 = cls2;
            } else if (c2 == Double.TYPE) {
                if (class$java$lang$Double == null) {
                    cls = class$("java.lang.Double");
                    class$java$lang$Double = cls;
                } else {
                    cls = class$java$lang$Double;
                }
                c2 = cls;
            }
        }
        Set<Class> a1 = getAssignables(c1, c2);
        Set a2 = getAssignables(c2, c1);
        a1.retainAll(a2);
        if (a1.isEmpty()) {
            if (class$java$lang$Object != null) {
                return class$java$lang$Object;
            }
            Class class$ = class$("java.lang.Object");
            class$java$lang$Object = class$;
            return class$;
        }
        List max = new ArrayList();
        for (Class clazz : a1) {
            Iterator maxiter = max.iterator();
            while (true) {
                if (maxiter.hasNext()) {
                    Class maxClazz = (Class) maxiter.next();
                    if (isMoreSpecific(maxClazz, clazz)) {
                        break;
                    }
                    if (isMoreSpecific(clazz, maxClazz)) {
                        maxiter.remove();
                    }
                } else {
                    max.add(clazz);
                    break;
                }
            }
        }
        if (max.size() > 1) {
            return OBJECT_CLASS;
        }
        return (Class) max.get(0);
    }

    static boolean isMoreSpecific(Class specific, Class generic) {
        if (generic.isAssignableFrom(specific)) {
            return true;
        }
        if (generic.isPrimitive()) {
            if (generic == Short.TYPE && specific == Byte.TYPE) {
                return true;
            }
            if (generic == Integer.TYPE && (specific == Short.TYPE || specific == Byte.TYPE)) {
                return true;
            }
            if (generic == Long.TYPE && (specific == Integer.TYPE || specific == Short.TYPE || specific == Byte.TYPE)) {
                return true;
            }
            if (generic == Float.TYPE && (specific == Long.TYPE || specific == Integer.TYPE || specific == Short.TYPE || specific == Byte.TYPE)) {
                return true;
            }
            if (generic != Double.TYPE) {
                return false;
            }
            if (specific == Float.TYPE || specific == Long.TYPE || specific == Integer.TYPE || specific == Short.TYPE || specific == Byte.TYPE) {
                return true;
            }
            return false;
        }
        return false;
    }

    private static Set getAssignables(Class c1, Class c2) {
        Set s = new HashSet();
        collectAssignables(c1, c2, s);
        return s;
    }

    private static void collectAssignables(Class c1, Class c2, Set s) {
        if (c1.isAssignableFrom(c2)) {
            s.add(c1);
        }
        Class sc = c1.getSuperclass();
        if (sc != null) {
            collectAssignables(sc, c2, s);
        }
        Class[] itf = c1.getInterfaces();
        for (Class cls : itf) {
            collectAssignables(cls, c2, s);
        }
    }

    static Class[] getParameterTypes(Member member) {
        if (member instanceof Method) {
            return ((Method) member).getParameterTypes();
        }
        if (member instanceof Constructor) {
            return ((Constructor) member).getParameterTypes();
        }
        throw new RuntimeException();
    }

    static boolean isVarArgs(Member member) {
        if (member instanceof Method) {
            return isVarArgs(member, METHOD_IS_VARARGS);
        }
        if (member instanceof Constructor) {
            return isVarArgs(member, CONSTRUCTOR_IS_VARARGS);
        }
        throw new RuntimeException();
    }

    private static boolean isVarArgs(Member member, Method isVarArgsMethod) {
        if (isVarArgsMethod == null) {
            return false;
        }
        try {
            return ((Boolean) isVarArgsMethod.invoke(member, (Object[]) null)).booleanValue();
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception e2) {
            throw new UndeclaredThrowableException(e2);
        }
    }

    private static Method getIsVarArgsMethod(Class memberClass) {
        try {
            return memberClass.getMethod("isVarArgs", (Class[]) null);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }
}
