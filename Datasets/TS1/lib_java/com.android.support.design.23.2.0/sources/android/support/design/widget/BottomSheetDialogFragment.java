package android.support.design.widget;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v7.app.AppCompatDialogFragment;

/* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/BottomSheetDialogFragment.class */
public class BottomSheetDialogFragment extends AppCompatDialogFragment {
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new BottomSheetDialog(getActivity(), getTheme());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void setupDialog(Dialog dialog, int style) {
        if (dialog instanceof BottomSheetDialog) {
            ((BottomSheetDialog) dialog).supportRequestWindowFeature(1);
        } else {
            super.setupDialog(dialog, style);
        }
    }
}
