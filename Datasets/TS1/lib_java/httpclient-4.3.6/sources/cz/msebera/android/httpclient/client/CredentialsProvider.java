package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.auth.AuthScope;
import cz.msebera.android.httpclient.auth.Credentials;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/CredentialsProvider.class */
public interface CredentialsProvider {
    void setCredentials(AuthScope authScope, Credentials credentials);

    Credentials getCredentials(AuthScope authScope);

    void clear();
}
