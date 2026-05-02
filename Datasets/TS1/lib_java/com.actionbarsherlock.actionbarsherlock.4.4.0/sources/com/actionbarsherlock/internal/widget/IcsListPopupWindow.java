package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import com.actionbarsherlock.R;
import com.actionbarsherlock.widget.ActivityChooserView;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow.class */
public class IcsListPopupWindow {
    private static final int EXPAND_LIST_TIMEOUT = 250;
    private Context mContext;
    private final PopupWindowCompat mPopup;
    private ListAdapter mAdapter;
    private DropDownListView mDropDownList;
    private int mDropDownHeight;
    private int mDropDownWidth;
    private int mDropDownHorizontalOffset;
    private int mDropDownVerticalOffset;
    private boolean mDropDownVerticalOffsetSet;
    private int mListItemExpandMaximum;
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
    private Handler mHandler;
    private Rect mTempRect;
    private boolean mModal;
    public static final int POSITION_PROMPT_ABOVE = 0;
    public static final int POSITION_PROMPT_BELOW = 1;

    public IcsListPopupWindow(Context context) {
        this(context, null, R.attr.listPopupWindowStyle);
    }

    public IcsListPopupWindow(Context context, AttributeSet attrs, int defStyleAttr) {
        this.mDropDownHeight = -2;
        this.mDropDownWidth = -2;
        this.mListItemExpandMaximum = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        this.mPromptPosition = 0;
        this.mResizePopupRunnable = new ResizePopupRunnable();
        this.mTouchInterceptor = new PopupTouchInterceptor();
        this.mScrollListener = new PopupScrollListener();
        this.mHideSelector = new ListSelectorHider();
        this.mHandler = new Handler();
        this.mTempRect = new Rect();
        this.mContext = context;
        this.mPopup = new PopupWindowCompat(context, attrs, defStyleAttr);
        this.mPopup.setInputMethodMode(1);
    }

    public IcsListPopupWindow(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mDropDownHeight = -2;
        this.mDropDownWidth = -2;
        this.mListItemExpandMaximum = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        this.mPromptPosition = 0;
        this.mResizePopupRunnable = new ResizePopupRunnable();
        this.mTouchInterceptor = new PopupTouchInterceptor();
        this.mScrollListener = new PopupScrollListener();
        this.mHideSelector = new ListSelectorHider();
        this.mHandler = new Handler();
        this.mTempRect = new Rect();
        this.mContext = context;
        if (Build.VERSION.SDK_INT < 11) {
            Context wrapped = new ContextThemeWrapper(context, defStyleRes);
            this.mPopup = new PopupWindowCompat(wrapped, attrs, defStyleAttr);
        } else {
            this.mPopup = new PopupWindowCompat(context, attrs, defStyleAttr, defStyleRes);
        }
        this.mPopup.setInputMethodMode(1);
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

    public void setModal(boolean modal) {
        this.mModal = true;
        this.mPopup.setFocusable(modal);
    }

    public void setBackgroundDrawable(Drawable d) {
        this.mPopup.setBackgroundDrawable(d);
    }

    public void setAnchorView(View anchor) {
        this.mDropDownAnchorView = anchor;
    }

    public void setHorizontalOffset(int offset) {
        this.mDropDownHorizontalOffset = offset;
    }

    public void setVerticalOffset(int offset) {
        this.mDropDownVerticalOffset = offset;
        this.mDropDownVerticalOffsetSet = true;
    }

    public void setContentWidth(int width) {
        Drawable popupBackground = this.mPopup.getBackground();
        if (popupBackground != null) {
            popupBackground.getPadding(this.mTempRect);
            this.mDropDownWidth = this.mTempRect.left + this.mTempRect.right + width;
        } else {
            this.mDropDownWidth = width;
        }
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener clickListener) {
        this.mItemClickListener = clickListener;
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
                widthSpec = this.mDropDownAnchorView.getWidth();
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
            this.mPopup.setOutsideTouchable(true);
            this.mPopup.update(this.mDropDownAnchorView, this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset, widthSpec, heightSpec);
            return;
        }
        if (this.mDropDownWidth == -1) {
            widthSpec2 = -1;
        } else if (this.mDropDownWidth == -2) {
            this.mPopup.setWidth(this.mDropDownAnchorView.getWidth());
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
        this.mPopup.setOutsideTouchable(true);
        this.mPopup.setTouchInterceptor(this.mTouchInterceptor);
        this.mPopup.showAsDropDown(this.mDropDownAnchorView, this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset);
        this.mDropDownList.setSelection(-1);
        if (!this.mModal || this.mDropDownList.isInTouchMode()) {
            clearListSelection();
        }
        if (!this.mModal) {
            this.mHandler.post(this.mHideSelector);
        }
    }

    public void dismiss() {
        this.mPopup.dismiss();
        if (this.mPromptView != null) {
            ViewParent parent = this.mPromptView.getParent();
            if (parent instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) parent;
                group.removeView(this.mPromptView);
            }
        }
        this.mPopup.setContentView(null);
        this.mDropDownList = null;
        this.mHandler.removeCallbacks(this.mResizePopupRunnable);
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener listener) {
        this.mPopup.setOnDismissListener(listener);
    }

    public void setInputMethodMode(int mode) {
        this.mPopup.setInputMethodMode(mode);
    }

    public void setSelection(int position) {
        DropDownListView list = this.mDropDownList;
        if (!isShowing() || list == null) {
            return;
        }
        list.mListSelectionHidden = false;
        list.setSelection(position);
        if (list.getChoiceMode() != 0) {
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

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isInputMethodNotNeeded() {
        return this.mPopup.getInputMethodMode() == 2;
    }

    public ListView getListView() {
        return this.mDropDownList;
    }

    private int buildDropDown() {
        int otherHeights = 0;
        if (this.mDropDownList == null) {
            Context context = this.mContext;
            this.mDropDownList = new DropDownListView(context, !this.mModal);
            if (this.mDropDownListHighlight != null) {
                this.mDropDownList.setSelector(this.mDropDownListHighlight);
            }
            this.mDropDownList.setAdapter(this.mAdapter);
            this.mDropDownList.setOnItemClickListener(this.mItemClickListener);
            this.mDropDownList.setFocusable(true);
            this.mDropDownList.setFocusableInTouchMode(true);
            this.mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.actionbarsherlock.internal.widget.IcsListPopupWindow.1
                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    DropDownListView dropDownList;
                    if (position == -1 || (dropDownList = IcsListPopupWindow.this.mDropDownList) == null) {
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
            ViewGroup dropDownView = this.mDropDownList;
            View hintView = this.mPromptView;
            if (hintView != null) {
                LinearLayout hintContainer = new LinearLayout(context);
                hintContainer.setOrientation(1);
                LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(-1, 0, 1.0f);
                switch (this.mPromptPosition) {
                    case 0:
                        hintContainer.addView(hintView);
                        hintContainer.addView(dropDownView, hintParams);
                        break;
                    case 1:
                        hintContainer.addView(dropDownView, hintParams);
                        hintContainer.addView(hintView);
                        break;
                }
                int widthSpec = View.MeasureSpec.makeMeasureSpec(this.mDropDownWidth, Integer.MIN_VALUE);
                hintView.measure(widthSpec, 0);
                LinearLayout.LayoutParams hintParams2 = (LinearLayout.LayoutParams) hintView.getLayoutParams();
                otherHeights = hintView.getMeasuredHeight() + hintParams2.topMargin + hintParams2.bottomMargin;
                dropDownView = hintContainer;
            }
            this.mPopup.setContentView(dropDownView);
        } else {
            View view = this.mPromptView;
            if (view != null) {
                LinearLayout.LayoutParams hintParams3 = (LinearLayout.LayoutParams) view.getLayoutParams();
                otherHeights = view.getMeasuredHeight() + hintParams3.topMargin + hintParams3.bottomMargin;
            }
        }
        int padding = 0;
        Drawable background = this.mPopup.getBackground();
        if (background != null) {
            background.getPadding(this.mTempRect);
            padding = this.mTempRect.top + this.mTempRect.bottom;
            if (!this.mDropDownVerticalOffsetSet) {
                this.mDropDownVerticalOffset = -this.mTempRect.top;
            }
        }
        boolean ignoreBottomDecorations = this.mPopup.getInputMethodMode() == 2;
        int maxHeight = getMaxAvailableHeight(this.mDropDownAnchorView, this.mDropDownVerticalOffset, ignoreBottomDecorations);
        if (this.mDropDownHeight == -1) {
            return maxHeight + padding;
        }
        int listContent = measureHeightOfChildren(0, 0, -1, maxHeight - otherHeights, -1);
        if (listContent > 0) {
            otherHeights += padding;
        }
        return listContent + otherHeights;
    }

    private int getMaxAvailableHeight(View anchor, int yOffset, boolean ignoreBottomDecorations) {
        Rect displayFrame = new Rect();
        anchor.getWindowVisibleDisplayFrame(displayFrame);
        int[] anchorPos = new int[2];
        anchor.getLocationOnScreen(anchorPos);
        int bottomEdge = displayFrame.bottom;
        if (ignoreBottomDecorations) {
            Resources res = anchor.getContext().getResources();
            bottomEdge = res.getDisplayMetrics().heightPixels;
        }
        int distanceToBottom = (bottomEdge - (anchorPos[1] + anchor.getHeight())) - yOffset;
        int distanceToTop = (anchorPos[1] - displayFrame.top) + yOffset;
        int returnedHeight = Math.max(distanceToBottom, distanceToTop);
        if (this.mPopup.getBackground() != null) {
            this.mPopup.getBackground().getPadding(this.mTempRect);
            returnedHeight -= this.mTempRect.top + this.mTempRect.bottom;
        }
        return returnedHeight;
    }

    private int measureHeightOfChildren(int widthMeasureSpec, int startPosition, int endPosition, int maxHeight, int disallowPartialChildPosition) {
        ListAdapter adapter = this.mAdapter;
        if (adapter == null) {
            return this.mDropDownList.getListPaddingTop() + this.mDropDownList.getListPaddingBottom();
        }
        int returnedHeight = this.mDropDownList.getListPaddingTop() + this.mDropDownList.getListPaddingBottom();
        int dividerHeight = (this.mDropDownList.getDividerHeight() <= 0 || this.mDropDownList.getDivider() == null) ? 0 : this.mDropDownList.getDividerHeight();
        int prevHeightWithoutPartialChild = 0;
        int endPosition2 = endPosition == -1 ? adapter.getCount() - 1 : endPosition;
        int i = startPosition;
        while (i <= endPosition2) {
            View child = this.mAdapter.getView(i, null, this.mDropDownList);
            if (this.mDropDownList.getCacheColorHint() != 0) {
                child.setDrawingCacheBackgroundColor(this.mDropDownList.getCacheColorHint());
            }
            measureScrapChild(child, i, widthMeasureSpec);
            if (i > 0) {
                returnedHeight += dividerHeight;
            }
            returnedHeight += child.getMeasuredHeight();
            if (returnedHeight >= maxHeight) {
                return (disallowPartialChildPosition < 0 || i <= disallowPartialChildPosition || prevHeightWithoutPartialChild <= 0 || returnedHeight == maxHeight) ? maxHeight : prevHeightWithoutPartialChild;
            }
            if (disallowPartialChildPosition >= 0 && i >= disallowPartialChildPosition) {
                prevHeightWithoutPartialChild = returnedHeight;
            }
            i++;
        }
        return returnedHeight;
    }

    private void measureScrapChild(View child, int position, int widthMeasureSpec) {
        int childHeightSpec;
        AbsListView.LayoutParams p = (AbsListView.LayoutParams) child.getLayoutParams();
        if (p == null) {
            p = new AbsListView.LayoutParams(-1, -2, 0);
            child.setLayoutParams(p);
        }
        int childWidthSpec = ViewGroup.getChildMeasureSpec(widthMeasureSpec, this.mDropDownList.getPaddingLeft() + this.mDropDownList.getPaddingRight(), p.width);
        int lpHeight = p.height;
        if (lpHeight > 0) {
            childHeightSpec = View.MeasureSpec.makeMeasureSpec(lpHeight, 1073741824);
        } else {
            childHeightSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        }
        child.measure(childWidthSpec, childHeightSpec);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$DropDownListView.class */
    private static class DropDownListView extends ListView {
        private boolean mListSelectionHidden;
        private boolean mHijackFocus;

        public DropDownListView(Context context, boolean hijackFocus) {
            super(context, null, R.attr.dropDownListViewStyle);
            this.mHijackFocus = hijackFocus;
            setCacheColorHint(0);
        }

        @Override // android.view.View
        public boolean isInTouchMode() {
            return (this.mHijackFocus && this.mListSelectionHidden) || super.isInTouchMode();
        }

        @Override // android.view.View
        public boolean hasWindowFocus() {
            return this.mHijackFocus || super.hasWindowFocus();
        }

        @Override // android.view.View
        public boolean isFocused() {
            return this.mHijackFocus || super.isFocused();
        }

        @Override // android.view.ViewGroup, android.view.View
        public boolean hasFocus() {
            return this.mHijackFocus || super.hasFocus();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$PopupDataSetObserver.class */
    private class PopupDataSetObserver extends DataSetObserver {
        private PopupDataSetObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            if (IcsListPopupWindow.this.isShowing()) {
                IcsListPopupWindow.this.show();
            }
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            IcsListPopupWindow.this.dismiss();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$ListSelectorHider.class */
    private class ListSelectorHider implements Runnable {
        private ListSelectorHider() {
        }

        @Override // java.lang.Runnable
        public void run() {
            IcsListPopupWindow.this.clearListSelection();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$ResizePopupRunnable.class */
    private class ResizePopupRunnable implements Runnable {
        private ResizePopupRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (IcsListPopupWindow.this.mDropDownList != null && IcsListPopupWindow.this.mDropDownList.getCount() > IcsListPopupWindow.this.mDropDownList.getChildCount() && IcsListPopupWindow.this.mDropDownList.getChildCount() <= IcsListPopupWindow.this.mListItemExpandMaximum) {
                IcsListPopupWindow.this.mPopup.setInputMethodMode(2);
                IcsListPopupWindow.this.show();
            }
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$PopupTouchInterceptor.class */
    private class PopupTouchInterceptor implements View.OnTouchListener {
        private PopupTouchInterceptor() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            int action = event.getAction();
            int x = (int) event.getX();
            int y = (int) event.getY();
            if (action == 0 && IcsListPopupWindow.this.mPopup != null && IcsListPopupWindow.this.mPopup.isShowing() && x >= 0 && x < IcsListPopupWindow.this.mPopup.getWidth() && y >= 0 && y < IcsListPopupWindow.this.mPopup.getHeight()) {
                IcsListPopupWindow.this.mHandler.postDelayed(IcsListPopupWindow.this.mResizePopupRunnable, 250L);
                return false;
            }
            if (action == 1) {
                IcsListPopupWindow.this.mHandler.removeCallbacks(IcsListPopupWindow.this.mResizePopupRunnable);
                return false;
            }
            return false;
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsListPopupWindow$PopupScrollListener.class */
    private class PopupScrollListener implements AbsListView.OnScrollListener {
        private PopupScrollListener() {
        }

        @Override // android.widget.AbsListView.OnScrollListener
        public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        }

        @Override // android.widget.AbsListView.OnScrollListener
        public void onScrollStateChanged(AbsListView view, int scrollState) {
            if (scrollState == 1 && !IcsListPopupWindow.this.isInputMethodNotNeeded() && IcsListPopupWindow.this.mPopup.getContentView() != null) {
                IcsListPopupWindow.this.mHandler.removeCallbacks(IcsListPopupWindow.this.mResizePopupRunnable);
                IcsListPopupWindow.this.mResizePopupRunnable.run();
            }
        }
    }
}
