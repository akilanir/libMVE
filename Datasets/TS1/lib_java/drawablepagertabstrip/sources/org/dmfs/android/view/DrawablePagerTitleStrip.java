package org.dmfs.android.view;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v4.view.PagerAdapter;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import org.dmfs.android.view.ViewPager;

/* loaded from: drawablepagertabstrip.jar:org/dmfs/android/view/DrawablePagerTitleStrip.class */
public class DrawablePagerTitleStrip extends ViewGroup implements ViewPager.Decor {
    private static final String TAG = "PagerTitleStrip";
    ViewPager mPager;
    ImageView[] mImageViews;
    private int mLastKnownCurrentPage;
    private float mLastKnownPositionOffset;
    private int mScaledTextSpacing;
    private int mGravity;
    private boolean mUpdatingDrawables;
    private boolean mUpdatingPositions;
    private final PageListener mPageListener;
    private WeakReference<PagerAdapter> mWatchingAdapter;
    private static final int[] ATTRS = {R.attr.gravity};
    private static final int TEXT_SPACING = 16;

    public DrawablePagerTitleStrip(Context context) {
        this(context, null);
    }

    public DrawablePagerTitleStrip(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mImageViews = null;
        this.mLastKnownCurrentPage = -1;
        this.mLastKnownPositionOffset = -1.0f;
        this.mPageListener = new PageListener(this, null);
        TypedArray a = context.obtainStyledAttributes(attrs, ATTRS);
        this.mGravity = a.getInteger(0, 80);
        a.recycle();
        float density = context.getResources().getDisplayMetrics().density;
        this.mScaledTextSpacing = (int) (16.0f * density);
    }

    public void setTextSpacing(int spacingPixels) {
        this.mScaledTextSpacing = spacingPixels;
        requestLayout();
    }

    public int getTextSpacing() {
        return this.mScaledTextSpacing;
    }

    public void setGravity(int gravity) {
        this.mGravity = gravity;
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (!(parent instanceof ViewPager)) {
            throw new IllegalStateException("PagerTitleStrip must be a direct child of a ViewPager.");
        }
        ViewPager pager = (ViewPager) parent;
        PagerAdapter adapter = pager.getAdapter();
        pager.setInternalPageChangeListener(this.mPageListener);
        pager.setOnAdapterChangeListener(this.mPageListener);
        this.mPager = pager;
        updateAdapter(this.mWatchingAdapter != null ? this.mWatchingAdapter.get() : null, adapter);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mPager != null) {
            updateAdapter(this.mPager.getAdapter(), null);
            this.mPager.setInternalPageChangeListener(null);
            this.mPager.setOnAdapterChangeListener(null);
            this.mPager = null;
        }
    }

    void updateImages(int currentItem, PagerAdapter adapter) {
        if (this.mImageViews == null || this.mImageViews.length == 0 || !(adapter instanceof IDrawableTitlePagerAdapter)) {
            return;
        }
        IDrawableTitlePagerAdapter dAdapter = (IDrawableTitlePagerAdapter) adapter;
        int itemCount = adapter != null ? adapter.getCount() : 0;
        this.mUpdatingDrawables = true;
        int half = this.mImageViews.length / 2;
        int l = this.mImageViews.length;
        for (int i = 0; i < l; i++) {
            this.mImageViews[i].setImageDrawable((adapter == null || currentItem + (i - half) < 0 || currentItem + (i - half) >= itemCount) ? null : dAdapter.getDrawableTitle(currentItem + (i - half)));
        }
        int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
        int childHeight = (getHeight() - getPaddingTop()) - getPaddingBottom();
        int childWidthSpec = View.MeasureSpec.makeMeasureSpec((int) (width * 0.8f), Integer.MIN_VALUE);
        int childHeightSpec = View.MeasureSpec.makeMeasureSpec(childHeight, Integer.MIN_VALUE);
        for (ImageView iv : this.mImageViews) {
            iv.measure(childWidthSpec, childHeightSpec);
        }
        this.mLastKnownCurrentPage = currentItem;
        if (!this.mUpdatingPositions) {
            updateDrawablePositions(currentItem, this.mLastKnownPositionOffset, false);
        }
        this.mUpdatingDrawables = false;
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (!this.mUpdatingDrawables) {
            super.requestLayout();
        }
    }

    void updateAdapter(PagerAdapter oldAdapter, PagerAdapter newAdapter) {
        if (oldAdapter != null) {
            oldAdapter.unregisterDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = null;
        }
        if (newAdapter != null) {
            if (!(newAdapter instanceof IDrawableTitlePagerAdapter)) {
                throw new IllegalArgumentException("Adapter must implement IDrawableTitlePagerAdapter");
            }
            newAdapter.registerDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = new WeakReference<>(newAdapter);
            Context context = getContext();
            int newCount = Math.max(1, Math.min(9, newAdapter.getCount()));
            if (this.mImageViews == null || this.mImageViews.length < newCount) {
                ImageView[] newImages = new ImageView[newCount];
                int start = 0;
                if (this.mImageViews != null) {
                    System.arraycopy(this.mImageViews, 0, newImages, 0, this.mImageViews.length);
                    start = this.mImageViews.length;
                }
                for (int i = start; i < newCount; i++) {
                    ImageView imageView = new ImageView(context);
                    newImages[i] = imageView;
                    addView(imageView);
                }
                this.mImageViews = newImages;
            } else if (this.mImageViews.length > newCount) {
                ImageView[] newImages2 = new ImageView[newCount];
                System.arraycopy(this.mImageViews, 0, newImages2, 0, newCount);
                for (int i2 = newCount; i2 < this.mImageViews.length; i2++) {
                    removeView(this.mImageViews[i2]);
                }
                this.mImageViews = newImages2;
            }
        } else {
            this.mImageViews = null;
        }
        if (this.mPager != null) {
            this.mLastKnownCurrentPage = -1;
            this.mLastKnownPositionOffset = -1.0f;
            updateImages(this.mPager.getCurrentItem(), newAdapter);
            requestLayout();
        }
    }

    @SuppressLint({"NewApi"})
    void updateDrawablePositions(int position, float positionOffset, boolean force) {
        int top;
        int top2;
        if (this.mImageViews == null || this.mImageViews.length == 0) {
            return;
        }
        if (position != this.mLastKnownCurrentPage) {
            updateImages(position, this.mPager.getAdapter());
        } else if (!force && positionOffset == this.mLastKnownPositionOffset) {
            return;
        }
        this.mUpdatingPositions = true;
        int[] widths = new int[this.mImageViews.length];
        int l = this.mImageViews.length;
        for (int i = 0; i < l; i++) {
            widths[i] = this.mImageViews[i].getMeasuredWidth();
        }
        int stripWidth = getWidth();
        int stripHeight = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        float currOffset = positionOffset + 0.5f;
        if (currOffset > 1.0f) {
            currOffset -= 1.0f;
        }
        int currCenter = (stripWidth / 2) - ((int) ((widths[widths.length / 2] + this.mScaledTextSpacing) * (currOffset - 0.5f)));
        int currLeft = currCenter - (widths[widths.length / 2] / 2);
        int maxBaseline = 0;
        for (ImageView imageView : this.mImageViews) {
            maxBaseline = Math.max(maxBaseline, imageView.getBaseline());
        }
        int maxTextHeight = 0;
        for (ImageView iv : this.mImageViews) {
            maxTextHeight = Math.max(maxTextHeight, (maxBaseline - iv.getBaseline()) + iv.getMeasuredHeight());
        }
        int vgrav = this.mGravity & 112;
        int left = currLeft;
        int l2 = this.mImageViews.length;
        for (int i2 = this.mImageViews.length / 2; i2 < l2; i2++) {
            int baseline = this.mImageViews[i2].getBaseline();
            switch (vgrav) {
                case TEXT_SPACING /* 16 */:
                    int paddedHeight = (stripHeight - paddingTop) - paddingBottom;
                    int centeredTop = (paddedHeight - maxTextHeight) / 2;
                    top2 = (centeredTop + maxBaseline) - baseline;
                    break;
                case 48:
                default:
                    top2 = (paddingTop + maxBaseline) - baseline;
                    break;
                case 80:
                    int bottomGravTop = (stripHeight - paddingBottom) - maxTextHeight;
                    top2 = (bottomGravTop + maxBaseline) - baseline;
                    break;
            }
            int right = left + widths[i2];
            this.mImageViews[i2].layout(left, top2, right, top2 + this.mImageViews[i2].getMeasuredHeight());
            left += widths[i2] + this.mScaledTextSpacing;
            if (Build.VERSION.SDK_INT >= 14) {
                if (stripWidth - right < paddingRight) {
                    this.mImageViews[i2].setAlpha(1.0f - (Math.abs(Math.min((stripWidth - right) - paddingRight, 0)) / widths[i2]));
                } else {
                    this.mImageViews[i2].setAlpha(1.0f);
                }
            }
        }
        int left2 = currLeft;
        for (int i3 = (this.mImageViews.length / 2) - 1; i3 >= 0; i3--) {
            int baseline2 = this.mImageViews[i3].getBaseline();
            switch (vgrav) {
                case TEXT_SPACING /* 16 */:
                    int paddedHeight2 = (stripHeight - paddingTop) - paddingBottom;
                    int centeredTop2 = (paddedHeight2 - maxTextHeight) / 2;
                    top = (centeredTop2 + maxBaseline) - baseline2;
                    break;
                case 48:
                default:
                    top = (paddingTop + maxBaseline) - baseline2;
                    break;
                case 80:
                    int bottomGravTop2 = (stripHeight - paddingBottom) - maxTextHeight;
                    top = (bottomGravTop2 + maxBaseline) - baseline2;
                    break;
            }
            left2 -= widths[i3] + this.mScaledTextSpacing;
            this.mImageViews[i3].layout(left2, top, left2 + widths[i3], top + this.mImageViews[i3].getMeasuredHeight());
            if (Build.VERSION.SDK_INT >= 14) {
                if (left2 < paddingLeft) {
                    this.mImageViews[i3].setAlpha(1.0f - (Math.abs(Math.min(left2 - paddingLeft, 0)) / widths[i3]));
                } else {
                    this.mImageViews[i3].setAlpha(1.0f);
                }
            }
        }
        this.mLastKnownPositionOffset = positionOffset;
        this.mUpdatingPositions = false;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (widthMode != 1073741824) {
            throw new IllegalStateException("Must measure with an exact width");
        }
        int minHeight = getMinHeight();
        int padding = getPaddingTop() + getPaddingBottom();
        int childHeight = heightSize - padding;
        int childWidthSpec = View.MeasureSpec.makeMeasureSpec((int) (widthSize * 0.8f), Integer.MIN_VALUE);
        int childHeightSpec = View.MeasureSpec.makeMeasureSpec(childHeight, Integer.MIN_VALUE);
        for (ImageView iv : this.mImageViews) {
            iv.measure(childWidthSpec, childHeightSpec);
        }
        if (heightMode == 1073741824) {
            setMeasuredDimension(widthSize, heightSize);
        } else {
            int textHeight = this.mImageViews[this.mImageViews.length / 2].getMeasuredHeight();
            setMeasuredDimension(widthSize, Math.max(minHeight, textHeight + padding));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        if (this.mPager != null) {
            float offset = this.mLastKnownPositionOffset >= 0.0f ? this.mLastKnownPositionOffset : 0.0f;
            updateDrawablePositions(this.mLastKnownCurrentPage, offset, true);
        }
    }

    int getMinHeight() {
        int minHeight = 0;
        Drawable bg = getBackground();
        if (bg != null) {
            minHeight = bg.getIntrinsicHeight();
        }
        return minHeight;
    }

    /* loaded from: drawablepagertabstrip.jar:org/dmfs/android/view/DrawablePagerTitleStrip$PageListener.class */
    private class PageListener extends DataSetObserver implements ViewPager.OnPageChangeListener, ViewPager.OnAdapterChangeListener {
        private int mScrollState;

        private PageListener() {
        }

        /* synthetic */ PageListener(DrawablePagerTitleStrip drawablePagerTitleStrip, PageListener pageListener) {
            this();
        }

        @Override // org.dmfs.android.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            if (positionOffset > 0.5f) {
                position++;
            }
            DrawablePagerTitleStrip.this.updateDrawablePositions(position, positionOffset, false);
        }

        @Override // org.dmfs.android.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int position) {
        }

        @Override // org.dmfs.android.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int state) {
            this.mScrollState = state;
        }

        @Override // org.dmfs.android.view.ViewPager.OnAdapterChangeListener
        public void onAdapterChanged(PagerAdapter oldAdapter, PagerAdapter newAdapter) {
            DrawablePagerTitleStrip.this.updateAdapter(oldAdapter, newAdapter);
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            DrawablePagerTitleStrip.this.updateImages(DrawablePagerTitleStrip.this.mPager.getCurrentItem(), DrawablePagerTitleStrip.this.mPager.getAdapter());
            float offset = DrawablePagerTitleStrip.this.mLastKnownPositionOffset >= 0.0f ? DrawablePagerTitleStrip.this.mLastKnownPositionOffset : 0.0f;
            DrawablePagerTitleStrip.this.updateDrawablePositions(DrawablePagerTitleStrip.this.mPager.getCurrentItem(), offset, true);
        }
    }
}
