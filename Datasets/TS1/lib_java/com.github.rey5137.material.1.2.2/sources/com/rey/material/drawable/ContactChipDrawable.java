package com.rey.material.drawable;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.BoringLayout;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/ContactChipDrawable.class */
public class ContactChipDrawable extends Drawable {
    private Paint mPaint = new Paint(1);
    private int mPaddingLeft;
    private int mPaddingRight;
    private int mBackgroundColor;
    private CharSequence mContactName;
    private BoringLayout mBoringLayout;
    private BoringLayout.Metrics mMetrics;
    private TextPaint mTextPaint;
    private RectF mRect;
    private BitmapShader mBitmapShader;
    private Bitmap mBitmap;
    private Matrix mMatrix;

    public ContactChipDrawable(int paddingLeft, int paddingRight, Typeface typeface, int textColor, int textSize, int backgroundColor) {
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(textColor);
        this.mPaint.setTypeface(typeface);
        this.mPaint.setTextSize(textSize);
        this.mTextPaint = new TextPaint(this.mPaint);
        this.mMetrics = new BoringLayout.Metrics();
        Paint.FontMetricsInt temp = this.mTextPaint.getFontMetricsInt();
        this.mMetrics.ascent = temp.ascent;
        this.mMetrics.bottom = temp.bottom;
        this.mMetrics.descent = temp.descent;
        this.mMetrics.top = temp.top;
        this.mMetrics.leading = temp.leading;
        this.mRect = new RectF();
        this.mMatrix = new Matrix();
        this.mPaddingLeft = paddingLeft;
        this.mPaddingRight = paddingRight;
        this.mBackgroundColor = backgroundColor;
    }

    public void setContactName(CharSequence name) {
        this.mContactName = name;
        updateLayout();
        invalidateSelf();
    }

    public void setImage(Bitmap bm) {
        if (this.mBitmap != bm) {
            this.mBitmap = bm;
            if (this.mBitmap != null) {
                this.mBitmapShader = new BitmapShader(this.mBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
                updateMatrix();
            }
            invalidateSelf();
        }
    }

    private void updateLayout() {
        if (this.mContactName == null) {
            return;
        }
        Rect bounds = getBounds();
        if (bounds.width() == 0 || bounds.height() == 0) {
            return;
        }
        int outerWidth = Math.max(0, ((bounds.width() - bounds.height()) - this.mPaddingLeft) - this.mPaddingRight);
        this.mMetrics.width = Math.round(this.mTextPaint.measureText(this.mContactName, 0, this.mContactName.length()) + 0.5f);
        if (this.mBoringLayout == null) {
            this.mBoringLayout = BoringLayout.make(this.mContactName, this.mTextPaint, outerWidth, Layout.Alignment.ALIGN_NORMAL, 1.0f, 1.0f, this.mMetrics, true, TextUtils.TruncateAt.END, outerWidth);
        } else {
            this.mBoringLayout = this.mBoringLayout.replaceOrMake(this.mContactName, this.mTextPaint, outerWidth, Layout.Alignment.ALIGN_NORMAL, 1.0f, 1.0f, this.mMetrics, true, TextUtils.TruncateAt.END, outerWidth);
        }
    }

    private void updateMatrix() {
        if (this.mBitmap == null) {
            return;
        }
        Rect bounds = getBounds();
        if (bounds.width() == 0 || bounds.height() == 0) {
            return;
        }
        this.mMatrix.reset();
        float scale = bounds.height() / Math.min(this.mBitmap.getWidth(), this.mBitmap.getHeight());
        this.mMatrix.setScale(scale, scale, 0.0f, 0.0f);
        this.mMatrix.postTranslate((bounds.height() - (this.mBitmap.getWidth() * scale)) / 2.0f, (bounds.height() - (this.mBitmap.getHeight() * scale)) / 2.0f);
        this.mBitmapShader.setLocalMatrix(this.mMatrix);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        updateLayout();
        updateMatrix();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int saveCount = canvas.save();
        Rect bounds = getBounds();
        float halfHeight = bounds.height() / 2.0f;
        this.mPaint.setShader(null);
        this.mPaint.setColor(this.mBackgroundColor);
        this.mRect.set(1.0f, 0.0f, bounds.height() + 1, bounds.height());
        canvas.drawArc(this.mRect, 90.0f, 180.0f, true, this.mPaint);
        this.mRect.set(bounds.width() - bounds.height(), 0.0f, bounds.width(), bounds.height());
        canvas.drawArc(this.mRect, 270.0f, 180.0f, true, this.mPaint);
        this.mRect.set(halfHeight, 0.0f, bounds.width() - halfHeight, bounds.height());
        canvas.drawRect(this.mRect, this.mPaint);
        if (this.mBitmap != null) {
            this.mPaint.setShader(this.mBitmapShader);
            canvas.drawCircle(halfHeight, halfHeight, halfHeight, this.mPaint);
        }
        if (this.mContactName != null && this.mBoringLayout != null) {
            canvas.translate(bounds.height() + this.mPaddingLeft, (bounds.height() - this.mBoringLayout.getHeight()) / 2.0f);
            this.mBoringLayout.draw(canvas);
        }
        canvas.restoreToCount(saveCount);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }
}
