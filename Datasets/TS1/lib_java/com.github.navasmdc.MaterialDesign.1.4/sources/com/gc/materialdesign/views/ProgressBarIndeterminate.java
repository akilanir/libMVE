package com.gc.materialdesign.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.gc.materialdesign.R;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ProgressBarIndeterminate.class */
public class ProgressBarIndeterminate extends ProgressBarDeterminate {
    public ProgressBarIndeterminate(Context context, AttributeSet attrs) {
        super(context, attrs);
        post(new Runnable() { // from class: com.gc.materialdesign.views.ProgressBarIndeterminate.1
            @Override // java.lang.Runnable
            public void run() {
                ProgressBarIndeterminate.this.setProgress(60);
                Animation anim = AnimationUtils.loadAnimation(ProgressBarIndeterminate.this.getContext(), R.anim.progress_indeterminate_animation);
                ProgressBarIndeterminate.this.progressView.startAnimation(anim);
                ObjectAnimator anim2 = ObjectAnimator.ofFloat(ProgressBarIndeterminate.this.progressView, "x", new float[]{ProgressBarIndeterminate.this.getWidth()});
                anim2.setDuration(1200L);
                anim2.addListener(new Animator.AnimatorListener() { // from class: com.gc.materialdesign.views.ProgressBarIndeterminate.1.1
                    int cont = 1;
                    int suma = 1;
                    int duration = 1200;

                    public void onAnimationEnd(Animator arg0) {
                        ViewHelper.setX(ProgressBarIndeterminate.this.progressView, (-ProgressBarIndeterminate.this.progressView.getWidth()) / 2);
                        this.cont += this.suma;
                        ObjectAnimator anim2Repeat = ObjectAnimator.ofFloat(ProgressBarIndeterminate.this.progressView, "x", new float[]{ProgressBarIndeterminate.this.getWidth()});
                        anim2Repeat.setDuration(this.duration / this.cont);
                        anim2Repeat.addListener(this);
                        anim2Repeat.start();
                        if (this.cont == 3 || this.cont == 1) {
                            this.suma *= -1;
                        }
                    }

                    public void onAnimationStart(Animator arg0) {
                    }

                    public void onAnimationRepeat(Animator arg0) {
                    }

                    public void onAnimationCancel(Animator arg0) {
                    }
                });
                anim2.start();
            }
        });
    }
}
