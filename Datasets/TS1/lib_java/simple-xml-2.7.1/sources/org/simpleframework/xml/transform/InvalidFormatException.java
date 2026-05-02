package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/InvalidFormatException.class */
public class InvalidFormatException extends TransformException {
    public InvalidFormatException(String text, Object... list) {
        super(String.format(text, list), new Object[0]);
    }

    public InvalidFormatException(Throwable cause, String text, Object... list) {
        super(String.format(text, list), cause);
    }
}
