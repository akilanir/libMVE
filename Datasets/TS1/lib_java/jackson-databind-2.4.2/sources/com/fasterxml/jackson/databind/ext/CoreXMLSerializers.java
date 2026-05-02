package com.fasterxml.jackson.databind.ext;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.ser.Serializers;
import com.fasterxml.jackson.databind.ser.std.CalendarSerializer;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Calendar;
import javax.xml.datatype.Duration;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ext/CoreXMLSerializers.class */
public class CoreXMLSerializers extends Serializers.Base {
    @Override // com.fasterxml.jackson.databind.ser.Serializers.Base, com.fasterxml.jackson.databind.ser.Serializers
    public JsonSerializer<?> findSerializer(SerializationConfig config, JavaType type, BeanDescription beanDesc) {
        Class<?> raw = type.getRawClass();
        if (Duration.class.isAssignableFrom(raw) || QName.class.isAssignableFrom(raw)) {
            return ToStringSerializer.instance;
        }
        if (XMLGregorianCalendar.class.isAssignableFrom(raw)) {
            return new XMLGregorianCalendarSerializer();
        }
        return null;
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ext/CoreXMLSerializers$XMLGregorianCalendarSerializer.class */
    public static class XMLGregorianCalendarSerializer extends StdSerializer<XMLGregorianCalendar> {
        public XMLGregorianCalendarSerializer() {
            super(XMLGregorianCalendar.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(XMLGregorianCalendar value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            CalendarSerializer.instance.serialize((Calendar) value.toGregorianCalendar(), jgen, provider);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
        public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
            return CalendarSerializer.instance.getSchema(provider, typeHint);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
        public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
            CalendarSerializer.instance.acceptJsonFormatVisitor(visitor, null);
        }
    }
}
