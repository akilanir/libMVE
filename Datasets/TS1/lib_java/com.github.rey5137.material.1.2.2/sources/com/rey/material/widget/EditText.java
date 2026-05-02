package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.text.Editable;
import android.text.InputFilter;
import android.text.Layout;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.KeyListener;
import android.text.method.MovementMethod;
import android.text.method.PasswordTransformationMethod;
import android.text.method.TransformationMethod;
import android.text.style.URLSpan;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;
import android.widget.AdapterView;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ListAdapter;
import android.widget.MultiAutoCompleteTextView;
import android.widget.Scroller;
import android.widget.TextView;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.DividerDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;
import com.rey.material.widget.TextView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText.class */
public class EditText extends FrameLayout implements ThemeManager.OnThemeChangedListener {
    private boolean mLabelEnable;
    private boolean mLabelVisible;
    protected int mSupportMode;
    protected int mAutoCompleteMode;
    public static final int SUPPORT_MODE_NONE = 0;
    public static final int SUPPORT_MODE_HELPER = 1;
    public static final int SUPPORT_MODE_HELPER_WITH_ERROR = 2;
    public static final int SUPPORT_MODE_CHAR_COUNTER = 3;
    public static final int AUTOCOMPLETE_MODE_NONE = 0;
    public static final int AUTOCOMPLETE_MODE_SINGLE = 1;
    public static final int AUTOCOMPLETE_MODE_MULTI = 2;
    private ColorStateList mDividerColors;
    private ColorStateList mDividerErrorColors;
    private boolean mDividerCompoundPadding;
    private int mDividerPadding;
    private ColorStateList mSupportColors;
    private ColorStateList mSupportErrorColors;
    private int mSupportMaxChars;
    private CharSequence mSupportHelper;
    private CharSequence mSupportError;
    private int mLabelInAnimId;
    private int mLabelOutAnimId;
    protected LabelView mLabelView;
    protected android.widget.EditText mInputView;
    protected LabelView mSupportView;
    private DividerDrawable mDivider;
    private TextView.OnSelectionChangedListener mOnSelectionChangedListener;
    private boolean mIsRtl;

    public EditText(Context context) {
        super(context);
    }

    public EditText(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public EditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public EditText(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.FrameLayout
    @TargetApi(16)
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mLabelEnable = false;
        this.mLabelVisible = false;
        this.mSupportMode = 0;
        this.mAutoCompleteMode = 0;
        this.mDividerCompoundPadding = true;
        this.mDividerPadding = -1;
        this.mIsRtl = false;
        super.init(context, attrs, defStyleAttr, defStyleRes);
        if (isInEditMode()) {
            applyStyle(R.style.Material_Widget_EditText);
        }
    }

    private LabelView getLabelView() {
        if (this.mLabelView == null) {
            this.mLabelView = new LabelView(getContext());
            if (Build.VERSION.SDK_INT >= 17) {
                this.mLabelView.setTextDirection(this.mIsRtl ? 4 : 3);
            }
            this.mLabelView.setGravity(8388611);
            this.mLabelView.setSingleLine(true);
        }
        return this.mLabelView;
    }

    private LabelView getSupportView() {
        if (this.mSupportView == null) {
            this.mSupportView = new LabelView(getContext());
        }
        return this.mSupportView;
    }

    private boolean needCreateInputView(int autoCompleteMode) {
        if (this.mInputView == null) {
            return true;
        }
        switch (autoCompleteMode) {
            case 0:
                return !(this.mInputView instanceof InternalEditText);
            case 1:
                return !(this.mInputView instanceof InternalAutoCompleteTextView);
            case 2:
                return !(this.mInputView instanceof InternalMultiAutoCompleteTextView);
            default:
                return false;
        }
    }

    /* JADX WARN: Type inference failed for: r0v145, types: [int[], int[][]] */
    @Override // com.rey.material.widget.FrameLayout
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        CharSequence text = this.mInputView == null ? null : this.mInputView.getText();
        removeAllViews();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.EditText, defStyleAttr, defStyleRes);
        int labelPadding = -1;
        int labelTextSize = -1;
        ColorStateList labelTextColor = null;
        int supportPadding = -1;
        int supportTextSize = -1;
        ColorStateList supportColors = null;
        ColorStateList supportErrorColors = null;
        String supportHelper = null;
        String supportError = null;
        ColorStateList dividerColors = null;
        ColorStateList dividerErrorColors = null;
        int dividerHeight = -1;
        int dividerPadding = -1;
        int dividerAnimDuration = -1;
        this.mAutoCompleteMode = a.getInteger(R.styleable.EditText_et_autoCompleteMode, this.mAutoCompleteMode);
        if (needCreateInputView(this.mAutoCompleteMode)) {
            switch (this.mAutoCompleteMode) {
                case 1:
                    this.mInputView = new InternalAutoCompleteTextView(context, attrs, defStyleAttr);
                    break;
                case 2:
                    this.mInputView = new InternalMultiAutoCompleteTextView(context, attrs, defStyleAttr);
                    break;
                default:
                    this.mInputView = new InternalEditText(context, attrs, defStyleAttr);
                    break;
            }
            ViewUtil.applyFont(this.mInputView, attrs, defStyleAttr, defStyleRes);
            if (text != null) {
                this.mInputView.setText(text);
            }
            this.mInputView.addTextChangedListener(new InputTextWatcher());
            if (this.mDivider != null) {
                this.mDivider.setAnimEnable(false);
                ViewUtil.setBackground(this.mInputView, this.mDivider);
                this.mDivider.setAnimEnable(true);
            }
        } else {
            ViewUtil.applyStyle((View) this.mInputView, attrs, defStyleAttr, defStyleRes);
        }
        this.mInputView.setVisibility(0);
        this.mInputView.setFocusableInTouchMode(true);
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.EditText_et_labelEnable) {
                this.mLabelEnable = a.getBoolean(attr, false);
            } else if (attr == R.styleable.EditText_et_labelPadding) {
                labelPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_labelTextSize) {
                labelTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_labelTextColor) {
                labelTextColor = a.getColorStateList(attr);
            } else if (attr == R.styleable.EditText_et_labelTextAppearance) {
                getLabelView().setTextAppearance(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.EditText_et_labelEllipsize) {
                int labelEllipsize = a.getInteger(attr, 0);
                switch (labelEllipsize) {
                    case 1:
                        getLabelView().setEllipsize(TextUtils.TruncateAt.START);
                        break;
                    case 2:
                        getLabelView().setEllipsize(TextUtils.TruncateAt.MIDDLE);
                        break;
                    case 3:
                        getLabelView().setEllipsize(TextUtils.TruncateAt.END);
                        break;
                    case 4:
                        getLabelView().setEllipsize(TextUtils.TruncateAt.MARQUEE);
                        break;
                    default:
                        getLabelView().setEllipsize(TextUtils.TruncateAt.END);
                        break;
                }
            } else if (attr == R.styleable.EditText_et_labelInAnim) {
                this.mLabelInAnimId = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.EditText_et_labelOutAnim) {
                this.mLabelOutAnimId = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.EditText_et_supportMode) {
                this.mSupportMode = a.getInteger(attr, 0);
            } else if (attr == R.styleable.EditText_et_supportPadding) {
                supportPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_supportTextSize) {
                supportTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_supportTextColor) {
                supportColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.EditText_et_supportTextErrorColor) {
                supportErrorColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.EditText_et_supportTextAppearance) {
                getSupportView().setTextAppearance(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.EditText_et_supportEllipsize) {
                int supportEllipsize = a.getInteger(attr, 0);
                switch (supportEllipsize) {
                    case 1:
                        getSupportView().setEllipsize(TextUtils.TruncateAt.START);
                        break;
                    case 2:
                        getSupportView().setEllipsize(TextUtils.TruncateAt.MIDDLE);
                        break;
                    case 3:
                        getSupportView().setEllipsize(TextUtils.TruncateAt.END);
                        break;
                    case 4:
                        getSupportView().setEllipsize(TextUtils.TruncateAt.MARQUEE);
                        break;
                    default:
                        getSupportView().setEllipsize(TextUtils.TruncateAt.END);
                        break;
                }
            } else if (attr == R.styleable.EditText_et_supportMaxLines) {
                getSupportView().setMaxLines(a.getInteger(attr, 0));
            } else if (attr == R.styleable.EditText_et_supportLines) {
                getSupportView().setLines(a.getInteger(attr, 0));
            } else if (attr == R.styleable.EditText_et_supportSingleLine) {
                getSupportView().setSingleLine(a.getBoolean(attr, false));
            } else if (attr == R.styleable.EditText_et_supportMaxChars) {
                this.mSupportMaxChars = a.getInteger(attr, 0);
            } else if (attr == R.styleable.EditText_et_helper) {
                supportHelper = a.getString(attr);
            } else if (attr == R.styleable.EditText_et_error) {
                supportError = a.getString(attr);
            } else if (attr == R.styleable.EditText_et_inputId) {
                this.mInputView.setId(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.EditText_et_dividerColor) {
                dividerColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.EditText_et_dividerErrorColor) {
                dividerErrorColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.EditText_et_dividerHeight) {
                dividerHeight = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_dividerPadding) {
                dividerPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.EditText_et_dividerAnimDuration) {
                dividerAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.EditText_et_dividerCompoundPadding) {
                this.mDividerCompoundPadding = a.getBoolean(attr, true);
            }
        }
        a.recycle();
        if (this.mInputView.getId() == 0) {
            this.mInputView.setId(ViewUtil.generateViewId());
        }
        if (this.mDivider == null) {
            this.mDividerColors = dividerColors;
            this.mDividerErrorColors = dividerErrorColors;
            if (this.mDividerColors == null) {
                ?? r0 = {new int[]{-16842908}, new int[]{android.R.attr.state_focused, android.R.attr.state_enabled}};
                int[] colors = {ThemeUtil.colorControlNormal(context, -16777216), ThemeUtil.colorControlActivated(context, -16777216)};
                this.mDividerColors = new ColorStateList(r0, colors);
            }
            if (this.mDividerErrorColors == null) {
                this.mDividerErrorColors = ColorStateList.valueOf(ThemeUtil.colorAccent(context, -65536));
            }
            if (dividerHeight < 0) {
                dividerHeight = 0;
            }
            if (dividerPadding < 0) {
                dividerPadding = 0;
            }
            if (dividerAnimDuration < 0) {
                dividerAnimDuration = context.getResources().getInteger(android.R.integer.config_shortAnimTime);
            }
            this.mDividerPadding = dividerPadding;
            this.mInputView.setPadding(0, 0, 0, this.mDividerPadding + dividerHeight);
            this.mDivider = new DividerDrawable(dividerHeight, this.mDividerCompoundPadding ? this.mInputView.getTotalPaddingLeft() : 0, this.mDividerCompoundPadding ? this.mInputView.getTotalPaddingRight() : 0, this.mDividerColors, dividerAnimDuration);
            this.mDivider.setInEditMode(isInEditMode());
            this.mDivider.setAnimEnable(false);
            ViewUtil.setBackground(this.mInputView, this.mDivider);
            this.mDivider.setAnimEnable(true);
        } else {
            if (dividerHeight >= 0 || dividerPadding >= 0) {
                if (dividerHeight < 0) {
                    dividerHeight = this.mDivider.getDividerHeight();
                }
                if (dividerPadding >= 0) {
                    this.mDividerPadding = dividerPadding;
                }
                this.mInputView.setPadding(0, 0, 0, this.mDividerPadding + dividerHeight);
                this.mDivider.setDividerHeight(dividerHeight);
                this.mDivider.setPadding(this.mDividerCompoundPadding ? this.mInputView.getTotalPaddingLeft() : 0, this.mDividerCompoundPadding ? this.mInputView.getTotalPaddingRight() : 0);
            }
            if (dividerColors != null) {
                this.mDividerColors = dividerColors;
            }
            if (dividerErrorColors != null) {
                this.mDividerErrorColors = dividerErrorColors;
            }
            this.mDivider.setColor(getError() == null ? this.mDividerColors : this.mDividerErrorColors);
            if (dividerAnimDuration >= 0) {
                this.mDivider.setAnimationDuration(dividerAnimDuration);
            }
        }
        if (labelPadding >= 0) {
            getLabelView().setPadding(this.mDivider.getPaddingLeft(), 0, this.mDivider.getPaddingRight(), labelPadding);
        }
        if (labelTextSize >= 0) {
            getLabelView().setTextSize(0, labelTextSize);
        }
        if (labelTextColor != null) {
            getLabelView().setTextColor(labelTextColor);
        }
        if (this.mLabelEnable) {
            this.mLabelVisible = true;
            getLabelView().setText(this.mInputView.getHint());
            addView(getLabelView(), 0, new ViewGroup.LayoutParams(-1, -2));
            setLabelVisible(!TextUtils.isEmpty(this.mInputView.getText().toString()), false);
        }
        if (supportTextSize >= 0) {
            getSupportView().setTextSize(0, supportTextSize);
        }
        if (supportColors != null) {
            this.mSupportColors = supportColors;
        } else if (this.mSupportColors == null) {
            this.mSupportColors = context.getResources().getColorStateList(R.color.abc_secondary_text_material_light);
        }
        if (supportErrorColors != null) {
            this.mSupportErrorColors = supportErrorColors;
        } else if (this.mSupportErrorColors == null) {
            this.mSupportErrorColors = ColorStateList.valueOf(ThemeUtil.colorAccent(context, -65536));
        }
        if (supportPadding >= 0) {
            getSupportView().setPadding(this.mDivider.getPaddingLeft(), supportPadding, this.mDivider.getPaddingRight(), 0);
        }
        if (supportHelper == null && supportError == null) {
            getSupportView().setTextColor(getError() == null ? this.mSupportColors : this.mSupportErrorColors);
        } else if (supportHelper != null) {
            setHelper(supportHelper);
        } else {
            setError(supportError);
        }
        if (this.mSupportMode != 0) {
            switch (this.mSupportMode) {
                case 1:
                case 2:
                    getSupportView().setGravity(8388611);
                    break;
                case 3:
                    getSupportView().setGravity(8388613);
                    updateCharCounter(this.mInputView.getText().length());
                    break;
            }
            addView(getSupportView(), new ViewGroup.LayoutParams(-1, -2));
        }
        addView(this.mInputView, new ViewGroup.LayoutParams(-1, -2));
        requestLayout();
    }

    @Override // android.view.View
    @TargetApi(17)
    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            if (Build.VERSION.SDK_INT >= 17) {
                if (this.mLabelView != null) {
                    this.mLabelView.setTextDirection(this.mIsRtl ? 4 : 3);
                }
                if (this.mSupportView != null) {
                    this.mSupportView.setTextDirection(this.mIsRtl ? 4 : 3);
                }
            }
            requestLayout();
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        int tempWidthSpec = widthMode == 0 ? widthMeasureSpec : View.MeasureSpec.makeMeasureSpec((widthSize - getPaddingLeft()) - getPaddingRight(), widthMode);
        int tempHeightSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int labelWidth = 0;
        int labelHeight = 0;
        int supportWidth = 0;
        int supportHeight = 0;
        boolean measureLabelView = (this.mLabelView == null || this.mLabelView.getLayoutParams() == null) ? false : true;
        boolean measureSupportView = (this.mSupportView == null || this.mSupportView.getLayoutParams() == null) ? false : true;
        if (measureLabelView) {
            this.mLabelView.measure(tempWidthSpec, tempHeightSpec);
            labelWidth = this.mLabelView.getMeasuredWidth();
            labelHeight = this.mLabelView.getMeasuredHeight();
        }
        this.mInputView.measure(tempWidthSpec, tempHeightSpec);
        int inputWidth = this.mInputView.getMeasuredWidth();
        int inputHeight = this.mInputView.getMeasuredHeight();
        if (measureSupportView) {
            this.mSupportView.measure(tempWidthSpec, tempHeightSpec);
            supportWidth = this.mSupportView.getMeasuredWidth();
            supportHeight = this.mSupportView.getMeasuredHeight();
        }
        int width = 0;
        int height = 0;
        switch (widthMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                width = Math.min(widthSize, Math.max(labelWidth, Math.max(inputWidth, supportWidth)) + getPaddingLeft() + getPaddingRight());
                break;
            case 0:
                width = Math.max(labelWidth, Math.max(inputWidth, supportWidth)) + getPaddingLeft() + getPaddingRight();
                break;
            case 1073741824:
                width = widthSize;
                break;
        }
        int inputWidth2 = (width - getPaddingLeft()) - getPaddingRight();
        int tempWidthSpec2 = View.MeasureSpec.makeMeasureSpec(inputWidth2, 1073741824);
        if (measureLabelView && this.mLabelView.getWidth() != inputWidth2) {
            this.mLabelView.measure(tempWidthSpec2, tempHeightSpec);
            labelHeight = this.mLabelView.getMeasuredHeight();
        }
        if (measureSupportView && this.mSupportView.getWidth() != inputWidth2) {
            this.mSupportView.measure(tempWidthSpec2, tempHeightSpec);
            supportHeight = this.mSupportView.getMeasuredHeight();
        }
        switch (heightMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                height = Math.min(heightSize, labelHeight + inputHeight + supportHeight + getPaddingTop() + getPaddingBottom());
                break;
            case 0:
                height = labelHeight + inputHeight + supportHeight + getPaddingTop() + getPaddingBottom();
                break;
            case 1073741824:
                height = heightSize;
                break;
        }
        setMeasuredDimension(width, height);
        int inputHeight2 = (((height - labelHeight) - supportHeight) - getPaddingTop()) - getPaddingBottom();
        if (this.mInputView.getMeasuredWidth() != inputWidth2 || this.mInputView.getMeasuredHeight() != inputHeight2) {
            this.mInputView.measure(tempWidthSpec2, View.MeasureSpec.makeMeasureSpec(inputHeight2, 1073741824));
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int childLeft = getPaddingLeft();
        int childRight = (r - l) - getPaddingRight();
        int childTop = getPaddingTop();
        int childBottom = (b - t) - getPaddingBottom();
        if (this.mLabelView != null) {
            this.mLabelView.layout(childLeft, childTop, childRight, childTop + this.mLabelView.getMeasuredHeight());
            childTop += this.mLabelView.getMeasuredHeight();
        }
        if (this.mSupportView != null) {
            this.mSupportView.layout(childLeft, childBottom - this.mSupportView.getMeasuredHeight(), childRight, childBottom);
            childBottom -= this.mSupportView.getMeasuredHeight();
        }
        this.mInputView.layout(childLeft, childTop, childRight, childBottom);
    }

    public void setHelper(CharSequence helper) {
        this.mSupportHelper = helper;
        setError(this.mSupportError);
    }

    public CharSequence getHelper() {
        return this.mSupportHelper;
    }

    public void setError(CharSequence error) {
        this.mSupportError = error;
        if (this.mSupportMode != 1 && this.mSupportMode != 2) {
            return;
        }
        if (this.mSupportError != null) {
            getSupportView().setTextColor(this.mSupportErrorColors);
            this.mDivider.setColor(this.mDividerErrorColors);
            getSupportView().setText(this.mSupportMode == 1 ? this.mSupportError : TextUtils.concat(this.mSupportHelper, ", ", this.mSupportError));
        } else {
            getSupportView().setTextColor(this.mSupportColors);
            this.mDivider.setColor(this.mDividerColors);
            getSupportView().setText(this.mSupportHelper);
        }
    }

    public CharSequence getError() {
        return this.mSupportError;
    }

    public void clearError() {
        setError(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateCharCounter(int count) {
        if (count == 0) {
            getSupportView().setTextColor(this.mSupportColors);
            this.mDivider.setColor(this.mDividerColors);
            getSupportView().setText((CharSequence) null);
        } else {
            if (this.mSupportMaxChars > 0) {
                getSupportView().setTextColor(count > this.mSupportMaxChars ? this.mSupportErrorColors : this.mSupportColors);
                this.mDivider.setColor(count > this.mSupportMaxChars ? this.mDividerErrorColors : this.mDividerColors);
                getSupportView().setText(count + " / " + this.mSupportMaxChars);
                return;
            }
            getSupportView().setText(String.valueOf(count));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setLabelVisible(boolean visible, boolean animation) {
        if (!this.mLabelEnable || this.mLabelVisible == visible) {
            return;
        }
        this.mLabelVisible = visible;
        if (animation) {
            if (this.mLabelVisible) {
                if (this.mLabelInAnimId != 0) {
                    Animation anim = AnimationUtils.loadAnimation(getContext(), this.mLabelInAnimId);
                    anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.widget.EditText.1
                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationStart(Animation animation2) {
                            EditText.this.mLabelView.setVisibility(0);
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationRepeat(Animation animation2) {
                        }

                        @Override // android.view.animation.Animation.AnimationListener
                        public void onAnimationEnd(Animation animation2) {
                        }
                    });
                    this.mLabelView.clearAnimation();
                    this.mLabelView.startAnimation(anim);
                    return;
                }
                this.mLabelView.setVisibility(0);
                return;
            }
            if (this.mLabelOutAnimId != 0) {
                Animation anim2 = AnimationUtils.loadAnimation(getContext(), this.mLabelOutAnimId);
                anim2.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.widget.EditText.2
                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationStart(Animation animation2) {
                        EditText.this.mLabelView.setVisibility(0);
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationRepeat(Animation animation2) {
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationEnd(Animation animation2) {
                        EditText.this.mLabelView.setVisibility(4);
                    }
                });
                this.mLabelView.clearAnimation();
                this.mLabelView.startAnimation(anim2);
                return;
            }
            this.mLabelView.setVisibility(4);
            return;
        }
        this.mLabelView.setVisibility(this.mLabelVisible ? 0 : 4);
    }

    protected CharSequence convertSelectionToString(Object selectedItem) {
        switch (this.mAutoCompleteMode) {
            case 1:
                return ((InternalAutoCompleteTextView) this.mInputView).superConvertSelectionToString(selectedItem);
            case 2:
                return ((InternalMultiAutoCompleteTextView) this.mInputView).superConvertSelectionToString(selectedItem);
            default:
                return null;
        }
    }

    protected void performFiltering(CharSequence text, int keyCode) {
        switch (this.mAutoCompleteMode) {
            case 1:
                ((InternalAutoCompleteTextView) this.mInputView).superPerformFiltering(text, keyCode);
                break;
            case 2:
                ((InternalMultiAutoCompleteTextView) this.mInputView).superPerformFiltering(text, keyCode);
                break;
        }
    }

    protected void replaceText(CharSequence text) {
        switch (this.mAutoCompleteMode) {
            case 1:
                ((InternalAutoCompleteTextView) this.mInputView).superReplaceText(text);
                break;
            case 2:
                ((InternalMultiAutoCompleteTextView) this.mInputView).superReplaceText(text);
                break;
        }
    }

    protected Filter getFilter() {
        switch (this.mAutoCompleteMode) {
            case 1:
                return ((InternalAutoCompleteTextView) this.mInputView).superGetFilter();
            case 2:
                return ((InternalMultiAutoCompleteTextView) this.mInputView).superGetFilter();
            default:
                return null;
        }
    }

    protected void performFiltering(CharSequence text, int start, int end, int keyCode) {
        if (this.mAutoCompleteMode == 2) {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superPerformFiltering(text, start, end, keyCode);
        }
    }

    public void setCompletionHint(CharSequence hint) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setCompletionHint(hint);
    }

    @TargetApi(16)
    public CharSequence getCompletionHint() {
        if (this.mAutoCompleteMode == 0 || Build.VERSION.SDK_INT < 16) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getCompletionHint();
    }

    public int getDropDownWidth() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownWidth();
    }

    public void setDropDownWidth(int width) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownWidth(width);
    }

    public int getDropDownHeight() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownHeight();
    }

    public void setDropDownHeight(int height) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownHeight(height);
    }

    public int getDropDownAnchor() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownAnchor();
    }

    public void setDropDownAnchor(int id) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownAnchor(id);
    }

    public Drawable getDropDownBackground() {
        if (this.mAutoCompleteMode == 0) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownBackground();
    }

    public void setDropDownBackgroundDrawable(Drawable d) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownBackgroundDrawable(d);
    }

    public void setDropDownBackgroundResource(int id) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownBackgroundResource(id);
    }

    public void setDropDownVerticalOffset(int offset) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownVerticalOffset(offset);
    }

    public int getDropDownVerticalOffset() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownVerticalOffset();
    }

    public void setDropDownHorizontalOffset(int offset) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setDropDownHorizontalOffset(offset);
    }

    public int getDropDownHorizontalOffset() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getDropDownHorizontalOffset();
    }

    public int getThreshold() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getThreshold();
    }

    public void setThreshold(int threshold) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setThreshold(threshold);
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener l) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setOnItemClickListener(l);
    }

    public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener l) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setOnItemSelectedListener(l);
    }

    public AdapterView.OnItemClickListener getOnItemClickListener() {
        if (this.mAutoCompleteMode == 0) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getOnItemClickListener();
    }

    public AdapterView.OnItemSelectedListener getOnItemSelectedListener() {
        if (this.mAutoCompleteMode == 0) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getOnItemSelectedListener();
    }

    public ListAdapter getAdapter() {
        if (this.mAutoCompleteMode == 0) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getAdapter();
    }

    public <T extends ListAdapter & Filterable> void setAdapter(T adapter) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setAdapter(adapter);
    }

    public boolean enoughToFilter() {
        if (this.mAutoCompleteMode == 0) {
            return false;
        }
        return ((AutoCompleteTextView) this.mInputView).enoughToFilter();
    }

    public boolean isPopupShowing() {
        if (this.mAutoCompleteMode == 0) {
            return false;
        }
        return ((AutoCompleteTextView) this.mInputView).isPopupShowing();
    }

    public void clearListSelection() {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).clearListSelection();
    }

    public void setListSelection(int position) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setListSelection(position);
    }

    public int getListSelection() {
        if (this.mAutoCompleteMode == 0) {
            return 0;
        }
        return ((AutoCompleteTextView) this.mInputView).getListSelection();
    }

    public void performCompletion() {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).performCompletion();
    }

    public boolean isPerformingCompletion() {
        if (this.mAutoCompleteMode == 0) {
            return false;
        }
        return ((AutoCompleteTextView) this.mInputView).isPerformingCompletion();
    }

    public void onFilterComplete(int count) {
        if (this.mAutoCompleteMode == 1) {
            ((InternalAutoCompleteTextView) this.mInputView).superOnFilterComplete(count);
        } else if (this.mAutoCompleteMode == 2) {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superOnFilterComplete(count);
        }
    }

    public void dismissDropDown() {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).dismissDropDown();
    }

    public void showDropDown() {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).showDropDown();
    }

    public void setValidator(AutoCompleteTextView.Validator validator) {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).setValidator(validator);
    }

    public AutoCompleteTextView.Validator getValidator() {
        if (this.mAutoCompleteMode == 0) {
            return null;
        }
        return ((AutoCompleteTextView) this.mInputView).getValidator();
    }

    public void performValidation() {
        if (this.mAutoCompleteMode == 0) {
            return;
        }
        ((AutoCompleteTextView) this.mInputView).performValidation();
    }

    public void setTokenizer(MultiAutoCompleteTextView.Tokenizer t) {
        if (this.mAutoCompleteMode != 2) {
            return;
        }
        ((MultiAutoCompleteTextView) this.mInputView).setTokenizer(t);
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        this.mInputView.setEnabled(enabled);
    }

    public void extendSelection(int index) {
        this.mInputView.extendSelection(index);
    }

    public Editable getText() {
        return this.mInputView.getText();
    }

    public void selectAll() {
        this.mInputView.selectAll();
    }

    public void setEllipsize(TextUtils.TruncateAt ellipsis) {
        this.mInputView.setEllipsize(ellipsis);
    }

    public void setSelection(int index) {
        this.mInputView.setSelection(index);
    }

    public void setSelection(int start, int stop) {
        this.mInputView.setSelection(start, stop);
    }

    public void setText(CharSequence text, TextView.BufferType type) {
        this.mInputView.setText(text, type);
    }

    public void addTextChangedListener(TextWatcher textWatcher) {
        this.mInputView.addTextChangedListener(textWatcher);
    }

    public final void append(CharSequence text) {
        this.mInputView.append(text);
    }

    public void append(CharSequence text, int start, int end) {
        this.mInputView.append(text, start, end);
    }

    public void beginBatchEdit() {
        this.mInputView.beginBatchEdit();
    }

    public boolean bringPointIntoView(int offset) {
        return this.mInputView.bringPointIntoView(offset);
    }

    @Override // android.view.View
    public void cancelLongPress() {
        this.mInputView.cancelLongPress();
    }

    public void clearComposingText() {
        this.mInputView.clearComposingText();
    }

    @Override // android.view.View
    public void computeScroll() {
        this.mInputView.computeScroll();
    }

    @Override // android.view.ViewGroup
    public void debug(int depth) {
        this.mInputView.debug(depth);
    }

    public boolean didTouchFocusSelect() {
        return this.mInputView.didTouchFocusSelect();
    }

    public void endBatchEdit() {
        this.mInputView.endBatchEdit();
    }

    public boolean extractText(ExtractedTextRequest request, ExtractedText outText) {
        return this.mInputView.extractText(request, outText);
    }

    @Override // android.view.ViewGroup, android.view.View
    @TargetApi(14)
    public void findViewsWithText(ArrayList<View> outViews, CharSequence searched, int flags) {
        if (Build.VERSION.SDK_INT >= 14) {
            this.mInputView.findViewsWithText(outViews, searched, flags);
        }
    }

    public final int getAutoLinkMask() {
        return this.mInputView.getAutoLinkMask();
    }

    @Override // android.view.View
    public int getBaseline() {
        return this.mInputView.getBaseline();
    }

    public int getCompoundDrawablePadding() {
        return this.mInputView.getCompoundDrawablePadding();
    }

    public Drawable[] getCompoundDrawables() {
        return this.mInputView.getCompoundDrawables();
    }

    @TargetApi(17)
    public Drawable[] getCompoundDrawablesRelative() {
        if (Build.VERSION.SDK_INT >= 17) {
            return this.mInputView.getCompoundDrawablesRelative();
        }
        return this.mInputView.getCompoundDrawables();
    }

    public int getCompoundPaddingBottom() {
        return this.mInputView.getCompoundPaddingBottom();
    }

    @TargetApi(17)
    public int getCompoundPaddingEnd() {
        if (Build.VERSION.SDK_INT >= 17) {
            return this.mInputView.getCompoundPaddingEnd();
        }
        return this.mInputView.getCompoundPaddingRight();
    }

    public int getCompoundPaddingLeft() {
        return this.mInputView.getCompoundPaddingLeft();
    }

    public int getCompoundPaddingRight() {
        return this.mInputView.getCompoundPaddingRight();
    }

    @TargetApi(17)
    public int getCompoundPaddingStart() {
        if (Build.VERSION.SDK_INT >= 17) {
            return this.mInputView.getCompoundPaddingStart();
        }
        return this.mInputView.getCompoundPaddingLeft();
    }

    public int getCompoundPaddingTop() {
        return this.mInputView.getCompoundPaddingTop();
    }

    public final int getCurrentHintTextColor() {
        return this.mInputView.getCurrentHintTextColor();
    }

    public final int getCurrentTextColor() {
        return this.mInputView.getCurrentTextColor();
    }

    @TargetApi(11)
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        if (Build.VERSION.SDK_INT >= 11) {
            return this.mInputView.getCustomSelectionActionModeCallback();
        }
        return null;
    }

    public Editable getEditableText() {
        return this.mInputView.getEditableText();
    }

    public TextUtils.TruncateAt getEllipsize() {
        return this.mInputView.getEllipsize();
    }

    public int getExtendedPaddingBottom() {
        return this.mInputView.getExtendedPaddingBottom();
    }

    public int getExtendedPaddingTop() {
        return this.mInputView.getExtendedPaddingTop();
    }

    public InputFilter[] getFilters() {
        return this.mInputView.getFilters();
    }

    @Override // android.view.View
    public void getFocusedRect(@NonNull Rect r) {
        this.mInputView.getFocusedRect(r);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public String getFontFeatureSettings() {
        if (Build.VERSION.SDK_INT >= 21) {
            return this.mInputView.getFontFeatureSettings();
        }
        return null;
    }

    public boolean getFreezesText() {
        return this.mInputView.getFreezesText();
    }

    public int getGravity() {
        return this.mInputView.getGravity();
    }

    @TargetApi(16)
    public int getHighlightColor() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getHighlightColor();
        }
        return 0;
    }

    public CharSequence getHint() {
        return this.mInputView.getHint();
    }

    public final ColorStateList getHintTextColors() {
        return this.mInputView.getHintTextColors();
    }

    public int getImeActionId() {
        return this.mInputView.getImeActionId();
    }

    public CharSequence getImeActionLabel() {
        return this.mInputView.getImeActionLabel();
    }

    public int getImeOptions() {
        return this.mInputView.getImeOptions();
    }

    @TargetApi(16)
    public boolean getIncludeFontPadding() {
        return Build.VERSION.SDK_INT >= 16 && this.mInputView.getIncludeFontPadding();
    }

    public Bundle getInputExtras(boolean create) {
        return this.mInputView.getInputExtras(create);
    }

    public int getInputType() {
        return this.mInputView.getInputType();
    }

    public final KeyListener getKeyListener() {
        return this.mInputView.getKeyListener();
    }

    public final Layout getLayout() {
        return this.mInputView.getLayout();
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public float getLetterSpacing() {
        if (Build.VERSION.SDK_INT >= 21) {
            return this.mInputView.getLetterSpacing();
        }
        return 0.0f;
    }

    public int getLineBounds(int line, Rect bounds) {
        return this.mInputView.getLineBounds(line, bounds);
    }

    public int getLineCount() {
        return this.mInputView.getLineCount();
    }

    public int getLineHeight() {
        return this.mInputView.getLineHeight();
    }

    @TargetApi(16)
    public float getLineSpacingExtra() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getLineSpacingExtra();
        }
        return 0.0f;
    }

    @TargetApi(16)
    public float getLineSpacingMultiplier() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getLineSpacingMultiplier();
        }
        return 0.0f;
    }

    public final ColorStateList getLinkTextColors() {
        return this.mInputView.getLinkTextColors();
    }

    public final boolean getLinksClickable() {
        return this.mInputView.getLinksClickable();
    }

    @TargetApi(16)
    public int getMarqueeRepeatLimit() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMarqueeRepeatLimit();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMaxEms() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMaxEms();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMaxHeight() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMaxHeight();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMaxLines() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMaxLines();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMaxWidth() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMaxWidth();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMinEms() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMinEms();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMinHeight() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMinHeight();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMinLines() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMinLines();
        }
        return -1;
    }

    @TargetApi(16)
    public int getMinWidth() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getMinWidth();
        }
        return -1;
    }

    public final MovementMethod getMovementMethod() {
        return this.mInputView.getMovementMethod();
    }

    @TargetApi(14)
    public int getOffsetForPosition(float x, float y) {
        if (getLayout() == null) {
            return -1;
        }
        int line = getLineAtCoordinate(y);
        int offset = getOffsetAtCoordinate(line, x);
        return offset;
    }

    protected float convertToLocalHorizontalCoordinate(float x) {
        return Math.min((getWidth() - getTotalPaddingRight()) - 1, Math.max(0.0f, x - getTotalPaddingLeft())) + getScrollX();
    }

    protected int getLineAtCoordinate(float y) {
        return getLayout().getLineForVertical((int) (Math.min((getHeight() - getTotalPaddingBottom()) - 1, Math.max(0.0f, y - getTotalPaddingTop())) + getScrollY()));
    }

    protected int getOffsetAtCoordinate(int line, float x) {
        return getLayout().getOffsetForHorizontal(line, convertToLocalHorizontalCoordinate(x));
    }

    public TextPaint getPaint() {
        return this.mInputView.getPaint();
    }

    public int getPaintFlags() {
        return this.mInputView.getPaintFlags();
    }

    public String getPrivateImeOptions() {
        return this.mInputView.getPrivateImeOptions();
    }

    public int getSelectionEnd() {
        return this.mInputView.getSelectionEnd();
    }

    public int getSelectionStart() {
        return this.mInputView.getSelectionStart();
    }

    @TargetApi(16)
    public int getShadowColor() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getShadowColor();
        }
        return 0;
    }

    @TargetApi(16)
    public float getShadowDx() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getShadowDx();
        }
        return 0.0f;
    }

    @TargetApi(16)
    public float getShadowDy() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getShadowDy();
        }
        return 0.0f;
    }

    @TargetApi(16)
    public float getShadowRadius() {
        if (Build.VERSION.SDK_INT >= 16) {
            return this.mInputView.getShadowRadius();
        }
        return 0.0f;
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public final boolean getShowSoftInputOnFocus() {
        if (Build.VERSION.SDK_INT >= 21) {
            return this.mInputView.getShowSoftInputOnFocus();
        }
        return true;
    }

    public final ColorStateList getTextColors() {
        return this.mInputView.getTextColors();
    }

    @TargetApi(17)
    public Locale getTextLocale() {
        if (Build.VERSION.SDK_INT >= 17) {
            return this.mInputView.getTextLocale();
        }
        return Locale.getDefault();
    }

    public float getTextScaleX() {
        return this.mInputView.getTextScaleX();
    }

    public float getTextSize() {
        return this.mInputView.getTextSize();
    }

    public int getTotalPaddingBottom() {
        return getPaddingBottom() + this.mInputView.getTotalPaddingBottom() + (this.mSupportMode != 0 ? this.mSupportView.getHeight() : 0);
    }

    @TargetApi(17)
    public int getTotalPaddingEnd() {
        if (Build.VERSION.SDK_INT >= 17) {
            return getPaddingEnd() + this.mInputView.getTotalPaddingEnd();
        }
        return getTotalPaddingRight();
    }

    public int getTotalPaddingLeft() {
        return getPaddingLeft() + this.mInputView.getTotalPaddingLeft();
    }

    public int getTotalPaddingRight() {
        return getPaddingRight() + this.mInputView.getTotalPaddingRight();
    }

    @TargetApi(17)
    public int getTotalPaddingStart() {
        if (Build.VERSION.SDK_INT >= 17) {
            return getPaddingStart() + this.mInputView.getTotalPaddingStart();
        }
        return getTotalPaddingLeft();
    }

    public int getTotalPaddingTop() {
        return getPaddingTop() + this.mInputView.getTotalPaddingTop() + (this.mLabelEnable ? this.mLabelView.getHeight() : 0);
    }

    public final TransformationMethod getTransformationMethod() {
        return this.mInputView.getTransformationMethod();
    }

    public Typeface getTypeface() {
        return this.mInputView.getTypeface();
    }

    public URLSpan[] getUrls() {
        return this.mInputView.getUrls();
    }

    @Override // android.view.View
    @TargetApi(16)
    public boolean hasOverlappingRendering() {
        return Build.VERSION.SDK_INT >= 16 && this.mInputView.hasOverlappingRendering();
    }

    public boolean hasSelection() {
        return this.mInputView.hasSelection();
    }

    @TargetApi(16)
    public boolean isCursorVisible() {
        return Build.VERSION.SDK_INT < 16 || this.mInputView.isCursorVisible();
    }

    public boolean isInputMethodTarget() {
        return this.mInputView.isInputMethodTarget();
    }

    @TargetApi(14)
    public boolean isSuggestionsEnabled() {
        return Build.VERSION.SDK_INT >= 14 && this.mInputView.isSuggestionsEnabled();
    }

    @TargetApi(11)
    public boolean isTextSelectable() {
        return Build.VERSION.SDK_INT < 11 || this.mInputView.isTextSelectable();
    }

    public int length() {
        return this.mInputView.length();
    }

    public boolean moveCursorToVisibleOffset() {
        return this.mInputView.moveCursorToVisibleOffset();
    }

    public void onCommitCompletion(CompletionInfo text) {
        if (this.mAutoCompleteMode == 0) {
            ((InternalEditText) this.mInputView).superOnCommitCompletion(text);
        } else if (this.mAutoCompleteMode == 1) {
            ((InternalAutoCompleteTextView) this.mInputView).superOnCommitCompletion(text);
        } else {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superOnCommitCompletion(text);
        }
    }

    public void onCommitCorrection(CorrectionInfo info) {
        if (this.mAutoCompleteMode == 0) {
            ((InternalEditText) this.mInputView).superOnCommitCorrection(info);
        } else if (this.mAutoCompleteMode == 1) {
            ((InternalAutoCompleteTextView) this.mInputView).superOnCommitCorrection(info);
        } else {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superOnCommitCorrection(info);
        }
    }

    @Override // android.view.View
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnCreateInputConnection(outAttrs);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnCreateInputConnection(outAttrs);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnCreateInputConnection(outAttrs);
    }

    public void onEditorAction(int actionCode) {
        if (this.mAutoCompleteMode == 0) {
            ((InternalEditText) this.mInputView).superOnEditorAction(actionCode);
        } else if (this.mAutoCompleteMode == 1) {
            ((InternalAutoCompleteTextView) this.mInputView).superOnEditorAction(actionCode);
        } else {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superOnEditorAction(actionCode);
        }
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnKeyDown(keyCode, event);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnKeyDown(keyCode, event);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnKeyDown(keyCode, event);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnKeyMultiple(keyCode, repeatCount, event);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnKeyMultiple(keyCode, repeatCount, event);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnKeyMultiple(keyCode, repeatCount, event);
    }

    @Override // android.view.View
    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnKeyPreIme(keyCode, event);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnKeyPreIme(keyCode, event);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnKeyPreIme(keyCode, event);
    }

    @Override // android.view.View
    public boolean onKeyShortcut(int keyCode, KeyEvent event) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnKeyShortcut(keyCode, event);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnKeyShortcut(keyCode, event);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnKeyShortcut(keyCode, event);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (this.mAutoCompleteMode == 0) {
            return ((InternalEditText) this.mInputView).superOnKeyUp(keyCode, event);
        }
        if (this.mAutoCompleteMode == 1) {
            return ((InternalAutoCompleteTextView) this.mInputView).superOnKeyUp(keyCode, event);
        }
        return ((InternalMultiAutoCompleteTextView) this.mInputView).superOnKeyUp(keyCode, event);
    }

    public void setOnSelectionChangedListener(TextView.OnSelectionChangedListener listener) {
        this.mOnSelectionChangedListener = listener;
    }

    protected void onSelectionChanged(int selStart, int selEnd) {
        if (this.mInputView == null) {
            return;
        }
        if (this.mInputView instanceof InternalEditText) {
            ((InternalEditText) this.mInputView).superOnSelectionChanged(selStart, selEnd);
        } else if (this.mInputView instanceof InternalAutoCompleteTextView) {
            ((InternalAutoCompleteTextView) this.mInputView).superOnSelectionChanged(selStart, selEnd);
        } else {
            ((InternalMultiAutoCompleteTextView) this.mInputView).superOnSelectionChanged(selStart, selEnd);
        }
        if (this.mOnSelectionChangedListener != null) {
            this.mOnSelectionChangedListener.onSelectionChanged(this, selStart, selEnd);
        }
    }

    public void removeTextChangedListener(TextWatcher watcher) {
        this.mInputView.removeTextChangedListener(watcher);
    }

    @TargetApi(14)
    public void setAllCaps(boolean allCaps) {
        if (Build.VERSION.SDK_INT >= 14) {
            this.mInputView.setAllCaps(allCaps);
        }
    }

    public final void setAutoLinkMask(int mask) {
        this.mInputView.setAutoLinkMask(mask);
    }

    public void setCompoundDrawablePadding(int pad) {
        this.mInputView.setCompoundDrawablePadding(pad);
        if (this.mDividerCompoundPadding) {
            this.mDivider.setPadding(this.mInputView.getTotalPaddingLeft(), this.mInputView.getTotalPaddingRight());
            if (this.mLabelEnable) {
                this.mLabelView.setPadding(this.mDivider.getPaddingLeft(), this.mLabelView.getPaddingTop(), this.mDivider.getPaddingRight(), this.mLabelView.getPaddingBottom());
            }
            if (this.mSupportMode != 0) {
                this.mSupportView.setPadding(this.mDivider.getPaddingLeft(), this.mSupportView.getPaddingTop(), this.mDivider.getPaddingRight(), this.mSupportView.getPaddingBottom());
            }
        }
    }

    public void setCompoundDrawables(Drawable left, Drawable top, Drawable right, Drawable bottom) {
        this.mInputView.setCompoundDrawables(left, top, right, bottom);
        if (this.mDividerCompoundPadding) {
            this.mDivider.setPadding(this.mInputView.getTotalPaddingLeft(), this.mInputView.getTotalPaddingRight());
            if (this.mLabelEnable) {
                this.mLabelView.setPadding(this.mDivider.getPaddingLeft(), this.mLabelView.getPaddingTop(), this.mDivider.getPaddingRight(), this.mLabelView.getPaddingBottom());
            }
            if (this.mSupportMode != 0) {
                this.mSupportView.setPadding(this.mDivider.getPaddingLeft(), this.mSupportView.getPaddingTop(), this.mDivider.getPaddingRight(), this.mSupportView.getPaddingBottom());
            }
        }
    }

    @TargetApi(17)
    public void setCompoundDrawablesRelative(Drawable start, Drawable top, Drawable end, Drawable bottom) {
        if (Build.VERSION.SDK_INT >= 17) {
            this.mInputView.setCompoundDrawablesRelative(start, top, end, bottom);
        } else {
            this.mInputView.setCompoundDrawables(start, top, end, bottom);
        }
    }

    @TargetApi(17)
    public void setCompoundDrawablesRelativeWithIntrinsicBounds(Drawable start, Drawable top, Drawable end, Drawable bottom) {
        if (Build.VERSION.SDK_INT >= 17) {
            this.mInputView.setCompoundDrawablesRelativeWithIntrinsicBounds(start, top, end, bottom);
        } else {
            this.mInputView.setCompoundDrawablesWithIntrinsicBounds(start, top, end, bottom);
        }
    }

    @TargetApi(17)
    public void setCompoundDrawablesRelativeWithIntrinsicBounds(int start, int top, int end, int bottom) {
        if (Build.VERSION.SDK_INT >= 17) {
            this.mInputView.setCompoundDrawablesRelativeWithIntrinsicBounds(start, top, end, bottom);
        } else {
            this.mInputView.setCompoundDrawablesWithIntrinsicBounds(start, top, end, bottom);
        }
    }

    public void setCompoundDrawablesWithIntrinsicBounds(Drawable left, Drawable top, Drawable right, Drawable bottom) {
        this.mInputView.setCompoundDrawablesWithIntrinsicBounds(left, top, right, bottom);
    }

    public void setCompoundDrawablesWithIntrinsicBounds(int left, int top, int right, int bottom) {
        this.mInputView.setCompoundDrawablesWithIntrinsicBounds(left, top, right, bottom);
    }

    public void setCursorVisible(boolean visible) {
        this.mInputView.setCursorVisible(visible);
    }

    @TargetApi(11)
    public void setCustomSelectionActionModeCallback(ActionMode.Callback actionModeCallback) {
        if (Build.VERSION.SDK_INT >= 11) {
            this.mInputView.setCustomSelectionActionModeCallback(actionModeCallback);
        }
    }

    public final void setEditableFactory(Editable.Factory factory) {
        this.mInputView.setEditableFactory(factory);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public void setElegantTextHeight(boolean elegant) {
        if (Build.VERSION.SDK_INT >= 21) {
            this.mInputView.setElegantTextHeight(elegant);
        }
    }

    public void setEms(int ems) {
        this.mInputView.setEms(ems);
    }

    public void setExtractedText(ExtractedText text) {
        this.mInputView.setExtractedText(text);
    }

    public void setFilters(InputFilter[] filters) {
        this.mInputView.setFilters(filters);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public void setFontFeatureSettings(String fontFeatureSettings) {
        if (Build.VERSION.SDK_INT >= 21) {
            this.mInputView.setFontFeatureSettings(fontFeatureSettings);
        }
    }

    public void setFreezesText(boolean freezesText) {
        this.mInputView.setFreezesText(freezesText);
    }

    public void setGravity(int gravity) {
        this.mInputView.setGravity(gravity);
    }

    public void setHighlightColor(int color) {
        this.mInputView.setHighlightColor(color);
    }

    public final void setHint(CharSequence hint) {
        this.mInputView.setHint(hint);
        if (this.mLabelView != null) {
            this.mLabelView.setText(hint);
        }
    }

    public final void setHint(int resid) {
        this.mInputView.setHint(resid);
        if (this.mLabelView != null) {
            this.mLabelView.setText(resid);
        }
    }

    public final void setHintTextColor(ColorStateList colors) {
        this.mInputView.setHintTextColor(colors);
    }

    public final void setHintTextColor(int color) {
        this.mInputView.setHintTextColor(color);
    }

    public void setHorizontallyScrolling(boolean whether) {
        this.mInputView.setHorizontallyScrolling(whether);
    }

    public void setImeActionLabel(CharSequence label, int actionId) {
        this.mInputView.setImeActionLabel(label, actionId);
    }

    public void setImeOptions(int imeOptions) {
        this.mInputView.setImeOptions(imeOptions);
    }

    public void setIncludeFontPadding(boolean includepad) {
        this.mInputView.setIncludeFontPadding(includepad);
    }

    public void setInputExtras(int xmlResId) throws XmlPullParserException, IOException {
        this.mInputView.setInputExtras(xmlResId);
    }

    public void setInputType(int type) {
        this.mInputView.setInputType(type);
    }

    public void setKeyListener(KeyListener input) {
        this.mInputView.setKeyListener(input);
    }

    public void setLetterSpacing(float letterSpacing) {
        if (Build.VERSION.SDK_INT >= 21) {
            this.mInputView.setLetterSpacing(letterSpacing);
        }
    }

    public void setLineSpacing(float add, float mult) {
        this.mInputView.setLineSpacing(add, mult);
    }

    public void setLines(int lines) {
        this.mInputView.setLines(lines);
    }

    public final void setLinkTextColor(ColorStateList colors) {
        this.mInputView.setLinkTextColor(colors);
    }

    public final void setLinkTextColor(int color) {
        this.mInputView.setLinkTextColor(color);
    }

    public final void setLinksClickable(boolean whether) {
        this.mInputView.setLinksClickable(whether);
    }

    public void setMarqueeRepeatLimit(int marqueeLimit) {
        this.mInputView.setMarqueeRepeatLimit(marqueeLimit);
    }

    public void setMaxEms(int maxems) {
        this.mInputView.setMaxEms(maxems);
    }

    public void setMaxHeight(int maxHeight) {
        this.mInputView.setMaxHeight(maxHeight);
    }

    public void setMaxLines(int maxlines) {
        this.mInputView.setMaxLines(maxlines);
    }

    public void setMaxWidth(int maxpixels) {
        this.mInputView.setMaxWidth(maxpixels);
    }

    public void setMinEms(int minems) {
        this.mInputView.setMinEms(minems);
    }

    public void setMinHeight(int minHeight) {
        this.mInputView.setMinHeight(minHeight);
    }

    public void setMinLines(int minlines) {
        this.mInputView.setMinLines(minlines);
    }

    public void setMinWidth(int minpixels) {
        this.mInputView.setMinWidth(minpixels);
    }

    public final void setMovementMethod(MovementMethod movement) {
        this.mInputView.setMovementMethod(movement);
    }

    public void setOnEditorActionListener(TextView.OnEditorActionListener l) {
        this.mInputView.setOnEditorActionListener(l);
    }

    @Override // android.view.View
    public void setOnKeyListener(View.OnKeyListener l) {
        this.mInputView.setOnKeyListener(l);
    }

    @Override // android.view.View
    public void setOnFocusChangeListener(View.OnFocusChangeListener l) {
        this.mInputView.setOnFocusChangeListener(l);
    }

    public void setRawInputType(int type) {
        this.mInputView.setRawInputType(type);
    }

    public void setScroller(Scroller s) {
        this.mInputView.setScroller(s);
    }

    public void setSelectAllOnFocus(boolean selectAllOnFocus) {
        this.mInputView.setSelectAllOnFocus(selectAllOnFocus);
    }

    @Override // android.view.View
    public void setSelected(boolean selected) {
        this.mInputView.setSelected(selected);
    }

    public void setShadowLayer(float radius, float dx, float dy, int color) {
        this.mInputView.setShadowLayer(radius, dx, dy, color);
    }

    public final void setShowSoftInputOnFocus(boolean show) {
        this.mInputView.setShowSoftInputOnFocus(show);
    }

    public void setSingleLine() {
        this.mInputView.setSingleLine();
    }

    public final void setSpannableFactory(Spannable.Factory factory) {
        this.mInputView.setSpannableFactory(factory);
    }

    public final void setText(int resid) {
        this.mInputView.setText(resid);
    }

    public final void setText(char[] text, int start, int len) {
        this.mInputView.setText(text, start, len);
    }

    public final void setText(int resid, TextView.BufferType type) {
        this.mInputView.setText(resid, type);
    }

    public final void setText(CharSequence text) {
        this.mInputView.setText(text);
    }

    public void setTextAppearance(Context context, int resid) {
        this.mInputView.setTextAppearance(context, resid);
    }

    public void setTextColor(ColorStateList colors) {
        this.mInputView.setTextColor(colors);
    }

    public void setTextColor(int color) {
        this.mInputView.setTextColor(color);
    }

    @TargetApi(11)
    public void setTextIsSelectable(boolean selectable) {
        if (Build.VERSION.SDK_INT >= 11) {
            this.mInputView.setTextIsSelectable(selectable);
        }
    }

    public final void setTextKeepState(CharSequence text) {
        this.mInputView.setTextKeepState(text);
    }

    public final void setTextKeepState(CharSequence text, TextView.BufferType type) {
        this.mInputView.setTextKeepState(text, type);
    }

    @TargetApi(17)
    public void setTextLocale(Locale locale) {
        if (Build.VERSION.SDK_INT >= 17) {
            this.mInputView.setTextLocale(locale);
        }
    }

    public void setTextScaleX(float size) {
        this.mInputView.setTextScaleX(size);
    }

    public void setTextSize(float size) {
        this.mInputView.setTextSize(size);
    }

    public void setTextSize(int unit, float size) {
        this.mInputView.setTextSize(unit, size);
    }

    public final void setTransformationMethod(TransformationMethod method) {
        this.mInputView.setTransformationMethod(method);
    }

    public void setTypeface(Typeface tf, int style) {
        this.mInputView.setTypeface(tf, style);
    }

    public void setTypeface(Typeface tf) {
        this.mInputView.setTypeface(tf);
    }

    private boolean hasPasswordTransformationMethod() {
        return getTransformationMethod() != null && (getTransformationMethod() instanceof PasswordTransformationMethod);
    }

    public boolean canCut() {
        return !hasPasswordTransformationMethod() && getText().length() > 0 && hasSelection() && getKeyListener() != null;
    }

    public boolean canCopy() {
        return !hasPasswordTransformationMethod() && getText().length() > 0 && hasSelection();
    }

    public boolean canPaste() {
        return getKeyListener() != null && getSelectionStart() >= 0 && getSelectionEnd() >= 0 && ((ClipboardManager) getContext().getSystemService("clipboard")).hasPrimaryClip();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText$InputTextWatcher.class */
    private class InputTextWatcher implements TextWatcher {
        private InputTextWatcher() {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            int count = s.length();
            EditText.this.setLabelVisible(count != 0, true);
            if (EditText.this.mSupportMode == 3) {
                EditText.this.updateCharCounter(count);
            }
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText$LabelView.class */
    private class LabelView extends TextView {
        public LabelView(Context context) {
            super(context);
        }

        @Override // com.rey.material.widget.TextView, android.widget.TextView
        public void setTextAppearance(int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // com.rey.material.widget.TextView, android.widget.TextView
        public void setTextAppearance(Context context, int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.widget.TextView, android.view.View
        protected int[] onCreateDrawableState(int extraSpace) {
            return EditText.this.mInputView.getDrawableState();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText$InternalEditText.class */
    private class InternalEditText extends android.widget.EditText {
        public InternalEditText(Context context) {
            super(context);
        }

        public InternalEditText(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public InternalEditText(Context context, AttributeSet attrs, int defStyleAttr) {
            super(context, attrs, defStyleAttr);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(Context context, int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.view.View
        public void refreshDrawableState() {
            super.refreshDrawableState();
            if (EditText.this.mLabelView != null) {
                EditText.this.mLabelView.refreshDrawableState();
            }
            if (EditText.this.mSupportView != null) {
                EditText.this.mSupportView.refreshDrawableState();
            }
        }

        @Override // android.widget.TextView
        public void onCommitCompletion(CompletionInfo text) {
            EditText.this.onCommitCompletion(text);
        }

        @Override // android.widget.TextView
        public void onCommitCorrection(CorrectionInfo info) {
            EditText.this.onCommitCorrection(info);
        }

        @Override // android.widget.TextView, android.view.View
        public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
            return EditText.this.onCreateInputConnection(outAttrs);
        }

        @Override // android.widget.TextView
        public void onEditorAction(int actionCode) {
            EditText.this.onEditorAction(actionCode);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyDown(int keyCode, KeyEvent event) {
            return EditText.this.onKeyDown(keyCode, event);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return EditText.this.onKeyMultiple(keyCode, repeatCount, event);
        }

        @Override // android.widget.TextView, android.view.View
        public boolean onKeyPreIme(int keyCode, KeyEvent event) {
            return EditText.this.onKeyPreIme(keyCode, event);
        }

        @Override // android.widget.EditText, android.widget.TextView, android.view.View
        public boolean onKeyShortcut(int keyCode, KeyEvent event) {
            return EditText.this.onKeyShortcut(keyCode, event);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyUp(int keyCode, KeyEvent event) {
            return EditText.this.onKeyUp(keyCode, event);
        }

        @Override // android.widget.TextView
        protected void onSelectionChanged(int selStart, int selEnd) {
            EditText.this.onSelectionChanged(selStart, selEnd);
        }

        void superOnCommitCompletion(CompletionInfo text) {
            super.onCommitCompletion(text);
        }

        void superOnCommitCorrection(CorrectionInfo info) {
            if (Build.VERSION.SDK_INT >= 11) {
                super.onCommitCorrection(info);
            }
        }

        InputConnection superOnCreateInputConnection(EditorInfo outAttrs) {
            return super.onCreateInputConnection(outAttrs);
        }

        void superOnEditorAction(int actionCode) {
            super.onEditorAction(actionCode);
        }

        boolean superOnKeyDown(int keyCode, KeyEvent event) {
            return super.onKeyDown(keyCode, event);
        }

        boolean superOnKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return super.onKeyMultiple(keyCode, repeatCount, event);
        }

        boolean superOnKeyPreIme(int keyCode, KeyEvent event) {
            return super.onKeyPreIme(keyCode, event);
        }

        boolean superOnKeyShortcut(int keyCode, KeyEvent event) {
            return super.onKeyShortcut(keyCode, event);
        }

        boolean superOnKeyUp(int keyCode, KeyEvent event) {
            return super.onKeyUp(keyCode, event);
        }

        void superOnSelectionChanged(int selStart, int selEnd) {
            super.onSelectionChanged(selStart, selEnd);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText$InternalAutoCompleteTextView.class */
    private class InternalAutoCompleteTextView extends AutoCompleteTextView {
        public InternalAutoCompleteTextView(Context context) {
            super(context);
        }

        public InternalAutoCompleteTextView(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public InternalAutoCompleteTextView(Context context, AttributeSet attrs, int defStyleAttr) {
            super(context, attrs, defStyleAttr);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(Context context, int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.view.View
        public void refreshDrawableState() {
            super.refreshDrawableState();
            if (EditText.this.mLabelView != null) {
                EditText.this.mLabelView.refreshDrawableState();
            }
            if (EditText.this.mSupportView != null) {
                EditText.this.mSupportView.refreshDrawableState();
            }
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView
        public void onCommitCompletion(CompletionInfo text) {
            EditText.this.onCommitCompletion(text);
        }

        @Override // android.widget.TextView
        public void onCommitCorrection(CorrectionInfo info) {
            EditText.this.onCommitCorrection(info);
        }

        @Override // android.widget.TextView, android.view.View
        public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
            return EditText.this.onCreateInputConnection(outAttrs);
        }

        @Override // android.widget.TextView
        public void onEditorAction(int actionCode) {
            EditText.this.onEditorAction(actionCode);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyDown(int keyCode, KeyEvent event) {
            return EditText.this.onKeyDown(keyCode, event);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return EditText.this.onKeyMultiple(keyCode, repeatCount, event);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
        public boolean onKeyPreIme(int keyCode, KeyEvent event) {
            return EditText.this.onKeyPreIme(keyCode, event);
        }

        @Override // android.widget.EditText, android.widget.TextView, android.view.View
        public boolean onKeyShortcut(int keyCode, KeyEvent event) {
            return EditText.this.onKeyShortcut(keyCode, event);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyUp(int keyCode, KeyEvent event) {
            return EditText.this.onKeyUp(keyCode, event);
        }

        @Override // android.widget.TextView
        protected void onSelectionChanged(int selStart, int selEnd) {
            EditText.this.onSelectionChanged(selStart, selEnd);
        }

        @Override // android.widget.AutoCompleteTextView
        protected CharSequence convertSelectionToString(Object selectedItem) {
            return EditText.this.convertSelectionToString(selectedItem);
        }

        @Override // android.widget.AutoCompleteTextView
        protected void performFiltering(CharSequence text, int keyCode) {
            EditText.this.performFiltering(text, keyCode);
        }

        @Override // android.widget.AutoCompleteTextView
        protected void replaceText(CharSequence text) {
            EditText.this.replaceText(text);
        }

        @Override // android.widget.AutoCompleteTextView
        protected Filter getFilter() {
            return EditText.this.getFilter();
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.Filter.FilterListener
        public void onFilterComplete(int count) {
            EditText.this.onFilterComplete(count);
        }

        void superOnCommitCompletion(CompletionInfo text) {
            super.onCommitCompletion(text);
        }

        void superOnCommitCorrection(CorrectionInfo info) {
            if (Build.VERSION.SDK_INT >= 11) {
                super.onCommitCorrection(info);
            }
        }

        InputConnection superOnCreateInputConnection(EditorInfo outAttrs) {
            return super.onCreateInputConnection(outAttrs);
        }

        void superOnEditorAction(int actionCode) {
            super.onEditorAction(actionCode);
        }

        boolean superOnKeyDown(int keyCode, KeyEvent event) {
            return super.onKeyDown(keyCode, event);
        }

        boolean superOnKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return super.onKeyMultiple(keyCode, repeatCount, event);
        }

        boolean superOnKeyPreIme(int keyCode, KeyEvent event) {
            return super.onKeyPreIme(keyCode, event);
        }

        boolean superOnKeyShortcut(int keyCode, KeyEvent event) {
            return super.onKeyShortcut(keyCode, event);
        }

        boolean superOnKeyUp(int keyCode, KeyEvent event) {
            return super.onKeyUp(keyCode, event);
        }

        void superOnFilterComplete(int count) {
            super.onFilterComplete(count);
        }

        CharSequence superConvertSelectionToString(Object selectedItem) {
            return super.convertSelectionToString(selectedItem);
        }

        void superPerformFiltering(CharSequence text, int keyCode) {
            super.performFiltering(text, keyCode);
        }

        void superReplaceText(CharSequence text) {
            super.replaceText(text);
        }

        Filter superGetFilter() {
            return super.getFilter();
        }

        void superOnSelectionChanged(int selStart, int selEnd) {
            super.onSelectionChanged(selStart, selEnd);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/EditText$InternalMultiAutoCompleteTextView.class */
    private class InternalMultiAutoCompleteTextView extends MultiAutoCompleteTextView {
        public InternalMultiAutoCompleteTextView(Context context) {
            super(context);
        }

        public InternalMultiAutoCompleteTextView(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public InternalMultiAutoCompleteTextView(Context context, AttributeSet attrs, int defStyleAttr) {
            super(context, attrs, defStyleAttr);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.widget.TextView
        public void setTextAppearance(Context context, int resId) {
            ViewUtil.applyTextAppearance(this, resId);
        }

        @Override // android.view.View
        public void refreshDrawableState() {
            super.refreshDrawableState();
            if (EditText.this.mLabelView != null) {
                EditText.this.mLabelView.refreshDrawableState();
            }
            if (EditText.this.mSupportView != null) {
                EditText.this.mSupportView.refreshDrawableState();
            }
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView
        public void onCommitCompletion(CompletionInfo text) {
            EditText.this.onCommitCompletion(text);
        }

        @Override // android.widget.TextView
        public void onCommitCorrection(CorrectionInfo info) {
            EditText.this.onCommitCorrection(info);
        }

        @Override // android.widget.TextView, android.view.View
        public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
            return EditText.this.onCreateInputConnection(outAttrs);
        }

        @Override // android.widget.TextView
        public void onEditorAction(int actionCode) {
            EditText.this.onEditorAction(actionCode);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyDown(int keyCode, KeyEvent event) {
            return EditText.this.onKeyDown(keyCode, event);
        }

        @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return EditText.this.onKeyMultiple(keyCode, repeatCount, event);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
        public boolean onKeyPreIme(int keyCode, KeyEvent event) {
            return EditText.this.onKeyPreIme(keyCode, event);
        }

        @Override // android.widget.EditText, android.widget.TextView, android.view.View
        public boolean onKeyShortcut(int keyCode, KeyEvent event) {
            return EditText.this.onKeyShortcut(keyCode, event);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
        public boolean onKeyUp(int keyCode, KeyEvent event) {
            return EditText.this.onKeyUp(keyCode, event);
        }

        @Override // android.widget.TextView
        protected void onSelectionChanged(int selStart, int selEnd) {
            EditText.this.onSelectionChanged(selStart, selEnd);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.Filter.FilterListener
        public void onFilterComplete(int count) {
            EditText.this.onFilterComplete(count);
        }

        @Override // android.widget.AutoCompleteTextView
        protected CharSequence convertSelectionToString(Object selectedItem) {
            return EditText.this.convertSelectionToString(selectedItem);
        }

        @Override // android.widget.MultiAutoCompleteTextView, android.widget.AutoCompleteTextView
        protected void performFiltering(CharSequence text, int keyCode) {
            EditText.this.performFiltering(text, keyCode);
        }

        @Override // android.widget.MultiAutoCompleteTextView, android.widget.AutoCompleteTextView
        protected void replaceText(CharSequence text) {
            EditText.this.replaceText(text);
        }

        @Override // android.widget.AutoCompleteTextView
        protected Filter getFilter() {
            return EditText.this.getFilter();
        }

        @Override // android.widget.MultiAutoCompleteTextView
        protected void performFiltering(CharSequence text, int start, int end, int keyCode) {
            EditText.this.performFiltering(text, start, end, keyCode);
        }

        void superOnCommitCompletion(CompletionInfo text) {
            super.onCommitCompletion(text);
        }

        void superOnCommitCorrection(CorrectionInfo info) {
            if (Build.VERSION.SDK_INT >= 11) {
                super.onCommitCorrection(info);
            }
        }

        InputConnection superOnCreateInputConnection(EditorInfo outAttrs) {
            return super.onCreateInputConnection(outAttrs);
        }

        void superOnEditorAction(int actionCode) {
            super.onEditorAction(actionCode);
        }

        boolean superOnKeyDown(int keyCode, KeyEvent event) {
            return super.onKeyDown(keyCode, event);
        }

        boolean superOnKeyMultiple(int keyCode, int repeatCount, KeyEvent event) {
            return super.onKeyMultiple(keyCode, repeatCount, event);
        }

        boolean superOnKeyPreIme(int keyCode, KeyEvent event) {
            return super.onKeyPreIme(keyCode, event);
        }

        boolean superOnKeyShortcut(int keyCode, KeyEvent event) {
            return super.onKeyShortcut(keyCode, event);
        }

        boolean superOnKeyUp(int keyCode, KeyEvent event) {
            return super.onKeyUp(keyCode, event);
        }

        void superOnFilterComplete(int count) {
            super.onFilterComplete(count);
        }

        CharSequence superConvertSelectionToString(Object selectedItem) {
            return super.convertSelectionToString(selectedItem);
        }

        void superPerformFiltering(CharSequence text, int keyCode) {
            super.performFiltering(text, keyCode);
        }

        void superReplaceText(CharSequence text) {
            super.replaceText(text);
        }

        Filter superGetFilter() {
            return super.getFilter();
        }

        void superPerformFiltering(CharSequence text, int start, int end, int keyCode) {
            super.performFiltering(text, start, end, keyCode);
        }

        void superOnSelectionChanged(int selStart, int selEnd) {
            super.onSelectionChanged(selStart, selEnd);
        }
    }
}
