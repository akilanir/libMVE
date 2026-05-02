package it.gmariotti.changelibs.library;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/Util.class */
public class Util {
    public static boolean isConnected(Context context) {
        ConnectivityManager connectivityManager;
        NetworkInfo activeNetworkInfo;
        return (context == null || (connectivityManager = (ConnectivityManager) context.getSystemService("connectivity")) == null || (activeNetworkInfo = connectivityManager.getActiveNetworkInfo()) == null || activeNetworkInfo == null || !activeNetworkInfo.isConnectedOrConnecting()) ? false : true;
    }
}
