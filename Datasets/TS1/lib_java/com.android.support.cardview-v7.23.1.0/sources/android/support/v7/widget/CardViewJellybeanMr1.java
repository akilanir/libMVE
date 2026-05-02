package android.support.v7.widget;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.support.v7.widget.RoundRectDrawableWithShadow;

/* loaded from: com.android.support.cardview-v7.23.1.0.jar:android/support/v7/widget/CardViewJellybeanMr1.class */
class CardViewJellybeanMr1 extends CardViewEclairMr1 {
    CardViewJellybeanMr1() {
    }

    @Override // android.support.v7.widget.CardViewEclairMr1, android.support.v7.widget.CardViewImpl
    public void initStatic() {
        RoundRectDrawableWithShadow.sRoundRectHelper = new RoundRectDrawableWithShadow.RoundRectHelper() { // from class: android.support.v7.widget.CardViewJellybeanMr1.1
            @Override // android.support.v7.widget.RoundRectDrawableWithShadow.RoundRectHelper
            public void drawRoundRect(Canvas canvas, RectF bounds, float cornerRadius, Paint paint) {
                canvas.drawRoundRect(bounds, cornerRadius, cornerRadius, paint);
            }
        };
    }
}
