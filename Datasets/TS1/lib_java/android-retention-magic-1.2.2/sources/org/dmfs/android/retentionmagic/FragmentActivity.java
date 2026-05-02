package org.dmfs.android.retentionmagic;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/FragmentActivity.class */
public class FragmentActivity extends android.support.v4.app.FragmentActivity {
    private SharedPreferences mPrefs;

    /* JADX WARN: Multi-variable type inference failed */
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mPrefs = getSharedPreferences(String.valueOf(getPackageName()) + ".sharedPrefences", 0);
        RetentionMagic.init((android.app.Activity) this, getIntent().getExtras());
        if (savedInstanceState == null) {
            RetentionMagic.init((android.app.Activity) this, this.mPrefs);
        } else {
            RetentionMagic.restore((android.app.Activity) this, savedInstanceState);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        RetentionMagic.store((android.app.Activity) this, outState);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void onPause() {
        super.onPause();
        if (Build.VERSION.SDK_INT < 11) {
            RetentionMagic.persist((android.app.Activity) this, this.mPrefs);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void onStop() {
        super.onStop();
        if (Build.VERSION.SDK_INT >= 11) {
            RetentionMagic.persist((android.app.Activity) this, this.mPrefs);
        }
    }
}
