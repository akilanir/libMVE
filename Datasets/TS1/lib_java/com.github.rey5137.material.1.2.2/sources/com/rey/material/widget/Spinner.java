package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.SpinnerAdapter;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.ArrowDrawable;
import com.rey.material.drawable.DividerDrawable;
import com.rey.material.util.ThemeUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner.class */
public class Spinner extends FrameLayout implements ThemeManager.OnThemeChangedListener {
    private static final int MAX_ITEMS_MEASURED = 15;
    private static final int INVALID_POSITION = -1;
    private boolean mLabelEnable;
    private TextView mLabelView;
    private SpinnerAdapter mAdapter;
    private OnItemClickListener mOnItemClickListener;
    private OnItemSelectedListener mOnItemSelectedListener;
    private int mMinWidth;
    private int mMinHeight;
    private DropdownPopup mPopup;
    private int mDropDownWidth;
    private ArrowDrawable mArrowDrawable;
    private int mArrowSize;
    private int mArrowPadding;
    private boolean mArrowAnimSwitchMode;
    private DividerDrawable mDividerDrawable;
    private int mDividerHeight;
    private int mDividerPadding;
    private int mGravity;
    private boolean mDisableChildrenWhenDisabled;
    private int mSelectedPosition;
    private RecycleBin mRecycler;
    private Rect mTempRect;
    private DropDownAdapter mTempAdapter;
    private SpinnerDataSetObserver mDataSetObserver;
    private boolean mIsRtl;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$OnItemClickListener.class */
    public interface OnItemClickListener {
        boolean onItemClick(Spinner spinner, View view, int i, long j);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$OnItemSelectedListener.class */
    public interface OnItemSelectedListener {
        void onItemSelected(Spinner spinner, View view, int i, long j);
    }

    public Spinner(Context context) {
        super(context, null, R.attr.listPopupWindowStyle);
        this.mRecycler = new RecycleBin();
        this.mTempRect = new Rect();
        this.mDataSetObserver = new SpinnerDataSetObserver();
    }

    public Spinner(Context context, AttributeSet attrs) {
        super(context, attrs, R.attr.listPopupWindowStyle);
        this.mRecycler = new RecycleBin();
        this.mTempRect = new Rect();
        this.mDataSetObserver = new SpinnerDataSetObserver();
    }

    public Spinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mRecycler = new RecycleBin();
        this.mTempRect = new Rect();
        this.mDataSetObserver = new SpinnerDataSetObserver();
    }

    public Spinner(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mRecycler = new RecycleBin();
        this.mTempRect = new Rect();
        this.mDataSetObserver = new SpinnerDataSetObserver();
    }

    @Override // com.rey.material.widget.FrameLayout
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mLabelEnable = false;
        this.mDropDownWidth = -2;
        this.mArrowAnimSwitchMode = false;
        this.mGravity = 17;
        this.mDisableChildrenWhenDisabled = false;
        this.mSelectedPosition = -1;
        this.mIsRtl = false;
        setWillNotDraw(false);
        this.mPopup = new DropdownPopup(context, attrs, defStyleAttr, defStyleRes);
        this.mPopup.setModal(true);
        if (isInEditMode()) {
            applyStyle(R.style.Material_Widget_Spinner);
        }
        setOnClickListener(new View.OnClickListener() { // from class: com.rey.material.widget.Spinner.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Spinner.this.showPopup();
            }
        });
        super.init(context, attrs, defStyleAttr, defStyleRes);
    }

    private android.widget.TextView getLabelView() {
        if (this.mLabelView == null) {
            this.mLabelView = new TextView(getContext());
            if (Build.VERSION.SDK_INT >= 17) {
                this.mLabelView.setTextDirection(this.mIsRtl ? 4 : 3);
            }
            this.mLabelView.setSingleLine(true);
            this.mLabelView.setDuplicateParentStateEnabled(true);
        }
        return this.mLabelView;
    }

    /* JADX WARN: Type inference failed for: r0v65, types: [int[], int[][]] */
    @Override // com.rey.material.widget.FrameLayout
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        removeAllViews();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.Spinner, defStyleAttr, defStyleRes);
        int arrowAnimDuration = -1;
        ColorStateList arrowColor = null;
        Interpolator arrowInterpolator = null;
        boolean arrowClockwise = true;
        int dividerAnimDuration = -1;
        ColorStateList dividerColor = null;
        ColorStateList labelTextColor = null;
        int labelTextSize = -1;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.Spinner_spn_labelEnable) {
                this.mLabelEnable = a.getBoolean(attr, false);
            } else if (attr == R.styleable.Spinner_spn_labelPadding) {
                getLabelView().setPadding(0, 0, 0, a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.Spinner_spn_labelTextSize) {
                labelTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_labelTextColor) {
                labelTextColor = a.getColorStateList(attr);
            } else if (attr == R.styleable.Spinner_spn_labelTextAppearance) {
                getLabelView().setTextAppearance(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.Spinner_spn_labelEllipsize) {
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
            } else if (attr == R.styleable.Spinner_spn_label) {
                getLabelView().setText(a.getString(attr));
            } else if (attr == R.styleable.Spinner_android_gravity) {
                this.mGravity = a.getInt(attr, 0);
            } else if (attr == R.styleable.Spinner_android_minWidth) {
                setMinimumWidth(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Spinner_android_minHeight) {
                setMinimumHeight(a.getDimensionPixelOffset(attr, 0));
            } else if (attr == R.styleable.Spinner_android_dropDownWidth) {
                this.mDropDownWidth = a.getLayoutDimension(attr, -2);
            } else if (attr == R.styleable.Spinner_android_popupBackground) {
                this.mPopup.setBackgroundDrawable(a.getDrawable(attr));
            } else if (attr == R.styleable.Spinner_android_prompt) {
                this.mPopup.setPromptText(a.getString(attr));
            } else if (attr == R.styleable.Spinner_spn_popupItemAnimation) {
                this.mPopup.setItemAnimation(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.Spinner_spn_popupItemAnimOffset) {
                this.mPopup.setItemAnimationOffset(a.getInteger(attr, 0));
            } else if (attr == R.styleable.Spinner_spn_disableChildrenWhenDisabled) {
                this.mDisableChildrenWhenDisabled = a.getBoolean(attr, false);
            } else if (attr == R.styleable.Spinner_spn_arrowSwitchMode) {
                this.mArrowAnimSwitchMode = a.getBoolean(attr, false);
            } else if (attr == R.styleable.Spinner_spn_arrowAnimDuration) {
                arrowAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_arrowSize) {
                this.mArrowSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_arrowPadding) {
                this.mArrowPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_arrowColor) {
                arrowColor = a.getColorStateList(attr);
            } else if (attr == R.styleable.Spinner_spn_arrowInterpolator) {
                int resId = a.getResourceId(attr, 0);
                arrowInterpolator = AnimationUtils.loadInterpolator(context, resId);
            } else if (attr == R.styleable.Spinner_spn_arrowAnimClockwise) {
                arrowClockwise = a.getBoolean(attr, true);
            } else if (attr == R.styleable.Spinner_spn_dividerHeight) {
                this.mDividerHeight = a.getDimensionPixelOffset(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_dividerPadding) {
                this.mDividerPadding = a.getDimensionPixelOffset(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_dividerAnimDuration) {
                dividerAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.Spinner_spn_dividerColor) {
                dividerColor = a.getColorStateList(attr);
            }
        }
        a.recycle();
        if (labelTextColor != null) {
            getLabelView().setTextColor(labelTextColor);
        }
        if (labelTextSize >= 0) {
            getLabelView().setTextSize(0, labelTextSize);
        }
        if (this.mLabelEnable) {
            addView(getLabelView(), 0, new ViewGroup.LayoutParams(-2, -2));
        }
        if (this.mArrowSize > 0) {
            if (this.mArrowDrawable == null) {
                if (arrowColor == null) {
                    arrowColor = ColorStateList.valueOf(ThemeUtil.colorControlNormal(context, -16777216));
                }
                if (arrowAnimDuration < 0) {
                    arrowAnimDuration = 0;
                }
                this.mArrowDrawable = new ArrowDrawable(ArrowDrawable.MODE_DOWN, this.mArrowSize, arrowColor, arrowAnimDuration, arrowInterpolator, arrowClockwise);
                this.mArrowDrawable.setCallback(this);
            } else {
                this.mArrowDrawable.setArrowSize(this.mArrowSize);
                this.mArrowDrawable.setClockwise(arrowClockwise);
                if (arrowColor != null) {
                    this.mArrowDrawable.setColor(arrowColor);
                }
                if (arrowAnimDuration >= 0) {
                    this.mArrowDrawable.setAnimationDuration(arrowAnimDuration);
                }
                if (arrowInterpolator != null) {
                    this.mArrowDrawable.setInterpolator(arrowInterpolator);
                }
            }
        } else if (this.mArrowDrawable != null) {
            this.mArrowDrawable.setCallback(null);
            this.mArrowDrawable = null;
        }
        if (this.mDividerHeight > 0) {
            if (this.mDividerDrawable == null) {
                if (dividerAnimDuration < 0) {
                    dividerAnimDuration = 0;
                }
                if (dividerColor == null) {
                    ?? r0 = {new int[]{-16842919}, new int[]{android.R.attr.state_pressed, android.R.attr.state_enabled}};
                    int[] colors = {ThemeUtil.colorControlNormal(context, -16777216), ThemeUtil.colorControlActivated(context, -16777216)};
                    dividerColor = new ColorStateList(r0, colors);
                }
                this.mDividerDrawable = new DividerDrawable(this.mDividerHeight, dividerColor, dividerAnimDuration);
                this.mDividerDrawable.setCallback(this);
            } else {
                this.mDividerDrawable.setDividerHeight(this.mDividerHeight);
                if (dividerColor != null) {
                    this.mDividerDrawable.setColor(dividerColor);
                }
                if (dividerAnimDuration >= 0) {
                    this.mDividerDrawable.setAnimationDuration(dividerAnimDuration);
                }
            }
        } else if (this.mDividerDrawable != null) {
            this.mDividerDrawable.setCallback(null);
            this.mDividerDrawable = null;
        }
        if (this.mTempAdapter != null) {
            this.mPopup.setAdapter(this.mTempAdapter);
            this.mTempAdapter = null;
        }
        if (this.mAdapter != null) {
            setAdapter(this.mAdapter);
        }
        if (isInEditMode()) {
            TextView tv = new TextView(context, attrs, defStyleAttr);
            tv.setText("Item 1");
            super.addView(tv);
        }
        requestLayout();
    }

    @Override // android.view.View
    @TargetApi(17)
    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            if (this.mLabelView != null && Build.VERSION.SDK_INT >= 17) {
                this.mLabelView.setTextDirection(this.mIsRtl ? 4 : 3);
            }
            requestLayout();
        }
    }

    public View getSelectedView() {
        View v = getChildAt(getChildCount() - 1);
        if (v == this.mLabelView) {
            return null;
        }
        return v;
    }

    public void setSelection(int position) {
        if (this.mAdapter != null) {
            position = Math.max(0, Math.min(position, this.mAdapter.getCount() - 1));
        }
        if (this.mSelectedPosition != position) {
            this.mSelectedPosition = position;
            if (this.mOnItemSelectedListener != null) {
                this.mOnItemSelectedListener.onItemSelected(this, getSelectedView(), position, this.mAdapter == null ? -1L : this.mAdapter.getItemId(position));
            }
            onDataInvalidated();
        }
    }

    public int getSelectedItemPosition() {
        return this.mSelectedPosition;
    }

    public Object getSelectedItem() {
        if (this.mAdapter == null) {
            return null;
        }
        return this.mAdapter.getItem(this.mSelectedPosition);
    }

    public SpinnerAdapter getAdapter() {
        return this.mAdapter;
    }

    public void setAdapter(SpinnerAdapter adapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
        }
        this.mRecycler.clear();
        this.mAdapter = adapter;
        this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
        onDataChanged();
        if (this.mPopup != null) {
            this.mPopup.setAdapter(new DropDownAdapter(adapter));
        } else {
            this.mTempAdapter = new DropDownAdapter(adapter);
        }
    }

    public void setPopupBackgroundDrawable(Drawable background) {
        this.mPopup.setBackgroundDrawable(background);
    }

    public void setPopupBackgroundResource(int resId) {
        setPopupBackgroundDrawable(getContext().getDrawable(resId));
    }

    public Drawable getPopupBackground() {
        return this.mPopup.getBackground();
    }

    public void setDropDownVerticalOffset(int pixels) {
        this.mPopup.setVerticalOffset(pixels);
    }

    public int getDropDownVerticalOffset() {
        return this.mPopup.getVerticalOffset();
    }

    public void setDropDownHorizontalOffset(int pixels) {
        this.mPopup.setHorizontalOffset(pixels);
    }

    public int getDropDownHorizontalOffset() {
        return this.mPopup.getHorizontalOffset();
    }

    public void setDropDownWidth(int pixels) {
        this.mDropDownWidth = pixels;
    }

    public int getDropDownWidth() {
        return this.mDropDownWidth;
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        if (this.mDisableChildrenWhenDisabled) {
            int count = getChildCount();
            for (int i = 0; i < count; i++) {
                getChildAt(i).setEnabled(enabled);
            }
        }
    }

    @Override // android.view.View
    public void setMinimumHeight(int minHeight) {
        this.mMinHeight = minHeight;
        super.setMinimumHeight(minHeight);
    }

    @Override // android.view.View
    public void setMinimumWidth(int minWidth) {
        this.mMinWidth = minWidth;
        super.setMinimumWidth(minWidth);
    }

    public void setGravity(int gravity) {
        if (this.mGravity != gravity) {
            if ((gravity & 7) == 0) {
                gravity |= 8388611;
            }
            this.mGravity = gravity;
            requestLayout();
        }
    }

    @Override // android.view.View
    public int getBaseline() {
        int childBaseline;
        View child = getSelectedView();
        if (child == null || (childBaseline = child.getBaseline()) < 0) {
            return -1;
        }
        return child.getTop() + childBaseline;
    }

    @Override // com.rey.material.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mPopup != null && this.mPopup.isShowing()) {
            this.mPopup.dismiss();
        }
    }

    public void setOnItemClickListener(OnItemClickListener l) {
        this.mOnItemClickListener = l;
    }

    public void setOnItemSelectedListener(OnItemSelectedListener l) {
        this.mOnItemSelectedListener = l;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        return true;
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || this.mArrowDrawable == who || this.mDividerDrawable == who;
    }

    private int getArrowDrawableWidth() {
        if (this.mArrowDrawable != null) {
            return this.mArrowSize + (this.mArrowPadding * 2);
        }
        return 0;
    }

    private int getDividerDrawableHeight() {
        if (this.mDividerHeight > 0) {
            return this.mDividerHeight + this.mDividerPadding;
        }
        return 0;
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int viewWidth;
        int viewHeight;
        int ws;
        int hs;
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        int paddingHorizontal = getPaddingLeft() + getPaddingRight() + getArrowDrawableWidth();
        int paddingVertical = getPaddingTop() + getPaddingBottom() + getDividerDrawableHeight();
        int labelWidth = 0;
        int labelHeight = 0;
        if (this.mLabelView != null && this.mLabelView.getLayoutParams() != null) {
            this.mLabelView.measure(View.MeasureSpec.makeMeasureSpec(widthSize - paddingHorizontal, widthMode), View.MeasureSpec.makeMeasureSpec(0, 0));
            labelWidth = this.mLabelView.getMeasuredWidth();
            labelHeight = this.mLabelView.getMeasuredHeight();
        }
        int width = 0;
        int height = 0;
        View v = getSelectedView();
        if (v != null) {
            ViewGroup.LayoutParams params = v.getLayoutParams();
            switch (params.width) {
                case -2:
                    ws = View.MeasureSpec.makeMeasureSpec(0, 0);
                    break;
                case -1:
                    ws = View.MeasureSpec.makeMeasureSpec(widthSize - paddingHorizontal, widthMode);
                    break;
                default:
                    ws = View.MeasureSpec.makeMeasureSpec(params.width, 1073741824);
                    break;
            }
            switch (params.height) {
                case -2:
                    hs = View.MeasureSpec.makeMeasureSpec(0, 0);
                    break;
                case -1:
                    hs = View.MeasureSpec.makeMeasureSpec((heightSize - paddingVertical) - labelHeight, heightMode);
                    break;
                default:
                    hs = View.MeasureSpec.makeMeasureSpec(params.height, 1073741824);
                    break;
            }
            v.measure(ws, hs);
            width = v.getMeasuredWidth();
            height = v.getMeasuredHeight();
        }
        int width2 = Math.max(this.mMinWidth, Math.max(labelWidth, width) + paddingHorizontal);
        int height2 = Math.max(this.mMinHeight, height + labelHeight + paddingVertical);
        switch (widthMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                width2 = Math.min(widthSize, width2);
                break;
            case 1073741824:
                width2 = widthSize;
                break;
        }
        switch (heightMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                height2 = Math.min(heightSize, height2);
                break;
            case 1073741824:
                height2 = heightSize;
                break;
        }
        setMeasuredDimension(width2, height2);
        if (v != null) {
            ViewGroup.LayoutParams params2 = v.getLayoutParams();
            switch (params2.width) {
                case -2:
                    viewWidth = v.getMeasuredWidth();
                    break;
                case -1:
                    viewWidth = width2 - paddingHorizontal;
                    break;
                default:
                    viewWidth = params2.width;
                    break;
            }
            switch (params2.height) {
                case -2:
                    viewHeight = v.getMeasuredHeight();
                    break;
                case -1:
                    viewHeight = (height2 - labelHeight) - paddingVertical;
                    break;
                default:
                    viewHeight = params2.height;
                    break;
            }
            if (v.getMeasuredWidth() != viewWidth || v.getMeasuredHeight() != viewHeight) {
                v.measure(View.MeasureSpec.makeMeasureSpec(viewWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(viewHeight, 1073741824));
            }
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int x;
        int y;
        int w = r - l;
        int h = b - t;
        int arrowWidth = getArrowDrawableWidth();
        if (this.mArrowDrawable != null) {
            int top = getPaddingTop() + (this.mLabelView == null ? 0 : this.mLabelView.getMeasuredHeight());
            int bottom = (h - getDividerDrawableHeight()) - getPaddingBottom();
            if (this.mIsRtl) {
                this.mArrowDrawable.setBounds(getPaddingLeft(), top, getPaddingLeft() + arrowWidth, bottom);
            } else {
                this.mArrowDrawable.setBounds((getWidth() - getPaddingRight()) - arrowWidth, top, getWidth() - getPaddingRight(), bottom);
            }
        }
        if (this.mDividerDrawable != null) {
            this.mDividerDrawable.setBounds(getPaddingLeft(), (h - this.mDividerHeight) - getPaddingBottom(), w - getPaddingRight(), h - getPaddingBottom());
        }
        int childLeft = this.mIsRtl ? getPaddingLeft() + arrowWidth : getPaddingLeft();
        int childRight = this.mIsRtl ? w - getPaddingRight() : (w - getPaddingRight()) - arrowWidth;
        int childTop = getPaddingTop();
        int childBottom = h - getPaddingBottom();
        if (this.mLabelView != null) {
            if (this.mIsRtl) {
                this.mLabelView.layout(childRight - this.mLabelView.getMeasuredWidth(), childTop, childRight, childTop + this.mLabelView.getMeasuredHeight());
            } else {
                this.mLabelView.layout(childLeft, childTop, childLeft + this.mLabelView.getMeasuredWidth(), childTop + this.mLabelView.getMeasuredHeight());
            }
            childTop += this.mLabelView.getMeasuredHeight();
        }
        View v = getSelectedView();
        if (v != null) {
            int horizontalGravity = this.mGravity & 7;
            if (horizontalGravity == 8388611) {
                horizontalGravity = this.mIsRtl ? 5 : 3;
            } else if (horizontalGravity == 8388613) {
                horizontalGravity = this.mIsRtl ? 3 : 5;
            }
            switch (horizontalGravity) {
                case 1:
                    x = (((childRight - childLeft) - v.getMeasuredWidth()) / 2) + childLeft;
                    break;
                case 2:
                case 4:
                default:
                    x = (((childRight - childLeft) - v.getMeasuredWidth()) / 2) + childLeft;
                    break;
                case 3:
                    x = childLeft;
                    break;
                case 5:
                    x = childRight - v.getMeasuredWidth();
                    break;
            }
            int verticalGravity = this.mGravity & 112;
            switch (verticalGravity) {
                case 16:
                    y = (((childBottom - childTop) - v.getMeasuredHeight()) / 2) + childTop;
                    break;
                case 48:
                    y = childTop;
                    break;
                case 80:
                    y = childBottom - v.getMeasuredHeight();
                    break;
                default:
                    y = (((childBottom - childTop) - v.getMeasuredHeight()) / 2) + childTop;
                    break;
            }
            v.layout(x, y, x + v.getMeasuredWidth(), y + v.getMeasuredHeight());
        }
    }

    @Override // android.view.View
    public void draw(@NonNull Canvas canvas) {
        super.draw(canvas);
        if (this.mDividerDrawable != null) {
            this.mDividerDrawable.draw(canvas);
        }
        if (this.mArrowDrawable != null) {
            this.mArrowDrawable.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mArrowDrawable != null) {
            this.mArrowDrawable.setState(getDrawableState());
        }
        if (this.mDividerDrawable != null) {
            this.mDividerDrawable.setState(getDrawableState());
        }
    }

    public boolean performItemClick(View view, int position, long id) {
        if (this.mOnItemClickListener != null) {
            if (this.mOnItemClickListener.onItemClick(this, view, position, id)) {
                setSelection(position);
                return true;
            }
            return true;
        }
        setSelection(position);
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataChanged() {
        if (this.mSelectedPosition == -1) {
            setSelection(0);
        } else if (this.mSelectedPosition < this.mAdapter.getCount()) {
            onDataInvalidated();
        } else {
            setSelection(this.mAdapter.getCount() - 1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataInvalidated() {
        if (this.mAdapter == null) {
            return;
        }
        if (this.mLabelView == null) {
            removeAllViews();
        } else {
            for (int i = getChildCount() - 1; i > 0; i--) {
                removeViewAt(i);
            }
        }
        int type = this.mAdapter.getItemViewType(this.mSelectedPosition);
        View v = this.mAdapter.getView(this.mSelectedPosition, this.mRecycler.get(type), this);
        v.setFocusable(false);
        v.setClickable(false);
        if (v.getParent() != null) {
            ((ViewGroup) v.getParent()).removeView(v);
        }
        super.addView(v);
        this.mRecycler.put(type, v);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showPopup() {
        if (!this.mPopup.isShowing()) {
            this.mPopup.show();
            final ListView lv = this.mPopup.getListView();
            if (lv != null) {
                if (Build.VERSION.SDK_INT >= 11) {
                    lv.setChoiceMode(1);
                }
                lv.setSelection(getSelectedItemPosition());
                if (this.mArrowDrawable != null && this.mArrowAnimSwitchMode) {
                    lv.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.rey.material.widget.Spinner.2
                        @Override // android.view.ViewTreeObserver.OnPreDrawListener
                        public boolean onPreDraw() {
                            lv.getViewTreeObserver().removeOnPreDrawListener(this);
                            Spinner.this.mArrowDrawable.setMode(ArrowDrawable.MODE_UP, true);
                            return true;
                        }
                    });
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onPopupDismissed() {
        if (this.mArrowDrawable != null) {
            this.mArrowDrawable.setMode(ArrowDrawable.MODE_DOWN, true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int measureContentWidth(SpinnerAdapter adapter, Drawable background) {
        if (adapter == null) {
            return 0;
        }
        int width = 0;
        View itemView = null;
        int itemType = 0;
        int widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int start = Math.max(0, getSelectedItemPosition());
        int end = Math.min(adapter.getCount(), start + MAX_ITEMS_MEASURED);
        int count = end - start;
        for (int i = Math.max(0, start - (MAX_ITEMS_MEASURED - count)); i < end; i++) {
            int positionType = adapter.getItemViewType(i);
            if (positionType != itemType) {
                itemType = positionType;
                itemView = null;
            }
            itemView = adapter.getView(i, itemView, null);
            if (itemView.getLayoutParams() == null) {
                itemView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
            }
            itemView.measure(widthMeasureSpec, heightMeasureSpec);
            width = Math.max(width, itemView.getMeasuredWidth());
        }
        if (background != null) {
            background.getPadding(this.mTempRect);
            width += this.mTempRect.left + this.mTempRect.right;
        }
        return width;
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int position;
        boolean showDropdown;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.rey.material.widget.Spinner.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState(Parcelable superState) {
            super(superState);
        }

        SavedState(Parcel in) {
            super(in);
            this.position = in.readInt();
            this.showDropdown = in.readByte() != 0;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.position);
            out.writeByte((byte) (this.showDropdown ? 1 : 0));
        }

        public String toString() {
            return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + " showDropdown=" + this.showDropdown + "}";
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.position = getSelectedItemPosition();
        ss.showDropdown = this.mPopup != null && this.mPopup.isShowing();
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        ViewTreeObserver vto;
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        setSelection(ss.position);
        if (ss.showDropdown && (vto = getViewTreeObserver()) != null) {
            ViewTreeObserver.OnGlobalLayoutListener listener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.rey.material.widget.Spinner.3
                @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                public void onGlobalLayout() {
                    Spinner.this.showPopup();
                    ViewTreeObserver vto2 = Spinner.this.getViewTreeObserver();
                    if (vto2 != null) {
                        vto2.removeGlobalOnLayoutListener(this);
                    }
                }
            };
            vto.addOnGlobalLayoutListener(listener);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$SpinnerDataSetObserver.class */
    private class SpinnerDataSetObserver extends DataSetObserver {
        private SpinnerDataSetObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            Spinner.this.onDataChanged();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            Spinner.this.onDataInvalidated();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$RecycleBin.class */
    private class RecycleBin {
        private final SparseArray<View> mScrapHeap;

        private RecycleBin() {
            this.mScrapHeap = new SparseArray<>();
        }

        public void put(int type, View v) {
            this.mScrapHeap.put(type, v);
        }

        View get(int type) {
            View result = this.mScrapHeap.get(type);
            if (result != null) {
                this.mScrapHeap.delete(type);
            }
            return result;
        }

        void clear() {
            SparseArray<View> scrapHeap = this.mScrapHeap;
            scrapHeap.clear();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$DropDownAdapter.class */
    private static class DropDownAdapter implements ListAdapter, SpinnerAdapter, View.OnClickListener {
        private SpinnerAdapter mAdapter;
        private ListAdapter mListAdapter;
        private AdapterView.OnItemClickListener mOnItemClickListener;

        public DropDownAdapter(SpinnerAdapter adapter) {
            this.mAdapter = adapter;
            if (adapter instanceof ListAdapter) {
                this.mListAdapter = (ListAdapter) adapter;
            }
        }

        public void setOnItemClickListener(AdapterView.OnItemClickListener listener) {
            this.mOnItemClickListener = listener;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            int position = ((Integer) v.getTag()).intValue();
            if (this.mOnItemClickListener != null) {
                this.mOnItemClickListener.onItemClick(null, v, position, 0L);
            }
        }

        @Override // android.widget.Adapter
        public int getCount() {
            if (this.mAdapter == null) {
                return 0;
            }
            return this.mAdapter.getCount();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            if (this.mAdapter == null) {
                return null;
            }
            return this.mAdapter.getItem(position);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            if (this.mAdapter == null) {
                return -1L;
            }
            return this.mAdapter.getItemId(position);
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View v = getDropDownView(position, convertView, parent);
            v.setOnClickListener(this);
            v.setTag(Integer.valueOf(position));
            return v;
        }

        @Override // android.widget.SpinnerAdapter
        public View getDropDownView(int position, View convertView, ViewGroup parent) {
            if (this.mAdapter == null) {
                return null;
            }
            return this.mAdapter.getDropDownView(position, convertView, parent);
        }

        @Override // android.widget.Adapter
        public boolean hasStableIds() {
            return this.mAdapter != null && this.mAdapter.hasStableIds();
        }

        @Override // android.widget.ListAdapter
        public boolean areAllItemsEnabled() {
            ListAdapter adapter = this.mListAdapter;
            return adapter == null || adapter.areAllItemsEnabled();
        }

        @Override // android.widget.ListAdapter
        public boolean isEnabled(int position) {
            ListAdapter adapter = this.mListAdapter;
            return adapter == null || adapter.isEnabled(position);
        }

        @Override // android.widget.Adapter
        public int getItemViewType(int position) {
            ListAdapter adapter = this.mListAdapter;
            if (adapter != null) {
                return adapter.getItemViewType(position);
            }
            return 0;
        }

        @Override // android.widget.Adapter
        public int getViewTypeCount() {
            ListAdapter adapter = this.mListAdapter;
            if (adapter != null) {
                return adapter.getViewTypeCount();
            }
            return 1;
        }

        @Override // android.widget.Adapter
        public boolean isEmpty() {
            return getCount() == 0;
        }

        @Override // android.widget.Adapter
        public void registerDataSetObserver(DataSetObserver observer) {
            if (this.mAdapter != null) {
                this.mAdapter.registerDataSetObserver(observer);
            }
        }

        @Override // android.widget.Adapter
        public void unregisterDataSetObserver(DataSetObserver observer) {
            if (this.mAdapter != null) {
                this.mAdapter.unregisterDataSetObserver(observer);
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Spinner$DropdownPopup.class */
    private class DropdownPopup extends ListPopupWindow {
        private CharSequence mHintText;
        private DropDownAdapter mAdapter;
        private ViewTreeObserver.OnGlobalLayoutListener layoutListener;

        public DropdownPopup(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            super(context, attrs, defStyleAttr, defStyleRes);
            this.layoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.rey.material.widget.Spinner.DropdownPopup.1
                @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
                public void onGlobalLayout() {
                    DropdownPopup.this.computeContentWidth();
                    DropdownPopup.super.show();
                }
            };
            setAnchorView(Spinner.this);
            setModal(true);
            setPromptPosition(0);
            setOnDismissListener(new PopupWindow.OnDismissListener() { // from class: com.rey.material.widget.Spinner.DropdownPopup.2
                @Override // android.widget.PopupWindow.OnDismissListener
                @TargetApi(16)
                public void onDismiss() {
                    ViewTreeObserver vto = Spinner.this.getViewTreeObserver();
                    if (vto != null) {
                        if (Build.VERSION.SDK_INT >= 16) {
                            vto.removeOnGlobalLayoutListener(DropdownPopup.this.layoutListener);
                        } else {
                            vto.removeGlobalOnLayoutListener(DropdownPopup.this.layoutListener);
                        }
                    }
                    Spinner.this.onPopupDismissed();
                }
            });
        }

        @Override // com.rey.material.widget.ListPopupWindow
        public void setAdapter(ListAdapter adapter) {
            super.setAdapter(adapter);
            this.mAdapter = (DropDownAdapter) adapter;
            this.mAdapter.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.rey.material.widget.Spinner.DropdownPopup.3
                @Override // android.widget.AdapterView.OnItemClickListener
                public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                    Spinner.this.performItemClick(v, position, DropdownPopup.this.mAdapter.getItemId(position));
                    DropdownPopup.this.dismiss();
                }
            });
        }

        public CharSequence getHintText() {
            return this.mHintText;
        }

        public void setPromptText(CharSequence hintText) {
            this.mHintText = hintText;
        }

        void computeContentWidth() {
            int hOffset;
            Drawable background = getBackground();
            int hOffset2 = 0;
            if (background == null) {
                Rect rect = Spinner.this.mTempRect;
                Spinner.this.mTempRect.right = 0;
                rect.left = 0;
            } else {
                background.getPadding(Spinner.this.mTempRect);
                hOffset2 = Spinner.this.mIsRtl ? Spinner.this.mTempRect.right : -Spinner.this.mTempRect.left;
            }
            int spinnerPaddingLeft = Spinner.this.getPaddingLeft();
            int spinnerPaddingRight = Spinner.this.getPaddingRight();
            int spinnerWidth = Spinner.this.getWidth();
            if (Spinner.this.mDropDownWidth == -2) {
                int contentWidth = Spinner.this.measureContentWidth(this.mAdapter, getBackground());
                int contentWidthLimit = (Spinner.this.getContext().getResources().getDisplayMetrics().widthPixels - Spinner.this.mTempRect.left) - Spinner.this.mTempRect.right;
                if (contentWidth > contentWidthLimit) {
                    contentWidth = contentWidthLimit;
                }
                setContentWidth(Math.max(contentWidth, (spinnerWidth - spinnerPaddingLeft) - spinnerPaddingRight));
            } else if (Spinner.this.mDropDownWidth == -1) {
                setContentWidth((spinnerWidth - spinnerPaddingLeft) - spinnerPaddingRight);
            } else {
                setContentWidth(Spinner.this.mDropDownWidth);
            }
            if (Spinner.this.mIsRtl) {
                hOffset = hOffset2 + ((spinnerWidth - spinnerPaddingRight) - getWidth());
            } else {
                hOffset = hOffset2 + spinnerPaddingLeft;
            }
            setHorizontalOffset(hOffset);
        }

        @Override // com.rey.material.widget.ListPopupWindow
        public void show() {
            ViewTreeObserver vto;
            boolean wasShowing = isShowing();
            computeContentWidth();
            setInputMethodMode(2);
            super.show();
            if (!wasShowing && (vto = Spinner.this.getViewTreeObserver()) != null) {
                vto.addOnGlobalLayoutListener(this.layoutListener);
            }
        }
    }
}
