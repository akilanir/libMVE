package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.util.Annotations;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/ValueInjector.class */
public class ValueInjector extends BeanProperty.Std {
    protected final Object _valueId;

    public ValueInjector(PropertyName propName, JavaType type, Annotations contextAnnotations, AnnotatedMember mutator, Object valueId) {
        super(propName, type, (PropertyName) null, contextAnnotations, mutator, PropertyMetadata.STD_OPTIONAL);
        this._valueId = valueId;
    }

    @Deprecated
    public ValueInjector(String propName, JavaType type, Annotations contextAnnotations, AnnotatedMember mutator, Object valueId) {
        this(new PropertyName(propName), type, contextAnnotations, mutator, valueId);
    }

    public Object findValue(DeserializationContext context, Object beanInstance) {
        return context.findInjectableValue(this._valueId, this, beanInstance);
    }

    public void inject(DeserializationContext context, Object beanInstance) throws IOException {
        this._member.setValue(beanInstance, findValue(context, beanInstance));
    }
}
