package org.apache.http;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/Header.class */
public interface Header {
    String getName();

    String getValue();

    HeaderElement[] getElements() throws ParseException;
}
