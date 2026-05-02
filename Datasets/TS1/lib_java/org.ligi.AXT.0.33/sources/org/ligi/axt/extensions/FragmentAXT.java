package org.ligi.axt.extensions;

import android.app.Fragment;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/FragmentAXT.class */
public class FragmentAXT {
    private final Fragment mFragment;

    public FragmentAXT(Fragment fragment) {
        this.mFragment = fragment;
    }

    public <T> T findById(int i) {
        return (T) this.mFragment.getView().findViewById(i);
    }
}
