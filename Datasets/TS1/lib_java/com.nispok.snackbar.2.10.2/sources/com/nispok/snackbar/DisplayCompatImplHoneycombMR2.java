package com.nispok.snackbar;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.view.Display;
import com.nispok.snackbar.DisplayCompat;

@TargetApi(13)
/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/DisplayCompatImplHoneycombMR2.class */
class DisplayCompatImplHoneycombMR2 extends DisplayCompat.Impl {
    DisplayCompatImplHoneycombMR2() {
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getSize(Display display, Point outSize) {
        display.getSize(outSize);
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getRealSize(Display display, Point outSize) {
        display.getSize(outSize);
    }
}
