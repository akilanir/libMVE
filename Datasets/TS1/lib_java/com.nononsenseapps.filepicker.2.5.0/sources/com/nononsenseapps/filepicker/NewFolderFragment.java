package com.nononsenseapps.filepicker;

import android.support.v4.app.FragmentManager;
import android.text.TextUtils;
import com.nononsenseapps.filepicker.NewItemFragment;

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/NewFolderFragment.class */
public class NewFolderFragment extends NewItemFragment {
    private static final String TAG = "new_folder_fragment";

    public static void showDialog(FragmentManager fm, NewItemFragment.OnNewFolderListener listener) {
        NewItemFragment d = new NewFolderFragment();
        d.setListener(listener);
        d.show(fm, TAG);
    }

    @Override // com.nononsenseapps.filepicker.NewItemFragment
    protected boolean validateName(String itemName) {
        return (TextUtils.isEmpty(itemName) || itemName.contains("/") || itemName.equals(".") || itemName.equals("..")) ? false : true;
    }
}
