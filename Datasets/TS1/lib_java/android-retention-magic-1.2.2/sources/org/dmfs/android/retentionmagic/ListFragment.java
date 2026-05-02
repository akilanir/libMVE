package org.dmfs.android.retentionmagic;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;

/* loaded from: android-retention-magic-1.2.2.jar:org/dmfs/android/retentionmagic/ListFragment.class */
public class ListFragment extends android.app.ListFragment {
    private SharedPreferences mPrefs;

    @Override // android.app.Fragment
    public void onAttach(android.app.Activity activity) {
        super.onAttach(activity);
        RetentionMagic.init(this, getArguments());
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        android.app.Activity activity = getActivity();
        this.mPrefs = activity.getSharedPreferences(String.valueOf(activity.getPackageName()) + ".sharedPrefences", 0);
        if (savedInstanceState == null) {
            RetentionMagic.init(this, this.mPrefs);
        } else {
            RetentionMagic.restore(this, savedInstanceState);
        }
    }

    @Override // android.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        RetentionMagic.store(this, outState);
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        if (Build.VERSION.SDK_INT < 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }

    @Override // android.app.Fragment
    public void onStop() {
        super.onStop();
        if (Build.VERSION.SDK_INT >= 11) {
            RetentionMagic.persist(this, this.mPrefs);
        }
    }
}
