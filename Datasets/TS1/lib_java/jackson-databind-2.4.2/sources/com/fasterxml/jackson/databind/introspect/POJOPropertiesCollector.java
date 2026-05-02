package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.cfg.HandlerInstantiator;
import com.fasterxml.jackson.databind.cfg.MapperConfig;
import com.fasterxml.jackson.databind.util.BeanUtil;
import com.fasterxml.jackson.databind.util.ClassUtil;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/introspect/POJOPropertiesCollector.class */
public class POJOPropertiesCollector {
    protected final MapperConfig<?> _config;
    protected final boolean _forSerialization;
    protected final JavaType _type;
    protected final AnnotatedClass _classDef;
    protected final VisibilityChecker<?> _visibilityChecker;
    protected final AnnotationIntrospector _annotationIntrospector;
    protected final String _mutatorPrefix;
    protected final LinkedHashMap<String, POJOPropertyBuilder> _properties = new LinkedHashMap<>();
    protected LinkedList<POJOPropertyBuilder> _creatorProperties = null;
    protected LinkedList<AnnotatedMember> _anyGetters = null;
    protected LinkedList<AnnotatedMethod> _anySetters = null;
    protected LinkedList<AnnotatedMethod> _jsonValueGetters = null;
    protected HashSet<String> _ignoredPropertyNames;
    protected LinkedHashMap<Object, AnnotatedMember> _injectables;

    protected POJOPropertiesCollector(MapperConfig<?> config, boolean forSerialization, JavaType type, AnnotatedClass classDef, String mutatorPrefix) {
        this._config = config;
        this._forSerialization = forSerialization;
        this._type = type;
        this._classDef = classDef;
        this._mutatorPrefix = mutatorPrefix == null ? "set" : mutatorPrefix;
        this._annotationIntrospector = config.isAnnotationProcessingEnabled() ? this._config.getAnnotationIntrospector() : null;
        if (this._annotationIntrospector == null) {
            this._visibilityChecker = this._config.getDefaultVisibilityChecker();
        } else {
            this._visibilityChecker = this._annotationIntrospector.findAutoDetectVisibility(classDef, this._config.getDefaultVisibilityChecker());
        }
    }

    public MapperConfig<?> getConfig() {
        return this._config;
    }

    public JavaType getType() {
        return this._type;
    }

    public AnnotatedClass getClassDef() {
        return this._classDef;
    }

    public AnnotationIntrospector getAnnotationIntrospector() {
        return this._annotationIntrospector;
    }

    public List<BeanPropertyDefinition> getProperties() {
        return new ArrayList(this._properties.values());
    }

    public Map<Object, AnnotatedMember> getInjectables() {
        return this._injectables;
    }

    public AnnotatedMethod getJsonValueMethod() {
        if (this._jsonValueGetters != null) {
            if (this._jsonValueGetters.size() > 1) {
                reportProblem("Multiple value properties defined (" + this._jsonValueGetters.get(0) + " vs " + this._jsonValueGetters.get(1) + ")");
            }
            return this._jsonValueGetters.get(0);
        }
        return null;
    }

    public AnnotatedMember getAnyGetter() {
        if (this._anyGetters != null) {
            if (this._anyGetters.size() > 1) {
                reportProblem("Multiple 'any-getters' defined (" + this._anyGetters.get(0) + " vs " + this._anyGetters.get(1) + ")");
            }
            return this._anyGetters.getFirst();
        }
        return null;
    }

    public AnnotatedMethod getAnySetterMethod() {
        if (this._anySetters != null) {
            if (this._anySetters.size() > 1) {
                reportProblem("Multiple 'any-setters' defined (" + this._anySetters.get(0) + " vs " + this._anySetters.get(1) + ")");
            }
            return this._anySetters.getFirst();
        }
        return null;
    }

    public Set<String> getIgnoredPropertyNames() {
        return this._ignoredPropertyNames;
    }

    public ObjectIdInfo getObjectIdInfo() {
        if (this._annotationIntrospector == null) {
            return null;
        }
        ObjectIdInfo info = this._annotationIntrospector.findObjectIdInfo(this._classDef);
        if (info != null) {
            info = this._annotationIntrospector.findObjectReferenceInfo(this._classDef, info);
        }
        return info;
    }

    public Class<?> findPOJOBuilderClass() {
        return this._annotationIntrospector.findPOJOBuilder(this._classDef);
    }

    protected Map<String, POJOPropertyBuilder> getPropertyMap() {
        return this._properties;
    }

    public POJOPropertiesCollector collect() {
        this._properties.clear();
        _addFields();
        _addMethods();
        _addCreators();
        _addInjectables();
        _removeUnwantedProperties();
        _renameProperties();
        PropertyNamingStrategy naming = _findNamingStrategy();
        if (naming != null) {
            _renameUsing(naming);
        }
        for (POJOPropertyBuilder property : this._properties.values()) {
            property.trimByVisibility();
        }
        for (POJOPropertyBuilder property2 : this._properties.values()) {
            property2.mergeAnnotations(this._forSerialization);
        }
        if (this._config.isEnabled(MapperFeature.USE_WRAPPER_NAME_AS_PROPERTY_NAME)) {
            _renameWithWrappers();
        }
        _sortProperties();
        return this;
    }

    protected void _sortProperties() {
        boolean sort;
        Map<String, POJOPropertyBuilder> all;
        Collection<POJOPropertyBuilder> cr;
        AnnotationIntrospector intr = this._annotationIntrospector;
        Boolean alpha = intr == null ? null : intr.findSerializationSortAlphabetically((Annotated) this._classDef);
        if (alpha == null) {
            sort = this._config.shouldSortPropertiesAlphabetically();
        } else {
            sort = alpha.booleanValue();
        }
        String[] propertyOrder = intr == null ? null : intr.findSerializationPropertyOrder(this._classDef);
        if (!sort && this._creatorProperties == null && propertyOrder == null) {
            return;
        }
        int size = this._properties.size();
        if (sort) {
            all = new TreeMap<>();
        } else {
            all = new LinkedHashMap<>(size + size);
        }
        for (POJOPropertyBuilder prop : this._properties.values()) {
            all.put(prop.getName(), prop);
        }
        Map<String, POJOPropertyBuilder> ordered = new LinkedHashMap<>(size + size);
        if (propertyOrder != null) {
            int len$ = propertyOrder.length;
            for (int i$ = 0; i$ < len$; i$++) {
                String name = propertyOrder[i$];
                POJOPropertyBuilder w = all.get(name);
                if (w == null) {
                    Iterator i$2 = this._properties.values().iterator();
                    while (true) {
                        if (!i$2.hasNext()) {
                            break;
                        }
                        POJOPropertyBuilder prop2 = i$2.next();
                        if (name.equals(prop2.getInternalName())) {
                            w = prop2;
                            name = prop2.getName();
                            break;
                        }
                    }
                }
                if (w != null) {
                    ordered.put(name, w);
                }
            }
        }
        if (this._creatorProperties != null) {
            if (sort) {
                TreeMap<String, POJOPropertyBuilder> sorted = new TreeMap<>();
                Iterator i$3 = this._creatorProperties.iterator();
                while (i$3.hasNext()) {
                    POJOPropertyBuilder prop3 = i$3.next();
                    sorted.put(prop3.getName(), prop3);
                }
                cr = sorted.values();
            } else {
                cr = this._creatorProperties;
            }
            for (POJOPropertyBuilder prop4 : cr) {
                ordered.put(prop4.getName(), prop4);
            }
        }
        ordered.putAll(all);
        this._properties.clear();
        this._properties.putAll(ordered);
    }

    protected void _addFields() {
        PropertyName pn;
        AnnotationIntrospector ai = this._annotationIntrospector;
        boolean pruneFinalFields = (this._forSerialization || this._config.isEnabled(MapperFeature.ALLOW_FINAL_FIELDS_AS_MUTATORS)) ? false : true;
        for (AnnotatedField f : this._classDef.fields()) {
            String implName = ai == null ? null : ai.findImplicitPropertyName(f);
            if (implName == null) {
                implName = f.getName();
            }
            if (ai == null) {
                pn = null;
            } else if (this._forSerialization) {
                pn = ai.findNameForSerialization(f);
            } else {
                pn = ai.findNameForDeserialization(f);
            }
            boolean nameExplicit = pn != null;
            if (nameExplicit && pn.isEmpty()) {
                pn = _propNameFromSimple(implName);
                nameExplicit = false;
            }
            boolean visible = pn != null;
            if (!visible) {
                visible = this._visibilityChecker.isFieldVisible(f);
            }
            boolean ignored = ai != null && ai.hasIgnoreMarker(f);
            if (!pruneFinalFields || pn != null || ignored || !Modifier.isFinal(f.getModifiers())) {
                _property(implName).addField(f, pn, nameExplicit, visible, ignored);
            }
        }
    }

    protected void _addCreators() {
        if (this._annotationIntrospector != null) {
            for (AnnotatedConstructor ctor : this._classDef.getConstructors()) {
                if (this._creatorProperties == null) {
                    this._creatorProperties = new LinkedList<>();
                }
                int len = ctor.getParameterCount();
                for (int i = 0; i < len; i++) {
                    _addCreatorParam(ctor.getParameter(i));
                }
            }
            for (AnnotatedMethod factory : this._classDef.getStaticMethods()) {
                if (this._creatorProperties == null) {
                    this._creatorProperties = new LinkedList<>();
                }
                int len2 = factory.getParameterCount();
                for (int i2 = 0; i2 < len2; i2++) {
                    _addCreatorParam(factory.getParameter(i2));
                }
            }
        }
    }

    protected void _addCreatorParam(AnnotatedParameter param) {
        String impl = this._annotationIntrospector.findImplicitPropertyName(param);
        if (impl == null) {
            impl = "";
        }
        PropertyName pn = this._annotationIntrospector.findNameForDeserialization(param);
        boolean expl = (pn == null || pn.isEmpty()) ? false : true;
        if (!expl) {
            if (impl.isEmpty()) {
                return;
            } else {
                pn = new PropertyName(impl);
            }
        }
        POJOPropertyBuilder prop = expl ? _property(pn) : _property(impl);
        prop.addCtor(param, pn, expl, true, false);
        this._creatorProperties.add(prop);
    }

    protected void _addMethods() {
        AnnotationIntrospector ai = this._annotationIntrospector;
        for (AnnotatedMethod m : this._classDef.memberMethods()) {
            int argCount = m.getParameterCount();
            if (argCount == 0) {
                _addGetterMethod(m, ai);
            } else if (argCount == 1) {
                _addSetterMethod(m, ai);
            } else if (argCount == 2 && ai != null && ai.hasAnySetterAnnotation(m)) {
                if (this._anySetters == null) {
                    this._anySetters = new LinkedList<>();
                }
                this._anySetters.add(m);
            }
        }
    }

    protected void _addGetterMethod(AnnotatedMethod m, AnnotationIntrospector ai) {
        String implName;
        boolean visible;
        if (!m.hasReturnType()) {
            return;
        }
        if (ai != null) {
            if (ai.hasAnyGetterAnnotation(m)) {
                if (this._anyGetters == null) {
                    this._anyGetters = new LinkedList<>();
                }
                this._anyGetters.add(m);
                return;
            } else if (ai.hasAsValueAnnotation(m)) {
                if (this._jsonValueGetters == null) {
                    this._jsonValueGetters = new LinkedList<>();
                }
                this._jsonValueGetters.add(m);
                return;
            }
        }
        PropertyName pn = ai == null ? null : ai.findNameForSerialization(m);
        boolean nameExplicit = pn != null;
        if (!nameExplicit) {
            implName = ai == null ? null : ai.findImplicitPropertyName(m);
            if (implName == null) {
                implName = BeanUtil.okNameForRegularGetter(m, m.getName());
            }
            if (implName == null) {
                implName = BeanUtil.okNameForIsGetter(m, m.getName());
                if (implName == null) {
                    return;
                } else {
                    visible = this._visibilityChecker.isIsGetterVisible(m);
                }
            } else {
                visible = this._visibilityChecker.isGetterVisible(m);
            }
        } else {
            implName = ai == null ? null : ai.findImplicitPropertyName(m);
            if (implName == null) {
                implName = BeanUtil.okNameForGetter(m);
            }
            if (implName == null) {
                implName = m.getName();
            }
            if (pn.isEmpty()) {
                pn = _propNameFromSimple(implName);
                nameExplicit = false;
            }
            visible = true;
        }
        boolean ignore = ai == null ? false : ai.hasIgnoreMarker(m);
        _property(implName).addGetter(m, pn, nameExplicit, visible, ignore);
    }

    protected void _addSetterMethod(AnnotatedMethod m, AnnotationIntrospector ai) {
        String implName;
        boolean visible;
        PropertyName pn = ai == null ? null : ai.findNameForDeserialization(m);
        boolean nameExplicit = pn != null;
        if (!nameExplicit) {
            implName = ai == null ? null : ai.findImplicitPropertyName(m);
            if (implName == null) {
                implName = BeanUtil.okNameForMutator(m, this._mutatorPrefix);
            }
            if (implName == null) {
                return;
            } else {
                visible = this._visibilityChecker.isSetterVisible(m);
            }
        } else {
            implName = ai == null ? null : ai.findImplicitPropertyName(m);
            if (implName == null) {
                implName = BeanUtil.okNameForMutator(m, this._mutatorPrefix);
            }
            if (implName == null) {
                implName = m.getName();
            }
            if (pn.isEmpty()) {
                pn = _propNameFromSimple(implName);
                nameExplicit = false;
            }
            visible = true;
        }
        boolean ignore = ai == null ? false : ai.hasIgnoreMarker(m);
        _property(implName).addSetter(m, pn, nameExplicit, visible, ignore);
    }

    protected void _addInjectables() {
        AnnotationIntrospector ai = this._annotationIntrospector;
        if (ai == null) {
            return;
        }
        for (AnnotatedField f : this._classDef.fields()) {
            _doAddInjectable(ai.findInjectableValueId(f), f);
        }
        for (AnnotatedMethod m : this._classDef.memberMethods()) {
            if (m.getParameterCount() == 1) {
                _doAddInjectable(ai.findInjectableValueId(m), m);
            }
        }
    }

    protected void _doAddInjectable(Object id, AnnotatedMember m) {
        if (id == null) {
            return;
        }
        if (this._injectables == null) {
            this._injectables = new LinkedHashMap<>();
        }
        AnnotatedMember prev = this._injectables.put(id, m);
        if (prev != null) {
            String type = id.getClass().getName();
            throw new IllegalArgumentException("Duplicate injectable value with id '" + String.valueOf(id) + "' (of type " + type + ")");
        }
    }

    private PropertyName _propNameFromSimple(String simpleName) {
        return PropertyName.construct(simpleName, null);
    }

    protected void _removeUnwantedProperties() {
        Iterator<Map.Entry<String, POJOPropertyBuilder>> it = this._properties.entrySet().iterator();
        boolean forceNonVisibleRemoval = !this._config.isEnabled(MapperFeature.INFER_PROPERTY_MUTATORS);
        while (it.hasNext()) {
            Map.Entry<String, POJOPropertyBuilder> entry = it.next();
            POJOPropertyBuilder prop = entry.getValue();
            if (!prop.anyVisible()) {
                it.remove();
            } else {
                if (prop.anyIgnorals()) {
                    if (!prop.isExplicitlyIncluded()) {
                        it.remove();
                        _addIgnored(prop.getName());
                    } else {
                        prop.removeIgnored();
                        if (!this._forSerialization && !prop.couldDeserialize()) {
                            _addIgnored(prop.getName());
                        }
                    }
                }
                prop.removeNonVisible(forceNonVisibleRemoval);
            }
        }
    }

    private void _addIgnored(String name) {
        if (!this._forSerialization) {
            if (this._ignoredPropertyNames == null) {
                this._ignoredPropertyNames = new HashSet<>();
            }
            this._ignoredPropertyNames.add(name);
        }
    }

    protected void _renameProperties() {
        Iterator<Map.Entry<String, POJOPropertyBuilder>> it = this._properties.entrySet().iterator();
        LinkedList<POJOPropertyBuilder> renamed = null;
        while (it.hasNext()) {
            Map.Entry<String, POJOPropertyBuilder> entry = it.next();
            POJOPropertyBuilder prop = entry.getValue();
            Collection<PropertyName> l = prop.findExplicitNames();
            if (!l.isEmpty()) {
                it.remove();
                if (renamed == null) {
                    renamed = new LinkedList<>();
                }
                if (l.size() == 1) {
                    PropertyName n = l.iterator().next();
                    renamed.add(prop.withName(n));
                } else {
                    renamed.addAll(prop.explode(l));
                }
            }
        }
        if (renamed != null) {
            Iterator i$ = renamed.iterator();
            while (i$.hasNext()) {
                POJOPropertyBuilder prop2 = i$.next();
                String name = prop2.getName();
                POJOPropertyBuilder old = this._properties.get(name);
                if (old == null) {
                    this._properties.put(name, prop2);
                } else {
                    old.addAll(prop2);
                }
                _updateCreatorProperty(prop2, this._creatorProperties);
            }
        }
    }

    protected void _renameUsing(PropertyNamingStrategy naming) {
        String simpleName;
        POJOPropertyBuilder[] props = (POJOPropertyBuilder[]) this._properties.values().toArray(new POJOPropertyBuilder[this._properties.size()]);
        this._properties.clear();
        for (POJOPropertyBuilder prop : props) {
            PropertyName fullName = prop.getFullName();
            String rename = null;
            if (!prop.isExplicitlyNamed()) {
                if (this._forSerialization) {
                    if (prop.hasGetter()) {
                        rename = naming.nameForGetterMethod(this._config, prop.getGetter(), fullName.getSimpleName());
                    } else if (prop.hasField()) {
                        rename = naming.nameForField(this._config, prop.getField(), fullName.getSimpleName());
                    }
                } else if (prop.hasSetter()) {
                    rename = naming.nameForSetterMethod(this._config, prop.getSetter(), fullName.getSimpleName());
                } else if (prop.hasConstructorParameter()) {
                    rename = naming.nameForConstructorParameter(this._config, prop.getConstructorParameter(), fullName.getSimpleName());
                } else if (prop.hasField()) {
                    rename = naming.nameForField(this._config, prop.getField(), fullName.getSimpleName());
                } else if (prop.hasGetter()) {
                    rename = naming.nameForGetterMethod(this._config, prop.getGetter(), fullName.getSimpleName());
                }
            }
            if (rename != null && !fullName.hasSimpleName(rename)) {
                prop = prop.withSimpleName(rename);
                simpleName = rename;
            } else {
                simpleName = fullName.getSimpleName();
            }
            POJOPropertyBuilder old = this._properties.get(simpleName);
            if (old == null) {
                this._properties.put(simpleName, prop);
            } else {
                old.addAll(prop);
            }
            _updateCreatorProperty(prop, this._creatorProperties);
        }
    }

    protected void _renameWithWrappers() {
        PropertyName wrapperName;
        Iterator<Map.Entry<String, POJOPropertyBuilder>> it = this._properties.entrySet().iterator();
        LinkedList<POJOPropertyBuilder> renamed = null;
        while (it.hasNext()) {
            Map.Entry<String, POJOPropertyBuilder> entry = it.next();
            POJOPropertyBuilder prop = entry.getValue();
            AnnotatedMember member = prop.getPrimaryMember();
            if (member != null && (wrapperName = this._annotationIntrospector.findWrapperName(member)) != null && wrapperName.hasSimpleName() && !wrapperName.equals(prop.getFullName())) {
                if (renamed == null) {
                    renamed = new LinkedList<>();
                }
                renamed.add(prop.withName(wrapperName));
                it.remove();
            }
        }
        if (renamed != null) {
            Iterator i$ = renamed.iterator();
            while (i$.hasNext()) {
                POJOPropertyBuilder prop2 = i$.next();
                String name = prop2.getName();
                POJOPropertyBuilder old = this._properties.get(name);
                if (old == null) {
                    this._properties.put(name, prop2);
                } else {
                    old.addAll(prop2);
                }
            }
        }
    }

    protected void reportProblem(String msg) {
        throw new IllegalArgumentException("Problem with definition of " + this._classDef + ": " + msg);
    }

    protected POJOPropertyBuilder _property(PropertyName name) {
        return _property(name.getSimpleName());
    }

    protected POJOPropertyBuilder _property(String implName) {
        POJOPropertyBuilder prop = this._properties.get(implName);
        if (prop == null) {
            prop = new POJOPropertyBuilder(new PropertyName(implName), this._annotationIntrospector, this._forSerialization);
            this._properties.put(implName, prop);
        }
        return prop;
    }

    private PropertyNamingStrategy _findNamingStrategy() {
        PropertyNamingStrategy pns;
        Object namingDef = this._annotationIntrospector == null ? null : this._annotationIntrospector.findNamingStrategy(this._classDef);
        if (namingDef == null) {
            return this._config.getPropertyNamingStrategy();
        }
        if (namingDef instanceof PropertyNamingStrategy) {
            return (PropertyNamingStrategy) namingDef;
        }
        if (!(namingDef instanceof Class)) {
            throw new IllegalStateException("AnnotationIntrospector returned PropertyNamingStrategy definition of type " + namingDef.getClass().getName() + "; expected type PropertyNamingStrategy or Class<PropertyNamingStrategy> instead");
        }
        Class<?> namingClass = (Class) namingDef;
        if (!PropertyNamingStrategy.class.isAssignableFrom(namingClass)) {
            throw new IllegalStateException("AnnotationIntrospector returned Class " + namingClass.getName() + "; expected Class<PropertyNamingStrategy>");
        }
        HandlerInstantiator hi = this._config.getHandlerInstantiator();
        if (hi != null && (pns = hi.namingStrategyInstance(this._config, this._classDef, namingClass)) != null) {
            return pns;
        }
        return (PropertyNamingStrategy) ClassUtil.createInstance(namingClass, this._config.canOverrideAccessModifiers());
    }

    protected void _updateCreatorProperty(POJOPropertyBuilder prop, List<POJOPropertyBuilder> creatorProperties) {
        if (creatorProperties != null) {
            int len = creatorProperties.size();
            for (int i = 0; i < len; i++) {
                if (creatorProperties.get(i).getInternalName().equals(prop.getInternalName())) {
                    creatorProperties.set(i, prop);
                    return;
                }
            }
        }
    }
}
