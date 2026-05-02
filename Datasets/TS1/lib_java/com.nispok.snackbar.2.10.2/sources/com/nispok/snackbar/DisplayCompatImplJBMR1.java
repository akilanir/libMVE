package com.nispok.snackbar;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.view.Display;
import com.nispok.snackbar.DisplayCompat;

@TargetApi(17)
/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/DisplayCompatImplJBMR1.class */
class DisplayCompatImplJBMR1 extends DisplayCompat.Impl {
    DisplayCompatImplJBMR1() {
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getSize(Display display, Point outSize) {
        display.getSize(outSize);
    }

    @Override // com.nispok.snackbar.DisplayCompat.Impl
    void getRealSize(Display display, Point outSize) {
        display.getRealSize(outSize);
    }
}
