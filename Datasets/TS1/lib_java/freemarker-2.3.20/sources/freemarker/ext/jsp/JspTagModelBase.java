package freemarker.ext.jsp;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.StringUtil;
import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/JspTagModelBase.class */
class JspTagModelBase {
    private final Class tagClass;
    private final Method dynaSetter;
    private final Map propertySetters = new HashMap();
    static Class class$java$lang$String;
    static Class class$java$lang$Object;

    protected JspTagModelBase(Class tagClass) throws IntrospectionException {
        Method dynaSetter;
        Class<?> cls;
        Class<?> cls2;
        Class<?> cls3;
        this.tagClass = tagClass;
        BeanInfo bi = Introspector.getBeanInfo(tagClass);
        PropertyDescriptor[] pda = bi.getPropertyDescriptors();
        for (PropertyDescriptor pd : pda) {
            Method m = pd.getWriteMethod();
            if (m != null) {
                this.propertySetters.put(pd.getName(), m);
            }
        }
        try {
            Class<?>[] clsArr = new Class[3];
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            clsArr[0] = cls;
            if (class$java$lang$String == null) {
                cls2 = class$("java.lang.String");
                class$java$lang$String = cls2;
            } else {
                cls2 = class$java$lang$String;
            }
            clsArr[1] = cls2;
            if (class$java$lang$Object == null) {
                cls3 = class$("java.lang.Object");
                class$java$lang$Object = cls3;
            } else {
                cls3 = class$java$lang$Object;
            }
            clsArr[2] = cls3;
            dynaSetter = tagClass.getMethod("setDynamicAttribute", clsArr);
        } catch (NoSuchMethodException e) {
            dynaSetter = null;
        }
        this.dynaSetter = dynaSetter;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    Object getTagInstance() throws IllegalAccessException, InstantiationException {
        return this.tagClass.newInstance();
    }

    void setupTag(Object tag, Map args, ObjectWrapper wrapper) throws TemplateModelException, InvocationTargetException, IllegalAccessException {
        BeansWrapper bwrapper = wrapper instanceof BeansWrapper ? (BeansWrapper) wrapper : BeansWrapper.getDefaultInstance();
        if (args != null && !args.isEmpty()) {
            Object[] aarg = new Object[1];
            for (Map.Entry entry : args.entrySet()) {
                Object arg = bwrapper.unwrap((TemplateModel) entry.getValue());
                aarg[0] = arg;
                Method m = (Method) this.propertySetters.get(entry.getKey());
                if (m == null) {
                    if (this.dynaSetter == null) {
                        throw new TemplateModelException(new StringBuffer().append("Unknown property ").append(StringUtil.jQuote(entry.getKey().toString())).append(" on instance of ").append(this.tagClass.getName()).toString());
                    }
                    this.dynaSetter.invoke(tag, null, entry.getKey(), aarg[0]);
                } else {
                    if (arg instanceof BigDecimal) {
                        aarg[0] = BeansWrapper.coerceBigDecimal((BigDecimal) arg, m.getParameterTypes()[0]);
                    }
                    m.invoke(tag, aarg);
                }
            }
        }
    }
}
