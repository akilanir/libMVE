package android.support.v4.net;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/net/ConnectivityManagerCompatGingerbread.class */
class ConnectivityManagerCompatGingerbread {
    ConnectivityManagerCompatGingerbread() {
    }

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        NetworkInfo info = cm.getActiveNetworkInfo();
        if (info == null) {
            return true;
        }
        int type = info.getType();
        switch (type) {
        }
        return true;
    }
}
