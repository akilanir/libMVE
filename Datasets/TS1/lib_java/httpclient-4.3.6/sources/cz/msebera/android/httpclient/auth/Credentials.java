package cz.msebera.android.httpclient.auth;

import java.security.Principal;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/Credentials.class */
public interface Credentials {
    Principal getUserPrincipal();

    String getPassword();
}
