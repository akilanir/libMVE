package android.support.v4.net;

import android.net.ConnectivityManager;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/net/ConnectivityManagerCompatJellyBean.class */
class ConnectivityManagerCompatJellyBean {
    ConnectivityManagerCompatJellyBean() {
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        return cm.isActiveNetworkMetered();
    }
}
