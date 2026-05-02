package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.util.FieldInfo;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/FieldSerializer.class */
public class FieldSerializer implements Comparable<FieldSerializer> {
    public final FieldInfo fieldInfo;
    protected final boolean writeNull;
    protected int features;
    private final String double_quoted_fieldPrefix;
    private String single_quoted_fieldPrefix;
    private String un_quoted_fieldPrefix;
    protected BeanContext fieldContext;
    private String format;
    protected boolean writeEnumUsingToString;
    protected boolean writeEnumUsingName;
    private RuntimeSerializerInfo runtimeInfo;

    public FieldSerializer(Class<?> beanType, FieldInfo fieldInfo) {
        this.writeEnumUsingToString = false;
        this.writeEnumUsingName = false;
        this.fieldInfo = fieldInfo;
        this.fieldContext = new BeanContext(beanType, fieldInfo);
        fieldInfo.setAccessible();
        this.double_quoted_fieldPrefix = '\"' + fieldInfo.name + "\":";
        boolean writeNull = false;
        JSONField annotation = fieldInfo.getAnnotation();
        if (annotation != null) {
            SerializerFeature[] serialzeFeatures = annotation.serialzeFeatures();
            int length = serialzeFeatures.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                if (serialzeFeatures[i] != SerializerFeature.WriteMapNullValue) {
                    i++;
                } else {
                    writeNull = true;
                    break;
                }
            }
            this.format = annotation.format();
            if (this.format.trim().length() == 0) {
                this.format = null;
            }
            for (SerializerFeature feature : annotation.serialzeFeatures()) {
                if (feature == SerializerFeature.WriteEnumUsingToString) {
                    this.writeEnumUsingToString = true;
                } else if (feature == SerializerFeature.WriteEnumUsingName) {
                    this.writeEnumUsingName = true;
                }
            }
            this.features = SerializerFeature.of(annotation.serialzeFeatures());
        }
        this.writeNull = writeNull;
    }

    public void writePrefix(JSONSerializer serializer) throws IOException {
        SerializeWriter out = serializer.out;
        if (out.quoteFieldNames) {
            if (out.useSingleQuotes) {
                if (this.single_quoted_fieldPrefix == null) {
                    this.single_quoted_fieldPrefix = '\'' + this.fieldInfo.name + "':";
                }
                out.write(this.single_quoted_fieldPrefix);
                return;
            }
            out.write(this.double_quoted_fieldPrefix);
            return;
        }
        if (this.un_quoted_fieldPrefix == null) {
            this.un_quoted_fieldPrefix = this.fieldInfo.name + ":";
        }
        out.write(this.un_quoted_fieldPrefix);
    }

    public Object getPropertyValue(Object object) throws InvocationTargetException, IllegalAccessException {
        return this.fieldInfo.get(object);
    }

    @Override // java.lang.Comparable
    public int compareTo(FieldSerializer o) {
        return this.fieldInfo.compareTo(o.fieldInfo);
    }

    public void writeValue(JSONSerializer serializer, Object propertyValue) throws Exception {
        Class<?> runtimeFieldClass;
        if (this.format != null) {
            serializer.writeWithFormat(propertyValue, this.format);
            return;
        }
        if (this.runtimeInfo == null) {
            if (propertyValue == null) {
                runtimeFieldClass = this.fieldInfo.fieldClass;
            } else {
                runtimeFieldClass = propertyValue.getClass();
            }
            this.runtimeInfo = new RuntimeSerializerInfo(serializer.getObjectWriter(runtimeFieldClass), runtimeFieldClass);
        }
        RuntimeSerializerInfo runtimeInfo = this.runtimeInfo;
        int fieldFeatures = this.fieldInfo.serialzeFeatures;
        if (propertyValue == null) {
            Class<?> runtimeFieldClass2 = runtimeInfo.runtimeFieldClass;
            SerializeWriter out = serializer.out;
            if (Number.class.isAssignableFrom(runtimeFieldClass2)) {
                out.writeNull(this.features, SerializerFeature.WriteNullNumberAsZero.mask);
                return;
            }
            if (String.class == runtimeFieldClass2) {
                out.writeNull(this.features, SerializerFeature.WriteNullStringAsEmpty.mask);
                return;
            }
            if (Boolean.class == runtimeFieldClass2) {
                out.writeNull(this.features, SerializerFeature.WriteNullBooleanAsFalse.mask);
                return;
            }
            if (Collection.class.isAssignableFrom(runtimeFieldClass2)) {
                out.writeNull(this.features, SerializerFeature.WriteNullListAsEmpty.mask);
                return;
            }
            ObjectSerializer fieldSerializer = runtimeInfo.fieldSerializer;
            if (out.isEnabled(SerializerFeature.WriteMapNullValue) && (fieldSerializer instanceof JavaBeanSerializer)) {
                out.writeNull();
                return;
            } else {
                fieldSerializer.write(serializer, null, this.fieldInfo.name, this.fieldInfo.fieldType, fieldFeatures);
                return;
            }
        }
        if (this.fieldInfo.isEnum) {
            if (this.writeEnumUsingName) {
                serializer.out.writeString(((Enum) propertyValue).name());
                return;
            } else if (this.writeEnumUsingToString) {
                serializer.out.writeString(((Enum) propertyValue).toString());
                return;
            }
        }
        Class<?> valueClass = propertyValue.getClass();
        if (valueClass == runtimeInfo.runtimeFieldClass) {
            runtimeInfo.fieldSerializer.write(serializer, propertyValue, this.fieldInfo.name, this.fieldInfo.fieldType, fieldFeatures);
        } else {
            ObjectSerializer valueSerializer = serializer.getObjectWriter(valueClass);
            valueSerializer.write(serializer, propertyValue, this.fieldInfo.name, this.fieldInfo.fieldType, fieldFeatures);
        }
    }

    /* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo.class */
    static class RuntimeSerializerInfo {
        ObjectSerializer fieldSerializer;
        Class<?> runtimeFieldClass;

        public RuntimeSerializerInfo(ObjectSerializer fieldSerializer, Class<?> runtimeFieldClass) {
            this.fieldSerializer = fieldSerializer;
            this.runtimeFieldClass = runtimeFieldClass;
        }
    }
}
