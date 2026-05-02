package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/MapSerializer.class */
public class MapSerializer extends SerializeFilterable implements ObjectSerializer {
    public static MapSerializer instance = new MapSerializer();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull();
            return;
        }
        Map<?, ?> map = (Map) object;
        if (serializer.containsReference(object)) {
            serializer.writeReference(object);
            return;
        }
        SerialContext parent = serializer.context;
        serializer.setContext(parent, object, fieldName, 0);
        try {
            out.write(123);
            serializer.incrementIndent();
            Class<?> preClazz = null;
            ObjectSerializer preWriter = null;
            boolean first = true;
            if (out.isEnabled(SerializerFeature.WriteClassName)) {
                Class<?> mapClass = map.getClass();
                boolean containsKey = (mapClass == JSONObject.class || mapClass == HashMap.class || mapClass == LinkedHashMap.class) && map.containsKey(JSON.DEFAULT_TYPE_KEY);
                if (!containsKey) {
                    out.writeFieldName(JSON.DEFAULT_TYPE_KEY);
                    out.writeString(object.getClass().getName());
                    first = false;
                }
            }
            for (Map.Entry entry : map.entrySet()) {
                Object value = entry.getValue();
                Object entryKey = entry.getKey();
                List<PropertyPreFilter> preFilters = serializer.propertyPreFilters;
                if (preFilters != null && preFilters.size() > 0) {
                    if (entryKey == null || (entryKey instanceof String)) {
                        if (!serializer.applyName(this, object, (String) entryKey)) {
                        }
                    } else if (entryKey.getClass().isPrimitive() || (entryKey instanceof Number)) {
                        String strKey = JSON.toJSONString(entryKey);
                        if (!serializer.applyName(this, object, strKey)) {
                        }
                    }
                }
                List<PropertyFilter> propertyFilters = serializer.propertyFilters;
                if (propertyFilters != null && propertyFilters.size() > 0) {
                    if (entryKey == null || (entryKey instanceof String)) {
                        if (!serializer.apply(this, object, (String) entryKey, value)) {
                        }
                    } else if (entryKey.getClass().isPrimitive() || (entryKey instanceof Number)) {
                        String strKey2 = JSON.toJSONString(entryKey);
                        if (!serializer.apply(this, object, strKey2, value)) {
                        }
                    }
                }
                List<NameFilter> nameFilters = serializer.nameFilters;
                if (nameFilters != null && nameFilters.size() > 0) {
                    if (entryKey == null || (entryKey instanceof String)) {
                        entryKey = serializer.processKey(this, object, (String) entryKey, value);
                    } else if (entryKey.getClass().isPrimitive() || (entryKey instanceof Number)) {
                        String strKey3 = JSON.toJSONString(entryKey);
                        entryKey = serializer.processKey(this, object, strKey3, value);
                    }
                }
                List<ValueFilter> valueFilters = serializer.valueFilters;
                List<ContextValueFilter> contextValueFilters = serializer.contextValueFilters;
                if ((valueFilters != null && valueFilters.size() > 0) || (contextValueFilters != null && contextValueFilters.size() > 0)) {
                    if (entryKey == null || (entryKey instanceof String)) {
                        value = serializer.processValue(this, null, object, (String) entryKey, value);
                    } else if (entryKey.getClass().isPrimitive() || (entryKey instanceof Number)) {
                        String strKey4 = JSON.toJSONString(entryKey);
                        value = serializer.processValue(this, null, object, strKey4, value);
                    }
                }
                if (value != null || out.isEnabled(SerializerFeature.WriteMapNullValue)) {
                    if (entryKey instanceof String) {
                        String key = (String) entryKey;
                        if (!first) {
                            out.write(44);
                        }
                        if (out.isEnabled(SerializerFeature.PrettyFormat)) {
                            serializer.println();
                        }
                        out.writeFieldName(key, true);
                    } else {
                        if (!first) {
                            out.write(44);
                        }
                        if (out.isEnabled(SerializerFeature.BrowserCompatible) || out.isEnabled(SerializerFeature.WriteNonStringKeyAsString) || out.isEnabled(SerializerFeature.BrowserSecure)) {
                            String strEntryKey = JSON.toJSONString(entryKey);
                            serializer.write(strEntryKey);
                        } else {
                            serializer.write(entryKey);
                        }
                        out.write(58);
                    }
                    first = false;
                    if (value == null) {
                        out.writeNull();
                    } else {
                        Class<?> clazz = value.getClass();
                        if (clazz == preClazz) {
                            preWriter.write(serializer, value, entryKey, null, 0);
                        } else {
                            preClazz = clazz;
                            preWriter = serializer.getObjectWriter(clazz);
                            preWriter.write(serializer, value, entryKey, null, 0);
                        }
                    }
                }
            }
            serializer.decrementIdent();
            if (out.isEnabled(SerializerFeature.PrettyFormat) && map.size() > 0) {
                serializer.println();
            }
            out.write(125);
        } finally {
            serializer.context = parent;
        }
    }
}
