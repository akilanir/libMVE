package com.iangclifton.android.floatlabel;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;

/* loaded from: com.iangclifton.android.floatlabel.1.0.1.jar:com/iangclifton/android/floatlabel/FloatLabel.class */
public class FloatLabel extends FrameLayout {
    private static final String SAVE_STATE_KEY_EDIT_TEXT = "saveStateEditText";
    private static final String SAVE_STATE_KEY_LABEL = "saveStateLabel";
    private static final String SAVE_STATE_PARENT = "saveStateParent";
    private static final String SAVE_STATE_TAG = "saveStateTag";
    private EditText mEditText;
    private boolean mInitComplete;
    private TextView mLabel;
    private LabelAnimator mLabelAnimator;
    private boolean mLabelShowing;
    private Bundle mSavedState;

    /* loaded from: com.iangclifton.android.floatlabel.1.0.1.jar:com/iangclifton/android/floatlabel/FloatLabel$LabelAnimator.class */
    public interface LabelAnimator {
        void onDisplayLabel(View view);

        void onHideLabel(View view);
    }

    public FloatLabel(Context context) {
        this(context, null, 0);
    }

    public FloatLabel(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatLabel(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mInitComplete = false;
        this.mLabelAnimator = new DefaultLabelAnimator();
        init(context, attrs, defStyle);
    }

    @Override // android.view.ViewGroup
    public void addView(View child) {
        if (this.mInitComplete) {
            throw new UnsupportedOperationException("You cannot add child views to a FloatLabel");
        }
        super.addView(child);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index) {
        if (this.mInitComplete) {
            throw new UnsupportedOperationException("You cannot add child views to a FloatLabel");
        }
        super.addView(child, index);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        if (this.mInitComplete) {
            throw new UnsupportedOperationException("You cannot add child views to a FloatLabel");
        }
        super.addView(child, index, params);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int width, int height) {
        if (this.mInitComplete) {
            throw new UnsupportedOperationException("You cannot add child views to a FloatLabel");
        }
        super.addView(child, width, height);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void addView(View child, ViewGroup.LayoutParams params) {
        if (this.mInitComplete) {
            throw new UnsupportedOperationException("You cannot add child views to a FloatLabel");
        }
        super.addView(child, params);
    }

    public EditText getEditText() {
        return this.mEditText;
    }

    public void setLabel(int resid) {
        setLabel(getContext().getString(resid));
    }

    public void setLabel(CharSequence hint) {
        this.mEditText.setHint(hint);
        this.mLabel.setText(hint);
    }

    public void setLabelAnimator(LabelAnimator labelAnimator) {
        if (labelAnimator == null) {
            this.mLabelAnimator = new DefaultLabelAnimator();
        } else {
            this.mLabelAnimator = labelAnimator;
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int childLeft = getPaddingLeft();
        int childRight = (right - left) - getPaddingRight();
        int childTop = getPaddingTop();
        int childBottom = (bottom - top) - getPaddingBottom();
        layoutChild(this.mLabel, childLeft, childTop, childRight, childBottom);
        layoutChild(this.mEditText, childLeft, childTop + this.mLabel.getMeasuredHeight(), childRight, childBottom);
    }

    @TargetApi(17)
    private void layoutChild(View child, int parentLeft, int parentTop, int parentRight, int parentBottom) {
        int layoutDirection;
        int childLeft;
        if (child.getVisibility() != 8) {
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) child.getLayoutParams();
            int width = child.getMeasuredWidth();
            int height = child.getMeasuredHeight();
            int childTop = parentTop + lp.topMargin;
            int gravity = lp.gravity;
            if (gravity == -1) {
                gravity = 8388659;
            }
            if (Build.VERSION.SDK_INT < 17) {
                layoutDirection = 0;
            } else {
                layoutDirection = getLayoutDirection();
            }
            int absoluteGravity = Gravity.getAbsoluteGravity(gravity, layoutDirection);
            switch (absoluteGravity & 7) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    childLeft = ((parentLeft + (((parentRight - parentLeft) - width) / 2)) + lp.leftMargin) - lp.rightMargin;
                    break;
                case 2:
                case 3:
                case 4:
                default:
                    childLeft = parentLeft + lp.leftMargin;
                    break;
                case 5:
                    childLeft = (parentRight - width) - lp.rightMargin;
                    break;
            }
            child.layout(childLeft, childTop, childLeft + width, childTop + height);
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.mSavedState != null) {
            Parcelable childState = this.mSavedState.getParcelable(SAVE_STATE_KEY_EDIT_TEXT);
            this.mEditText.onRestoreInstanceState(childState);
            Parcelable childState2 = this.mSavedState.getParcelable(SAVE_STATE_KEY_LABEL);
            this.mLabel.onRestoreInstanceState(childState2);
            this.mSavedState = null;
        }
        measureChild(this.mEditText, widthMeasureSpec, heightMeasureSpec);
        measureChild(this.mLabel, widthMeasureSpec, heightMeasureSpec);
        setMeasuredDimension(measureWidth(widthMeasureSpec), measureHeight(heightMeasureSpec));
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        if (state instanceof Bundle) {
            Bundle savedState = (Bundle) state;
            if (savedState.getBoolean(SAVE_STATE_TAG, false)) {
                this.mSavedState = savedState;
                super.onRestoreInstanceState(savedState.getParcelable(SAVE_STATE_PARENT));
                return;
            }
        }
        super.onRestoreInstanceState(state);
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        Bundle saveState = new Bundle();
        saveState.putParcelable(SAVE_STATE_KEY_EDIT_TEXT, this.mEditText.onSaveInstanceState());
        saveState.putParcelable(SAVE_STATE_KEY_LABEL, this.mLabel.onSaveInstanceState());
        saveState.putBoolean(SAVE_STATE_TAG, true);
        saveState.putParcelable(SAVE_STATE_PARENT, superState);
        return saveState;
    }

    private int measureHeight(int heightMeasureSpec) {
        int result;
        int specMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int specSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (specMode == 1073741824) {
            result = specSize;
        } else {
            result = Math.max(this.mEditText.getMeasuredHeight() + this.mLabel.getMeasuredHeight() + getPaddingTop() + getPaddingBottom(), getSuggestedMinimumHeight());
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return result;
    }

    private int measureWidth(int widthMeasureSpec) {
        int result;
        int specMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int specSize = View.MeasureSpec.getSize(widthMeasureSpec);
        if (specMode == 1073741824) {
            result = specSize;
        } else {
            result = Math.max(Math.max(this.mEditText.getMeasuredWidth(), this.mLabel.getMeasuredWidth()), getSuggestedMinimumWidth()) + getPaddingLeft() + getPaddingRight();
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return result;
    }

    private void init(Context context, AttributeSet attrs, int defStyle) {
        int layout;
        CharSequence text;
        CharSequence hint;
        ColorStateList hintColor;
        int floatLabelColor;
        int inputType;
        if (attrs == null) {
            layout = R.layout.float_label;
            text = null;
            hint = null;
            hintColor = null;
            floatLabelColor = 0;
            inputType = 0;
        } else {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FloatLabel, defStyle, 0);
            layout = a.getResourceId(1, R.layout.float_label);
            text = a.getText(2);
            hint = a.getText(3);
            hintColor = a.getColorStateList(0);
            floatLabelColor = a.getColor(5, 0);
            inputType = a.getInt(4, 1);
            a.recycle();
        }
        inflate(context, layout, this);
        this.mEditText = (EditText) findViewById(R.id.edit_text);
        if (this.mEditText == null) {
            throw new RuntimeException("Your layout must have an EditText whose ID is @id/edit_text");
        }
        this.mEditText.setHint(hint);
        this.mEditText.setText(text);
        if (hintColor != null) {
            this.mEditText.setHintTextColor(hintColor);
        }
        if (inputType != 0) {
            this.mEditText.setInputType(inputType);
        }
        this.mLabel = (TextView) findViewById(R.id.float_label);
        if (this.mLabel == null) {
            throw new RuntimeException("Your layout must have a TextView whose ID is @id/float_label");
        }
        this.mLabel.setText(this.mEditText.getHint());
        if (floatLabelColor != 0) {
            this.mLabel.setTextColor(floatLabelColor);
        }
        this.mEditText.addTextChangedListener(new EditTextWatcher());
        if (this.mEditText.getText().length() == 0) {
            this.mLabel.setAlpha(0.0f);
            this.mLabelShowing = false;
        } else {
            this.mLabel.setVisibility(0);
            this.mLabelShowing = true;
        }
        this.mInitComplete = true;
    }

    /* loaded from: com.iangclifton.android.floatlabel.1.0.1.jar:com/iangclifton/android/floatlabel/FloatLabel$DefaultLabelAnimator.class */
    private static class DefaultLabelAnimator implements LabelAnimator {
        private DefaultLabelAnimator() {
        }

        @Override // com.iangclifton.android.floatlabel.FloatLabel.LabelAnimator
        public void onDisplayLabel(View label) {
            float offset = label.getHeight() / 2;
            float currentY = label.getY();
            if (currentY != offset) {
                label.setY(offset);
            }
            label.animate().alpha(1.0f).y(0.0f);
        }

        @Override // com.iangclifton.android.floatlabel.FloatLabel.LabelAnimator
        public void onHideLabel(View label) {
            float offset = label.getHeight() / 2;
            float currentY = label.getY();
            if (currentY != 0.0f) {
                label.setY(0.0f);
            }
            label.animate().alpha(0.0f).y(offset);
        }
    }

    /* loaded from: com.iangclifton.android.floatlabel.1.0.1.jar:com/iangclifton/android/floatlabel/FloatLabel$EditTextWatcher.class */
    private class EditTextWatcher implements TextWatcher {
        private EditTextWatcher() {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            if (s.length() == 0) {
                if (FloatLabel.this.mLabelShowing) {
                    FloatLabel.this.mLabelAnimator.onHideLabel(FloatLabel.this.mLabel);
                    FloatLabel.this.mLabelShowing = false;
                    return;
                }
                return;
            }
            if (!FloatLabel.this.mLabelShowing) {
                FloatLabel.this.mLabelShowing = true;
                FloatLabel.this.mLabelAnimator.onDisplayLabel(FloatLabel.this.mLabel);
            }
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }
    }
}
