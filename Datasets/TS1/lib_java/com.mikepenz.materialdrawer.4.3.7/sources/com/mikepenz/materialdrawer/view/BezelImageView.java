package com.mikepenz.materialdrawer.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import com.mikepenz.materialdrawer.BuildConfig;
import com.mikepenz.materialdrawer.MiniDrawer;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.util.DrawerImageLoader;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/view/BezelImageView.class */
public class BezelImageView extends ImageView {
    private Paint mBlackPaint;
    private Paint mMaskedPaint;
    private Rect mBounds;
    private RectF mBoundsF;
    private Drawable mMaskDrawable;
    private boolean mDrawCircularShadow;
    private ColorMatrixColorFilter mDesaturateColorFilter;
    private int mSelectorAlpha;
    private int mSelectorColor;
    private ColorFilter mSelectorFilter;
    private boolean mCacheValid;
    private Bitmap mCacheBitmap;
    private int mCachedWidth;
    private int mCachedHeight;
    private boolean isPressed;
    private boolean isSelected;
    private ColorMatrixColorFilter mTempDesaturateColorFilter;
    private ColorFilter mTempSelectorFilter;

    public BezelImageView(Context context) {
        this(context, null);
    }

    public BezelImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public BezelImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mDrawCircularShadow = true;
        this.mSelectorAlpha = 150;
        this.mCacheValid = false;
        this.isPressed = false;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.BezelImageView, defStyle, R.style.BezelImageView);
        this.mMaskDrawable = a.getDrawable(R.styleable.BezelImageView_biv_maskDrawable);
        if (this.mMaskDrawable != null) {
            this.mMaskDrawable.setCallback(this);
        }
        this.mDrawCircularShadow = a.getBoolean(R.styleable.BezelImageView_biv_drawCircularShadow, true);
        this.mSelectorColor = a.getColor(R.styleable.BezelImageView_biv_selectorOnPress, 0);
        a.recycle();
        this.mBlackPaint = new Paint();
        this.mBlackPaint.setColor(-16777216);
        this.mMaskedPaint = new Paint();
        this.mMaskedPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        this.mCacheBitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        ColorMatrix cm = new ColorMatrix();
        cm.setSaturation(0.0f);
        this.mDesaturateColorFilter = new ColorMatrixColorFilter(cm);
        if (this.mSelectorColor != 0) {
            this.mSelectorFilter = new PorterDuffColorFilter(Color.argb(this.mSelectorAlpha, Color.red(this.mSelectorColor), Color.green(this.mSelectorColor), Color.blue(this.mSelectorColor)), PorterDuff.Mode.SRC_ATOP);
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int old_w, int old_h) {
        if (Build.VERSION.SDK_INT >= 21 && this.mDrawCircularShadow) {
            setOutlineProvider(new CustomOutline(w, h));
        }
    }

    @TargetApi(21)
    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/view/BezelImageView$CustomOutline.class */
    private class CustomOutline extends ViewOutlineProvider {
        int width;
        int height;

        CustomOutline(int width, int height) {
            this.width = width;
            this.height = height;
        }

        @Override // android.view.ViewOutlineProvider
        public void getOutline(View view, Outline outline) {
            outline.setOval(0, 0, this.width, this.height);
        }
    }

    @Override // android.widget.ImageView
    protected boolean setFrame(int l, int t, int r, int b) {
        boolean changed = super.setFrame(l, t, r, b);
        this.mBounds = new Rect(0, 0, r - l, b - t);
        this.mBoundsF = new RectF(this.mBounds);
        if (this.mMaskDrawable != null) {
            this.mMaskDrawable.setBounds(this.mBounds);
        }
        if (changed) {
            this.mCacheValid = false;
        }
        return changed;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.mBounds == null) {
            return;
        }
        int width = this.mBounds.width();
        int height = this.mBounds.height();
        if (width == 0 || height == 0) {
            return;
        }
        if (!this.mCacheValid || width != this.mCachedWidth || height != this.mCachedHeight || this.isSelected != this.isPressed) {
            if (width == this.mCachedWidth && height == this.mCachedHeight) {
                this.mCacheBitmap.eraseColor(0);
            } else {
                this.mCacheBitmap.recycle();
                this.mCacheBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
                this.mCachedWidth = width;
                this.mCachedHeight = height;
            }
            Canvas cacheCanvas = new Canvas(this.mCacheBitmap);
            if (this.mMaskDrawable != null) {
                int sc = cacheCanvas.save();
                this.mMaskDrawable.draw(cacheCanvas);
                if (this.isSelected) {
                    if (this.mSelectorFilter != null) {
                        this.mMaskedPaint.setColorFilter(this.mSelectorFilter);
                    } else {
                        this.mMaskedPaint.setColorFilter(this.mDesaturateColorFilter);
                    }
                } else {
                    this.mMaskedPaint.setColorFilter(null);
                }
                cacheCanvas.saveLayer(this.mBoundsF, this.mMaskedPaint, 12);
                super.onDraw(cacheCanvas);
                cacheCanvas.restoreToCount(sc);
            } else if (this.isSelected) {
                int sc2 = cacheCanvas.save();
                cacheCanvas.drawRect(0.0f, 0.0f, this.mCachedWidth, this.mCachedHeight, this.mBlackPaint);
                if (this.mSelectorFilter != null) {
                    this.mMaskedPaint.setColorFilter(this.mSelectorFilter);
                } else {
                    this.mMaskedPaint.setColorFilter(this.mDesaturateColorFilter);
                }
                cacheCanvas.saveLayer(this.mBoundsF, this.mMaskedPaint, 12);
                super.onDraw(cacheCanvas);
                cacheCanvas.restoreToCount(sc2);
            } else {
                super.onDraw(cacheCanvas);
            }
        }
        canvas.drawBitmap(this.mCacheBitmap, this.mBounds.left, this.mBounds.top, (Paint) null);
        this.isPressed = isPressed();
    }

    @Override // android.view.View
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (!isClickable()) {
            this.isSelected = false;
            return super.onTouchEvent(event);
        }
        switch (event.getAction()) {
            case BuildConfig.DEBUG /* 0 */:
                this.isSelected = true;
                break;
            case MiniDrawer.PROFILE /* 1 */:
            case 3:
            case 4:
            case 8:
                this.isSelected = false;
                break;
        }
        invalidate();
        return super.dispatchTouchEvent(event);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mMaskDrawable != null && this.mMaskDrawable.isStateful()) {
            this.mMaskDrawable.setState(getDrawableState());
        }
        if (isDuplicateParentStateEnabled()) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    @Override // android.widget.ImageView, android.view.View, android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        if (who == this.mMaskDrawable) {
            invalidate();
        } else {
            super.invalidateDrawable(who);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return who == this.mMaskDrawable || super.verifyDrawable(who);
    }

    public void setSelectorColor(int selectorColor) {
        this.mSelectorColor = selectorColor;
        this.mSelectorFilter = new PorterDuffColorFilter(Color.argb(this.mSelectorAlpha, Color.red(this.mSelectorColor), Color.green(this.mSelectorColor), Color.blue(this.mSelectorColor)), PorterDuff.Mode.SRC_ATOP);
        invalidate();
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
    }

    @Override // android.widget.ImageView
    public void setImageResource(int resId) {
        super.setImageResource(resId);
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bm) {
        super.setImageBitmap(bm);
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        if ("http".equals(uri.getScheme()) || "https".equals(uri.getScheme())) {
            DrawerImageLoader.getInstance().setImage(this, uri, null);
        } else {
            super.setImageURI(uri);
        }
    }

    public void disableTouchFeedback(boolean disable) {
        if (disable) {
            this.mTempDesaturateColorFilter = this.mDesaturateColorFilter;
            this.mTempSelectorFilter = this.mSelectorFilter;
            this.mSelectorFilter = null;
            this.mDesaturateColorFilter = null;
            return;
        }
        if (this.mTempDesaturateColorFilter != null) {
            this.mDesaturateColorFilter = this.mTempDesaturateColorFilter;
        }
        if (this.mTempSelectorFilter != null) {
            this.mSelectorFilter = this.mTempSelectorFilter;
        }
    }
}
