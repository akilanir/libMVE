package freemarker.template.utility;

import freemarker.core.Macro;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.beans.BooleanModel;
import freemarker.ext.beans.CollectionModel;
import freemarker.ext.beans.DateModel;
import freemarker.ext.beans.EnumerationModel;
import freemarker.ext.beans.IteratorModel;
import freemarker.ext.beans.MapModel;
import freemarker.ext.beans.NumberModel;
import freemarker.ext.beans.OverloadedMethodsModel;
import freemarker.ext.beans.SimpleMethodModel;
import freemarker.ext.beans.StringModel;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import java.util.HashSet;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/ClassUtil.class */
public class ClassUtil {
    static Class class$freemarker$template$TemplateSequenceModel;
    static Class class$freemarker$template$TemplateCollectionModel;
    static Class class$freemarker$template$TemplateHashModelEx;
    static Class class$freemarker$template$TemplateNumberModel;
    static Class class$freemarker$template$TemplateBooleanModel;
    static Class class$freemarker$template$TemplateDateModel;
    static Class class$freemarker$template$TemplateMethodModelEx;
    static Class class$freemarker$template$TemplateScalarModel;
    static Class class$freemarker$template$TemplateNodeModel;
    static Class class$freemarker$template$TemplateDirectiveModel;
    static Class class$freemarker$template$TemplateTransformModel;
    static Class class$freemarker$template$TemplateModelIterator;
    static Class class$freemarker$template$TemplateMethodModel;
    static Class class$freemarker$core$Environment$Namespace;
    static Class class$freemarker$template$TemplateHashModel;
    static Class class$java$lang$Object;

    private ClassUtil() {
    }

    public static Class forName(String className) throws ClassNotFoundException {
        try {
            return Class.forName(className, true, Thread.currentThread().getContextClassLoader());
        } catch (ClassNotFoundException | SecurityException e) {
            return Class.forName(className);
        }
    }

    public static String getShortClassName(Class pClass) {
        return getShortClassName(pClass, false);
    }

    public static String getShortClassName(Class pClass, boolean shortenFreeMarkerClasses) {
        if (pClass == null) {
            return null;
        }
        if (pClass.isArray()) {
            return new StringBuffer().append(getShortClassName(pClass.getComponentType())).append("[]").toString();
        }
        String cn = pClass.getName();
        if (cn.startsWith("java.lang.") || cn.startsWith("java.util.")) {
            return cn.substring(10);
        }
        if (shortenFreeMarkerClasses) {
            if (cn.startsWith("freemarker.template.")) {
                return new StringBuffer().append("f.t").append(cn.substring(19)).toString();
            }
            if (cn.startsWith("freemarker.ext.beans.")) {
                return new StringBuffer().append("f.e.b").append(cn.substring(20)).toString();
            }
            if (cn.startsWith("freemarker.core.")) {
                return new StringBuffer().append("f.c").append(cn.substring(15)).toString();
            }
            if (cn.startsWith("freemarker.ext.")) {
                return new StringBuffer().append("f.e").append(cn.substring(14)).toString();
            }
            if (cn.startsWith("freemarker.")) {
                return new StringBuffer().append("f").append(cn.substring(10)).toString();
            }
        }
        return cn;
    }

    public static String getShortClassNameOfObject(Object obj) {
        return getShortClassNameOfObject(obj, false);
    }

    public static String getShortClassNameOfObject(Object obj, boolean shortenFreeMarkerClasses) {
        if (obj == null) {
            return "Null";
        }
        return getShortClassName(obj.getClass(), shortenFreeMarkerClasses);
    }

    private static Class getPrimaryTemplateModelInterface(TemplateModel tm) {
        if (tm instanceof BeanModel) {
            if (tm instanceof CollectionModel) {
                if (class$freemarker$template$TemplateSequenceModel != null) {
                    return class$freemarker$template$TemplateSequenceModel;
                }
                Class class$ = class$("freemarker.template.TemplateSequenceModel");
                class$freemarker$template$TemplateSequenceModel = class$;
                return class$;
            }
            if ((tm instanceof IteratorModel) || (tm instanceof EnumerationModel)) {
                if (class$freemarker$template$TemplateCollectionModel != null) {
                    return class$freemarker$template$TemplateCollectionModel;
                }
                Class class$2 = class$("freemarker.template.TemplateCollectionModel");
                class$freemarker$template$TemplateCollectionModel = class$2;
                return class$2;
            }
            if (tm instanceof MapModel) {
                if (class$freemarker$template$TemplateHashModelEx != null) {
                    return class$freemarker$template$TemplateHashModelEx;
                }
                Class class$3 = class$("freemarker.template.TemplateHashModelEx");
                class$freemarker$template$TemplateHashModelEx = class$3;
                return class$3;
            }
            if (tm instanceof NumberModel) {
                if (class$freemarker$template$TemplateNumberModel != null) {
                    return class$freemarker$template$TemplateNumberModel;
                }
                Class class$4 = class$("freemarker.template.TemplateNumberModel");
                class$freemarker$template$TemplateNumberModel = class$4;
                return class$4;
            }
            if (tm instanceof BooleanModel) {
                if (class$freemarker$template$TemplateBooleanModel != null) {
                    return class$freemarker$template$TemplateBooleanModel;
                }
                Class class$5 = class$("freemarker.template.TemplateBooleanModel");
                class$freemarker$template$TemplateBooleanModel = class$5;
                return class$5;
            }
            if (tm instanceof DateModel) {
                if (class$freemarker$template$TemplateDateModel != null) {
                    return class$freemarker$template$TemplateDateModel;
                }
                Class class$6 = class$("freemarker.template.TemplateDateModel");
                class$freemarker$template$TemplateDateModel = class$6;
                return class$6;
            }
            if ((tm instanceof SimpleMethodModel) || (tm instanceof OverloadedMethodsModel)) {
                if (class$freemarker$template$TemplateMethodModelEx != null) {
                    return class$freemarker$template$TemplateMethodModelEx;
                }
                Class class$7 = class$("freemarker.template.TemplateMethodModelEx");
                class$freemarker$template$TemplateMethodModelEx = class$7;
                return class$7;
            }
            if (tm instanceof StringModel) {
                Object wrapped = ((BeanModel) tm).getWrappedObject();
                if (wrapped instanceof String) {
                    if (class$freemarker$template$TemplateScalarModel != null) {
                        return class$freemarker$template$TemplateScalarModel;
                    }
                    Class class$8 = class$("freemarker.template.TemplateScalarModel");
                    class$freemarker$template$TemplateScalarModel = class$8;
                    return class$8;
                }
                if (!(tm instanceof TemplateHashModelEx)) {
                    return null;
                }
                if (class$freemarker$template$TemplateHashModelEx != null) {
                    return class$freemarker$template$TemplateHashModelEx;
                }
                Class class$9 = class$("freemarker.template.TemplateHashModelEx");
                class$freemarker$template$TemplateHashModelEx = class$9;
                return class$9;
            }
            return null;
        }
        return null;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static void appendTemplateModelTypeName(StringBuffer sb, Set typeNamesAppended, Class cl) {
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
        if (class$freemarker$template$TemplateNodeModel == null) {
            cls = class$("freemarker.template.TemplateNodeModel");
            class$freemarker$template$TemplateNodeModel = cls;
        } else {
            cls = class$freemarker$template$TemplateNodeModel;
        }
        if (cls.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "node");
        }
        if (class$freemarker$template$TemplateDirectiveModel == null) {
            cls2 = class$("freemarker.template.TemplateDirectiveModel");
            class$freemarker$template$TemplateDirectiveModel = cls2;
        } else {
            cls2 = class$freemarker$template$TemplateDirectiveModel;
        }
        if (cls2.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "directive");
        } else {
            if (class$freemarker$template$TemplateTransformModel == null) {
                cls3 = class$("freemarker.template.TemplateTransformModel");
                class$freemarker$template$TemplateTransformModel = cls3;
            } else {
                cls3 = class$freemarker$template$TemplateTransformModel;
            }
            if (cls3.isAssignableFrom(cl)) {
                appendTypeName(sb, typeNamesAppended, "transform");
            }
        }
        if (class$freemarker$template$TemplateSequenceModel == null) {
            cls4 = class$("freemarker.template.TemplateSequenceModel");
            class$freemarker$template$TemplateSequenceModel = cls4;
        } else {
            cls4 = class$freemarker$template$TemplateSequenceModel;
        }
        if (cls4.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "sequence");
        } else {
            if (class$freemarker$template$TemplateCollectionModel == null) {
                cls5 = class$("freemarker.template.TemplateCollectionModel");
                class$freemarker$template$TemplateCollectionModel = cls5;
            } else {
                cls5 = class$freemarker$template$TemplateCollectionModel;
            }
            if (cls5.isAssignableFrom(cl)) {
                appendTypeName(sb, typeNamesAppended, "collection");
            } else {
                if (class$freemarker$template$TemplateModelIterator == null) {
                    cls6 = class$("freemarker.template.TemplateModelIterator");
                    class$freemarker$template$TemplateModelIterator = cls6;
                } else {
                    cls6 = class$freemarker$template$TemplateModelIterator;
                }
                if (cls6.isAssignableFrom(cl)) {
                    appendTypeName(sb, typeNamesAppended, "iterator");
                }
            }
        }
        if (class$freemarker$template$TemplateMethodModel == null) {
            cls7 = class$("freemarker.template.TemplateMethodModel");
            class$freemarker$template$TemplateMethodModel = cls7;
        } else {
            cls7 = class$freemarker$template$TemplateMethodModel;
        }
        if (cls7.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "method");
        }
        if (class$freemarker$core$Environment$Namespace == null) {
            cls8 = class$("freemarker.core.Environment$Namespace");
            class$freemarker$core$Environment$Namespace = cls8;
        } else {
            cls8 = class$freemarker$core$Environment$Namespace;
        }
        if (cls8.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "namespace");
        } else {
            if (class$freemarker$template$TemplateHashModelEx == null) {
                cls9 = class$("freemarker.template.TemplateHashModelEx");
                class$freemarker$template$TemplateHashModelEx = cls9;
            } else {
                cls9 = class$freemarker$template$TemplateHashModelEx;
            }
            if (cls9.isAssignableFrom(cl)) {
                appendTypeName(sb, typeNamesAppended, "extended_hash");
            } else {
                if (class$freemarker$template$TemplateHashModel == null) {
                    cls10 = class$("freemarker.template.TemplateHashModel");
                    class$freemarker$template$TemplateHashModel = cls10;
                } else {
                    cls10 = class$freemarker$template$TemplateHashModel;
                }
                if (cls10.isAssignableFrom(cl)) {
                    appendTypeName(sb, typeNamesAppended, "hash");
                }
            }
        }
        if (class$freemarker$template$TemplateNumberModel == null) {
            cls11 = class$("freemarker.template.TemplateNumberModel");
            class$freemarker$template$TemplateNumberModel = cls11;
        } else {
            cls11 = class$freemarker$template$TemplateNumberModel;
        }
        if (cls11.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "number");
        }
        if (class$freemarker$template$TemplateDateModel == null) {
            cls12 = class$("freemarker.template.TemplateDateModel");
            class$freemarker$template$TemplateDateModel = cls12;
        } else {
            cls12 = class$freemarker$template$TemplateDateModel;
        }
        if (cls12.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "date");
        }
        if (class$freemarker$template$TemplateBooleanModel == null) {
            cls13 = class$("freemarker.template.TemplateBooleanModel");
            class$freemarker$template$TemplateBooleanModel = cls13;
        } else {
            cls13 = class$freemarker$template$TemplateBooleanModel;
        }
        if (cls13.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "boolean");
        }
        if (class$freemarker$template$TemplateScalarModel == null) {
            cls14 = class$("freemarker.template.TemplateScalarModel");
            class$freemarker$template$TemplateScalarModel = cls14;
        } else {
            cls14 = class$freemarker$template$TemplateScalarModel;
        }
        if (cls14.isAssignableFrom(cl)) {
            appendTypeName(sb, typeNamesAppended, "string");
        }
    }

    private static Class getUnwrappedClass(TemplateModel tm) {
        Object unwrapped;
        Class cls;
        try {
            if (tm instanceof WrapperTemplateModel) {
                unwrapped = ((WrapperTemplateModel) tm).getWrappedObject();
            } else if (tm instanceof AdapterTemplateModel) {
                AdapterTemplateModel adapterTemplateModel = (AdapterTemplateModel) tm;
                if (class$java$lang$Object == null) {
                    cls = class$("java.lang.Object");
                    class$java$lang$Object = cls;
                } else {
                    cls = class$java$lang$Object;
                }
                unwrapped = adapterTemplateModel.getAdaptedObject(cls);
            } else {
                unwrapped = null;
            }
        } catch (Throwable th) {
            unwrapped = null;
        }
        if (unwrapped != null) {
            return unwrapped.getClass();
        }
        return null;
    }

    private static void appendTypeName(StringBuffer sb, Set typeNamesAppended, String name) {
        if (!typeNamesAppended.contains(name)) {
            if (sb.length() != 0) {
                sb.append("+");
            }
            sb.append(name);
            typeNamesAppended.add(name);
        }
    }

    public static String getFTLTypeDescription(TemplateModel tm) {
        String javaClassName;
        if (tm == null) {
            return "Null";
        }
        Set typeNamesAppended = new HashSet();
        StringBuffer sb = new StringBuffer();
        Class primaryInterface = getPrimaryTemplateModelInterface(tm);
        if (primaryInterface != null) {
            appendTemplateModelTypeName(sb, typeNamesAppended, primaryInterface);
        }
        if (tm instanceof Macro) {
            appendTypeName(sb, typeNamesAppended, ((Macro) tm).isFunction() ? "function" : "macro");
        }
        appendTemplateModelTypeName(sb, typeNamesAppended, tm.getClass());
        Class unwrappedClass = getUnwrappedClass(tm);
        if (unwrappedClass != null) {
            javaClassName = getShortClassName(unwrappedClass, true);
        } else {
            javaClassName = null;
        }
        sb.append(" (");
        String modelClassName = getShortClassName(tm.getClass(), true);
        if (javaClassName == null) {
            sb.append("wrapper: ");
            sb.append(modelClassName);
        } else {
            sb.append(javaClassName);
            sb.append(" wrapped into ");
            sb.append(modelClassName);
        }
        sb.append(")");
        return sb.toString();
    }
}
