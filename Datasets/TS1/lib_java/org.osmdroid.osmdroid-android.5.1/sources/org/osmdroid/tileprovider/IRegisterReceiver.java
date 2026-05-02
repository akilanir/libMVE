package org.osmdroid.tileprovider;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/IRegisterReceiver.class */
public interface IRegisterReceiver {
    Intent registerReceiver(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter);

    void unregisterReceiver(BroadcastReceiver broadcastReceiver);
}
