package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.annotation.JSONType;
import com.alibaba.fastjson.util.FieldInfo;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/JavaBeanSerializer.class */
public class JavaBeanSerializer extends SerializeFilterable implements ObjectSerializer {
    protected final FieldSerializer[] getters;
    protected final FieldSerializer[] sortedGetters;
    protected int features;
    protected final Class<?> beanType;
    protected String typeName;
    protected final JSONType jsonType;

    public JavaBeanSerializer(Class<?> beanType) {
        this(beanType, (Map<String, String>) null);
    }

    public JavaBeanSerializer(Class<?> beanType, String... aliasList) {
        this(beanType, createAliasMap(aliasList));
    }

    static Map<String, String> createAliasMap(String... aliasList) {
        Map<String, String> aliasMap = new HashMap<>();
        for (String alias : aliasList) {
            aliasMap.put(alias, alias);
        }
        return aliasMap;
    }

    public JavaBeanSerializer(Class<?> beanType, Map<String, String> aliasMap) {
        this(beanType, aliasMap, TypeUtils.getSerializeFeatures(beanType));
    }

    public JavaBeanSerializer(Class<?> beanType, Map<String, String> aliasMap, int features) {
        this.features = 0;
        this.features = features;
        this.beanType = beanType;
        this.jsonType = (JSONType) beanType.getAnnotation(JSONType.class);
        if (this.jsonType != null) {
            SerializerFeature.of(this.jsonType.serialzeFeatures());
        }
        List<FieldSerializer> getterList = new ArrayList<>();
        List<FieldInfo> fieldInfoList = TypeUtils.computeGetters(beanType, this.jsonType, aliasMap, false);
        for (FieldInfo fieldInfo : fieldInfoList) {
            getterList.add(new FieldSerializer(beanType, fieldInfo));
        }
        this.getters = (FieldSerializer[]) getterList.toArray(new FieldSerializer[getterList.size()]);
        String[] orders = null;
        if (this.jsonType != null) {
            orders = this.jsonType.orders();
            String typeName = this.jsonType.typeName();
            if (typeName.length() != 0) {
                this.typeName = typeName;
            }
        }
        if (orders != null && orders.length != 0) {
            List<FieldInfo> fieldInfoList2 = TypeUtils.computeGetters(beanType, this.jsonType, aliasMap, true);
            List<FieldSerializer> getterList2 = new ArrayList<>();
            for (FieldInfo fieldInfo2 : fieldInfoList2) {
                FieldSerializer fieldDeser = new FieldSerializer(beanType, fieldInfo2);
                getterList2.add(fieldDeser);
            }
            this.sortedGetters = (FieldSerializer[]) getterList2.toArray(new FieldSerializer[getterList2.size()]);
            return;
        }
        FieldSerializer[] sortedGetters = new FieldSerializer[this.getters.length];
        System.arraycopy(this.getters, 0, sortedGetters, 0, this.getters.length);
        Arrays.sort(sortedGetters);
        if (Arrays.equals(sortedGetters, this.getters)) {
            this.sortedGetters = this.getters;
        } else {
            this.sortedGetters = sortedGetters;
        }
    }

    public void writeDirectNonContext(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        write(serializer, object, fieldName, fieldType, features);
    }

    public void writeAsArrayNonContext(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        write(serializer, object, fieldName, fieldType, features);
    }

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        FieldSerializer[] getters;
        Object propertyValue;
        Class<?> fieldCLass;
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull();
            return;
        }
        if (writeReference(serializer, object, features)) {
            return;
        }
        if (out.sortField) {
            getters = this.sortedGetters;
        } else {
            getters = this.getters;
        }
        SerialContext parent = serializer.context;
        serializer.setContext(parent, object, fieldName, this.features, features);
        boolean writeAsArray = isWriteAsArray(serializer);
        try {
            char startSeperator = writeAsArray ? '[' : '{';
            try {
                char endSeperator = writeAsArray ? ']' : '}';
                out.append(startSeperator);
                if (getters.length > 0 && out.isEnabled(SerializerFeature.PrettyFormat)) {
                    serializer.incrementIndent();
                    serializer.println();
                }
                boolean commaFlag = false;
                if ((this.features & SerializerFeature.WriteClassName.mask) != 0 || serializer.isWriteClassName(fieldType, object)) {
                    Class<?> objClass = object.getClass();
                    if (objClass != fieldType) {
                        out.writeFieldName(JSON.DEFAULT_TYPE_KEY, false);
                        if (this.typeName == null) {
                            this.typeName = object.getClass().getName();
                        }
                        serializer.write(this.typeName);
                        commaFlag = true;
                    }
                }
                char seperator = commaFlag ? ',' : (char) 0;
                boolean directWritePrefix = out.quoteFieldNames && !out.useSingleQuotes;
                char newSeperator = serializer.writeBefore(this, object, seperator);
                boolean commaFlag2 = newSeperator == ',';
                boolean skipTransient = out.isEnabled(SerializerFeature.SkipTransientField);
                boolean ignoreNonFieldGetter = out.isEnabled(SerializerFeature.IgnoreNonFieldGetter);
                for (int i = 0; i < getters.length; i++) {
                    FieldSerializer fieldSerializer = getters[i];
                    Field field = fieldSerializer.fieldInfo.field;
                    FieldInfo fieldInfo = fieldSerializer.fieldInfo;
                    String fieldInfoName = fieldInfo.name;
                    Class<?> fieldClass = fieldInfo.fieldClass;
                    if ((!skipTransient || field == null || !fieldInfo.fieldTransient) && ((!ignoreNonFieldGetter || field != null) && serializer.applyName(this, object, fieldInfo.name) && serializer.applyLabel(this, fieldInfo.label))) {
                        try {
                            propertyValue = fieldSerializer.getPropertyValue(object);
                        } catch (InvocationTargetException ex) {
                            if (out.isEnabled(SerializerFeature.IgnoreErrorGetter)) {
                                propertyValue = null;
                            } else {
                                throw ex;
                            }
                        }
                        if (serializer.apply(this, object, fieldInfoName, propertyValue)) {
                            String key = serializer.processKey(this, object, fieldInfoName, propertyValue);
                            Object originalValue = propertyValue;
                            Object propertyValue2 = serializer.processValue(this, fieldSerializer.fieldContext, object, fieldInfoName, propertyValue);
                            if ((propertyValue2 != null || writeAsArray || fieldSerializer.writeNull || out.isEnabled(SerializerFeature.WriteMapNullValue)) && (propertyValue2 == null || !out.notWriteDefaultValue || (((fieldCLass = fieldInfo.fieldClass) != Byte.TYPE || !(propertyValue2 instanceof Byte) || ((Byte) propertyValue2).byteValue() != 0) && ((fieldCLass != Short.TYPE || !(propertyValue2 instanceof Short) || ((Short) propertyValue2).shortValue() != 0) && ((fieldCLass != Integer.TYPE || !(propertyValue2 instanceof Integer) || ((Integer) propertyValue2).intValue() != 0) && ((fieldCLass != Long.TYPE || !(propertyValue2 instanceof Long) || ((Long) propertyValue2).longValue() != 0) && ((fieldCLass != Float.TYPE || !(propertyValue2 instanceof Float) || ((Float) propertyValue2).floatValue() != 0.0f) && ((fieldCLass != Double.TYPE || !(propertyValue2 instanceof Double) || ((Double) propertyValue2).doubleValue() != 0.0d) && (fieldCLass != Boolean.TYPE || !(propertyValue2 instanceof Boolean) || ((Boolean) propertyValue2).booleanValue()))))))))) {
                                if (commaFlag2) {
                                    out.write(44);
                                    if (out.isEnabled(SerializerFeature.PrettyFormat)) {
                                        serializer.println();
                                    }
                                }
                                if (key != fieldInfoName) {
                                    if (!writeAsArray) {
                                        out.writeFieldName(key, true);
                                    }
                                    serializer.write(propertyValue2);
                                } else if (originalValue != propertyValue2) {
                                    if (!writeAsArray) {
                                        fieldSerializer.writePrefix(serializer);
                                    }
                                    serializer.write(propertyValue2);
                                } else {
                                    if (!writeAsArray) {
                                        if (directWritePrefix) {
                                            out.write(fieldInfo.name_chars, 0, fieldInfo.name_chars.length);
                                        } else {
                                            fieldSerializer.writePrefix(serializer);
                                        }
                                    }
                                    if (!writeAsArray && fieldClass == String.class) {
                                        if (propertyValue2 == null) {
                                            if ((out.features & SerializerFeature.WriteNullStringAsEmpty.mask) != 0 || (fieldSerializer.features & SerializerFeature.WriteNullStringAsEmpty.mask) != 0) {
                                                out.writeString("");
                                            } else {
                                                out.writeNull();
                                            }
                                        } else {
                                            String propertyValueString = (String) propertyValue2;
                                            if (out.useSingleQuotes) {
                                                out.writeStringWithSingleQuote(propertyValueString);
                                            } else {
                                                out.writeStringWithDoubleQuote(propertyValueString, (char) 0);
                                            }
                                        }
                                    } else {
                                        fieldSerializer.writeValue(serializer, propertyValue2);
                                    }
                                }
                                commaFlag2 = true;
                            }
                        }
                    }
                }
                serializer.writeAfter(this, object, commaFlag2 ? ',' : (char) 0);
                if (getters.length > 0 && out.isEnabled(SerializerFeature.PrettyFormat)) {
                    serializer.decrementIdent();
                    serializer.println();
                }
                out.append(endSeperator);
                serializer.context = parent;
            } catch (Exception e) {
                String errorMessage = "write javaBean error";
                if (object != null) {
                    errorMessage = errorMessage + ", class " + object.getClass().getName();
                }
                if (fieldName != null) {
                    errorMessage = errorMessage + ", fieldName : " + fieldName;
                }
                if (e.getMessage() != null) {
                    errorMessage = errorMessage + ", " + e.getMessage();
                }
                throw new JSONException(errorMessage, e);
            }
        } catch (Throwable th) {
            serializer.context = parent;
            throw th;
        }
    }

    public boolean writeReference(JSONSerializer serializer, Object object, int fieldFeatures) {
        SerialContext context = serializer.context;
        int mask = SerializerFeature.DisableCircularReferenceDetect.mask;
        if (context != null && (context.features & mask) == 0 && (fieldFeatures & mask) == 0 && serializer.references != null && serializer.references.containsKey(object)) {
            serializer.writeReference(object);
            return true;
        }
        return false;
    }

    public boolean isWriteAsArray(JSONSerializer serializer) {
        return (this.features & SerializerFeature.BeanToArray.mask) != 0 || serializer.out.beanToArray;
    }

    public FieldSerializer getFieldSerializer(String key) {
        if (key == null) {
            return null;
        }
        int low = 0;
        int high = this.sortedGetters.length - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            String fieldName = this.sortedGetters[mid].fieldInfo.name;
            int cmp = fieldName.compareTo(key);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return this.sortedGetters[mid];
            }
        }
        return null;
    }

    public List<Object> getFieldValues(Object object) throws Exception {
        List<Object> fieldValues = new ArrayList<>(this.sortedGetters.length);
        for (FieldSerializer getter : this.sortedGetters) {
            fieldValues.add(getter.getPropertyValue(object));
        }
        return fieldValues;
    }

    public int getSize(Object object) throws Exception {
        int size = 0;
        for (FieldSerializer getter : this.sortedGetters) {
            Object value = getter.getPropertyValue(object);
            if (value != null) {
                size++;
            }
        }
        return size;
    }

    public Map<String, Object> getFieldValuesMap(Object object) throws Exception {
        Map<String, Object> map = new LinkedHashMap<>(this.sortedGetters.length);
        for (FieldSerializer getter : this.sortedGetters) {
            map.put(getter.fieldInfo.name, getter.getPropertyValue(object));
        }
        return map;
    }

    protected BeanContext getBeanContext(int orinal) {
        return this.sortedGetters[orinal].fieldContext;
    }

    protected Type getFieldType(int ordinal) {
        return this.sortedGetters[ordinal].fieldInfo.fieldType;
    }
}
