package android.support.v13.app;

import android.app.Fragment;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import java.util.Arrays;

/* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat.class */
public class FragmentCompat {
    static final FragmentCompatImpl IMPL;

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$FragmentCompatImpl.class */
    interface FragmentCompatImpl {
        void setMenuVisibility(Fragment fragment, boolean z);

        void setUserVisibleHint(Fragment fragment, boolean z);

        void requestPermissions(Fragment fragment, String[] strArr, int i);

        boolean shouldShowRequestPermissionRationale(Fragment fragment, String str);
    }

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$OnRequestPermissionsResultCallback.class */
    public interface OnRequestPermissionsResultCallback {
        void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr);
    }

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$BaseFragmentCompatImpl.class */
    static class BaseFragmentCompatImpl implements FragmentCompatImpl {
        BaseFragmentCompatImpl() {
        }

        @Override // android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void setMenuVisibility(Fragment f, boolean visible) {
        }

        @Override // android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void setUserVisibleHint(Fragment f, boolean deferStart) {
        }

        @Override // android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void requestPermissions(final Fragment fragment, final String[] permissions, final int requestCode) {
            Handler handler = new Handler(Looper.getMainLooper());
            handler.post(new Runnable() { // from class: android.support.v13.app.FragmentCompat.BaseFragmentCompatImpl.1
                @Override // java.lang.Runnable
                public void run() {
                    int[] grantResults = new int[permissions.length];
                    Context context = fragment.getActivity();
                    if (context != null) {
                        PackageManager packageManager = context.getPackageManager();
                        String packageName = context.getPackageName();
                        int permissionCount = permissions.length;
                        for (int i = 0; i < permissionCount; i++) {
                            grantResults[i] = packageManager.checkPermission(permissions[i], packageName);
                        }
                    } else {
                        Arrays.fill(grantResults, -1);
                    }
                    ((OnRequestPermissionsResultCallback) fragment).onRequestPermissionsResult(requestCode, permissions, grantResults);
                }
            });
        }

        @Override // android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public boolean shouldShowRequestPermissionRationale(Fragment fragment, String permission) {
            return false;
        }
    }

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$ICSFragmentCompatImpl.class */
    static class ICSFragmentCompatImpl extends BaseFragmentCompatImpl {
        ICSFragmentCompatImpl() {
        }

        @Override // android.support.v13.app.FragmentCompat.BaseFragmentCompatImpl, android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void setMenuVisibility(Fragment f, boolean visible) {
            FragmentCompatICS.setMenuVisibility(f, visible);
        }
    }

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$ICSMR1FragmentCompatImpl.class */
    static class ICSMR1FragmentCompatImpl extends ICSFragmentCompatImpl {
        ICSMR1FragmentCompatImpl() {
        }

        @Override // android.support.v13.app.FragmentCompat.BaseFragmentCompatImpl, android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void setUserVisibleHint(Fragment f, boolean deferStart) {
            FragmentCompatICSMR1.setUserVisibleHint(f, deferStart);
        }
    }

    /* loaded from: com.android.support.support-v13.23.1.0.jar:android/support/v13/app/FragmentCompat$MncFragmentCompatImpl.class */
    static class MncFragmentCompatImpl extends ICSMR1FragmentCompatImpl {
        MncFragmentCompatImpl() {
        }

        @Override // android.support.v13.app.FragmentCompat.BaseFragmentCompatImpl, android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public void requestPermissions(Fragment fragment, String[] permissions, int requestCode) {
            FragmentCompat23.requestPermissions(fragment, permissions, requestCode);
        }

        @Override // android.support.v13.app.FragmentCompat.BaseFragmentCompatImpl, android.support.v13.app.FragmentCompat.FragmentCompatImpl
        public boolean shouldShowRequestPermissionRationale(Fragment fragment, String permission) {
            return FragmentCompat23.shouldShowRequestPermissionRationale(fragment, permission);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 23) {
            IMPL = new MncFragmentCompatImpl();
            return;
        }
        if (Build.VERSION.SDK_INT >= 15) {
            IMPL = new ICSMR1FragmentCompatImpl();
        } else if (Build.VERSION.SDK_INT >= 14) {
            IMPL = new ICSFragmentCompatImpl();
        } else {
            IMPL = new BaseFragmentCompatImpl();
        }
    }

    public static void setMenuVisibility(Fragment f, boolean visible) {
        IMPL.setMenuVisibility(f, visible);
    }

    public static void setUserVisibleHint(Fragment f, boolean deferStart) {
        IMPL.setUserVisibleHint(f, deferStart);
    }

    public static void requestPermissions(@NonNull Fragment fragment, @NonNull String[] permissions, int requestCode) {
        IMPL.requestPermissions(fragment, permissions, requestCode);
    }

    public static boolean shouldShowRequestPermissionRationale(@NonNull Fragment fragment, @NonNull String permission) {
        return IMPL.shouldShowRequestPermissionRationale(fragment, permission);
    }
}
