package com.rey.material.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.text.TextUtilsCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.widget.ListViewAutoScrollHelper;
import android.support.v4.widget.PopupWindowCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import java.lang.reflect.Method;
import java.util.Locale;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow.class */
public class ListPopupWindow {
    private static final String TAG = "ListPopupWindow";
    private static final boolean DEBUG = false;
    private static final int EXPAND_LIST_TIMEOUT = 250;
    private static Method sClipToWindowEnabledMethod;
    private Context mContext;
    private PopupWindow mPopup;
    private ListAdapter mAdapter;
    private DropDownListView mDropDownList;
    private int mDropDownHeight;
    private int mDropDownWidth;
    private int mDropDownHorizontalOffset;
    private int mDropDownVerticalOffset;
    private boolean mDropDownVerticalOffsetSet;
    private int mItemAnimationId;
    private int mItemAnimationOffset;
    private int mDropDownGravity;
    private boolean mDropDownAlwaysVisible;
    private boolean mForceIgnoreOutsideTouch;
    int mListItemExpandMaximum;
    private View mPromptView;
    private int mPromptPosition;
    private DataSetObserver mObserver;
    private View mDropDownAnchorView;
    private Drawable mDropDownListHighlight;
    private AdapterView.OnItemClickListener mItemClickListener;
    private AdapterView.OnItemSelectedListener mItemSelectedListener;
    private final ResizePopupRunnable mResizePopupRunnable;
    private final PopupTouchInterceptor mTouchInterceptor;
    private final PopupScrollListener mScrollListener;
    private final ListSelectorHider mHideSelector;
    private Runnable mShowDropDownRunnable;
    private Handler mHandler;
    private Rect mTempRect;
    private boolean mModal;
    private int mLayoutDirection;
    public static final int POSITION_PROMPT_ABOVE = 0;
    public static final int POSITION_PROMPT_BELOW = 1;
    public static final int MATCH_PARENT = -1;
    public static final int WRAP_CONTENT = -2;
    public static final int INPUT_METHOD_FROM_FOCUSABLE = 0;
    public static final int INPUT_METHOD_NEEDED = 1;
    public static final int INPUT_METHOD_NOT_NEEDED = 2;

    static {
        try {
            sClipToWindowEnabledMethod = android.widget.PopupWindow.class.getDeclaredMethod("setClipToScreenEnabled", Boolean.TYPE);
        } catch (NoSuchMethodException e) {
            Log.i(TAG, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
        }
    }

    public ListPopupWindow(Context context) {
        this(context, null, R.attr.listPopupWindowStyle, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.listPopupWindowStyle, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mDropDownHeight = -2;
        this.mDropDownWidth = -2;
        this.mDropDownGravity = 0;
        this.mDropDownAlwaysVisible = false;
        this.mForceIgnoreOutsideTouch = false;
        this.mListItemExpandMaximum = Integer.MAX_VALUE;
        this.mPromptPosition = 0;
        this.mResizePopupRunnable = new ResizePopupRunnable();
        this.mTouchInterceptor = new PopupTouchInterceptor();
        this.mScrollListener = new PopupScrollListener();
        this.mHideSelector = new ListSelectorHider();
        this.mHandler = new Handler();
        this.mTempRect = new Rect();
        this.mContext = context;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ListPopupWindow, defStyleAttr, defStyleRes);
        this.mDropDownHorizontalOffset = a.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownHorizontalOffset, 0);
        this.mDropDownVerticalOffset = a.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownVerticalOffset, 0);
        if (this.mDropDownVerticalOffset != 0) {
            this.mDropDownVerticalOffsetSet = true;
        }
        a.recycle();
        this.mPopup = new PopupWindow(context, attrs, defStyleAttr);
        this.mPopup.setInputMethodMode(1);
        Locale locale = this.mContext.getResources().getConfiguration().locale;
        this.mLayoutDirection = TextUtilsCompat.getLayoutDirectionFromLocale(locale);
    }

    public void setItemAnimation(int id) {
        this.mItemAnimationId = id;
    }

    public void setItemAnimationOffset(int offset) {
        this.mItemAnimationOffset = offset;
    }

    public void setBackgroundDrawable(Drawable background) {
        this.mPopup.setBackgroundDrawable(background);
    }

    public Drawable getBackground() {
        return this.mPopup.getBackground();
    }

    public void setAdapter(ListAdapter adapter) {
        if (this.mObserver == null) {
            this.mObserver = new PopupDataSetObserver();
        } else if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
        }
        this.mAdapter = adapter;
        if (this.mAdapter != null) {
            adapter.registerDataSetObserver(this.mObserver);
        }
        if (this.mDropDownList != null) {
            this.mDropDownList.setAdapter(this.mAdapter);
        }
    }

    public void setPromptPosition(int position) {
        this.mPromptPosition = position;
    }

    public int getPromptPosition() {
        return this.mPromptPosition;
    }

    public void setModal(boolean modal) {
        this.mModal = modal;
        this.mPopup.setFocusable(modal);
    }

    public boolean isModal() {
        return this.mModal;
    }

    public void setForceIgnoreOutsideTouch(boolean forceIgnoreOutsideTouch) {
        this.mForceIgnoreOutsideTouch = forceIgnoreOutsideTouch;
    }

    public void setDropDownAlwaysVisible(boolean dropDownAlwaysVisible) {
        this.mDropDownAlwaysVisible = dropDownAlwaysVisible;
    }

    public boolean isDropDownAlwaysVisible() {
        return this.mDropDownAlwaysVisible;
    }

    public void setSoftInputMode(int mode) {
        this.mPopup.setSoftInputMode(mode);
    }

    public int getSoftInputMode() {
        return this.mPopup.getSoftInputMode();
    }

    public void setListSelector(Drawable selector) {
        this.mDropDownListHighlight = selector;
    }

    public void setAnimationStyle(int animationStyle) {
        this.mPopup.setAnimationStyle(animationStyle);
    }

    public int getAnimationStyle() {
        return this.mPopup.getAnimationStyle();
    }

    public View getAnchorView() {
        return this.mDropDownAnchorView;
    }

    public void setAnchorView(View anchor) {
        this.mDropDownAnchorView = anchor;
    }

    public int getHorizontalOffset() {
        return this.mDropDownHorizontalOffset;
    }

    public void setHorizontalOffset(int offset) {
        this.mDropDownHorizontalOffset = offset;
    }

    public int getVerticalOffset() {
        if (!this.mDropDownVerticalOffsetSet) {
            return 0;
        }
        return this.mDropDownVerticalOffset;
    }

    public void setVerticalOffset(int offset) {
        this.mDropDownVerticalOffset = offset;
        this.mDropDownVerticalOffsetSet = true;
    }

    public void setDropDownGravity(int gravity) {
        this.mDropDownGravity = gravity;
    }

    public int getWidth() {
        return this.mDropDownWidth;
    }

    public void setWidth(int width) {
        this.mDropDownWidth = width;
    }

    public void setContentWidth(int width) {
        Drawable popupBackground = this.mPopup.getBackground();
        if (popupBackground != null) {
            popupBackground.getPadding(this.mTempRect);
            this.mDropDownWidth = this.mTempRect.left + this.mTempRect.right + width;
        } else {
            setWidth(width);
        }
    }

    public int getHeight() {
        return this.mDropDownHeight;
    }

    public void setHeight(int height) {
        this.mDropDownHeight = height;
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener clickListener) {
        this.mItemClickListener = clickListener;
    }

    public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener selectedListener) {
        this.mItemSelectedListener = selectedListener;
    }

    public void setPromptView(View prompt) {
        boolean showing = isShowing();
        if (showing) {
            removePromptView();
        }
        this.mPromptView = prompt;
        if (showing) {
            show();
        }
    }

    public void postShow() {
        this.mHandler.post(this.mShowDropDownRunnable);
    }

    public void show() {
        int widthSpec;
        int heightSpec;
        int height = buildDropDown();
        int widthSpec2 = 0;
        int heightSpec2 = 0;
        boolean noInputMethod = isInputMethodNotNeeded();
        if (this.mPopup.isShowing()) {
            if (this.mDropDownWidth == -1) {
                widthSpec = -1;
            } else if (this.mDropDownWidth == -2) {
                widthSpec = getAnchorView().getWidth();
            } else {
                widthSpec = this.mDropDownWidth;
            }
            if (this.mDropDownHeight == -1) {
                heightSpec = noInputMethod ? height : -1;
                if (noInputMethod) {
                    this.mPopup.setWindowLayoutMode(this.mDropDownWidth == -1 ? -1 : 0, 0);
                } else {
                    this.mPopup.setWindowLayoutMode(this.mDropDownWidth == -1 ? -1 : 0, -1);
                }
            } else {
                heightSpec = this.mDropDownHeight == -2 ? height : this.mDropDownHeight;
            }
            this.mPopup.setOutsideTouchable((this.mForceIgnoreOutsideTouch || this.mDropDownAlwaysVisible) ? false : true);
            this.mPopup.update(getAnchorView(), this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset, widthSpec, heightSpec);
            return;
        }
        if (this.mDropDownWidth == -1) {
            widthSpec2 = -1;
        } else if (this.mDropDownWidth == -2) {
            this.mPopup.setWidth(getAnchorView().getWidth());
        } else {
            this.mPopup.setWidth(this.mDropDownWidth);
        }
        if (this.mDropDownHeight == -1) {
            heightSpec2 = -1;
        } else if (this.mDropDownHeight == -2) {
            this.mPopup.setHeight(height);
        } else {
            this.mPopup.setHeight(this.mDropDownHeight);
        }
        this.mPopup.setWindowLayoutMode(widthSpec2, heightSpec2);
        setPopupClipToScreenEnabled(true);
        this.mPopup.setOutsideTouchable((this.mForceIgnoreOutsideTouch || this.mDropDownAlwaysVisible) ? false : true);
        this.mPopup.setTouchInterceptor(this.mTouchInterceptor);
        PopupWindowCompat.showAsDropDown(this.mPopup, getAnchorView(), this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset, this.mDropDownGravity);
        this.mDropDownList.setSelection(-1);
        if (!this.mModal || this.mDropDownList.isInTouchMode()) {
            clearListSelection();
        }
        if (!this.mModal) {
            this.mHandler.post(this.mHideSelector);
        }
        if (this.mItemAnimationId != 0) {
            this.mPopup.getContentView().getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.rey.material.widget.ListPopupWindow.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    ListPopupWindow.this.mPopup.getContentView().getViewTreeObserver().removeOnPreDrawListener(this);
                    int count = ListPopupWindow.this.mDropDownList.getChildCount();
                    for (int i = 0; i < count; i++) {
                        View v = ListPopupWindow.this.mDropDownList.getChildAt(i);
                        Animation anim = AnimationUtils.loadAnimation(ListPopupWindow.this.mContext, ListPopupWindow.this.mItemAnimationId);
                        anim.setStartOffset(ListPopupWindow.this.mItemAnimationOffset * i);
                        v.startAnimation(anim);
                    }
                    return false;
                }
            });
        }
    }

    public void dismiss() {
        this.mPopup.dismiss();
        removePromptView();
        this.mPopup.setContentView(null);
        this.mDropDownList = null;
        this.mHandler.removeCallbacks(this.mResizePopupRunnable);
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener listener) {
        this.mPopup.setOnDismissListener(listener);
    }

    private void removePromptView() {
        if (this.mPromptView != null) {
            ViewParent parent = this.mPromptView.getParent();
            if (parent instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) parent;
                group.removeView(this.mPromptView);
            }
        }
    }

    public void setInputMethodMode(int mode) {
        this.mPopup.setInputMethodMode(mode);
    }

    public int getInputMethodMode() {
        return this.mPopup.getInputMethodMode();
    }

    public void setSelection(int position) {
        DropDownListView list = this.mDropDownList;
        if (!isShowing() || list == null) {
            return;
        }
        list.mListSelectionHidden = false;
        list.setSelection(position);
        if (Build.VERSION.SDK_INT >= 11 && list.getChoiceMode() != 0) {
            list.setItemChecked(position, true);
        }
    }

    public void clearListSelection() {
        DropDownListView list = this.mDropDownList;
        if (list == null) {
            return;
        }
        list.mListSelectionHidden = true;
        list.requestLayout();
    }

    public boolean isShowing() {
        return this.mPopup.isShowing();
    }

    public boolean isInputMethodNotNeeded() {
        return this.mPopup.getInputMethodMode() == 2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v7, types: [android.widget.AdapterView, com.rey.material.widget.ListPopupWindow$DropDownListView] */
    public boolean performItemClick(int position) {
        if (isShowing()) {
            if (this.mItemClickListener != null) {
                ?? r0 = this.mDropDownList;
                View child = r0.getChildAt(position - r0.getFirstVisiblePosition());
                ListAdapter adapter = r0.getAdapter();
                this.mItemClickListener.onItemClick(r0, child, position, adapter.getItemId(position));
                return true;
            }
            return true;
        }
        return false;
    }

    public Object getSelectedItem() {
        if (!isShowing()) {
            return null;
        }
        return this.mDropDownList.getSelectedItem();
    }

    public int getSelectedItemPosition() {
        if (!isShowing()) {
            return -1;
        }
        return this.mDropDownList.getSelectedItemPosition();
    }

    public long getSelectedItemId() {
        if (!isShowing()) {
            return Long.MIN_VALUE;
        }
        return this.mDropDownList.getSelectedItemId();
    }

    public View getSelectedView() {
        if (!isShowing()) {
            return null;
        }
        return this.mDropDownList.getSelectedView();
    }

    public ListView getListView() {
        return this.mDropDownList;
    }

    public PopupWindow getPopup() {
        return this.mPopup;
    }

    void setListItemExpandMax(int max) {
        this.mListItemExpandMaximum = max;
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (!isShowing() || keyCode == 62) {
            return false;
        }
        if (this.mDropDownList.getSelectedItemPosition() >= 0 || !isConfirmKey(keyCode)) {
            int curIndex = this.mDropDownList.getSelectedItemPosition();
            boolean below = !this.mPopup.isAboveAnchor();
            ListAdapter adapter = this.mAdapter;
            int firstItem = Integer.MAX_VALUE;
            int lastItem = Integer.MIN_VALUE;
            if (adapter != null) {
                boolean allEnabled = adapter.areAllItemsEnabled();
                firstItem = allEnabled ? 0 : this.mDropDownList.lookForSelectablePosition(0, true);
                lastItem = allEnabled ? adapter.getCount() - 1 : this.mDropDownList.lookForSelectablePosition(adapter.getCount() - 1, false);
            }
            if ((below && keyCode == 19 && curIndex <= firstItem) || (!below && keyCode == 20 && curIndex >= lastItem)) {
                clearListSelection();
                this.mPopup.setInputMethodMode(1);
                show();
                return true;
            }
            this.mDropDownList.mListSelectionHidden = false;
            boolean consumed = this.mDropDownList.onKeyDown(keyCode, event);
            if (consumed) {
                this.mPopup.setInputMethodMode(2);
                this.mDropDownList.requestFocusFromTouch();
                show();
                switch (keyCode) {
                    case 19:
                    case 20:
                    case 23:
                    case 66:
                        break;
                }
                return true;
            }
            if (below && keyCode == 20) {
                if (curIndex == lastItem) {
                    return true;
                }
                return false;
            }
            if (!below && keyCode == 19 && curIndex == firstItem) {
                return true;
            }
            return false;
        }
        return false;
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (isShowing() && this.mDropDownList.getSelectedItemPosition() >= 0) {
            boolean consumed = this.mDropDownList.onKeyUp(keyCode, event);
            if (consumed && isConfirmKey(keyCode)) {
                dismiss();
            }
            return consumed;
        }
        return false;
    }

    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
        if (keyCode == 4 && isShowing()) {
            View anchorView = this.mDropDownAnchorView;
            if (event.getAction() == 0 && event.getRepeatCount() == 0) {
                KeyEvent.DispatcherState state = anchorView.getKeyDispatcherState();
                if (state != null) {
                    state.startTracking(event, this);
                    return true;
                }
                return true;
            }
            if (event.getAction() == 1) {
                KeyEvent.DispatcherState state2 = anchorView.getKeyDispatcherState();
                if (state2 != null) {
                    state2.handleUpEvent(event);
                }
                if (event.isTracking() && !event.isCanceled()) {
                    dismiss();
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    public View.OnTouchListener createDragToOpenListener(View src) {
        return new ForwardingListener(src) { // from class: com.rey.material.widget.ListPopupWindow.2
            @Override // com.rey.material.widget.ListPopupWindow.ForwardingListener
            public ListPopupWindow getPopup() {
                return ListPopupWindow.this;
            }
        };
    }

    private int getSystemBarHeight(String resourceName) {
        int height = 0;
        int resourceId = this.mContext.getResources().getIdentifier(resourceName, "dimen", "android");
        if (resourceId > 0) {
            height = this.mContext.getResources().getDimensionPixelSize(resourceId);
        }
        return height;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v104, types: [android.widget.LinearLayout] */
    /* JADX WARN: Type inference failed for: r9v4, types: [android.view.View] */
    private int buildDropDown() {
        int makeMeasureSpec;
        int i = 0;
        if (this.mDropDownList == null) {
            Context context = this.mContext;
            this.mShowDropDownRunnable = new Runnable() { // from class: com.rey.material.widget.ListPopupWindow.3
                @Override // java.lang.Runnable
                public void run() {
                    View view = ListPopupWindow.this.getAnchorView();
                    if (view != null && view.getWindowToken() != null) {
                        ListPopupWindow.this.show();
                    }
                }
            };
            this.mDropDownList = new DropDownListView(context, !this.mModal);
            if (this.mDropDownListHighlight != null) {
                this.mDropDownList.setSelector(this.mDropDownListHighlight);
            }
            this.mDropDownList.setAdapter(this.mAdapter);
            this.mDropDownList.setOnItemClickListener(this.mItemClickListener);
            this.mDropDownList.setFocusable(true);
            this.mDropDownList.setFocusableInTouchMode(true);
            this.mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.rey.material.widget.ListPopupWindow.4
                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    DropDownListView dropDownList;
                    if (position == -1 || (dropDownList = ListPopupWindow.this.mDropDownList) == null) {
                        return;
                    }
                    dropDownList.mListSelectionHidden = false;
                }

                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onNothingSelected(AdapterView<?> parent) {
                }
            });
            this.mDropDownList.setOnScrollListener(this.mScrollListener);
            if (this.mItemSelectedListener != null) {
                this.mDropDownList.setOnItemSelectedListener(this.mItemSelectedListener);
            }
            ?? r9 = this.mDropDownList;
            View view = this.mPromptView;
            View view2 = r9;
            if (view != null) {
                ?? linearLayout = new android.widget.LinearLayout(context);
                linearLayout.setOrientation(1);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, 0, 1.0f);
                switch (this.mPromptPosition) {
                    case 0:
                        linearLayout.addView(view);
                        linearLayout.addView(r9, layoutParams);
                        break;
                    case 1:
                        linearLayout.addView(r9, layoutParams);
                        linearLayout.addView(view);
                        break;
                    default:
                        Log.e(TAG, "Invalid hint position " + this.mPromptPosition);
                        break;
                }
                view.measure(View.MeasureSpec.makeMeasureSpec(this.mDropDownWidth, ThemeManager.THEME_UNDEFINED), 0);
                LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) view.getLayoutParams();
                i = view.getMeasuredHeight() + layoutParams2.topMargin + layoutParams2.bottomMargin;
                view2 = linearLayout;
            }
            this.mPopup.setContentView(view2);
        } else {
            View view3 = this.mPromptView;
            if (view3 != null) {
                LinearLayout.LayoutParams layoutParams3 = (LinearLayout.LayoutParams) view3.getLayoutParams();
                i = view3.getMeasuredHeight() + layoutParams3.topMargin + layoutParams3.bottomMargin;
            }
        }
        int i2 = 0;
        Drawable background = this.mPopup.getBackground();
        if (background != null) {
            background.getPadding(this.mTempRect);
            i2 = this.mTempRect.top + this.mTempRect.bottom;
            if (!this.mDropDownVerticalOffsetSet) {
                this.mDropDownVerticalOffset = -this.mTempRect.top;
            }
        } else {
            this.mTempRect.setEmpty();
        }
        int i3 = 0;
        if (Build.VERSION.SDK_INT >= 21) {
            i3 = Math.max(getSystemBarHeight("status_bar_height"), getSystemBarHeight("navigation_bar_height"));
        }
        boolean z = this.mPopup.getInputMethodMode() == 2;
        int maxAvailableHeight = this.mPopup.getMaxAvailableHeight(getAnchorView(), this.mDropDownVerticalOffset) - i3;
        if (this.mDropDownAlwaysVisible || this.mDropDownHeight == -1) {
            return maxAvailableHeight + i2;
        }
        switch (this.mDropDownWidth) {
            case -2:
                makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mContext.getResources().getDisplayMetrics().widthPixels - (this.mTempRect.left + this.mTempRect.right), ThemeManager.THEME_UNDEFINED);
                break;
            case -1:
                makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mContext.getResources().getDisplayMetrics().widthPixels - (this.mTempRect.left + this.mTempRect.right), 1073741824);
                break;
            default:
                makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mDropDownWidth, 1073741824);
                break;
        }
        int measureHeightOfChildrenCompat = this.mDropDownList.measureHeightOfChildrenCompat(makeMeasureSpec, 0, -1, maxAvailableHeight - i, -1);
        if (measureHeightOfChildrenCompat > 0) {
            i += i2;
        }
        return measureHeightOfChildrenCompat + i;
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$ForwardingListener.class */
    public static abstract class ForwardingListener implements View.OnTouchListener {
        private final float mScaledTouchSlop;
        private final View mSrc;
        private Runnable mDisallowIntercept;
        private Runnable mTriggerLongPress;
        private boolean mForwarding;
        private boolean mWasLongPress;
        private int mActivePointerId;
        private final int[] mTmpLocation = new int[2];
        private final int mTapTimeout = ViewConfiguration.getTapTimeout();
        private final int mLongPressTimeout = (this.mTapTimeout + ViewConfiguration.getLongPressTimeout()) / 2;

        public abstract ListPopupWindow getPopup();

        public ForwardingListener(View src) {
            this.mSrc = src;
            this.mScaledTouchSlop = ViewConfiguration.get(src.getContext()).getScaledTouchSlop();
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            boolean forwarding;
            boolean wasForwarding = this.mForwarding;
            if (wasForwarding) {
                if (this.mWasLongPress) {
                    forwarding = onTouchForwarded(event);
                } else {
                    forwarding = onTouchForwarded(event) || !onForwardingStopped();
                }
            } else {
                forwarding = onTouchObserved(event) && onForwardingStarted();
                if (forwarding) {
                    long now = SystemClock.uptimeMillis();
                    MotionEvent e = MotionEvent.obtain(now, now, 3, 0.0f, 0.0f, 0);
                    this.mSrc.onTouchEvent(e);
                    e.recycle();
                }
            }
            this.mForwarding = forwarding;
            return forwarding || wasForwarding;
        }

        protected boolean onForwardingStarted() {
            ListPopupWindow popup = getPopup();
            if (popup != null && !popup.isShowing()) {
                popup.show();
                return true;
            }
            return true;
        }

        protected boolean onForwardingStopped() {
            ListPopupWindow popup = getPopup();
            if (popup != null && popup.isShowing()) {
                popup.dismiss();
                return true;
            }
            return true;
        }

        private boolean onTouchObserved(MotionEvent srcEvent) {
            View src = this.mSrc;
            if (!src.isEnabled()) {
                return false;
            }
            int actionMasked = MotionEventCompat.getActionMasked(srcEvent);
            switch (actionMasked) {
                case 0:
                    this.mActivePointerId = srcEvent.getPointerId(0);
                    this.mWasLongPress = false;
                    if (this.mDisallowIntercept == null) {
                        this.mDisallowIntercept = new DisallowIntercept();
                    }
                    src.postDelayed(this.mDisallowIntercept, this.mTapTimeout);
                    if (this.mTriggerLongPress == null) {
                        this.mTriggerLongPress = new TriggerLongPress();
                    }
                    src.postDelayed(this.mTriggerLongPress, this.mLongPressTimeout);
                    return false;
                case 1:
                case 3:
                    clearCallbacks();
                    return false;
                case 2:
                    int activePointerIndex = srcEvent.findPointerIndex(this.mActivePointerId);
                    if (activePointerIndex >= 0) {
                        float x = srcEvent.getX(activePointerIndex);
                        float y = srcEvent.getY(activePointerIndex);
                        if (!pointInView(src, x, y, this.mScaledTouchSlop)) {
                            clearCallbacks();
                            src.getParent().requestDisallowInterceptTouchEvent(true);
                            return true;
                        }
                        return false;
                    }
                    return false;
                default:
                    return false;
            }
        }

        private void clearCallbacks() {
            if (this.mTriggerLongPress != null) {
                this.mSrc.removeCallbacks(this.mTriggerLongPress);
            }
            if (this.mDisallowIntercept != null) {
                this.mSrc.removeCallbacks(this.mDisallowIntercept);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void onLongPress() {
            clearCallbacks();
            View src = this.mSrc;
            if (!src.isEnabled() || !onForwardingStarted()) {
                return;
            }
            this.mSrc.getParent().requestDisallowInterceptTouchEvent(true);
            long now = SystemClock.uptimeMillis();
            MotionEvent e = MotionEvent.obtain(now, now, 3, 0.0f, 0.0f, 0);
            this.mSrc.onTouchEvent(e);
            e.recycle();
            this.mForwarding = true;
            this.mWasLongPress = true;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v10, types: [android.view.View, com.rey.material.widget.ListPopupWindow$DropDownListView] */
        private boolean onTouchForwarded(MotionEvent srcEvent) {
            ?? r0;
            View src = this.mSrc;
            ListPopupWindow popup = getPopup();
            if (popup == null || !popup.isShowing() || (r0 = popup.mDropDownList) == 0 || !r0.isShown()) {
                return false;
            }
            MotionEvent dstEvent = MotionEvent.obtainNoHistory(srcEvent);
            toGlobalMotionEvent(src, dstEvent);
            toLocalMotionEvent(r0, dstEvent);
            boolean handled = r0.onForwardedEvent(dstEvent, this.mActivePointerId);
            dstEvent.recycle();
            int action = MotionEventCompat.getActionMasked(srcEvent);
            boolean keepForwarding = (action == 1 || action == 3) ? false : true;
            return handled && keepForwarding;
        }

        private static boolean pointInView(View view, float localX, float localY, float slop) {
            return localX >= (-slop) && localY >= (-slop) && localX < ((float) (view.getRight() - view.getLeft())) + slop && localY < ((float) (view.getBottom() - view.getTop())) + slop;
        }

        private boolean toLocalMotionEvent(View view, MotionEvent event) {
            int[] loc = this.mTmpLocation;
            view.getLocationOnScreen(loc);
            event.offsetLocation(-loc[0], -loc[1]);
            return true;
        }

        private boolean toGlobalMotionEvent(View view, MotionEvent event) {
            int[] loc = this.mTmpLocation;
            view.getLocationOnScreen(loc);
            event.offsetLocation(loc[0], loc[1]);
            return true;
        }

        /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$ForwardingListener$DisallowIntercept.class */
        private class DisallowIntercept implements Runnable {
            private DisallowIntercept() {
            }

            @Override // java.lang.Runnable
            public void run() {
                ViewParent parent = ForwardingListener.this.mSrc.getParent();
                parent.requestDisallowInterceptTouchEvent(true);
            }
        }

        /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$ForwardingListener$TriggerLongPress.class */
        private class TriggerLongPress implements Runnable {
            private TriggerLongPress() {
            }

            @Override // java.lang.Runnable
            public void run() {
                ForwardingListener.this.onLongPress();
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$DropDownListView.class */
    private static class DropDownListView extends ListView {
        private boolean mListSelectionHidden;
        private boolean mHijackFocus;
        private boolean mDrawsInPressedState;
        private ViewPropertyAnimatorCompat mClickAnimation;
        private ListViewAutoScrollHelper mScrollHelper;

        public DropDownListView(Context context, boolean hijackFocus) {
            super(context, null, R.attr.dropDownListViewStyle);
            this.mHijackFocus = hijackFocus;
            setCacheColorHint(0);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public boolean onForwardedEvent(MotionEvent event, int activePointerId) {
            boolean handledEvent = true;
            boolean clearPressedItem = false;
            int actionMasked = MotionEventCompat.getActionMasked(event);
            switch (actionMasked) {
                case 1:
                    handledEvent = false;
                case 2:
                    int activeIndex = event.findPointerIndex(activePointerId);
                    if (activeIndex < 0) {
                        handledEvent = false;
                        break;
                    } else {
                        int x = (int) event.getX(activeIndex);
                        int y = (int) event.getY(activeIndex);
                        int position = pointToPosition(x, y);
                        if (position == -1) {
                            clearPressedItem = true;
                            break;
                        } else {
                            View child = getChildAt(position - getFirstVisiblePosition());
                            setPressedItem(child, position, x, y);
                            handledEvent = true;
                            if (actionMasked == 1) {
                                clickPressedItem(child, position);
                                break;
                            }
                        }
                    }
                    break;
                case 3:
                    handledEvent = false;
                    break;
            }
            if (!handledEvent || clearPressedItem) {
                clearPressedItem();
            }
            if (handledEvent) {
                if (this.mScrollHelper == null) {
                    this.mScrollHelper = new ListViewAutoScrollHelper(this);
                }
                this.mScrollHelper.setEnabled(true);
                this.mScrollHelper.onTouch(this, event);
            } else if (this.mScrollHelper != null) {
                this.mScrollHelper.setEnabled(false);
            }
            return handledEvent;
        }

        private void clickPressedItem(View child, int position) {
            long id = getItemIdAtPosition(position);
            performItemClick(child, position, id);
        }

        private void clearPressedItem() {
            this.mDrawsInPressedState = false;
            setPressed(false);
            drawableStateChanged();
            if (this.mClickAnimation != null) {
                this.mClickAnimation.cancel();
                this.mClickAnimation = null;
            }
        }

        private void setPressedItem(View child, int position, float x, float y) {
            this.mDrawsInPressedState = true;
            setPressed(true);
            layoutChildren();
            setSelection(position);
            positionSelectorLikeTouchCompat(position, child, x, y);
            setSelectorEnabled(false);
            refreshDrawableState();
        }

        protected boolean touchModeDrawsInPressedStateCompat() {
            return this.mDrawsInPressedState || super.touchModeDrawsInPressedStateCompat();
        }

        public boolean isInTouchMode() {
            return (this.mHijackFocus && this.mListSelectionHidden) || super.isInTouchMode();
        }

        public boolean hasWindowFocus() {
            return this.mHijackFocus || super.hasWindowFocus();
        }

        public boolean isFocused() {
            return this.mHijackFocus || super.isFocused();
        }

        public boolean hasFocus() {
            return this.mHijackFocus || super.hasFocus();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$PopupDataSetObserver.class */
    private class PopupDataSetObserver extends DataSetObserver {
        private PopupDataSetObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            if (ListPopupWindow.this.isShowing()) {
                ListPopupWindow.this.show();
            }
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            ListPopupWindow.this.dismiss();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$ListSelectorHider.class */
    private class ListSelectorHider implements Runnable {
        private ListSelectorHider() {
        }

        @Override // java.lang.Runnable
        public void run() {
            ListPopupWindow.this.clearListSelection();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$ResizePopupRunnable.class */
    private class ResizePopupRunnable implements Runnable {
        private ResizePopupRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (ListPopupWindow.this.mDropDownList != null && ListPopupWindow.this.mDropDownList.getCount() > ListPopupWindow.this.mDropDownList.getChildCount() && ListPopupWindow.this.mDropDownList.getChildCount() <= ListPopupWindow.this.mListItemExpandMaximum) {
                ListPopupWindow.this.mPopup.setInputMethodMode(2);
                ListPopupWindow.this.show();
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$PopupTouchInterceptor.class */
    private class PopupTouchInterceptor implements View.OnTouchListener {
        private PopupTouchInterceptor() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            int action = event.getAction();
            int x = (int) event.getX();
            int y = (int) event.getY();
            if (action == 0 && ListPopupWindow.this.mPopup != null && ListPopupWindow.this.mPopup.isShowing() && x >= 0 && x < ListPopupWindow.this.mPopup.getWidth() && y >= 0 && y < ListPopupWindow.this.mPopup.getHeight()) {
                ListPopupWindow.this.mHandler.postDelayed(ListPopupWindow.this.mResizePopupRunnable, 250L);
                return false;
            }
            if (action == 1) {
                ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
                return false;
            }
            return false;
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListPopupWindow$PopupScrollListener.class */
    private class PopupScrollListener implements AbsListView.OnScrollListener {
        private PopupScrollListener() {
        }

        @Override // android.widget.AbsListView.OnScrollListener
        public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        }

        @Override // android.widget.AbsListView.OnScrollListener
        public void onScrollStateChanged(AbsListView view, int scrollState) {
            if (scrollState == 1 && !ListPopupWindow.this.isInputMethodNotNeeded() && ListPopupWindow.this.mPopup.getContentView() != null) {
                ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
                ListPopupWindow.this.mResizePopupRunnable.run();
            }
        }
    }

    private static boolean isConfirmKey(int keyCode) {
        return keyCode == 66 || keyCode == 23;
    }

    private void setPopupClipToScreenEnabled(boolean clip) {
        if (sClipToWindowEnabledMethod != null) {
            try {
                sClipToWindowEnabledMethod.invoke(this.mPopup, Boolean.valueOf(clip));
            } catch (Exception e) {
                Log.i(TAG, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
            }
        } else if (clip && Build.VERSION.SDK_INT >= 3) {
            this.mPopup.setClippingEnabled(false);
        }
    }
}
