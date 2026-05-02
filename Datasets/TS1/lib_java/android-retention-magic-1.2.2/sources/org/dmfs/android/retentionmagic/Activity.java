package org.dmfs.android.retentionmagic;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/Activity.class */
public class Activity extends android.app.Activity {
    private SharedPreferences mPrefs;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mPrefs = getSharedPreferences(String.valueOf(getPackageName()) + ".sharedPrefences", 0);
        RetentionMagic.init(this, getIntent().getExtras());
        if (savedInstanceState == null) {
            RetentionMagic.init(this, this.mPrefs);
        } else {
            RetentionMagic.restore(this, savedInstanceState);
        }
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        RetentionMagic.store(this, outState);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (Build.VERSION.SDK_INT < 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        if (Build.VERSION.SDK_INT >= 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }
}
