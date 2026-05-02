package org.dmfs.android.retentionmagic;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/SupportFragment.class */
public class SupportFragment extends android.support.v4.app.Fragment {
    private SharedPreferences mPrefs;

    public void onAttach(android.app.Activity activity) {
        super.onAttach(activity);
        RetentionMagic.init(this, getArguments());
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        android.support.v4.app.FragmentActivity activity = getActivity();
        this.mPrefs = activity.getSharedPreferences(String.valueOf(activity.getPackageName()) + ".sharedPrefences", 0);
        if (savedInstanceState == null) {
            RetentionMagic.init(this, this.mPrefs);
        } else {
            RetentionMagic.restore(this, savedInstanceState);
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        RetentionMagic.store(this, outState);
    }

    public void onPause() {
        super.onPause();
        if (Build.VERSION.SDK_INT < 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }

    public void onStop() {
        super.onStop();
        if (Build.VERSION.SDK_INT >= 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }
}
