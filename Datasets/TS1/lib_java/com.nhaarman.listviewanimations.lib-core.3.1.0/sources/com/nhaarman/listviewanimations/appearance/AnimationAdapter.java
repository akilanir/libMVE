package com.nhaarman.listviewanimations.appearance;

import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nhaarman.listviewanimations.BaseAdapterDecorator;
import com.nhaarman.listviewanimations.util.AnimatorUtil;
import com.nhaarman.listviewanimations.util.ListViewWrapper;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.ObjectAnimator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/AnimationAdapter.class */
public abstract class AnimationAdapter extends BaseAdapterDecorator {
    private static final String SAVEDINSTANCESTATE_VIEWANIMATOR = "savedinstancestate_viewanimator";
    private static final String ALPHA = "alpha";

    @Nullable
    private ViewAnimator mViewAnimator;
    private boolean mIsRootAdapter;
    private boolean mGridViewPossiblyMeasuring;
    private int mGridViewMeasuringPosition;
    static final /* synthetic */ boolean $assertionsDisabled;

    @NonNull
    public abstract Animator[] getAnimators(@NonNull ViewGroup viewGroup, @NonNull View view);

    static {
        $assertionsDisabled = !AnimationAdapter.class.desiredAssertionStatus();
    }

    protected AnimationAdapter(@NonNull BaseAdapter baseAdapter) {
        super(baseAdapter);
        this.mGridViewPossiblyMeasuring = true;
        this.mGridViewMeasuringPosition = -1;
        this.mIsRootAdapter = true;
        if (baseAdapter instanceof AnimationAdapter) {
            ((AnimationAdapter) baseAdapter).setIsWrapped();
        }
    }

    @Override // com.nhaarman.listviewanimations.BaseAdapterDecorator, com.nhaarman.listviewanimations.util.ListViewWrapperSetter
    public void setListViewWrapper(@NonNull ListViewWrapper listViewWrapper) {
        super.setListViewWrapper(listViewWrapper);
        this.mViewAnimator = new ViewAnimator(listViewWrapper);
    }

    private void setIsWrapped() {
        this.mIsRootAdapter = false;
    }

    public void reset() {
        if (getListViewWrapper() == null) {
            throw new IllegalStateException("Call setAbsListView() on this AnimationAdapter first!");
        }
        if (!$assertionsDisabled && this.mViewAnimator == null) {
            throw new AssertionError();
        }
        this.mViewAnimator.reset();
        this.mGridViewPossiblyMeasuring = true;
        this.mGridViewMeasuringPosition = -1;
        if (getDecoratedBaseAdapter() instanceof AnimationAdapter) {
            ((AnimationAdapter) getDecoratedBaseAdapter()).reset();
        }
    }

    @Nullable
    public ViewAnimator getViewAnimator() {
        return this.mViewAnimator;
    }

    @Override // com.nhaarman.listviewanimations.BaseAdapterDecorator, android.widget.Adapter
    @NonNull
    public final View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        if (this.mIsRootAdapter) {
            if (getListViewWrapper() == null) {
                throw new IllegalStateException("Call setAbsListView() on this AnimationAdapter first!");
            }
            if (!$assertionsDisabled && this.mViewAnimator == null) {
                throw new AssertionError();
            }
            if (convertView != null) {
                this.mViewAnimator.cancelExistingAnimation(convertView);
            }
        }
        View itemView = super.getView(position, convertView, parent);
        if (this.mIsRootAdapter) {
            animateViewIfNecessary(position, itemView, parent);
        }
        return itemView;
    }

    private void animateViewIfNecessary(int position, @NonNull View view, @NonNull ViewGroup parent) {
        Animator[] childAnimators;
        if (!$assertionsDisabled && this.mViewAnimator == null) {
            throw new AssertionError();
        }
        this.mGridViewPossiblyMeasuring = this.mGridViewPossiblyMeasuring && (this.mGridViewMeasuringPosition == -1 || this.mGridViewMeasuringPosition == position);
        if (this.mGridViewPossiblyMeasuring) {
            this.mGridViewMeasuringPosition = position;
            this.mViewAnimator.setLastAnimatedPosition(-1);
        }
        if (getDecoratedBaseAdapter() instanceof AnimationAdapter) {
            childAnimators = ((AnimationAdapter) getDecoratedBaseAdapter()).getAnimators(parent, view);
        } else {
            childAnimators = new Animator[0];
        }
        Animator[] animators = getAnimators(parent, view);
        Animator[] concatAnimators = AnimatorUtil.concatAnimators(childAnimators, animators, ObjectAnimator.ofFloat(view, ALPHA, new float[]{0.0f, 1.0f}));
        this.mViewAnimator.animateViewIfNecessary(position, view, concatAnimators);
    }

    @NonNull
    public Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        if (this.mViewAnimator != null) {
            bundle.putParcelable(SAVEDINSTANCESTATE_VIEWANIMATOR, this.mViewAnimator.onSaveInstanceState());
        }
        return bundle;
    }

    public void onRestoreInstanceState(@Nullable Parcelable parcelable) {
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            if (this.mViewAnimator != null) {
                this.mViewAnimator.onRestoreInstanceState(bundle.getParcelable(SAVEDINSTANCESTATE_VIEWANIMATOR));
            }
        }
    }
}
