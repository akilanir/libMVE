package cz.msebera.android.httpclient.cookie;

import java.util.Date;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/cookie/Cookie.class */
public interface Cookie {
    String getName();

    String getValue();

    String getComment();

    String getCommentURL();

    Date getExpiryDate();

    boolean isPersistent();

    String getDomain();

    String getPath();

    int[] getPorts();

    boolean isSecure();

    int getVersion();

    boolean isExpired(Date date);
}
