package android.support.v4.app;

import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.view.View;

/* loaded from: com.android.support.support-v4.23.3.0.jar:android/support/v4/app/FragmentContainer.class */
public abstract class FragmentContainer {
    @Nullable
    public abstract View onFindViewById(@IdRes int i);

    public abstract boolean onHasView();
}
