package android.support.v7.app;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v7.graphics.drawable.DrawerArrowDrawable;

/* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/app/AppCompatDialogFragment.class */
public class AppCompatDialogFragment extends DialogFragment {
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new AppCompatDialog(getActivity(), getTheme());
    }

    public void setupDialog(Dialog dialog, int style) {
        if (dialog instanceof AppCompatDialog) {
            AppCompatDialog acd = (AppCompatDialog) dialog;
            switch (style) {
                case 1:
                case 2:
                    break;
                case DrawerArrowDrawable.ARROW_DIRECTION_END /* 3 */:
                    dialog.getWindow().addFlags(24);
                    break;
                default:
                    return;
            }
            acd.supportRequestWindowFeature(1);
            return;
        }
        super.setupDialog(dialog, style);
    }
}
