package android.support.v4.app;

import android.support.annotation.IntDef;
import android.support.annotation.Nullable;
import android.view.View;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/app/FragmentTransaction.class */
public abstract class FragmentTransaction {
    public static final int TRANSIT_ENTER_MASK = 4096;
    public static final int TRANSIT_EXIT_MASK = 8192;
    public static final int TRANSIT_UNSET = -1;
    public static final int TRANSIT_NONE = 0;
    public static final int TRANSIT_FRAGMENT_OPEN = 4097;
    public static final int TRANSIT_FRAGMENT_CLOSE = 8194;
    public static final int TRANSIT_FRAGMENT_FADE = 4099;

    @Retention(RetentionPolicy.SOURCE)
    @IntDef({0, 4097, 8194})
    /* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/app/FragmentTransaction$Transit.class */
    private @interface Transit {
    }

    public abstract FragmentTransaction add(Fragment fragment, String str);

    public abstract FragmentTransaction add(int i, Fragment fragment);

    public abstract FragmentTransaction add(int i, Fragment fragment, @Nullable String str);

    public abstract FragmentTransaction replace(int i, Fragment fragment);

    public abstract FragmentTransaction replace(int i, Fragment fragment, @Nullable String str);

    public abstract FragmentTransaction remove(Fragment fragment);

    public abstract FragmentTransaction hide(Fragment fragment);

    public abstract FragmentTransaction show(Fragment fragment);

    public abstract FragmentTransaction detach(Fragment fragment);

    public abstract FragmentTransaction attach(Fragment fragment);

    public abstract boolean isEmpty();

    public abstract FragmentTransaction setCustomAnimations(int i, int i2);

    public abstract FragmentTransaction setCustomAnimations(int i, int i2, int i3, int i4);

    public abstract FragmentTransaction addSharedElement(View view, String str);

    public abstract FragmentTransaction setTransition(int i);

    public abstract FragmentTransaction setTransitionStyle(int i);

    public abstract FragmentTransaction addToBackStack(@Nullable String str);

    public abstract boolean isAddToBackStackAllowed();

    public abstract FragmentTransaction disallowAddToBackStack();

    public abstract FragmentTransaction setBreadCrumbTitle(int i);

    public abstract FragmentTransaction setBreadCrumbTitle(CharSequence charSequence);

    public abstract FragmentTransaction setBreadCrumbShortTitle(int i);

    public abstract FragmentTransaction setBreadCrumbShortTitle(CharSequence charSequence);

    public abstract int commit();

    public abstract int commitAllowingStateLoss();
}
