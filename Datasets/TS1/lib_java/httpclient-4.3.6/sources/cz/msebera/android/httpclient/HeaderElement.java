package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HeaderElement.class */
public interface HeaderElement {
    String getName();

    String getValue();

    NameValuePair[] getParameters();

    NameValuePair getParameterByName(String str);

    int getParameterCount();

    NameValuePair getParameter(int i);
}
