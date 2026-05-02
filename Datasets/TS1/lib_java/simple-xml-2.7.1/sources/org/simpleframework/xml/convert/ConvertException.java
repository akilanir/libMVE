package org.simpleframework.xml.convert;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/convert/ConvertException.class */
public class ConvertException extends Exception {
    public ConvertException(String text, Object... list) {
        super(String.format(text, list));
    }
}
