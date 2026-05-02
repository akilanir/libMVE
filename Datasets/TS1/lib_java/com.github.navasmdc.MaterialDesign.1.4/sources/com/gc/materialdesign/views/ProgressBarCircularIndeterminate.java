package com.gc.materialdesign.views;

import android.R;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.util.AttributeSet;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ProgressBarCircularIndeterminate.class */
public class ProgressBarCircularIndeterminate extends CustomView {
    static final String ANDROIDXML = "http://schemas.android.com/apk/res/android";
    int backgroundColor;
    float radius1;
    float radius2;
    int cont;
    boolean firstAnimationOver;
    int arcD;
    int arcO;
    float rotateAngle;
    int limite;

    public ProgressBarCircularIndeterminate(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.backgroundColor = Color.parseColor("#1E88E5");
        this.radius1 = 0.0f;
        this.radius2 = 0.0f;
        this.cont = 0;
        this.firstAnimationOver = false;
        this.arcD = 1;
        this.arcO = 0;
        this.rotateAngle = 0.0f;
        this.limite = 0;
        setAttributes(attrs);
    }

    protected void setAttributes(AttributeSet attrs) {
        setMinimumHeight(Utils.dpToPx(32.0f, getResources()));
        setMinimumWidth(Utils.dpToPx(32.0f, getResources()));
        int bacgroundColor = attrs.getAttributeResourceValue(ANDROIDXML, "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            int background = attrs.getAttributeIntValue(ANDROIDXML, "background", -1);
            if (background != -1) {
                setBackgroundColor(background);
            } else {
                setBackgroundColor(Color.parseColor("#1E88E5"));
            }
        }
        setMinimumHeight(Utils.dpToPx(3.0f, getResources()));
    }

    protected int makePressColor() {
        int r = (this.backgroundColor >> 16) & 255;
        int g = (this.backgroundColor >> 8) & 255;
        int b = (this.backgroundColor >> 0) & 255;
        return Color.argb(128, r, g, b);
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.firstAnimationOver) {
            drawFirstAnimation(canvas);
        }
        if (this.cont > 0) {
            drawSecondAnimation(canvas);
        }
        invalidate();
    }

    private void drawFirstAnimation(Canvas canvas) {
        if (this.radius1 < getWidth() / 2) {
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(makePressColor());
            this.radius1 = this.radius1 >= ((float) (getWidth() / 2)) ? getWidth() / 2.0f : this.radius1 + 1.0f;
            canvas.drawCircle(getWidth() / 2, getHeight() / 2, this.radius1, paint);
            return;
        }
        Bitmap bitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas temp = new Canvas(bitmap);
        Paint paint2 = new Paint();
        paint2.setAntiAlias(true);
        paint2.setColor(makePressColor());
        temp.drawCircle(getWidth() / 2, getHeight() / 2, getHeight() / 2, paint2);
        Paint transparentPaint = new Paint();
        transparentPaint.setAntiAlias(true);
        transparentPaint.setColor(getResources().getColor(R.color.transparent));
        transparentPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        if (this.cont >= 50) {
            this.radius2 = this.radius2 >= ((float) (getWidth() / 2)) ? getWidth() / 2.0f : this.radius2 + 1.0f;
        } else {
            this.radius2 = this.radius2 >= ((float) ((getWidth() / 2) - Utils.dpToPx(4.0f, getResources()))) ? (getWidth() / 2.0f) - Utils.dpToPx(4.0f, getResources()) : this.radius2 + 1.0f;
        }
        temp.drawCircle(getWidth() / 2, getHeight() / 2, this.radius2, transparentPaint);
        canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint());
        if (this.radius2 >= (getWidth() / 2) - Utils.dpToPx(4.0f, getResources())) {
            this.cont++;
        }
        if (this.radius2 >= getWidth() / 2) {
            this.firstAnimationOver = true;
        }
    }

    private void drawSecondAnimation(Canvas canvas) {
        if (this.arcO == this.limite) {
            this.arcD += 6;
        }
        if (this.arcD >= 290 || this.arcO > this.limite) {
            this.arcO += 6;
            this.arcD -= 6;
        }
        if (this.arcO > this.limite + 290) {
            this.limite = this.arcO;
            this.arcO = this.limite;
            this.arcD = 1;
        }
        this.rotateAngle += 4.0f;
        canvas.rotate(this.rotateAngle, getWidth() / 2, getHeight() / 2);
        Bitmap bitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas temp = new Canvas(bitmap);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setColor(this.backgroundColor);
        temp.drawArc(new RectF(0.0f, 0.0f, getWidth(), getHeight()), this.arcO, this.arcD, true, paint);
        Paint transparentPaint = new Paint();
        transparentPaint.setAntiAlias(true);
        transparentPaint.setColor(getResources().getColor(R.color.transparent));
        transparentPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        temp.drawCircle(getWidth() / 2, getHeight() / 2, (getWidth() / 2) - Utils.dpToPx(4.0f, getResources()), transparentPaint);
        canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint());
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        super.setBackgroundColor(getResources().getColor(R.color.transparent));
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        this.backgroundColor = color;
    }
}
