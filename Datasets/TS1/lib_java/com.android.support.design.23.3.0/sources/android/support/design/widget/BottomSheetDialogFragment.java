package android.support.design.widget;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v7.app.AppCompatDialogFragment;

/* loaded from: com.android.support.design.23.3.0.jar:android/support/design/widget/BottomSheetDialogFragment.class */
public class BottomSheetDialogFragment extends AppCompatDialogFragment {
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new BottomSheetDialog(getActivity(), getTheme());
    }
}
