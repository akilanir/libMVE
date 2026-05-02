package retrofit.android;

import android.net.http.AndroidHttpClient;
import retrofit.client.ApacheClient;

/* loaded from: retrofit-1.9.0.jar:retrofit/android/AndroidApacheClient.class */
public final class AndroidApacheClient extends ApacheClient {
    public AndroidApacheClient() {
        super(AndroidHttpClient.newInstance("Retrofit"));
    }
}
