package freemarker.ext.beans;

import freemarker.log.Logger;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/StaticModel.class */
final class StaticModel implements TemplateHashModelEx {
    private static final Logger logger = Logger.getLogger("freemarker.beans");
    private final Class clazz;
    private final BeansWrapper wrapper;
    private final Map map = new HashMap();

    StaticModel(Class clazz, BeansWrapper wrapper) throws TemplateModelException {
        this.clazz = clazz;
        this.wrapper = wrapper;
        populate();
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        Object model = this.map.get(key);
        if (model instanceof TemplateModel) {
            return (TemplateModel) model;
        }
        if (model instanceof Field) {
            try {
                return this.wrapper.getOuterIdentity().wrap(((Field) model).get(null));
            } catch (IllegalAccessException e) {
                throw new TemplateModelException(new StringBuffer().append("Illegal access for field ").append(key).append(" of class ").append(this.clazz.getName()).toString());
            }
        }
        throw new TemplateModelException(new StringBuffer().append("No such key: ").append(key).append(" in class ").append(this.clazz.getName()).toString());
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public int size() {
        return this.map.size();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel keys() throws TemplateModelException {
        return (TemplateCollectionModel) this.wrapper.getOuterIdentity().wrap(this.map.keySet());
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel values() throws TemplateModelException {
        return (TemplateCollectionModel) this.wrapper.getOuterIdentity().wrap(this.map.values());
    }

    private void populate() throws TemplateModelException {
        if (!Modifier.isPublic(this.clazz.getModifiers())) {
            throw new TemplateModelException(new StringBuffer().append("Can't wrap the non-public class ").append(this.clazz.getName()).toString());
        }
        if (this.wrapper.getExposureLevel() == 3) {
            return;
        }
        Field[] fields = this.clazz.getFields();
        for (Field field : fields) {
            int mod = field.getModifiers();
            if (Modifier.isPublic(mod) && Modifier.isStatic(mod)) {
                if (Modifier.isFinal(mod)) {
                    try {
                        this.map.put(field.getName(), this.wrapper.getOuterIdentity().wrap(field.get(null)));
                    } catch (IllegalAccessException e) {
                    }
                } else {
                    this.map.put(field.getName(), field);
                }
            }
        }
        if (this.wrapper.getExposureLevel() < 2) {
            Method[] methods = this.clazz.getMethods();
            for (Method method : methods) {
                int mod2 = method.getModifiers();
                if (Modifier.isPublic(mod2) && Modifier.isStatic(mod2) && this.wrapper.isSafeMethod(method)) {
                    String name = method.getName();
                    Object obj = this.map.get(name);
                    if (obj instanceof Method) {
                        OverloadedMethods overloadedMethods = new OverloadedMethods(this.wrapper);
                        overloadedMethods.addMember((Method) obj);
                        overloadedMethods.addMember(method);
                        this.map.put(name, overloadedMethods);
                    } else if (obj instanceof OverloadedMethods) {
                        ((OverloadedMethods) obj).addMember(method);
                    } else {
                        if (obj != null && logger.isInfoEnabled()) {
                            logger.info(new StringBuffer().append("Overwriting value [").append(obj).append("] for ").append(" key '").append(name).append("' with [").append(method).append("] in static model for ").append(this.clazz.getName()).toString());
                        }
                        this.map.put(name, method);
                    }
                }
            }
            for (Map.Entry entry : this.map.entrySet()) {
                Object value = entry.getValue();
                if (value instanceof Method) {
                    Method method2 = (Method) value;
                    entry.setValue(new SimpleMethodModel(null, method2, method2.getParameterTypes(), this.wrapper));
                } else if (value instanceof OverloadedMethods) {
                    entry.setValue(new OverloadedMethodsModel(null, (OverloadedMethods) value));
                }
            }
        }
    }
}
