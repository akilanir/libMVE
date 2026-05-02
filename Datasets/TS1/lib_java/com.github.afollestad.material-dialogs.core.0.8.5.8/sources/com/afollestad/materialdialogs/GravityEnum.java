package com.afollestad.materialdialogs;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.os.Build;

/* loaded from: com.github.afollestad.material-dialogs.core.0.8.5.8.jar:com/afollestad/materialdialogs/GravityEnum.class */
public enum GravityEnum {
    START,
    CENTER,
    END;

    private static final boolean HAS_RTL;

    static {
        HAS_RTL = Build.VERSION.SDK_INT >= 17;
    }

    @SuppressLint({"RtlHardcoded"})
    public int getGravityInt() {
        switch (AnonymousClass1.$SwitchMap$com$afollestad$materialdialogs$GravityEnum[ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                return HAS_RTL ? 8388611 : 3;
            case 2:
                return 1;
            case 3:
                return HAS_RTL ? 8388613 : 5;
            default:
                throw new IllegalStateException("Invalid gravity constant");
        }
    }

    @TargetApi(17)
    public int getTextAlignment() {
        switch (this) {
            case CENTER:
                return 4;
            case END:
                return 6;
            default:
                return 5;
        }
    }
}
