package freemarker.ext.beans;

import freemarker.core.CollectionAndSequence;
import freemarker.ext.util.ModelFactory;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.log.Logger;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.StringUtil;
import java.beans.IndexedPropertyDescriptor;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BeanModel.class */
public class BeanModel implements TemplateHashModelEx, AdapterTemplateModel, WrapperTemplateModel {
    protected final Object object;
    protected final BeansWrapper wrapper;
    private HashMap memberMap;
    private static final Logger logger = Logger.getLogger("freemarker.beans");
    static final TemplateModel UNKNOWN = new SimpleScalar("UNKNOWN");
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.BeanModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new BeanModel(object, (BeansWrapper) wrapper);
        }
    };

    public BeanModel(Object object, BeansWrapper wrapper) {
        this.object = object;
        this.wrapper = wrapper;
        if (object != null) {
            wrapper.getClassIntrospectionData(object.getClass());
        }
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        Class clazz = this.object.getClass();
        Map classInfo = this.wrapper.getClassIntrospectionData(clazz);
        TemplateModel retval = null;
        try {
            if (this.wrapper.isMethodsShadowItems()) {
                Object fd = classInfo.get(key);
                if (fd != null) {
                    retval = invokeThroughDescriptor(fd, classInfo);
                } else {
                    retval = invokeGenericGet(classInfo, clazz, key);
                }
            } else {
                TemplateModel model = invokeGenericGet(classInfo, clazz, key);
                TemplateModel nullModel = this.wrapper.wrap(null);
                if (model != nullModel && model != UNKNOWN) {
                    return model;
                }
                Object fd2 = classInfo.get(key);
                if (fd2 != null) {
                    retval = invokeThroughDescriptor(fd2, classInfo);
                    if (retval == UNKNOWN && model == nullModel) {
                        retval = nullModel;
                    }
                }
            }
            if (retval == UNKNOWN) {
                if (this.wrapper.isStrict()) {
                    throw new InvalidPropertyException(new StringBuffer().append("No such bean property: ").append(key).toString());
                }
                if (logger.isDebugEnabled()) {
                    logNoSuchKey(key, classInfo);
                }
                retval = this.wrapper.wrap(null);
            }
            return retval;
        } catch (TemplateModelException e) {
            throw e;
        } catch (Exception e2) {
            throw new TemplateModelException(new StringBuffer().append("get(").append(key).append(") failed on ").append("instance of ").append(this.object.getClass().getName()).append(". See cause exception.").toString(), e2);
        }
    }

    private void logNoSuchKey(String key, Map keyMap) {
        logger.debug(new StringBuffer().append("Key ").append(StringUtil.jQuoteNoXSS(key)).append(" was not found on instance of ").append(this.object.getClass().getName()).append(". Introspection information for ").append("the class is: ").append(keyMap).toString());
    }

    protected boolean hasPlainGetMethod() {
        return this.wrapper.getClassIntrospectionData(this.object.getClass()).get(BeansWrapper.GENERIC_GET_KEY) != null;
    }

    private TemplateModel invokeThroughDescriptor(Object desc, Map classInfo) throws IllegalAccessException, InvocationTargetException, TemplateModelException {
        TemplateModel member;
        synchronized (this) {
            if (this.memberMap != null) {
                member = (TemplateModel) this.memberMap.get(desc);
            } else {
                member = null;
            }
        }
        if (member != null) {
            return member;
        }
        TemplateModel retval = UNKNOWN;
        if (desc instanceof IndexedPropertyDescriptor) {
            Method readMethod = ((IndexedPropertyDescriptor) desc).getIndexedReadMethod();
            SimpleMethodModel simpleMethodModel = new SimpleMethodModel(this.object, readMethod, BeansWrapper.getArgTypes(classInfo, readMethod), this.wrapper);
            member = simpleMethodModel;
            retval = simpleMethodModel;
        } else if (desc instanceof PropertyDescriptor) {
            PropertyDescriptor pd = (PropertyDescriptor) desc;
            retval = this.wrapper.invokeMethod(this.object, pd.getReadMethod(), null);
        } else if (desc instanceof Field) {
            retval = this.wrapper.wrap(((Field) desc).get(this.object));
        } else if (desc instanceof Method) {
            Method method = (Method) desc;
            SimpleMethodModel simpleMethodModel2 = new SimpleMethodModel(this.object, method, BeansWrapper.getArgTypes(classInfo, method), this.wrapper);
            member = simpleMethodModel2;
            retval = simpleMethodModel2;
        } else if (desc instanceof OverloadedMethods) {
            OverloadedMethodsModel overloadedMethodsModel = new OverloadedMethodsModel(this.object, (OverloadedMethods) desc);
            member = overloadedMethodsModel;
            retval = overloadedMethodsModel;
        }
        if (member != null) {
            synchronized (this) {
                if (this.memberMap == null) {
                    this.memberMap = new HashMap();
                }
                this.memberMap.put(desc, member);
            }
        }
        return retval;
    }

    protected TemplateModel invokeGenericGet(Map keyMap, Class clazz, String key) throws IllegalAccessException, InvocationTargetException, TemplateModelException {
        Method genericGet = (Method) keyMap.get(BeansWrapper.GENERIC_GET_KEY);
        return genericGet == null ? UNKNOWN : this.wrapper.invokeMethod(this.object, genericGet, new Object[]{key});
    }

    protected TemplateModel wrap(Object obj) throws TemplateModelException {
        return this.wrapper.getOuterIdentity().wrap(obj);
    }

    protected Object unwrap(TemplateModel model) throws TemplateModelException {
        return this.wrapper.unwrap(model);
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        if (this.object instanceof String) {
            return ((String) this.object).length() == 0;
        }
        if (this.object instanceof Collection) {
            return ((Collection) this.object).isEmpty();
        }
        if (this.object instanceof Map) {
            return ((Map) this.object).isEmpty();
        }
        return this.object == null || Boolean.FALSE.equals(this.object);
    }

    @Override // freemarker.template.AdapterTemplateModel
    public Object getAdaptedObject(Class hint) {
        return this.object;
    }

    @Override // freemarker.ext.util.WrapperTemplateModel
    public Object getWrappedObject() {
        return this.object;
    }

    @Override // freemarker.template.TemplateHashModelEx
    public int size() {
        return this.wrapper.keyCount(this.object.getClass());
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel keys() {
        return new CollectionAndSequence(new SimpleSequence(keySet(), this.wrapper));
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel values() throws TemplateModelException {
        List values = new ArrayList(size());
        TemplateModelIterator it = keys().iterator();
        while (it.hasNext()) {
            String key = ((TemplateScalarModel) it.next()).getAsString();
            values.add(get(key));
        }
        return new CollectionAndSequence(new SimpleSequence(values, this.wrapper));
    }

    String getAsClassicCompatibleString() {
        return this.object == null ? "null" : this.object.toString();
    }

    public String toString() {
        return this.object.toString();
    }

    protected Set keySet() {
        return this.wrapper.keySet(this.object.getClass());
    }
}
