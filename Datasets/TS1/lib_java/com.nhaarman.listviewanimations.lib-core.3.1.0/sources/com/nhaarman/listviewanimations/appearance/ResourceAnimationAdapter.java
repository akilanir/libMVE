package com.nhaarman.listviewanimations.appearance;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorInflater;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/ResourceAnimationAdapter.class */
public abstract class ResourceAnimationAdapter extends AnimationAdapter {

    @NonNull
    private final Context mContext;

    protected abstract int getAnimationResourceId();

    protected ResourceAnimationAdapter(@NonNull BaseAdapter baseAdapter, @NonNull Context context) {
        super(baseAdapter);
        this.mContext = context;
    }

    @Override // com.nhaarman.listviewanimations.appearance.AnimationAdapter
    @NonNull
    public Animator[] getAnimators(@NonNull ViewGroup parent, @NonNull View view) {
        return new Animator[]{AnimatorInflater.loadAnimator(this.mContext, getAnimationResourceId())};
    }
}
