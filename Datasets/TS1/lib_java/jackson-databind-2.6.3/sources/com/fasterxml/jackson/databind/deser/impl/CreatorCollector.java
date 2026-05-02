package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.deser.CreatorProperty;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
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

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/impl/CreatorCollector.class */
public class CreatorCollector {
    protected static final int C_DEFAULT = 0;
    protected static final int C_STRING = 1;
    protected static final int C_INT = 2;
    protected static final int C_LONG = 3;
    protected static final int C_DOUBLE = 4;
    protected static final int C_BOOLEAN = 5;
    protected static final int C_DELEGATE = 6;
    protected static final int C_PROPS = 7;
    protected static final String[] TYPE_DESCS = {"default", "String", "int", "long", "double", "boolean", "delegate", "property-based"};
    protected final BeanDescription _beanDesc;
    protected final boolean _canFixAccess;
    protected final AnnotatedWithParams[] _creators = new AnnotatedWithParams[8];
    protected int _explicitCreators = C_DEFAULT;
    protected boolean _hasNonDefaultCreator = false;
    protected SettableBeanProperty[] _delegateArgs;
    protected SettableBeanProperty[] _propertyBasedArgs;
    protected AnnotatedParameter _incompleteParameter;

    public CreatorCollector(BeanDescription beanDesc, boolean canFixAccess) {
        this._beanDesc = beanDesc;
        this._canFixAccess = canFixAccess;
    }

    public ValueInstantiator constructValueInstantiator(DeserializationConfig config) {
        JavaType delegateType;
        boolean maybeVanilla = !this._hasNonDefaultCreator;
        if (maybeVanilla || this._creators[6] == null) {
            delegateType = C_DEFAULT;
        } else {
            int ix = C_DEFAULT;
            if (this._delegateArgs != null) {
                int i = C_DEFAULT;
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
            delegateType = bindings.resolveType(this._creators[6].getGenericParameterType(ix));
        }
        JavaType type = this._beanDesc.getType();
        if (maybeVanilla & (!this._hasNonDefaultCreator)) {
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
        inst.configureFromObjectSettings(this._creators[C_DEFAULT], this._creators[6], delegateType, this._delegateArgs, this._creators[7], this._propertyBasedArgs);
        inst.configureFromStringCreator(this._creators[1]);
        inst.configureFromIntCreator(this._creators[2]);
        inst.configureFromLongCreator(this._creators[3]);
        inst.configureFromDoubleCreator(this._creators[4]);
        inst.configureFromBooleanCreator(this._creators[5]);
        inst.configureIncompleteParameter(this._incompleteParameter);
        return inst;
    }

    public void setDefaultCreator(AnnotatedWithParams creator) {
        this._creators[C_DEFAULT] = (AnnotatedWithParams) _fixAccess(creator);
    }

    public void addStringCreator(AnnotatedWithParams creator, boolean explicit) {
        verifyNonDup(creator, 1, explicit);
    }

    public void addIntCreator(AnnotatedWithParams creator, boolean explicit) {
        verifyNonDup(creator, 2, explicit);
    }

    public void addLongCreator(AnnotatedWithParams creator, boolean explicit) {
        verifyNonDup(creator, 3, explicit);
    }

    public void addDoubleCreator(AnnotatedWithParams creator, boolean explicit) {
        verifyNonDup(creator, 4, explicit);
    }

    public void addBooleanCreator(AnnotatedWithParams creator, boolean explicit) {
        verifyNonDup(creator, 5, explicit);
    }

    public void addDelegatingCreator(AnnotatedWithParams creator, boolean explicit, SettableBeanProperty[] injectables) {
        verifyNonDup(creator, 6, explicit);
        this._delegateArgs = injectables;
    }

    public void addPropertyCreator(AnnotatedWithParams creator, boolean explicit, SettableBeanProperty[] properties) {
        Integer old;
        verifyNonDup(creator, 7, explicit);
        if (properties.length > 1) {
            HashMap<String, Integer> names = new HashMap<>();
            int len = properties.length;
            for (int i = C_DEFAULT; i < len; i++) {
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

    @Deprecated
    public void addStringCreator(AnnotatedWithParams creator) {
        addStringCreator(creator, false);
    }

    @Deprecated
    public void addIntCreator(AnnotatedWithParams creator) {
        addBooleanCreator(creator, false);
    }

    @Deprecated
    public void addLongCreator(AnnotatedWithParams creator) {
        addBooleanCreator(creator, false);
    }

    @Deprecated
    public void addDoubleCreator(AnnotatedWithParams creator) {
        addBooleanCreator(creator, false);
    }

    @Deprecated
    public void addBooleanCreator(AnnotatedWithParams creator) {
        addBooleanCreator(creator, false);
    }

    @Deprecated
    public void addDelegatingCreator(AnnotatedWithParams creator, CreatorProperty[] injectables) {
        addDelegatingCreator(creator, false, injectables);
    }

    @Deprecated
    public void addPropertyCreator(AnnotatedWithParams creator, CreatorProperty[] properties) {
        addPropertyCreator(creator, false, properties);
    }

    public boolean hasDefaultCreator() {
        return this._creators[C_DEFAULT] != null;
    }

    public boolean hasDelegatingCreator() {
        return this._creators[6] != null;
    }

    public boolean hasPropertyBasedCreator() {
        return this._creators[7] != null;
    }

    private <T extends AnnotatedMember> T _fixAccess(T member) {
        if (member != null && this._canFixAccess) {
            ClassUtil.checkAndFixAccess((Member) member.getAnnotated());
        }
        return member;
    }

    protected void verifyNonDup(AnnotatedWithParams newOne, int typeIndex, boolean explicit) {
        boolean verify;
        int mask = 1 << typeIndex;
        this._hasNonDefaultCreator = true;
        AnnotatedWithParams oldOne = this._creators[typeIndex];
        if (oldOne != null) {
            if ((this._explicitCreators & mask) != 0) {
                if (!explicit) {
                    return;
                } else {
                    verify = true;
                }
            } else {
                verify = !explicit;
            }
            if (verify && oldOne.getClass() == newOne.getClass()) {
                Class<?> oldType = oldOne.getRawParameterType(C_DEFAULT);
                Class<?> newType = newOne.getRawParameterType(C_DEFAULT);
                if (oldType == newType) {
                    throw new IllegalArgumentException("Conflicting " + TYPE_DESCS[typeIndex] + " creators: already had explicitly marked " + oldOne + ", encountered " + newOne);
                }
                if (newType.isAssignableFrom(oldType)) {
                    return;
                }
            }
        }
        if (explicit) {
            this._explicitCreators |= mask;
        }
        this._creators[typeIndex] = (AnnotatedWithParams) _fixAccess(newOne);
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/impl/CreatorCollector$Vanilla.class */
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
