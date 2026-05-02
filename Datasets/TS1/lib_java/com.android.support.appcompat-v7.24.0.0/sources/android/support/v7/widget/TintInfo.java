package android.support.v7.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;

/* loaded from: com.android.support.appcompat-v7.24.0.0.jar:android/support/v7/widget/TintInfo.class */
class TintInfo {
    public ColorStateList mTintList;
    public PorterDuff.Mode mTintMode;
    public boolean mHasTintMode;
    public boolean mHasTintList;

    TintInfo() {
    }

    void clear() {
        this.mTintList = null;
        this.mHasTintList = false;
        this.mTintMode = null;
        this.mHasTintMode = false;
    }
}
