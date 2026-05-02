package org.apache.http;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/HeaderElement.class */
public interface HeaderElement {
    String getName();

    String getValue();

    NameValuePair[] getParameters();

    NameValuePair getParameterByName(String str);

    int getParameterCount();

    NameValuePair getParameter(int i);
}
