package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.SettableAnyProperty;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.deser.impl.PropertyValue;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer.class */
public final class PropertyValueBuffer {
    protected final JsonParser _parser;
    protected final DeserializationContext _context;
    protected final Object[] _creatorParameters;
    protected final ObjectIdReader _objectIdReader;
    private int _paramsNeeded;
    private PropertyValue _buffered;
    private Object _idValue;

    public PropertyValueBuffer(JsonParser jp, DeserializationContext ctxt, int paramCount, ObjectIdReader oir) {
        this._parser = jp;
        this._context = ctxt;
        this._paramsNeeded = paramCount;
        this._objectIdReader = oir;
        this._creatorParameters = new Object[paramCount];
    }

    public void inject(SettableBeanProperty[] injectableProperties) {
        int len = injectableProperties.length;
        for (int i = 0; i < len; i++) {
            SettableBeanProperty prop = injectableProperties[i];
            if (prop != null) {
                this._creatorParameters[i] = this._context.findInjectableValue(prop.getInjectableValueId(), prop, null);
            }
        }
    }

    protected final Object[] getParameters(Object[] defaults) {
        Object value;
        if (defaults != null) {
            int len = this._creatorParameters.length;
            for (int i = 0; i < len; i++) {
                if (this._creatorParameters[i] == null && (value = defaults[i]) != null) {
                    this._creatorParameters[i] = value;
                }
            }
        }
        return this._creatorParameters;
    }

    public boolean readIdProperty(String propName) throws IOException {
        if (this._objectIdReader != null && propName.equals(this._objectIdReader.propertyName.getSimpleName())) {
            this._idValue = this._objectIdReader.readObjectReference(this._parser, this._context);
            return true;
        }
        return false;
    }

    public Object handleIdValue(DeserializationContext ctxt, Object bean) throws IOException {
        if (this._objectIdReader != null) {
            if (this._idValue != null) {
                ReadableObjectId roid = ctxt.findObjectId(this._idValue, this._objectIdReader.generator, this._objectIdReader.resolver);
                roid.bindItem(bean);
                SettableBeanProperty idProp = this._objectIdReader.idProperty;
                if (idProp != null) {
                    return idProp.setAndReturn(bean, this._idValue);
                }
            } else {
                throw ctxt.mappingException("No _idValue when handleIdValue called, on instance of " + bean.getClass().getName());
            }
        }
        return bean;
    }

    protected PropertyValue buffered() {
        return this._buffered;
    }

    public boolean isComplete() {
        return this._paramsNeeded <= 0;
    }

    public boolean assignParameter(int index, Object value) {
        this._creatorParameters[index] = value;
        int i = this._paramsNeeded - 1;
        this._paramsNeeded = i;
        return i <= 0;
    }

    public void bufferProperty(SettableBeanProperty prop, Object value) {
        this._buffered = new PropertyValue.Regular(this._buffered, value, prop);
    }

    public void bufferAnyProperty(SettableAnyProperty prop, String propName, Object value) {
        this._buffered = new PropertyValue.Any(this._buffered, value, prop, propName);
    }

    public void bufferMapProperty(Object key, Object value) {
        this._buffered = new PropertyValue.Map(this._buffered, value, key);
    }
}
