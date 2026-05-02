package com.nhaarman.listviewanimations.appearance.simple;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nhaarman.listviewanimations.appearance.AnimationAdapter;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.ObjectAnimator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/simple/ScaleInAnimationAdapter.class */
public class ScaleInAnimationAdapter extends AnimationAdapter {
    private static final float DEFAULT_SCALE_FROM = 0.8f;
    private static final String SCALE_X = "scaleX";
    private static final String SCALE_Y = "scaleY";
    private final float mScaleFrom;

    public ScaleInAnimationAdapter(@NonNull BaseAdapter baseAdapter) {
        this(baseAdapter, DEFAULT_SCALE_FROM);
    }

    public ScaleInAnimationAdapter(@NonNull BaseAdapter baseAdapter, float scaleFrom) {
        super(baseAdapter);
        this.mScaleFrom = scaleFrom;
    }

    @Override // com.nhaarman.listviewanimations.appearance.AnimationAdapter
    @NonNull
    public Animator[] getAnimators(@NonNull ViewGroup parent, @NonNull View view) {
        ObjectAnimator scaleX = ObjectAnimator.ofFloat(view, SCALE_X, new float[]{this.mScaleFrom, 1.0f});
        ObjectAnimator scaleY = ObjectAnimator.ofFloat(view, SCALE_Y, new float[]{this.mScaleFrom, 1.0f});
        return new ObjectAnimator[]{scaleX, scaleY};
    }
}
