package com.nononsenseapps.filepicker;

import android.annotation.SuppressLint;
import android.os.Environment;
import java.io.File;

@SuppressLint({"Registered"})
/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/FilePickerActivity.class */
public class FilePickerActivity extends AbstractFilePickerActivity<File> {
    @Override // com.nononsenseapps.filepicker.AbstractFilePickerActivity
    protected AbstractFilePickerFragment<File> getFragment(String startPath, int mode, boolean allowMultiple, boolean allowCreateDir) {
        AbstractFilePickerFragment<File> fragment = new FilePickerFragment();
        fragment.setArgs(startPath != null ? startPath : Environment.getExternalStorageDirectory().getPath(), mode, allowMultiple, allowCreateDir);
        return fragment;
    }
}
