package com.facebook.stetho.common.android;

import android.app.Activity;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentActivityAccessor.class */
public interface FragmentActivityAccessor<FRAGMENT_ACTIVITY extends Activity, FRAGMENT_MANAGER> {
    @Nullable
    FRAGMENT_MANAGER getFragmentManager(FRAGMENT_ACTIVITY fragment_activity);
}
