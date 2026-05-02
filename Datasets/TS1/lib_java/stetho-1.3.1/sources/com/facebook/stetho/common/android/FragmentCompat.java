package com.facebook.stetho.common.android;

import android.app.Activity;
import android.os.Build;
import com.facebook.stetho.common.ReflectionUtil;
import java.lang.reflect.Field;
import java.util.List;
import javax.annotation.Nullable;
import javax.annotation.concurrent.NotThreadSafe;

@NotThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompat.class */
public abstract class FragmentCompat<FRAGMENT, DIALOG_FRAGMENT, FRAGMENT_MANAGER, FRAGMENT_ACTIVITY extends Activity> {
    private static FragmentCompat sFrameworkInstance;
    private static FragmentCompat sSupportInstance;
    private static final boolean sHasSupportFragment;

    public abstract Class<FRAGMENT> getFragmentClass();

    public abstract Class<DIALOG_FRAGMENT> getDialogFragmentClass();

    public abstract Class<FRAGMENT_ACTIVITY> getFragmentActivityClass();

    /* renamed from: forFragment */
    public abstract FragmentAccessor<FRAGMENT, FRAGMENT_MANAGER> forFragment2();

    /* renamed from: forDialogFragment */
    public abstract DialogFragmentAccessor<DIALOG_FRAGMENT, FRAGMENT, FRAGMENT_MANAGER> forDialogFragment2();

    /* renamed from: forFragmentManager */
    public abstract FragmentManagerAccessor<FRAGMENT_MANAGER, FRAGMENT> forFragmentManager2();

    public abstract FragmentActivityAccessor<FRAGMENT_ACTIVITY, FRAGMENT_MANAGER> forFragmentActivity();

    static {
        sHasSupportFragment = ReflectionUtil.tryGetClassForName("android.support.v4.app.Fragment") != null;
    }

    @Nullable
    public static FragmentCompat getFrameworkInstance() {
        if (sFrameworkInstance == null && Build.VERSION.SDK_INT >= 11) {
            sFrameworkInstance = new FragmentCompatFramework();
        }
        return sFrameworkInstance;
    }

    @Nullable
    public static FragmentCompat getSupportLibInstance() {
        if (sSupportInstance == null && sHasSupportFragment) {
            sSupportInstance = new FragmentCompatSupportLib();
        }
        return sSupportInstance;
    }

    FragmentCompat() {
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompat$FragmentManagerAccessorViaReflection.class */
    static class FragmentManagerAccessorViaReflection<FRAGMENT_MANAGER, FRAGMENT> implements FragmentManagerAccessor<FRAGMENT_MANAGER, FRAGMENT> {

        @Nullable
        private Field mFieldMAdded;

        FragmentManagerAccessorViaReflection() {
        }

        @Override // com.facebook.stetho.common.android.FragmentManagerAccessor
        @Nullable
        public List<FRAGMENT> getAddedFragments(FRAGMENT_MANAGER fragmentManager) {
            Field fieldMAdded;
            if (this.mFieldMAdded == null && (fieldMAdded = ReflectionUtil.tryGetDeclaredField(fragmentManager.getClass(), "mAdded")) != null) {
                fieldMAdded.setAccessible(true);
                this.mFieldMAdded = fieldMAdded;
            }
            if (this.mFieldMAdded != null) {
                return (List) ReflectionUtil.getFieldValue(this.mFieldMAdded, fragmentManager);
            }
            return null;
        }
    }
}
