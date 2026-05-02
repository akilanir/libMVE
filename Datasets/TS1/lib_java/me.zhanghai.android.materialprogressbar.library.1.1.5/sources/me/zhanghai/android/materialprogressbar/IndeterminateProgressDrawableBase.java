package me.zhanghai.android.materialprogressbar;

import android.animation.Animator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Animatable;

/* loaded from: me.zhanghai.android.materialprogressbar.library.1.1.5.jar:me/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase.class */
abstract class IndeterminateProgressDrawableBase extends ProgressDrawableBase implements Animatable {
    protected Animator[] mAnimators;

    public IndeterminateProgressDrawableBase(Context context) {
        super(context);
    }

    @Override // me.zhanghai.android.materialprogressbar.ProgressDrawableBase, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        super.draw(canvas);
        if (isStarted()) {
            invalidateSelf();
        }
    }

    public void start() {
        if (isStarted()) {
            return;
        }
        Animator[] arr$ = this.mAnimators;
        for (Animator animator : arr$) {
            animator.start();
        }
        invalidateSelf();
    }

    private boolean isStarted() {
        Animator[] arr$ = this.mAnimators;
        for (Animator animator : arr$) {
            if (animator.isStarted()) {
                return true;
            }
        }
        return false;
    }

    public void stop() {
        Animator[] arr$ = this.mAnimators;
        for (Animator animator : arr$) {
            animator.end();
        }
    }

    public boolean isRunning() {
        Animator[] arr$ = this.mAnimators;
        for (Animator animator : arr$) {
            if (animator.isRunning()) {
                return true;
            }
        }
        return false;
    }
}
