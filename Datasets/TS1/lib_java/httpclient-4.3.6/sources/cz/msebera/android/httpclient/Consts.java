package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.protocol.HTTP;
import java.nio.charset.Charset;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/Consts.class */
public final class Consts {
    public static final int CR = 13;
    public static final int LF = 10;
    public static final int SP = 32;
    public static final int HT = 9;
    public static final Charset UTF_8 = Charset.forName(HTTP.UTF_8);
    public static final Charset ASCII = Charset.forName("US-ASCII");
    public static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");

    private Consts() {
    }
}
