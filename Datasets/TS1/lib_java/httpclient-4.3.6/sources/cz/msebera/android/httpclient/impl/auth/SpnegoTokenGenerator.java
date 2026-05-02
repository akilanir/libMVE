package cz.msebera.android.httpclient.impl.auth;

import java.io.IOException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/SpnegoTokenGenerator.class */
public interface SpnegoTokenGenerator {
    byte[] generateSpnegoDERObject(byte[] bArr) throws IOException;
}
