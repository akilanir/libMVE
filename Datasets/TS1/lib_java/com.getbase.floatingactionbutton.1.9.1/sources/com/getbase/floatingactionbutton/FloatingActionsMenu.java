package com.getbase.floatingactionbutton;

import android.R;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.ColorRes;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.TextView;

/* loaded from: com.getbase.floatingactionbutton.1.9.1.jar:com/getbase/floatingactionbutton/FloatingActionsMenu.class */
public class FloatingActionsMenu extends ViewGroup {
    public static final int EXPAND_UP = 0;
    public static final int EXPAND_DOWN = 1;
    public static final int EXPAND_LEFT = 2;
    public static final int EXPAND_RIGHT = 3;
    public static final int LABELS_ON_LEFT_SIDE = 0;
    public static final int LABELS_ON_RIGHT_SIDE = 1;
    private static final int ANIMATION_DURATION = 300;
    private static final float COLLAPSED_PLUS_ROTATION = 0.0f;
    private static final float EXPANDED_PLUS_ROTATION = 135.0f;
    private int mAddButtonPlusColor;
    private int mAddButtonColorNormal;
    private int mAddButtonColorPressed;
    private int mAddButtonSize;
    private boolean mAddButtonStrokeVisible;
    private int mExpandDirection;
    private int mButtonSpacing;
    private int mLabelsMargin;
    private int mLabelsVerticalOffset;
    private boolean mExpanded;
    private AnimatorSet mExpandAnimation;
    private AnimatorSet mCollapseAnimation;
    private AddFloatingActionButton mAddButton;
    private RotatingDrawable mRotatingDrawable;
    private int mMaxButtonWidth;
    private int mMaxButtonHeight;
    private int mLabelsStyle;
    private int mLabelsPosition;
    private int mButtonsCount;
    private TouchDelegateGroup mTouchDelegateGroup;
    private OnFloatingActionsMenuUpdateListener mListener;
    private static Interpolator sExpandInterpolator = new OvershootInterpolator();
    private static Interpolator sCollapseInterpolator = new DecelerateInterpolator(3.0f);
    private static Interpolator sAlphaExpandInterpolator = new DecelerateInterpolator();

    /* loaded from: com.getbase.floatingactionbutton.1.9.1.jar:com/getbase/floatingactionbutton/FloatingActionsMenu$OnFloatingActionsMenuUpdateListener.class */
    public interface OnFloatingActionsMenuUpdateListener {
        void onMenuExpanded();

        void onMenuCollapsed();
    }

    public FloatingActionsMenu(Context context) {
        this(context, null);
    }

    public FloatingActionsMenu(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mExpandAnimation = new AnimatorSet().setDuration(300L);
        this.mCollapseAnimation = new AnimatorSet().setDuration(300L);
        init(context, attrs);
    }

    public FloatingActionsMenu(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mExpandAnimation = new AnimatorSet().setDuration(300L);
        this.mCollapseAnimation = new AnimatorSet().setDuration(300L);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attributeSet) {
        this.mButtonSpacing = (int) ((getResources().getDimension(R.dimen.fab_actions_spacing) - getResources().getDimension(R.dimen.fab_shadow_radius)) - getResources().getDimension(R.dimen.fab_shadow_offset));
        this.mLabelsMargin = getResources().getDimensionPixelSize(R.dimen.fab_labels_margin);
        this.mLabelsVerticalOffset = getResources().getDimensionPixelSize(R.dimen.fab_shadow_offset);
        this.mTouchDelegateGroup = new TouchDelegateGroup(this);
        setTouchDelegate(this.mTouchDelegateGroup);
        TypedArray attr = context.obtainStyledAttributes(attributeSet, R.styleable.FloatingActionsMenu, 0, 0);
        this.mAddButtonPlusColor = attr.getColor(R.styleable.FloatingActionsMenu_fab_addButtonPlusIconColor, getColor(R.color.white));
        this.mAddButtonColorNormal = attr.getColor(R.styleable.FloatingActionsMenu_fab_addButtonColorNormal, getColor(R.color.holo_blue_dark));
        this.mAddButtonColorPressed = attr.getColor(R.styleable.FloatingActionsMenu_fab_addButtonColorPressed, getColor(R.color.holo_blue_light));
        this.mAddButtonSize = attr.getInt(R.styleable.FloatingActionsMenu_fab_addButtonSize, 0);
        this.mAddButtonStrokeVisible = attr.getBoolean(R.styleable.FloatingActionsMenu_fab_addButtonStrokeVisible, true);
        this.mExpandDirection = attr.getInt(R.styleable.FloatingActionsMenu_fab_expandDirection, 0);
        this.mLabelsStyle = attr.getResourceId(R.styleable.FloatingActionsMenu_fab_labelStyle, 0);
        this.mLabelsPosition = attr.getInt(R.styleable.FloatingActionsMenu_fab_labelsPosition, 0);
        attr.recycle();
        if (this.mLabelsStyle != 0 && expandsHorizontally()) {
            throw new IllegalStateException("Action labels in horizontal expand orientation is not supported.");
        }
        createAddButton(context);
    }

    public void setOnFloatingActionsMenuUpdateListener(OnFloatingActionsMenuUpdateListener listener) {
        this.mListener = listener;
    }

    private boolean expandsHorizontally() {
        return this.mExpandDirection == 2 || this.mExpandDirection == 3;
    }

    /* loaded from: com.getbase.floatingactionbutton.1.9.1.jar:com/getbase/floatingactionbutton/FloatingActionsMenu$RotatingDrawable.class */
    private static class RotatingDrawable extends LayerDrawable {
        private float mRotation;

        public RotatingDrawable(Drawable drawable) {
            super(new Drawable[]{drawable});
        }

        public float getRotation() {
            return this.mRotation;
        }

        public void setRotation(float rotation) {
            this.mRotation = rotation;
            invalidateSelf();
        }

        @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.save();
            canvas.rotate(this.mRotation, getBounds().centerX(), getBounds().centerY());
            super.draw(canvas);
            canvas.restore();
        }
    }

    private void createAddButton(Context context) {
        this.mAddButton = new AddFloatingActionButton(context) { // from class: com.getbase.floatingactionbutton.FloatingActionsMenu.1
            @Override // com.getbase.floatingactionbutton.FloatingActionButton
            void updateBackground() {
                this.mPlusColor = FloatingActionsMenu.this.mAddButtonPlusColor;
                this.mColorNormal = FloatingActionsMenu.this.mAddButtonColorNormal;
                this.mColorPressed = FloatingActionsMenu.this.mAddButtonColorPressed;
                this.mStrokeVisible = FloatingActionsMenu.this.mAddButtonStrokeVisible;
                super.updateBackground();
            }

            @Override // com.getbase.floatingactionbutton.AddFloatingActionButton, com.getbase.floatingactionbutton.FloatingActionButton
            Drawable getIconDrawable() {
                RotatingDrawable rotatingDrawable = new RotatingDrawable(super.getIconDrawable());
                FloatingActionsMenu.this.mRotatingDrawable = rotatingDrawable;
                OvershootInterpolator interpolator = new OvershootInterpolator();
                ObjectAnimator collapseAnimator = ObjectAnimator.ofFloat(rotatingDrawable, "rotation", FloatingActionsMenu.EXPANDED_PLUS_ROTATION, FloatingActionsMenu.COLLAPSED_PLUS_ROTATION);
                ObjectAnimator expandAnimator = ObjectAnimator.ofFloat(rotatingDrawable, "rotation", FloatingActionsMenu.COLLAPSED_PLUS_ROTATION, FloatingActionsMenu.EXPANDED_PLUS_ROTATION);
                collapseAnimator.setInterpolator(interpolator);
                expandAnimator.setInterpolator(interpolator);
                FloatingActionsMenu.this.mExpandAnimation.play(expandAnimator);
                FloatingActionsMenu.this.mCollapseAnimation.play(collapseAnimator);
                return rotatingDrawable;
            }
        };
        this.mAddButton.setId(R.id.fab_expand_menu_button);
        this.mAddButton.setSize(this.mAddButtonSize);
        this.mAddButton.setOnClickListener(new View.OnClickListener() { // from class: com.getbase.floatingactionbutton.FloatingActionsMenu.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                FloatingActionsMenu.this.toggle();
            }
        });
        addView(this.mAddButton, super.generateDefaultLayoutParams());
    }

    public void addButton(FloatingActionButton button) {
        addView(button, this.mButtonsCount - 1);
        this.mButtonsCount++;
        if (this.mLabelsStyle != 0) {
            createLabels();
        }
    }

    public void removeButton(FloatingActionButton button) {
        removeView(button.getLabelView());
        removeView(button);
        button.setTag(R.id.fab_label, null);
        this.mButtonsCount--;
    }

    private int getColor(@ColorRes int id) {
        return getResources().getColor(id);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        TextView label;
        measureChildren(widthMeasureSpec, heightMeasureSpec);
        int width = 0;
        int height = 0;
        this.mMaxButtonWidth = 0;
        this.mMaxButtonHeight = 0;
        int maxLabelWidth = 0;
        for (int i = 0; i < this.mButtonsCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                switch (this.mExpandDirection) {
                    case 0:
                    case 1:
                        this.mMaxButtonWidth = Math.max(this.mMaxButtonWidth, child.getMeasuredWidth());
                        height += child.getMeasuredHeight();
                        break;
                    case EXPAND_LEFT /* 2 */:
                    case EXPAND_RIGHT /* 3 */:
                        width += child.getMeasuredWidth();
                        this.mMaxButtonHeight = Math.max(this.mMaxButtonHeight, child.getMeasuredHeight());
                        break;
                }
                if (!expandsHorizontally() && (label = (TextView) child.getTag(R.id.fab_label)) != null) {
                    maxLabelWidth = Math.max(maxLabelWidth, label.getMeasuredWidth());
                }
            }
        }
        if (!expandsHorizontally()) {
            width = this.mMaxButtonWidth + (maxLabelWidth > 0 ? maxLabelWidth + this.mLabelsMargin : 0);
        } else {
            height = this.mMaxButtonHeight;
        }
        switch (this.mExpandDirection) {
            case 0:
            case 1:
                height = adjustForOvershoot(height + (this.mButtonSpacing * (getChildCount() - 1)));
                break;
            case EXPAND_LEFT /* 2 */:
            case EXPAND_RIGHT /* 3 */:
                width = adjustForOvershoot(width + (this.mButtonSpacing * (getChildCount() - 1)));
                break;
        }
        setMeasuredDimension(width, height);
    }

    private int adjustForOvershoot(int dimension) {
        return (dimension * 12) / 10;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int measuredWidth;
        switch (this.mExpandDirection) {
            case 0:
            case 1:
                boolean expandUp = this.mExpandDirection == 0;
                if (changed) {
                    this.mTouchDelegateGroup.clearTouchDelegates();
                }
                int addButtonY = expandUp ? (b - t) - this.mAddButton.getMeasuredHeight() : 0;
                int buttonsHorizontalCenter = this.mLabelsPosition == 0 ? (r - l) - (this.mMaxButtonWidth / 2) : this.mMaxButtonWidth / 2;
                int addButtonLeft = buttonsHorizontalCenter - (this.mAddButton.getMeasuredWidth() / 2);
                this.mAddButton.layout(addButtonLeft, addButtonY, addButtonLeft + this.mAddButton.getMeasuredWidth(), addButtonY + this.mAddButton.getMeasuredHeight());
                int labelsOffset = (this.mMaxButtonWidth / 2) + this.mLabelsMargin;
                int labelsXNearButton = this.mLabelsPosition == 0 ? buttonsHorizontalCenter - labelsOffset : buttonsHorizontalCenter + labelsOffset;
                int nextY = expandUp ? addButtonY - this.mButtonSpacing : addButtonY + this.mAddButton.getMeasuredHeight() + this.mButtonSpacing;
                for (int i = this.mButtonsCount - 1; i >= 0; i--) {
                    View child = getChildAt(i);
                    if (child != this.mAddButton && child.getVisibility() != 8) {
                        int childX = buttonsHorizontalCenter - (child.getMeasuredWidth() / 2);
                        int childY = expandUp ? nextY - child.getMeasuredHeight() : nextY;
                        child.layout(childX, childY, childX + child.getMeasuredWidth(), childY + child.getMeasuredHeight());
                        float collapsedTranslation = addButtonY - childY;
                        child.setTranslationY(this.mExpanded ? 0.0f : collapsedTranslation);
                        child.setAlpha(this.mExpanded ? 1.0f : COLLAPSED_PLUS_ROTATION);
                        LayoutParams params = (LayoutParams) child.getLayoutParams();
                        params.mCollapseDir.setFloatValues(COLLAPSED_PLUS_ROTATION, collapsedTranslation);
                        params.mExpandDir.setFloatValues(collapsedTranslation, COLLAPSED_PLUS_ROTATION);
                        params.setAnimationsTarget(child);
                        View label = (View) child.getTag(R.id.fab_label);
                        if (label != null) {
                            if (this.mLabelsPosition == 0) {
                                measuredWidth = labelsXNearButton - label.getMeasuredWidth();
                            } else {
                                measuredWidth = labelsXNearButton + label.getMeasuredWidth();
                            }
                            int labelXAwayFromButton = measuredWidth;
                            int labelLeft = this.mLabelsPosition == 0 ? labelXAwayFromButton : labelsXNearButton;
                            int labelRight = this.mLabelsPosition == 0 ? labelsXNearButton : labelXAwayFromButton;
                            int labelTop = (childY - this.mLabelsVerticalOffset) + ((child.getMeasuredHeight() - label.getMeasuredHeight()) / 2);
                            label.layout(labelLeft, labelTop, labelRight, labelTop + label.getMeasuredHeight());
                            Rect touchArea = new Rect(Math.min(childX, labelLeft), childY - (this.mButtonSpacing / 2), Math.max(childX + child.getMeasuredWidth(), labelRight), childY + child.getMeasuredHeight() + (this.mButtonSpacing / 2));
                            this.mTouchDelegateGroup.addTouchDelegate(new TouchDelegate(touchArea, child));
                            label.setTranslationY(this.mExpanded ? 0.0f : collapsedTranslation);
                            label.setAlpha(this.mExpanded ? 1.0f : COLLAPSED_PLUS_ROTATION);
                            LayoutParams labelParams = (LayoutParams) label.getLayoutParams();
                            labelParams.mCollapseDir.setFloatValues(COLLAPSED_PLUS_ROTATION, collapsedTranslation);
                            labelParams.mExpandDir.setFloatValues(collapsedTranslation, COLLAPSED_PLUS_ROTATION);
                            labelParams.setAnimationsTarget(label);
                        }
                        nextY = expandUp ? childY - this.mButtonSpacing : childY + child.getMeasuredHeight() + this.mButtonSpacing;
                    }
                }
                break;
            case EXPAND_LEFT /* 2 */:
            case EXPAND_RIGHT /* 3 */:
                boolean expandLeft = this.mExpandDirection == 2;
                int addButtonX = expandLeft ? (r - l) - this.mAddButton.getMeasuredWidth() : 0;
                int addButtonTop = ((b - t) - this.mMaxButtonHeight) + ((this.mMaxButtonHeight - this.mAddButton.getMeasuredHeight()) / 2);
                this.mAddButton.layout(addButtonX, addButtonTop, addButtonX + this.mAddButton.getMeasuredWidth(), addButtonTop + this.mAddButton.getMeasuredHeight());
                int nextX = expandLeft ? addButtonX - this.mButtonSpacing : addButtonX + this.mAddButton.getMeasuredWidth() + this.mButtonSpacing;
                for (int i2 = this.mButtonsCount - 1; i2 >= 0; i2--) {
                    View child2 = getChildAt(i2);
                    if (child2 != this.mAddButton && child2.getVisibility() != 8) {
                        int childX2 = expandLeft ? nextX - child2.getMeasuredWidth() : nextX;
                        int childY2 = addButtonTop + ((this.mAddButton.getMeasuredHeight() - child2.getMeasuredHeight()) / 2);
                        child2.layout(childX2, childY2, childX2 + child2.getMeasuredWidth(), childY2 + child2.getMeasuredHeight());
                        float collapsedTranslation2 = addButtonX - childX2;
                        child2.setTranslationX(this.mExpanded ? 0.0f : collapsedTranslation2);
                        child2.setAlpha(this.mExpanded ? 1.0f : COLLAPSED_PLUS_ROTATION);
                        LayoutParams params2 = (LayoutParams) child2.getLayoutParams();
                        params2.mCollapseDir.setFloatValues(COLLAPSED_PLUS_ROTATION, collapsedTranslation2);
                        params2.mExpandDir.setFloatValues(collapsedTranslation2, COLLAPSED_PLUS_ROTATION);
                        params2.setAnimationsTarget(child2);
                        nextX = expandLeft ? childX2 - this.mButtonSpacing : childX2 + child2.getMeasuredWidth() + this.mButtonSpacing;
                    }
                }
                break;
        }
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(super.generateDefaultLayoutParams());
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(super.generateLayoutParams(attrs));
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(super.generateLayoutParams(p));
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return super.checkLayoutParams(p);
    }

    /* loaded from: com.getbase.floatingactionbutton.1.9.1.jar:com/getbase/floatingactionbutton/FloatingActionsMenu$LayoutParams.class */
    private class LayoutParams extends ViewGroup.LayoutParams {
        private ObjectAnimator mExpandDir;
        private ObjectAnimator mExpandAlpha;
        private ObjectAnimator mCollapseDir;
        private ObjectAnimator mCollapseAlpha;
        private boolean animationsSetToPlay;

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
            this.mExpandDir = new ObjectAnimator();
            this.mExpandAlpha = new ObjectAnimator();
            this.mCollapseDir = new ObjectAnimator();
            this.mCollapseAlpha = new ObjectAnimator();
            this.mExpandDir.setInterpolator(FloatingActionsMenu.sExpandInterpolator);
            this.mExpandAlpha.setInterpolator(FloatingActionsMenu.sAlphaExpandInterpolator);
            this.mCollapseDir.setInterpolator(FloatingActionsMenu.sCollapseInterpolator);
            this.mCollapseAlpha.setInterpolator(FloatingActionsMenu.sCollapseInterpolator);
            this.mCollapseAlpha.setProperty(View.ALPHA);
            this.mCollapseAlpha.setFloatValues(1.0f, FloatingActionsMenu.COLLAPSED_PLUS_ROTATION);
            this.mExpandAlpha.setProperty(View.ALPHA);
            this.mExpandAlpha.setFloatValues(FloatingActionsMenu.COLLAPSED_PLUS_ROTATION, 1.0f);
            switch (FloatingActionsMenu.this.mExpandDirection) {
                case 0:
                case 1:
                    this.mCollapseDir.setProperty(View.TRANSLATION_Y);
                    this.mExpandDir.setProperty(View.TRANSLATION_Y);
                    break;
                case FloatingActionsMenu.EXPAND_LEFT /* 2 */:
                case FloatingActionsMenu.EXPAND_RIGHT /* 3 */:
                    this.mCollapseDir.setProperty(View.TRANSLATION_X);
                    this.mExpandDir.setProperty(View.TRANSLATION_X);
                    break;
            }
        }

        public void setAnimationsTarget(View view) {
            this.mCollapseAlpha.setTarget(view);
            this.mCollapseDir.setTarget(view);
            this.mExpandAlpha.setTarget(view);
            this.mExpandDir.setTarget(view);
            if (!this.animationsSetToPlay) {
                FloatingActionsMenu.this.mCollapseAnimation.play(this.mCollapseAlpha);
                FloatingActionsMenu.this.mCollapseAnimation.play(this.mCollapseDir);
                FloatingActionsMenu.this.mExpandAnimation.play(this.mExpandAlpha);
                FloatingActionsMenu.this.mExpandAnimation.play(this.mExpandDir);
                this.animationsSetToPlay = true;
            }
        }
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        bringChildToFront(this.mAddButton);
        this.mButtonsCount = getChildCount();
        if (this.mLabelsStyle != 0) {
            createLabels();
        }
    }

    private void createLabels() {
        Context context = new ContextThemeWrapper(getContext(), this.mLabelsStyle);
        for (int i = 0; i < this.mButtonsCount; i++) {
            FloatingActionButton button = (FloatingActionButton) getChildAt(i);
            String title = button.getTitle();
            if (button != this.mAddButton && title != null && button.getTag(R.id.fab_label) == null) {
                TextView label = new TextView(context);
                label.setTextAppearance(getContext(), this.mLabelsStyle);
                label.setText(button.getTitle());
                addView(label);
                button.setTag(R.id.fab_label, label);
            }
        }
    }

    public void collapse() {
        if (this.mExpanded) {
            this.mExpanded = false;
            this.mTouchDelegateGroup.setEnabled(false);
            this.mCollapseAnimation.start();
            this.mExpandAnimation.cancel();
            if (this.mListener != null) {
                this.mListener.onMenuCollapsed();
            }
        }
    }

    public void toggle() {
        if (this.mExpanded) {
            collapse();
        } else {
            expand();
        }
    }

    public void expand() {
        if (!this.mExpanded) {
            this.mExpanded = true;
            this.mTouchDelegateGroup.setEnabled(true);
            this.mCollapseAnimation.cancel();
            this.mExpandAnimation.start();
            if (this.mListener != null) {
                this.mListener.onMenuExpanded();
            }
        }
    }

    public boolean isExpanded() {
        return this.mExpanded;
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.mExpanded = this.mExpanded;
        return savedState;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (state instanceof SavedState) {
            SavedState savedState = (SavedState) state;
            this.mExpanded = savedState.mExpanded;
            this.mTouchDelegateGroup.setEnabled(this.mExpanded);
            if (this.mRotatingDrawable != null) {
                this.mRotatingDrawable.setRotation(this.mExpanded ? EXPANDED_PLUS_ROTATION : COLLAPSED_PLUS_ROTATION);
            }
            super.onRestoreInstanceState(savedState.getSuperState());
            return;
        }
        super.onRestoreInstanceState(state);
    }

    /* loaded from: com.getbase.floatingactionbutton.1.9.1.jar:com/getbase/floatingactionbutton/FloatingActionsMenu$SavedState.class */
    public static class SavedState extends View.BaseSavedState {
        public boolean mExpanded;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.getbase.floatingactionbutton.FloatingActionsMenu.SavedState.1
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

        public SavedState(Parcelable parcel) {
            super(parcel);
        }

        private SavedState(Parcel in) {
            super(in);
            this.mExpanded = in.readInt() == 1;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.mExpanded ? 1 : 0);
        }
    }
}
