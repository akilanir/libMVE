package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.v7.gridlayout.R;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout.class */
public class GridLayout extends ViewGroup {
    public static final int HORIZONTAL = 0;
    public static final int VERTICAL = 1;
    public static final int UNDEFINED = Integer.MIN_VALUE;
    public static final int ALIGN_BOUNDS = 0;
    public static final int ALIGN_MARGINS = 1;
    static final boolean DEBUG = false;
    static final int MAX_SIZE = 100000;
    static final int DEFAULT_CONTAINER_MARGIN = 0;
    static final int UNINITIALIZED_HASH = 0;
    private static final int DEFAULT_ORIENTATION = 0;
    private static final int DEFAULT_COUNT = Integer.MIN_VALUE;
    private static final boolean DEFAULT_USE_DEFAULT_MARGINS = false;
    private static final boolean DEFAULT_ORDER_PRESERVED = true;
    private static final int DEFAULT_ALIGNMENT_MODE = 1;
    private static final int ORIENTATION = 0;
    private static final int ROW_COUNT = 1;
    private static final int COLUMN_COUNT = 2;
    private static final int USE_DEFAULT_MARGINS = 3;
    private static final int ALIGNMENT_MODE = 4;
    private static final int ROW_ORDER_PRESERVED = 5;
    private static final int COLUMN_ORDER_PRESERVED = 6;
    final Axis horizontalAxis;
    final Axis verticalAxis;
    boolean layoutParamsValid;
    int orientation;
    boolean useDefaultMargins;
    int alignmentMode;
    int defaultGap;
    int lastLayoutParamsHashCode;
    private static final int INFLEXIBLE = 0;
    private static final int CAN_STRETCH = 2;
    static final String TAG = GridLayout.class.getName();
    static final Alignment UNDEFINED_ALIGNMENT = new Alignment() { // from class: android.support.v7.widget.GridLayout.1
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return Integer.MIN_VALUE;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            return Integer.MIN_VALUE;
        }
    };
    private static final Alignment LEADING = new Alignment() { // from class: android.support.v7.widget.GridLayout.2
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return 0;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            return 0;
        }
    };
    private static final Alignment TRAILING = new Alignment() { // from class: android.support.v7.widget.GridLayout.3
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return cellDelta;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            return viewSize;
        }
    };
    public static final Alignment TOP = LEADING;
    public static final Alignment BOTTOM = TRAILING;
    public static final Alignment START = LEADING;
    public static final Alignment END = TRAILING;
    public static final Alignment LEFT = createSwitchingAlignment(START, END);
    public static final Alignment RIGHT = createSwitchingAlignment(END, START);
    public static final Alignment CENTER = new Alignment() { // from class: android.support.v7.widget.GridLayout.5
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return cellDelta >> 1;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            return viewSize >> 1;
        }
    };
    public static final Alignment BASELINE = new Alignment() { // from class: android.support.v7.widget.GridLayout.6
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return 0;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            int baseline = view.getBaseline();
            if (baseline == -1) {
                return Integer.MIN_VALUE;
            }
            return baseline;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public Bounds getBounds() {
            return new Bounds() { // from class: android.support.v7.widget.GridLayout.6.1
                private int size;

                @Override // android.support.v7.widget.GridLayout.Bounds
                protected void reset() {
                    super.reset();
                    this.size = Integer.MIN_VALUE;
                }

                @Override // android.support.v7.widget.GridLayout.Bounds
                protected void include(int before, int after) {
                    super.include(before, after);
                    this.size = Math.max(this.size, before + after);
                }

                @Override // android.support.v7.widget.GridLayout.Bounds
                protected int size(boolean min) {
                    return Math.max(super.size(min), this.size);
                }

                @Override // android.support.v7.widget.GridLayout.Bounds
                protected int getOffset(View c, Alignment alignment, int size) {
                    return Math.max(0, super.getOffset(c, alignment, size));
                }
            };
        }
    };
    public static final Alignment FILL = new Alignment() { // from class: android.support.v7.widget.GridLayout.7
        @Override // android.support.v7.widget.GridLayout.Alignment
        int getGravityOffset(View view, int cellDelta) {
            return 0;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getAlignmentValue(View view, int viewSize) {
            return Integer.MIN_VALUE;
        }

        @Override // android.support.v7.widget.GridLayout.Alignment
        public int getSizeInCell(View view, int viewSize, int cellSize) {
            return cellSize;
        }
    };

    public GridLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.horizontalAxis = new Axis(true);
        this.verticalAxis = new Axis(false);
        this.layoutParamsValid = false;
        this.orientation = 0;
        this.useDefaultMargins = false;
        this.alignmentMode = 1;
        this.lastLayoutParamsHashCode = 0;
        this.defaultGap = context.getResources().getDimensionPixelOffset(R.dimen.default_gap);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GridLayout);
        try {
            setRowCount(a.getInt(1, Integer.MIN_VALUE));
            setColumnCount(a.getInt(2, Integer.MIN_VALUE));
            setOrientation(a.getInt(0, 0));
            setUseDefaultMargins(a.getBoolean(USE_DEFAULT_MARGINS, false));
            setAlignmentMode(a.getInt(ALIGNMENT_MODE, 1));
            setRowOrderPreserved(a.getBoolean(ROW_ORDER_PRESERVED, true));
            setColumnOrderPreserved(a.getBoolean(COLUMN_ORDER_PRESERVED, true));
            a.recycle();
        } catch (Throwable th) {
            a.recycle();
            throw th;
        }
    }

    public GridLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public GridLayout(Context context) {
        this(context, null);
    }

    public int getOrientation() {
        return this.orientation;
    }

    public void setOrientation(int orientation) {
        if (this.orientation != orientation) {
            this.orientation = orientation;
            invalidateStructure();
            requestLayout();
        }
    }

    public int getRowCount() {
        return this.verticalAxis.getCount();
    }

    public void setRowCount(int rowCount) {
        this.verticalAxis.setCount(rowCount);
        invalidateStructure();
        requestLayout();
    }

    public int getColumnCount() {
        return this.horizontalAxis.getCount();
    }

    public void setColumnCount(int columnCount) {
        this.horizontalAxis.setCount(columnCount);
        invalidateStructure();
        requestLayout();
    }

    public boolean getUseDefaultMargins() {
        return this.useDefaultMargins;
    }

    public void setUseDefaultMargins(boolean useDefaultMargins) {
        this.useDefaultMargins = useDefaultMargins;
        requestLayout();
    }

    public int getAlignmentMode() {
        return this.alignmentMode;
    }

    public void setAlignmentMode(int alignmentMode) {
        this.alignmentMode = alignmentMode;
        requestLayout();
    }

    public boolean isRowOrderPreserved() {
        return this.verticalAxis.isOrderPreserved();
    }

    public void setRowOrderPreserved(boolean rowOrderPreserved) {
        this.verticalAxis.setOrderPreserved(rowOrderPreserved);
        invalidateStructure();
        requestLayout();
    }

    public boolean isColumnOrderPreserved() {
        return this.horizontalAxis.isOrderPreserved();
    }

    public void setColumnOrderPreserved(boolean columnOrderPreserved) {
        this.horizontalAxis.setOrderPreserved(columnOrderPreserved);
        invalidateStructure();
        requestLayout();
    }

    static int max2(int[] a, int valueIfEmpty) {
        int result = valueIfEmpty;
        for (int i : a) {
            result = Math.max(result, i);
        }
        return result;
    }

    static <T> T[] append(T[] tArr, T[] tArr2) {
        T[] tArr3 = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), tArr.length + tArr2.length));
        System.arraycopy(tArr, 0, tArr3, 0, tArr.length);
        System.arraycopy(tArr2, 0, tArr3, tArr.length, tArr2.length);
        return tArr3;
    }

    static Alignment getAlignment(int gravity, boolean horizontal) {
        int mask = horizontal ? 7 : 112;
        int shift = horizontal ? 0 : ALIGNMENT_MODE;
        int flags = (gravity & mask) >> shift;
        switch (flags) {
            case 1:
                return CENTER;
            case USE_DEFAULT_MARGINS /* 3 */:
                return LEADING;
            case ROW_ORDER_PRESERVED /* 5 */:
                return TRAILING;
            case 7:
                return FILL;
            case 8388611:
                return START;
            case 8388613:
                return END;
            default:
                return UNDEFINED_ALIGNMENT;
        }
    }

    private int getDefaultMargin(View c, boolean horizontal, boolean leading) {
        if (c.getClass() == Space.class) {
            return 0;
        }
        return this.defaultGap / 2;
    }

    private int getDefaultMargin(View c, boolean isAtEdge, boolean horizontal, boolean leading) {
        if (isAtEdge) {
            return 0;
        }
        return getDefaultMargin(c, horizontal, leading);
    }

    private int getDefaultMarginValue(View c, LayoutParams p, boolean horizontal, boolean leading) {
        if (!this.useDefaultMargins) {
            return 0;
        }
        Spec spec = horizontal ? p.columnSpec : p.rowSpec;
        Axis axis = horizontal ? this.horizontalAxis : this.verticalAxis;
        Interval span = spec.span;
        boolean leading1 = (horizontal && isLayoutRtl(this)) ? !leading : leading;
        boolean isAtEdge = leading1 ? span.min == 0 : span.max == axis.getCount();
        return getDefaultMargin(c, isAtEdge, horizontal, leading);
    }

    int getMargin1(View view, boolean horizontal, boolean leading) {
        LayoutParams lp = getLayoutParams(view);
        int margin = horizontal ? leading ? lp.leftMargin : lp.rightMargin : leading ? lp.topMargin : lp.bottomMargin;
        return margin == Integer.MIN_VALUE ? getDefaultMarginValue(view, lp, horizontal, leading) : margin;
    }

    private int getMargin(View view, boolean horizontal, boolean leading) {
        if (this.alignmentMode == 1) {
            return getMargin1(view, horizontal, leading);
        }
        Axis axis = horizontal ? this.horizontalAxis : this.verticalAxis;
        int[] margins = leading ? axis.getLeadingMargins() : axis.getTrailingMargins();
        LayoutParams lp = getLayoutParams(view);
        Spec spec = horizontal ? lp.columnSpec : lp.rowSpec;
        int index = leading ? spec.span.min : spec.span.max;
        return margins[index];
    }

    private int getTotalMargin(View child, boolean horizontal) {
        return getMargin(child, horizontal, true) + getMargin(child, horizontal, false);
    }

    private static boolean fits(int[] a, int value, int start, int end) {
        if (end > a.length) {
            return false;
        }
        for (int i = start; i < end; i++) {
            if (a[i] > value) {
                return false;
            }
        }
        return true;
    }

    private static void procrusteanFill(int[] a, int start, int end, int value) {
        int length = a.length;
        Arrays.fill(a, Math.min(start, length), Math.min(end, length), value);
    }

    private static void setCellGroup(LayoutParams lp, int row, int rowSpan, int col, int colSpan) {
        lp.setRowSpecSpan(new Interval(row, row + rowSpan));
        lp.setColumnSpecSpan(new Interval(col, col + colSpan));
    }

    private static int clip(Interval minorRange, boolean minorWasDefined, int count) {
        int size = minorRange.size();
        if (count == 0) {
            return size;
        }
        int min = minorWasDefined ? Math.min(minorRange.min, count) : 0;
        return Math.min(size, count - min);
    }

    private void validateLayoutParams() {
        boolean horizontal = this.orientation == 0;
        Axis axis = horizontal ? this.horizontalAxis : this.verticalAxis;
        int count = axis.definedCount != Integer.MIN_VALUE ? axis.definedCount : 0;
        int major = 0;
        int minor = 0;
        int[] maxSizes = new int[count];
        int N = getChildCount();
        for (int i = 0; i < N; i++) {
            LayoutParams lp = (LayoutParams) getChildAt(i).getLayoutParams();
            Spec majorSpec = horizontal ? lp.rowSpec : lp.columnSpec;
            Interval majorRange = majorSpec.span;
            boolean majorWasDefined = majorSpec.startDefined;
            int majorSpan = majorRange.size();
            if (majorWasDefined) {
                major = majorRange.min;
            }
            Spec minorSpec = horizontal ? lp.columnSpec : lp.rowSpec;
            Interval minorRange = minorSpec.span;
            boolean minorWasDefined = minorSpec.startDefined;
            int minorSpan = clip(minorRange, minorWasDefined, count);
            if (minorWasDefined) {
                minor = minorRange.min;
            }
            if (count != 0) {
                if (!majorWasDefined || !minorWasDefined) {
                    while (!fits(maxSizes, major, minor, minor + minorSpan)) {
                        if (minorWasDefined) {
                            major++;
                        } else if (minor + minorSpan <= count) {
                            minor++;
                        } else {
                            minor = 0;
                            major++;
                        }
                    }
                }
                procrusteanFill(maxSizes, minor, minor + minorSpan, major + majorSpan);
            }
            if (horizontal) {
                setCellGroup(lp, major, majorSpan, minor, minorSpan);
            } else {
                setCellGroup(lp, minor, minorSpan, major, majorSpan);
            }
            minor += minorSpan;
        }
        this.lastLayoutParamsHashCode = computeLayoutParamsHashCode();
        invalidateStructure();
    }

    private void invalidateStructure() {
        this.layoutParamsValid = false;
        this.horizontalAxis.invalidateStructure();
        this.verticalAxis.invalidateStructure();
        invalidateValues();
    }

    private void invalidateValues() {
        if (this.horizontalAxis != null && this.verticalAxis != null) {
            this.horizontalAxis.invalidateValues();
            this.verticalAxis.invalidateValues();
        }
    }

    protected void onSetLayoutParams(View child, ViewGroup.LayoutParams layoutParams) {
        super.onSetLayoutParams(child, layoutParams);
        invalidateStructure();
    }

    final LayoutParams getLayoutParams(View c) {
        if (!this.layoutParamsValid) {
            validateLayoutParams();
            this.layoutParamsValid = true;
        }
        return (LayoutParams) c.getLayoutParams();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    private void drawLine(Canvas graphics, int x1, int y1, int x2, int y2, Paint paint) {
        int dx = getPaddingLeft();
        int dy = getPaddingTop();
        if (isLayoutRtl(this)) {
            int width = getWidth();
            graphics.drawLine((width - dx) - x1, dy + y1, (width - dx) - x2, dy + y2, paint);
        } else {
            graphics.drawLine(dx + x1, dy + y1, dx + x2, dy + y2, paint);
        }
    }

    private static void drawRect(Canvas canvas, int x1, int y1, int x2, int y2, Paint paint) {
        canvas.drawRect(x1, y1, x2 - 1, y2 - 1, paint);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public void onViewAdded(View child) {
        super.onViewAdded(child);
        invalidateStructure();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.view.ViewGroup
    public void onViewRemoved(View child) {
        super.onViewRemoved(child);
        invalidateStructure();
    }

    protected void onChildVisibilityChanged(View child, int oldVisibility, int newVisibility) {
        super.onChildVisibilityChanged(child, oldVisibility, newVisibility);
        if (oldVisibility == 8 || newVisibility == 8) {
            invalidateStructure();
        }
    }

    private int computeLayoutParamsHashCode() {
        int result = 1;
        int N = getChildCount();
        for (int i = 0; i < N; i++) {
            View c = getChildAt(i);
            if (c.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) c.getLayoutParams();
                result = (31 * result) + lp.hashCode();
            }
        }
        return result;
    }

    private void checkForLayoutParamsModification() {
        int layoutParamsHashCode = computeLayoutParamsHashCode();
        if (this.lastLayoutParamsHashCode != 0 && this.lastLayoutParamsHashCode != layoutParamsHashCode) {
            invalidateStructure();
            Log.w(TAG, "The fields of some layout parameters were modified in between layout operations. Check the javadoc for GridLayout.LayoutParams#rowSpec.");
        }
    }

    private void measureChildWithMargins2(View child, int parentWidthSpec, int parentHeightSpec, int childWidth, int childHeight) {
        int childWidthSpec = getChildMeasureSpec(parentWidthSpec, this.mPaddingLeft + this.mPaddingRight + getTotalMargin(child, true), childWidth);
        int childHeightSpec = getChildMeasureSpec(parentHeightSpec, this.mPaddingTop + this.mPaddingBottom + getTotalMargin(child, false), childHeight);
        child.measure(childWidthSpec, childHeightSpec);
    }

    private void measureChildrenWithMargins(int widthSpec, int heightSpec, boolean firstPass) {
        int N = getChildCount();
        for (int i = 0; i < N; i++) {
            View c = getChildAt(i);
            if (c.getVisibility() != 8) {
                LayoutParams lp = getLayoutParams(c);
                if (firstPass) {
                    measureChildWithMargins2(c, widthSpec, heightSpec, lp.width, lp.height);
                } else {
                    boolean horizontal = this.orientation == 0;
                    Spec spec = horizontal ? lp.columnSpec : lp.rowSpec;
                    if (spec.alignment == FILL) {
                        Interval span = spec.span;
                        Axis axis = horizontal ? this.horizontalAxis : this.verticalAxis;
                        int[] locations = axis.getLocations();
                        int cellSize = locations[span.max] - locations[span.min];
                        int viewSize = cellSize - getTotalMargin(c, horizontal);
                        if (horizontal) {
                            measureChildWithMargins2(c, widthSpec, heightSpec, viewSize, lp.height);
                        } else {
                            measureChildWithMargins2(c, widthSpec, heightSpec, lp.width, viewSize);
                        }
                    }
                }
            }
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthSpec, int heightSpec) {
        int height;
        int width;
        checkForLayoutParamsModification();
        invalidateValues();
        measureChildrenWithMargins(widthSpec, heightSpec, true);
        if (this.orientation == 0) {
            width = this.horizontalAxis.getMeasure(widthSpec);
            measureChildrenWithMargins(widthSpec, heightSpec, false);
            height = this.verticalAxis.getMeasure(heightSpec);
        } else {
            height = this.verticalAxis.getMeasure(heightSpec);
            measureChildrenWithMargins(widthSpec, heightSpec, false);
            width = this.horizontalAxis.getMeasure(widthSpec);
        }
        int hPadding = getPaddingLeft() + getPaddingRight();
        int vPadding = getPaddingTop() + getPaddingBottom();
        int measuredWidth = Math.max(hPadding + width, getSuggestedMinimumWidth());
        int measuredHeight = Math.max(vPadding + height, getSuggestedMinimumHeight());
        setMeasuredDimension(resolveSizeAndState(measuredWidth, widthSpec, 0), resolveSizeAndState(measuredHeight, heightSpec, 0));
    }

    private int getMeasurement(View c, boolean horizontal) {
        return horizontal ? c.getMeasuredWidth() : c.getMeasuredHeight();
    }

    final int getMeasurementIncludingMargin(View c, boolean horizontal) {
        if (c.getVisibility() == 8) {
            return 0;
        }
        return getMeasurement(c, horizontal) + getTotalMargin(c, horizontal);
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        super.requestLayout();
        invalidateValues();
    }

    final Alignment getAlignment(Alignment alignment, boolean horizontal) {
        return alignment != UNDEFINED_ALIGNMENT ? alignment : horizontal ? START : BASELINE;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        checkForLayoutParamsModification();
        int targetWidth = right - left;
        int targetHeight = bottom - top;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        this.horizontalAxis.layout((targetWidth - paddingLeft) - paddingRight);
        this.verticalAxis.layout((targetHeight - paddingTop) - paddingBottom);
        int[] hLocations = this.horizontalAxis.getLocations();
        int[] vLocations = this.verticalAxis.getLocations();
        int N = getChildCount();
        for (int i = 0; i < N; i++) {
            View c = getChildAt(i);
            if (c.getVisibility() != 8) {
                LayoutParams lp = getLayoutParams(c);
                Spec columnSpec = lp.columnSpec;
                Spec rowSpec = lp.rowSpec;
                Interval colSpan = columnSpec.span;
                Interval rowSpan = rowSpec.span;
                int x1 = hLocations[colSpan.min];
                int y1 = vLocations[rowSpan.min];
                int x2 = hLocations[colSpan.max];
                int y2 = vLocations[rowSpan.max];
                int cellWidth = x2 - x1;
                int cellHeight = y2 - y1;
                int pWidth = getMeasurement(c, true);
                int pHeight = getMeasurement(c, false);
                Alignment hAlign = getAlignment(columnSpec.alignment, true);
                Alignment vAlign = getAlignment(rowSpec.alignment, false);
                Bounds boundsX = this.horizontalAxis.getGroupBounds().getValue(i);
                Bounds boundsY = this.verticalAxis.getGroupBounds().getValue(i);
                int gravityOffsetX = hAlign.getGravityOffset(c, cellWidth - boundsX.size(true));
                int gravityOffsetY = vAlign.getGravityOffset(c, cellHeight - boundsY.size(true));
                int leftMargin = getMargin(c, true, true);
                int topMargin = getMargin(c, false, true);
                int rightMargin = getMargin(c, true, false);
                int bottomMargin = getMargin(c, false, false);
                int alignmentOffsetX = boundsX.getOffset(c, hAlign, leftMargin + pWidth + rightMargin);
                int alignmentOffsetY = boundsY.getOffset(c, vAlign, topMargin + pHeight + bottomMargin);
                int width = hAlign.getSizeInCell(c, pWidth, (cellWidth - leftMargin) - rightMargin);
                int height = vAlign.getSizeInCell(c, pHeight, (cellHeight - topMargin) - bottomMargin);
                int dx = x1 + gravityOffsetX + alignmentOffsetX;
                int cx = !isLayoutRtl(this) ? paddingLeft + leftMargin + dx : (((targetWidth - width) - paddingRight) - rightMargin) - dx;
                int cy = paddingTop + y1 + gravityOffsetY + alignmentOffsetY + topMargin;
                if (width != c.getMeasuredWidth() || height != c.getMeasuredHeight()) {
                    c.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), View.MeasureSpec.makeMeasureSpec(height, 1073741824));
                }
                c.layout(cx, cy, cx + width, cy + height);
            }
        }
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setClassName(GridLayout.class.getName());
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName(GridLayout.class.getName());
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Axis.class */
    final class Axis {
        private static final int NEW = 0;
        private static final int PENDING = 1;
        private static final int COMPLETE = 2;
        public final boolean horizontal;
        public int definedCount;
        private int maxIndex;
        PackedMap<Spec, Bounds> groupBounds;
        public boolean groupBoundsValid;
        PackedMap<Interval, MutableInt> forwardLinks;
        public boolean forwardLinksValid;
        PackedMap<Interval, MutableInt> backwardLinks;
        public boolean backwardLinksValid;
        public int[] leadingMargins;
        public boolean leadingMarginsValid;
        public int[] trailingMargins;
        public boolean trailingMarginsValid;
        public Arc[] arcs;
        public boolean arcsValid;
        public int[] locations;
        public boolean locationsValid;
        boolean orderPreserved;
        private MutableInt parentMin;
        private MutableInt parentMax;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !GridLayout.class.desiredAssertionStatus();
        }

        private Axis(boolean horizontal) {
            this.definedCount = Integer.MIN_VALUE;
            this.maxIndex = Integer.MIN_VALUE;
            this.groupBoundsValid = false;
            this.forwardLinksValid = false;
            this.backwardLinksValid = false;
            this.leadingMarginsValid = false;
            this.trailingMarginsValid = false;
            this.arcsValid = false;
            this.locationsValid = false;
            this.orderPreserved = true;
            this.parentMin = new MutableInt(0);
            this.parentMax = new MutableInt(-100000);
            this.horizontal = horizontal;
        }

        private int calculateMaxIndex() {
            int result = -1;
            int N = GridLayout.this.getChildCount();
            for (int i = 0; i < N; i++) {
                View c = GridLayout.this.getChildAt(i);
                LayoutParams params = GridLayout.this.getLayoutParams(c);
                Spec spec = this.horizontal ? params.columnSpec : params.rowSpec;
                Interval span = spec.span;
                result = Math.max(Math.max(result, span.min), span.max);
            }
            if (result == -1) {
                return Integer.MIN_VALUE;
            }
            return result;
        }

        private int getMaxIndex() {
            if (this.maxIndex == Integer.MIN_VALUE) {
                this.maxIndex = Math.max(0, calculateMaxIndex());
            }
            return this.maxIndex;
        }

        public int getCount() {
            return Math.max(this.definedCount, getMaxIndex());
        }

        public void setCount(int count) {
            this.definedCount = count;
        }

        public boolean isOrderPreserved() {
            return this.orderPreserved;
        }

        public void setOrderPreserved(boolean orderPreserved) {
            this.orderPreserved = orderPreserved;
            invalidateStructure();
        }

        private PackedMap<Spec, Bounds> createGroupBounds() {
            Assoc<Spec, Bounds> assoc = Assoc.of(Spec.class, Bounds.class);
            int N = GridLayout.this.getChildCount();
            for (int i = 0; i < N; i++) {
                View c = GridLayout.this.getChildAt(i);
                LayoutParams lp = GridLayout.this.getLayoutParams(c);
                Spec spec = this.horizontal ? lp.columnSpec : lp.rowSpec;
                Bounds bounds = GridLayout.this.getAlignment(spec.alignment, this.horizontal).getBounds();
                assoc.put(spec, bounds);
            }
            return assoc.pack();
        }

        private void computeGroupBounds() {
            Bounds[] values = this.groupBounds.values;
            for (Bounds bounds : values) {
                bounds.reset();
            }
            int N = GridLayout.this.getChildCount();
            for (int i = 0; i < N; i++) {
                View c = GridLayout.this.getChildAt(i);
                LayoutParams lp = GridLayout.this.getLayoutParams(c);
                Spec spec = this.horizontal ? lp.columnSpec : lp.rowSpec;
                this.groupBounds.getValue(i).include(c, spec, GridLayout.this, this);
            }
        }

        public PackedMap<Spec, Bounds> getGroupBounds() {
            if (this.groupBounds == null) {
                this.groupBounds = createGroupBounds();
            }
            if (!this.groupBoundsValid) {
                computeGroupBounds();
                this.groupBoundsValid = true;
            }
            return this.groupBounds;
        }

        private PackedMap<Interval, MutableInt> createLinks(boolean min) {
            Assoc<Interval, MutableInt> result = Assoc.of(Interval.class, MutableInt.class);
            Spec[] keys = getGroupBounds().keys;
            int N = keys.length;
            for (int i = 0; i < N; i++) {
                Interval span = min ? keys[i].span : keys[i].span.inverse();
                result.put(span, new MutableInt());
            }
            return result.pack();
        }

        private void computeLinks(PackedMap<Interval, MutableInt> links, boolean min) {
            MutableInt[] spans = links.values;
            for (MutableInt mutableInt : spans) {
                mutableInt.reset();
            }
            Bounds[] bounds = getGroupBounds().values;
            for (int i = 0; i < bounds.length; i++) {
                int size = bounds[i].size(min);
                MutableInt valueHolder = links.getValue(i);
                valueHolder.value = Math.max(valueHolder.value, min ? size : -size);
            }
        }

        private PackedMap<Interval, MutableInt> getForwardLinks() {
            if (this.forwardLinks == null) {
                this.forwardLinks = createLinks(true);
            }
            if (!this.forwardLinksValid) {
                computeLinks(this.forwardLinks, true);
                this.forwardLinksValid = true;
            }
            return this.forwardLinks;
        }

        private PackedMap<Interval, MutableInt> getBackwardLinks() {
            if (this.backwardLinks == null) {
                this.backwardLinks = createLinks(false);
            }
            if (!this.backwardLinksValid) {
                computeLinks(this.backwardLinks, false);
                this.backwardLinksValid = true;
            }
            return this.backwardLinks;
        }

        private void include(List<Arc> arcs, Interval key, MutableInt size, boolean ignoreIfAlreadyPresent) {
            if (key.size() == 0) {
                return;
            }
            if (ignoreIfAlreadyPresent) {
                for (Arc arc : arcs) {
                    Interval span = arc.span;
                    if (span.equals(key)) {
                        return;
                    }
                }
            }
            arcs.add(new Arc(key, size));
        }

        private void include(List<Arc> arcs, Interval key, MutableInt size) {
            include(arcs, key, size, true);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v4, types: [android.support.v7.widget.GridLayout$Arc[], android.support.v7.widget.GridLayout$Arc[][]] */
        Arc[][] groupArcsByFirstVertex(Arc[] arcs) {
            int N = getCount() + 1;
            ?? r0 = new Arc[N];
            int[] sizes = new int[N];
            for (Arc arc : arcs) {
                int i = arc.span.min;
                sizes[i] = sizes[i] + 1;
            }
            for (int i2 = 0; i2 < sizes.length; i2++) {
                r0[i2] = new Arc[sizes[i2]];
            }
            Arrays.fill(sizes, 0);
            for (Arc arc2 : arcs) {
                int i3 = arc2.span.min;
                Arc[] arcArr = r0[i3];
                int i4 = sizes[i3];
                sizes[i3] = i4 + 1;
                arcArr[i4] = arc2;
            }
            return r0;
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [android.support.v7.widget.GridLayout$Axis$1] */
        private Arc[] topologicalSort(final Arc[] arcs) {
            return new Object() { // from class: android.support.v7.widget.GridLayout.Axis.1
                Arc[] result;
                int cursor;
                Arc[][] arcsByVertex;
                int[] visited;
                static final /* synthetic */ boolean $assertionsDisabled;

                {
                    this.result = new Arc[arcs.length];
                    this.cursor = this.result.length - 1;
                    this.arcsByVertex = Axis.this.groupArcsByFirstVertex(arcs);
                    this.visited = new int[Axis.this.getCount() + 1];
                }

                static {
                    $assertionsDisabled = !GridLayout.class.desiredAssertionStatus();
                }

                void walk(int loc) {
                    switch (this.visited[loc]) {
                        case 0:
                            this.visited[loc] = 1;
                            Arc[] arr$ = this.arcsByVertex[loc];
                            for (Arc arc : arr$) {
                                walk(arc.span.max);
                                Arc[] arcArr = this.result;
                                int i = this.cursor;
                                this.cursor = i - 1;
                                arcArr[i] = arc;
                            }
                            this.visited[loc] = Axis.COMPLETE;
                            return;
                        case 1:
                            if (!$assertionsDisabled) {
                                throw new AssertionError();
                            }
                            return;
                        case Axis.COMPLETE /* 2 */:
                        default:
                            return;
                    }
                }

                Arc[] sort() {
                    int N = this.arcsByVertex.length;
                    for (int loc = 0; loc < N; loc++) {
                        walk(loc);
                    }
                    if ($assertionsDisabled || this.cursor == -1) {
                        return this.result;
                    }
                    throw new AssertionError();
                }
            }.sort();
        }

        private Arc[] topologicalSort(List<Arc> arcs) {
            return topologicalSort((Arc[]) arcs.toArray(new Arc[arcs.size()]));
        }

        private void addComponentSizes(List<Arc> result, PackedMap<Interval, MutableInt> links) {
            for (int i = 0; i < links.keys.length; i++) {
                Interval key = links.keys[i];
                include(result, key, links.values[i], false);
            }
        }

        private Arc[] createArcs() {
            List<Arc> mins = new ArrayList<>();
            List<Arc> maxs = new ArrayList<>();
            addComponentSizes(mins, getForwardLinks());
            addComponentSizes(maxs, getBackwardLinks());
            if (this.orderPreserved) {
                for (int i = 0; i < getCount(); i++) {
                    include(mins, new Interval(i, i + 1), new MutableInt(0));
                }
            }
            int N = getCount();
            include(mins, new Interval(0, N), this.parentMin, false);
            include(maxs, new Interval(N, 0), this.parentMax, false);
            Arc[] sMins = topologicalSort(mins);
            Arc[] sMaxs = topologicalSort(maxs);
            return (Arc[]) GridLayout.append(sMins, sMaxs);
        }

        private void computeArcs() {
            getForwardLinks();
            getBackwardLinks();
        }

        public Arc[] getArcs() {
            if (this.arcs == null) {
                this.arcs = createArcs();
            }
            if (!this.arcsValid) {
                computeArcs();
                this.arcsValid = true;
            }
            return this.arcs;
        }

        private boolean relax(int[] locations, Arc entry) {
            if (!entry.valid) {
                return false;
            }
            Interval span = entry.span;
            int u = span.min;
            int v = span.max;
            int value = entry.value.value;
            int candidate = locations[u] + value;
            if (candidate > locations[v]) {
                locations[v] = candidate;
                return true;
            }
            return false;
        }

        private void init(int[] locations) {
            Arrays.fill(locations, 0);
        }

        private String arcsToString(List<Arc> arcs) {
            String var = this.horizontal ? "x" : "y";
            StringBuilder result = new StringBuilder();
            boolean first = true;
            for (Arc arc : arcs) {
                if (first) {
                    first = false;
                } else {
                    result = result.append(", ");
                }
                int src = arc.span.min;
                int dst = arc.span.max;
                int value = arc.value.value;
                result.append(src < dst ? var + dst + " - " + var + src + " > " + value : var + src + " - " + var + dst + " < " + (-value));
            }
            return result.toString();
        }

        private void logError(String axisName, Arc[] arcs, boolean[] culprits0) {
            List<Arc> culprits = new ArrayList<>();
            List<Arc> removed = new ArrayList<>();
            for (int c = 0; c < arcs.length; c++) {
                Arc arc = arcs[c];
                if (culprits0[c]) {
                    culprits.add(arc);
                }
                if (!arc.valid) {
                    removed.add(arc);
                }
            }
            Log.d(GridLayout.TAG, axisName + " constraints: " + arcsToString(culprits) + " are inconsistent; permanently removing: " + arcsToString(removed) + ". ");
        }

        private void solve(Arc[] arcs, int[] locations) {
            String axisName = this.horizontal ? "horizontal" : "vertical";
            int N = getCount() + 1;
            boolean[] originalCulprits = null;
            for (int p = 0; p < arcs.length; p++) {
                init(locations);
                for (int i = 0; i < N; i++) {
                    boolean changed = false;
                    for (Arc arc : arcs) {
                        changed |= relax(locations, arc);
                    }
                    if (!changed) {
                        if (originalCulprits != null) {
                            logError(axisName, arcs, originalCulprits);
                            return;
                        }
                        return;
                    }
                }
                boolean[] culprits = new boolean[arcs.length];
                for (int i2 = 0; i2 < N; i2++) {
                    int length = arcs.length;
                    for (int j = 0; j < length; j++) {
                        int i3 = j;
                        culprits[i3] = culprits[i3] | relax(locations, arcs[j]);
                    }
                }
                if (p == 0) {
                    originalCulprits = culprits;
                }
                int i4 = 0;
                while (true) {
                    if (i4 >= arcs.length) {
                        break;
                    }
                    if (culprits[i4]) {
                        Arc arc2 = arcs[i4];
                        if (arc2.span.min >= arc2.span.max) {
                            arc2.valid = false;
                            break;
                        }
                    }
                    i4++;
                }
            }
        }

        private void computeMargins(boolean leading) {
            int[] margins = leading ? this.leadingMargins : this.trailingMargins;
            int N = GridLayout.this.getChildCount();
            for (int i = 0; i < N; i++) {
                View c = GridLayout.this.getChildAt(i);
                if (c.getVisibility() != 8) {
                    LayoutParams lp = GridLayout.this.getLayoutParams(c);
                    Spec spec = this.horizontal ? lp.columnSpec : lp.rowSpec;
                    Interval span = spec.span;
                    int index = leading ? span.min : span.max;
                    margins[index] = Math.max(margins[index], GridLayout.this.getMargin1(c, this.horizontal, leading));
                }
            }
        }

        public int[] getLeadingMargins() {
            if (this.leadingMargins == null) {
                this.leadingMargins = new int[getCount() + 1];
            }
            if (!this.leadingMarginsValid) {
                computeMargins(true);
                this.leadingMarginsValid = true;
            }
            return this.leadingMargins;
        }

        public int[] getTrailingMargins() {
            if (this.trailingMargins == null) {
                this.trailingMargins = new int[getCount() + 1];
            }
            if (!this.trailingMarginsValid) {
                computeMargins(false);
                this.trailingMarginsValid = true;
            }
            return this.trailingMargins;
        }

        private void computeLocations(int[] a) {
            solve(getArcs(), a);
            if (!this.orderPreserved) {
                int a0 = a[0];
                int N = a.length;
                for (int i = 0; i < N; i++) {
                    a[i] = a[i] - a0;
                }
            }
        }

        public int[] getLocations() {
            if (this.locations == null) {
                int N = getCount() + 1;
                this.locations = new int[N];
            }
            if (!this.locationsValid) {
                computeLocations(this.locations);
                this.locationsValid = true;
            }
            return this.locations;
        }

        private int size(int[] locations) {
            return locations[getCount()];
        }

        private void setParentConstraints(int min, int max) {
            this.parentMin.value = min;
            this.parentMax.value = -max;
            this.locationsValid = false;
        }

        private int getMeasure(int min, int max) {
            setParentConstraints(min, max);
            return size(getLocations());
        }

        public int getMeasure(int measureSpec) {
            int mode = View.MeasureSpec.getMode(measureSpec);
            int size = View.MeasureSpec.getSize(measureSpec);
            switch (mode) {
                case Integer.MIN_VALUE:
                    return getMeasure(0, size);
                case 0:
                    return getMeasure(0, GridLayout.MAX_SIZE);
                case 1073741824:
                    return getMeasure(size, size);
                default:
                    if ($assertionsDisabled) {
                        return 0;
                    }
                    throw new AssertionError();
            }
        }

        public void layout(int size) {
            setParentConstraints(size, size);
            getLocations();
        }

        public void invalidateStructure() {
            this.maxIndex = Integer.MIN_VALUE;
            this.groupBounds = null;
            this.forwardLinks = null;
            this.backwardLinks = null;
            this.leadingMargins = null;
            this.trailingMargins = null;
            this.arcs = null;
            this.locations = null;
            invalidateValues();
        }

        public void invalidateValues() {
            this.groupBoundsValid = false;
            this.forwardLinksValid = false;
            this.backwardLinksValid = false;
            this.leadingMarginsValid = false;
            this.trailingMarginsValid = false;
            this.arcsValid = false;
            this.locationsValid = false;
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$LayoutParams.class */
    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        private static final int DEFAULT_WIDTH = -2;
        private static final int DEFAULT_HEIGHT = -2;
        private static final int DEFAULT_MARGIN = Integer.MIN_VALUE;
        private static final int DEFAULT_ROW = Integer.MIN_VALUE;
        private static final int DEFAULT_COLUMN = Integer.MIN_VALUE;
        private static final Interval DEFAULT_SPAN = new Interval(Integer.MIN_VALUE, -2147483647);
        private static final int DEFAULT_SPAN_SIZE = DEFAULT_SPAN.size();
        private static final int MARGIN = 2;
        private static final int LEFT_MARGIN = 3;
        private static final int TOP_MARGIN = 4;
        private static final int RIGHT_MARGIN = 5;
        private static final int BOTTOM_MARGIN = 6;
        private static final int COLUMN = 9;
        private static final int COLUMN_SPAN = 10;
        private static final int ROW = 7;
        private static final int ROW_SPAN = 8;
        private static final int GRAVITY = 11;
        public Spec rowSpec;
        public Spec columnSpec;

        private LayoutParams(int width, int height, int left, int top, int right, int bottom, Spec rowSpec, Spec columnSpec) {
            super(width, height);
            this.rowSpec = Spec.UNDEFINED;
            this.columnSpec = Spec.UNDEFINED;
            setMargins(left, top, right, bottom);
            this.rowSpec = rowSpec;
            this.columnSpec = columnSpec;
        }

        public LayoutParams(Spec rowSpec, Spec columnSpec) {
            this(-2, -2, Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE, rowSpec, columnSpec);
        }

        public LayoutParams() {
            this(Spec.UNDEFINED, Spec.UNDEFINED);
        }

        public LayoutParams(ViewGroup.LayoutParams params) {
            super(params);
            this.rowSpec = Spec.UNDEFINED;
            this.columnSpec = Spec.UNDEFINED;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams params) {
            super(params);
            this.rowSpec = Spec.UNDEFINED;
            this.columnSpec = Spec.UNDEFINED;
        }

        public LayoutParams(LayoutParams that) {
            super((ViewGroup.MarginLayoutParams) that);
            this.rowSpec = Spec.UNDEFINED;
            this.columnSpec = Spec.UNDEFINED;
            this.rowSpec = that.rowSpec;
            this.columnSpec = that.columnSpec;
        }

        public LayoutParams(Context context, AttributeSet attrs) {
            super(context, attrs);
            this.rowSpec = Spec.UNDEFINED;
            this.columnSpec = Spec.UNDEFINED;
            reInitSuper(context, attrs);
            init(context, attrs);
        }

        private void reInitSuper(Context context, AttributeSet attrs) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GridLayout_Layout);
            try {
                int margin = a.getDimensionPixelSize(MARGIN, Integer.MIN_VALUE);
                this.leftMargin = a.getDimensionPixelSize(LEFT_MARGIN, margin);
                this.topMargin = a.getDimensionPixelSize(TOP_MARGIN, margin);
                this.rightMargin = a.getDimensionPixelSize(RIGHT_MARGIN, margin);
                this.bottomMargin = a.getDimensionPixelSize(BOTTOM_MARGIN, margin);
                a.recycle();
            } catch (Throwable th) {
                a.recycle();
                throw th;
            }
        }

        private void init(Context context, AttributeSet attrs) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.GridLayout_Layout);
            try {
                int gravity = a.getInt(GRAVITY, 0);
                int column = a.getInt(COLUMN, Integer.MIN_VALUE);
                int colSpan = a.getInt(COLUMN_SPAN, DEFAULT_SPAN_SIZE);
                this.columnSpec = GridLayout.spec(column, colSpan, GridLayout.getAlignment(gravity, true));
                int row = a.getInt(ROW, Integer.MIN_VALUE);
                int rowSpan = a.getInt(ROW_SPAN, DEFAULT_SPAN_SIZE);
                this.rowSpec = GridLayout.spec(row, rowSpan, GridLayout.getAlignment(gravity, false));
                a.recycle();
            } catch (Throwable th) {
                a.recycle();
                throw th;
            }
        }

        public void setGravity(int gravity) {
            this.rowSpec = this.rowSpec.copyWriteAlignment(GridLayout.getAlignment(gravity, false));
            this.columnSpec = this.columnSpec.copyWriteAlignment(GridLayout.getAlignment(gravity, true));
        }

        @Override // android.view.ViewGroup.LayoutParams
        protected void setBaseAttributes(TypedArray attributes, int widthAttr, int heightAttr) {
            this.width = attributes.getLayoutDimension(widthAttr, -2);
            this.height = attributes.getLayoutDimension(heightAttr, -2);
        }

        final void setRowSpecSpan(Interval span) {
            this.rowSpec = this.rowSpec.copyWriteSpan(span);
        }

        final void setColumnSpecSpan(Interval span) {
            this.columnSpec = this.columnSpec.copyWriteSpan(span);
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            LayoutParams that = (LayoutParams) o;
            return this.columnSpec.equals(that.columnSpec) && this.rowSpec.equals(that.rowSpec);
        }

        public int hashCode() {
            int result = this.rowSpec.hashCode();
            return (31 * result) + this.columnSpec.hashCode();
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Arc.class */
    static final class Arc {
        public final Interval span;
        public final MutableInt value;
        public boolean valid = true;

        public Arc(Interval span, MutableInt value) {
            this.span = span;
            this.value = value;
        }

        public String toString() {
            return this.span + " " + (!this.valid ? "+>" : "->") + " " + this.value;
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$MutableInt.class */
    static final class MutableInt {
        public int value;

        public MutableInt() {
            reset();
        }

        public MutableInt(int value) {
            this.value = value;
        }

        public void reset() {
            this.value = Integer.MIN_VALUE;
        }

        public String toString() {
            return Integer.toString(this.value);
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Assoc.class */
    static final class Assoc<K, V> extends ArrayList<Pair<K, V>> {
        private final Class<K> keyType;
        private final Class<V> valueType;

        private Assoc(Class<K> keyType, Class<V> valueType) {
            this.keyType = keyType;
            this.valueType = valueType;
        }

        public static <K, V> Assoc<K, V> of(Class<K> keyType, Class<V> valueType) {
            return new Assoc<>(keyType, valueType);
        }

        public void put(K key, V value) {
            add(Pair.create(key, value));
        }

        public PackedMap<K, V> pack() {
            int N = size();
            Object[] objArr = (Object[]) Array.newInstance((Class<?>) this.keyType, N);
            Object[] objArr2 = (Object[]) Array.newInstance((Class<?>) this.valueType, N);
            for (int i = 0; i < N; i++) {
                objArr[i] = get(i).first;
                objArr2[i] = get(i).second;
            }
            return new PackedMap<>(objArr, objArr2);
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$PackedMap.class */
    static final class PackedMap<K, V> {
        public final int[] index;
        public final K[] keys;
        public final V[] values;

        private PackedMap(K[] kArr, V[] vArr) {
            this.index = createIndex(kArr);
            this.keys = (K[]) compact(kArr, this.index);
            this.values = (V[]) compact(vArr, this.index);
        }

        public V getValue(int i) {
            return this.values[this.index[i]];
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v12, types: [java.lang.Integer] */
        /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.Integer] */
        /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Integer] */
        private static <K> int[] createIndex(K[] keys) {
            int size = keys.length;
            int[] result = new int[size];
            Map<K, Integer> keyToIndex = new HashMap<>();
            for (int i = 0; i < size; i++) {
                K key = keys[i];
                V v = keyToIndex.get(key);
                if (v == null) {
                    v = Integer.valueOf(keyToIndex.size());
                    keyToIndex.put(key, v);
                }
                result[i] = v.intValue();
            }
            return result;
        }

        private static <K> K[] compact(K[] kArr, int[] iArr) {
            int length = kArr.length;
            K[] kArr2 = (K[]) ((Object[]) Array.newInstance(kArr.getClass().getComponentType(), GridLayout.max2(iArr, -1) + 1));
            for (int i = 0; i < length; i++) {
                kArr2[iArr[i]] = kArr[i];
            }
            return kArr2;
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Bounds.class */
    static class Bounds {
        public int before;
        public int after;
        public int flexibility;

        private Bounds() {
            reset();
        }

        protected void reset() {
            this.before = Integer.MIN_VALUE;
            this.after = Integer.MIN_VALUE;
            this.flexibility = 2;
        }

        protected void include(int before, int after) {
            this.before = Math.max(this.before, before);
            this.after = Math.max(this.after, after);
        }

        protected int size(boolean min) {
            if (!min && GridLayout.canStretch(this.flexibility)) {
                return GridLayout.MAX_SIZE;
            }
            return this.before + this.after;
        }

        protected int getOffset(View c, Alignment alignment, int size) {
            return this.before - alignment.getAlignmentValue(c, size);
        }

        protected final void include(View c, Spec spec, GridLayout gridLayout, Axis axis) {
            this.flexibility &= spec.getFlexibility();
            int size = gridLayout.getMeasurementIncludingMargin(c, axis.horizontal);
            Alignment alignment = gridLayout.getAlignment(spec.alignment, axis.horizontal);
            int before = alignment.getAlignmentValue(c, size);
            include(before, size - before);
        }

        public String toString() {
            return "Bounds{before=" + this.before + ", after=" + this.after + '}';
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Interval.class */
    static final class Interval {
        public final int min;
        public final int max;

        public Interval(int min, int max) {
            this.min = min;
            this.max = max;
        }

        int size() {
            return this.max - this.min;
        }

        Interval inverse() {
            return new Interval(this.max, this.min);
        }

        public boolean equals(Object that) {
            if (this == that) {
                return true;
            }
            if (that == null || getClass() != that.getClass()) {
                return false;
            }
            Interval interval = (Interval) that;
            if (this.max != interval.max || this.min != interval.min) {
                return false;
            }
            return true;
        }

        public int hashCode() {
            int result = this.min;
            return (31 * result) + this.max;
        }

        public String toString() {
            return "[" + this.min + ", " + this.max + "]";
        }
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Spec.class */
    public static class Spec {
        static final Spec UNDEFINED = GridLayout.spec(Integer.MIN_VALUE);
        final boolean startDefined;
        final Interval span;
        final Alignment alignment;

        private Spec(boolean startDefined, Interval span, Alignment alignment) {
            this.startDefined = startDefined;
            this.span = span;
            this.alignment = alignment;
        }

        private Spec(boolean startDefined, int start, int size, Alignment alignment) {
            this(startDefined, new Interval(start, start + size), alignment);
        }

        final Spec copyWriteSpan(Interval span) {
            return new Spec(this.startDefined, span, this.alignment);
        }

        final Spec copyWriteAlignment(Alignment alignment) {
            return new Spec(this.startDefined, this.span, alignment);
        }

        final int getFlexibility() {
            return this.alignment == GridLayout.UNDEFINED_ALIGNMENT ? 0 : 2;
        }

        public boolean equals(Object that) {
            if (this == that) {
                return true;
            }
            if (that == null || getClass() != that.getClass()) {
                return false;
            }
            Spec spec = (Spec) that;
            if (!this.alignment.equals(spec.alignment) || !this.span.equals(spec.span)) {
                return false;
            }
            return true;
        }

        public int hashCode() {
            int result = this.span.hashCode();
            return (31 * result) + this.alignment.hashCode();
        }
    }

    public static Spec spec(int start, int size, Alignment alignment) {
        return new Spec(start != Integer.MIN_VALUE, start, size, alignment);
    }

    public static Spec spec(int start, Alignment alignment) {
        return spec(start, 1, alignment);
    }

    public static Spec spec(int start, int size) {
        return spec(start, size, UNDEFINED_ALIGNMENT);
    }

    public static Spec spec(int start) {
        return spec(start, 1);
    }

    /* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/GridLayout$Alignment.class */
    public static abstract class Alignment {
        abstract int getGravityOffset(View view, int i);

        abstract int getAlignmentValue(View view, int i);

        Alignment() {
        }

        int getSizeInCell(View view, int viewSize, int cellSize) {
            return viewSize;
        }

        Bounds getBounds() {
            return new Bounds();
        }
    }

    private static Alignment createSwitchingAlignment(final Alignment ltr, final Alignment rtl) {
        return new Alignment() { // from class: android.support.v7.widget.GridLayout.4
            @Override // android.support.v7.widget.GridLayout.Alignment
            int getGravityOffset(View view, int cellDelta) {
                return (!ViewGroup.isLayoutRtl(view) ? ltr : rtl).getGravityOffset(view, cellDelta);
            }

            @Override // android.support.v7.widget.GridLayout.Alignment
            public int getAlignmentValue(View view, int viewSize) {
                return (!ViewGroup.isLayoutRtl(view) ? ltr : rtl).getAlignmentValue(view, viewSize);
            }
        };
    }

    static boolean canStretch(int flexibility) {
        return (flexibility & 2) != 0;
    }
}
