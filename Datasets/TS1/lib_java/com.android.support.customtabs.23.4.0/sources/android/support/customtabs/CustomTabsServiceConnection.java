package android.support.customtabs;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.support.customtabs.ICustomTabsService;

/* loaded from: com.android.support.customtabs.23.4.0.jar:android/support/customtabs/CustomTabsServiceConnection.class */
public abstract class CustomTabsServiceConnection implements ServiceConnection {
    public abstract void onCustomTabsServiceConnected(ComponentName componentName, CustomTabsClient customTabsClient);

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName name, IBinder service) {
        onCustomTabsServiceConnected(name, new CustomTabsClient(ICustomTabsService.Stub.asInterface(service), name) { // from class: android.support.customtabs.CustomTabsServiceConnection.1
        });
    }
}
