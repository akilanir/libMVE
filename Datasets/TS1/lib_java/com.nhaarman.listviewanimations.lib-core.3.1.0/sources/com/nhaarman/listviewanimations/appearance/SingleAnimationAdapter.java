package com.nhaarman.listviewanimations.appearance;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nineoldandroids.animation.Animator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/SingleAnimationAdapter.class */
public abstract class SingleAnimationAdapter extends AnimationAdapter {
    @NonNull
    protected abstract Animator getAnimator(@NonNull ViewGroup viewGroup, @NonNull View view);

    protected SingleAnimationAdapter(@NonNull BaseAdapter baseAdapter) {
        super(baseAdapter);
    }

    @Override // com.nhaarman.listviewanimations.appearance.AnimationAdapter
    @NonNull
    public Animator[] getAnimators(@NonNull ViewGroup parent, @NonNull View view) {
        Animator animator = getAnimator(parent, view);
        return new Animator[]{animator};
    }
}
