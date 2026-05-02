package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/Header.class */
public interface Header {
    String getName();

    String getValue();

    HeaderElement[] getElements() throws ParseException;
}
