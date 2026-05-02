package com.journeyapps.barcodescanner.camera;

import android.graphics.Rect;
import android.util.Log;
import com.journeyapps.barcodescanner.Size;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/camera/DisplayConfiguration.class */
public class DisplayConfiguration {
    private static final String TAG = DisplayConfiguration.class.getSimpleName();
    private Size viewfinderSize;
    private int rotation;
    private boolean center = false;

    public DisplayConfiguration(int rotation) {
        this.rotation = rotation;
    }

    public DisplayConfiguration(int rotation, Size viewfinderSize) {
        this.rotation = rotation;
        this.viewfinderSize = viewfinderSize;
    }

    public int getRotation() {
        return this.rotation;
    }

    public Size getViewfinderSize() {
        return this.viewfinderSize;
    }

    public Size getDesiredPreviewSize(boolean rotate) {
        if (this.viewfinderSize == null) {
            return null;
        }
        if (rotate) {
            return this.viewfinderSize.rotate();
        }
        return this.viewfinderSize;
    }

    public Size getBestPreviewSize(List<Size> sizes, boolean isRotated) {
        final Size desired = getDesiredPreviewSize(isRotated);
        if (desired == null) {
            return sizes.get(0);
        }
        Collections.sort(sizes, new Comparator<Size>() { // from class: com.journeyapps.barcodescanner.camera.DisplayConfiguration.1
            @Override // java.util.Comparator
            public int compare(Size a, Size b) {
                Size ascaled = DisplayConfiguration.scale(a, desired);
                int aScale = ascaled.width - a.width;
                Size bscaled = DisplayConfiguration.scale(b, desired);
                int bScale = bscaled.width - b.width;
                if (aScale == 0 && bScale == 0) {
                    return a.compareTo(b);
                }
                if (aScale == 0) {
                    return -1;
                }
                if (bScale == 0) {
                    return 1;
                }
                if (aScale < 0 && bScale < 0) {
                    return a.compareTo(b);
                }
                if (aScale > 0 && bScale > 0) {
                    return -a.compareTo(b);
                }
                if (aScale < 0) {
                    return -1;
                }
                return 1;
            }
        });
        Log.i(TAG, "Viewfinder size: " + desired);
        Log.i(TAG, "Preview in order of preference: " + sizes);
        return sizes.get(0);
    }

    public static Size scale(Size from, Size to) {
        Size scaled66;
        Size current = from;
        if (to.fitsIn(current)) {
            while (true) {
                scaled66 = current.scale(2, 3);
                Size scaled50 = current.scale(1, 2);
                if (!to.fitsIn(scaled50)) {
                    break;
                }
                current = scaled50;
            }
            if (to.fitsIn(scaled66)) {
                return scaled66;
            }
            return current;
        }
        while (true) {
            Size scaled150 = current.scale(3, 2);
            Size scaled200 = current.scale(2, 1);
            if (to.fitsIn(scaled150)) {
                return scaled150;
            }
            if (to.fitsIn(scaled200)) {
                return scaled200;
            }
            current = scaled200;
        }
    }

    public Rect scalePreview(Size previewSize) {
        Size scaledPreview = scale(previewSize, this.viewfinderSize);
        Log.i(TAG, "Preview: " + previewSize + "; Scaled: " + scaledPreview + "; Want: " + this.viewfinderSize);
        int dx = (scaledPreview.width - this.viewfinderSize.width) / 2;
        int dy = (scaledPreview.height - this.viewfinderSize.height) / 2;
        return new Rect(-dx, -dy, scaledPreview.width - dx, scaledPreview.height - dy);
    }
}
