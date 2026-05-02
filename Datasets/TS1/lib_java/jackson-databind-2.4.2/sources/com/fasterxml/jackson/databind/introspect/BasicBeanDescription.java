package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.type.TypeBindings;
import com.fasterxml.jackson.databind.util.Annotations;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.Converter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/introspect/BasicBeanDescription.class */
public class BasicBeanDescription extends BeanDescription {
    protected final MapperConfig<?> _config;
    protected final AnnotationIntrospector _annotationIntrospector;
    protected final AnnotatedClass _classInfo;
    protected TypeBindings _bindings;
    protected final List<BeanPropertyDefinition> _properties;
    protected ObjectIdInfo _objectIdInfo;
    protected AnnotatedMethod _anySetterMethod;
    protected Map<Object, AnnotatedMember> _injectables;
    protected Set<String> _ignoredPropertyNames;
    protected AnnotatedMethod _jsonValueMethod;
    protected AnnotatedMember _anyGetter;

    protected BasicBeanDescription(MapperConfig<?> config, JavaType type, AnnotatedClass classDef, List<BeanPropertyDefinition> props) {
        super(type);
        this._config = config;
        this._annotationIntrospector = config == null ? null : config.getAnnotationIntrospector();
        this._classInfo = classDef;
        this._properties = props;
    }

    protected BasicBeanDescription(POJOPropertiesCollector coll) {
        this(coll.getConfig(), coll.getType(), coll.getClassDef(), coll.getProperties());
        this._objectIdInfo = coll.getObjectIdInfo();
    }

    public static BasicBeanDescription forDeserialization(POJOPropertiesCollector coll) {
        BasicBeanDescription desc = new BasicBeanDescription(coll);
        desc._anySetterMethod = coll.getAnySetterMethod();
        desc._ignoredPropertyNames = coll.getIgnoredPropertyNames();
        desc._injectables = coll.getInjectables();
        desc._jsonValueMethod = coll.getJsonValueMethod();
        return desc;
    }

    public static BasicBeanDescription forSerialization(POJOPropertiesCollector coll) {
        BasicBeanDescription desc = new BasicBeanDescription(coll);
        desc._jsonValueMethod = coll.getJsonValueMethod();
        desc._anyGetter = coll.getAnyGetter();
        return desc;
    }

    public static BasicBeanDescription forOtherUse(MapperConfig<?> config, JavaType type, AnnotatedClass ac) {
        return new BasicBeanDescription(config, type, ac, Collections.emptyList());
    }

    public boolean removeProperty(String propName) {
        Iterator<BeanPropertyDefinition> it = this._properties.iterator();
        while (it.hasNext()) {
            BeanPropertyDefinition prop = it.next();
            if (prop.getName().equals(propName)) {
                it.remove();
                return true;
            }
        }
        return false;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedClass getClassInfo() {
        return this._classInfo;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public ObjectIdInfo getObjectIdInfo() {
        return this._objectIdInfo;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public List<BeanPropertyDefinition> findProperties() {
        return this._properties;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedMethod findJsonValueMethod() {
        return this._jsonValueMethod;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Set<String> getIgnoredPropertyNames() {
        if (this._ignoredPropertyNames == null) {
            return Collections.emptySet();
        }
        return this._ignoredPropertyNames;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public boolean hasKnownClassAnnotations() {
        return this._classInfo.hasAnnotations();
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Annotations getClassAnnotations() {
        return this._classInfo.getAnnotations();
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public TypeBindings bindingsForBeanType() {
        if (this._bindings == null) {
            this._bindings = new TypeBindings(this._config.getTypeFactory(), this._type);
        }
        return this._bindings;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public JavaType resolveType(Type jdkType) {
        if (jdkType == null) {
            return null;
        }
        return bindingsForBeanType().resolveType(jdkType);
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedConstructor findDefaultConstructor() {
        return this._classInfo.getDefaultConstructor();
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedMethod findAnySetter() throws IllegalArgumentException {
        Class<?> type;
        if (this._anySetterMethod != null && (type = this._anySetterMethod.getRawParameterType(0)) != String.class && type != Object.class) {
            throw new IllegalArgumentException("Invalid 'any-setter' annotation on method " + this._anySetterMethod.getName() + "(): first argument not of type String or Object, but " + type.getName());
        }
        return this._anySetterMethod;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Map<Object, AnnotatedMember> findInjectables() {
        return this._injectables;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public List<AnnotatedConstructor> getConstructors() {
        return this._classInfo.getConstructors();
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Object instantiateBean(boolean fixAccess) {
        Throwable t;
        AnnotatedConstructor ac = this._classInfo.getDefaultConstructor();
        if (ac == null) {
            return null;
        }
        if (fixAccess) {
            ac.fixAccess();
        }
        try {
            return ac.getAnnotated().newInstance(new Object[0]);
        } catch (Exception e) {
            Throwable th = e;
            while (true) {
                t = th;
                if (t.getCause() == null) {
                    break;
                }
                th = t.getCause();
            }
            if (t instanceof Error) {
                throw ((Error) t);
            }
            if (t instanceof RuntimeException) {
                throw ((RuntimeException) t);
            }
            throw new IllegalArgumentException("Failed to instantiate bean of type " + this._classInfo.getAnnotated().getName() + ": (" + t.getClass().getName() + ") " + t.getMessage(), t);
        }
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedMethod findMethod(String name, Class<?>[] paramTypes) {
        return this._classInfo.findMethod(name, paramTypes);
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public JsonFormat.Value findExpectedFormat(JsonFormat.Value defValue) {
        JsonFormat.Value v;
        if (this._annotationIntrospector != null && (v = this._annotationIntrospector.findFormat(this._classInfo)) != null) {
            return v;
        }
        return defValue;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Converter<Object, Object> findSerializationConverter() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        return _createConverter(this._annotationIntrospector.findSerializationConverter(this._classInfo));
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public JsonInclude.Include findSerializationInclusion(JsonInclude.Include defValue) {
        if (this._annotationIntrospector == null) {
            return defValue;
        }
        return this._annotationIntrospector.findSerializationInclusion(this._classInfo, defValue);
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public AnnotatedMember findAnyGetter() throws IllegalArgumentException {
        if (this._anyGetter != null) {
            Class<?> type = this._anyGetter.getRawType();
            if (!Map.class.isAssignableFrom(type)) {
                throw new IllegalArgumentException("Invalid 'any-getter' annotation on method " + this._anyGetter.getName() + "(): return type is not instance of java.util.Map");
            }
        }
        return this._anyGetter;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Map<String, AnnotatedMember> findBackReferenceProperties() {
        AnnotationIntrospector.ReferenceProperty refDef;
        HashMap<String, AnnotatedMember> result = null;
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedMember am = property.getMutator();
            if (am != null && (refDef = this._annotationIntrospector.findReferenceType(am)) != null && refDef.isBackReference()) {
                if (result == null) {
                    result = new HashMap<>();
                }
                String refName = refDef.getName();
                if (result.put(refName, am) != null) {
                    throw new IllegalArgumentException("Multiple back-reference properties with name '" + refName + "'");
                }
            }
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public List<AnnotatedMethod> getFactoryMethods() {
        List<AnnotatedMethod> candidates = this._classInfo.getStaticMethods();
        if (candidates.isEmpty()) {
            return candidates;
        }
        ArrayList<AnnotatedMethod> result = new ArrayList<>();
        for (AnnotatedMethod am : candidates) {
            if (isFactoryMethod(am)) {
                result.add(am);
            }
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Constructor<?> findSingleArgConstructor(Class<?>... argTypes) {
        for (AnnotatedConstructor ac : this._classInfo.getConstructors()) {
            if (ac.getParameterCount() == 1) {
                Class<?> actArg = ac.getRawParameterType(0);
                for (Class<?> expArg : argTypes) {
                    if (expArg == actArg) {
                        return ac.getAnnotated();
                    }
                }
            }
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Method findFactoryMethod(Class<?>... expArgTypes) {
        for (AnnotatedMethod am : this._classInfo.getStaticMethods()) {
            if (isFactoryMethod(am)) {
                Class<?> actualArgType = am.getRawParameterType(0);
                for (Class<?> expArgType : expArgTypes) {
                    if (actualArgType.isAssignableFrom(expArgType)) {
                        return am.getAnnotated();
                    }
                }
            }
        }
        return null;
    }

    protected boolean isFactoryMethod(AnnotatedMethod am) {
        Class<?> rt = am.getRawReturnType();
        if (!getBeanClass().isAssignableFrom(rt)) {
            return false;
        }
        if (this._annotationIntrospector.hasCreatorAnnotation(am)) {
            return true;
        }
        String name = am.getName();
        if ("valueOf".equals(name)) {
            return true;
        }
        if ("fromString".equals(name) && 1 == am.getParameterCount()) {
            Class<?> cls = am.getRawParameterType(0);
            if (cls == String.class || CharSequence.class.isAssignableFrom(cls)) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Deprecated
    public List<String> findCreatorPropertyNames() {
        List<PropertyName> params = findCreatorParameterNames();
        if (params.isEmpty()) {
            return Collections.emptyList();
        }
        List<String> result = new ArrayList<>(params.size());
        for (PropertyName name : params) {
            result.add(name.getSimpleName());
        }
        return result;
    }

    public List<PropertyName> findCreatorParameterNames() {
        PropertyName name;
        int i = 0;
        while (i < 2) {
            List<? extends AnnotatedWithParams> l = i == 0 ? getConstructors() : getFactoryMethods();
            for (AnnotatedWithParams creator : l) {
                int argCount = creator.getParameterCount();
                if (argCount >= 1 && (name = _findCreatorPropertyName(creator.getParameter(0))) != null && !name.isEmpty()) {
                    List<PropertyName> names = new ArrayList<>();
                    names.add(name);
                    for (int p = 1; p < argCount; p++) {
                        names.add(_findCreatorPropertyName(creator.getParameter(p)));
                    }
                    return names;
                }
            }
            i++;
        }
        return Collections.emptyList();
    }

    protected PropertyName _findCreatorPropertyName(AnnotatedParameter param) {
        String str;
        PropertyName name = this._annotationIntrospector.findNameForDeserialization(param);
        if ((name == null || name.isEmpty()) && (str = this._annotationIntrospector.findImplicitPropertyName(param)) != null && !str.isEmpty()) {
            name = new PropertyName(str);
        }
        return name;
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Class<?> findPOJOBuilder() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        return this._annotationIntrospector.findPOJOBuilder(this._classInfo);
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public JsonPOJOBuilder.Value findPOJOBuilderConfig() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        return this._annotationIntrospector.findPOJOBuilderConfig(this._classInfo);
    }

    @Override // com.fasterxml.jackson.databind.BeanDescription
    public Converter<Object, Object> findDeserializationConverter() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        return _createConverter(this._annotationIntrospector.findDeserializationConverter(this._classInfo));
    }

    public LinkedHashMap<String, AnnotatedField> _findPropertyFields(Collection<String> ignoredProperties, boolean forSerialization) {
        LinkedHashMap<String, AnnotatedField> results = new LinkedHashMap<>();
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedField f = property.getField();
            if (f != null) {
                String name = property.getName();
                if (ignoredProperties == null || !ignoredProperties.contains(name)) {
                    results.put(name, f);
                }
            }
        }
        return results;
    }

    public Converter<Object, Object> _createConverter(Object converterDef) {
        if (converterDef == null) {
            return null;
        }
        if (converterDef instanceof Converter) {
            return (Converter) converterDef;
        }
        if (!(converterDef instanceof Class)) {
            throw new IllegalStateException("AnnotationIntrospector returned Converter definition of type " + converterDef.getClass().getName() + "; expected type Converter or Class<Converter> instead");
        }
        Class<?> converterClass = (Class) converterDef;
        if (converterClass == Converter.None.class || ClassUtil.isBogusClass(converterClass)) {
            return null;
        }
        if (!Converter.class.isAssignableFrom(converterClass)) {
            throw new IllegalStateException("AnnotationIntrospector returned Class " + converterClass.getName() + "; expected Class<Converter>");
        }
        HandlerInstantiator hi = this._config.getHandlerInstantiator();
        Converter<?, ?> conv = hi == null ? null : hi.converterInstance(this._config, this._classInfo, converterClass);
        if (conv == null) {
            conv = (Converter) ClassUtil.createInstance(converterClass, this._config.canOverrideAccessModifiers());
        }
        return conv;
    }
}
