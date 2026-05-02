package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.PropertyMetadata;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.deser.CreatorProperty;
import com.fasterxml.jackson.databind.deser.ValueInstantiator;
import com.fasterxml.jackson.databind.introspect.AnnotatedParameter;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.Annotations;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/JsonLocationInstantiator.class */
public class JsonLocationInstantiator extends ValueInstantiator {
    @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
    public String getValueTypeDesc() {
        return JsonLocation.class.getName();
    }

    @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
    public boolean canCreateFromObjectWith() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
    public CreatorProperty[] getFromObjectArguments(DeserializationConfig config) {
        JavaType intType = config.constructType(Integer.TYPE);
        JavaType longType = config.constructType(Long.TYPE);
        return new CreatorProperty[]{creatorProp("sourceRef", config.constructType(Object.class), 0), creatorProp("byteOffset", longType, 1), creatorProp("charOffset", longType, 2), creatorProp("lineNr", intType, 3), creatorProp("columnNr", intType, 4)};
    }

    private static CreatorProperty creatorProp(String name, JavaType type, int index) {
        return new CreatorProperty(new PropertyName(name), type, (PropertyName) null, (TypeDeserializer) null, (Annotations) null, (AnnotatedParameter) null, index, (Object) null, PropertyMetadata.STD_REQUIRED);
    }

    @Override // com.fasterxml.jackson.databind.deser.ValueInstantiator
    public Object createFromObjectWith(DeserializationContext ctxt, Object[] args) {
        return new JsonLocation(args[0], _long(args[1]), _long(args[2]), _int(args[3]), _int(args[4]));
    }

    private static final long _long(Object o) {
        if (o == null) {
            return 0L;
        }
        return ((Number) o).longValue();
    }

    private static final int _int(Object o) {
        if (o == null) {
            return 0;
        }
        return ((Number) o).intValue();
    }
}
