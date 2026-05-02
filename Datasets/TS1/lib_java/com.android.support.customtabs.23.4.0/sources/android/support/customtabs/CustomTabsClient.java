package android.support.customtabs;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.customtabs.ICustomTabsCallback;
import android.text.TextUtils;

/* loaded from: com.android.support.customtabs.23.4.0.jar:android/support/customtabs/CustomTabsClient.class */
public class CustomTabsClient {
    private final ICustomTabsService mService;
    private final ComponentName mServiceComponentName;

    CustomTabsClient(ICustomTabsService service, ComponentName componentName) {
        this.mService = service;
        this.mServiceComponentName = componentName;
    }

    public static boolean bindCustomTabsService(Context context, String packageName, CustomTabsServiceConnection connection) {
        Intent intent = new Intent(CustomTabsService.ACTION_CUSTOM_TABS_CONNECTION);
        if (!TextUtils.isEmpty(packageName)) {
            intent.setPackage(packageName);
        }
        return context.bindService(intent, connection, 33);
    }

    public boolean warmup(long flags) {
        try {
            return this.mService.warmup(flags);
        } catch (RemoteException e) {
            return false;
        }
    }

    public CustomTabsSession newSession(final CustomTabsCallback callback) {
        ICustomTabsCallback.Stub wrapper = new ICustomTabsCallback.Stub() { // from class: android.support.customtabs.CustomTabsClient.1
            @Override // android.support.customtabs.ICustomTabsCallback
            public void onNavigationEvent(int navigationEvent, Bundle extras) {
                if (callback != null) {
                    callback.onNavigationEvent(navigationEvent, extras);
                }
            }

            @Override // android.support.customtabs.ICustomTabsCallback
            public void extraCallback(String callbackName, Bundle args) throws RemoteException {
                if (callback != null) {
                    callback.extraCallback(callbackName, args);
                }
            }
        };
        try {
            if (this.mService.newSession(wrapper)) {
                return new CustomTabsSession(this.mService, wrapper, this.mServiceComponentName);
            }
            return null;
        } catch (RemoteException e) {
            return null;
        }
    }

    public Bundle extraCommand(String commandName, Bundle args) {
        try {
            return this.mService.extraCommand(commandName, args);
        } catch (RemoteException e) {
            return null;
        }
    }
}
