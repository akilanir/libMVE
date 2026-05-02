package com.gc.materialdesign.views;

import android.content.Context;
import android.util.AttributeSet;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ProgressBarIndeterminateDeterminate.class */
public class ProgressBarIndeterminateDeterminate extends ProgressBarDeterminate {
    boolean firstProgress;
    boolean runAnimation;
    ObjectAnimator animation;

    public ProgressBarIndeterminateDeterminate(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.firstProgress = true;
        this.runAnimation = true;
        post(new Runnable() { // from class: com.gc.materialdesign.views.ProgressBarIndeterminateDeterminate.1
            @Override // java.lang.Runnable
            public void run() {
                ProgressBarIndeterminateDeterminate.this.setProgress(60);
                ViewHelper.setX(ProgressBarIndeterminateDeterminate.this.progressView, ProgressBarIndeterminateDeterminate.this.getWidth() + (ProgressBarIndeterminateDeterminate.this.progressView.getWidth() / 2));
                ProgressBarIndeterminateDeterminate.this.animation = ObjectAnimator.ofFloat(ProgressBarIndeterminateDeterminate.this.progressView, "x", new float[]{(-ProgressBarIndeterminateDeterminate.this.progressView.getWidth()) / 2});
                ProgressBarIndeterminateDeterminate.this.animation.setDuration(1200L);
                ProgressBarIndeterminateDeterminate.this.animation.addListener(new Animator.AnimatorListener() { // from class: com.gc.materialdesign.views.ProgressBarIndeterminateDeterminate.1.1
                    int cont = 1;
                    int suma = 1;
                    int duration = 1200;

                    public void onAnimationEnd(Animator arg0) {
                        if (ProgressBarIndeterminateDeterminate.this.runAnimation) {
                            ViewHelper.setX(ProgressBarIndeterminateDeterminate.this.progressView, ProgressBarIndeterminateDeterminate.this.getWidth() + (ProgressBarIndeterminateDeterminate.this.progressView.getWidth() / 2));
                            this.cont += this.suma;
                            ProgressBarIndeterminateDeterminate.this.animation = ObjectAnimator.ofFloat(ProgressBarIndeterminateDeterminate.this.progressView, "x", new float[]{(-ProgressBarIndeterminateDeterminate.this.progressView.getWidth()) / 2});
                            ProgressBarIndeterminateDeterminate.this.animation.setDuration(this.duration / this.cont);
                            ProgressBarIndeterminateDeterminate.this.animation.addListener(this);
                            ProgressBarIndeterminateDeterminate.this.animation.start();
                            if (this.cont == 3 || this.cont == 1) {
                                this.suma *= -1;
                            }
                        }
                    }

                    public void onAnimationStart(Animator arg0) {
                    }

                    public void onAnimationRepeat(Animator arg0) {
                    }

                    public void onAnimationCancel(Animator arg0) {
                    }
                });
                ProgressBarIndeterminateDeterminate.this.animation.start();
            }
        });
    }

    @Override // com.gc.materialdesign.views.ProgressBarDeterminate
    public void setProgress(int progress) {
        if (this.firstProgress) {
            this.firstProgress = false;
        } else {
            stopIndeterminate();
        }
        super.setProgress(progress);
    }

    private void stopIndeterminate() {
        this.animation.cancel();
        ViewHelper.setX(this.progressView, 0.0f);
        this.runAnimation = false;
    }
}
