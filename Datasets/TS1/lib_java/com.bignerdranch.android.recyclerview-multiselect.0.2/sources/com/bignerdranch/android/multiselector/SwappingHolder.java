package com.bignerdranch.android.multiselector;

import android.R;
import android.animation.AnimatorInflater;
import android.animation.StateListAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.StateSet;
import android.util.TypedValue;
import android.view.View;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:com/bignerdranch/android/multiselector/SwappingHolder.class */
public class SwappingHolder extends MultiSelectorBindingHolder implements SelectableHolder {
    private MultiSelector mMultiSelector;
    private boolean mIsSelectable;
    private Drawable mSelectionModeBackgroundDrawable;
    private Drawable mDefaultModeBackgroundDrawable;
    private StateListAnimator mSelectionModeStateListAnimator;
    private StateListAnimator mDefaultModeStateListAnimator;

    public SwappingHolder(View itemView, MultiSelector multiSelector) {
        super(itemView, multiSelector);
        this.mIsSelectable = false;
        this.mMultiSelector = multiSelector;
        if (Build.VERSION.SDK_INT >= 21) {
            setSelectionModeStateListAnimator(getRaiseStateListAnimator(itemView.getContext()));
            setDefaultModeStateListAnimator(itemView.getStateListAnimator());
        }
        setSelectionModeBackgroundDrawable(getAccentStateDrawable(itemView.getContext()));
        setDefaultModeBackgroundDrawable(itemView.getBackground());
    }

    public SwappingHolder(View itemView) {
        this(itemView, null);
    }

    private static Drawable getAccentStateDrawable(Context context) {
        TypedValue typedValue = new TypedValue();
        Resources.Theme theme = context.getTheme();
        theme.resolveAttribute(R.attr.colorAccent, typedValue, true);
        Drawable colorDrawable = new ColorDrawable(typedValue.data);
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{R.attr.state_activated}, colorDrawable);
        stateListDrawable.addState(StateSet.WILD_CARD, null);
        return stateListDrawable;
    }

    private static StateListAnimator getRaiseStateListAnimator(Context context) {
        if (Build.VERSION.SDK_INT >= 21) {
            return AnimatorInflater.loadStateListAnimator(context, R.anim.raise);
        }
        return null;
    }

    public Drawable getSelectionModeBackgroundDrawable() {
        return this.mSelectionModeBackgroundDrawable;
    }

    public void setSelectionModeBackgroundDrawable(Drawable selectionModeBackgroundDrawable) {
        this.mSelectionModeBackgroundDrawable = selectionModeBackgroundDrawable;
        if (this.mIsSelectable) {
            this.itemView.setBackgroundDrawable(selectionModeBackgroundDrawable);
        }
    }

    public Drawable getDefaultModeBackgroundDrawable() {
        return this.mDefaultModeBackgroundDrawable;
    }

    public void setDefaultModeBackgroundDrawable(Drawable defaultModeBackgroundDrawable) {
        this.mDefaultModeBackgroundDrawable = defaultModeBackgroundDrawable;
        if (!this.mIsSelectable) {
            this.itemView.setBackgroundDrawable(this.mDefaultModeBackgroundDrawable);
        }
    }

    public StateListAnimator getSelectionModeStateListAnimator() {
        return this.mSelectionModeStateListAnimator;
    }

    public void setSelectionModeStateListAnimator(StateListAnimator selectionModeStateListAnimator) {
        this.mSelectionModeStateListAnimator = selectionModeStateListAnimator;
    }

    public void setSelectionModeStateListAnimator(int resId) {
        if (Build.VERSION.SDK_INT >= 21) {
            StateListAnimator animator = AnimatorInflater.loadStateListAnimator(this.itemView.getContext(), resId);
            setSelectionModeStateListAnimator(animator);
        }
    }

    public StateListAnimator getDefaultModeStateListAnimator() {
        return this.mDefaultModeStateListAnimator;
    }

    public void setDefaultModeStateListAnimator(int resId) {
        if (Build.VERSION.SDK_INT >= 21) {
            StateListAnimator animator = AnimatorInflater.loadStateListAnimator(this.itemView.getContext(), resId);
            setDefaultModeStateListAnimator(animator);
        }
    }

    public void setDefaultModeStateListAnimator(StateListAnimator defaultModeStateListAnimator) {
        this.mDefaultModeStateListAnimator = defaultModeStateListAnimator;
    }

    @Override // com.bignerdranch.android.multiselector.SelectableHolder
    public boolean isActivated() {
        return this.itemView.isActivated();
    }

    @Override // com.bignerdranch.android.multiselector.SelectableHolder
    public void setActivated(boolean isActivated) {
        this.itemView.setActivated(isActivated);
    }

    @Override // com.bignerdranch.android.multiselector.SelectableHolder
    public boolean isSelectable() {
        return this.mIsSelectable;
    }

    @Override // com.bignerdranch.android.multiselector.SelectableHolder
    public void setSelectable(boolean isSelectable) {
        boolean changed = isSelectable != this.mIsSelectable;
        this.mIsSelectable = isSelectable;
        if (changed) {
            refreshChrome();
        }
    }

    private void refreshChrome() {
        Drawable backgroundDrawable = this.mIsSelectable ? this.mSelectionModeBackgroundDrawable : this.mDefaultModeBackgroundDrawable;
        this.itemView.setBackgroundDrawable(backgroundDrawable);
        if (backgroundDrawable != null) {
            backgroundDrawable.jumpToCurrentState();
        }
        if (Build.VERSION.SDK_INT >= 21) {
            StateListAnimator animator = this.mIsSelectable ? this.mSelectionModeStateListAnimator : this.mDefaultModeStateListAnimator;
            this.itemView.setStateListAnimator(animator);
            if (animator != null) {
                animator.jumpToCurrentState();
            }
        }
    }
}
