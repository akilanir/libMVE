package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.animation.BounceInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ButtonFloat.class */
public class ButtonFloat extends Button {
    int sizeIcon;
    int sizeRadius;
    ImageView icon;
    Drawable drawableIcon;
    public boolean isShow;
    float showPosition;
    float hidePosition;
    Integer height;
    Integer width;

    public ButtonFloat(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.sizeIcon = 24;
        this.sizeRadius = 28;
        this.isShow = false;
        setBackgroundResource(R.drawable.background_button_float);
        this.sizeRadius = 28;
        setDefaultProperties();
        this.icon = new ImageView(context);
        this.icon.setAdjustViewBounds(true);
        this.icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        if (this.drawableIcon != null) {
            this.icon.setImageDrawable(this.drawableIcon);
        }
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(Utils.dpToPx(this.sizeIcon, getResources()), Utils.dpToPx(this.sizeIcon, getResources()));
        params.addRule(13, -1);
        this.icon.setLayoutParams(params);
        addView(this.icon);
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setDefaultProperties() {
        this.rippleSpeed = Utils.dpToPx(2.0f, getResources());
        this.rippleSize = Utils.dpToPx(5.0f, getResources());
        setMinimumWidth(Utils.dpToPx(this.sizeRadius * 2, getResources()));
        setMinimumHeight(Utils.dpToPx(this.sizeRadius * 2, getResources()));
        this.background = R.drawable.background_button_float;
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setAttributes(AttributeSet attrs) {
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            this.background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (this.background != -1) {
                setBackgroundColor(this.background);
            }
        }
        int rippleColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res-auto", "rippleColor", -1);
        if (rippleColor != -1) {
            setRippleColor(getResources().getColor(rippleColor));
        } else {
            int background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "rippleColor", -1);
            if (background != -1) {
                setRippleColor(background);
            } else {
                setRippleColor(makePressColor());
            }
        }
        int iconResource = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res-auto", "iconDrawable", -1);
        if (iconResource != -1) {
            this.drawableIcon = getResources().getDrawable(iconResource);
        }
        final boolean animate = attrs.getAttributeBooleanValue("http://schemas.android.com/apk/res-auto", "animate", false);
        post(new Runnable() { // from class: com.gc.materialdesign.views.ButtonFloat.1
            @Override // java.lang.Runnable
            public void run() {
                ButtonFloat.this.showPosition = ViewHelper.getY(ButtonFloat.this) - Utils.dpToPx(24.0f, ButtonFloat.this.getResources());
                ButtonFloat.this.hidePosition = ViewHelper.getY(ButtonFloat.this) + (ButtonFloat.this.getHeight() * 3);
                if (animate) {
                    ViewHelper.setY(ButtonFloat.this, ButtonFloat.this.hidePosition);
                    ButtonFloat.this.show();
                }
            }
        });
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.x != -1.0f) {
            Rect src = new Rect(0, 0, getWidth(), getHeight());
            Rect dst = new Rect(Utils.dpToPx(1.0f, getResources()), Utils.dpToPx(2.0f, getResources()), getWidth() - Utils.dpToPx(1.0f, getResources()), getHeight() - Utils.dpToPx(2.0f, getResources()));
            canvas.drawBitmap(cropCircle(makeCircle()), src, dst, (Paint) null);
            invalidate();
        }
    }

    public ImageView getIcon() {
        return this.icon;
    }

    public void setIcon(ImageView icon) {
        this.icon = icon;
    }

    public Drawable getDrawableIcon() {
        return this.drawableIcon;
    }

    public void setDrawableIcon(Drawable drawableIcon) {
        this.drawableIcon = drawableIcon;
        try {
            this.icon.setBackground(drawableIcon);
        } catch (NoSuchMethodError e) {
            this.icon.setBackgroundDrawable(drawableIcon);
        }
    }

    public Bitmap cropCircle(Bitmap bitmap) {
        Bitmap output = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);
        Paint paint = new Paint();
        Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        paint.setAntiAlias(true);
        canvas.drawARGB(0, 0, 0, 0);
        paint.setColor(-12434878);
        canvas.drawCircle(bitmap.getWidth() / 2, bitmap.getHeight() / 2, bitmap.getWidth() / 2, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, rect, rect, paint);
        return output;
    }

    @Override // com.gc.materialdesign.views.Button
    public TextView getTextView() {
        return null;
    }

    public void setRippleColor(int rippleColor) {
        this.rippleColor = Integer.valueOf(rippleColor);
    }

    public void show() {
        ObjectAnimator animator = ObjectAnimator.ofFloat(this, "y", new float[]{this.showPosition});
        animator.setInterpolator(new BounceInterpolator());
        animator.setDuration(1500L);
        animator.start();
        this.isShow = true;
    }

    public void hide() {
        ObjectAnimator animator = ObjectAnimator.ofFloat(this, "y", new float[]{this.hidePosition});
        animator.setInterpolator(new BounceInterpolator());
        animator.setDuration(1500L);
        animator.start();
        this.isShow = false;
    }

    public boolean isShow() {
        return this.isShow;
    }
}
