package me.relex.circleindicator;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.support.annotation.AnimatorRes;
import android.support.annotation.DrawableRes;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;

/* loaded from: me.relex.circleindicator.1.2.0.jar:me/relex/circleindicator/CircleIndicator.class */
public class CircleIndicator extends LinearLayout {
    private static final int DEFAULT_INDICATOR_WIDTH = 5;
    private ViewPager mViewpager;
    private int mIndicatorMargin;
    private int mIndicatorWidth;
    private int mIndicatorHeight;
    private int mAnimatorResId;
    private int mAnimatorReverseResId;
    private int mIndicatorBackgroundResId;
    private int mIndicatorUnselectedBackgroundResId;
    private Animator mAnimatorOut;
    private Animator mAnimatorIn;
    private Animator mImmediateAnimatorOut;
    private Animator mImmediateAnimatorIn;
    private int mLastPosition;
    private final ViewPager.OnPageChangeListener mInternalPageChangeListener;
    private DataSetObserver mInternalDataSetObserver;

    public CircleIndicator(Context context) {
        super(context);
        this.mIndicatorMargin = -1;
        this.mIndicatorWidth = -1;
        this.mIndicatorHeight = -1;
        this.mAnimatorResId = R.animator.scale_with_alpha;
        this.mAnimatorReverseResId = 0;
        this.mIndicatorBackgroundResId = R.drawable.white_radius;
        this.mIndicatorUnselectedBackgroundResId = R.drawable.white_radius;
        this.mLastPosition = -1;
        this.mInternalPageChangeListener = new ViewPager.OnPageChangeListener() { // from class: me.relex.circleindicator.CircleIndicator.1
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                View currentIndicator;
                if (CircleIndicator.this.mViewpager.getAdapter() != null && CircleIndicator.this.mViewpager.getAdapter().getCount() > 0) {
                    if (CircleIndicator.this.mAnimatorIn.isRunning()) {
                        CircleIndicator.this.mAnimatorIn.end();
                        CircleIndicator.this.mAnimatorIn.cancel();
                    }
                    if (CircleIndicator.this.mAnimatorOut.isRunning()) {
                        CircleIndicator.this.mAnimatorOut.end();
                        CircleIndicator.this.mAnimatorOut.cancel();
                    }
                    if (CircleIndicator.this.mLastPosition >= 0 && (currentIndicator = CircleIndicator.this.getChildAt(CircleIndicator.this.mLastPosition)) != null) {
                        currentIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorUnselectedBackgroundResId);
                        CircleIndicator.this.mAnimatorIn.setTarget(currentIndicator);
                        CircleIndicator.this.mAnimatorIn.start();
                    }
                    View selectedIndicator = CircleIndicator.this.getChildAt(position);
                    if (selectedIndicator != null) {
                        selectedIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorBackgroundResId);
                        CircleIndicator.this.mAnimatorOut.setTarget(selectedIndicator);
                        CircleIndicator.this.mAnimatorOut.start();
                    }
                    CircleIndicator.this.mLastPosition = position;
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        };
        this.mInternalDataSetObserver = new DataSetObserver() { // from class: me.relex.circleindicator.CircleIndicator.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                super.onChanged();
                if (CircleIndicator.this.mViewpager != null) {
                    int newCount = CircleIndicator.this.mViewpager.getAdapter().getCount();
                    int currentCount = CircleIndicator.this.getChildCount();
                    if (newCount != currentCount) {
                        if (CircleIndicator.this.mLastPosition >= newCount) {
                            CircleIndicator.this.mLastPosition = -1;
                        } else {
                            CircleIndicator.this.mLastPosition = CircleIndicator.this.mViewpager.getCurrentItem();
                        }
                        CircleIndicator.this.createIndicators();
                    }
                }
            }
        };
        init(context, null);
    }

    public CircleIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mIndicatorMargin = -1;
        this.mIndicatorWidth = -1;
        this.mIndicatorHeight = -1;
        this.mAnimatorResId = R.animator.scale_with_alpha;
        this.mAnimatorReverseResId = 0;
        this.mIndicatorBackgroundResId = R.drawable.white_radius;
        this.mIndicatorUnselectedBackgroundResId = R.drawable.white_radius;
        this.mLastPosition = -1;
        this.mInternalPageChangeListener = new ViewPager.OnPageChangeListener() { // from class: me.relex.circleindicator.CircleIndicator.1
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                View currentIndicator;
                if (CircleIndicator.this.mViewpager.getAdapter() != null && CircleIndicator.this.mViewpager.getAdapter().getCount() > 0) {
                    if (CircleIndicator.this.mAnimatorIn.isRunning()) {
                        CircleIndicator.this.mAnimatorIn.end();
                        CircleIndicator.this.mAnimatorIn.cancel();
                    }
                    if (CircleIndicator.this.mAnimatorOut.isRunning()) {
                        CircleIndicator.this.mAnimatorOut.end();
                        CircleIndicator.this.mAnimatorOut.cancel();
                    }
                    if (CircleIndicator.this.mLastPosition >= 0 && (currentIndicator = CircleIndicator.this.getChildAt(CircleIndicator.this.mLastPosition)) != null) {
                        currentIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorUnselectedBackgroundResId);
                        CircleIndicator.this.mAnimatorIn.setTarget(currentIndicator);
                        CircleIndicator.this.mAnimatorIn.start();
                    }
                    View selectedIndicator = CircleIndicator.this.getChildAt(position);
                    if (selectedIndicator != null) {
                        selectedIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorBackgroundResId);
                        CircleIndicator.this.mAnimatorOut.setTarget(selectedIndicator);
                        CircleIndicator.this.mAnimatorOut.start();
                    }
                    CircleIndicator.this.mLastPosition = position;
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        };
        this.mInternalDataSetObserver = new DataSetObserver() { // from class: me.relex.circleindicator.CircleIndicator.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                super.onChanged();
                if (CircleIndicator.this.mViewpager != null) {
                    int newCount = CircleIndicator.this.mViewpager.getAdapter().getCount();
                    int currentCount = CircleIndicator.this.getChildCount();
                    if (newCount != currentCount) {
                        if (CircleIndicator.this.mLastPosition >= newCount) {
                            CircleIndicator.this.mLastPosition = -1;
                        } else {
                            CircleIndicator.this.mLastPosition = CircleIndicator.this.mViewpager.getCurrentItem();
                        }
                        CircleIndicator.this.createIndicators();
                    }
                }
            }
        };
        init(context, attrs);
    }

    public CircleIndicator(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mIndicatorMargin = -1;
        this.mIndicatorWidth = -1;
        this.mIndicatorHeight = -1;
        this.mAnimatorResId = R.animator.scale_with_alpha;
        this.mAnimatorReverseResId = 0;
        this.mIndicatorBackgroundResId = R.drawable.white_radius;
        this.mIndicatorUnselectedBackgroundResId = R.drawable.white_radius;
        this.mLastPosition = -1;
        this.mInternalPageChangeListener = new ViewPager.OnPageChangeListener() { // from class: me.relex.circleindicator.CircleIndicator.1
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                View currentIndicator;
                if (CircleIndicator.this.mViewpager.getAdapter() != null && CircleIndicator.this.mViewpager.getAdapter().getCount() > 0) {
                    if (CircleIndicator.this.mAnimatorIn.isRunning()) {
                        CircleIndicator.this.mAnimatorIn.end();
                        CircleIndicator.this.mAnimatorIn.cancel();
                    }
                    if (CircleIndicator.this.mAnimatorOut.isRunning()) {
                        CircleIndicator.this.mAnimatorOut.end();
                        CircleIndicator.this.mAnimatorOut.cancel();
                    }
                    if (CircleIndicator.this.mLastPosition >= 0 && (currentIndicator = CircleIndicator.this.getChildAt(CircleIndicator.this.mLastPosition)) != null) {
                        currentIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorUnselectedBackgroundResId);
                        CircleIndicator.this.mAnimatorIn.setTarget(currentIndicator);
                        CircleIndicator.this.mAnimatorIn.start();
                    }
                    View selectedIndicator = CircleIndicator.this.getChildAt(position);
                    if (selectedIndicator != null) {
                        selectedIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorBackgroundResId);
                        CircleIndicator.this.mAnimatorOut.setTarget(selectedIndicator);
                        CircleIndicator.this.mAnimatorOut.start();
                    }
                    CircleIndicator.this.mLastPosition = position;
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        };
        this.mInternalDataSetObserver = new DataSetObserver() { // from class: me.relex.circleindicator.CircleIndicator.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                super.onChanged();
                if (CircleIndicator.this.mViewpager != null) {
                    int newCount = CircleIndicator.this.mViewpager.getAdapter().getCount();
                    int currentCount = CircleIndicator.this.getChildCount();
                    if (newCount != currentCount) {
                        if (CircleIndicator.this.mLastPosition >= newCount) {
                            CircleIndicator.this.mLastPosition = -1;
                        } else {
                            CircleIndicator.this.mLastPosition = CircleIndicator.this.mViewpager.getCurrentItem();
                        }
                        CircleIndicator.this.createIndicators();
                    }
                }
            }
        };
        init(context, attrs);
    }

    @TargetApi(21)
    public CircleIndicator(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mIndicatorMargin = -1;
        this.mIndicatorWidth = -1;
        this.mIndicatorHeight = -1;
        this.mAnimatorResId = R.animator.scale_with_alpha;
        this.mAnimatorReverseResId = 0;
        this.mIndicatorBackgroundResId = R.drawable.white_radius;
        this.mIndicatorUnselectedBackgroundResId = R.drawable.white_radius;
        this.mLastPosition = -1;
        this.mInternalPageChangeListener = new ViewPager.OnPageChangeListener() { // from class: me.relex.circleindicator.CircleIndicator.1
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                View currentIndicator;
                if (CircleIndicator.this.mViewpager.getAdapter() != null && CircleIndicator.this.mViewpager.getAdapter().getCount() > 0) {
                    if (CircleIndicator.this.mAnimatorIn.isRunning()) {
                        CircleIndicator.this.mAnimatorIn.end();
                        CircleIndicator.this.mAnimatorIn.cancel();
                    }
                    if (CircleIndicator.this.mAnimatorOut.isRunning()) {
                        CircleIndicator.this.mAnimatorOut.end();
                        CircleIndicator.this.mAnimatorOut.cancel();
                    }
                    if (CircleIndicator.this.mLastPosition >= 0 && (currentIndicator = CircleIndicator.this.getChildAt(CircleIndicator.this.mLastPosition)) != null) {
                        currentIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorUnselectedBackgroundResId);
                        CircleIndicator.this.mAnimatorIn.setTarget(currentIndicator);
                        CircleIndicator.this.mAnimatorIn.start();
                    }
                    View selectedIndicator = CircleIndicator.this.getChildAt(position);
                    if (selectedIndicator != null) {
                        selectedIndicator.setBackgroundResource(CircleIndicator.this.mIndicatorBackgroundResId);
                        CircleIndicator.this.mAnimatorOut.setTarget(selectedIndicator);
                        CircleIndicator.this.mAnimatorOut.start();
                    }
                    CircleIndicator.this.mLastPosition = position;
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        };
        this.mInternalDataSetObserver = new DataSetObserver() { // from class: me.relex.circleindicator.CircleIndicator.2
            @Override // android.database.DataSetObserver
            public void onChanged() {
                super.onChanged();
                if (CircleIndicator.this.mViewpager != null) {
                    int newCount = CircleIndicator.this.mViewpager.getAdapter().getCount();
                    int currentCount = CircleIndicator.this.getChildCount();
                    if (newCount != currentCount) {
                        if (CircleIndicator.this.mLastPosition >= newCount) {
                            CircleIndicator.this.mLastPosition = -1;
                        } else {
                            CircleIndicator.this.mLastPosition = CircleIndicator.this.mViewpager.getCurrentItem();
                        }
                        CircleIndicator.this.createIndicators();
                    }
                }
            }
        };
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        handleTypedArray(context, attrs);
        checkIndicatorConfig(context);
    }

    private void handleTypedArray(Context context, AttributeSet attrs) {
        if (attrs == null) {
            return;
        }
        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.CircleIndicator);
        this.mIndicatorWidth = typedArray.getDimensionPixelSize(R.styleable.CircleIndicator_ci_width, -1);
        this.mIndicatorHeight = typedArray.getDimensionPixelSize(R.styleable.CircleIndicator_ci_height, -1);
        this.mIndicatorMargin = typedArray.getDimensionPixelSize(R.styleable.CircleIndicator_ci_margin, -1);
        this.mAnimatorResId = typedArray.getResourceId(R.styleable.CircleIndicator_ci_animator, R.animator.scale_with_alpha);
        this.mAnimatorReverseResId = typedArray.getResourceId(R.styleable.CircleIndicator_ci_animator_reverse, 0);
        this.mIndicatorBackgroundResId = typedArray.getResourceId(R.styleable.CircleIndicator_ci_drawable, R.drawable.white_radius);
        this.mIndicatorUnselectedBackgroundResId = typedArray.getResourceId(R.styleable.CircleIndicator_ci_drawable_unselected, this.mIndicatorBackgroundResId);
        int orientation = typedArray.getInt(R.styleable.CircleIndicator_orientation, -1);
        setOrientation(orientation == 1 ? 1 : 0);
        int gravity = typedArray.getInt(R.styleable.CircleIndicator_gravity, -1);
        setGravity(gravity >= 0 ? gravity : 17);
        typedArray.recycle();
    }

    public void configureIndicator(int indicatorWidth, int indicatorHeight, int indicatorMargin) {
        configureIndicator(indicatorWidth, indicatorHeight, indicatorMargin, R.animator.scale_with_alpha, 0, R.drawable.white_radius, R.drawable.white_radius);
    }

    public void configureIndicator(int indicatorWidth, int indicatorHeight, int indicatorMargin, @AnimatorRes int animatorId, @AnimatorRes int animatorReverseId, @DrawableRes int indicatorBackgroundId, @DrawableRes int indicatorUnselectedBackgroundId) {
        this.mIndicatorWidth = indicatorWidth;
        this.mIndicatorHeight = indicatorHeight;
        this.mIndicatorMargin = indicatorMargin;
        this.mAnimatorResId = animatorId;
        this.mAnimatorReverseResId = animatorReverseId;
        this.mIndicatorBackgroundResId = indicatorBackgroundId;
        this.mIndicatorUnselectedBackgroundResId = indicatorUnselectedBackgroundId;
        checkIndicatorConfig(getContext());
    }

    private void checkIndicatorConfig(Context context) {
        this.mIndicatorWidth = this.mIndicatorWidth < 0 ? dip2px(5.0f) : this.mIndicatorWidth;
        this.mIndicatorHeight = this.mIndicatorHeight < 0 ? dip2px(5.0f) : this.mIndicatorHeight;
        this.mIndicatorMargin = this.mIndicatorMargin < 0 ? dip2px(5.0f) : this.mIndicatorMargin;
        this.mAnimatorResId = this.mAnimatorResId == 0 ? R.animator.scale_with_alpha : this.mAnimatorResId;
        this.mAnimatorOut = createAnimatorOut(context);
        this.mImmediateAnimatorOut = createAnimatorOut(context);
        this.mImmediateAnimatorOut.setDuration(0L);
        this.mAnimatorIn = createAnimatorIn(context);
        this.mImmediateAnimatorIn = createAnimatorIn(context);
        this.mImmediateAnimatorIn.setDuration(0L);
        this.mIndicatorBackgroundResId = this.mIndicatorBackgroundResId == 0 ? R.drawable.white_radius : this.mIndicatorBackgroundResId;
        this.mIndicatorUnselectedBackgroundResId = this.mIndicatorUnselectedBackgroundResId == 0 ? this.mIndicatorBackgroundResId : this.mIndicatorUnselectedBackgroundResId;
    }

    private Animator createAnimatorOut(Context context) {
        return AnimatorInflater.loadAnimator(context, this.mAnimatorResId);
    }

    private Animator createAnimatorIn(Context context) {
        Animator animatorIn;
        if (this.mAnimatorReverseResId == 0) {
            animatorIn = AnimatorInflater.loadAnimator(context, this.mAnimatorResId);
            animatorIn.setInterpolator(new ReverseInterpolator());
        } else {
            animatorIn = AnimatorInflater.loadAnimator(context, this.mAnimatorReverseResId);
        }
        return animatorIn;
    }

    public void setViewPager(ViewPager viewPager) {
        this.mViewpager = viewPager;
        if (this.mViewpager != null && this.mViewpager.getAdapter() != null) {
            this.mLastPosition = -1;
            createIndicators();
            this.mViewpager.removeOnPageChangeListener(this.mInternalPageChangeListener);
            this.mViewpager.addOnPageChangeListener(this.mInternalPageChangeListener);
            this.mInternalPageChangeListener.onPageSelected(this.mViewpager.getCurrentItem());
        }
    }

    public DataSetObserver getDataSetObserver() {
        return this.mInternalDataSetObserver;
    }

    @Deprecated
    public void setOnPageChangeListener(ViewPager.OnPageChangeListener onPageChangeListener) {
        if (this.mViewpager == null) {
            throw new NullPointerException("can not find Viewpager , setViewPager first");
        }
        this.mViewpager.removeOnPageChangeListener(onPageChangeListener);
        this.mViewpager.addOnPageChangeListener(onPageChangeListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createIndicators() {
        removeAllViews();
        int count = this.mViewpager.getAdapter().getCount();
        if (count <= 0) {
            return;
        }
        int currentItem = this.mViewpager.getCurrentItem();
        for (int i = 0; i < count; i++) {
            if (currentItem == i) {
                addIndicator(this.mIndicatorBackgroundResId, this.mImmediateAnimatorOut);
            } else {
                addIndicator(this.mIndicatorUnselectedBackgroundResId, this.mImmediateAnimatorIn);
            }
        }
    }

    private void addIndicator(@DrawableRes int backgroundDrawableId, Animator animator) {
        if (animator.isRunning()) {
            animator.end();
            animator.cancel();
        }
        View Indicator = new View(getContext());
        Indicator.setBackgroundResource(backgroundDrawableId);
        addView(Indicator, this.mIndicatorWidth, this.mIndicatorHeight);
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) Indicator.getLayoutParams();
        lp.leftMargin = this.mIndicatorMargin;
        lp.rightMargin = this.mIndicatorMargin;
        Indicator.setLayoutParams(lp);
        animator.setTarget(Indicator);
        animator.start();
    }

    /* loaded from: me.relex.circleindicator.1.2.0.jar:me/relex/circleindicator/CircleIndicator$ReverseInterpolator.class */
    private class ReverseInterpolator implements Interpolator {
        private ReverseInterpolator() {
        }

        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float value) {
            return Math.abs(1.0f - value);
        }
    }

    public int dip2px(float dpValue) {
        float scale = getResources().getDisplayMetrics().density;
        return (int) ((dpValue * scale) + 0.5f);
    }
}
