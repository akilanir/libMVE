package android.support.v4.app;

import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.view.View;

/* compiled from: FragmentManager.java */
/* loaded from: com.android.support.support-v4.22.2.1.jar:android/support/v4/app/FragmentContainer.class */
interface FragmentContainer {
    @Nullable
    View findViewById(@IdRes int i);

    boolean hasView();
}
