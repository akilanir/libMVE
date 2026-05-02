package org.osmdroid.tileprovider.util;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import org.osmdroid.tileprovider.IRegisterReceiver;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/util/SimpleRegisterReceiver.class */
public class SimpleRegisterReceiver implements IRegisterReceiver {
    private final Context mContext;

    public SimpleRegisterReceiver(Context pContext) {
        this.mContext = pContext;
    }

    @Override // org.osmdroid.tileprovider.IRegisterReceiver
    public Intent registerReceiver(BroadcastReceiver aReceiver, IntentFilter aFilter) {
        return this.mContext.registerReceiver(aReceiver, aFilter);
    }

    @Override // org.osmdroid.tileprovider.IRegisterReceiver
    public void unregisterReceiver(BroadcastReceiver aReceiver) {
        this.mContext.unregisterReceiver(aReceiver);
    }
}
