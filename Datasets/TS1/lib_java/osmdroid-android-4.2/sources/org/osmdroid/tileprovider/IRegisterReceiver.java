package org.osmdroid.tileprovider;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/IRegisterReceiver.class */
public interface IRegisterReceiver {
    Intent registerReceiver(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter);

    void unregisterReceiver(BroadcastReceiver broadcastReceiver);
}
