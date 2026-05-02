package android.support.design.widget;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.StyleRes;
import android.support.design.R;
import android.support.design.widget.BottomSheetBehavior;
import android.support.v4.view.MotionEventCompat;
import android.support.v7.app.AppCompatDialog;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/BottomSheetDialog.class */
public class BottomSheetDialog extends AppCompatDialog {
    private BottomSheetBehavior.BottomSheetCallback mBottomSheetCallback;

    public BottomSheetDialog(@NonNull Context context) {
        this(context, 0);
    }

    public BottomSheetDialog(@NonNull Context context, @StyleRes int theme) {
        super(context, getThemeResId(context, theme));
        this.mBottomSheetCallback = new BottomSheetBehavior.BottomSheetCallback() { // from class: android.support.design.widget.BottomSheetDialog.2
            @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
            public void onStateChanged(@NonNull View bottomSheet, int newState) {
                if (newState == 5) {
                    BottomSheetDialog.this.dismiss();
                }
            }

            @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
            public void onSlide(@NonNull View bottomSheet, float slideOffset) {
            }
        };
    }

    protected BottomSheetDialog(@NonNull Context context, boolean cancelable, DialogInterface.OnCancelListener cancelListener) {
        super(context, cancelable, cancelListener);
        this.mBottomSheetCallback = new BottomSheetBehavior.BottomSheetCallback() { // from class: android.support.design.widget.BottomSheetDialog.2
            @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
            public void onStateChanged(@NonNull View bottomSheet, int newState) {
                if (newState == 5) {
                    BottomSheetDialog.this.dismiss();
                }
            }

            @Override // android.support.design.widget.BottomSheetBehavior.BottomSheetCallback
            public void onSlide(@NonNull View bottomSheet, float slideOffset) {
            }
        };
    }

    public void setContentView(@LayoutRes int layoutResId) {
        super.setContentView(wrapInBottomSheet(layoutResId, null, null));
    }

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setLayout(-1, -1);
    }

    public void setContentView(View view) {
        super.setContentView(wrapInBottomSheet(0, view, null));
    }

    public void setContentView(View view, ViewGroup.LayoutParams params) {
        super.setContentView(wrapInBottomSheet(0, view, params));
    }

    private View wrapInBottomSheet(int layoutResId, View view, ViewGroup.LayoutParams params) {
        final CoordinatorLayout coordinator = (CoordinatorLayout) View.inflate(getContext(), R.layout.design_bottom_sheet_dialog, null);
        if (layoutResId != 0 && view == null) {
            view = getLayoutInflater().inflate(layoutResId, (ViewGroup) coordinator, false);
        }
        FrameLayout bottomSheet = (FrameLayout) coordinator.findViewById(R.id.design_bottom_sheet);
        BottomSheetBehavior.from(bottomSheet).setBottomSheetCallback(this.mBottomSheetCallback);
        if (params == null) {
            bottomSheet.addView(view);
        } else {
            bottomSheet.addView(view, params);
        }
        if (shouldWindowCloseOnTouchOutside()) {
            final View finalView = view;
            coordinator.setOnTouchListener(new View.OnTouchListener() { // from class: android.support.design.widget.BottomSheetDialog.1
                @Override // android.view.View.OnTouchListener
                public boolean onTouch(View v, MotionEvent event) {
                    if (BottomSheetDialog.this.isShowing() && MotionEventCompat.getActionMasked(event) == 1 && !coordinator.isPointInChildBounds(finalView, (int) event.getX(), (int) event.getY())) {
                        BottomSheetDialog.this.cancel();
                        return true;
                    }
                    return false;
                }
            });
        }
        return coordinator;
    }

    private boolean shouldWindowCloseOnTouchOutside() {
        if (Build.VERSION.SDK_INT < 11) {
            return true;
        }
        TypedValue value = new TypedValue();
        return getContext().getTheme().resolveAttribute(android.R.attr.windowCloseOnTouchOutside, value, true) && value.data != 0;
    }

    private static int getThemeResId(Context context, int themeId) {
        if (themeId == 0) {
            TypedValue outValue = new TypedValue();
            if (context.getTheme().resolveAttribute(R.attr.bottomSheetDialogTheme, outValue, true)) {
                themeId = outValue.resourceId;
            } else {
                themeId = R.style.Theme_Design_Light_BottomSheetDialog;
            }
        }
        return themeId;
    }
}
