package com.nhaarman.listviewanimations.util;

import android.support.annotation.NonNull;
import com.nineoldandroids.animation.Animator;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/util/AnimatorUtil.class */
public class AnimatorUtil {
    private AnimatorUtil() {
    }

    @NonNull
    public static Animator[] concatAnimators(@NonNull Animator[] childAnimators, @NonNull Animator[] animators, @NonNull Animator alphaAnimator) {
        Animator[] allAnimators = new Animator[childAnimators.length + animators.length + 1];
        int i = 0;
        while (i < childAnimators.length) {
            allAnimators[i] = childAnimators[i];
            i++;
        }
        for (Animator animator : animators) {
            allAnimators[i] = animator;
            i++;
        }
        allAnimators[allAnimators.length - 1] = alphaAnimator;
        return allAnimators;
    }
}
