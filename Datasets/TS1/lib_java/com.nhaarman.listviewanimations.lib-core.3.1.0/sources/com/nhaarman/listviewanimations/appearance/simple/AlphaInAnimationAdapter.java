package com.nhaarman.listviewanimations.appearance.simple;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.nhaarman.listviewanimations.appearance.AnimationAdapter;
import com.nineoldandroids.animation.Animator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/simple/AlphaInAnimationAdapter.class */
public class AlphaInAnimationAdapter extends AnimationAdapter {
    public AlphaInAnimationAdapter(@NonNull BaseAdapter baseAdapter) {
        super(baseAdapter);
    }

    @Override // com.nhaarman.listviewanimations.appearance.AnimationAdapter
    @NonNull
    public Animator[] getAnimators(@NonNull ViewGroup parent, @NonNull View view) {
        return new Animator[0];
    }
}
