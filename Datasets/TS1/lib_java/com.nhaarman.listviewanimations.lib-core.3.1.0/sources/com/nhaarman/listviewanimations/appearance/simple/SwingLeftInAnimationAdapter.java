package com.nhaarman.listviewanimations.appearance.simple;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nhaarman.listviewanimations.appearance.SingleAnimationAdapter;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.ObjectAnimator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/simple/SwingLeftInAnimationAdapter.class */
public class SwingLeftInAnimationAdapter extends SingleAnimationAdapter {
    private static final String TRANSLATION_X = "translationX";

    public SwingLeftInAnimationAdapter(@NonNull BaseAdapter baseAdapter) {
        super(baseAdapter);
    }

    @Override // com.nhaarman.listviewanimations.appearance.SingleAnimationAdapter
    @NonNull
    protected Animator getAnimator(@NonNull ViewGroup parent, @NonNull View view) {
        return ObjectAnimator.ofFloat(view, TRANSLATION_X, new float[]{0 - parent.getWidth(), 0.0f});
    }
}
