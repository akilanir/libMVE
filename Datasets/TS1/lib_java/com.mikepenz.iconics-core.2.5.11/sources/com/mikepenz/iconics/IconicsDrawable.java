package com.mikepenz.iconics;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.v4.content.ContextCompat;
import android.text.TextPaint;
import android.util.Log;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.iconics.typeface.ITypeface;
import com.mikepenz.iconics.utils.Utils;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/IconicsDrawable.class */
public class IconicsDrawable extends Drawable {
    public static final int ANDROID_ACTIONBAR_ICON_SIZE_DP = 24;
    public static final int ANDROID_ACTIONBAR_ICON_SIZE_PADDING_DP = 1;
    private Context mContext;
    private int mIconColor;
    private Paint mIconPaint;
    private int mContourColor;
    private Paint mContourPaint;
    private int mBackgroundColor;
    private Paint mBackgroundPaint;
    private Rect mPaddingBounds;
    private RectF mPathBounds;
    private Path mPath;
    private int mIconPadding;
    private int mContourWidth;
    private boolean mDrawContour;
    private IIcon mIcon;
    private String mPlainIcon;
    private int mSizeX = -1;
    private int mSizeY = -1;
    private int mRoundedCornerRx = -1;
    private int mRoundedCornerRy = -1;
    private int mIconOffsetX = 0;
    private int mIconOffsetY = 0;
    private int mAlpha = 255;

    public IconicsDrawable(Context context) {
        this.mContext = context.getApplicationContext();
        prepare();
        icon((Character) ' ');
    }

    public IconicsDrawable(Context context, Character icon) {
        this.mContext = context.getApplicationContext();
        prepare();
        icon(icon);
    }

    public IconicsDrawable(Context context, String icon) {
        this.mContext = context.getApplicationContext();
        prepare();
        try {
            ITypeface font = Iconics.findFont(context, icon.substring(0, 3));
            icon = icon.replace("-", "_");
            icon(font.getIcon(icon));
        } catch (Exception e) {
            Log.e(Iconics.TAG, "Wrong icon name: " + icon);
        }
    }

    public IconicsDrawable(Context context, IIcon icon) {
        this.mContext = context.getApplicationContext();
        prepare();
        icon(icon);
    }

    protected IconicsDrawable(Context context, ITypeface typeface, IIcon icon) {
        this.mContext = context.getApplicationContext();
        prepare();
        icon(typeface, icon);
    }

    private void prepare() {
        this.mIconPaint = new TextPaint(1);
        this.mIconPaint.setStyle(Paint.Style.FILL);
        this.mIconPaint.setTextAlign(Paint.Align.CENTER);
        this.mIconPaint.setUnderlineText(false);
        this.mIconPaint.setAntiAlias(true);
        this.mBackgroundPaint = new Paint(1);
        this.mContourPaint = new Paint(1);
        this.mContourPaint.setStyle(Paint.Style.STROKE);
        this.mPath = new Path();
        this.mPathBounds = new RectF();
        this.mPaddingBounds = new Rect();
    }

    public IconicsDrawable icon(String icon) {
        try {
            ITypeface font = Iconics.findFont(this.mContext, icon.substring(0, 3));
            icon = icon.replace("-", "_");
            icon(font.getIcon(icon));
        } catch (Exception e) {
            Log.e(Iconics.TAG, "Wrong icon name: " + icon);
        }
        return this;
    }

    public IconicsDrawable icon(Character icon) {
        return iconText(icon.toString());
    }

    public IconicsDrawable iconText(String icon) {
        this.mPlainIcon = icon;
        this.mIcon = null;
        this.mIconPaint.setTypeface(Typeface.DEFAULT);
        invalidateSelf();
        return this;
    }

    public IconicsDrawable icon(IIcon icon) {
        this.mIcon = icon;
        this.mPlainIcon = null;
        ITypeface typeface = icon.getTypeface();
        this.mIconPaint.setTypeface(typeface.getTypeface(this.mContext));
        invalidateSelf();
        return this;
    }

    protected IconicsDrawable icon(ITypeface typeface, IIcon icon) {
        this.mIcon = icon;
        this.mIconPaint.setTypeface(typeface.getTypeface(this.mContext));
        invalidateSelf();
        return this;
    }

    public IconicsDrawable color(@ColorInt int color) {
        int red = Color.red(color);
        int green = Color.green(color);
        int blue = Color.blue(color);
        this.mIconPaint.setColor(Color.rgb(red, green, blue));
        this.mIconColor = color;
        setAlpha(Color.alpha(color));
        invalidateSelf();
        return this;
    }

    public IconicsDrawable colorRes(@ColorRes int colorRes) {
        return color(ContextCompat.getColor(this.mContext, colorRes));
    }

    public int getColor() {
        return this.mIconColor;
    }

    public int getContourColor() {
        return this.mContourColor;
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public IconicsDrawable iconOffsetXRes(@DimenRes int iconOffsetXRes) {
        return iconOffsetXPx(this.mContext.getResources().getDimensionPixelSize(iconOffsetXRes));
    }

    public IconicsDrawable iconOffsetXDp(int iconOffsetXDp) {
        return iconOffsetXPx(Utils.convertDpToPx(this.mContext, iconOffsetXDp));
    }

    public IconicsDrawable iconOffsetXPx(int iconOffsetX) {
        this.mIconOffsetX = iconOffsetX;
        return this;
    }

    public IconicsDrawable iconOffsetYRes(@DimenRes int iconOffsetYRes) {
        return iconOffsetYPx(this.mContext.getResources().getDimensionPixelSize(iconOffsetYRes));
    }

    public IconicsDrawable iconOffsetYDp(int iconOffsetYDp) {
        return iconOffsetYPx(Utils.convertDpToPx(this.mContext, iconOffsetYDp));
    }

    public IconicsDrawable iconOffsetYPx(int iconOffsetY) {
        this.mIconOffsetY = iconOffsetY;
        return this;
    }

    public IconicsDrawable paddingRes(@DimenRes int dimenRes) {
        return paddingPx(this.mContext.getResources().getDimensionPixelSize(dimenRes));
    }

    public IconicsDrawable paddingDp(int iconPadding) {
        return paddingPx(Utils.convertDpToPx(this.mContext, iconPadding));
    }

    public IconicsDrawable paddingPx(int iconPadding) {
        if (this.mIconPadding != iconPadding) {
            this.mIconPadding = iconPadding;
            if (this.mDrawContour) {
                this.mIconPadding += this.mContourWidth;
            }
            invalidateSelf();
        }
        return this;
    }

    @Deprecated
    public IconicsDrawable actionBarSize() {
        return sizeDp(24);
    }

    public IconicsDrawable actionBar() {
        sizeDp(24);
        paddingDp(1);
        return this;
    }

    public IconicsDrawable sizeRes(@DimenRes int dimenRes) {
        return sizePx(this.mContext.getResources().getDimensionPixelSize(dimenRes));
    }

    public IconicsDrawable sizeDp(int size) {
        return sizePx(Utils.convertDpToPx(this.mContext, size));
    }

    public IconicsDrawable sizePx(int size) {
        this.mSizeX = size;
        this.mSizeY = size;
        setBounds(0, 0, size, size);
        invalidateSelf();
        return this;
    }

    public IconicsDrawable sizeResX(@DimenRes int dimenResX) {
        return sizePxX(this.mContext.getResources().getDimensionPixelSize(dimenResX));
    }

    public IconicsDrawable sizeDpX(int sizeX) {
        return sizePxX(Utils.convertDpToPx(this.mContext, sizeX));
    }

    public IconicsDrawable sizePxX(int sizeX) {
        this.mSizeX = sizeX;
        setBounds(0, 0, this.mSizeX, this.mSizeY);
        invalidateSelf();
        return this;
    }

    public IconicsDrawable sizeResY(@DimenRes int dimenResY) {
        return sizePxY(this.mContext.getResources().getDimensionPixelSize(dimenResY));
    }

    public IconicsDrawable sizeDpY(int sizeY) {
        return sizePxY(Utils.convertDpToPx(this.mContext, sizeY));
    }

    public IconicsDrawable sizePxY(int sizeY) {
        this.mSizeY = sizeY;
        setBounds(0, 0, this.mSizeX, this.mSizeY);
        invalidateSelf();
        return this;
    }

    public IconicsDrawable contourColor(@ColorInt int contourColor) {
        int red = Color.red(contourColor);
        int green = Color.green(contourColor);
        int blue = Color.blue(contourColor);
        this.mContourPaint.setColor(Color.rgb(red, green, blue));
        this.mContourPaint.setAlpha(Color.alpha(contourColor));
        this.mContourColor = contourColor;
        invalidateSelf();
        return this;
    }

    public IconicsDrawable contourColorRes(@ColorRes int contourColorRes) {
        return contourColor(ContextCompat.getColor(this.mContext, contourColorRes));
    }

    public IconicsDrawable backgroundColor(@ColorInt int backgroundColor) {
        this.mBackgroundPaint.setColor(backgroundColor);
        this.mBackgroundColor = backgroundColor;
        this.mRoundedCornerRx = 0;
        this.mRoundedCornerRy = 0;
        return this;
    }

    public IconicsDrawable backgroundColorRes(@ColorRes int backgroundColorRes) {
        return backgroundColor(ContextCompat.getColor(this.mContext, backgroundColorRes));
    }

    public IconicsDrawable roundedCornersRxRes(@DimenRes int roundedCornerRxRes) {
        this.mRoundedCornerRx = this.mContext.getResources().getDimensionPixelSize(roundedCornerRxRes);
        return this;
    }

    public IconicsDrawable roundedCornersRxDp(int roundedCornerRxDp) {
        this.mRoundedCornerRx = Utils.convertDpToPx(this.mContext, roundedCornerRxDp);
        return this;
    }

    public IconicsDrawable roundedCornersRxPx(int roundedCornerRxPx) {
        this.mRoundedCornerRx = roundedCornerRxPx;
        return this;
    }

    public IconicsDrawable roundedCornersRyRes(@DimenRes int roundedCornerRyRes) {
        this.mRoundedCornerRy = this.mContext.getResources().getDimensionPixelSize(roundedCornerRyRes);
        return this;
    }

    public IconicsDrawable roundedCornersRyDp(int roundedCornerRyDp) {
        this.mRoundedCornerRy = Utils.convertDpToPx(this.mContext, roundedCornerRyDp);
        return this;
    }

    public IconicsDrawable roundedCornersRyPx(int roundedCornerRyPx) {
        this.mRoundedCornerRy = roundedCornerRyPx;
        return this;
    }

    public IconicsDrawable roundedCornersRes(@DimenRes int roundedCornerRes) {
        this.mRoundedCornerRx = this.mContext.getResources().getDimensionPixelSize(roundedCornerRes);
        this.mRoundedCornerRy = this.mRoundedCornerRx;
        return this;
    }

    public IconicsDrawable roundedCornersDp(int roundedCornerDp) {
        this.mRoundedCornerRx = Utils.convertDpToPx(this.mContext, roundedCornerDp);
        this.mRoundedCornerRy = this.mRoundedCornerRx;
        return this;
    }

    public IconicsDrawable roundedCornersPx(int roundedCornerPx) {
        this.mRoundedCornerRx = roundedCornerPx;
        this.mRoundedCornerRy = this.mRoundedCornerRx;
        return this;
    }

    public IconicsDrawable contourWidthRes(@DimenRes int contourWidthRes) {
        return contourWidthPx(this.mContext.getResources().getDimensionPixelSize(contourWidthRes));
    }

    public IconicsDrawable contourWidthDp(int contourWidthDp) {
        return contourWidthPx(Utils.convertDpToPx(this.mContext, contourWidthDp));
    }

    public IconicsDrawable contourWidthPx(int contourWidth) {
        this.mContourWidth = contourWidth;
        this.mContourPaint.setStrokeWidth(this.mContourWidth);
        drawContour(true);
        invalidateSelf();
        return this;
    }

    public IconicsDrawable drawContour(boolean drawContour) {
        if (this.mDrawContour != drawContour) {
            this.mDrawContour = drawContour;
            if (this.mDrawContour) {
                this.mIconPadding += this.mContourWidth;
            } else {
                this.mIconPadding -= this.mContourWidth;
            }
            invalidateSelf();
        }
        return this;
    }

    public IconicsDrawable colorFilter(ColorFilter cf) {
        setColorFilter(cf);
        return this;
    }

    public IconicsDrawable alpha(int alpha) {
        setAlpha(alpha);
        return this;
    }

    public IconicsDrawable style(Paint.Style style) {
        this.mIconPaint.setStyle(style);
        return this;
    }

    public IconicsDrawable typeface(Typeface typeface) {
        this.mIconPaint.setTypeface(typeface);
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mIcon != null || this.mPlainIcon != null) {
            Rect viewBounds = getBounds();
            updatePaddingBounds(viewBounds);
            updateTextSize(viewBounds);
            offsetIcon(viewBounds);
            if (this.mBackgroundPaint != null && this.mRoundedCornerRy > -1 && this.mRoundedCornerRx > -1) {
                canvas.drawRoundRect(new RectF(0.0f, 0.0f, viewBounds.width(), viewBounds.height()), this.mRoundedCornerRx, this.mRoundedCornerRy, this.mBackgroundPaint);
            }
            this.mPath.close();
            if (this.mDrawContour) {
                canvas.drawPath(this.mPath, this.mContourPaint);
            }
            this.mIconPaint.setAlpha(this.mAlpha);
            canvas.drawPath(this.mPath, this.mIconPaint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setState(int[] stateSet) {
        setAlpha(this.mAlpha);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mSizeX;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mSizeY;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.mAlpha;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mIconPaint.setAlpha(alpha);
        this.mAlpha = alpha;
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.mAlpha;
    }

    public IIcon getIcon() {
        return this.mIcon;
    }

    public String getPlainIcon() {
        return this.mPlainIcon;
    }

    public int getCompatAlpha() {
        return this.mAlpha;
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mIconPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public void clearColorFilter() {
        this.mIconPaint.setColorFilter(null);
    }

    public Bitmap toBitmap() {
        if (this.mSizeX == -1 || this.mSizeY == -1) {
            actionBar();
        }
        Bitmap bitmap = Bitmap.createBitmap(getIntrinsicWidth(), getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        style(Paint.Style.FILL);
        Canvas canvas = new Canvas(bitmap);
        setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        draw(canvas);
        return bitmap;
    }

    private void updatePaddingBounds(Rect viewBounds) {
        if (this.mIconPadding >= 0 && this.mIconPadding * 2 <= viewBounds.width() && this.mIconPadding * 2 <= viewBounds.height()) {
            this.mPaddingBounds.set(viewBounds.left + this.mIconPadding, viewBounds.top + this.mIconPadding, viewBounds.right - this.mIconPadding, viewBounds.bottom - this.mIconPadding);
        }
    }

    private void updateTextSize(Rect viewBounds) {
        float textSize = viewBounds.height() * 2.0f;
        this.mIconPaint.setTextSize(textSize);
        String textValue = this.mIcon != null ? String.valueOf(this.mIcon.getCharacter()) : String.valueOf(this.mPlainIcon);
        this.mIconPaint.getTextPath(textValue, 0, textValue.length(), 0.0f, viewBounds.height(), this.mPath);
        this.mPath.computeBounds(this.mPathBounds, true);
        float deltaWidth = this.mPaddingBounds.width() / this.mPathBounds.width();
        float deltaHeight = this.mPaddingBounds.height() / this.mPathBounds.height();
        float delta = deltaWidth < deltaHeight ? deltaWidth : deltaHeight;
        this.mIconPaint.setTextSize(textSize * delta);
        this.mIconPaint.getTextPath(textValue, 0, textValue.length(), 0.0f, viewBounds.height(), this.mPath);
        this.mPath.computeBounds(this.mPathBounds, true);
    }

    private void offsetIcon(Rect viewBounds) {
        float startX = viewBounds.centerX() - (this.mPathBounds.width() / 2.0f);
        float offsetX = startX - this.mPathBounds.left;
        float startY = viewBounds.centerY() - (this.mPathBounds.height() / 2.0f);
        float offsetY = startY - this.mPathBounds.top;
        this.mPath.offset(offsetX + this.mIconOffsetX, offsetY + this.mIconOffsetY);
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public IconicsDrawable m1clone() {
        IconicsDrawable iconicsDrawable = new IconicsDrawable(this.mContext).paddingPx(this.mIconPadding).roundedCornersRxPx(this.mRoundedCornerRx).roundedCornersRyPx(this.mRoundedCornerRy).sizePxX(this.mSizeX).sizePxY(this.mSizeY).iconOffsetXPx(this.mIconOffsetX).iconOffsetYPx(this.mIconOffsetY).contourColor(this.mContourColor).contourWidthPx(this.mContourWidth).backgroundColor(this.mBackgroundColor).color(this.mIconColor).alpha(this.mAlpha).drawContour(this.mDrawContour).typeface(this.mIconPaint.getTypeface());
        if (this.mIcon != null) {
            iconicsDrawable.icon(this.mIcon);
        } else if (this.mPlainIcon != null) {
            iconicsDrawable.iconText(this.mPlainIcon);
        }
        return iconicsDrawable;
    }
}
