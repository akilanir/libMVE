package info.guardianproject.netcipher.proxy;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

/* loaded from: netcipher-1.2.1.jar:info/guardianproject/netcipher/proxy/OrbotHelper.class */
public class OrbotHelper {
    private static final int REQUEST_CODE_STATUS = 100;
    public static final String ORBOT_PACKAGE_NAME = "org.torproject.android";
    public static final String ORBOT_MARKET_URI = "market://details?id=org.torproject.android";
    public static final String ORBOT_FDROID_URI = "https://f-droid.org/repository/browse/?fdid=org.torproject.android";
    public static final String ORBOT_PLAY_URI = "https://play.google.com/store/apps/details?id=org.torproject.android";
    public static final String ACTION_START = "org.torproject.android.intent.action.START";
    public static final String ACTION_STATUS = "org.torproject.android.intent.action.STATUS";
    public static final String EXTRA_STATUS = "org.torproject.android.intent.extra.STATUS";
    public static final String EXTRA_PACKAGE_NAME = "org.torproject.android.intent.extra.PACKAGE_NAME";
    public static final String STATUS_OFF = "OFF";
    public static final String STATUS_ON = "ON";
    public static final String STATUS_STARTING = "STARTING";
    public static final String STATUS_STOPPING = "STOPPING";
    public static final String STATUS_STARTS_DISABLED = "STARTS_DISABLED";
    public static final String ACTION_START_TOR = "org.torproject.android.START_TOR";
    public static final String ACTION_REQUEST_HS = "org.torproject.android.REQUEST_HS_PORT";
    public static final int START_TOR_RESULT = 37428;
    public static final int HS_REQUEST_CODE = 9999;
    private static final String FDROID_PACKAGE_NAME = "org.fdroid.fdroid";
    private static final String PLAY_PACKAGE_NAME = "com.android.vending";

    private OrbotHelper() {
    }

    public static boolean isOnionAddress(URL url) {
        return url.getHost().endsWith(".onion");
    }

    public static boolean isOnionAddress(String urlString) {
        try {
            return isOnionAddress(new URL(urlString));
        } catch (MalformedURLException e) {
            return false;
        }
    }

    public static boolean isOnionAddress(Uri uri) {
        return uri.getHost().endsWith(".onion");
    }

    public static boolean isOrbotRunning(Context context) {
        int procId = TorServiceUtils.findProcessId(context);
        return procId != -1;
    }

    public static boolean isOrbotInstalled(Context context) {
        return isAppInstalled(context, ORBOT_PACKAGE_NAME);
    }

    private static boolean isAppInstalled(Context context, String uri) {
        try {
            PackageManager pm = context.getPackageManager();
            pm.getPackageInfo(uri, 1);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static void requestHiddenServiceOnPort(Activity activity, int port) {
        Intent intent = new Intent(ACTION_REQUEST_HS);
        intent.setPackage(ORBOT_PACKAGE_NAME);
        intent.putExtra("hs_port", port);
        activity.startActivityForResult(intent, HS_REQUEST_CODE);
    }

    public static boolean requestStartTor(Context context) {
        if (isOrbotInstalled(context)) {
            Log.i("OrbotHelper", "requestStartTor " + context.getPackageName());
            Intent intent = getOrbotStartIntent(context);
            context.sendBroadcast(intent);
            return true;
        }
        return false;
    }

    public static Intent getOrbotStartIntent(Context context) {
        Intent intent = new Intent(ACTION_START);
        intent.setPackage(ORBOT_PACKAGE_NAME);
        intent.putExtra(EXTRA_PACKAGE_NAME, context.getPackageName());
        return intent;
    }

    @Deprecated
    public static Intent getOrbotStartIntent() {
        Intent intent = new Intent(ACTION_START);
        intent.setPackage(ORBOT_PACKAGE_NAME);
        return intent;
    }

    public static boolean requestShowOrbotStart(Activity activity) {
        if (isOrbotInstalled(activity) && !isOrbotRunning(activity)) {
            Intent intent = getShowOrbotStartIntent();
            activity.startActivityForResult(intent, START_TOR_RESULT);
            return true;
        }
        return false;
    }

    public static Intent getShowOrbotStartIntent() {
        Intent intent = new Intent(ACTION_START_TOR);
        intent.setPackage(ORBOT_PACKAGE_NAME);
        intent.addFlags(268435456);
        return intent;
    }

    public static Intent getOrbotInstallIntent(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(ORBOT_MARKET_URI));
        PackageManager pm = context.getPackageManager();
        List<ResolveInfo> resInfos = pm.queryIntentActivities(intent, 0);
        String foundPackageName = null;
        for (ResolveInfo r : resInfos) {
            Log.i("OrbotHelper", "market: " + r.activityInfo.packageName);
            if (TextUtils.equals(r.activityInfo.packageName, FDROID_PACKAGE_NAME) || TextUtils.equals(r.activityInfo.packageName, PLAY_PACKAGE_NAME)) {
                foundPackageName = r.activityInfo.packageName;
                break;
            }
        }
        if (foundPackageName == null) {
            intent.setData(Uri.parse(ORBOT_FDROID_URI));
        } else {
            intent.setPackage(foundPackageName);
        }
        return intent;
    }
}
