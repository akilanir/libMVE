package android.support.v7.internal.widget;

import android.graphics.Rect;
import android.os.Build;

/* loaded from: com.android.support.appcompat-v7.23.1.0.jar:android/support/v7/internal/widget/DrawableUtils.class */
public class DrawableUtils {
    private static final String TAG = "DrawableUtils";
    public static final Rect INSETS_NONE = new Rect();
    private static Class<?> sInsetsClazz;

    static {
        if (Build.VERSION.SDK_INT >= 18) {
            try {
                sInsetsClazz = Class.forName("android.graphics.Insets");
            } catch (ClassNotFoundException e) {
            }
        }
    }

    private DrawableUtils() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00e4 A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00f1 A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00fe A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x010b A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0115 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Rect getOpticalBounds(android.graphics.drawable.Drawable r4) {
        /*
            Method dump skipped, instructions count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.internal.widget.DrawableUtils.getOpticalBounds(android.graphics.drawable.Drawable):android.graphics.Rect");
    }
}
