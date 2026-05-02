package cz.msebera.android.httpclient.util;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/util/CharsetUtils.class */
public class CharsetUtils {
    public static Charset lookup(String name) {
        if (name == null) {
            return null;
        }
        try {
            return Charset.forName(name);
        } catch (UnsupportedCharsetException e) {
            return null;
        }
    }

    public static Charset get(String name) throws UnsupportedEncodingException {
        if (name == null) {
            return null;
        }
        try {
            return Charset.forName(name);
        } catch (UnsupportedCharsetException e) {
            throw new UnsupportedEncodingException(name);
        }
    }
}
