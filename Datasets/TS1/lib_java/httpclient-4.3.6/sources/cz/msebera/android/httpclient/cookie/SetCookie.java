package cz.msebera.android.httpclient.cookie;

import java.util.Date;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/cookie/SetCookie.class */
public interface SetCookie extends Cookie {
    void setValue(String str);

    void setComment(String str);

    void setExpiryDate(Date date);

    void setDomain(String str);

    void setPath(String str);

    void setSecure(boolean z);

    void setVersion(int i);
}
