package net.steamcrafted.loadtoast;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.nineoldandroids.animation.ValueAnimator;

/* loaded from: net.steamcrafted.load-toast.1.0.9.jar:net/steamcrafted/loadtoast/LoadToastView.class */
public class LoadToastView extends View {
    private String mText;
    private Paint textPaint;
    private Paint backPaint;
    private Paint iconBackPaint;
    private Paint loaderPaint;
    private Paint successPaint;
    private Paint errorPaint;
    private Rect iconBounds;
    private Rect mTextBounds;
    private RectF spinnerRect;
    private int MAX_TEXT_WIDTH;
    private int BASE_TEXT_SIZE;
    private int IMAGE_WIDTH;
    private int TOAST_HEIGHT;
    private float WIDTH_SCALE;
    private int MARQUE_STEP;
    private long prevUpdate;
    private Drawable completeicon;
    private Drawable failedicon;
    private ValueAnimator va;
    private ValueAnimator cmp;
    private boolean success;
    private boolean outOfBounds;
    private Path toastPath;
    private AccelerateDecelerateInterpolator easeinterpol;

    public LoadToastView(Context context) {
        super(context);
        this.mText = BuildConfig.FLAVOR;
        this.textPaint = new Paint();
        this.backPaint = new Paint();
        this.iconBackPaint = new Paint();
        this.loaderPaint = new Paint();
        this.successPaint = new Paint();
        this.errorPaint = new Paint();
        this.mTextBounds = new Rect();
        this.spinnerRect = new RectF();
        this.MAX_TEXT_WIDTH = 100;
        this.BASE_TEXT_SIZE = 20;
        this.IMAGE_WIDTH = 40;
        this.TOAST_HEIGHT = 48;
        this.WIDTH_SCALE = 0.0f;
        this.MARQUE_STEP = 1;
        this.prevUpdate = 0L;
        this.success = true;
        this.outOfBounds = false;
        this.toastPath = new Path();
        this.easeinterpol = new AccelerateDecelerateInterpolator();
        this.textPaint.setTextSize(15.0f);
        this.textPaint.setColor(-16777216);
        this.textPaint.setAntiAlias(true);
        this.backPaint.setColor(-1);
        this.backPaint.setAntiAlias(true);
        this.iconBackPaint.setColor(-16776961);
        this.iconBackPaint.setAntiAlias(true);
        this.loaderPaint.setStrokeWidth(dpToPx(4));
        this.loaderPaint.setAntiAlias(true);
        this.loaderPaint.setColor(fetchPrimaryColor());
        this.loaderPaint.setStyle(Paint.Style.STROKE);
        this.successPaint.setColor(getResources().getColor(R.color.color_success));
        this.errorPaint.setColor(getResources().getColor(R.color.color_error));
        this.successPaint.setAntiAlias(true);
        this.errorPaint.setAntiAlias(true);
        this.MAX_TEXT_WIDTH = dpToPx(this.MAX_TEXT_WIDTH);
        this.BASE_TEXT_SIZE = dpToPx(this.BASE_TEXT_SIZE);
        this.IMAGE_WIDTH = dpToPx(this.IMAGE_WIDTH);
        this.TOAST_HEIGHT = dpToPx(this.TOAST_HEIGHT);
        this.MARQUE_STEP = dpToPx(this.MARQUE_STEP);
        int padding = (this.TOAST_HEIGHT - this.IMAGE_WIDTH) / 2;
        this.iconBounds = new Rect((this.TOAST_HEIGHT + this.MAX_TEXT_WIDTH) - padding, padding, ((this.TOAST_HEIGHT + this.MAX_TEXT_WIDTH) - padding) + this.IMAGE_WIDTH, this.IMAGE_WIDTH + padding);
        this.completeicon = getResources().getDrawable(R.drawable.ic_navigation_check);
        this.completeicon.setBounds(this.iconBounds);
        this.failedicon = getResources().getDrawable(R.drawable.ic_error);
        this.failedicon.setBounds(this.iconBounds);
        this.va = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.va.setDuration(6000L);
        this.va.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: net.steamcrafted.loadtoast.LoadToastView.1
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                LoadToastView.this.postInvalidate();
            }
        });
        this.va.setRepeatMode(-1);
        this.va.setRepeatCount(9999999);
        this.va.setInterpolator(new LinearInterpolator());
        this.va.start();
        calculateBounds();
    }

    public void setTextColor(int color) {
        this.textPaint.setColor(color);
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backPaint.setColor(color);
        this.iconBackPaint.setColor(color);
    }

    public void setProgressColor(int color) {
        this.loaderPaint.setColor(color);
    }

    public void show() {
        this.WIDTH_SCALE = 0.0f;
        if (this.cmp != null) {
            this.cmp.removeAllUpdateListeners();
        }
    }

    public void success() {
        this.success = true;
        done();
    }

    public void error() {
        this.success = false;
        done();
    }

    private void done() {
        this.cmp = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.cmp.setDuration(600L);
        this.cmp.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: net.steamcrafted.loadtoast.LoadToastView.2
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                LoadToastView.this.WIDTH_SCALE = 2.0f * valueAnimator.getAnimatedFraction();
                LoadToastView.this.postInvalidate();
            }
        });
        this.cmp.setInterpolator(new DecelerateInterpolator());
        this.cmp.start();
    }

    private int fetchPrimaryColor() {
        if (Build.VERSION.SDK_INT >= 21) {
            TypedValue typedValue = new TypedValue();
            TypedArray a = getContext().obtainStyledAttributes(typedValue.data, new int[]{R.attr.colorAccent});
            int color = a.getColor(0, 0);
            a.recycle();
            return color;
        }
        return Color.rgb(155, 155, 155);
    }

    private int dpToPx(int dp) {
        return (int) TypedValue.applyDimension(1, dp, getResources().getDisplayMetrics());
    }

    public void setText(String text) {
        this.mText = text;
        calculateBounds();
    }

    private void calculateBounds() {
        this.outOfBounds = false;
        this.prevUpdate = 0L;
        this.textPaint.setTextSize(this.BASE_TEXT_SIZE);
        this.textPaint.getTextBounds(this.mText, 0, this.mText.length(), this.mTextBounds);
        if (this.mTextBounds.width() > this.MAX_TEXT_WIDTH) {
            int textSize = this.BASE_TEXT_SIZE;
            while (textSize > dpToPx(13) && this.mTextBounds.width() > this.MAX_TEXT_WIDTH) {
                textSize--;
                this.textPaint.setTextSize(textSize);
                this.textPaint.getTextBounds(this.mText, 0, this.mText.length(), this.mTextBounds);
            }
            if (this.mTextBounds.width() > this.MAX_TEXT_WIDTH) {
                this.outOfBounds = true;
            }
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas c) {
        super.onDraw(c);
        float ws = Math.max(1.0f - this.WIDTH_SCALE, 0.0f);
        if (this.mText.length() == 0) {
            ws = 0.0f;
        }
        float translateLoad = (1.0f - ws) * (this.IMAGE_WIDTH + this.MAX_TEXT_WIDTH);
        float leftMargin = translateLoad / 2.0f;
        float textOpactity = Math.max(0.0f, (ws * 10.0f) - 9.0f);
        this.textPaint.setAlpha((int) (textOpactity * 255.0f));
        this.spinnerRect.set((this.iconBounds.left + dpToPx(4)) - (translateLoad / 2.0f), this.iconBounds.top + dpToPx(4), (this.iconBounds.right - dpToPx(4)) - (translateLoad / 2.0f), this.iconBounds.bottom - dpToPx(4));
        int circleOffset = (int) (((this.TOAST_HEIGHT * 2) * (Math.sqrt(2.0d) - 1.0d)) / 3.0d);
        int th = this.TOAST_HEIGHT;
        int pd = (this.TOAST_HEIGHT - this.IMAGE_WIDTH) / 2;
        int iconoffset = (int) (((this.IMAGE_WIDTH * 2) * (Math.sqrt(2.0d) - 1.0d)) / 3.0d);
        int iw = this.IMAGE_WIDTH;
        this.toastPath.reset();
        this.toastPath.moveTo(leftMargin + (th / 2), 0.0f);
        this.toastPath.rLineTo(ws * (this.IMAGE_WIDTH + this.MAX_TEXT_WIDTH), 0.0f);
        this.toastPath.rCubicTo(circleOffset, 0.0f, th / 2, (th / 2) - circleOffset, th / 2, th / 2);
        this.toastPath.rLineTo(-pd, 0.0f);
        this.toastPath.rCubicTo(0.0f, -iconoffset, ((-iw) / 2) + iconoffset, (-iw) / 2, (-iw) / 2, (-iw) / 2);
        this.toastPath.rCubicTo(-iconoffset, 0.0f, (-iw) / 2, (iw / 2) - iconoffset, (-iw) / 2, iw / 2);
        this.toastPath.rCubicTo(0.0f, iconoffset, (iw / 2) - iconoffset, iw / 2, iw / 2, iw / 2);
        this.toastPath.rCubicTo(iconoffset, 0.0f, iw / 2, ((-iw) / 2) + iconoffset, iw / 2, (-iw) / 2);
        this.toastPath.rLineTo(pd, 0.0f);
        this.toastPath.rCubicTo(0.0f, circleOffset, circleOffset - (th / 2), th / 2, (-th) / 2, th / 2);
        this.toastPath.rLineTo(ws * ((-this.IMAGE_WIDTH) - this.MAX_TEXT_WIDTH), 0.0f);
        this.toastPath.rCubicTo(-circleOffset, 0.0f, (-th) / 2, ((-th) / 2) + circleOffset, (-th) / 2, (-th) / 2);
        this.toastPath.rCubicTo(0.0f, -circleOffset, (-circleOffset) + (th / 2), (-th) / 2, th / 2, (-th) / 2);
        c.drawCircle(this.spinnerRect.centerX(), this.spinnerRect.centerY(), this.iconBounds.height() / 1.9f, this.backPaint);
        c.drawPath(this.toastPath, this.backPaint);
        float prog = this.va.getAnimatedFraction() * 6.0f;
        float progrot = prog % 2.0f;
        float proglength = (this.easeinterpol.getInterpolation((prog % 3.0f) / 3.0f) * 3.0f) - 0.75f;
        if (proglength > 0.75f) {
            proglength = 0.75f - ((prog % 3.0f) - 1.5f);
            progrot += (((prog % 3.0f) - 1.5f) / 1.5f) * 2.0f;
        }
        this.toastPath.reset();
        if (this.mText.length() == 0) {
            ws = Math.max(1.0f - this.WIDTH_SCALE, 0.0f);
        }
        this.toastPath.arcTo(this.spinnerRect, 180.0f * progrot, Math.min((266.66666f * proglength) + 1.0f + (560.0f * (1.0f - ws)), 359.9999f));
        this.loaderPaint.setAlpha((int) (255.0f * ws));
        c.drawPath(this.toastPath, this.loaderPaint);
        if (this.WIDTH_SCALE > 1.0f) {
            Drawable icon = this.success ? this.completeicon : this.failedicon;
            float circleProg = this.WIDTH_SCALE - 1.0f;
            this.textPaint.setAlpha((int) ((128.0f * circleProg) + 127.0f));
            int paddingicon = (int) (((1.0f - (0.25f + (0.75f * circleProg))) * this.TOAST_HEIGHT) / 2.0f);
            int completeoff = (int) (((1.0f - circleProg) * this.TOAST_HEIGHT) / 8.0f);
            icon.setBounds(((int) this.spinnerRect.left) + paddingicon, ((int) this.spinnerRect.top) + paddingicon + completeoff, ((int) this.spinnerRect.right) - paddingicon, (((int) this.spinnerRect.bottom) - paddingicon) + completeoff);
            c.drawCircle(leftMargin + (this.TOAST_HEIGHT / 2), (((1.0f - circleProg) * this.TOAST_HEIGHT) / 8.0f) + (this.TOAST_HEIGHT / 2), ((0.25f + (0.75f * circleProg)) * this.TOAST_HEIGHT) / 2.0f, this.success ? this.successPaint : this.errorPaint);
            c.save();
            c.rotate(90.0f * (1.0f - circleProg), leftMargin + (this.TOAST_HEIGHT / 2), this.TOAST_HEIGHT / 2);
            icon.draw(c);
            c.restore();
            this.prevUpdate = 0L;
            return;
        }
        int yPos = (int) ((th / 2) - ((this.textPaint.descent() + this.textPaint.ascent()) / 2.0f));
        if (this.outOfBounds) {
            float shift = 0.0f;
            if (this.prevUpdate == 0) {
                this.prevUpdate = System.currentTimeMillis();
            } else {
                shift = ((System.currentTimeMillis() - this.prevUpdate) / 16.0f) * this.MARQUE_STEP;
                if (shift - this.MAX_TEXT_WIDTH > this.mTextBounds.width()) {
                    this.prevUpdate = 0L;
                }
            }
            c.clipRect(th / 2, 0, (th / 2) + this.MAX_TEXT_WIDTH, this.TOAST_HEIGHT);
            c.drawText(this.mText, ((th / 2) - shift) + this.MAX_TEXT_WIDTH, yPos, this.textPaint);
            return;
        }
        c.drawText(this.mText, 0, this.mText.length(), (th / 2) + ((this.MAX_TEXT_WIDTH - this.mTextBounds.width()) / 2), yPos, this.textPaint);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(measureWidth(widthMeasureSpec), measureHeight(heightMeasureSpec));
    }

    private int measureWidth(int measureSpec) {
        int result;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        if (specMode == 1073741824) {
            result = specSize;
        } else {
            result = this.IMAGE_WIDTH + this.MAX_TEXT_WIDTH + this.TOAST_HEIGHT;
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return result;
    }

    private int measureHeight(int measureSpec) {
        int result;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        if (specMode == 1073741824) {
            result = specSize;
        } else {
            result = this.TOAST_HEIGHT;
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return result;
    }
}
