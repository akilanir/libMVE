package com.nispok.snackbar;

import android.graphics.Point;
import android.view.Display;
import com.nispok.snackbar.DisplayCompat;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/DisplayCompatImplPreHoneycombMR2.class */
class DisplayCompatImplPreHoneycombMR2 extends DisplayCompat.Impl {
    DisplayCompatImplPreHoneycombMR2() {
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getSize(Display display, Point outSize) {
        outSize.x = display.getWidth();
        outSize.y = display.getHeight();
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getRealSize(Display display, Point outSize) {
        outSize.x = display.getWidth();
        outSize.y = display.getHeight();
    }
}
