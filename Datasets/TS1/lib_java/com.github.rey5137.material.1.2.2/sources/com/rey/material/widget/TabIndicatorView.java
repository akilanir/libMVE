package com.rey.material.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Checkable;
import android.widget.ImageView;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TabIndicatorView.class */
public class TabIndicatorView extends RecyclerView implements ThemeManager.OnThemeChangedListener {
    protected int mStyleId;
    protected int mCurrentStyle;
    private int mMode;
    private int mTabPadding;
    private int mTabRippleStyle;
    private int mTextAppearance;
    private boolean mTabSingleLine;
    private boolean mCenterCurrentTab;
    private int mIndicatorOffset;
    private int mIndicatorWidth;
    private int mIndicatorHeight;
    private boolean mIndicatorAtTop;
    private Paint mPaint;
    public static final int MODE_SCROLL = 0;
    public static final int MODE_FIXED = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_SETTLING = 2;
    private int mSelectedPosition;
    private boolean mScrolling;
    private boolean mIsRtl;
    private RecyclerView.LayoutManager mLayoutManager;
    private Adapter mAdapter;
    private TabIndicatorFactory mFactory;
    private Runnable mTabAnimSelector;
    private boolean mScrollingToCenter;

    public TabIndicatorView(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mScrollingToCenter = false;
        init(context, null, 0, 0);
    }

    public TabIndicatorView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mScrollingToCenter = false;
        init(context, attrs, 0, 0);
    }

    public TabIndicatorView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mScrollingToCenter = false;
        init(context, attrs, defStyleAttr, 0);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        setHorizontalScrollBarEnabled(false);
        this.mTabPadding = -1;
        this.mTabSingleLine = true;
        this.mCenterCurrentTab = false;
        this.mIndicatorHeight = -1;
        this.mIndicatorAtTop = false;
        this.mScrolling = false;
        this.mIsRtl = false;
        this.mPaint = new Paint(1);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(ThemeUtil.colorAccent(context, -1));
        this.mAdapter = new Adapter();
        setAdapter(this.mAdapter);
        this.mLayoutManager = new LinearLayoutManager(context, 0, this.mIsRtl);
        setLayoutManager(this.mLayoutManager);
        setItemAnimator(new DefaultItemAnimator());
        addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.rey.material.widget.TabIndicatorView.1
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                if (newState == 0) {
                    TabIndicatorView.this.updateIndicator(TabIndicatorView.this.mLayoutManager.findViewByPosition(TabIndicatorView.this.mSelectedPosition));
                }
            }

            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                TabIndicatorView.this.updateIndicator(TabIndicatorView.this.mLayoutManager.findViewByPosition(TabIndicatorView.this.mSelectedPosition));
            }
        });
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.TabPageIndicator, defStyleAttr, defStyleRes);
        int tabPadding = -1;
        int textAppearance = 0;
        int mode = -1;
        int rippleStyle = 0;
        boolean tabSingleLine = false;
        boolean singleLineDefined = false;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.TabPageIndicator_tpi_tabPadding) {
                tabPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.TabPageIndicator_tpi_tabRipple) {
                rippleStyle = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.TabPageIndicator_tpi_indicatorColor) {
                this.mPaint.setColor(a.getColor(attr, 0));
            } else if (attr == R.styleable.TabPageIndicator_tpi_indicatorHeight) {
                this.mIndicatorHeight = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.TabPageIndicator_tpi_indicatorAtTop) {
                this.mIndicatorAtTop = a.getBoolean(attr, true);
            } else if (attr == R.styleable.TabPageIndicator_tpi_tabSingleLine) {
                tabSingleLine = a.getBoolean(attr, true);
                singleLineDefined = true;
            } else if (attr == R.styleable.TabPageIndicator_tpi_centerCurrentTab) {
                this.mCenterCurrentTab = a.getBoolean(attr, true);
            } else if (attr == R.styleable.TabPageIndicator_android_textAppearance) {
                textAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.TabPageIndicator_tpi_mode) {
                mode = a.getInteger(attr, 0);
            }
        }
        a.recycle();
        if (this.mIndicatorHeight < 0) {
            this.mIndicatorHeight = ThemeUtil.dpToPx(context, 2);
        }
        boolean shouldNotify = false;
        if (tabPadding >= 0 && this.mTabPadding != tabPadding) {
            this.mTabPadding = tabPadding;
            shouldNotify = true;
        }
        if (singleLineDefined && this.mTabSingleLine != tabSingleLine) {
            this.mTabSingleLine = tabSingleLine;
            shouldNotify = true;
        }
        if (mode >= 0 && this.mMode != mode) {
            this.mMode = mode;
            this.mAdapter.setFixedWidth(0, 0);
            shouldNotify = true;
        }
        if (textAppearance != 0 && this.mTextAppearance != textAppearance) {
            this.mTextAppearance = textAppearance;
            shouldNotify = true;
        }
        if (rippleStyle != 0 && rippleStyle != this.mTabRippleStyle) {
            this.mTabRippleStyle = rippleStyle;
            shouldNotify = true;
        }
        if (shouldNotify) {
            this.mAdapter.notifyItemRangeChanged(0, this.mAdapter.getItemCount());
        }
        invalidate();
    }

    public void setTabIndicatorFactory(TabIndicatorFactory factory) {
        this.mFactory = factory;
        this.mAdapter.setFactory(factory);
    }

    private void animateToTab(final int position) {
        if (position < 0 || position >= this.mAdapter.getItemCount()) {
            return;
        }
        if (this.mTabAnimSelector != null) {
            removeCallbacks(this.mTabAnimSelector);
        }
        this.mTabAnimSelector = new Runnable() { // from class: com.rey.material.widget.TabIndicatorView.2
            @Override // java.lang.Runnable
            public void run() {
                View v = TabIndicatorView.this.mLayoutManager.findViewByPosition(position);
                if (!TabIndicatorView.this.mScrolling) {
                    TabIndicatorView.this.updateIndicator(v);
                }
                TabIndicatorView.this.smoothScrollToPosition(TabIndicatorView.this.mSelectedPosition);
                TabIndicatorView.this.mTabAnimSelector = null;
            }
        };
        post(this.mTabAnimSelector);
    }

    private void updateIndicator(int offset, int width) {
        this.mIndicatorOffset = offset;
        this.mIndicatorWidth = width;
        invalidate();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void updateIndicator(View view) {
        if (view != 0) {
            updateIndicator(view.getLeft(), view.getMeasuredWidth());
            ((Checkable) view).setChecked(true);
        } else {
            updateIndicator(getWidth(), 0);
        }
    }

    public void setCurrentTab(int position) {
        KeyEvent.Callback findViewByPosition;
        if (this.mSelectedPosition != position && (findViewByPosition = this.mLayoutManager.findViewByPosition(this.mSelectedPosition)) != null) {
            ((Checkable) findViewByPosition).setChecked(false);
        }
        this.mSelectedPosition = position;
        KeyEvent.Callback findViewByPosition2 = this.mLayoutManager.findViewByPosition(this.mSelectedPosition);
        if (findViewByPosition2 != null) {
            ((Checkable) findViewByPosition2).setChecked(true);
        }
        animateToTab(position);
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mTabAnimSelector != null) {
            post(this.mTabAnimSelector);
        }
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            onThemeChanged(null);
        }
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mTabAnimSelector != null) {
            removeCallbacks(this.mTabAnimSelector);
        }
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            this.mLayoutManager = new LinearLayoutManager(getContext(), 0, this.mIsRtl);
            setLayoutManager(this.mLayoutManager);
            requestLayout();
        }
    }

    protected void onMeasure(int widthSpec, int heightSpec) {
        super.onMeasure(widthSpec, heightSpec);
        if (this.mMode == 1) {
            int totalWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
            int count = this.mAdapter.getItemCount();
            if (count > 0) {
                int width = totalWidth / count;
                int lastWidth = totalWidth - (width * (count - 1));
                this.mAdapter.setFixedWidth(width, lastWidth);
                return;
            }
            this.mAdapter.setFixedWidth(totalWidth, totalWidth);
        }
    }

    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        updateIndicator(this.mLayoutManager.findViewByPosition(this.mSelectedPosition));
    }

    public void draw(@NonNull Canvas canvas) {
        super.draw(canvas);
        int x = this.mIndicatorOffset;
        int y = this.mIndicatorAtTop ? 0 : getHeight() - this.mIndicatorHeight;
        canvas.drawRect(x, y, x + this.mIndicatorWidth, y + this.mIndicatorHeight, this.mPaint);
    }

    protected void onTabScrollStateChanged(int state) {
        View v;
        if (this.mCenterCurrentTab) {
            if (state == 0 && !this.mScrollingToCenter && (v = this.mLayoutManager.findViewByPosition(this.mSelectedPosition)) != null) {
                int viewCenter = (v.getLeft() + v.getRight()) / 2;
                int parentCenter = (((getLeft() + getPaddingLeft()) + getRight()) - getPaddingRight()) / 2;
                int scrollNeeded = viewCenter - parentCenter;
                if (scrollNeeded != 0) {
                    smoothScrollBy(scrollNeeded, 0);
                    this.mScrollingToCenter = true;
                }
            }
            if (state == 1 || state == 2) {
                this.mScrollingToCenter = false;
            }
        }
        if (state == 0) {
            this.mScrolling = false;
            updateIndicator(this.mLayoutManager.findViewByPosition(this.mSelectedPosition));
        } else {
            this.mScrolling = true;
        }
    }

    protected void onTabScrolled(int position, float positionOffset) {
        View scrollView = this.mLayoutManager.findViewByPosition(position);
        View nextView = this.mLayoutManager.findViewByPosition(position + 1);
        if (scrollView != null && nextView != null) {
            int width_scroll = scrollView.getMeasuredWidth();
            int width_next = nextView.getMeasuredWidth();
            float distance = (width_scroll + width_next) / 2.0f;
            int width = (int) (width_scroll + ((width_next - width_scroll) * positionOffset) + 0.5f);
            int offset = (int) ((((scrollView.getLeft() + (width_scroll / 2.0f)) + (distance * positionOffset)) - (width / 2.0f)) + 0.5f);
            updateIndicator(offset, width);
        }
    }

    protected void onTabSelected(int position) {
        setCurrentTab(position);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TabIndicatorView$TabIndicatorFactory.class */
    public static abstract class TabIndicatorFactory {
        private TabIndicatorView mView;

        public abstract int getTabIndicatorCount();

        public abstract boolean isIconTabIndicator(int i);

        public abstract Drawable getIcon(int i);

        public abstract CharSequence getText(int i);

        public abstract int getCurrentTabIndicator();

        public abstract void onTabIndicatorSelected(int i);

        protected void setTabIndicatorView(TabIndicatorView view) {
            this.mView = view;
        }

        public final void notifyTabScrollStateChanged(int state) {
            this.mView.onTabScrollStateChanged(state);
        }

        public final void notifyTabScrolled(int position, float positionOffset) {
            this.mView.onTabScrolled(position, positionOffset);
        }

        public final void notifyTabSelected(int position) {
            this.mView.onTabSelected(position);
        }

        public final void notifyDataSetChanged() {
            this.mView.getAdapter().notifyDataSetChanged();
        }

        public final void notifyTabChanged(int position) {
            this.mView.getAdapter().notifyItemRangeChanged(position, 1);
        }

        public final void notifyTabRangeChanged(int positionStart, int itemCount) {
            this.mView.getAdapter().notifyItemRangeChanged(positionStart, itemCount);
        }

        public final void notifyTabInserted(int position) {
            this.mView.getAdapter().notifyItemRangeInserted(position, 1);
        }

        public final void notifyTabMoved(int fromPosition, int toPosition) {
            this.mView.getAdapter().notifyItemMoved(fromPosition, toPosition);
        }

        public final void notifyTabRangeInserted(int positionStart, int itemCount) {
            this.mView.getAdapter().notifyItemRangeInserted(positionStart, itemCount);
        }

        public final void notifyTabRemoved(int position) {
            this.mView.getAdapter().notifyItemRangeRemoved(position, 1);
        }

        public final void notifyTabRangeRemoved(int positionStart, int itemCount) {
            this.mView.getAdapter().notifyItemRangeRemoved(positionStart, itemCount);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TabIndicatorView$Adapter.class */
    class Adapter extends RecyclerView.Adapter<ViewHolder> implements View.OnClickListener {
        TabIndicatorFactory mFactory;
        static final int TYPE_TEXT = 0;
        static final int TYPE_ICON = 1;
        int mFixedWidth;
        int mLastFixedWidth;

        Adapter() {
        }

        public void setFactory(TabIndicatorFactory factory) {
            if (this.mFactory != null) {
                this.mFactory.setTabIndicatorView(null);
            }
            int prevCount = getItemCount();
            if (prevCount > 0) {
                notifyItemRangeRemoved(0, prevCount);
            }
            this.mFactory = factory;
            if (this.mFactory != null) {
                this.mFactory.setTabIndicatorView(TabIndicatorView.this);
            }
            int count = getItemCount();
            if (count > 0) {
                notifyItemRangeInserted(0, count);
            }
            if (this.mFactory != null) {
                TabIndicatorView.this.onTabSelected(this.mFactory.getCurrentTabIndicator());
            }
        }

        public void setFixedWidth(int width, int lastWidth) {
            if (this.mFixedWidth != width || this.mLastFixedWidth != lastWidth) {
                this.mFixedWidth = width;
                this.mLastFixedWidth = lastWidth;
                int count = getItemCount();
                if (count > 0) {
                    notifyItemRangeChanged(0, count);
                }
            }
        }

        /* renamed from: onCreateViewHolder, reason: merged with bridge method [inline-methods] */
        public ViewHolder m18onCreateViewHolder(ViewGroup parent, int viewType) {
            View v = null;
            switch (viewType) {
                case 0:
                    v = new CheckedTextView(parent.getContext());
                    break;
                case 1:
                    v = new ImageButton(parent.getContext());
                    break;
            }
            ViewHolder holder = TabIndicatorView.this.new ViewHolder(v);
            v.setTag(holder);
            v.setLayoutParams(new ViewGroup.LayoutParams(-2, -1));
            v.setOnClickListener(this);
            switch (viewType) {
                case 0:
                    holder.textView.setCheckMarkDrawable((Drawable) null);
                    if (Build.VERSION.SDK_INT >= 17) {
                        holder.textView.setTextAlignment(1);
                    }
                    holder.textView.setGravity(17);
                    holder.textView.setEllipsize(TextUtils.TruncateAt.END);
                    holder.textView.setSingleLine(true);
                    break;
                case 1:
                    holder.iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                    break;
            }
            return holder;
        }

        public void onBindViewHolder(ViewHolder holder, int position) {
            int viewType = getItemViewType(position);
            ViewGroup.LayoutParams params = holder.itemView.getLayoutParams();
            if (this.mFixedWidth > 0) {
                params.width = position == getItemCount() - 1 ? this.mLastFixedWidth : this.mFixedWidth;
            } else {
                params.width = -2;
            }
            holder.itemView.setLayoutParams(params);
            if (holder.padding != TabIndicatorView.this.mTabPadding) {
                holder.padding = TabIndicatorView.this.mTabPadding;
                holder.itemView.setPadding(TabIndicatorView.this.mTabPadding, 0, TabIndicatorView.this.mTabPadding, 0);
            }
            if (holder.rippleStyle != TabIndicatorView.this.mTabRippleStyle) {
                holder.rippleStyle = TabIndicatorView.this.mTabRippleStyle;
                if (TabIndicatorView.this.mTabRippleStyle > 0) {
                    ViewUtil.setBackground(holder.itemView, new RippleDrawable.Builder(TabIndicatorView.this.getContext(), TabIndicatorView.this.mTabRippleStyle).build());
                }
            }
            switch (viewType) {
                case 0:
                    if (holder.textAppearance != TabIndicatorView.this.mTextAppearance) {
                        holder.textAppearance = TabIndicatorView.this.mTextAppearance;
                        holder.textView.setTextAppearance(TabIndicatorView.this.getContext(), TabIndicatorView.this.mTextAppearance);
                    }
                    if (holder.singleLine != TabIndicatorView.this.mTabSingleLine) {
                        holder.singleLine = TabIndicatorView.this.mTabSingleLine;
                        if (TabIndicatorView.this.mTabSingleLine) {
                            holder.textView.setSingleLine(true);
                        } else {
                            holder.textView.setSingleLine(false);
                            holder.textView.setMaxLines(2);
                        }
                    }
                    holder.textView.setText(this.mFactory.getText(position));
                    holder.textView.setChecked(position == TabIndicatorView.this.mSelectedPosition);
                    break;
                case 1:
                    holder.iconView.setImageDrawable(this.mFactory.getIcon(position));
                    holder.iconView.setChecked(position == TabIndicatorView.this.mSelectedPosition);
                    break;
            }
        }

        public int getItemViewType(int position) {
            return this.mFactory.isIconTabIndicator(position) ? 1 : 0;
        }

        public int getItemCount() {
            if (this.mFactory == null) {
                return 0;
            }
            return this.mFactory.getTabIndicatorCount();
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            ViewHolder holder = (ViewHolder) view.getTag();
            this.mFactory.onTabIndicatorSelected(holder.getAdapterPosition());
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TabIndicatorView$ViewHolder.class */
    class ViewHolder extends RecyclerView.ViewHolder {
        CheckedTextView textView;
        CheckedImageView iconView;
        int rippleStyle;
        boolean singleLine;
        int textAppearance;
        int padding;

        public ViewHolder(View itemView) {
            super(itemView);
            this.rippleStyle = 0;
            this.singleLine = true;
            this.textAppearance = 0;
            this.padding = 0;
            if (itemView instanceof CheckedImageView) {
                this.iconView = (CheckedImageView) itemView;
            } else if (itemView instanceof CheckedTextView) {
                this.textView = (CheckedTextView) itemView;
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory.class */
    public static class ViewPagerIndicatorFactory extends TabIndicatorFactory implements ViewPager.OnPageChangeListener {
        ViewPager mViewPager;

        public ViewPagerIndicatorFactory(ViewPager vp) {
            this.mViewPager = vp;
            this.mViewPager.addOnPageChangeListener(this);
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public int getTabIndicatorCount() {
            return this.mViewPager.getAdapter().getCount();
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public boolean isIconTabIndicator(int position) {
            return false;
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public Drawable getIcon(int position) {
            return null;
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public CharSequence getText(int position) {
            return this.mViewPager.getAdapter().getPageTitle(position);
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public void onTabIndicatorSelected(int position) {
            this.mViewPager.setCurrentItem(position, true);
        }

        @Override // com.rey.material.widget.TabIndicatorView.TabIndicatorFactory
        public int getCurrentTabIndicator() {
            return this.mViewPager.getCurrentItem();
        }

        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            notifyTabScrolled(position, positionOffset);
        }

        public void onPageSelected(int position) {
            notifyTabSelected(position);
        }

        public void onPageScrollStateChanged(int state) {
            switch (state) {
                case 0:
                    notifyTabScrollStateChanged(0);
                    break;
                case 1:
                    notifyTabScrollStateChanged(1);
                    break;
                case 2:
                    notifyTabScrollStateChanged(2);
                    break;
            }
        }
    }
}
