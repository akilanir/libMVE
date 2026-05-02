package org.apache.commons.beanutils.converters;

import java.io.IOException;
import java.io.StreamTokenizer;
import java.io.StringReader;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ArrayConverter.class */
public class ArrayConverter extends AbstractConverter {
    private Object defaultTypeInstance;
    private Converter elementConverter;
    private int defaultSize;
    private char delimiter;
    private char[] allowedChars;
    private boolean onlyFirstToString;
    static Class class$java$lang$String;

    public ArrayConverter(Class defaultType, Converter elementConverter) {
        this.delimiter = ',';
        this.allowedChars = new char[]{'.', '-'};
        this.onlyFirstToString = true;
        if (defaultType == null) {
            throw new IllegalArgumentException("Default type is missing");
        }
        if (!defaultType.isArray()) {
            throw new IllegalArgumentException("Default type must be an array.");
        }
        if (elementConverter == null) {
            throw new IllegalArgumentException("Component Converter is missing.");
        }
        this.defaultTypeInstance = Array.newInstance(defaultType.getComponentType(), 0);
        this.elementConverter = elementConverter;
    }

    public ArrayConverter(Class defaultType, Converter elementConverter, int defaultSize) {
        this(defaultType, elementConverter);
        this.defaultSize = defaultSize;
        Object defaultValue = null;
        setDefaultValue(defaultSize >= 0 ? Array.newInstance(defaultType.getComponentType(), defaultSize) : defaultValue);
    }

    public void setDelimiter(char delimiter) {
        this.delimiter = delimiter;
    }

    public void setAllowedChars(char[] allowedChars) {
        this.allowedChars = allowedChars;
    }

    public void setOnlyFirstToString(boolean onlyFirstToString) {
        this.onlyFirstToString = onlyFirstToString;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        return this.defaultTypeInstance.getClass();
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected String convertToString(Object value) throws Throwable {
        int size;
        Class cls;
        Class cls2;
        Iterator iterator = null;
        Class type = value.getClass();
        if (type.isArray()) {
            size = Array.getLength(value);
        } else {
            Collection collection = convertToCollection(type, value);
            size = collection.size();
            iterator = collection.iterator();
        }
        if (size == 0) {
            if (class$java$lang$String == null) {
                cls2 = class$("java.lang.String");
                class$java$lang$String = cls2;
            } else {
                cls2 = class$java$lang$String;
            }
            return (String) getDefault(cls2);
        }
        if (this.onlyFirstToString) {
            size = 1;
        }
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                buffer.append(this.delimiter);
            }
            Object element = iterator == null ? Array.get(value, i) : iterator.next();
            Converter converter = this.elementConverter;
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            Object element2 = converter.convert(cls, element);
            if (element2 != null) {
                buffer.append(element2);
            }
        }
        return buffer.toString();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class type, Object value) throws Throwable {
        int size;
        if (!type.isArray()) {
            throw new ConversionException(new StringBuffer().append(toString(getClass())).append(" cannot handle conversion to '").append(toString(type)).append("' (not an array).").toString());
        }
        Iterator iterator = null;
        if (value.getClass().isArray()) {
            size = Array.getLength(value);
        } else {
            Collection collection = convertToCollection(type, value);
            size = collection.size();
            iterator = collection.iterator();
        }
        Class componentType = type.getComponentType();
        Object newArray = Array.newInstance((Class<?>) componentType, size);
        for (int i = 0; i < size; i++) {
            Object element = iterator == null ? Array.get(value, i) : iterator.next();
            Array.set(newArray, i, this.elementConverter.convert(componentType, element));
        }
        return newArray;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertArray(Object value) {
        return value;
    }

    protected Collection convertToCollection(Class type, Object value) {
        if (value instanceof Collection) {
            return (Collection) value;
        }
        if ((value instanceof Number) || (value instanceof Boolean) || (value instanceof Date)) {
            List list = new ArrayList(1);
            list.add(value);
            return list;
        }
        return parseElements(type, value.toString());
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object getDefault(Class type) {
        Class cls;
        Object defaultValue;
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        if (type.equals(cls) || (defaultValue = super.getDefault(type)) == null) {
            return null;
        }
        if (defaultValue.getClass().equals(type)) {
            return defaultValue;
        }
        return Array.newInstance(type.getComponentType(), this.defaultSize);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(toString(getClass()));
        buffer.append("[UseDefault=");
        buffer.append(isUseDefault());
        buffer.append(", ");
        buffer.append(this.elementConverter.toString());
        buffer.append(']');
        return buffer.toString();
    }

    private List parseElements(Class type, String value) {
        int ttype;
        if (log().isDebugEnabled()) {
            log().debug(new StringBuffer().append("Parsing elements, delimiter=[").append(this.delimiter).append("], value=[").append(value).append("]").toString());
        }
        String value2 = value.trim();
        if (value2.startsWith("{") && value2.endsWith("}")) {
            value2 = value2.substring(1, value2.length() - 1);
        }
        try {
            StreamTokenizer st = new StreamTokenizer(new StringReader(value2));
            st.whitespaceChars(this.delimiter, this.delimiter);
            st.ordinaryChars(48, 57);
            st.wordChars(48, 57);
            for (int i = 0; i < this.allowedChars.length; i++) {
                st.ordinaryChars(this.allowedChars[i], this.allowedChars[i]);
                st.wordChars(this.allowedChars[i], this.allowedChars[i]);
            }
            List list = null;
            while (true) {
                ttype = st.nextToken();
                if (ttype != -3 && ttype <= 0) {
                    break;
                }
                if (st.sval != null) {
                    if (list == null) {
                        list = new ArrayList();
                    }
                    list.add(st.sval);
                }
            }
            if (ttype != -1) {
                throw new ConversionException(new StringBuffer().append("Encountered token of type ").append(ttype).append(" parsing elements to '").append(toString(type)).append(".").toString());
            }
            if (list == null) {
                list = Collections.EMPTY_LIST;
            }
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append(list.size()).append(" elements parsed").toString());
            }
            return list;
        } catch (IOException e) {
            throw new ConversionException(new StringBuffer().append("Error converting from String to '").append(toString(type)).append("': ").append(e.getMessage()).toString(), e);
        }
    }
}
