package com.rey.material.text.style;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.text.BoringLayout;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ReplacementSpan;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/text/style/ContactChipSpan.class */
public class ContactChipSpan extends ReplacementSpan {
    private Paint mPaint = new Paint(1);
    private int mPaddingLeft;
    private int mPaddingRight;
    private int mBackgroundColor;
    private int mHeight;
    private int mWidth;
    private CharSequence mContactName;
    private BoringLayout mBoringLayout;
    private TextPaint mTextPaint;
    private RectF mRect;
    private BitmapShader mBitmapShader;
    private Bitmap mBitmap;
    private Matrix mMatrix;

    public ContactChipSpan(CharSequence name, int height, int maxWidth, int paddingLeft, int paddingRight, Typeface typeface, int textColor, int textSize, int backgroundColor) {
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(textColor);
        this.mPaint.setTypeface(typeface);
        this.mPaint.setTextSize(textSize);
        this.mTextPaint = new TextPaint(this.mPaint);
        this.mRect = new RectF();
        this.mMatrix = new Matrix();
        this.mContactName = name;
        this.mPaddingLeft = paddingLeft;
        this.mPaddingRight = paddingRight;
        this.mBackgroundColor = backgroundColor;
        this.mHeight = height;
        this.mWidth = Math.round(Math.min(maxWidth, this.mPaint.measureText(name, 0, name.length()) + paddingLeft + paddingRight + height));
        int outerWidth = Math.max(0, ((this.mWidth - this.mPaddingLeft) - this.mPaddingRight) - this.mHeight);
        Paint.FontMetricsInt temp = this.mTextPaint.getFontMetricsInt();
        BoringLayout.Metrics mMetrics = new BoringLayout.Metrics();
        mMetrics.width = Math.round(this.mTextPaint.measureText(this.mContactName, 0, this.mContactName.length()) + 0.5f);
        mMetrics.ascent = temp.ascent;
        mMetrics.bottom = temp.bottom;
        mMetrics.descent = temp.descent;
        mMetrics.top = temp.top;
        mMetrics.leading = temp.leading;
        this.mBoringLayout = BoringLayout.make(this.mContactName, this.mTextPaint, outerWidth, Layout.Alignment.ALIGN_NORMAL, 1.0f, 1.0f, mMetrics, true, TextUtils.TruncateAt.END, outerWidth);
    }

    public void setImage(Bitmap bm) {
        if (this.mBitmap != bm) {
            this.mBitmap = bm;
            if (this.mBitmap != null) {
                this.mBitmapShader = new BitmapShader(this.mBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
                this.mMatrix.reset();
                float scale = this.mHeight / Math.min(this.mBitmap.getWidth(), this.mBitmap.getHeight());
                this.mMatrix.setScale(scale, scale, 0.0f, 0.0f);
                this.mMatrix.postTranslate((this.mHeight - (this.mBitmap.getWidth() * scale)) / 2.0f, (this.mHeight - (this.mBitmap.getHeight() * scale)) / 2.0f);
                this.mBitmapShader.setLocalMatrix(this.mMatrix);
            }
        }
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        if (fm != null) {
            int cy = (fm.ascent + fm.descent) / 2;
            fm.ascent = Math.min(fm.ascent, cy - (this.mHeight / 2));
            fm.descent = Math.max(fm.descent, cy + (this.mHeight / 2));
            fm.top = Math.min(fm.top, fm.ascent);
            fm.bottom = Math.max(fm.bottom, fm.descent);
        }
        return this.mWidth;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        canvas.save();
        canvas.translate(x, top);
        float halfHeight = this.mHeight / 2.0f;
        this.mPaint.setShader(null);
        this.mPaint.setColor(this.mBackgroundColor);
        this.mRect.set(1.0f, 0.0f, this.mHeight + 1, this.mHeight);
        canvas.drawArc(this.mRect, 90.0f, 180.0f, true, this.mPaint);
        this.mRect.set(this.mWidth - this.mHeight, 0.0f, this.mWidth, this.mHeight);
        canvas.drawArc(this.mRect, 270.0f, 180.0f, true, this.mPaint);
        this.mRect.set(halfHeight, 0.0f, this.mWidth - halfHeight, this.mHeight);
        canvas.drawRect(this.mRect, this.mPaint);
        if (this.mBitmap != null) {
            this.mPaint.setShader(this.mBitmapShader);
            canvas.drawCircle(halfHeight, halfHeight, halfHeight, this.mPaint);
        }
        if (this.mContactName != null && this.mBoringLayout != null) {
            canvas.translate(this.mHeight + this.mPaddingLeft, (this.mHeight - this.mBoringLayout.getHeight()) / 2.0f);
            this.mBoringLayout.draw(canvas);
        }
        canvas.restore();
    }
}
