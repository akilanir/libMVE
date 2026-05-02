package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.util.FieldInfo;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/JSONSerializer.class */
public class JSONSerializer extends SerializeFilterable {
    private final SerializeConfig config;
    public final SerializeWriter out;
    private int indentCount;
    private String indent;
    private String dateFormatPattern;
    private DateFormat dateFormat;
    protected IdentityHashMap<Object, SerialContext> references;
    protected SerialContext context;
    protected TimeZone timeZone;
    protected Locale locale;

    public JSONSerializer() {
        this(new SerializeWriter(), SerializeConfig.getGlobalInstance());
    }

    public JSONSerializer(SerializeWriter out) {
        this(out, SerializeConfig.getGlobalInstance());
    }

    public JSONSerializer(SerializeConfig config) {
        this(new SerializeWriter(), config);
    }

    public JSONSerializer(SerializeWriter out, SerializeConfig config) {
        this.indentCount = 0;
        this.indent = "\t";
        this.references = null;
        this.timeZone = JSON.defaultTimeZone;
        this.locale = JSON.defaultLocale;
        this.out = out;
        this.config = config;
    }

    public String getDateFormatPattern() {
        if (this.dateFormat instanceof SimpleDateFormat) {
            return ((SimpleDateFormat) this.dateFormat).toPattern();
        }
        return this.dateFormatPattern;
    }

    public DateFormat getDateFormat() {
        if (this.dateFormat == null && this.dateFormatPattern != null) {
            this.dateFormat = new SimpleDateFormat(this.dateFormatPattern, this.locale);
            this.dateFormat.setTimeZone(this.timeZone);
        }
        return this.dateFormat;
    }

    public void setDateFormat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
        if (this.dateFormatPattern != null) {
            this.dateFormatPattern = null;
        }
    }

    public void setDateFormat(String dateFormat) {
        this.dateFormatPattern = dateFormat;
        if (this.dateFormat != null) {
            this.dateFormat = null;
        }
    }

    public SerialContext getContext() {
        return this.context;
    }

    public void setContext(SerialContext context) {
        this.context = context;
    }

    public void setContext(SerialContext parent, Object object, Object fieldName, int features) {
        setContext(parent, object, fieldName, features, 0);
    }

    public void setContext(SerialContext parent, Object object, Object fieldName, int features, int fieldFeatures) {
        if (this.out.disableCircularReferenceDetect) {
            return;
        }
        this.context = new SerialContext(parent, object, fieldName, features, fieldFeatures);
        if (this.references == null) {
            this.references = new IdentityHashMap<>();
        }
        this.references.put(object, this.context);
    }

    public void setContext(Object object, Object fieldName) {
        setContext(this.context, object, fieldName, 0);
    }

    public void popContext() {
        if (this.context != null) {
            this.context = this.context.parent;
        }
    }

    public final boolean isWriteClassName(Type fieldType, Object obj) {
        return this.out.isEnabled(SerializerFeature.WriteClassName) && !(fieldType == null && this.out.isEnabled(SerializerFeature.NotWriteRootClassName) && this.context.parent == null);
    }

    public boolean containsReference(Object value) {
        return this.references != null && this.references.containsKey(value);
    }

    public void writeReference(Object object) {
        SerialContext rootContext;
        SerialContext context = this.context;
        Object current = context.object;
        if (object == current) {
            this.out.write("{\"$ref\":\"@\"}");
            return;
        }
        SerialContext parentContext = context.parent;
        if (parentContext != null && object == parentContext.object) {
            this.out.write("{\"$ref\":\"..\"}");
            return;
        }
        SerialContext serialContext = context;
        while (true) {
            rootContext = serialContext;
            if (rootContext.parent == null) {
                break;
            } else {
                serialContext = rootContext.parent;
            }
        }
        if (object == rootContext.object) {
            this.out.write("{\"$ref\":\"$\"}");
            return;
        }
        this.out.write("{\"$ref\":\"");
        this.out.write(this.references.get(object).toString());
        this.out.write("\"}");
    }

    public boolean checkValue(SerializeFilterable filterable) {
        return (this.valueFilters != null && this.valueFilters.size() > 0) || (this.contextValueFilters != null && this.contextValueFilters.size() > 0) || ((filterable.valueFilters != null && filterable.valueFilters.size() > 0) || ((filterable.contextValueFilters != null && filterable.contextValueFilters.size() > 0) || this.out.writeNonStringValueAsString));
    }

    public boolean hasNameFilters(SerializeFilterable filterable) {
        return (this.nameFilters != null && this.nameFilters.size() > 0) || (filterable.nameFilters != null && filterable.nameFilters.size() > 0);
    }

    public int getIndentCount() {
        return this.indentCount;
    }

    public void incrementIndent() {
        this.indentCount++;
    }

    public void decrementIdent() {
        this.indentCount--;
    }

    public void println() {
        this.out.write(10);
        for (int i = 0; i < this.indentCount; i++) {
            this.out.write(this.indent);
        }
    }

    public SerializeWriter getWriter() {
        return this.out;
    }

    public String toString() {
        return this.out.toString();
    }

    public void config(SerializerFeature feature, boolean state) {
        this.out.config(feature, state);
    }

    public boolean isEnabled(SerializerFeature feature) {
        return this.out.isEnabled(feature);
    }

    public void writeNull() {
        this.out.writeNull();
    }

    public SerializeConfig getMapping() {
        return this.config;
    }

    public static void write(Writer out, Object object) {
        SerializeWriter writer = new SerializeWriter();
        try {
            try {
                JSONSerializer serializer = new JSONSerializer(writer);
                serializer.write(object);
                writer.writeTo(out);
                writer.close();
            } catch (IOException ex) {
                throw new JSONException(ex.getMessage(), ex);
            }
        } catch (Throwable th) {
            writer.close();
            throw th;
        }
    }

    public static void write(SerializeWriter out, Object object) {
        JSONSerializer serializer = new JSONSerializer(out);
        serializer.write(object);
    }

    public final void write(Object object) {
        if (object == null) {
            this.out.writeNull();
            return;
        }
        Class<?> clazz = object.getClass();
        ObjectSerializer writer = getObjectWriter(clazz);
        try {
            writer.write(this, object, null, null, 0);
        } catch (IOException e) {
            throw new JSONException(e.getMessage(), e);
        }
    }

    public final void writeWithFieldName(Object object, Object fieldName) {
        writeWithFieldName(object, fieldName, null, 0);
    }

    protected final void writeKeyValue(char seperator, String key, Object value) {
        if (seperator != 0) {
            this.out.write(seperator);
        }
        this.out.writeFieldName(key);
        write(value);
    }

    public final void writeWithFieldName(Object object, Object fieldName, Type fieldType, int fieldFeatures) {
        try {
            if (object == null) {
                this.out.writeNull();
                return;
            }
            Class<?> clazz = object.getClass();
            ObjectSerializer writer = getObjectWriter(clazz);
            writer.write(this, object, fieldName, fieldType, fieldFeatures);
        } catch (IOException e) {
            throw new JSONException(e.getMessage(), e);
        }
    }

    public final void writeWithFormat(Object object, String format) {
        if (object instanceof Date) {
            DateFormat dateFormat = getDateFormat();
            if (dateFormat == null) {
                dateFormat = new SimpleDateFormat(format, this.locale);
                dateFormat.setTimeZone(this.timeZone);
            }
            String text = dateFormat.format((Date) object);
            this.out.writeString(text);
            return;
        }
        write(object);
    }

    public final void write(String text) {
        StringCodec.instance.write(this, text);
    }

    public ObjectSerializer getObjectWriter(Class<?> clazz) {
        return this.config.getObjectWriter(clazz);
    }

    public void close() {
        this.out.close();
    }

    public boolean writeDirect(JavaBeanSerializer javaBeanDeser) {
        return this.out.writeDirect && this.writeDirect && javaBeanDeser.writeDirect;
    }

    public FieldInfo getFieldInfo() {
        return null;
    }

    public Object processValue(SerializeFilterable javaBeanDeser, BeanContext beanContext, Object object, String key, Object propertyValue) {
        if (propertyValue != null && this.out.writeNonStringValueAsString && ((propertyValue instanceof Number) || (propertyValue instanceof Boolean))) {
            propertyValue = propertyValue.toString();
        }
        List<ValueFilter> valueFilters = this.valueFilters;
        if (valueFilters != null) {
            for (ValueFilter valueFilter : valueFilters) {
                propertyValue = valueFilter.process(object, key, propertyValue);
            }
        }
        if (javaBeanDeser.valueFilters != null) {
            for (ValueFilter valueFilter2 : javaBeanDeser.valueFilters) {
                propertyValue = valueFilter2.process(object, key, propertyValue);
            }
        }
        if (this.contextValueFilters != null) {
            for (ContextValueFilter valueFilter3 : this.contextValueFilters) {
                propertyValue = valueFilter3.process(beanContext, object, key, propertyValue);
            }
        }
        if (javaBeanDeser.contextValueFilters != null) {
            for (ContextValueFilter valueFilter4 : javaBeanDeser.contextValueFilters) {
                propertyValue = valueFilter4.process(beanContext, object, key, propertyValue);
            }
        }
        return propertyValue;
    }

    public String processKey(SerializeFilterable javaBeanDeser, Object object, String key, Object propertyValue) {
        if (this.nameFilters != null) {
            for (NameFilter nameFilter : this.nameFilters) {
                key = nameFilter.process(object, key, propertyValue);
            }
        }
        if (javaBeanDeser.nameFilters != null) {
            for (NameFilter nameFilter2 : javaBeanDeser.nameFilters) {
                key = nameFilter2.process(object, key, propertyValue);
            }
        }
        return key;
    }

    public boolean applyName(SerializeFilterable javaBeanDeser, Object object, String key) {
        if (this.propertyPreFilters != null) {
            for (PropertyPreFilter filter : this.propertyPreFilters) {
                if (!filter.apply(this, object, key)) {
                    return false;
                }
            }
        }
        if (javaBeanDeser.propertyPreFilters != null) {
            for (PropertyPreFilter filter2 : javaBeanDeser.propertyPreFilters) {
                if (!filter2.apply(this, object, key)) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    public boolean apply(SerializeFilterable javaBeanDeser, Object object, String key, Object propertyValue) {
        if (this.propertyFilters != null) {
            for (PropertyFilter propertyFilter : this.propertyFilters) {
                if (!propertyFilter.apply(object, key, propertyValue)) {
                    return false;
                }
            }
        }
        if (javaBeanDeser.propertyFilters != null) {
            for (PropertyFilter propertyFilter2 : javaBeanDeser.propertyFilters) {
                if (!propertyFilter2.apply(object, key, propertyValue)) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    public char writeBefore(SerializeFilterable javaBeanDeser, Object object, char seperator) {
        if (this.beforeFilters != null) {
            for (BeforeFilter beforeFilter : this.beforeFilters) {
                seperator = beforeFilter.writeBefore(this, object, seperator);
            }
        }
        if (javaBeanDeser.beforeFilters != null) {
            for (BeforeFilter beforeFilter2 : javaBeanDeser.beforeFilters) {
                seperator = beforeFilter2.writeBefore(this, object, seperator);
            }
        }
        return seperator;
    }

    public char writeAfter(SerializeFilterable javaBeanDeser, Object object, char seperator) {
        if (this.afterFilters != null) {
            for (AfterFilter afterFilter : this.afterFilters) {
                seperator = afterFilter.writeAfter(this, object, seperator);
            }
        }
        if (javaBeanDeser.afterFilters != null) {
            for (AfterFilter afterFilter2 : javaBeanDeser.afterFilters) {
                seperator = afterFilter2.writeAfter(this, object, seperator);
            }
        }
        return seperator;
    }

    public boolean applyLabel(SerializeFilterable javaBeanDeser, String label) {
        if (this.labelFilters != null) {
            for (LabelFilter propertyFilter : this.labelFilters) {
                if (!propertyFilter.apply(label)) {
                    return false;
                }
            }
        }
        if (javaBeanDeser.labelFilters != null) {
            for (LabelFilter propertyFilter2 : javaBeanDeser.labelFilters) {
                if (!propertyFilter2.apply(label)) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }
}
