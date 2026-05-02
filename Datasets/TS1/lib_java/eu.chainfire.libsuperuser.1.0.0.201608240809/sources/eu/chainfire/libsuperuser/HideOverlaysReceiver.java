package eu.chainfire.libsuperuser;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201608240809.jar:eu/chainfire/libsuperuser/HideOverlaysReceiver.class */
public abstract class HideOverlaysReceiver extends BroadcastReceiver {
    public static final String ACTION_HIDE_OVERLAYS = "eu.chainfire.supersu.action.HIDE_OVERLAYS";
    public static final String CATEGORY_HIDE_OVERLAYS = "android.intent.category.INFO";
    public static final String EXTRA_HIDE_OVERLAYS = "eu.chainfire.supersu.extra.HIDE";

    public abstract void onHideOverlays(boolean z);

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (intent.hasExtra(EXTRA_HIDE_OVERLAYS)) {
            onHideOverlays(intent.getBooleanExtra(EXTRA_HIDE_OVERLAYS, false));
        }
    }
}
