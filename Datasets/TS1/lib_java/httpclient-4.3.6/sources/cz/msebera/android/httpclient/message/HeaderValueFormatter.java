package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.util.CharArrayBuffer;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/HeaderValueFormatter.class */
public interface HeaderValueFormatter {
    CharArrayBuffer formatElements(CharArrayBuffer charArrayBuffer, HeaderElement[] headerElementArr, boolean z);

    CharArrayBuffer formatHeaderElement(CharArrayBuffer charArrayBuffer, HeaderElement headerElement, boolean z);

    CharArrayBuffer formatParameters(CharArrayBuffer charArrayBuffer, NameValuePair[] nameValuePairArr, boolean z);

    CharArrayBuffer formatNameValuePair(CharArrayBuffer charArrayBuffer, NameValuePair nameValuePair, boolean z);
}
