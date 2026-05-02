package android.support.v4.net;

import android.net.ConnectivityManager;

/* loaded from: internal_impl-22.2.0.jar:android/support/v4/net/ConnectivityManagerCompatJellyBean.class */
class ConnectivityManagerCompatJellyBean {
    ConnectivityManagerCompatJellyBean() {
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        return cm.isActiveNetworkMetered();
    }
}
