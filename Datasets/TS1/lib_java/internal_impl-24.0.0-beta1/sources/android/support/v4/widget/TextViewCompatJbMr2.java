package android.support.v4.widget;

import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.TextView;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/widget/TextViewCompatJbMr2.class */
class TextViewCompatJbMr2 {
    TextViewCompatJbMr2() {
    }

    public static void setCompoundDrawablesRelative(@NonNull TextView textView, @Nullable Drawable start, @Nullable Drawable top, @Nullable Drawable end, @Nullable Drawable bottom) {
        textView.setCompoundDrawablesRelative(start, top, end, bottom);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, @Nullable Drawable start, @Nullable Drawable top, @Nullable Drawable end, @Nullable Drawable bottom) {
        textView.setCompoundDrawablesRelativeWithIntrinsicBounds(start, top, end, bottom);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, @DrawableRes int start, @DrawableRes int top, @DrawableRes int end, @DrawableRes int bottom) {
        textView.setCompoundDrawablesRelativeWithIntrinsicBounds(start, top, end, bottom);
    }
}
