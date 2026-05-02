package org.apache.commons.digester.xmlrules;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/CircularIncludeException.class */
public class CircularIncludeException extends XmlLoadException {
    public CircularIncludeException(String fileName) {
        super(new StringBuffer().append("Circular file inclusion detected for file: ").append(fileName).toString());
    }
}
