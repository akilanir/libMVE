package org.osmdroid.tileprovider.modules;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Environment;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/modules/MapTileFileStorageProviderBase.class */
public abstract class MapTileFileStorageProviderBase extends MapTileModuleProviderBase {
    private static final Logger logger = LoggerFactory.getLogger(MapTileFileStorageProviderBase.class);
    private boolean mSdCardAvailable;
    private final IRegisterReceiver mRegisterReceiver;
    private MyBroadcastReceiver mBroadcastReceiver;

    public MapTileFileStorageProviderBase(IRegisterReceiver pRegisterReceiver, int pThreadPoolSize, int pPendingQueueSize) {
        super(pThreadPoolSize, pPendingQueueSize);
        this.mSdCardAvailable = true;
        checkSdCard();
        this.mRegisterReceiver = pRegisterReceiver;
        this.mBroadcastReceiver = new MyBroadcastReceiver();
        IntentFilter mediaFilter = new IntentFilter();
        mediaFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        mediaFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        mediaFilter.addDataScheme("file");
        pRegisterReceiver.registerReceiver(this.mBroadcastReceiver, mediaFilter);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkSdCard() {
        String state = Environment.getExternalStorageState();
        logger.info("sdcard state: " + state);
        this.mSdCardAvailable = "mounted".equals(state);
    }

    protected boolean getSdCardAvailable() {
        return this.mSdCardAvailable;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public void detach() {
        if (this.mBroadcastReceiver != null) {
            this.mRegisterReceiver.unregisterReceiver(this.mBroadcastReceiver);
            this.mBroadcastReceiver = null;
        }
        super.detach();
    }

    protected void onMediaMounted() {
    }

    protected void onMediaUnmounted() {
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/modules/MapTileFileStorageProviderBase$MyBroadcastReceiver.class */
    private class MyBroadcastReceiver extends BroadcastReceiver {
        private MyBroadcastReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context aContext, Intent aIntent) {
            String action = aIntent.getAction();
            MapTileFileStorageProviderBase.this.checkSdCard();
            if ("android.intent.action.MEDIA_MOUNTED".equals(action)) {
                MapTileFileStorageProviderBase.this.onMediaMounted();
            } else if ("android.intent.action.MEDIA_UNMOUNTED".equals(action)) {
                MapTileFileStorageProviderBase.this.onMediaUnmounted();
            }
        }
    }
}
