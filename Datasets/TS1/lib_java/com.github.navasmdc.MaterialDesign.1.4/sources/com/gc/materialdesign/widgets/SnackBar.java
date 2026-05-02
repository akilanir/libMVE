package com.gc.materialdesign.widgets;

import android.R;
import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.TextView;
import com.gc.materialdesign.views.ButtonFlat;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/SnackBar.class */
public class SnackBar extends android.app.Dialog {
    String text;
    float textSize;
    String buttonText;
    View.OnClickListener onClickListener;
    Activity activity;
    View view;
    ButtonFlat button;
    int backgroundSnackBar;
    int backgroundButton;
    OnHideListener onHideListener;
    private boolean mIndeterminate;
    private int mTimer;
    Thread dismissTimer;
    Handler handler;

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/SnackBar$OnHideListener.class */
    public interface OnHideListener {
        void onHide();
    }

    public SnackBar(Activity activity, String text, String buttonText, View.OnClickListener onClickListener) {
        super(activity, R.style.Theme.Translucent);
        this.textSize = 14.0f;
        this.backgroundSnackBar = Color.parseColor("#333333");
        this.backgroundButton = Color.parseColor("#1E88E5");
        this.mIndeterminate = false;
        this.mTimer = 3000;
        this.dismissTimer = new Thread(new Runnable() { // from class: com.gc.materialdesign.widgets.SnackBar.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(SnackBar.this.mTimer);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                SnackBar.this.handler.sendMessage(new Message());
            }
        });
        this.handler = new Handler(new Handler.Callback() { // from class: com.gc.materialdesign.widgets.SnackBar.3
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message msg) {
                if (SnackBar.this.onHideListener != null) {
                    SnackBar.this.onHideListener.onHide();
                }
                SnackBar.this.dismiss();
                return false;
            }
        });
        this.activity = activity;
        this.text = text;
        this.buttonText = buttonText;
        this.onClickListener = onClickListener;
    }

    public SnackBar(Activity activity, String text) {
        super(activity, R.style.Theme.Translucent);
        this.textSize = 14.0f;
        this.backgroundSnackBar = Color.parseColor("#333333");
        this.backgroundButton = Color.parseColor("#1E88E5");
        this.mIndeterminate = false;
        this.mTimer = 3000;
        this.dismissTimer = new Thread(new Runnable() { // from class: com.gc.materialdesign.widgets.SnackBar.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(SnackBar.this.mTimer);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                SnackBar.this.handler.sendMessage(new Message());
            }
        });
        this.handler = new Handler(new Handler.Callback() { // from class: com.gc.materialdesign.widgets.SnackBar.3
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message msg) {
                if (SnackBar.this.onHideListener != null) {
                    SnackBar.this.onHideListener.onHide();
                }
                SnackBar.this.dismiss();
                return false;
            }
        });
        this.activity = activity;
        this.text = text;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(com.gc.materialdesign.R.layout.snackbar);
        setCanceledOnTouchOutside(false);
        ((TextView) findViewById(com.gc.materialdesign.R.id.text)).setText(this.text);
        ((TextView) findViewById(com.gc.materialdesign.R.id.text)).setTextSize(this.textSize);
        this.button = (ButtonFlat) findViewById(com.gc.materialdesign.R.id.buttonflat);
        if (this.text == null || this.onClickListener == null) {
            this.button.setVisibility(8);
        } else {
            this.button.setText(this.buttonText);
            this.button.setBackgroundColor(this.backgroundButton);
            this.button.setOnClickListener(new View.OnClickListener() { // from class: com.gc.materialdesign.widgets.SnackBar.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    SnackBar.this.dismiss();
                    SnackBar.this.onClickListener.onClick(v);
                }
            });
        }
        this.view = findViewById(com.gc.materialdesign.R.id.snackbar);
        this.view.setBackgroundColor(this.backgroundSnackBar);
    }

    @Override // android.app.Dialog
    public boolean onTouchEvent(MotionEvent event) {
        return this.activity.dispatchTouchEvent(event);
    }

    @Override // android.app.Dialog
    public void onBackPressed() {
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        this.view.setVisibility(0);
        this.view.startAnimation(AnimationUtils.loadAnimation(this.activity, com.gc.materialdesign.R.anim.snackbar_show_animation));
        if (!this.mIndeterminate) {
            this.dismissTimer.start();
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        Animation anim = AnimationUtils.loadAnimation(this.activity, com.gc.materialdesign.R.anim.snackbar_hide_animation);
        anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.gc.materialdesign.widgets.SnackBar.4
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                SnackBar.super.dismiss();
            }
        });
        this.view.startAnimation(anim);
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            dismiss();
        }
        return super.onKeyDown(keyCode, event);
    }

    public void setMessageTextSize(float size) {
        this.textSize = size;
    }

    public void setIndeterminate(boolean indeterminate) {
        this.mIndeterminate = indeterminate;
    }

    public boolean isIndeterminate() {
        return this.mIndeterminate;
    }

    public void setDismissTimer(int time) {
        this.mTimer = time;
    }

    public int getDismissTimer() {
        return this.mTimer;
    }

    public void setBackgroundSnackBar(int color) {
        this.backgroundSnackBar = color;
        if (this.view != null) {
            this.view.setBackgroundColor(color);
        }
    }

    public void setColorButton(int color) {
        this.backgroundButton = color;
        if (this.button != null) {
            this.button.setBackgroundColor(color);
        }
    }

    public void setOnhideListener(OnHideListener onHideListener) {
        this.onHideListener = onHideListener;
    }
}
