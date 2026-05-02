package com.github.lzyzsd.circleprogress;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.github.lzyzsd.circleprogress.1.1.0.jar:com/github/lzyzsd/circleprogress/DonutProgress.class */
public class DonutProgress extends View {
    private Paint finishedPaint;
    private Paint unfinishedPaint;
    private Paint innerCirclePaint;
    protected Paint textPaint;
    protected Paint innerBottomTextPaint;
    private RectF finishedOuterRect;
    private RectF unfinishedOuterRect;
    private float textSize;
    private int textColor;
    private int innerBottomTextColor;
    private int progress;
    private int max;
    private int finishedStrokeColor;
    private int unfinishedStrokeColor;
    private float finishedStrokeWidth;
    private float unfinishedStrokeWidth;
    private int innerBackgroundColor;
    private String prefixText;
    private String suffixText;
    private float innerBottomTextSize;
    private String innerBottomText;
    private float innerBottomTextHeight;
    private final float default_stroke_width;
    private final int default_finished_color;
    private final int default_unfinished_color;
    private final int default_text_color;
    private final int default_inner_bottom_text_color;
    private final int default_inner_background_color = 0;
    private final int default_max = 100;
    private final float default_text_size;
    private final float default_inner_bottom_text_size;
    private final int min_size;
    private static final String INSTANCE_STATE = "saved_instance";
    private static final String INSTANCE_TEXT_COLOR = "text_color";
    private static final String INSTANCE_TEXT_SIZE = "text_size";
    private static final String INSTANCE_INNER_BOTTOM_TEXT_SIZE = "inner_bottom_text_size";
    private static final String INSTANCE_INNER_BOTTOM_TEXT = "inner_bottom_text";
    private static final String INSTANCE_INNER_BOTTOM_TEXT_COLOR = "inner_bottom_text_color";
    private static final String INSTANCE_FINISHED_STROKE_COLOR = "finished_stroke_color";
    private static final String INSTANCE_UNFINISHED_STROKE_COLOR = "unfinished_stroke_color";
    private static final String INSTANCE_MAX = "max";
    private static final String INSTANCE_PROGRESS = "progress";
    private static final String INSTANCE_SUFFIX = "suffix";
    private static final String INSTANCE_PREFIX = "prefix";
    private static final String INSTANCE_FINISHED_STROKE_WIDTH = "finished_stroke_width";
    private static final String INSTANCE_UNFINISHED_STROKE_WIDTH = "unfinished_stroke_width";
    private static final String INSTANCE_BACKGROUND_COLOR = "inner_background_color";

    public DonutProgress(Context context) {
        this(context, null);
    }

    public DonutProgress(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public DonutProgress(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.finishedOuterRect = new RectF();
        this.unfinishedOuterRect = new RectF();
        this.progress = 0;
        this.prefixText = BuildConfig.FLAVOR;
        this.suffixText = "%";
        this.default_finished_color = Color.rgb(66, 145, 241);
        this.default_unfinished_color = Color.rgb(204, 204, 204);
        this.default_text_color = Color.rgb(66, 145, 241);
        this.default_inner_bottom_text_color = Color.rgb(66, 145, 241);
        this.default_inner_background_color = 0;
        this.default_max = 100;
        this.default_text_size = Utils.sp2px(getResources(), 18.0f);
        this.min_size = (int) Utils.dp2px(getResources(), 100.0f);
        this.default_stroke_width = Utils.dp2px(getResources(), 10.0f);
        this.default_inner_bottom_text_size = Utils.sp2px(getResources(), 18.0f);
        TypedArray attributes = context.getTheme().obtainStyledAttributes(attrs, R.styleable.DonutProgress, defStyleAttr, 0);
        initByAttributes(attributes);
        attributes.recycle();
        initPainters();
    }

    protected void initPainters() {
        this.textPaint = new TextPaint();
        this.textPaint.setColor(this.textColor);
        this.textPaint.setTextSize(this.textSize);
        this.textPaint.setAntiAlias(true);
        this.innerBottomTextPaint = new TextPaint();
        this.innerBottomTextPaint.setColor(this.innerBottomTextColor);
        this.innerBottomTextPaint.setTextSize(this.innerBottomTextSize);
        this.innerBottomTextPaint.setAntiAlias(true);
        this.finishedPaint = new Paint();
        this.finishedPaint.setColor(this.finishedStrokeColor);
        this.finishedPaint.setStyle(Paint.Style.STROKE);
        this.finishedPaint.setAntiAlias(true);
        this.finishedPaint.setStrokeWidth(this.finishedStrokeWidth);
        this.unfinishedPaint = new Paint();
        this.unfinishedPaint.setColor(this.unfinishedStrokeColor);
        this.unfinishedPaint.setStyle(Paint.Style.STROKE);
        this.unfinishedPaint.setAntiAlias(true);
        this.unfinishedPaint.setStrokeWidth(this.unfinishedStrokeWidth);
        this.innerCirclePaint = new Paint();
        this.innerCirclePaint.setColor(this.innerBackgroundColor);
        this.innerCirclePaint.setAntiAlias(true);
    }

    protected void initByAttributes(TypedArray attributes) {
        this.finishedStrokeColor = attributes.getColor(R.styleable.DonutProgress_donut_finished_color, this.default_finished_color);
        this.unfinishedStrokeColor = attributes.getColor(R.styleable.DonutProgress_donut_unfinished_color, this.default_unfinished_color);
        this.textColor = attributes.getColor(R.styleable.DonutProgress_donut_text_color, this.default_text_color);
        this.textSize = attributes.getDimension(R.styleable.DonutProgress_donut_text_size, this.default_text_size);
        setMax(attributes.getInt(R.styleable.DonutProgress_donut_max, 100));
        setProgress(attributes.getInt(R.styleable.DonutProgress_donut_progress, 0));
        this.finishedStrokeWidth = attributes.getDimension(R.styleable.DonutProgress_donut_finished_stroke_width, this.default_stroke_width);
        this.unfinishedStrokeWidth = attributes.getDimension(R.styleable.DonutProgress_donut_unfinished_stroke_width, this.default_stroke_width);
        if (attributes.getString(R.styleable.DonutProgress_donut_prefix_text) != null) {
            this.prefixText = attributes.getString(R.styleable.DonutProgress_donut_prefix_text);
        }
        if (attributes.getString(R.styleable.DonutProgress_donut_suffix_text) != null) {
            this.suffixText = attributes.getString(R.styleable.DonutProgress_donut_suffix_text);
        }
        this.innerBackgroundColor = attributes.getColor(R.styleable.DonutProgress_donut_background_color, 0);
        this.innerBottomTextSize = attributes.getDimension(R.styleable.DonutProgress_donut_inner_bottom_text_size, this.default_inner_bottom_text_size);
        this.innerBottomTextColor = attributes.getColor(R.styleable.DonutProgress_donut_inner_bottom_text_color, this.default_inner_bottom_text_color);
        this.innerBottomText = attributes.getString(R.styleable.DonutProgress_donut_inner_bottom_text);
    }

    @Override // android.view.View
    public void invalidate() {
        initPainters();
        super.invalidate();
    }

    public float getFinishedStrokeWidth() {
        return this.finishedStrokeWidth;
    }

    public void setFinishedStrokeWidth(float finishedStrokeWidth) {
        this.finishedStrokeWidth = finishedStrokeWidth;
        invalidate();
    }

    public float getUnfinishedStrokeWidth() {
        return this.unfinishedStrokeWidth;
    }

    public void setUnfinishedStrokeWidth(float unfinishedStrokeWidth) {
        this.unfinishedStrokeWidth = unfinishedStrokeWidth;
        invalidate();
    }

    private float getProgressAngle() {
        return (getProgress() / this.max) * 360.0f;
    }

    public int getProgress() {
        return this.progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
        if (this.progress > getMax()) {
            this.progress %= getMax();
        }
        invalidate();
    }

    public int getMax() {
        return this.max;
    }

    public void setMax(int max) {
        if (max > 0) {
            this.max = max;
            invalidate();
        }
    }

    public float getTextSize() {
        return this.textSize;
    }

    public void setTextSize(float textSize) {
        this.textSize = textSize;
        invalidate();
    }

    public int getTextColor() {
        return this.textColor;
    }

    public void setTextColor(int textColor) {
        this.textColor = textColor;
        invalidate();
    }

    public int getFinishedStrokeColor() {
        return this.finishedStrokeColor;
    }

    public void setFinishedStrokeColor(int finishedStrokeColor) {
        this.finishedStrokeColor = finishedStrokeColor;
        invalidate();
    }

    public int getUnfinishedStrokeColor() {
        return this.unfinishedStrokeColor;
    }

    public void setUnfinishedStrokeColor(int unfinishedStrokeColor) {
        this.unfinishedStrokeColor = unfinishedStrokeColor;
        invalidate();
    }

    public String getSuffixText() {
        return this.suffixText;
    }

    public void setSuffixText(String suffixText) {
        this.suffixText = suffixText;
        invalidate();
    }

    public String getPrefixText() {
        return this.prefixText;
    }

    public void setPrefixText(String prefixText) {
        this.prefixText = prefixText;
        invalidate();
    }

    public int getInnerBackgroundColor() {
        return this.innerBackgroundColor;
    }

    public void setInnerBackgroundColor(int innerBackgroundColor) {
        this.innerBackgroundColor = innerBackgroundColor;
        invalidate();
    }

    public String getInnerBottomText() {
        return this.innerBottomText;
    }

    public void setInnerBottomText(String innerBottomText) {
        this.innerBottomText = innerBottomText;
        invalidate();
    }

    public float getInnerBottomTextSize() {
        return this.innerBottomTextSize;
    }

    public void setInnerBottomTextSize(float innerBottomTextSize) {
        this.innerBottomTextSize = innerBottomTextSize;
        invalidate();
    }

    public int getInnerBottomTextColor() {
        return this.innerBottomTextColor;
    }

    public void setInnerBottomTextColor(int innerBottomTextColor) {
        this.innerBottomTextColor = innerBottomTextColor;
        invalidate();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(measure(widthMeasureSpec), measure(heightMeasureSpec));
        this.innerBottomTextHeight = getHeight() - ((getHeight() * 3) / 5);
    }

    private int measure(int measureSpec) {
        int result;
        int mode = View.MeasureSpec.getMode(measureSpec);
        int size = View.MeasureSpec.getSize(measureSpec);
        if (mode == 1073741824) {
            result = size;
        } else {
            result = this.min_size;
            if (mode == Integer.MIN_VALUE) {
                result = Math.min(result, size);
            }
        }
        return result;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float delta = Math.max(this.finishedStrokeWidth, this.unfinishedStrokeWidth);
        this.finishedOuterRect.set(delta, delta, getWidth() - delta, getHeight() - delta);
        this.unfinishedOuterRect.set(delta, delta, getWidth() - delta, getHeight() - delta);
        float innerCircleRadius = ((getWidth() - Math.min(this.finishedStrokeWidth, this.unfinishedStrokeWidth)) + Math.abs(this.finishedStrokeWidth - this.unfinishedStrokeWidth)) / 2.0f;
        canvas.drawCircle(getWidth() / 2.0f, getHeight() / 2.0f, innerCircleRadius, this.innerCirclePaint);
        canvas.drawArc(this.finishedOuterRect, 0.0f, getProgressAngle(), false, this.finishedPaint);
        canvas.drawArc(this.unfinishedOuterRect, getProgressAngle(), 360.0f - getProgressAngle(), false, this.unfinishedPaint);
        String text = this.prefixText + this.progress + this.suffixText;
        if (!TextUtils.isEmpty(text)) {
            float textHeight = this.textPaint.descent() + this.textPaint.ascent();
            canvas.drawText(text, (getWidth() - this.textPaint.measureText(text)) / 2.0f, (getWidth() - textHeight) / 2.0f, this.textPaint);
        }
        if (!TextUtils.isEmpty(getInnerBottomText())) {
            this.innerBottomTextPaint.setTextSize(this.innerBottomTextSize);
            float bottomTextBaseline = (getHeight() - this.innerBottomTextHeight) - ((this.textPaint.descent() + this.textPaint.ascent()) / 2.0f);
            canvas.drawText(getInnerBottomText(), (getWidth() - this.innerBottomTextPaint.measureText(getInnerBottomText())) / 2.0f, bottomTextBaseline, this.innerBottomTextPaint);
        }
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        bundle.putParcelable(INSTANCE_STATE, super.onSaveInstanceState());
        bundle.putInt(INSTANCE_TEXT_COLOR, getTextColor());
        bundle.putFloat(INSTANCE_TEXT_SIZE, getTextSize());
        bundle.putFloat(INSTANCE_INNER_BOTTOM_TEXT_SIZE, getInnerBottomTextSize());
        bundle.putFloat(INSTANCE_INNER_BOTTOM_TEXT_COLOR, getInnerBottomTextColor());
        bundle.putString(INSTANCE_INNER_BOTTOM_TEXT, getInnerBottomText());
        bundle.putInt(INSTANCE_INNER_BOTTOM_TEXT_COLOR, getInnerBottomTextColor());
        bundle.putInt(INSTANCE_FINISHED_STROKE_COLOR, getFinishedStrokeColor());
        bundle.putInt(INSTANCE_UNFINISHED_STROKE_COLOR, getUnfinishedStrokeColor());
        bundle.putInt(INSTANCE_MAX, getMax());
        bundle.putInt(INSTANCE_PROGRESS, getProgress());
        bundle.putString(INSTANCE_SUFFIX, getSuffixText());
        bundle.putString(INSTANCE_PREFIX, getPrefixText());
        bundle.putFloat(INSTANCE_FINISHED_STROKE_WIDTH, getFinishedStrokeWidth());
        bundle.putFloat(INSTANCE_UNFINISHED_STROKE_WIDTH, getUnfinishedStrokeWidth());
        bundle.putInt(INSTANCE_BACKGROUND_COLOR, getInnerBackgroundColor());
        return bundle;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        if (state instanceof Bundle) {
            Bundle bundle = (Bundle) state;
            this.textColor = bundle.getInt(INSTANCE_TEXT_COLOR);
            this.textSize = bundle.getFloat(INSTANCE_TEXT_SIZE);
            this.innerBottomTextSize = bundle.getFloat(INSTANCE_INNER_BOTTOM_TEXT_SIZE);
            this.innerBottomText = bundle.getString(INSTANCE_INNER_BOTTOM_TEXT);
            this.innerBottomTextColor = bundle.getInt(INSTANCE_INNER_BOTTOM_TEXT_COLOR);
            this.finishedStrokeColor = bundle.getInt(INSTANCE_FINISHED_STROKE_COLOR);
            this.unfinishedStrokeColor = bundle.getInt(INSTANCE_UNFINISHED_STROKE_COLOR);
            this.finishedStrokeWidth = bundle.getFloat(INSTANCE_FINISHED_STROKE_WIDTH);
            this.unfinishedStrokeWidth = bundle.getFloat(INSTANCE_UNFINISHED_STROKE_WIDTH);
            this.innerBackgroundColor = bundle.getInt(INSTANCE_BACKGROUND_COLOR);
            initPainters();
            setMax(bundle.getInt(INSTANCE_MAX));
            setProgress(bundle.getInt(INSTANCE_PROGRESS));
            this.prefixText = bundle.getString(INSTANCE_PREFIX);
            this.suffixText = bundle.getString(INSTANCE_SUFFIX);
            super.onRestoreInstanceState(bundle.getParcelable(INSTANCE_STATE));
            return;
        }
        super.onRestoreInstanceState(state);
    }
}
