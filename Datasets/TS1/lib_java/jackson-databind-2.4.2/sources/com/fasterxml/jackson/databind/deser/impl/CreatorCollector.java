package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.deser.CreatorProperty;
import com.fasterxml.jackson.databind.deser.ValueInstantiator;
import com.fasterxml.jackson.databind.deser.std.StdValueInstantiator;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.introspect.AnnotatedWithParams;
import com.fasterxml.jackson.databind.type.TypeBindings;
import com.fasterxml.jackson.databind.util.ClassUtil;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/CreatorCollector.class */
public class CreatorCollector {
    protected final BeanDescription _beanDesc;
    protected final boolean _canFixAccess;
    protected AnnotatedWithParams _defaultConstructor;
    protected AnnotatedWithParams _stringCreator;
    protected AnnotatedWithParams _intCreator;
    protected AnnotatedWithParams _longCreator;
    protected AnnotatedWithParams _doubleCreator;
    protected AnnotatedWithParams _booleanCreator;
    protected AnnotatedWithParams _delegateCreator;
    protected CreatorProperty[] _delegateArgs;
    protected AnnotatedWithParams _propertyBasedCreator;
    protected CreatorProperty[] _propertyBasedArgs = null;
    protected AnnotatedParameter _incompleteParameter;

    public CreatorCollector(BeanDescription beanDesc, boolean canFixAccess) {
        this._beanDesc = beanDesc;
        this._canFixAccess = canFixAccess;
    }

    public ValueInstantiator constructValueInstantiator(DeserializationConfig config) {
        JavaType delegateType;
        boolean maybeVanilla = this._delegateCreator == null;
        if (maybeVanilla) {
            delegateType = null;
        } else {
            int ix = 0;
            if (this._delegateArgs != null) {
                int i = 0;
                int len = this._delegateArgs.length;
                while (true) {
                    if (i >= len) {
                        break;
                    }
                    if (this._delegateArgs[i] != null) {
                        i++;
                    } else {
                        ix = i;
                        break;
                    }
                }
            }
            TypeBindings bindings = this._beanDesc.bindingsForBeanType();
            delegateType = bindings.resolveType(this._delegateCreator.getGenericParameterType(ix));
        }
        JavaType type = this._beanDesc.getType();
        if (maybeVanilla & (this._propertyBasedCreator == null && this._delegateCreator == null && this._stringCreator == null && this._longCreator == null && this._doubleCreator == null && this._booleanCreator == null)) {
            Class<?> rawType = type.getRawClass();
            if (rawType == Collection.class || rawType == List.class || rawType == ArrayList.class) {
                return new Vanilla(1);
            }
            if (rawType == Map.class || rawType == LinkedHashMap.class) {
                return new Vanilla(2);
            }
            if (rawType == HashMap.class) {
                return new Vanilla(3);
            }
        }
        StdValueInstantiator inst = new StdValueInstantiator(config, type);
        inst.configureFromObjectSettings(this._defaultConstructor, this._delegateCreator, delegateType, this._delegateArgs, this._propertyBasedCreator, this._propertyBasedArgs);
        inst.configureFromStringCreator(this._stringCreator);
        inst.configureFromIntCreator(this._intCreator);
        inst.configureFromLongCreator(this._longCreator);
        inst.configureFromDoubleCreator(this._doubleCreator);
        inst.configureFromBooleanCreator(this._booleanCreator);
        inst.configureIncompleteParameter(this._incompleteParameter);
        return inst;
    }

    public void setDefaultCreator(AnnotatedWithParams creator) {
        this._defaultConstructor = (AnnotatedWithParams) _fixAccess(creator);
    }

    public void addStringCreator(AnnotatedWithParams creator) {
        this._stringCreator = verifyNonDup(creator, this._stringCreator, "String");
    }

    public void addIntCreator(AnnotatedWithParams creator) {
        this._intCreator = verifyNonDup(creator, this._intCreator, "int");
    }

    public void addLongCreator(AnnotatedWithParams creator) {
        this._longCreator = verifyNonDup(creator, this._longCreator, "long");
    }

    public void addDoubleCreator(AnnotatedWithParams creator) {
        this._doubleCreator = verifyNonDup(creator, this._doubleCreator, "double");
    }

    public void addBooleanCreator(AnnotatedWithParams creator) {
        this._booleanCreator = verifyNonDup(creator, this._booleanCreator, "boolean");
    }

    public void addDelegatingCreator(AnnotatedWithParams creator, CreatorProperty[] injectables) {
        this._delegateCreator = verifyNonDup(creator, this._delegateCreator, "delegate");
        this._delegateArgs = injectables;
    }

    public void addPropertyCreator(AnnotatedWithParams creator, CreatorProperty[] properties) {
        Integer old;
        this._propertyBasedCreator = verifyNonDup(creator, this._propertyBasedCreator, "property-based");
        if (properties.length > 1) {
            HashMap<String, Integer> names = new HashMap<>();
            int len = properties.length;
            for (int i = 0; i < len; i++) {
                String name = properties[i].getName();
                if ((name.length() != 0 || properties[i].getInjectableValueId() == null) && (old = names.put(name, Integer.valueOf(i))) != null) {
                    throw new IllegalArgumentException("Duplicate creator property \"" + name + "\" (index " + old + " vs " + i + ")");
                }
            }
        }
        this._propertyBasedArgs = properties;
    }

    public void addIncompeteParameter(AnnotatedParameter parameter) {
        if (this._incompleteParameter == null) {
            this._incompleteParameter = parameter;
        }
    }

    public boolean hasDefaultCreator() {
        return this._defaultConstructor != null;
    }

    private <T extends AnnotatedMember> T _fixAccess(T member) {
        if (member != null && this._canFixAccess) {
            ClassUtil.checkAndFixAccess((Member) member.getAnnotated());
        }
        return member;
    }

    protected AnnotatedWithParams verifyNonDup(AnnotatedWithParams newOne, AnnotatedWithParams oldOne, String type) {
        if (oldOne != null && oldOne.getClass() == newOne.getClass()) {
            throw new IllegalArgumentException("Conflicting " + type + " creators: already had " + oldOne + ", encountered " + newOne);
        }
        return (AnnotatedWithParams) _fixAccess(newOne);
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/CreatorCollector$Vanilla.class */
    protected static final class Vanilla extends ValueInstantiator implements Serializable {
        private static final long serialVersionUID = 1;
        public static final int TYPE_COLLECTION = 1;
        public static final int TYPE_MAP = 2;
        public static final int TYPE_HASH_MAP = 3;
        private final int _type;

        public Vanilla(int t) {
            this._type = t;
        }

        @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
        public String getValueTypeDesc() {
            switch (this._type) {
                case 1:
                    return ArrayList.class.getName();
                case 2:
                    return LinkedHashMap.class.getName();
                case 3:
                    return HashMap.class.getName();
                default:
                    return Object.class.getName();
            }
        }

        @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
        public boolean canInstantiate() {
            return true;
        }

        @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
        public boolean canCreateUsingDefault() {
            return true;
        }

        @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
        public Object createUsingDefault(DeserializationContext ctxt) throws IOException {
            switch (this._type) {
                case 1:
                    return new ArrayList();
                case 2:
                    return new LinkedHashMap();
                case 3:
                    return new HashMap();
                default:
                    throw new IllegalStateException("Unknown type " + this._type);
            }
        }
    }
}
