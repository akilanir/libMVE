package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/UnsupportedSchemeException.class */
public class UnsupportedSchemeException extends IOException {
    private static final long serialVersionUID = 3597127619218687636L;

    public UnsupportedSchemeException(String message) {
        super(message);
    }
}
