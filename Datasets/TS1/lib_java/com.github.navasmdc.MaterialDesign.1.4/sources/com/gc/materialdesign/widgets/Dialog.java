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
import com.gc.materialdesign.views.ButtonFlat;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/Dialog.class */
public class Dialog extends android.app.Dialog {
    Context context;
    View view;
    View backView;
    String message;
    TextView messageTextView;
    String title;
    TextView titleTextView;
    ButtonFlat buttonAccept;
    ButtonFlat buttonCancel;
    String buttonCancelText;
    View.OnClickListener onAcceptButtonClickListener;
    View.OnClickListener onCancelButtonClickListener;

    public Dialog(Context context, String title, String message) {
        super(context, R.style.Theme.Translucent);
        this.context = context;
        this.message = message;
        this.title = title;
    }

    public void addCancelButton(String buttonCancelText) {
        this.buttonCancelText = buttonCancelText;
    }

    public void addCancelButton(String buttonCancelText, View.OnClickListener onCancelButtonClickListener) {
        this.buttonCancelText = buttonCancelText;
        this.onCancelButtonClickListener = onCancelButtonClickListener;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        setContentView(com.gc.materialdesign.R.layout.dialog);
        this.view = (RelativeLayout) findViewById(com.gc.materialdesign.R.id.contentDialog);
        this.backView = (RelativeLayout) findViewById(com.gc.materialdesign.R.id.dialog_rootView);
        this.backView.setOnTouchListener(new View.OnTouchListener() { // from class: com.gc.materialdesign.widgets.Dialog.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getX() < Dialog.this.view.getLeft() || event.getX() > Dialog.this.view.getRight() || event.getY() > Dialog.this.view.getBottom() || event.getY() < Dialog.this.view.getTop()) {
                    Dialog.this.dismiss();
                    return false;
                }
                return false;
            }
        });
        this.titleTextView = (TextView) findViewById(com.gc.materialdesign.R.id.title);
        setTitle(this.title);
        this.messageTextView = (TextView) findViewById(com.gc.materialdesign.R.id.message);
        setMessage(this.message);
        this.buttonAccept = (ButtonFlat) findViewById(com.gc.materialdesign.R.id.button_accept);
        this.buttonAccept.setOnClickListener(new View.OnClickListener() { // from class: com.gc.materialdesign.widgets.Dialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Dialog.this.dismiss();
                if (Dialog.this.onAcceptButtonClickListener != null) {
                    Dialog.this.onAcceptButtonClickListener.onClick(v);
                }
            }
        });
        if (this.buttonCancelText != null) {
            this.buttonCancel = (ButtonFlat) findViewById(com.gc.materialdesign.R.id.button_cancel);
            this.buttonCancel.setVisibility(0);
            this.buttonCancel.setText(this.buttonCancelText);
            this.buttonCancel.setOnClickListener(new View.OnClickListener() { // from class: com.gc.materialdesign.widgets.Dialog.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    Dialog.this.dismiss();
                    if (Dialog.this.onCancelButtonClickListener != null) {
                        Dialog.this.onCancelButtonClickListener.onClick(v);
                    }
                }
            });
        }
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        this.view.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_show_amination));
        this.backView.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_show_amin));
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
        this.messageTextView.setText(message);
    }

    public TextView getMessageTextView() {
        return this.messageTextView;
    }

    public void setMessageTextView(TextView messageTextView) {
        this.messageTextView = messageTextView;
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

    public ButtonFlat getButtonAccept() {
        return this.buttonAccept;
    }

    public void setButtonAccept(ButtonFlat buttonAccept) {
        this.buttonAccept = buttonAccept;
    }

    public ButtonFlat getButtonCancel() {
        return this.buttonCancel;
    }

    public void setButtonCancel(ButtonFlat buttonCancel) {
        this.buttonCancel = buttonCancel;
    }

    public void setOnAcceptButtonClickListener(View.OnClickListener onAcceptButtonClickListener) {
        this.onAcceptButtonClickListener = onAcceptButtonClickListener;
        if (this.buttonAccept != null) {
            this.buttonAccept.setOnClickListener(onAcceptButtonClickListener);
        }
    }

    public void setOnCancelButtonClickListener(View.OnClickListener onCancelButtonClickListener) {
        this.onCancelButtonClickListener = onCancelButtonClickListener;
        if (this.buttonCancel != null) {
            this.buttonCancel.setOnClickListener(onCancelButtonClickListener);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        Animation anim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_hide_amination);
        anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.gc.materialdesign.widgets.Dialog.4
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                Dialog.this.view.post(new Runnable() { // from class: com.gc.materialdesign.widgets.Dialog.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Dialog.super.dismiss();
                    }
                });
            }
        });
        Animation backAnim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_hide_amin);
        this.view.startAnimation(anim);
        this.backView.startAnimation(backAnim);
    }
}
