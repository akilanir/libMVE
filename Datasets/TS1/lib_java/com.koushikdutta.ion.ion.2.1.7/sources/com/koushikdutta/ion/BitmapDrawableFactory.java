package com.koushikdutta.ion;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/BitmapDrawableFactory.class */
public interface BitmapDrawableFactory {
    public static final BitmapDrawableFactory DEFAULT = new BitmapDrawableFactory() { // from class: com.koushikdutta.ion.BitmapDrawableFactory.1
        @Override // com.koushikdutta.ion.BitmapDrawableFactory
        public Drawable fromBitmap(Resources resources, Bitmap bitmap) {
            return new BitmapDrawable(resources, bitmap);
        }
    };

    Drawable fromBitmap(Resources resources, Bitmap bitmap);
}
