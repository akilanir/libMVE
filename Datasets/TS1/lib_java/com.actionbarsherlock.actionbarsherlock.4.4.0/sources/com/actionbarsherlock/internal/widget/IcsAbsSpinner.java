package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SpinnerAdapter;
import com.actionbarsherlock.internal.widget.IcsAdapterView;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsAbsSpinner.class */
public abstract class IcsAbsSpinner extends IcsAdapterView<SpinnerAdapter> {
    private static final boolean IS_HONEYCOMB;
    SpinnerAdapter mAdapter;
    int mHeightMeasureSpec;
    int mWidthMeasureSpec;
    boolean mBlockLayoutRequests;
    int mSelectionLeftPadding;
    int mSelectionTopPadding;
    int mSelectionRightPadding;
    int mSelectionBottomPadding;
    final Rect mSpinnerPadding;
    final RecycleBin mRecycler;
    private DataSetObserver mDataSetObserver;
    private Rect mTouchFrame;

    abstract void layout(int i, boolean z);

    static {
        IS_HONEYCOMB = Build.VERSION.SDK_INT >= 11;
    }

    public IcsAbsSpinner(Context context) {
        super(context);
        this.mSelectionLeftPadding = 0;
        this.mSelectionTopPadding = 0;
        this.mSelectionRightPadding = 0;
        this.mSelectionBottomPadding = 0;
        this.mSpinnerPadding = new Rect();
        this.mRecycler = new RecycleBin();
        initAbsSpinner();
    }

    public IcsAbsSpinner(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public IcsAbsSpinner(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mSelectionLeftPadding = 0;
        this.mSelectionTopPadding = 0;
        this.mSelectionRightPadding = 0;
        this.mSelectionBottomPadding = 0;
        this.mSpinnerPadding = new Rect();
        this.mRecycler = new RecycleBin();
        initAbsSpinner();
    }

    private void initAbsSpinner() {
        setFocusable(true);
        setWillNotDraw(false);
    }

    @Override // com.actionbarsherlock.internal.widget.IcsAdapterView
    public void setAdapter(SpinnerAdapter adapter) {
        if (null != this.mAdapter) {
            this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
            resetList();
        }
        this.mAdapter = adapter;
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        if (this.mAdapter != null) {
            this.mOldItemCount = this.mItemCount;
            this.mItemCount = this.mAdapter.getCount();
            checkFocus();
            this.mDataSetObserver = new IcsAdapterView.AdapterDataSetObserver();
            this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
            int position = this.mItemCount > 0 ? 0 : -1;
            setSelectedPositionInt(position);
            setNextSelectedPositionInt(position);
            if (this.mItemCount == 0) {
                checkSelectionChanged();
            }
        } else {
            checkFocus();
            resetList();
            checkSelectionChanged();
        }
        requestLayout();
    }

    void resetList() {
        this.mDataChanged = false;
        this.mNeedSync = false;
        removeAllViewsInLayout();
        this.mOldSelectedPosition = -1;
        this.mOldSelectedRowId = Long.MIN_VALUE;
        setSelectedPositionInt(-1);
        setNextSelectedPositionInt(-1);
        invalidate();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int heightSize;
        int widthSize;
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int mPaddingLeft = getPaddingLeft();
        int mPaddingTop = getPaddingTop();
        int mPaddingRight = getPaddingRight();
        int mPaddingBottom = getPaddingBottom();
        this.mSpinnerPadding.left = mPaddingLeft > this.mSelectionLeftPadding ? mPaddingLeft : this.mSelectionLeftPadding;
        this.mSpinnerPadding.top = mPaddingTop > this.mSelectionTopPadding ? mPaddingTop : this.mSelectionTopPadding;
        this.mSpinnerPadding.right = mPaddingRight > this.mSelectionRightPadding ? mPaddingRight : this.mSelectionRightPadding;
        this.mSpinnerPadding.bottom = mPaddingBottom > this.mSelectionBottomPadding ? mPaddingBottom : this.mSelectionBottomPadding;
        if (this.mDataChanged) {
            handleDataChanged();
        }
        int preferredHeight = 0;
        int preferredWidth = 0;
        boolean needsMeasuring = true;
        int selectedPosition = getSelectedItemPosition();
        if (selectedPosition >= 0 && this.mAdapter != null && selectedPosition < this.mAdapter.getCount()) {
            View view = this.mRecycler.get(selectedPosition);
            if (view == null) {
                view = this.mAdapter.getView(selectedPosition, null, this);
            }
            if (view != null) {
                this.mRecycler.put(selectedPosition, view);
            }
            if (view != null) {
                if (view.getLayoutParams() == null) {
                    this.mBlockLayoutRequests = true;
                    view.setLayoutParams(generateDefaultLayoutParams());
                    this.mBlockLayoutRequests = false;
                }
                measureChild(view, widthMeasureSpec, heightMeasureSpec);
                preferredHeight = getChildHeight(view) + this.mSpinnerPadding.top + this.mSpinnerPadding.bottom;
                preferredWidth = getChildWidth(view) + this.mSpinnerPadding.left + this.mSpinnerPadding.right;
                needsMeasuring = false;
            }
        }
        if (needsMeasuring) {
            preferredHeight = this.mSpinnerPadding.top + this.mSpinnerPadding.bottom;
            if (widthMode == 0) {
                preferredWidth = this.mSpinnerPadding.left + this.mSpinnerPadding.right;
            }
        }
        int preferredHeight2 = Math.max(preferredHeight, getSuggestedMinimumHeight());
        int preferredWidth2 = Math.max(preferredWidth, getSuggestedMinimumWidth());
        if (IS_HONEYCOMB) {
            heightSize = resolveSizeAndState(preferredHeight2, heightMeasureSpec, 0);
            widthSize = resolveSizeAndState(preferredWidth2, widthMeasureSpec, 0);
        } else {
            heightSize = resolveSize(preferredHeight2, heightMeasureSpec);
            widthSize = resolveSize(preferredWidth2, widthMeasureSpec);
        }
        setMeasuredDimension(widthSize, heightSize);
        this.mHeightMeasureSpec = heightMeasureSpec;
        this.mWidthMeasureSpec = widthMeasureSpec;
    }

    int getChildHeight(View child) {
        return child.getMeasuredHeight();
    }

    int getChildWidth(View child) {
        return child.getMeasuredWidth();
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new ViewGroup.LayoutParams(-1, -2);
    }

    void recycleAllViews() {
        int childCount = getChildCount();
        RecycleBin recycleBin = this.mRecycler;
        int position = this.mFirstPosition;
        for (int i = 0; i < childCount; i++) {
            View v = getChildAt(i);
            int index = position + i;
            recycleBin.put(index, v);
        }
    }

    public void setSelection(int position, boolean animate) {
        boolean shouldAnimate = animate && this.mFirstPosition <= position && position <= (this.mFirstPosition + getChildCount()) - 1;
        setSelectionInt(position, shouldAnimate);
    }

    @Override // com.actionbarsherlock.internal.widget.IcsAdapterView
    public void setSelection(int position) {
        setNextSelectedPositionInt(position);
        requestLayout();
        invalidate();
    }

    void setSelectionInt(int position, boolean animate) {
        if (position != this.mOldSelectedPosition) {
            this.mBlockLayoutRequests = true;
            int delta = position - this.mSelectedPosition;
            setNextSelectedPositionInt(position);
            layout(delta, animate);
            this.mBlockLayoutRequests = false;
        }
    }

    @Override // com.actionbarsherlock.internal.widget.IcsAdapterView
    public View getSelectedView() {
        if (this.mItemCount > 0 && this.mSelectedPosition >= 0) {
            return getChildAt(this.mSelectedPosition - this.mFirstPosition);
        }
        return null;
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (!this.mBlockLayoutRequests) {
            super.requestLayout();
        }
    }

    @Override // com.actionbarsherlock.internal.widget.IcsAdapterView
    public SpinnerAdapter getAdapter() {
        return this.mAdapter;
    }

    @Override // com.actionbarsherlock.internal.widget.IcsAdapterView
    public int getCount() {
        return this.mItemCount;
    }

    public int pointToPosition(int x, int y) {
        Rect frame = this.mTouchFrame;
        if (frame == null) {
            this.mTouchFrame = new Rect();
            frame = this.mTouchFrame;
        }
        int count = getChildCount();
        for (int i = count - 1; i >= 0; i--) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0) {
                child.getHitRect(frame);
                if (frame.contains(x, y)) {
                    return this.mFirstPosition + i;
                }
            }
        }
        return -1;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsAbsSpinner$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        long selectedId;
        int position;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.actionbarsherlock.internal.widget.IcsAbsSpinner.SavedState.1
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

        private SavedState(Parcel in) {
            super(in);
            this.selectedId = in.readLong();
            this.position = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeLong(this.selectedId);
            out.writeInt(this.position);
        }

        public String toString() {
            return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + this.selectedId + " position=" + this.position + "}";
        }
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.selectedId = getSelectedItemId();
        if (ss.selectedId >= 0) {
            ss.position = getSelectedItemPosition();
        } else {
            ss.position = -1;
        }
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        if (ss.selectedId >= 0) {
            this.mDataChanged = true;
            this.mNeedSync = true;
            this.mSyncRowId = ss.selectedId;
            this.mSyncPosition = ss.position;
            this.mSyncMode = 0;
            requestLayout();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsAbsSpinner$RecycleBin.class */
    class RecycleBin {
        private final SparseArray<View> mScrapHeap = new SparseArray<>();

        RecycleBin() {
        }

        public void put(int position, View v) {
            this.mScrapHeap.put(position, v);
        }

        View get(int position) {
            View result = this.mScrapHeap.get(position);
            if (result != null) {
                this.mScrapHeap.delete(position);
            }
            return result;
        }

        void clear() {
            SparseArray<View> scrapHeap = this.mScrapHeap;
            int count = scrapHeap.size();
            for (int i = 0; i < count; i++) {
                View view = scrapHeap.valueAt(i);
                if (view != null) {
                    IcsAbsSpinner.this.removeDetachedView(view, true);
                }
            }
            scrapHeap.clear();
        }
    }
}
