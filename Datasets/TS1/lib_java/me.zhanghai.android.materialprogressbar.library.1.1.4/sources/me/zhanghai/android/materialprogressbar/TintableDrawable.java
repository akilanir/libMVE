package me.zhanghai.android.materialprogressbar;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* loaded from: me.zhanghai.android.materialprogressbar.library.1.1.4.jar:me/zhanghai/android/materialprogressbar/TintableDrawable.class */
public interface TintableDrawable {
    void setTint(@ColorInt int i);

    void setTintList(@Nullable ColorStateList colorStateList);

    void setTintMode(@NonNull PorterDuff.Mode mode);
}
