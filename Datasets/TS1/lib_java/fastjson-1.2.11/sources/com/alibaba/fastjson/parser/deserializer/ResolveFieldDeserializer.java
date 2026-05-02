package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.util.TypeUtils;
import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/ResolveFieldDeserializer.class */
public final class ResolveFieldDeserializer extends FieldDeserializer {
    private final int index;
    private final List list;
    private final DefaultJSONParser parser;
    private final Object key;
    private final Map map;
    private final Collection collection;

    public ResolveFieldDeserializer(DefaultJSONParser parser, List list, int index) {
        super(null, null);
        this.parser = parser;
        this.index = index;
        this.list = list;
        this.key = null;
        this.map = null;
        this.collection = null;
    }

    public ResolveFieldDeserializer(Map map, Object index) {
        super(null, null);
        this.parser = null;
        this.index = -1;
        this.list = null;
        this.key = index;
        this.map = map;
        this.collection = null;
    }

    public ResolveFieldDeserializer(Collection collection) {
        super(null, null);
        this.parser = null;
        this.index = -1;
        this.list = null;
        this.key = null;
        this.map = null;
        this.collection = collection;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.FieldDeserializer
    public void setValue(Object object, Object value) {
        JSONArray jsonArray;
        Object array;
        Object item;
        if (this.map != null) {
            this.map.put(this.key, value);
            return;
        }
        if (this.collection != null) {
            this.collection.add(value);
            return;
        }
        this.list.set(this.index, value);
        if ((this.list instanceof JSONArray) && (array = (jsonArray = (JSONArray) this.list).getRelatedArray()) != null) {
            int arrayLength = Array.getLength(array);
            if (arrayLength > this.index) {
                if (jsonArray.getComponentType() != null) {
                    item = TypeUtils.cast(value, jsonArray.getComponentType(), this.parser.getConfig());
                } else {
                    item = value;
                }
                Array.set(array, this.index, item);
            }
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.FieldDeserializer
    public void parseField(DefaultJSONParser parser, Object object, Type objectType, Map<String, Object> fieldValues) {
    }
}
