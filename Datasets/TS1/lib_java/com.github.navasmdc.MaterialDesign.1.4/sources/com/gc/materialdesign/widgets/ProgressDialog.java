package com.gc.materialdesign.widgets;

import android.R;
import android.content.Context;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.gc.materialdesign.views.ProgressBarCircularIndeterminate;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/ProgressDialog.class */
public class ProgressDialog extends android.app.Dialog {
    Context context;
    View view;
    View backView;
    String title;
    TextView titleTextView;
    int progressColor;

    public ProgressDialog(Context context, String title) {
        super(context, R.style.Theme.Translucent);
        this.progressColor = -1;
        this.title = title;
        this.context = context;
    }

    public ProgressDialog(Context context, String title, int progressColor) {
        super(context, R.style.Theme.Translucent);
        this.progressColor = -1;
        this.title = title;
        this.progressColor = progressColor;
        this.context = context;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        setContentView(com.gc.materialdesign.R.layout.progress_dialog);
        this.view = (RelativeLayout) findViewById(com.gc.materialdesign.R.id.contentDialog);
        this.backView = (RelativeLayout) findViewById(com.gc.materialdesign.R.id.dialog_rootView);
        this.backView.setOnTouchListener(new View.OnTouchListener() { // from class: com.gc.materialdesign.widgets.ProgressDialog.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getX() < ProgressDialog.this.view.getLeft() || event.getX() > ProgressDialog.this.view.getRight() || event.getY() > ProgressDialog.this.view.getBottom() || event.getY() < ProgressDialog.this.view.getTop()) {
                    ProgressDialog.this.dismiss();
                    return false;
                }
                return false;
            }
        });
        this.titleTextView = (TextView) findViewById(com.gc.materialdesign.R.id.title);
        setTitle(this.title);
        if (this.progressColor != -1) {
            ProgressBarCircularIndeterminate progressBarCircularIndeterminate = (ProgressBarCircularIndeterminate) findViewById(com.gc.materialdesign.R.id.progressBarCircularIndetermininate);
            progressBarCircularIndeterminate.setBackgroundColor(this.progressColor);
        }
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        this.view.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_show_amination));
        this.backView.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_show_amin));
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
        if (title == null) {
            this.titleTextView.setVisibility(8);
        } else {
            this.titleTextView.setVisibility(0);
            this.titleTextView.setText(title);
        }
    }

    public TextView getTitleTextView() {
        return this.titleTextView;
    }

    public void setTitleTextView(TextView titleTextView) {
        this.titleTextView = titleTextView;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        Animation anim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_hide_amination);
        anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.gc.materialdesign.widgets.ProgressDialog.2
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                ProgressDialog.this.view.post(new Runnable() { // from class: com.gc.materialdesign.widgets.ProgressDialog.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ProgressDialog.super.dismiss();
                    }
                });
            }
        });
        Animation backAnim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_hide_amin);
        this.view.startAnimation(anim);
        this.backView.startAnimation(backAnim);
    }
}
