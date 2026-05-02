package yuku.ambilwarna;

import android.R;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.RelativeLayout;

/* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/AmbilWarnaDialog.class */
public class AmbilWarnaDialog {
    final AlertDialog dialog;
    private final boolean supportsAlpha;
    final OnAmbilWarnaListener listener;
    final View viewHue;
    final AmbilWarnaSquare viewSatVal;
    final ImageView viewCursor;
    final ImageView viewAlphaCursor;
    final View viewOldColor;
    final View viewNewColor;
    final View viewAlphaOverlay;
    final ImageView viewTarget;
    final ImageView viewAlphaCheckered;
    final ViewGroup viewContainer;
    final float[] currentColorHsv;
    int alpha;

    /* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/AmbilWarnaDialog$OnAmbilWarnaListener.class */
    public interface OnAmbilWarnaListener {
        void onCancel(AmbilWarnaDialog ambilWarnaDialog);

        void onOk(AmbilWarnaDialog ambilWarnaDialog, int i);
    }

    public AmbilWarnaDialog(Context context, int color, OnAmbilWarnaListener listener) {
        this(context, color, false, listener);
    }

    public AmbilWarnaDialog(Context context, int color, boolean supportsAlpha, OnAmbilWarnaListener listener) {
        this.currentColorHsv = new float[3];
        this.supportsAlpha = supportsAlpha;
        this.listener = listener;
        color = supportsAlpha ? color : color | (-16777216);
        Color.colorToHSV(color, this.currentColorHsv);
        this.alpha = Color.alpha(color);
        final View view = LayoutInflater.from(context).inflate(R.layout.ambilwarna_dialog, (ViewGroup) null);
        this.viewHue = view.findViewById(R.id.ambilwarna_viewHue);
        this.viewSatVal = (AmbilWarnaSquare) view.findViewById(R.id.ambilwarna_viewSatBri);
        this.viewCursor = (ImageView) view.findViewById(R.id.ambilwarna_cursor);
        this.viewOldColor = view.findViewById(R.id.ambilwarna_oldColor);
        this.viewNewColor = view.findViewById(R.id.ambilwarna_newColor);
        this.viewTarget = (ImageView) view.findViewById(R.id.ambilwarna_target);
        this.viewContainer = (ViewGroup) view.findViewById(R.id.ambilwarna_viewContainer);
        this.viewAlphaOverlay = view.findViewById(R.id.ambilwarna_overlay);
        this.viewAlphaCursor = (ImageView) view.findViewById(R.id.ambilwarna_alphaCursor);
        this.viewAlphaCheckered = (ImageView) view.findViewById(R.id.ambilwarna_alphaCheckered);
        this.viewAlphaOverlay.setVisibility(supportsAlpha ? 0 : 8);
        this.viewAlphaCursor.setVisibility(supportsAlpha ? 0 : 8);
        this.viewAlphaCheckered.setVisibility(supportsAlpha ? 0 : 8);
        this.viewSatVal.setHue(getHue());
        this.viewOldColor.setBackgroundColor(color);
        this.viewNewColor.setBackgroundColor(color);
        this.viewHue.setOnTouchListener(new View.OnTouchListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == 2 || event.getAction() == 0 || event.getAction() == 1) {
                    float y = event.getY();
                    if (y < 0.0f) {
                        y = 0.0f;
                    }
                    if (y > AmbilWarnaDialog.this.viewHue.getMeasuredHeight()) {
                        y = AmbilWarnaDialog.this.viewHue.getMeasuredHeight() - 0.001f;
                    }
                    float hue = 360.0f - ((360.0f / AmbilWarnaDialog.this.viewHue.getMeasuredHeight()) * y);
                    if (hue == 360.0f) {
                        hue = 0.0f;
                    }
                    AmbilWarnaDialog.this.setHue(hue);
                    AmbilWarnaDialog.this.viewSatVal.setHue(AmbilWarnaDialog.this.getHue());
                    AmbilWarnaDialog.this.moveCursor();
                    AmbilWarnaDialog.this.viewNewColor.setBackgroundColor(AmbilWarnaDialog.this.getColor());
                    AmbilWarnaDialog.this.updateAlphaView();
                    return true;
                }
                return false;
            }
        });
        if (supportsAlpha) {
            this.viewAlphaCheckered.setOnTouchListener(new View.OnTouchListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.2
                @Override // android.view.View.OnTouchListener
                public boolean onTouch(View v, MotionEvent event) {
                    if (event.getAction() == 2 || event.getAction() == 0 || event.getAction() == 1) {
                        float y = event.getY();
                        if (y < 0.0f) {
                            y = 0.0f;
                        }
                        if (y > AmbilWarnaDialog.this.viewAlphaCheckered.getMeasuredHeight()) {
                            y = AmbilWarnaDialog.this.viewAlphaCheckered.getMeasuredHeight() - 0.001f;
                        }
                        int a = Math.round(255.0f - ((255.0f / AmbilWarnaDialog.this.viewAlphaCheckered.getMeasuredHeight()) * y));
                        AmbilWarnaDialog.this.setAlpha(a);
                        AmbilWarnaDialog.this.moveAlphaCursor();
                        int col = AmbilWarnaDialog.this.getColor();
                        int c = (a << 24) | (col & 16777215);
                        AmbilWarnaDialog.this.viewNewColor.setBackgroundColor(c);
                        return true;
                    }
                    return false;
                }
            });
        }
        this.viewSatVal.setOnTouchListener(new View.OnTouchListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.3
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getAction() == 2 || event.getAction() == 0 || event.getAction() == 1) {
                    float x = event.getX();
                    float y = event.getY();
                    if (x < 0.0f) {
                        x = 0.0f;
                    }
                    if (x > AmbilWarnaDialog.this.viewSatVal.getMeasuredWidth()) {
                        x = AmbilWarnaDialog.this.viewSatVal.getMeasuredWidth();
                    }
                    if (y < 0.0f) {
                        y = 0.0f;
                    }
                    if (y > AmbilWarnaDialog.this.viewSatVal.getMeasuredHeight()) {
                        y = AmbilWarnaDialog.this.viewSatVal.getMeasuredHeight();
                    }
                    AmbilWarnaDialog.this.setSat((1.0f / AmbilWarnaDialog.this.viewSatVal.getMeasuredWidth()) * x);
                    AmbilWarnaDialog.this.setVal(1.0f - ((1.0f / AmbilWarnaDialog.this.viewSatVal.getMeasuredHeight()) * y));
                    AmbilWarnaDialog.this.moveTarget();
                    AmbilWarnaDialog.this.viewNewColor.setBackgroundColor(AmbilWarnaDialog.this.getColor());
                    return true;
                }
                return false;
            }
        });
        this.dialog = new AlertDialog.Builder(context).setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (AmbilWarnaDialog.this.listener != null) {
                    AmbilWarnaDialog.this.listener.onOk(AmbilWarnaDialog.this, AmbilWarnaDialog.this.getColor());
                }
            }
        }).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (AmbilWarnaDialog.this.listener != null) {
                    AmbilWarnaDialog.this.listener.onCancel(AmbilWarnaDialog.this);
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.4
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface paramDialogInterface) {
                if (AmbilWarnaDialog.this.listener != null) {
                    AmbilWarnaDialog.this.listener.onCancel(AmbilWarnaDialog.this);
                }
            }
        }).create();
        this.dialog.setView(view, 0, 0, 0, 0);
        ViewTreeObserver vto = view.getViewTreeObserver();
        vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: yuku.ambilwarna.AmbilWarnaDialog.7
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                AmbilWarnaDialog.this.moveCursor();
                if (AmbilWarnaDialog.this.supportsAlpha) {
                    AmbilWarnaDialog.this.moveAlphaCursor();
                }
                AmbilWarnaDialog.this.moveTarget();
                if (AmbilWarnaDialog.this.supportsAlpha) {
                    AmbilWarnaDialog.this.updateAlphaView();
                }
                view.getViewTreeObserver().removeGlobalOnLayoutListener(this);
            }
        });
    }

    protected void moveCursor() {
        float y = this.viewHue.getMeasuredHeight() - ((getHue() * this.viewHue.getMeasuredHeight()) / 360.0f);
        if (y == this.viewHue.getMeasuredHeight()) {
            y = 0.0f;
        }
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.viewCursor.getLayoutParams();
        layoutParams.leftMargin = (int) ((this.viewHue.getLeft() - Math.floor(this.viewCursor.getMeasuredWidth() / 2)) - this.viewContainer.getPaddingLeft());
        layoutParams.topMargin = (int) (((this.viewHue.getTop() + y) - Math.floor(this.viewCursor.getMeasuredHeight() / 2)) - this.viewContainer.getPaddingTop());
        this.viewCursor.setLayoutParams(layoutParams);
    }

    protected void moveTarget() {
        float x = getSat() * this.viewSatVal.getMeasuredWidth();
        float y = (1.0f - getVal()) * this.viewSatVal.getMeasuredHeight();
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.viewTarget.getLayoutParams();
        layoutParams.leftMargin = (int) (((this.viewSatVal.getLeft() + x) - Math.floor(this.viewTarget.getMeasuredWidth() / 2)) - this.viewContainer.getPaddingLeft());
        layoutParams.topMargin = (int) (((this.viewSatVal.getTop() + y) - Math.floor(this.viewTarget.getMeasuredHeight() / 2)) - this.viewContainer.getPaddingTop());
        this.viewTarget.setLayoutParams(layoutParams);
    }

    protected void moveAlphaCursor() {
        int measuredHeight = this.viewAlphaCheckered.getMeasuredHeight();
        float y = measuredHeight - ((getAlpha() * measuredHeight) / 255.0f);
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.viewAlphaCursor.getLayoutParams();
        layoutParams.leftMargin = (int) ((this.viewAlphaCheckered.getLeft() - Math.floor(this.viewAlphaCursor.getMeasuredWidth() / 2)) - this.viewContainer.getPaddingLeft());
        layoutParams.topMargin = (int) (((this.viewAlphaCheckered.getTop() + y) - Math.floor(this.viewAlphaCursor.getMeasuredHeight() / 2)) - this.viewContainer.getPaddingTop());
        this.viewAlphaCursor.setLayoutParams(layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getColor() {
        int argb = Color.HSVToColor(this.currentColorHsv);
        return (this.alpha << 24) | (argb & 16777215);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float getHue() {
        return this.currentColorHsv[0];
    }

    private float getAlpha() {
        return this.alpha;
    }

    private float getSat() {
        return this.currentColorHsv[1];
    }

    private float getVal() {
        return this.currentColorHsv[2];
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setHue(float hue) {
        this.currentColorHsv[0] = hue;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setSat(float sat) {
        this.currentColorHsv[1] = sat;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setAlpha(int alpha) {
        this.alpha = alpha;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVal(float val) {
        this.currentColorHsv[2] = val;
    }

    public void show() {
        this.dialog.show();
    }

    public AlertDialog getDialog() {
        return this.dialog;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateAlphaView() {
        GradientDrawable gd = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{Color.HSVToColor(this.currentColorHsv), 0});
        this.viewAlphaOverlay.setBackgroundDrawable(gd);
    }
}
