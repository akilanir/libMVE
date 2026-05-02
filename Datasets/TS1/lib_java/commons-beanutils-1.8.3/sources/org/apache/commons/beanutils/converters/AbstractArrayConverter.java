package org.apache.commons.beanutils.converters;

import java.io.IOException;
import java.io.StreamTokenizer;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/AbstractArrayConverter.class */
public abstract class AbstractArrayConverter implements Converter {
    public static final Object NO_DEFAULT = new Object();
    protected static String[] strings = new String[0];
    protected Object defaultValue;
    protected boolean useDefault;

    @Override // org.apache.commons.beanutils.Converter
    public abstract Object convert(Class cls, Object obj);

    public AbstractArrayConverter() {
        this.defaultValue = null;
        this.useDefault = true;
        this.defaultValue = null;
        this.useDefault = false;
    }

    public AbstractArrayConverter(Object defaultValue) {
        this.defaultValue = null;
        this.useDefault = true;
        if (defaultValue == NO_DEFAULT) {
            this.useDefault = false;
        } else {
            this.defaultValue = defaultValue;
            this.useDefault = true;
        }
    }

    protected List parseElements(String svalue) {
        int ttype;
        if (svalue == null) {
            throw new NullPointerException();
        }
        String svalue2 = svalue.trim();
        if (svalue2.startsWith("{") && svalue2.endsWith("}")) {
            svalue2 = svalue2.substring(1, svalue2.length() - 1);
        }
        try {
            StreamTokenizer st = new StreamTokenizer(new StringReader(svalue2));
            st.whitespaceChars(44, 44);
            st.ordinaryChars(48, 57);
            st.ordinaryChars(46, 46);
            st.ordinaryChars(45, 45);
            st.wordChars(48, 57);
            st.wordChars(46, 46);
            st.wordChars(45, 45);
            ArrayList list = new ArrayList();
            while (true) {
                ttype = st.nextToken();
                if (ttype != -3 && ttype <= 0) {
                    break;
                }
                list.add(st.sval);
            }
            if (ttype != -1) {
                throw new ConversionException(new StringBuffer().append("Encountered token of type ").append(ttype).toString());
            }
            return list;
        } catch (IOException e) {
            throw new ConversionException(e);
        }
    }
}
