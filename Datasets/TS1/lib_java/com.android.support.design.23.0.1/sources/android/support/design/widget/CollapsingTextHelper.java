package android.support.design.widget;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.support.design.R;
import android.support.design.widget.Snackbar;
import android.support.v4.text.TextDirectionHeuristicsCompat;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.Interpolator;

/* loaded from: com.android.support.design.23.0.1.jar:android/support/design/widget/CollapsingTextHelper.class */
final class CollapsingTextHelper {
    private static final boolean USE_SCALING_TEXTURE;
    private static final boolean DEBUG_DRAW = false;
    private static final Paint DEBUG_DRAW_PAINT;
    private final View mView;
    private boolean mDrawTitle;
    private float mExpandedFraction;
    private final Rect mExpandedBounds;
    private final Rect mCollapsedBounds;
    private final RectF mCurrentBounds;
    private int mExpandedTextColor;
    private int mCollapsedTextColor;
    private float mExpandedDrawY;
    private float mCollapsedDrawY;
    private float mExpandedDrawX;
    private float mCollapsedDrawX;
    private float mCurrentDrawX;
    private float mCurrentDrawY;
    private CharSequence mText;
    private CharSequence mTextToDraw;
    private boolean mIsRtl;
    private boolean mUseTexture;
    private Bitmap mExpandedTitleTexture;
    private Paint mTexturePaint;
    private float mTextureAscent;
    private float mTextureDescent;
    private float mScale;
    private float mCurrentTextSize;
    private boolean mBoundsChanged;
    private Interpolator mPositionInterpolator;
    private Interpolator mTextSizeInterpolator;
    private int mExpandedTextGravity = 16;
    private int mCollapsedTextGravity = 16;
    private float mExpandedTextSize = 15.0f;
    private float mCollapsedTextSize = 15.0f;
    private final TextPaint mTextPaint = new TextPaint();

    static {
        USE_SCALING_TEXTURE = Build.VERSION.SDK_INT < 18;
        DEBUG_DRAW_PAINT = null;
        if (DEBUG_DRAW_PAINT != null) {
            DEBUG_DRAW_PAINT.setAntiAlias(true);
            DEBUG_DRAW_PAINT.setColor(-65281);
        }
    }

    public CollapsingTextHelper(View view) {
        this.mView = view;
        this.mTextPaint.setAntiAlias(true);
        this.mCollapsedBounds = new Rect();
        this.mExpandedBounds = new Rect();
        this.mCurrentBounds = new RectF();
    }

    void setTextSizeInterpolator(Interpolator interpolator) {
        this.mTextSizeInterpolator = interpolator;
        recalculate();
    }

    void setPositionInterpolator(Interpolator interpolator) {
        this.mPositionInterpolator = interpolator;
        recalculate();
    }

    void setExpandedTextSize(float textSize) {
        if (this.mExpandedTextSize != textSize) {
            this.mExpandedTextSize = textSize;
            recalculate();
        }
    }

    void setCollapsedTextSize(float textSize) {
        if (this.mCollapsedTextSize != textSize) {
            this.mCollapsedTextSize = textSize;
            recalculate();
        }
    }

    void setCollapsedTextColor(int textColor) {
        if (this.mCollapsedTextColor != textColor) {
            this.mCollapsedTextColor = textColor;
            recalculate();
        }
    }

    void setExpandedTextColor(int textColor) {
        if (this.mExpandedTextColor != textColor) {
            this.mExpandedTextColor = textColor;
            recalculate();
        }
    }

    void setExpandedBounds(int left, int top, int right, int bottom) {
        if (!rectEquals(this.mExpandedBounds, left, top, right, bottom)) {
            this.mExpandedBounds.set(left, top, right, bottom);
            this.mBoundsChanged = true;
            onBoundsChanged();
        }
    }

    void setCollapsedBounds(int left, int top, int right, int bottom) {
        if (!rectEquals(this.mCollapsedBounds, left, top, right, bottom)) {
            this.mCollapsedBounds.set(left, top, right, bottom);
            this.mBoundsChanged = true;
            onBoundsChanged();
        }
    }

    void onBoundsChanged() {
        this.mDrawTitle = this.mCollapsedBounds.width() > 0 && this.mCollapsedBounds.height() > 0 && this.mExpandedBounds.width() > 0 && this.mExpandedBounds.height() > 0;
    }

    void setExpandedTextGravity(int gravity) {
        if (this.mExpandedTextGravity != gravity) {
            this.mExpandedTextGravity = gravity;
            recalculate();
        }
    }

    int getExpandedTextGravity() {
        return this.mExpandedTextGravity;
    }

    void setCollapsedTextGravity(int gravity) {
        if (this.mCollapsedTextGravity != gravity) {
            this.mCollapsedTextGravity = gravity;
            recalculate();
        }
    }

    int getCollapsedTextGravity() {
        return this.mCollapsedTextGravity;
    }

    void setCollapsedTextAppearance(int resId) {
        TypedArray a = this.mView.getContext().obtainStyledAttributes(resId, R.styleable.TextAppearance);
        if (a.hasValue(R.styleable.TextAppearance_android_textColor)) {
            this.mCollapsedTextColor = a.getColor(R.styleable.TextAppearance_android_textColor, this.mCollapsedTextColor);
        }
        if (a.hasValue(R.styleable.TextAppearance_android_textSize)) {
            this.mCollapsedTextSize = a.getDimensionPixelSize(R.styleable.TextAppearance_android_textSize, (int) this.mCollapsedTextSize);
        }
        a.recycle();
        recalculate();
    }

    void setExpandedTextAppearance(int resId) {
        TypedArray a = this.mView.getContext().obtainStyledAttributes(resId, R.styleable.TextAppearance);
        if (a.hasValue(R.styleable.TextAppearance_android_textColor)) {
            this.mExpandedTextColor = a.getColor(R.styleable.TextAppearance_android_textColor, this.mExpandedTextColor);
        }
        if (a.hasValue(R.styleable.TextAppearance_android_textSize)) {
            this.mExpandedTextSize = a.getDimensionPixelSize(R.styleable.TextAppearance_android_textSize, (int) this.mExpandedTextSize);
        }
        a.recycle();
        recalculate();
    }

    void setTypeface(Typeface typeface) {
        if (typeface == null) {
            typeface = Typeface.DEFAULT;
        }
        if (this.mTextPaint.getTypeface() != typeface) {
            this.mTextPaint.setTypeface(typeface);
            recalculate();
        }
    }

    Typeface getTypeface() {
        return this.mTextPaint.getTypeface();
    }

    void setExpansionFraction(float fraction) {
        float fraction2 = MathUtils.constrain(fraction, 0.0f, 1.0f);
        if (fraction2 != this.mExpandedFraction) {
            this.mExpandedFraction = fraction2;
            calculateCurrentOffsets();
        }
    }

    float getExpansionFraction() {
        return this.mExpandedFraction;
    }

    float getCollapsedTextSize() {
        return this.mCollapsedTextSize;
    }

    float getExpandedTextSize() {
        return this.mExpandedTextSize;
    }

    private void calculateCurrentOffsets() {
        float fraction = this.mExpandedFraction;
        interpolateBounds(fraction);
        this.mCurrentDrawX = lerp(this.mExpandedDrawX, this.mCollapsedDrawX, fraction, this.mPositionInterpolator);
        this.mCurrentDrawY = lerp(this.mExpandedDrawY, this.mCollapsedDrawY, fraction, this.mPositionInterpolator);
        setInterpolatedTextSize(lerp(this.mExpandedTextSize, this.mCollapsedTextSize, fraction, this.mTextSizeInterpolator));
        if (this.mCollapsedTextColor != this.mExpandedTextColor) {
            this.mTextPaint.setColor(blendColors(this.mExpandedTextColor, this.mCollapsedTextColor, fraction));
        } else {
            this.mTextPaint.setColor(this.mCollapsedTextColor);
        }
        ViewCompat.postInvalidateOnAnimation(this.mView);
    }

    private void calculateBaseOffsets() {
        this.mTextPaint.setTextSize(this.mCollapsedTextSize);
        float width = this.mTextToDraw != null ? this.mTextPaint.measureText(this.mTextToDraw, 0, this.mTextToDraw.length()) : 0.0f;
        int collapsedAbsGravity = GravityCompat.getAbsoluteGravity(this.mCollapsedTextGravity, this.mIsRtl ? 1 : 0);
        switch (collapsedAbsGravity & 112) {
            case 16:
            default:
                float textHeight = this.mTextPaint.descent() - this.mTextPaint.ascent();
                float textOffset = (textHeight / 2.0f) - this.mTextPaint.descent();
                this.mCollapsedDrawY = this.mCollapsedBounds.centerY() + textOffset;
                break;
            case 48:
                this.mCollapsedDrawY = this.mCollapsedBounds.top - this.mTextPaint.ascent();
                break;
            case 80:
                this.mCollapsedDrawY = this.mCollapsedBounds.bottom;
                break;
        }
        switch (collapsedAbsGravity & 7) {
            case 1:
                this.mCollapsedDrawX = this.mCollapsedBounds.centerX() - (width / 2.0f);
                break;
            case 2:
            case Snackbar.Callback.DISMISS_EVENT_MANUAL /* 3 */:
            case 4:
            default:
                this.mCollapsedDrawX = this.mCollapsedBounds.left;
                break;
            case 5:
                this.mCollapsedDrawX = this.mCollapsedBounds.right - width;
                break;
        }
        this.mTextPaint.setTextSize(this.mExpandedTextSize);
        float width2 = this.mTextToDraw != null ? this.mTextPaint.measureText(this.mTextToDraw, 0, this.mTextToDraw.length()) : 0.0f;
        int expandedAbsGravity = GravityCompat.getAbsoluteGravity(this.mExpandedTextGravity, this.mIsRtl ? 1 : 0);
        switch (expandedAbsGravity & 112) {
            case 16:
            default:
                float textHeight2 = this.mTextPaint.descent() - this.mTextPaint.ascent();
                float textOffset2 = (textHeight2 / 2.0f) - this.mTextPaint.descent();
                this.mExpandedDrawY = this.mExpandedBounds.centerY() + textOffset2;
                break;
            case 48:
                this.mExpandedDrawY = this.mExpandedBounds.top - this.mTextPaint.ascent();
                break;
            case 80:
                this.mExpandedDrawY = this.mExpandedBounds.bottom;
                break;
        }
        switch (expandedAbsGravity & 7) {
            case 1:
                this.mExpandedDrawX = this.mExpandedBounds.centerX() - (width2 / 2.0f);
                break;
            case 2:
            case Snackbar.Callback.DISMISS_EVENT_MANUAL /* 3 */:
            case 4:
            default:
                this.mExpandedDrawX = this.mExpandedBounds.left;
                break;
            case 5:
                this.mExpandedDrawX = this.mExpandedBounds.right - width2;
                break;
        }
        clearTexture();
    }

    private void interpolateBounds(float fraction) {
        this.mCurrentBounds.left = lerp(this.mExpandedBounds.left, this.mCollapsedBounds.left, fraction, this.mPositionInterpolator);
        this.mCurrentBounds.top = lerp(this.mExpandedDrawY, this.mCollapsedDrawY, fraction, this.mPositionInterpolator);
        this.mCurrentBounds.right = lerp(this.mExpandedBounds.right, this.mCollapsedBounds.right, fraction, this.mPositionInterpolator);
        this.mCurrentBounds.bottom = lerp(this.mExpandedBounds.bottom, this.mCollapsedBounds.bottom, fraction, this.mPositionInterpolator);
    }

    public void draw(Canvas canvas) {
        float ascent;
        int saveCount = canvas.save();
        if (this.mTextToDraw != null && this.mDrawTitle) {
            float x = this.mCurrentDrawX;
            float y = this.mCurrentDrawY;
            boolean drawTexture = this.mUseTexture && this.mExpandedTitleTexture != null;
            this.mTextPaint.setTextSize(this.mCurrentTextSize);
            if (drawTexture) {
                ascent = this.mTextureAscent * this.mScale;
                float f = this.mTextureDescent * this.mScale;
            } else {
                ascent = this.mTextPaint.ascent() * this.mScale;
                float descent = this.mTextPaint.descent() * this.mScale;
            }
            if (drawTexture) {
                y += ascent;
            }
            if (this.mScale != 1.0f) {
                canvas.scale(this.mScale, this.mScale, x, y);
            }
            if (drawTexture) {
                canvas.drawBitmap(this.mExpandedTitleTexture, x, y, this.mTexturePaint);
            } else {
                canvas.drawText(this.mTextToDraw, 0, this.mTextToDraw.length(), x, y, this.mTextPaint);
            }
        }
        canvas.restoreToCount(saveCount);
    }

    private boolean calculateIsRtl(CharSequence text) {
        boolean defaultIsRtl = ViewCompat.getLayoutDirection(this.mView) == 1;
        return (defaultIsRtl ? TextDirectionHeuristicsCompat.FIRSTSTRONG_RTL : TextDirectionHeuristicsCompat.FIRSTSTRONG_LTR).isRtl(text, 0, text.length());
    }

    private void setInterpolatedTextSize(float textSize) {
        float availableWidth;
        float newTextSize;
        if (this.mText == null) {
            return;
        }
        boolean updateDrawText = false;
        if (isClose(textSize, this.mCollapsedTextSize)) {
            availableWidth = this.mCollapsedBounds.width();
            newTextSize = this.mCollapsedTextSize;
            this.mScale = 1.0f;
        } else {
            availableWidth = this.mExpandedBounds.width();
            newTextSize = this.mExpandedTextSize;
            if (isClose(textSize, this.mExpandedTextSize)) {
                this.mScale = 1.0f;
            } else {
                this.mScale = textSize / this.mExpandedTextSize;
            }
        }
        if (availableWidth > 0.0f) {
            updateDrawText = this.mCurrentTextSize != newTextSize || this.mBoundsChanged;
            this.mCurrentTextSize = newTextSize;
            this.mBoundsChanged = false;
        }
        if (this.mTextToDraw == null || updateDrawText) {
            this.mTextPaint.setTextSize(this.mCurrentTextSize);
            CharSequence title = TextUtils.ellipsize(this.mText, this.mTextPaint, availableWidth, TextUtils.TruncateAt.END);
            if (this.mTextToDraw == null || !this.mTextToDraw.equals(title)) {
                this.mTextToDraw = title;
            }
            this.mIsRtl = calculateIsRtl(this.mTextToDraw);
        }
        this.mUseTexture = USE_SCALING_TEXTURE && this.mScale != 1.0f;
        if (this.mUseTexture) {
            ensureExpandedTexture();
        }
        ViewCompat.postInvalidateOnAnimation(this.mView);
    }

    private void ensureExpandedTexture() {
        if (this.mExpandedTitleTexture != null || this.mExpandedBounds.isEmpty() || TextUtils.isEmpty(this.mTextToDraw)) {
            return;
        }
        this.mTextPaint.setTextSize(this.mExpandedTextSize);
        this.mTextPaint.setColor(this.mExpandedTextColor);
        this.mTextureAscent = this.mTextPaint.ascent();
        this.mTextureDescent = this.mTextPaint.descent();
        int w = Math.round(this.mTextPaint.measureText(this.mTextToDraw, 0, this.mTextToDraw.length()));
        int h = Math.round(this.mTextureDescent - this.mTextureAscent);
        if (w <= 0 && h <= 0) {
            return;
        }
        this.mExpandedTitleTexture = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(this.mExpandedTitleTexture);
        c.drawText(this.mTextToDraw, 0, this.mTextToDraw.length(), 0.0f, h - this.mTextPaint.descent(), this.mTextPaint);
        if (this.mTexturePaint == null) {
            this.mTexturePaint = new Paint(3);
        }
    }

    public void recalculate() {
        if (this.mView.getHeight() > 0 && this.mView.getWidth() > 0) {
            calculateBaseOffsets();
            calculateCurrentOffsets();
        }
    }

    void setText(CharSequence text) {
        if (text == null || !text.equals(this.mText)) {
            this.mText = text;
            this.mTextToDraw = null;
            clearTexture();
            recalculate();
        }
    }

    CharSequence getText() {
        return this.mText;
    }

    private void clearTexture() {
        if (this.mExpandedTitleTexture != null) {
            this.mExpandedTitleTexture.recycle();
            this.mExpandedTitleTexture = null;
        }
    }

    private static boolean isClose(float value, float targetValue) {
        return Math.abs(value - targetValue) < 0.001f;
    }

    int getExpandedTextColor() {
        return this.mExpandedTextColor;
    }

    int getCollapsedTextColor() {
        return this.mCollapsedTextColor;
    }

    private static int blendColors(int color1, int color2, float ratio) {
        float inverseRatio = 1.0f - ratio;
        float a = (Color.alpha(color1) * inverseRatio) + (Color.alpha(color2) * ratio);
        float r = (Color.red(color1) * inverseRatio) + (Color.red(color2) * ratio);
        float g = (Color.green(color1) * inverseRatio) + (Color.green(color2) * ratio);
        float b = (Color.blue(color1) * inverseRatio) + (Color.blue(color2) * ratio);
        return Color.argb((int) a, (int) r, (int) g, (int) b);
    }

    private static float lerp(float startValue, float endValue, float fraction, Interpolator interpolator) {
        if (interpolator != null) {
            fraction = interpolator.getInterpolation(fraction);
        }
        return AnimationUtils.lerp(startValue, endValue, fraction);
    }

    private static boolean rectEquals(Rect r, int left, int top, int right, int bottom) {
        return r.left == left && r.top == top && r.right == right && r.bottom == bottom;
    }
}
