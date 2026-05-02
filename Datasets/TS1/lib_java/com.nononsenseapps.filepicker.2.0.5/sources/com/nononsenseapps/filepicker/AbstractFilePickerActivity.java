package com.nononsenseapps.filepicker;

import android.annotation.TargetApi;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import com.nononsenseapps.filepicker.AbstractFilePickerFragment;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: com.nononsenseapps.filepicker.2.0.5.jar:com/nononsenseapps/filepicker/AbstractFilePickerActivity.class */
public abstract class AbstractFilePickerActivity<T> extends AppCompatActivity implements AbstractFilePickerFragment.OnFilePickedListener {
    public static final String EXTRA_START_PATH = "nononsense.intent.START_PATH";
    public static final String EXTRA_MODE = "nononsense.intent.MODE";
    public static final String EXTRA_ALLOW_CREATE_DIR = "nononsense.intent.ALLOW_CREATE_DIR";
    public static final String EXTRA_ALLOW_MULTIPLE = "android.intent.extra.ALLOW_MULTIPLE";
    public static final String EXTRA_PATHS = "nononsense.intent.PATHS";
    public static final int MODE_FILE = 0;
    public static final int MODE_FILE_AND_DIR = 2;
    public static final int MODE_DIR = 1;
    protected static final String TAG = "filepicker_fragment";
    protected String startPath = null;
    protected int mode = 0;
    protected boolean allowCreateDir = false;
    protected boolean allowMultiple = false;

    protected abstract AbstractFilePickerFragment<T> getFragment(String str, int i, boolean z, boolean z2);

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_filepicker);
        Intent intent = getIntent();
        if (intent != null) {
            this.startPath = intent.getStringExtra(EXTRA_START_PATH);
            this.mode = intent.getIntExtra(EXTRA_MODE, this.mode);
            this.allowCreateDir = intent.getBooleanExtra(EXTRA_ALLOW_CREATE_DIR, this.allowCreateDir);
            this.allowMultiple = intent.getBooleanExtra(EXTRA_ALLOW_MULTIPLE, this.allowMultiple);
        }
        FragmentManager fm = getSupportFragmentManager();
        AbstractFilePickerFragment<T> fragment = (AbstractFilePickerFragment) fm.findFragmentByTag(TAG);
        if (fragment == null) {
            fragment = getFragment(this.startPath, this.mode, this.allowMultiple, this.allowCreateDir);
        }
        if (fragment != null) {
            fm.beginTransaction().replace(R.id.fragment, fragment, TAG).commit();
        }
        setResult(0);
    }

    public void onSaveInstanceState(Bundle b) {
        super.onSaveInstanceState(b);
    }

    @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.OnFilePickedListener
    public void onFilePicked(Uri file) {
        Intent i = new Intent();
        i.setData(file);
        setResult(-1, i);
        finish();
    }

    @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.OnFilePickedListener
    @TargetApi(16)
    public void onFilesPicked(List<Uri> files) {
        Intent i = new Intent();
        i.putExtra(EXTRA_ALLOW_MULTIPLE, true);
        if (Build.VERSION.SDK_INT >= 16) {
            ClipData clip = null;
            for (Uri file : files) {
                if (clip == null) {
                    clip = new ClipData("Paths", new String[0], new ClipData.Item(file));
                } else {
                    clip.addItem(new ClipData.Item(file));
                }
            }
            i.setClipData(clip);
        } else {
            ArrayList<String> paths = new ArrayList<>();
            Iterator i$ = files.iterator();
            while (i$.hasNext()) {
                paths.add(i$.next().toString());
            }
            i.putStringArrayListExtra(EXTRA_PATHS, paths);
        }
        setResult(-1, i);
        finish();
    }

    @Override // com.nononsenseapps.filepicker.AbstractFilePickerFragment.OnFilePickedListener
    public void onCancelled() {
        setResult(0);
        finish();
    }
}
