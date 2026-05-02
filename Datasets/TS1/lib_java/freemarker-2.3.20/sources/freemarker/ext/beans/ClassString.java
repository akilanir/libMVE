package freemarker.ext.beans;

import java.lang.reflect.Member;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/ClassString.class */
final class ClassString {
    private static final Class BIGDECIMAL_CLASS;
    private static final Class NUMBER_CLASS;
    private final Class[] classes;
    private static final int MORE_SPECIFIC = 0;
    private static final int LESS_SPECIFIC = 1;
    private static final int INDETERMINATE = 2;
    static Class class$java$math$BigDecimal;
    static Class class$java$lang$Number;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Long;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Short;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Character;

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
        if (class$java$math$BigDecimal == null) {
            cls = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls;
        } else {
            cls = class$java$math$BigDecimal;
        }
        BIGDECIMAL_CLASS = cls;
        if (class$java$lang$Number == null) {
            cls2 = class$("java.lang.Number");
            class$java$lang$Number = cls2;
        } else {
            cls2 = class$java$lang$Number;
        }
        NUMBER_CLASS = cls2;
    }

    ClassString(Object[] objects) {
        int l = objects.length;
        this.classes = new Class[l];
        for (int i = 0; i < l; i++) {
            Object obj = objects[i];
            this.classes[i] = obj == null ? MethodUtilities.OBJECT_CLASS : obj.getClass();
        }
    }

    Class[] getClasses() {
        return this.classes;
    }

    public int hashCode() {
        int hash = 0;
        for (int i = 0; i < this.classes.length; i++) {
            hash ^= this.classes[i].hashCode();
        }
        return hash;
    }

    public boolean equals(Object o) {
        if (o instanceof ClassString) {
            ClassString cs = (ClassString) o;
            if (cs.classes.length != this.classes.length) {
                return false;
            }
            for (int i = 0; i < this.classes.length; i++) {
                if (cs.classes[i] != this.classes[i]) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    Object getMostSpecific(List methods, boolean varArg) {
        LinkedList applicables = getApplicables(methods, varArg);
        if (applicables.isEmpty()) {
            return OverloadedMethodsSubset.NO_SUCH_METHOD;
        }
        if (applicables.size() == 1) {
            return applicables.getFirst();
        }
        LinkedList maximals = new LinkedList();
        Iterator it = applicables.iterator();
        while (it.hasNext()) {
            Member applicable = (Member) it.next();
            Class[] appArgs = MethodUtilities.getParameterTypes(applicable);
            boolean lessSpecific = false;
            Iterator maximal = maximals.iterator();
            while (maximal.hasNext()) {
                Member max = (Member) maximal.next();
                Class[] maxArgs = MethodUtilities.getParameterTypes(max);
                switch (moreSpecific(appArgs, maxArgs, varArg)) {
                    case 0:
                        maximal.remove();
                        break;
                    case 1:
                        lessSpecific = true;
                        break;
                }
            }
            if (!lessSpecific) {
                maximals.addLast(applicable);
            }
        }
        if (maximals.size() > 1) {
            return OverloadedMethodsSubset.AMBIGUOUS_METHOD;
        }
        return maximals.getFirst();
    }

    private static int moreSpecific(Class[] c1, Class[] c2, boolean varArg) {
        boolean c1MoreSpecific = false;
        boolean c2MoreSpecific = false;
        int cl1 = c1.length;
        int cl2 = c2.length;
        for (int i = 0; i < cl1; i++) {
            Class class1 = getClass(c1, cl1, i, varArg);
            Class class2 = getClass(c2, cl2, i, varArg);
            if (class1 != class2) {
                c1MoreSpecific = c1MoreSpecific || MethodUtilities.isMoreSpecific(class1, class2);
                c2MoreSpecific = c2MoreSpecific || MethodUtilities.isMoreSpecific(class2, class1);
            }
        }
        if (c1MoreSpecific) {
            if (c2MoreSpecific) {
                return 2;
            }
            return 0;
        }
        if (c2MoreSpecific) {
            return 1;
        }
        return 2;
    }

    private static Class getClass(Class[] classes, int l, int i, boolean varArg) {
        return (!varArg || i < l - 1) ? classes[i] : classes[l - 1].getComponentType();
    }

    LinkedList getApplicables(List methods, boolean varArg) {
        LinkedList list = new LinkedList();
        Iterator it = methods.iterator();
        while (it.hasNext()) {
            Member member = (Member) it.next();
            if (isApplicable(member, varArg)) {
                list.add(member);
            }
        }
        return list;
    }

    private boolean isApplicable(Member member, boolean varArg) {
        Class[] formalTypes = MethodUtilities.getParameterTypes(member);
        int cl = this.classes.length;
        int fl = formalTypes.length - (varArg ? 1 : 0);
        if (varArg) {
            if (cl < fl) {
                return false;
            }
        } else if (cl != fl) {
            return false;
        }
        for (int i = 0; i < fl; i++) {
            if (!isMethodInvocationConvertible(formalTypes[i], this.classes[i])) {
                return false;
            }
        }
        if (varArg) {
            Class varArgType = formalTypes[fl].getComponentType();
            for (int i2 = fl; i2 < cl; i2++) {
                if (!isMethodInvocationConvertible(varArgType, this.classes[i2])) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    static boolean isMethodInvocationConvertible(Class formal, Class actual) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class cls9;
        Class cls10;
        Class cls11;
        Class cls12;
        Class cls13;
        Class cls14;
        Class cls15;
        Class cls16;
        Class cls17;
        Class cls18;
        Class cls19;
        Class cls20;
        Class cls21;
        Class cls22;
        Class cls23;
        if (formal.isAssignableFrom(actual)) {
            return true;
        }
        if (formal.isPrimitive()) {
            if (formal == Boolean.TYPE) {
                if (class$java$lang$Boolean == null) {
                    cls23 = class$("java.lang.Boolean");
                    class$java$lang$Boolean = cls23;
                } else {
                    cls23 = class$java$lang$Boolean;
                }
                return actual == cls23;
            }
            if (formal == Double.TYPE) {
                if (class$java$lang$Double == null) {
                    cls17 = class$("java.lang.Double");
                    class$java$lang$Double = cls17;
                } else {
                    cls17 = class$java$lang$Double;
                }
                if (actual == cls17) {
                    return true;
                }
                if (class$java$lang$Float == null) {
                    cls18 = class$("java.lang.Float");
                    class$java$lang$Float = cls18;
                } else {
                    cls18 = class$java$lang$Float;
                }
                if (actual == cls18) {
                    return true;
                }
                if (class$java$lang$Long == null) {
                    cls19 = class$("java.lang.Long");
                    class$java$lang$Long = cls19;
                } else {
                    cls19 = class$java$lang$Long;
                }
                if (actual == cls19) {
                    return true;
                }
                if (class$java$lang$Integer == null) {
                    cls20 = class$("java.lang.Integer");
                    class$java$lang$Integer = cls20;
                } else {
                    cls20 = class$java$lang$Integer;
                }
                if (actual == cls20) {
                    return true;
                }
                if (class$java$lang$Short == null) {
                    cls21 = class$("java.lang.Short");
                    class$java$lang$Short = cls21;
                } else {
                    cls21 = class$java$lang$Short;
                }
                if (actual == cls21) {
                    return true;
                }
                if (class$java$lang$Byte == null) {
                    cls22 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls22;
                } else {
                    cls22 = class$java$lang$Byte;
                }
                if (actual == cls22) {
                    return true;
                }
            }
            if (formal == Integer.TYPE) {
                if (class$java$lang$Integer == null) {
                    cls14 = class$("java.lang.Integer");
                    class$java$lang$Integer = cls14;
                } else {
                    cls14 = class$java$lang$Integer;
                }
                if (actual == cls14) {
                    return true;
                }
                if (class$java$lang$Short == null) {
                    cls15 = class$("java.lang.Short");
                    class$java$lang$Short = cls15;
                } else {
                    cls15 = class$java$lang$Short;
                }
                if (actual == cls15) {
                    return true;
                }
                if (class$java$lang$Byte == null) {
                    cls16 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls16;
                } else {
                    cls16 = class$java$lang$Byte;
                }
                if (actual == cls16) {
                    return true;
                }
            }
            if (formal == Long.TYPE) {
                if (class$java$lang$Long == null) {
                    cls10 = class$("java.lang.Long");
                    class$java$lang$Long = cls10;
                } else {
                    cls10 = class$java$lang$Long;
                }
                if (actual == cls10) {
                    return true;
                }
                if (class$java$lang$Integer == null) {
                    cls11 = class$("java.lang.Integer");
                    class$java$lang$Integer = cls11;
                } else {
                    cls11 = class$java$lang$Integer;
                }
                if (actual == cls11) {
                    return true;
                }
                if (class$java$lang$Short == null) {
                    cls12 = class$("java.lang.Short");
                    class$java$lang$Short = cls12;
                } else {
                    cls12 = class$java$lang$Short;
                }
                if (actual == cls12) {
                    return true;
                }
                if (class$java$lang$Byte == null) {
                    cls13 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls13;
                } else {
                    cls13 = class$java$lang$Byte;
                }
                if (actual == cls13) {
                    return true;
                }
            }
            if (formal == Float.TYPE) {
                if (class$java$lang$Float == null) {
                    cls5 = class$("java.lang.Float");
                    class$java$lang$Float = cls5;
                } else {
                    cls5 = class$java$lang$Float;
                }
                if (actual == cls5) {
                    return true;
                }
                if (class$java$lang$Long == null) {
                    cls6 = class$("java.lang.Long");
                    class$java$lang$Long = cls6;
                } else {
                    cls6 = class$java$lang$Long;
                }
                if (actual == cls6) {
                    return true;
                }
                if (class$java$lang$Integer == null) {
                    cls7 = class$("java.lang.Integer");
                    class$java$lang$Integer = cls7;
                } else {
                    cls7 = class$java$lang$Integer;
                }
                if (actual == cls7) {
                    return true;
                }
                if (class$java$lang$Short == null) {
                    cls8 = class$("java.lang.Short");
                    class$java$lang$Short = cls8;
                } else {
                    cls8 = class$java$lang$Short;
                }
                if (actual == cls8) {
                    return true;
                }
                if (class$java$lang$Byte == null) {
                    cls9 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls9;
                } else {
                    cls9 = class$java$lang$Byte;
                }
                if (actual == cls9) {
                    return true;
                }
            }
            if (formal == Character.TYPE) {
                if (class$java$lang$Character == null) {
                    cls4 = class$("java.lang.Character");
                    class$java$lang$Character = cls4;
                } else {
                    cls4 = class$java$lang$Character;
                }
                return actual == cls4;
            }
            if (formal == Byte.TYPE) {
                if (class$java$lang$Byte == null) {
                    cls3 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls3;
                } else {
                    cls3 = class$java$lang$Byte;
                }
                if (actual == cls3) {
                    return true;
                }
            }
            if (formal == Short.TYPE) {
                if (class$java$lang$Short == null) {
                    cls = class$("java.lang.Short");
                    class$java$lang$Short = cls;
                } else {
                    cls = class$java$lang$Short;
                }
                if (actual == cls) {
                    return true;
                }
                if (class$java$lang$Byte == null) {
                    cls2 = class$("java.lang.Byte");
                    class$java$lang$Byte = cls2;
                } else {
                    cls2 = class$java$lang$Byte;
                }
                if (actual == cls2) {
                    return true;
                }
            }
            if (BIGDECIMAL_CLASS.isAssignableFrom(actual) && isNumerical(formal)) {
                return true;
            }
            return false;
        }
        return false;
    }

    private static boolean isNumerical(Class type) {
        return NUMBER_CLASS.isAssignableFrom(type) || !(!type.isPrimitive() || type == Boolean.TYPE || type == Character.TYPE);
    }
}
