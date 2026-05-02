package com.mobeta.android.dslv;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Environment;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.Checkable;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView.class */
public class DragSortListView extends ListView {
    private View mFloatView;
    private Point mFloatLoc;
    private Point mTouchLoc;
    private int mFloatViewMid;
    private boolean mFloatViewOnMeasured;
    private DataSetObserver mObserver;
    private float mFloatAlpha;
    private float mCurrFloatAlpha;
    private int mFloatPos;
    private int mFirstExpPos;
    private int mSecondExpPos;
    private boolean mAnimate;
    private int mSrcPos;
    private int mDragDeltaX;
    private int mDragDeltaY;
    private int mOffsetX;
    private int mOffsetY;
    private DragListener mDragListener;
    private DropListener mDropListener;
    private RemoveListener mRemoveListener;
    private boolean mDragEnabled;
    private static final int IDLE = 0;
    private static final int REMOVING = 1;
    private static final int DROPPING = 2;
    private static final int STOPPED = 3;
    private static final int DRAGGING = 4;
    private int mDragState;
    private int mItemHeightCollapsed;
    private int mFloatViewHeight;
    private int mFloatViewHeightHalf;
    private int mWidthMeasureSpec;
    private View[] mSampleViewTypes;
    private DragScroller mDragScroller;
    private float mDragUpScrollStartFrac;
    private float mDragDownScrollStartFrac;
    private int mUpScrollStartY;
    private int mDownScrollStartY;
    private float mDownScrollStartYF;
    private float mUpScrollStartYF;
    private float mDragUpScrollHeight;
    private float mDragDownScrollHeight;
    private float mMaxScrollSpeed;
    private DragScrollProfile mScrollProfile;
    private int mX;
    private int mY;
    private int mLastX;
    private int mLastY;
    private int mDragStartY;
    public static final int DRAG_POS_X = 1;
    public static final int DRAG_NEG_X = 2;
    public static final int DRAG_POS_Y = 4;
    public static final int DRAG_NEG_Y = 8;
    private int mDragFlags;
    private boolean mLastCallWasIntercept;
    private boolean mInTouchEvent;
    private FloatViewManager mFloatViewManager;
    private MotionEvent mCancelEvent;
    private static final int NO_CANCEL = 0;
    private static final int ON_TOUCH_EVENT = 1;
    private static final int ON_INTERCEPT_TOUCH_EVENT = 2;
    private int mCancelMethod;
    private float mSlideRegionFrac;
    private float mSlideFrac;
    private AdapterWrapper mAdapterWrapper;
    private boolean mTrackDragSort;
    private DragSortTracker mDragSortTracker;
    private boolean mBlockLayoutRequests;
    private boolean mIgnoreTouchEvent;
    private static final int sCacheSize = 3;
    private HeightCache mChildHeightCache;
    private RemoveAnimator mRemoveAnimator;
    private LiftAnimator mLiftAnimator;
    private DropAnimator mDropAnimator;
    private boolean mUseRemoveVelocity;
    private float mRemoveVelocityX;
    private boolean mListViewIntercepted;
    private boolean mFloatViewInvalidated;

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DragListener.class */
    public interface DragListener {
        void drag(int i, int i2);
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DragScrollProfile.class */
    public interface DragScrollProfile {
        float getSpeed(float f, long j);
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DragSortListener.class */
    public interface DragSortListener extends DropListener, DragListener, RemoveListener {
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DropListener.class */
    public interface DropListener {
        void drop(int i, int i2);
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$FloatViewManager.class */
    public interface FloatViewManager {
        View onCreateFloatView(int i);

        void onDragFloatView(View view, Point point, Point point2);

        void onDestroyFloatView(View view);
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$RemoveListener.class */
    public interface RemoveListener {
        void remove(int i);
    }

    public DragSortListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mFloatLoc = new Point();
        this.mTouchLoc = new Point();
        this.mFloatViewOnMeasured = false;
        this.mFloatAlpha = 1.0f;
        this.mCurrFloatAlpha = 1.0f;
        this.mAnimate = false;
        this.mDragEnabled = true;
        this.mDragState = 0;
        this.mItemHeightCollapsed = 1;
        this.mWidthMeasureSpec = 0;
        this.mSampleViewTypes = new View[1];
        this.mDragUpScrollStartFrac = 0.33333334f;
        this.mDragDownScrollStartFrac = 0.33333334f;
        this.mMaxScrollSpeed = 0.5f;
        this.mScrollProfile = new DragScrollProfile() { // from class: com.mobeta.android.dslv.DragSortListView.1
            @Override // com.mobeta.android.dslv.DragSortListView.DragScrollProfile
            public float getSpeed(float w, long t) {
                return DragSortListView.this.mMaxScrollSpeed * w;
            }
        };
        this.mDragFlags = 0;
        this.mLastCallWasIntercept = false;
        this.mInTouchEvent = false;
        this.mFloatViewManager = null;
        this.mCancelMethod = 0;
        this.mSlideRegionFrac = 0.25f;
        this.mSlideFrac = 0.0f;
        this.mTrackDragSort = false;
        this.mBlockLayoutRequests = false;
        this.mIgnoreTouchEvent = false;
        this.mChildHeightCache = new HeightCache(3);
        this.mRemoveVelocityX = 0.0f;
        this.mListViewIntercepted = false;
        this.mFloatViewInvalidated = false;
        int removeAnimDuration = 150;
        int dropAnimDuration = 150;
        if (attrs != null) {
            TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.DragSortListView, 0, 0);
            this.mItemHeightCollapsed = Math.max(1, a.getDimensionPixelSize(R.styleable.DragSortListView_collapsed_height, 1));
            this.mTrackDragSort = a.getBoolean(R.styleable.DragSortListView_track_drag_sort, false);
            if (this.mTrackDragSort) {
                this.mDragSortTracker = new DragSortTracker();
            }
            this.mFloatAlpha = a.getFloat(R.styleable.DragSortListView_float_alpha, this.mFloatAlpha);
            this.mCurrFloatAlpha = this.mFloatAlpha;
            this.mDragEnabled = a.getBoolean(R.styleable.DragSortListView_drag_enabled, this.mDragEnabled);
            this.mSlideRegionFrac = Math.max(0.0f, Math.min(1.0f, 1.0f - a.getFloat(R.styleable.DragSortListView_slide_shuffle_speed, 0.75f)));
            this.mAnimate = this.mSlideRegionFrac > 0.0f;
            float frac = a.getFloat(R.styleable.DragSortListView_drag_scroll_start, this.mDragUpScrollStartFrac);
            setDragScrollStart(frac);
            this.mMaxScrollSpeed = a.getFloat(R.styleable.DragSortListView_max_drag_scroll_speed, this.mMaxScrollSpeed);
            removeAnimDuration = a.getInt(R.styleable.DragSortListView_remove_animation_duration, 150);
            dropAnimDuration = a.getInt(R.styleable.DragSortListView_drop_animation_duration, 150);
            boolean useDefault = a.getBoolean(R.styleable.DragSortListView_use_default_controller, true);
            if (useDefault) {
                boolean removeEnabled = a.getBoolean(R.styleable.DragSortListView_remove_enabled, false);
                int removeMode = a.getInt(R.styleable.DragSortListView_remove_mode, 1);
                boolean sortEnabled = a.getBoolean(R.styleable.DragSortListView_sort_enabled, true);
                int dragInitMode = a.getInt(R.styleable.DragSortListView_drag_start_mode, 0);
                int dragHandleId = a.getResourceId(R.styleable.DragSortListView_drag_handle_id, 0);
                int flingHandleId = a.getResourceId(R.styleable.DragSortListView_fling_handle_id, 0);
                int clickRemoveId = a.getResourceId(R.styleable.DragSortListView_click_remove_id, 0);
                int bgColor = a.getColor(R.styleable.DragSortListView_float_background_color, -16777216);
                DragSortController controller = new DragSortController(this, dragHandleId, dragInitMode, removeMode, clickRemoveId, flingHandleId);
                controller.setRemoveEnabled(removeEnabled);
                controller.setSortEnabled(sortEnabled);
                controller.setBackgroundColor(bgColor);
                this.mFloatViewManager = controller;
                setOnTouchListener(controller);
            }
            a.recycle();
        }
        this.mDragScroller = new DragScroller();
        if (removeAnimDuration > 0) {
            this.mRemoveAnimator = new RemoveAnimator(0.5f, removeAnimDuration);
        }
        if (dropAnimDuration > 0) {
            this.mDropAnimator = new DropAnimator(0.5f, dropAnimDuration);
        }
        this.mCancelEvent = MotionEvent.obtain(0L, 0L, 3, 0.0f, 0.0f, 0.0f, 0.0f, 0, 0.0f, 0.0f, 0, 0);
        this.mObserver = new DataSetObserver() { // from class: com.mobeta.android.dslv.DragSortListView.2
            private void cancel() {
                if (DragSortListView.this.mDragState == 4) {
                    DragSortListView.this.cancelDrag();
                }
            }

            @Override // android.database.DataSetObserver
            public void onChanged() {
                cancel();
            }

            @Override // android.database.DataSetObserver
            public void onInvalidated() {
                cancel();
            }
        };
    }

    public void setFloatAlpha(float alpha) {
        this.mCurrFloatAlpha = alpha;
    }

    public float getFloatAlpha() {
        return this.mCurrFloatAlpha;
    }

    public void setMaxScrollSpeed(float max) {
        this.mMaxScrollSpeed = max;
    }

    @Override // android.widget.AdapterView
    public void setAdapter(ListAdapter adapter) {
        if (adapter != null) {
            this.mAdapterWrapper = new AdapterWrapper(adapter);
            adapter.registerDataSetObserver(this.mObserver);
            if (adapter instanceof DropListener) {
                setDropListener((DropListener) adapter);
            }
            if (adapter instanceof DragListener) {
                setDragListener((DragListener) adapter);
            }
            if (adapter instanceof RemoveListener) {
                setRemoveListener((RemoveListener) adapter);
            }
        } else {
            this.mAdapterWrapper = null;
        }
        super.setAdapter((ListAdapter) this.mAdapterWrapper);
    }

    public ListAdapter getInputAdapter() {
        if (this.mAdapterWrapper == null) {
            return null;
        }
        return this.mAdapterWrapper.getAdapter();
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$AdapterWrapper.class */
    private class AdapterWrapper extends BaseAdapter {
        private ListAdapter mAdapter;

        public AdapterWrapper(ListAdapter adapter) {
            this.mAdapter = adapter;
            this.mAdapter.registerDataSetObserver(new DataSetObserver() { // from class: com.mobeta.android.dslv.DragSortListView.AdapterWrapper.1
                @Override // android.database.DataSetObserver
                public void onChanged() {
                    AdapterWrapper.this.notifyDataSetChanged();
                }

                @Override // android.database.DataSetObserver
                public void onInvalidated() {
                    AdapterWrapper.this.notifyDataSetInvalidated();
                }
            });
        }

        public ListAdapter getAdapter() {
            return this.mAdapter;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return this.mAdapter.getItemId(position);
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return this.mAdapter.getItem(position);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.mAdapter.getCount();
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean areAllItemsEnabled() {
            return this.mAdapter.areAllItemsEnabled();
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean isEnabled(int position) {
            return this.mAdapter.isEnabled(position);
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getItemViewType(int position) {
            return this.mAdapter.getItemViewType(position);
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public int getViewTypeCount() {
            return this.mAdapter.getViewTypeCount();
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public boolean hasStableIds() {
            return this.mAdapter.hasStableIds();
        }

        @Override // android.widget.BaseAdapter, android.widget.Adapter
        public boolean isEmpty() {
            return this.mAdapter.isEmpty();
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            DragSortItemView v;
            if (convertView != null) {
                v = (DragSortItemView) convertView;
                View oldChild = v.getChildAt(0);
                View child = this.mAdapter.getView(position, oldChild, DragSortListView.this);
                if (child != oldChild) {
                    if (oldChild != null) {
                        v.removeViewAt(0);
                    }
                    v.addView(child);
                }
            } else {
                View child2 = this.mAdapter.getView(position, null, DragSortListView.this);
                if (child2 instanceof Checkable) {
                    v = new DragSortItemViewCheckable(DragSortListView.this.getContext());
                } else {
                    v = new DragSortItemView(DragSortListView.this.getContext());
                }
                v.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
                v.addView(child2);
            }
            DragSortListView.this.adjustItem(position + DragSortListView.this.getHeaderViewsCount(), v, true);
            return v;
        }
    }

    private void drawDivider(int expPosition, Canvas canvas) {
        ViewGroup expItem;
        int b;
        int t;
        Drawable divider = getDivider();
        int dividerHeight = getDividerHeight();
        if (divider != null && dividerHeight != 0 && (expItem = (ViewGroup) getChildAt(expPosition - getFirstVisiblePosition())) != null) {
            int l = getPaddingLeft();
            int r = getWidth() - getPaddingRight();
            int childHeight = expItem.getChildAt(0).getHeight();
            if (expPosition > this.mSrcPos) {
                t = expItem.getTop() + childHeight;
                b = t + dividerHeight;
            } else {
                b = expItem.getBottom() - childHeight;
                t = b - dividerHeight;
            }
            canvas.save();
            canvas.clipRect(l, t, r, b);
            divider.setBounds(l, t, r, b);
            divider.draw(canvas);
            canvas.restore();
        }
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        float alphaMod;
        super.dispatchDraw(canvas);
        if (this.mDragState != 0) {
            if (this.mFirstExpPos != this.mSrcPos) {
                drawDivider(this.mFirstExpPos, canvas);
            }
            if (this.mSecondExpPos != this.mFirstExpPos && this.mSecondExpPos != this.mSrcPos) {
                drawDivider(this.mSecondExpPos, canvas);
            }
        }
        if (this.mFloatView != null) {
            int w = this.mFloatView.getWidth();
            int h = this.mFloatView.getHeight();
            int x = this.mFloatLoc.x;
            int width = getWidth();
            if (x < 0) {
                x = -x;
            }
            if (x < width) {
                float alphaMod2 = (width - x) / width;
                alphaMod = alphaMod2 * alphaMod2;
            } else {
                alphaMod = 0.0f;
            }
            int alpha = (int) (255.0f * this.mCurrFloatAlpha * alphaMod);
            canvas.save();
            canvas.translate(this.mFloatLoc.x, this.mFloatLoc.y);
            canvas.clipRect(0, 0, w, h);
            canvas.saveLayerAlpha(0.0f, 0.0f, w, h, alpha, 31);
            this.mFloatView.draw(canvas);
            canvas.restore();
            canvas.restore();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getItemHeight(int position) {
        View v = getChildAt(position - getFirstVisiblePosition());
        if (v != null) {
            return v.getHeight();
        }
        return calcItemHeight(position, getChildHeight(position));
    }

    private void printPosData() {
        Log.d("mobeta", "mSrcPos=" + this.mSrcPos + " mFirstExpPos=" + this.mFirstExpPos + " mSecondExpPos=" + this.mSecondExpPos);
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$HeightCache.class */
    private class HeightCache {
        private SparseIntArray mMap;
        private ArrayList<Integer> mOrder;
        private int mMaxSize;

        public HeightCache(int size) {
            this.mMap = new SparseIntArray(size);
            this.mOrder = new ArrayList<>(size);
            this.mMaxSize = size;
        }

        public void add(int position, int height) {
            int currHeight = this.mMap.get(position, -1);
            if (currHeight != height) {
                if (currHeight == -1) {
                    if (this.mMap.size() == this.mMaxSize) {
                        this.mMap.delete(this.mOrder.remove(0).intValue());
                    }
                } else {
                    this.mOrder.remove(Integer.valueOf(position));
                }
                this.mMap.put(position, height);
                this.mOrder.add(Integer.valueOf(position));
            }
        }

        public int get(int position) {
            return this.mMap.get(position, -1);
        }

        public void clear() {
            this.mMap.clear();
            this.mOrder.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getShuffleEdge(int position, int top) {
        int edge;
        int numHeaders = getHeaderViewsCount();
        int numFooters = getFooterViewsCount();
        if (position <= numHeaders || position >= getCount() - numFooters) {
            return top;
        }
        int divHeight = getDividerHeight();
        int maxBlankHeight = this.mFloatViewHeight - this.mItemHeightCollapsed;
        int childHeight = getChildHeight(position);
        int itemHeight = getItemHeight(position);
        int otop = top;
        if (this.mSecondExpPos <= this.mSrcPos) {
            if (position == this.mSecondExpPos && this.mFirstExpPos != this.mSecondExpPos) {
                if (position == this.mSrcPos) {
                    otop = (top + itemHeight) - this.mFloatViewHeight;
                } else {
                    int blankHeight = itemHeight - childHeight;
                    otop = (top + blankHeight) - maxBlankHeight;
                }
            } else if (position > this.mSecondExpPos && position <= this.mSrcPos) {
                otop = top - maxBlankHeight;
            }
        } else if (position > this.mSrcPos && position <= this.mFirstExpPos) {
            otop = top + maxBlankHeight;
        } else if (position == this.mSecondExpPos && this.mFirstExpPos != this.mSecondExpPos) {
            int blankHeight2 = itemHeight - childHeight;
            otop = top + blankHeight2;
        }
        if (position <= this.mSrcPos) {
            edge = otop + (((this.mFloatViewHeight - divHeight) - getChildHeight(position - 1)) / 2);
        } else {
            edge = otop + (((childHeight - divHeight) - this.mFloatViewHeight) / 2);
        }
        return edge;
    }

    private boolean updatePositions() {
        int edgeTop;
        int edgeBottom;
        int first = getFirstVisiblePosition();
        int startPos = this.mFirstExpPos;
        View startView = getChildAt(startPos - first);
        if (startView == null) {
            startPos = first + (getChildCount() / 2);
            startView = getChildAt(startPos - first);
        }
        int startTop = startView.getTop();
        int itemHeight = startView.getHeight();
        int edge = getShuffleEdge(startPos, startTop);
        int lastEdge = edge;
        int divHeight = getDividerHeight();
        int itemPos = startPos;
        int itemTop = startTop;
        if (this.mFloatViewMid < edge) {
            while (true) {
                if (itemPos < 0) {
                    break;
                }
                itemPos--;
                int itemHeight2 = getItemHeight(itemPos);
                if (itemPos == 0) {
                    edge = (itemTop - divHeight) - itemHeight2;
                    break;
                }
                itemTop -= itemHeight2 + divHeight;
                edge = getShuffleEdge(itemPos, itemTop);
                if (this.mFloatViewMid >= edge) {
                    break;
                }
                lastEdge = edge;
            }
        } else {
            int count = getCount();
            while (true) {
                if (itemPos >= count) {
                    break;
                }
                if (itemPos == count - 1) {
                    edge = itemTop + divHeight + itemHeight;
                    break;
                }
                itemTop += divHeight + itemHeight;
                itemHeight = getItemHeight(itemPos + 1);
                edge = getShuffleEdge(itemPos + 1, itemTop);
                if (this.mFloatViewMid < edge) {
                    break;
                }
                lastEdge = edge;
                itemPos++;
            }
        }
        int numHeaders = getHeaderViewsCount();
        int numFooters = getFooterViewsCount();
        boolean updated = false;
        int oldFirstExpPos = this.mFirstExpPos;
        int oldSecondExpPos = this.mSecondExpPos;
        float oldSlideFrac = this.mSlideFrac;
        if (this.mAnimate) {
            int edgeToEdge = Math.abs(edge - lastEdge);
            if (this.mFloatViewMid < edge) {
                edgeBottom = edge;
                edgeTop = lastEdge;
            } else {
                edgeTop = edge;
                edgeBottom = lastEdge;
            }
            int slideRgnHeight = (int) (0.5f * this.mSlideRegionFrac * edgeToEdge);
            float slideRgnHeightF = slideRgnHeight;
            int slideEdgeTop = edgeTop + slideRgnHeight;
            int slideEdgeBottom = edgeBottom - slideRgnHeight;
            if (this.mFloatViewMid < slideEdgeTop) {
                this.mFirstExpPos = itemPos - 1;
                this.mSecondExpPos = itemPos;
                this.mSlideFrac = (0.5f * (slideEdgeTop - this.mFloatViewMid)) / slideRgnHeightF;
            } else if (this.mFloatViewMid < slideEdgeBottom) {
                this.mFirstExpPos = itemPos;
                this.mSecondExpPos = itemPos;
            } else {
                this.mFirstExpPos = itemPos;
                this.mSecondExpPos = itemPos + 1;
                this.mSlideFrac = 0.5f * (1.0f + ((edgeBottom - this.mFloatViewMid) / slideRgnHeightF));
            }
        } else {
            this.mFirstExpPos = itemPos;
            this.mSecondExpPos = itemPos;
        }
        if (this.mFirstExpPos < numHeaders) {
            itemPos = numHeaders;
            this.mFirstExpPos = itemPos;
            this.mSecondExpPos = itemPos;
        } else if (this.mSecondExpPos >= getCount() - numFooters) {
            itemPos = (getCount() - numFooters) - 1;
            this.mFirstExpPos = itemPos;
            this.mSecondExpPos = itemPos;
        }
        if (this.mFirstExpPos != oldFirstExpPos || this.mSecondExpPos != oldSecondExpPos || this.mSlideFrac != oldSlideFrac) {
            updated = true;
        }
        if (itemPos != this.mFloatPos) {
            if (this.mDragListener != null) {
                this.mDragListener.drag(this.mFloatPos - numHeaders, itemPos - numHeaders);
            }
            this.mFloatPos = itemPos;
            updated = true;
        }
        return updated;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mTrackDragSort) {
            this.mDragSortTracker.appendState();
        }
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$SmoothAnimator.class */
    private class SmoothAnimator implements Runnable {
        protected long mStartTime;
        private float mDurationF;
        private float mAlpha;
        private float mA;
        private float mB;
        private float mC;
        private float mD;
        private boolean mCanceled;

        public SmoothAnimator(float smoothness, int duration) {
            this.mAlpha = smoothness;
            this.mDurationF = duration;
            float f = 1.0f / ((2.0f * this.mAlpha) * (1.0f - this.mAlpha));
            this.mD = f;
            this.mA = f;
            this.mB = this.mAlpha / (2.0f * (this.mAlpha - 1.0f));
            this.mC = 1.0f / (1.0f - this.mAlpha);
        }

        public float transform(float frac) {
            if (frac < this.mAlpha) {
                return this.mA * frac * frac;
            }
            if (frac < 1.0f - this.mAlpha) {
                return this.mB + (this.mC * frac);
            }
            return 1.0f - ((this.mD * (frac - 1.0f)) * (frac - 1.0f));
        }

        public void start() {
            this.mStartTime = SystemClock.uptimeMillis();
            this.mCanceled = false;
            onStart();
            DragSortListView.this.post(this);
        }

        public void cancel() {
            this.mCanceled = true;
        }

        public void onStart() {
        }

        public void onUpdate(float frac, float smoothFrac) {
        }

        public void onStop() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.mCanceled) {
                return;
            }
            float fraction = (SystemClock.uptimeMillis() - this.mStartTime) / this.mDurationF;
            if (fraction >= 1.0f) {
                onUpdate(1.0f, 1.0f);
                onStop();
            } else {
                onUpdate(fraction, transform(fraction));
                DragSortListView.this.post(this);
            }
        }
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$LiftAnimator.class */
    private class LiftAnimator extends SmoothAnimator {
        private float mInitDragDeltaY;
        private float mFinalDragDeltaY;

        public LiftAnimator(float smoothness, int duration) {
            super(smoothness, duration);
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onStart() {
            this.mInitDragDeltaY = DragSortListView.this.mDragDeltaY;
            this.mFinalDragDeltaY = DragSortListView.this.mFloatViewHeightHalf;
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onUpdate(float frac, float smoothFrac) {
            if (DragSortListView.this.mDragState != 4) {
                cancel();
                return;
            }
            DragSortListView.this.mDragDeltaY = (int) ((smoothFrac * this.mFinalDragDeltaY) + ((1.0f - smoothFrac) * this.mInitDragDeltaY));
            DragSortListView.this.mFloatLoc.y = DragSortListView.this.mY - DragSortListView.this.mDragDeltaY;
            DragSortListView.this.doDragFloatView(true);
        }
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DropAnimator.class */
    private class DropAnimator extends SmoothAnimator {
        private int mDropPos;
        private int srcPos;
        private float mInitDeltaY;
        private float mInitDeltaX;

        public DropAnimator(float smoothness, int duration) {
            super(smoothness, duration);
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onStart() {
            this.mDropPos = DragSortListView.this.mFloatPos;
            this.srcPos = DragSortListView.this.mSrcPos;
            DragSortListView.this.mDragState = 2;
            this.mInitDeltaY = DragSortListView.this.mFloatLoc.y - getTargetY();
            this.mInitDeltaX = DragSortListView.this.mFloatLoc.x - DragSortListView.this.getPaddingLeft();
        }

        private int getTargetY() {
            int first = DragSortListView.this.getFirstVisiblePosition();
            int otherAdjust = (DragSortListView.this.mItemHeightCollapsed + DragSortListView.this.getDividerHeight()) / 2;
            View v = DragSortListView.this.getChildAt(this.mDropPos - first);
            int targetY = -1;
            if (v != null) {
                if (this.mDropPos == this.srcPos) {
                    targetY = v.getTop();
                } else if (this.mDropPos >= this.srcPos) {
                    targetY = (v.getBottom() + otherAdjust) - DragSortListView.this.mFloatViewHeight;
                } else {
                    targetY = v.getTop() - otherAdjust;
                }
            } else {
                cancel();
            }
            return targetY;
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onUpdate(float frac, float smoothFrac) {
            int targetY = getTargetY();
            int targetX = DragSortListView.this.getPaddingLeft();
            float deltaY = DragSortListView.this.mFloatLoc.y - targetY;
            float deltaX = DragSortListView.this.mFloatLoc.x - targetX;
            float f = 1.0f - smoothFrac;
            if (f < Math.abs(deltaY / this.mInitDeltaY) || f < Math.abs(deltaX / this.mInitDeltaX)) {
                DragSortListView.this.mFloatLoc.y = targetY + ((int) (this.mInitDeltaY * f));
                DragSortListView.this.mFloatLoc.x = DragSortListView.this.getPaddingLeft() + ((int) (this.mInitDeltaX * f));
                DragSortListView.this.doDragFloatView(true);
            }
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onStop() {
            DragSortListView.this.dropFloatView();
        }
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$RemoveAnimator.class */
    private class RemoveAnimator extends SmoothAnimator {
        private float mFloatLocX;
        private float mFirstStartBlank;
        private float mSecondStartBlank;
        private int mFirstChildHeight;
        private int mSecondChildHeight;
        private int mFirstPos;
        private int mSecondPos;
        private int srcPos;

        public RemoveAnimator(float smoothness, int duration) {
            super(smoothness, duration);
            this.mFirstChildHeight = -1;
            this.mSecondChildHeight = -1;
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onStart() {
            this.mFirstChildHeight = -1;
            this.mSecondChildHeight = -1;
            this.mFirstPos = DragSortListView.this.mFirstExpPos;
            this.mSecondPos = DragSortListView.this.mSecondExpPos;
            this.srcPos = DragSortListView.this.mSrcPos;
            DragSortListView.this.mDragState = 1;
            this.mFloatLocX = DragSortListView.this.mFloatLoc.x;
            if (!DragSortListView.this.mUseRemoveVelocity) {
                DragSortListView.this.destroyFloatView();
                return;
            }
            float minVelocity = 2.0f * DragSortListView.this.getWidth();
            if (DragSortListView.this.mRemoveVelocityX == 0.0f) {
                DragSortListView.this.mRemoveVelocityX = (this.mFloatLocX < 0.0f ? -1 : 1) * minVelocity;
                return;
            }
            float minVelocity2 = minVelocity * 2.0f;
            if (DragSortListView.this.mRemoveVelocityX < 0.0f && DragSortListView.this.mRemoveVelocityX > (-minVelocity2)) {
                DragSortListView.this.mRemoveVelocityX = -minVelocity2;
            } else if (DragSortListView.this.mRemoveVelocityX > 0.0f && DragSortListView.this.mRemoveVelocityX < minVelocity2) {
                DragSortListView.this.mRemoveVelocityX = minVelocity2;
            }
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onUpdate(float frac, float smoothFrac) {
            View item;
            float f = 1.0f - smoothFrac;
            int firstVis = DragSortListView.this.getFirstVisiblePosition();
            View item2 = DragSortListView.this.getChildAt(this.mFirstPos - firstVis);
            if (DragSortListView.this.mUseRemoveVelocity) {
                float dt = (SystemClock.uptimeMillis() - this.mStartTime) / 1000.0f;
                if (dt != 0.0f) {
                    float dx = DragSortListView.this.mRemoveVelocityX * dt;
                    int w = DragSortListView.this.getWidth();
                    DragSortListView.this.mRemoveVelocityX += (DragSortListView.this.mRemoveVelocityX > 0.0f ? 1 : -1) * dt * w;
                    this.mFloatLocX += dx;
                    DragSortListView.this.mFloatLoc.x = (int) this.mFloatLocX;
                    if (this.mFloatLocX < w && this.mFloatLocX > (-w)) {
                        this.mStartTime = SystemClock.uptimeMillis();
                        DragSortListView.this.doDragFloatView(true);
                        return;
                    }
                } else {
                    return;
                }
            }
            if (item2 != null) {
                if (this.mFirstChildHeight == -1) {
                    this.mFirstChildHeight = DragSortListView.this.getChildHeight(this.mFirstPos, item2, false);
                    this.mFirstStartBlank = item2.getHeight() - this.mFirstChildHeight;
                }
                int blank = Math.max((int) (f * this.mFirstStartBlank), 1);
                ViewGroup.LayoutParams lp = item2.getLayoutParams();
                lp.height = this.mFirstChildHeight + blank;
                item2.setLayoutParams(lp);
            }
            if (this.mSecondPos != this.mFirstPos && (item = DragSortListView.this.getChildAt(this.mSecondPos - firstVis)) != null) {
                if (this.mSecondChildHeight == -1) {
                    this.mSecondChildHeight = DragSortListView.this.getChildHeight(this.mSecondPos, item, false);
                    this.mSecondStartBlank = item.getHeight() - this.mSecondChildHeight;
                }
                int blank2 = Math.max((int) (f * this.mSecondStartBlank), 1);
                ViewGroup.LayoutParams lp2 = item.getLayoutParams();
                lp2.height = this.mSecondChildHeight + blank2;
                item.setLayoutParams(lp2);
            }
        }

        @Override // com.mobeta.android.dslv.DragSortListView.SmoothAnimator
        public void onStop() {
            DragSortListView.this.doRemoveItem();
        }
    }

    public void removeItem(int which) {
        this.mUseRemoveVelocity = false;
        removeItem(which, 0.0f);
    }

    public void removeItem(int which, float velocityX) {
        if (this.mDragState == 0 || this.mDragState == 4) {
            if (this.mDragState == 0) {
                this.mSrcPos = getHeaderViewsCount() + which;
                this.mFirstExpPos = this.mSrcPos;
                this.mSecondExpPos = this.mSrcPos;
                this.mFloatPos = this.mSrcPos;
                View v = getChildAt(this.mSrcPos - getFirstVisiblePosition());
                if (v != null) {
                    v.setVisibility(4);
                }
            }
            this.mDragState = 1;
            this.mRemoveVelocityX = velocityX;
            if (this.mInTouchEvent) {
                switch (this.mCancelMethod) {
                    case 1:
                        super.onTouchEvent(this.mCancelEvent);
                        break;
                    case 2:
                        super.onInterceptTouchEvent(this.mCancelEvent);
                        break;
                }
            }
            if (this.mRemoveAnimator != null) {
                this.mRemoveAnimator.start();
            } else {
                doRemoveItem(which);
            }
        }
    }

    public void moveItem(int from, int to) {
        if (this.mDropListener != null) {
            int count = getInputAdapter().getCount();
            if (from >= 0 && from < count && to >= 0 && to < count) {
                this.mDropListener.drop(from, to);
            }
        }
    }

    public void cancelDrag() {
        if (this.mDragState == 4) {
            this.mDragScroller.stopScrolling(true);
            destroyFloatView();
            clearPositions();
            adjustAllItems();
            if (this.mInTouchEvent) {
                this.mDragState = 3;
            } else {
                this.mDragState = 0;
            }
        }
    }

    private void clearPositions() {
        this.mSrcPos = -1;
        this.mFirstExpPos = -1;
        this.mSecondExpPos = -1;
        this.mFloatPos = -1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dropFloatView() {
        this.mDragState = 2;
        if (this.mDropListener != null && this.mFloatPos >= 0 && this.mFloatPos < getCount()) {
            int numHeaders = getHeaderViewsCount();
            this.mDropListener.drop(this.mSrcPos - numHeaders, this.mFloatPos - numHeaders);
        }
        destroyFloatView();
        adjustOnReorder();
        clearPositions();
        adjustAllItems();
        if (this.mInTouchEvent) {
            this.mDragState = 3;
        } else {
            this.mDragState = 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doRemoveItem() {
        doRemoveItem(this.mSrcPos - getHeaderViewsCount());
    }

    private void doRemoveItem(int which) {
        this.mDragState = 1;
        if (this.mRemoveListener != null) {
            this.mRemoveListener.remove(which);
        }
        destroyFloatView();
        adjustOnReorder();
        clearPositions();
        if (this.mInTouchEvent) {
            this.mDragState = 3;
        } else {
            this.mDragState = 0;
        }
    }

    private void adjustOnReorder() {
        int firstPos = getFirstVisiblePosition();
        if (this.mSrcPos < firstPos) {
            View v = getChildAt(0);
            int top = 0;
            if (v != null) {
                top = v.getTop();
            }
            setSelectionFromTop(firstPos - 1, top - getPaddingTop());
        }
    }

    public boolean stopDrag(boolean remove) {
        this.mUseRemoveVelocity = false;
        return stopDrag(remove, 0.0f);
    }

    public boolean stopDragWithVelocity(boolean remove, float velocityX) {
        this.mUseRemoveVelocity = true;
        return stopDrag(remove, velocityX);
    }

    public boolean stopDrag(boolean remove, float velocityX) {
        if (this.mFloatView != null) {
            this.mDragScroller.stopScrolling(true);
            if (remove) {
                removeItem(this.mSrcPos - getHeaderViewsCount(), velocityX);
            } else if (this.mDropAnimator != null) {
                this.mDropAnimator.start();
            } else {
                dropFloatView();
            }
            if (this.mTrackDragSort) {
                this.mDragSortTracker.stopTracking();
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // android.widget.AbsListView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.mIgnoreTouchEvent) {
            this.mIgnoreTouchEvent = false;
            return false;
        }
        if (!this.mDragEnabled) {
            return super.onTouchEvent(ev);
        }
        boolean more = false;
        boolean lastCallWasIntercept = this.mLastCallWasIntercept;
        this.mLastCallWasIntercept = false;
        if (!lastCallWasIntercept) {
            saveTouchCoords(ev);
        }
        if (this.mDragState == 4) {
            onDragTouchEvent(ev);
            more = true;
        } else {
            if (this.mDragState == 0 && super.onTouchEvent(ev)) {
                more = true;
            }
            int action = ev.getAction() & 255;
            switch (action) {
                case 1:
                case 3:
                    doActionUpOrCancel();
                    break;
                default:
                    if (more) {
                        this.mCancelMethod = 1;
                        break;
                    }
                    break;
            }
        }
        return more;
    }

    private void doActionUpOrCancel() {
        this.mCancelMethod = 0;
        this.mInTouchEvent = false;
        if (this.mDragState == 3) {
            this.mDragState = 0;
        }
        this.mCurrFloatAlpha = this.mFloatAlpha;
        this.mListViewIntercepted = false;
        this.mChildHeightCache.clear();
    }

    private void saveTouchCoords(MotionEvent ev) {
        int action = ev.getAction() & 255;
        if (action != 0) {
            this.mLastX = this.mX;
            this.mLastY = this.mY;
        }
        this.mX = (int) ev.getX();
        this.mY = (int) ev.getY();
        if (action == 0) {
            this.mLastX = this.mX;
            this.mLastY = this.mY;
        }
        this.mOffsetX = ((int) ev.getRawX()) - this.mX;
        this.mOffsetY = ((int) ev.getRawY()) - this.mY;
    }

    public boolean listViewIntercepted() {
        return this.mListViewIntercepted;
    }

    @Override // android.widget.AbsListView, android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (!this.mDragEnabled) {
            return super.onInterceptTouchEvent(ev);
        }
        saveTouchCoords(ev);
        this.mLastCallWasIntercept = true;
        int action = ev.getAction() & 255;
        if (action == 0) {
            if (this.mDragState != 0) {
                this.mIgnoreTouchEvent = true;
                return true;
            }
            this.mInTouchEvent = true;
        }
        boolean intercept = false;
        if (this.mFloatView != null) {
            intercept = true;
        } else {
            if (super.onInterceptTouchEvent(ev)) {
                this.mListViewIntercepted = true;
                intercept = true;
            }
            switch (action) {
                case 1:
                case 3:
                    doActionUpOrCancel();
                    break;
                default:
                    if (intercept) {
                        this.mCancelMethod = 1;
                        break;
                    } else {
                        this.mCancelMethod = 2;
                        break;
                    }
            }
        }
        if (action == 1 || action == 3) {
            this.mInTouchEvent = false;
        }
        return intercept;
    }

    public void setDragScrollStart(float heightFraction) {
        setDragScrollStarts(heightFraction, heightFraction);
    }

    public void setDragScrollStarts(float upperFrac, float lowerFrac) {
        if (lowerFrac > 0.5f) {
            this.mDragDownScrollStartFrac = 0.5f;
        } else {
            this.mDragDownScrollStartFrac = lowerFrac;
        }
        if (upperFrac > 0.5f) {
            this.mDragUpScrollStartFrac = 0.5f;
        } else {
            this.mDragUpScrollStartFrac = upperFrac;
        }
        if (getHeight() != 0) {
            updateScrollStarts();
        }
    }

    private void continueDrag(int x, int y) {
        this.mFloatLoc.x = x - this.mDragDeltaX;
        this.mFloatLoc.y = y - this.mDragDeltaY;
        doDragFloatView(true);
        int minY = Math.min(y, this.mFloatViewMid + this.mFloatViewHeightHalf);
        int maxY = Math.max(y, this.mFloatViewMid - this.mFloatViewHeightHalf);
        int currentScrollDir = this.mDragScroller.getScrollDir();
        if (minY > this.mLastY && minY > this.mDownScrollStartY && currentScrollDir != 1) {
            if (currentScrollDir != -1) {
                this.mDragScroller.stopScrolling(true);
            }
            this.mDragScroller.startScrolling(1);
        } else if (maxY < this.mLastY && maxY < this.mUpScrollStartY && currentScrollDir != 0) {
            if (currentScrollDir != -1) {
                this.mDragScroller.stopScrolling(true);
            }
            this.mDragScroller.startScrolling(0);
        } else if (maxY >= this.mUpScrollStartY && minY <= this.mDownScrollStartY && this.mDragScroller.isScrolling()) {
            this.mDragScroller.stopScrolling(true);
        }
    }

    private void updateScrollStarts() {
        int padTop = getPaddingTop();
        int listHeight = (getHeight() - padTop) - getPaddingBottom();
        float heightF = listHeight;
        this.mUpScrollStartYF = padTop + (this.mDragUpScrollStartFrac * heightF);
        this.mDownScrollStartYF = padTop + ((1.0f - this.mDragDownScrollStartFrac) * heightF);
        this.mUpScrollStartY = (int) this.mUpScrollStartYF;
        this.mDownScrollStartY = (int) this.mDownScrollStartYF;
        this.mDragUpScrollHeight = this.mUpScrollStartYF - padTop;
        this.mDragDownScrollHeight = (padTop + listHeight) - this.mDownScrollStartYF;
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        updateScrollStarts();
    }

    private void adjustAllItems() {
        int first = getFirstVisiblePosition();
        int last = getLastVisiblePosition();
        int begin = Math.max(0, getHeaderViewsCount() - first);
        int end = Math.min(last - first, ((getCount() - 1) - getFooterViewsCount()) - first);
        for (int i = begin; i <= end; i++) {
            View v = getChildAt(i);
            if (v != null) {
                adjustItem(first + i, v, false);
            }
        }
    }

    private void adjustItem(int position) {
        View v = getChildAt(position - getFirstVisiblePosition());
        if (v != null) {
            adjustItem(position, v, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void adjustItem(int position, View v, boolean invalidChildHeight) {
        int height;
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (position != this.mSrcPos && position != this.mFirstExpPos && position != this.mSecondExpPos) {
            height = -2;
        } else {
            height = calcItemHeight(position, v, invalidChildHeight);
        }
        if (height != lp.height) {
            lp.height = height;
            v.setLayoutParams(lp);
        }
        if (position == this.mFirstExpPos || position == this.mSecondExpPos) {
            if (position < this.mSrcPos) {
                ((DragSortItemView) v).setGravity(80);
            } else if (position > this.mSrcPos) {
                ((DragSortItemView) v).setGravity(48);
            }
        }
        int oldVis = v.getVisibility();
        int vis = 0;
        if (position == this.mSrcPos && this.mFloatView != null) {
            vis = 4;
        }
        if (vis != oldVis) {
            v.setVisibility(vis);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getChildHeight(int position) {
        View v;
        if (position == this.mSrcPos) {
            return 0;
        }
        View v2 = getChildAt(position - getFirstVisiblePosition());
        if (v2 != null) {
            return getChildHeight(position, v2, false);
        }
        int childHeight = this.mChildHeightCache.get(position);
        if (childHeight != -1) {
            return childHeight;
        }
        ListAdapter adapter = getAdapter();
        int type = adapter.getItemViewType(position);
        int typeCount = adapter.getViewTypeCount();
        if (typeCount != this.mSampleViewTypes.length) {
            this.mSampleViewTypes = new View[typeCount];
        }
        if (type >= 0) {
            if (this.mSampleViewTypes[type] == null) {
                v = adapter.getView(position, null, this);
                this.mSampleViewTypes[type] = v;
            } else {
                v = adapter.getView(position, this.mSampleViewTypes[type], this);
            }
        } else {
            v = adapter.getView(position, null, this);
        }
        int childHeight2 = getChildHeight(position, v, true);
        this.mChildHeightCache.add(position, childHeight2);
        return childHeight2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getChildHeight(int position, View item, boolean invalidChildHeight) {
        View child;
        if (position == this.mSrcPos) {
            return 0;
        }
        if (position < getHeaderViewsCount() || position >= getCount() - getFooterViewsCount()) {
            child = item;
        } else {
            child = ((ViewGroup) item).getChildAt(0);
        }
        ViewGroup.LayoutParams lp = child.getLayoutParams();
        if (lp != null && lp.height > 0) {
            return lp.height;
        }
        int childHeight = child.getHeight();
        if (childHeight == 0 || invalidChildHeight) {
            measureItem(child);
            childHeight = child.getMeasuredHeight();
        }
        return childHeight;
    }

    private int calcItemHeight(int position, View item, boolean invalidChildHeight) {
        return calcItemHeight(position, getChildHeight(position, item, invalidChildHeight));
    }

    private int calcItemHeight(int position, int childHeight) {
        int height;
        getDividerHeight();
        boolean isSliding = this.mAnimate && this.mFirstExpPos != this.mSecondExpPos;
        int maxNonSrcBlankHeight = this.mFloatViewHeight - this.mItemHeightCollapsed;
        int slideHeight = (int) (this.mSlideFrac * maxNonSrcBlankHeight);
        if (position == this.mSrcPos) {
            if (this.mSrcPos == this.mFirstExpPos) {
                if (isSliding) {
                    height = slideHeight + this.mItemHeightCollapsed;
                } else {
                    height = this.mFloatViewHeight;
                }
            } else if (this.mSrcPos == this.mSecondExpPos) {
                height = this.mFloatViewHeight - slideHeight;
            } else {
                height = this.mItemHeightCollapsed;
            }
        } else if (position == this.mFirstExpPos) {
            if (isSliding) {
                height = childHeight + slideHeight;
            } else {
                height = childHeight + maxNonSrcBlankHeight;
            }
        } else if (position == this.mSecondExpPos) {
            height = (childHeight + maxNonSrcBlankHeight) - slideHeight;
        } else {
            height = childHeight;
        }
        return height;
    }

    @Override // android.widget.AbsListView, android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (!this.mBlockLayoutRequests) {
            super.requestLayout();
        }
    }

    private int adjustScroll(int movePos, View moveItem, int oldFirstExpPos, int oldSecondExpPos) {
        int adjust = 0;
        int childHeight = getChildHeight(movePos);
        int moveHeightBefore = moveItem.getHeight();
        int moveHeightAfter = calcItemHeight(movePos, childHeight);
        int moveBlankBefore = moveHeightBefore;
        int moveBlankAfter = moveHeightAfter;
        if (movePos != this.mSrcPos) {
            moveBlankBefore -= childHeight;
            moveBlankAfter -= childHeight;
        }
        int maxBlank = this.mFloatViewHeight;
        if (this.mSrcPos != this.mFirstExpPos && this.mSrcPos != this.mSecondExpPos) {
            maxBlank -= this.mItemHeightCollapsed;
        }
        if (movePos <= oldFirstExpPos) {
            if (movePos > this.mFirstExpPos) {
                adjust = 0 + (maxBlank - moveBlankAfter);
            }
        } else if (movePos == oldSecondExpPos) {
            adjust = movePos <= this.mFirstExpPos ? 0 + (moveBlankBefore - maxBlank) : movePos == this.mSecondExpPos ? 0 + (moveHeightBefore - moveHeightAfter) : 0 + moveBlankBefore;
        } else if (movePos <= this.mFirstExpPos) {
            adjust = 0 - maxBlank;
        } else if (movePos == this.mSecondExpPos) {
            adjust = 0 - moveBlankAfter;
        }
        return adjust;
    }

    private void measureItem(View item) {
        int hspec;
        ViewGroup.LayoutParams lp = item.getLayoutParams();
        if (lp == null) {
            lp = new AbsListView.LayoutParams(-1, -2);
            item.setLayoutParams(lp);
        }
        int wspec = ViewGroup.getChildMeasureSpec(this.mWidthMeasureSpec, getListPaddingLeft() + getListPaddingRight(), lp.width);
        if (lp.height > 0) {
            hspec = View.MeasureSpec.makeMeasureSpec(lp.height, 1073741824);
        } else {
            hspec = View.MeasureSpec.makeMeasureSpec(0, 0);
        }
        item.measure(wspec, hspec);
    }

    private void measureFloatView() {
        if (this.mFloatView != null) {
            measureItem(this.mFloatView);
            this.mFloatViewHeight = this.mFloatView.getMeasuredHeight();
            this.mFloatViewHeightHalf = this.mFloatViewHeight / 2;
        }
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (this.mFloatView != null) {
            if (this.mFloatView.isLayoutRequested()) {
                measureFloatView();
            }
            this.mFloatViewOnMeasured = true;
        }
        this.mWidthMeasureSpec = widthMeasureSpec;
    }

    @Override // android.widget.ListView, android.widget.AbsListView
    protected void layoutChildren() {
        super.layoutChildren();
        if (this.mFloatView != null) {
            if (this.mFloatView.isLayoutRequested() && !this.mFloatViewOnMeasured) {
                measureFloatView();
            }
            this.mFloatView.layout(0, 0, this.mFloatView.getMeasuredWidth(), this.mFloatView.getMeasuredHeight());
            this.mFloatViewOnMeasured = false;
        }
    }

    protected boolean onDragTouchEvent(MotionEvent ev) {
        int action = ev.getAction() & 255;
        switch (ev.getAction() & 255) {
            case 1:
                if (this.mDragState == 4) {
                    stopDrag(false);
                }
                doActionUpOrCancel();
                break;
            case 2:
                continueDrag((int) ev.getX(), (int) ev.getY());
                break;
            case 3:
                if (this.mDragState == 4) {
                    cancelDrag();
                }
                doActionUpOrCancel();
                break;
        }
        return true;
    }

    private void invalidateFloatView() {
        this.mFloatViewInvalidated = true;
    }

    public boolean startDrag(int position, int dragFlags, int deltaX, int deltaY) {
        View v;
        if (!this.mInTouchEvent || this.mFloatViewManager == null || (v = this.mFloatViewManager.onCreateFloatView(position)) == null) {
            return false;
        }
        return startDrag(position, v, dragFlags, deltaX, deltaY);
    }

    public boolean startDrag(int position, View floatView, int dragFlags, int deltaX, int deltaY) {
        if (this.mDragState != 0 || !this.mInTouchEvent || this.mFloatView != null || floatView == null || !this.mDragEnabled) {
            return false;
        }
        if (getParent() != null) {
            getParent().requestDisallowInterceptTouchEvent(true);
        }
        int pos = position + getHeaderViewsCount();
        this.mFirstExpPos = pos;
        this.mSecondExpPos = pos;
        this.mSrcPos = pos;
        this.mFloatPos = pos;
        this.mDragState = 4;
        this.mDragFlags = 0;
        this.mDragFlags |= dragFlags;
        this.mFloatView = floatView;
        measureFloatView();
        this.mDragDeltaX = deltaX;
        this.mDragDeltaY = deltaY;
        this.mDragStartY = this.mY;
        this.mFloatLoc.x = this.mX - this.mDragDeltaX;
        this.mFloatLoc.y = this.mY - this.mDragDeltaY;
        View srcItem = getChildAt(this.mSrcPos - getFirstVisiblePosition());
        if (srcItem != null) {
            srcItem.setVisibility(4);
        }
        if (this.mTrackDragSort) {
            this.mDragSortTracker.startTracking();
        }
        switch (this.mCancelMethod) {
            case 1:
                super.onTouchEvent(this.mCancelEvent);
                break;
            case 2:
                super.onInterceptTouchEvent(this.mCancelEvent);
                break;
        }
        requestLayout();
        if (this.mLiftAnimator != null) {
            this.mLiftAnimator.start();
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doDragFloatView(boolean forceInvalidate) {
        int movePos = getFirstVisiblePosition() + (getChildCount() / 2);
        View moveItem = getChildAt(getChildCount() / 2);
        if (moveItem == null) {
            return;
        }
        doDragFloatView(movePos, moveItem, forceInvalidate);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doDragFloatView(int movePos, View moveItem, boolean forceInvalidate) {
        this.mBlockLayoutRequests = true;
        updateFloatView();
        int oldFirstExpPos = this.mFirstExpPos;
        int oldSecondExpPos = this.mSecondExpPos;
        boolean updated = updatePositions();
        if (updated) {
            adjustAllItems();
            int scroll = adjustScroll(movePos, moveItem, oldFirstExpPos, oldSecondExpPos);
            setSelectionFromTop(movePos, (moveItem.getTop() + scroll) - getPaddingTop());
            layoutChildren();
        }
        if (updated || forceInvalidate) {
            invalidate();
        }
        this.mBlockLayoutRequests = false;
    }

    private void updateFloatView() {
        if (this.mFloatViewManager != null) {
            this.mTouchLoc.set(this.mX, this.mY);
            this.mFloatViewManager.onDragFloatView(this.mFloatView, this.mFloatLoc, this.mTouchLoc);
        }
        int floatX = this.mFloatLoc.x;
        int floatY = this.mFloatLoc.y;
        int padLeft = getPaddingLeft();
        if ((this.mDragFlags & 1) == 0 && floatX > padLeft) {
            this.mFloatLoc.x = padLeft;
        } else if ((this.mDragFlags & 2) == 0 && floatX < padLeft) {
            this.mFloatLoc.x = padLeft;
        }
        int numHeaders = getHeaderViewsCount();
        int numFooters = getFooterViewsCount();
        int firstPos = getFirstVisiblePosition();
        int lastPos = getLastVisiblePosition();
        int topLimit = getPaddingTop();
        if (firstPos < numHeaders) {
            topLimit = getChildAt((numHeaders - firstPos) - 1).getBottom();
        }
        if ((this.mDragFlags & 8) == 0 && firstPos <= this.mSrcPos) {
            topLimit = Math.max(getChildAt(this.mSrcPos - firstPos).getTop(), topLimit);
        }
        int bottomLimit = getHeight() - getPaddingBottom();
        if (lastPos >= (getCount() - numFooters) - 1) {
            bottomLimit = getChildAt(((getCount() - numFooters) - 1) - firstPos).getBottom();
        }
        if ((this.mDragFlags & 4) == 0 && lastPos >= this.mSrcPos) {
            bottomLimit = Math.min(getChildAt(this.mSrcPos - firstPos).getBottom(), bottomLimit);
        }
        if (floatY < topLimit) {
            this.mFloatLoc.y = topLimit;
        } else if (floatY + this.mFloatViewHeight > bottomLimit) {
            this.mFloatLoc.y = bottomLimit - this.mFloatViewHeight;
        }
        this.mFloatViewMid = this.mFloatLoc.y + this.mFloatViewHeightHalf;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void destroyFloatView() {
        if (this.mFloatView != null) {
            this.mFloatView.setVisibility(8);
            if (this.mFloatViewManager != null) {
                this.mFloatViewManager.onDestroyFloatView(this.mFloatView);
            }
            this.mFloatView = null;
            invalidate();
        }
    }

    public void setFloatViewManager(FloatViewManager manager) {
        this.mFloatViewManager = manager;
    }

    public void setDragListener(DragListener l) {
        this.mDragListener = l;
    }

    public void setDragEnabled(boolean enabled) {
        this.mDragEnabled = enabled;
    }

    public boolean isDragEnabled() {
        return this.mDragEnabled;
    }

    public void setDropListener(DropListener l) {
        this.mDropListener = l;
    }

    public void setRemoveListener(RemoveListener l) {
        this.mRemoveListener = l;
    }

    public void setDragSortListener(DragSortListener l) {
        setDropListener(l);
        setDragListener(l);
        setRemoveListener(l);
    }

    public void setDragScrollProfile(DragScrollProfile ssp) {
        if (ssp != null) {
            this.mScrollProfile = ssp;
        }
    }

    public void moveCheckState(int from, int to) {
        SparseBooleanArray cip = getCheckedItemPositions();
        int rangeStart = from;
        int rangeEnd = to;
        if (to < from) {
            rangeStart = to;
            rangeEnd = from;
        }
        int rangeEnd2 = rangeEnd + 1;
        int[] runStart = new int[cip.size()];
        int[] runEnd = new int[cip.size()];
        int runCount = buildRunList(cip, rangeStart, rangeEnd2, runStart, runEnd);
        if (runCount == 1 && runStart[0] == runEnd[0]) {
            return;
        }
        if (from < to) {
            for (int i = 0; i != runCount; i++) {
                setItemChecked(rotate(runStart[i], -1, rangeStart, rangeEnd2), true);
                setItemChecked(rotate(runEnd[i], -1, rangeStart, rangeEnd2), false);
            }
            return;
        }
        for (int i2 = 0; i2 != runCount; i2++) {
            setItemChecked(runStart[i2], false);
            setItemChecked(runEnd[i2], true);
        }
    }

    public void removeCheckState(int position) {
        SparseBooleanArray cip = getCheckedItemPositions();
        if (cip.size() == 0) {
            return;
        }
        int[] runStart = new int[cip.size()];
        int[] runEnd = new int[cip.size()];
        int rangeEnd = cip.keyAt(cip.size() - 1) + 1;
        int runCount = buildRunList(cip, position, rangeEnd, runStart, runEnd);
        for (int i = 0; i != runCount; i++) {
            if (runStart[i] != position && (runEnd[i] >= runStart[i] || runEnd[i] <= position)) {
                setItemChecked(rotate(runStart[i], -1, position, rangeEnd), true);
            }
            setItemChecked(rotate(runEnd[i], -1, position, rangeEnd), false);
        }
    }

    private static int buildRunList(SparseBooleanArray cip, int rangeStart, int rangeEnd, int[] runStart, int[] runEnd) {
        int position;
        int runCount = 0;
        int i = findFirstSetIndex(cip, rangeStart, rangeEnd);
        if (i == -1) {
            return 0;
        }
        int currentRunStart = cip.keyAt(i);
        int currentRunEnd = currentRunStart + 1;
        while (true) {
            i++;
            if (i >= cip.size() || (position = cip.keyAt(i)) >= rangeEnd) {
                break;
            }
            if (cip.valueAt(i)) {
                if (position == currentRunEnd) {
                    currentRunEnd++;
                } else {
                    runStart[runCount] = currentRunStart;
                    runEnd[runCount] = currentRunEnd;
                    runCount++;
                    currentRunStart = position;
                    currentRunEnd = position + 1;
                }
            }
        }
        if (currentRunEnd == rangeEnd) {
            currentRunEnd = rangeStart;
        }
        runStart[runCount] = currentRunStart;
        runEnd[runCount] = currentRunEnd;
        int runCount2 = runCount + 1;
        if (runCount2 > 1 && runStart[0] == rangeStart && runEnd[runCount2 - 1] == rangeStart) {
            runStart[0] = runStart[runCount2 - 1];
            runCount2--;
        }
        return runCount2;
    }

    private static int rotate(int value, int offset, int lowerBound, int upperBound) {
        int windowSize = upperBound - lowerBound;
        int value2 = value + offset;
        if (value2 < lowerBound) {
            value2 += windowSize;
        } else if (value2 >= upperBound) {
            value2 -= windowSize;
        }
        return value2;
    }

    private static int findFirstSetIndex(SparseBooleanArray sba, int rangeStart, int rangeEnd) {
        int size = sba.size();
        int i = insertionIndexForKey(sba, rangeStart);
        while (i < size && sba.keyAt(i) < rangeEnd && !sba.valueAt(i)) {
            i++;
        }
        if (i == size || sba.keyAt(i) >= rangeEnd) {
            return -1;
        }
        return i;
    }

    private static int insertionIndexForKey(SparseBooleanArray sba, int key) {
        int low = 0;
        int high = sba.size();
        while (high - low > 0) {
            int middle = (low + high) >> 1;
            if (sba.keyAt(middle) < key) {
                low = middle + 1;
            } else {
                high = middle;
            }
        }
        return low;
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DragScroller.class */
    private class DragScroller implements Runnable {
        private boolean mAbort;
        private long mPrevTime;
        private long mCurrTime;
        private int dy;
        private float dt;
        private long tStart;
        private int scrollDir;
        public static final int STOP = -1;
        public static final int UP = 0;
        public static final int DOWN = 1;
        private float mScrollSpeed;
        private boolean mScrolling = false;
        private int mLastHeader;
        private int mFirstFooter;

        public boolean isScrolling() {
            return this.mScrolling;
        }

        public int getScrollDir() {
            if (this.mScrolling) {
                return this.scrollDir;
            }
            return -1;
        }

        public DragScroller() {
        }

        public void startScrolling(int dir) {
            if (!this.mScrolling) {
                this.mAbort = false;
                this.mScrolling = true;
                this.tStart = SystemClock.uptimeMillis();
                this.mPrevTime = this.tStart;
                this.scrollDir = dir;
                DragSortListView.this.post(this);
            }
        }

        public void stopScrolling(boolean now) {
            if (now) {
                DragSortListView.this.removeCallbacks(this);
                this.mScrolling = false;
            } else {
                this.mAbort = true;
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            int movePos;
            if (this.mAbort) {
                this.mScrolling = false;
                return;
            }
            int first = DragSortListView.this.getFirstVisiblePosition();
            int last = DragSortListView.this.getLastVisiblePosition();
            int count = DragSortListView.this.getCount();
            int padTop = DragSortListView.this.getPaddingTop();
            int listHeight = (DragSortListView.this.getHeight() - padTop) - DragSortListView.this.getPaddingBottom();
            int minY = Math.min(DragSortListView.this.mY, DragSortListView.this.mFloatViewMid + DragSortListView.this.mFloatViewHeightHalf);
            int maxY = Math.max(DragSortListView.this.mY, DragSortListView.this.mFloatViewMid - DragSortListView.this.mFloatViewHeightHalf);
            if (this.scrollDir == 0) {
                View v = DragSortListView.this.getChildAt(0);
                if (v == null) {
                    this.mScrolling = false;
                    return;
                } else {
                    if (first == 0 && v.getTop() == padTop) {
                        this.mScrolling = false;
                        return;
                    }
                    this.mScrollSpeed = DragSortListView.this.mScrollProfile.getSpeed((DragSortListView.this.mUpScrollStartYF - maxY) / DragSortListView.this.mDragUpScrollHeight, this.mPrevTime);
                }
            } else {
                View v2 = DragSortListView.this.getChildAt(last - first);
                if (v2 == null) {
                    this.mScrolling = false;
                    return;
                } else {
                    if (last == count - 1 && v2.getBottom() <= listHeight + padTop) {
                        this.mScrolling = false;
                        return;
                    }
                    this.mScrollSpeed = -DragSortListView.this.mScrollProfile.getSpeed((minY - DragSortListView.this.mDownScrollStartYF) / DragSortListView.this.mDragDownScrollHeight, this.mPrevTime);
                }
            }
            this.mCurrTime = SystemClock.uptimeMillis();
            this.dt = this.mCurrTime - this.mPrevTime;
            this.dy = Math.round(this.mScrollSpeed * this.dt);
            if (this.dy >= 0) {
                this.dy = Math.min(listHeight, this.dy);
                movePos = first;
            } else {
                this.dy = Math.max(-listHeight, this.dy);
                movePos = last;
            }
            View moveItem = DragSortListView.this.getChildAt(movePos - first);
            int top = moveItem.getTop() + this.dy;
            if (movePos == 0 && top > padTop) {
                top = padTop;
            }
            DragSortListView.this.mBlockLayoutRequests = true;
            DragSortListView.this.setSelectionFromTop(movePos, top - padTop);
            DragSortListView.this.layoutChildren();
            DragSortListView.this.invalidate();
            DragSortListView.this.mBlockLayoutRequests = false;
            DragSortListView.this.doDragFloatView(movePos, moveItem, false);
            this.mPrevTime = this.mCurrTime;
            DragSortListView.this.post(this);
        }
    }

    /* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortListView$DragSortTracker.class */
    private class DragSortTracker {
        File mFile;
        StringBuilder mBuilder = new StringBuilder();
        private int mNumInBuffer = 0;
        private int mNumFlushes = 0;
        private boolean mTracking = false;

        public DragSortTracker() {
            File root = Environment.getExternalStorageDirectory();
            this.mFile = new File(root, "dslv_state.txt");
            if (!this.mFile.exists()) {
                try {
                    this.mFile.createNewFile();
                    Log.d("mobeta", "file created");
                } catch (IOException e) {
                    Log.w("mobeta", "Could not create dslv_state.txt");
                    Log.d("mobeta", e.getMessage());
                }
            }
        }

        public void startTracking() {
            this.mBuilder.append("<DSLVStates>\n");
            this.mNumFlushes = 0;
            this.mTracking = true;
        }

        public void appendState() {
            if (!this.mTracking) {
                return;
            }
            this.mBuilder.append("<DSLVState>\n");
            int children = DragSortListView.this.getChildCount();
            int first = DragSortListView.this.getFirstVisiblePosition();
            this.mBuilder.append("    <Positions>");
            for (int i = 0; i < children; i++) {
                this.mBuilder.append(first + i).append(",");
            }
            this.mBuilder.append("</Positions>\n");
            this.mBuilder.append("    <Tops>");
            for (int i2 = 0; i2 < children; i2++) {
                this.mBuilder.append(DragSortListView.this.getChildAt(i2).getTop()).append(",");
            }
            this.mBuilder.append("</Tops>\n");
            this.mBuilder.append("    <Bottoms>");
            for (int i3 = 0; i3 < children; i3++) {
                this.mBuilder.append(DragSortListView.this.getChildAt(i3).getBottom()).append(",");
            }
            this.mBuilder.append("</Bottoms>\n");
            this.mBuilder.append("    <FirstExpPos>").append(DragSortListView.this.mFirstExpPos).append("</FirstExpPos>\n");
            this.mBuilder.append("    <FirstExpBlankHeight>").append(DragSortListView.this.getItemHeight(DragSortListView.this.mFirstExpPos) - DragSortListView.this.getChildHeight(DragSortListView.this.mFirstExpPos)).append("</FirstExpBlankHeight>\n");
            this.mBuilder.append("    <SecondExpPos>").append(DragSortListView.this.mSecondExpPos).append("</SecondExpPos>\n");
            this.mBuilder.append("    <SecondExpBlankHeight>").append(DragSortListView.this.getItemHeight(DragSortListView.this.mSecondExpPos) - DragSortListView.this.getChildHeight(DragSortListView.this.mSecondExpPos)).append("</SecondExpBlankHeight>\n");
            this.mBuilder.append("    <SrcPos>").append(DragSortListView.this.mSrcPos).append("</SrcPos>\n");
            this.mBuilder.append("    <SrcHeight>").append(DragSortListView.this.mFloatViewHeight + DragSortListView.this.getDividerHeight()).append("</SrcHeight>\n");
            this.mBuilder.append("    <ViewHeight>").append(DragSortListView.this.getHeight()).append("</ViewHeight>\n");
            this.mBuilder.append("    <LastY>").append(DragSortListView.this.mLastY).append("</LastY>\n");
            this.mBuilder.append("    <FloatY>").append(DragSortListView.this.mFloatViewMid).append("</FloatY>\n");
            this.mBuilder.append("    <ShuffleEdges>");
            for (int i4 = 0; i4 < children; i4++) {
                this.mBuilder.append(DragSortListView.this.getShuffleEdge(first + i4, DragSortListView.this.getChildAt(i4).getTop())).append(",");
            }
            this.mBuilder.append("</ShuffleEdges>\n");
            this.mBuilder.append("</DSLVState>\n");
            this.mNumInBuffer++;
            if (this.mNumInBuffer > 1000) {
                flush();
                this.mNumInBuffer = 0;
            }
        }

        public void flush() {
            if (!this.mTracking) {
                return;
            }
            try {
                boolean append = true;
                if (this.mNumFlushes == 0) {
                    append = false;
                }
                FileWriter writer = new FileWriter(this.mFile, append);
                writer.write(this.mBuilder.toString());
                this.mBuilder.delete(0, this.mBuilder.length());
                writer.flush();
                writer.close();
                this.mNumFlushes++;
            } catch (IOException e) {
            }
        }

        public void stopTracking() {
            if (this.mTracking) {
                this.mBuilder.append("</DSLVStates>\n");
                flush();
                this.mTracking = false;
            }
        }
    }
}
