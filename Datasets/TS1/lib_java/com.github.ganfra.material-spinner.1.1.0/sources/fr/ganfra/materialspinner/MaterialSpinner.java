package fr.ganfra.materialspinner;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Typeface;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.animation.ValueAnimator;

/* loaded from: com.github.ganfra.material-spinner.1.1.0.jar:fr/ganfra/materialspinner/MaterialSpinner.class */
public class MaterialSpinner extends Spinner implements ValueAnimator.AnimatorUpdateListener {
    public static final int DEFAULT_ARROW_WIDTH_DP = 12;
    private static final String TAG = MaterialSpinner.class.getSimpleName();
    private Paint paint;
    private TextPaint textPaint;
    private StaticLayout staticLayout;
    private Path selectorPath;
    private Point[] selectorPoints;
    private int innerPaddingLeft;
    private int innerPaddingRight;
    private int innerPaddingTop;
    private int innerPaddingBottom;
    private int extraPaddingTop;
    private int extraPaddingBottom;
    private int underlineTopSpacing;
    private int underlineBottomSpacing;
    private int errorLabelSpacing;
    private int floatingLabelTopSpacing;
    private int floatingLabelBottomSpacing;
    private int floatingLabelInsideSpacing;
    private int rightLeftSpinnerPadding;
    private int lastPosition;
    private ObjectAnimator errorLabelAnimator;
    private int errorLabelPosX;
    private boolean errorAnimationReverse;
    private int minNbErrorLines;
    private float currentNbErrorLines;
    private float floatingLabelPercent;
    private ObjectAnimator floatingLabelAnimator;
    private boolean isSelected;
    private boolean floatingLabelVisible;
    private int baseAlpha;
    private int baseColor;
    private int highlightColor;
    private int errorColor;
    private int disabledColor;
    private CharSequence error;
    private CharSequence hint;
    private CharSequence floatingLabelText;
    private int floatingLabelColor;
    private boolean multiline;
    private Typeface typeface;
    private boolean alignLabels;
    private float thickness;
    private float thicknessError;
    private int arrowColor;
    private float arrowSize;

    public MaterialSpinner(Context context) {
        super(context);
        init(context, null);
    }

    public MaterialSpinner(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public MaterialSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        initAttributes(context, attrs);
        initPaintObjects();
        initDimensions();
        initPadding();
        initFloatingLabelAnimator();
        initOnItemSelectedListener();
        initAdapter(context);
        setBackgroundResource(R.drawable.my_background);
    }

    private void initAttributes(Context context, AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(new int[]{R.attr.colorControlNormal, R.attr.colorAccent});
        int defaultBaseColor = a.getColor(0, 0);
        int defaultHighlightColor = a.getColor(1, 0);
        int defaultErrorColor = context.getResources().getColor(R.color.error_color);
        a.recycle();
        TypedArray array = context.obtainStyledAttributes(attrs, R.styleable.MaterialSpinner);
        this.baseColor = array.getColor(R.styleable.MaterialSpinner_ms_baseColor, defaultBaseColor);
        this.highlightColor = array.getColor(R.styleable.MaterialSpinner_ms_highlightColor, defaultHighlightColor);
        this.errorColor = array.getColor(R.styleable.MaterialSpinner_ms_errorColor, defaultErrorColor);
        this.disabledColor = context.getResources().getColor(R.color.disabled_color);
        this.error = array.getString(R.styleable.MaterialSpinner_ms_error);
        this.hint = array.getString(R.styleable.MaterialSpinner_ms_hint);
        this.floatingLabelText = array.getString(R.styleable.MaterialSpinner_ms_floatingLabelText);
        this.floatingLabelColor = array.getColor(R.styleable.MaterialSpinner_ms_floatingLabelColor, this.baseColor);
        this.multiline = array.getBoolean(R.styleable.MaterialSpinner_ms_multiline, true);
        this.minNbErrorLines = array.getInt(R.styleable.MaterialSpinner_ms_nbErrorLines, 1);
        this.alignLabels = array.getBoolean(R.styleable.MaterialSpinner_ms_alignLabels, true);
        this.thickness = array.getDimension(R.styleable.MaterialSpinner_ms_thickness, 1.0f);
        this.thicknessError = array.getDimension(R.styleable.MaterialSpinner_ms_thickness_error, 2.0f);
        this.arrowColor = array.getColor(R.styleable.MaterialSpinner_ms_arrowColor, this.baseColor);
        this.arrowSize = array.getDimension(R.styleable.MaterialSpinner_ms_arrowSize, dpToPx(12.0f));
        String typefacePath = array.getString(R.styleable.MaterialSpinner_ms_typeface);
        if (typefacePath != null) {
            this.typeface = Typeface.createFromAsset(getContext().getAssets(), typefacePath);
        }
        array.recycle();
        this.floatingLabelPercent = 0.0f;
        this.errorLabelPosX = 0;
        this.isSelected = false;
        this.floatingLabelVisible = false;
        this.lastPosition = -1;
        this.currentNbErrorLines = this.minNbErrorLines;
    }

    private void initPaintObjects() {
        int labelTextSize = getResources().getDimensionPixelSize(R.dimen.label_text_size);
        this.paint = new Paint(1);
        this.textPaint = new TextPaint(1);
        this.textPaint.setTextSize(labelTextSize);
        if (this.typeface != null) {
            this.textPaint.setTypeface(this.typeface);
        }
        this.textPaint.setColor(this.baseColor);
        this.baseAlpha = this.textPaint.getAlpha();
        this.selectorPath = new Path();
        this.selectorPath.setFillType(Path.FillType.EVEN_ODD);
        this.selectorPoints = new Point[3];
        for (int i = 0; i < 3; i++) {
            this.selectorPoints[i] = new Point();
        }
    }

    private void initPadding() {
        this.innerPaddingTop = getPaddingTop();
        this.innerPaddingLeft = getPaddingLeft();
        this.innerPaddingRight = getPaddingRight();
        this.innerPaddingBottom = getPaddingBottom();
        this.extraPaddingTop = this.floatingLabelTopSpacing + this.floatingLabelInsideSpacing + this.floatingLabelBottomSpacing;
        updateBottomPadding();
    }

    private void updateBottomPadding() {
        Paint.FontMetrics textMetrics = this.textPaint.getFontMetrics();
        this.extraPaddingBottom = ((int) ((textMetrics.descent - textMetrics.ascent) * this.currentNbErrorLines)) + this.underlineTopSpacing + this.underlineBottomSpacing;
        setPadding();
    }

    private void initDimensions() {
        this.underlineTopSpacing = getResources().getDimensionPixelSize(R.dimen.underline_top_spacing);
        this.underlineBottomSpacing = getResources().getDimensionPixelSize(R.dimen.underline_bottom_spacing);
        this.floatingLabelTopSpacing = getResources().getDimensionPixelSize(R.dimen.floating_label_top_spacing);
        this.floatingLabelBottomSpacing = getResources().getDimensionPixelSize(R.dimen.floating_label_bottom_spacing);
        this.rightLeftSpinnerPadding = this.alignLabels ? getResources().getDimensionPixelSize(R.dimen.right_left_spinner_padding) : 0;
        this.floatingLabelInsideSpacing = getResources().getDimensionPixelSize(R.dimen.floating_label_inside_spacing);
        this.errorLabelSpacing = (int) getResources().getDimension(R.dimen.error_label_spacing);
    }

    private void initAdapter(Context context) {
        SpinnerAdapter adapter = new ArrayAdapter(context, R.layout.simple_spinner_item);
        setAdapter(adapter);
    }

    private void initOnItemSelectedListener() {
        setOnItemSelectedListener(null);
    }

    private void initFloatingLabelAnimator() {
        if (this.floatingLabelAnimator == null) {
            this.floatingLabelAnimator = ObjectAnimator.ofFloat(this, "floatingLabelPercent", new float[]{0.0f, 1.0f});
            this.floatingLabelAnimator.addUpdateListener(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showFloatingLabel() {
        if (this.floatingLabelAnimator != null) {
            this.floatingLabelVisible = true;
            if (this.floatingLabelAnimator.isRunning()) {
                this.floatingLabelAnimator.reverse();
            } else {
                this.floatingLabelAnimator.start();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hideFloatingLabel() {
        if (this.floatingLabelAnimator != null) {
            this.floatingLabelVisible = false;
            this.floatingLabelAnimator.reverse();
        }
    }

    private void startErrorScrollingAnimator() {
        int textWidth = Math.round(this.textPaint.measureText(this.error.toString()));
        if (this.errorLabelAnimator == null) {
            this.errorLabelAnimator = ObjectAnimator.ofInt(this, "errorLabelPosX", new int[]{0, textWidth + (getWidth() / 2)});
            this.errorLabelAnimator.setStartDelay(1000L);
            this.errorLabelAnimator.setInterpolator(new LinearInterpolator());
            this.errorLabelAnimator.setDuration(150 * this.error.length());
            this.errorLabelAnimator.addUpdateListener(this);
            this.errorLabelAnimator.setRepeatCount(-1);
        } else {
            this.errorLabelAnimator.setIntValues(new int[]{0, textWidth + (getWidth() / 2)});
        }
        this.errorLabelAnimator.start();
    }

    private void startErrorMultilineAnimator(float destLines) {
        if (this.errorLabelAnimator == null) {
            this.errorLabelAnimator = ObjectAnimator.ofFloat(this, "currentNbErrorLines", new float[]{destLines});
        } else {
            this.errorLabelAnimator.setFloatValues(new float[]{destLines});
        }
        this.errorLabelAnimator.start();
    }

    private int dpToPx(float dp) {
        DisplayMetrics displayMetrics = getContext().getResources().getDisplayMetrics();
        float px = TypedValue.applyDimension(1, dp, displayMetrics);
        return Math.round(px);
    }

    private float pxToDp(float px) {
        DisplayMetrics displayMetrics = getContext().getResources().getDisplayMetrics();
        return px * displayMetrics.density;
    }

    private void setPadding() {
        int left = this.innerPaddingLeft;
        int top = this.innerPaddingTop + this.extraPaddingTop;
        int right = this.innerPaddingRight;
        int bottom = this.innerPaddingBottom + this.extraPaddingBottom;
        super.setPadding(left, top, right, bottom);
    }

    private boolean needScrollingAnimation() {
        if (this.error != null) {
            float screenWidth = getWidth() - this.rightLeftSpinnerPadding;
            float errorTextWidth = this.textPaint.measureText(this.error.toString(), 0, this.error.length());
            return errorTextWidth > screenWidth;
        }
        return false;
    }

    private int prepareBottomPadding() {
        int targetNbLines = this.minNbErrorLines;
        if (this.error != null) {
            this.staticLayout = new StaticLayout(this.error, this.textPaint, (getWidth() - getPaddingRight()) - getPaddingLeft(), Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, true);
            int nbErrorLines = this.staticLayout.getLineCount();
            targetNbLines = Math.max(this.minNbErrorLines, nbErrorLines);
        }
        return targetNbLines;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int lineHeight;
        super.onDraw(canvas);
        int endX = getWidth();
        int startYLine = (getHeight() - getPaddingBottom()) + this.underlineTopSpacing;
        int startYFloatingLabel = (int) (getPaddingTop() - (this.floatingLabelPercent * this.floatingLabelBottomSpacing));
        if (this.error != null) {
            lineHeight = dpToPx(this.thicknessError);
            int startYErrorLabel = startYLine + this.errorLabelSpacing + lineHeight;
            this.paint.setColor(this.errorColor);
            this.textPaint.setColor(this.errorColor);
            if (this.multiline) {
                canvas.save();
                canvas.translate(0 + this.rightLeftSpinnerPadding, startYErrorLabel - this.errorLabelSpacing);
                this.staticLayout.draw(canvas);
                canvas.restore();
            } else {
                canvas.drawText(this.error.toString(), (0 + this.rightLeftSpinnerPadding) - this.errorLabelPosX, startYErrorLabel, this.textPaint);
                canvas.save();
                canvas.translate(this.textPaint.measureText(this.error.toString()) + (getWidth() / 2), 0.0f);
                canvas.drawText(this.error.toString(), (0 + this.rightLeftSpinnerPadding) - this.errorLabelPosX, startYErrorLabel, this.textPaint);
                canvas.restore();
            }
        } else {
            lineHeight = dpToPx(this.thickness);
            if (this.isSelected) {
                this.paint.setColor(this.highlightColor);
            } else {
                this.paint.setColor(isEnabled() ? this.baseColor : this.disabledColor);
            }
        }
        canvas.drawRect(0, startYLine, endX, startYLine + lineHeight, this.paint);
        if (this.hint != null || this.floatingLabelText != null) {
            if (this.isSelected) {
                this.textPaint.setColor(this.highlightColor);
            } else {
                this.textPaint.setColor(isEnabled() ? this.floatingLabelColor : this.disabledColor);
            }
            if (this.floatingLabelAnimator.isRunning() || !this.floatingLabelVisible) {
                this.textPaint.setAlpha((int) (((0.8d * this.floatingLabelPercent) + 0.2d) * this.baseAlpha * this.floatingLabelPercent));
            }
            String textToDraw = this.floatingLabelText != null ? this.floatingLabelText.toString() : this.hint.toString();
            canvas.drawText(textToDraw, 0 + this.rightLeftSpinnerPadding, startYFloatingLabel, this.textPaint);
        }
        drawSelector(canvas, getWidth() - this.rightLeftSpinnerPadding, getPaddingTop() + dpToPx(8.0f));
    }

    private void drawSelector(Canvas canvas, int posX, int posY) {
        if (this.isSelected) {
            this.paint.setColor(this.highlightColor);
        } else {
            this.paint.setColor(isEnabled() ? this.arrowColor : this.disabledColor);
        }
        Point point1 = this.selectorPoints[0];
        Point point2 = this.selectorPoints[1];
        Point point3 = this.selectorPoints[2];
        point1.set(posX, posY);
        point2.set((int) (posX - this.arrowSize), posY);
        point3.set((int) (posX - (this.arrowSize / 2.0f)), (int) (posY + (this.arrowSize / 2.0f)));
        this.selectorPath.reset();
        this.selectorPath.moveTo(point1.x, point1.y);
        this.selectorPath.lineTo(point2.x, point2.y);
        this.selectorPath.lineTo(point3.x, point3.y);
        this.selectorPath.close();
        canvas.drawPath(this.selectorPath, this.paint);
    }

    @Override // android.widget.Spinner, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (isEnabled()) {
            switch (event.getAction()) {
                case BuildConfig.DEBUG /* 0 */:
                    this.isSelected = true;
                    break;
                case 1:
                case 3:
                    this.isSelected = false;
                    break;
            }
            invalidate();
        }
        return super.onTouchEvent(event);
    }

    @Override // android.widget.AdapterView
    public void setOnItemSelectedListener(final AdapterView.OnItemSelectedListener listener) {
        AdapterView.OnItemSelectedListener onItemSelectedListener = new AdapterView.OnItemSelectedListener() { // from class: fr.ganfra.materialspinner.MaterialSpinner.1
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (MaterialSpinner.this.hint != null || MaterialSpinner.this.floatingLabelText != null) {
                    if (MaterialSpinner.this.floatingLabelVisible || position == 0) {
                        if (MaterialSpinner.this.floatingLabelVisible && position == 0) {
                            MaterialSpinner.this.hideFloatingLabel();
                        }
                    } else {
                        MaterialSpinner.this.showFloatingLabel();
                    }
                }
                if (position != MaterialSpinner.this.lastPosition && MaterialSpinner.this.error != null) {
                    MaterialSpinner.this.setError((CharSequence) null);
                }
                MaterialSpinner.this.lastPosition = position;
                if (listener != null) {
                    listener.onItemSelected(parent, view, MaterialSpinner.this.hint != null ? position - 1 : position, id);
                }
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
                if (listener != null) {
                    listener.onNothingSelected(parent);
                }
            }
        };
        super.setOnItemSelectedListener(onItemSelectedListener);
    }

    public void onAnimationUpdate(ValueAnimator animation) {
        invalidate();
    }

    public int getBaseColor() {
        return this.baseColor;
    }

    public void setBaseColor(int baseColor) {
        this.baseColor = baseColor;
        this.textPaint.setColor(baseColor);
        this.baseAlpha = this.textPaint.getAlpha();
        invalidate();
    }

    public int getHighlightColor() {
        return this.highlightColor;
    }

    public void setHighlightColor(int highlightColor) {
        this.highlightColor = highlightColor;
        invalidate();
    }

    public int getErrorColor() {
        return this.errorColor;
    }

    public void setErrorColor(int errorColor) {
        this.errorColor = errorColor;
        invalidate();
    }

    public void setHint(CharSequence hint) {
        this.hint = hint;
        invalidate();
    }

    public void setHint(int resid) {
        CharSequence hint = getResources().getString(resid);
        setHint(hint);
    }

    public CharSequence getHint() {
        return this.hint;
    }

    public void setFloatingLabelText(CharSequence floatingLabelText) {
        this.floatingLabelText = floatingLabelText;
        invalidate();
    }

    public void setFloatingLabelText(int resid) {
        String floatingLabelText = getResources().getString(resid);
        setFloatingLabelText(floatingLabelText);
    }

    public CharSequence getFloatingLabelText() {
        return this.floatingLabelText;
    }

    public void setError(CharSequence error) {
        this.error = error;
        if (this.errorLabelAnimator != null) {
            this.errorLabelAnimator.end();
        }
        if (this.multiline) {
            startErrorMultilineAnimator(prepareBottomPadding());
        } else if (needScrollingAnimation()) {
            startErrorScrollingAnimator();
        }
        requestLayout();
    }

    public void setError(int resid) {
        CharSequence error = getResources().getString(resid);
        setError(error);
    }

    @Override // android.widget.Spinner, android.view.View
    public void setEnabled(boolean enabled) {
        if (!enabled) {
            this.isSelected = false;
            invalidate();
        }
        super.setEnabled(enabled);
    }

    public CharSequence getError() {
        return this.error;
    }

    @Override // android.view.View
    @Deprecated
    public void setPadding(int left, int top, int right, int bottom) {
        super.setPadding(left, top, right, bottom);
    }

    public void setPaddingSafe(int left, int top, int right, int bottom) {
        this.innerPaddingRight = right;
        this.innerPaddingLeft = left;
        this.innerPaddingTop = top;
        this.innerPaddingBottom = bottom;
        setPadding();
    }

    @Override // android.widget.AdapterView
    public void setAdapter(SpinnerAdapter adapter) {
        super.setAdapter((SpinnerAdapter) new HintAdapter(adapter, getContext()));
    }

    private float getFloatingLabelPercent() {
        return this.floatingLabelPercent;
    }

    private void setFloatingLabelPercent(float floatingLabelPercent) {
        this.floatingLabelPercent = floatingLabelPercent;
    }

    private int getErrorLabelPosX() {
        return this.errorLabelPosX;
    }

    private void setErrorLabelPosX(int errorLabelPosX) {
        this.errorLabelPosX = errorLabelPosX;
    }

    private float getCurrentNbErrorLines() {
        return this.currentNbErrorLines;
    }

    private void setCurrentNbErrorLines(float currentNbErrorLines) {
        this.currentNbErrorLines = currentNbErrorLines;
        updateBottomPadding();
    }

    /* loaded from: com.github.ganfra.material-spinner.1.1.0.jar:fr/ganfra/materialspinner/MaterialSpinner$HintAdapter.class */
    private class HintAdapter extends BaseAdapter {
        private static final int HINT_TYPE = -1;
        private SpinnerAdapter mSpinnerAdapter;
        private Context mContext;

        public HintAdapter(SpinnerAdapter spinnerAdapter, Context context) {
            this.mSpinnerAdapter = spinnerAdapter;
            this.mContext = context;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getViewTypeCount() {
            if (Build.VERSION.SDK_INT >= 21) {
                return 1;
            }
            int viewTypeCount = this.mSpinnerAdapter.getViewTypeCount();
            return viewTypeCount;
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getItemViewType(int position) {
            int position2 = MaterialSpinner.this.hint != null ? position - 1 : position;
            if (position2 == -1) {
                return -1;
            }
            return this.mSpinnerAdapter.getItemViewType(position2);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            int count = this.mSpinnerAdapter.getCount();
            return MaterialSpinner.this.hint != null ? count + 1 : count;
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            int position2 = MaterialSpinner.this.hint != null ? position - 1 : position;
            return position2 == -1 ? MaterialSpinner.this.hint : this.mSpinnerAdapter.getItem(position2);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            int position2 = MaterialSpinner.this.hint != null ? position - 1 : position;
            if (position2 == -1) {
                return 0L;
            }
            return this.mSpinnerAdapter.getItemId(position2);
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            return buildView(position, convertView, parent, false);
        }

        @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
        public View getDropDownView(int position, View convertView, ViewGroup parent) {
            return buildView(position, convertView, parent, true);
        }

        private View buildView(int position, View convertView, ViewGroup parent, boolean isDropDownView) {
            if (getItemViewType(position) == -1) {
                return getHintView(parent, isDropDownView);
            }
            if (convertView != null) {
                convertView = (convertView.getTag() == null || !(convertView.getTag() instanceof Integer) || ((Integer) convertView.getTag()).intValue() == -1) ? null : convertView;
            }
            int position2 = MaterialSpinner.this.hint != null ? position - 1 : position;
            return isDropDownView ? this.mSpinnerAdapter.getDropDownView(position2, convertView, parent) : this.mSpinnerAdapter.getView(position2, convertView, parent);
        }

        private View getHintView(ViewGroup parent, boolean isDropDownView) {
            LayoutInflater inflater = LayoutInflater.from(this.mContext);
            int resid = isDropDownView ? R.layout.simple_spinner_dropdown_item : R.layout.simple_spinner_item;
            TextView textView = (TextView) inflater.inflate(resid, parent, false);
            textView.setText(MaterialSpinner.this.hint);
            textView.setTextColor(MaterialSpinner.this.isEnabled() ? MaterialSpinner.this.baseColor : MaterialSpinner.this.disabledColor);
            textView.setTag(-1);
            return textView;
        }
    }
}
