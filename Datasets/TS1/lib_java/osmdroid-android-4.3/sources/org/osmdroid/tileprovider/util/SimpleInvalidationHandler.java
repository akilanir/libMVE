package org.osmdroid.tileprovider.util;

import android.os.Handler;
import android.os.Message;
import android.view.View;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/util/SimpleInvalidationHandler.class */
public class SimpleInvalidationHandler extends Handler {
    private final View mView;

    public SimpleInvalidationHandler(View pView) {
        this.mView = pView;
    }

    @Override // android.os.Handler
    public void handleMessage(Message msg) {
        switch (msg.what) {
            case 0:
                this.mView.invalidate();
                break;
        }
    }
}
