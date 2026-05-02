package com.facebook.stetho.common.android;

import android.app.Dialog;
import android.content.res.Resources;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.View;
import com.facebook.stetho.common.android.FragmentCompat;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompatSupportLib.class */
final class FragmentCompatSupportLib extends FragmentCompat<Fragment, DialogFragment, FragmentManager, FragmentActivity> {
    private static final FragmentAccessorSupportLib sFragmentAccessor = new FragmentAccessorSupportLib();
    private static final DialogFragmentAccessorSupportLib sDialogFragmentAccessor = new DialogFragmentAccessorSupportLib();
    private static final FragmentCompat.FragmentManagerAccessorViaReflection<FragmentManager, Fragment> sFragmentManagerAccessor = new FragmentCompat.FragmentManagerAccessorViaReflection<>();
    private static final FragmentActivityAccessorSupportLib sFragmentActivityAccessor = new FragmentActivityAccessorSupportLib();

    FragmentCompatSupportLib() {
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    public Class<Fragment> getFragmentClass() {
        return Fragment.class;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    public Class<DialogFragment> getDialogFragmentClass() {
        return DialogFragment.class;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    public Class<FragmentActivity> getFragmentActivityClass() {
        return FragmentActivity.class;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    /* renamed from: forFragment, reason: merged with bridge method [inline-methods] */
    public FragmentAccessor<Fragment, FragmentManager> forFragment2() {
        return sFragmentAccessor;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    /* renamed from: forDialogFragment, reason: merged with bridge method [inline-methods] */
    public DialogFragmentAccessor<DialogFragment, Fragment, FragmentManager> forDialogFragment2() {
        return sDialogFragmentAccessor;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    /* renamed from: forFragmentManager */
    public FragmentManagerAccessor<FragmentManager, Fragment> forFragmentManager2() {
        return sFragmentManagerAccessor;
    }

    @Override // com.facebook.stetho.common.android.FragmentCompat
    public FragmentActivityAccessorSupportLib forFragmentActivity() {
        return sFragmentActivityAccessor;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompatSupportLib$FragmentAccessorSupportLib.class */
    private static class FragmentAccessorSupportLib implements FragmentAccessor<Fragment, FragmentManager> {
        private FragmentAccessorSupportLib() {
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        @Nullable
        public FragmentManager getFragmentManager(Fragment fragment) {
            return fragment.getFragmentManager();
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        public Resources getResources(Fragment fragment) {
            return fragment.getResources();
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        public int getId(Fragment fragment) {
            return fragment.getId();
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        @Nullable
        public String getTag(Fragment fragment) {
            return fragment.getTag();
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        @Nullable
        public View getView(Fragment fragment) {
            return fragment.getView();
        }

        @Override // com.facebook.stetho.common.android.FragmentAccessor
        @Nullable
        public FragmentManager getChildFragmentManager(Fragment fragment) {
            return fragment.getChildFragmentManager();
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompatSupportLib$DialogFragmentAccessorSupportLib.class */
    private static class DialogFragmentAccessorSupportLib extends FragmentAccessorSupportLib implements DialogFragmentAccessor<DialogFragment, Fragment, FragmentManager> {
        private DialogFragmentAccessorSupportLib() {
            super();
        }

        @Override // com.facebook.stetho.common.android.DialogFragmentAccessor
        public Dialog getDialog(DialogFragment dialogFragment) {
            return dialogFragment.getDialog();
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentCompatSupportLib$FragmentActivityAccessorSupportLib.class */
    private static class FragmentActivityAccessorSupportLib implements FragmentActivityAccessor<FragmentActivity, FragmentManager> {
        private FragmentActivityAccessorSupportLib() {
        }

        @Override // com.facebook.stetho.common.android.FragmentActivityAccessor
        @Nullable
        public FragmentManager getFragmentManager(FragmentActivity activity) {
            return activity.getSupportFragmentManager();
        }
    }
}
