package org.ligi.axt.extensions;

import android.graphics.Point;
import android.os.Build;
import android.view.Display;
import android.view.WindowManager;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/WindowManagerAXT.class */
public class WindowManagerAXT {
    private final WindowManager windowManager;

    public WindowManagerAXT(WindowManager windowManager) {
        this.windowManager = windowManager;
    }

    public Point getSizeAsPointCorrectly() {
        Point result = new Point();
        Display defaultDisplay = this.windowManager.getDefaultDisplay();
        if (Build.VERSION.SDK_INT > 12) {
            defaultDisplay.getSize(result);
        } else {
            result.set(defaultDisplay.getWidth(), defaultDisplay.getHeight());
        }
        return result;
    }

    public int getLargestSide() {
        Point sizeAsPoint = getSizeAsPointCorrectly();
        return Math.max(sizeAsPoint.x, sizeAsPoint.y);
    }

    public int getSmallestSide() {
        Point sizeAsPoint = getSizeAsPointCorrectly();
        return Math.min(sizeAsPoint.x, sizeAsPoint.y);
    }
}
