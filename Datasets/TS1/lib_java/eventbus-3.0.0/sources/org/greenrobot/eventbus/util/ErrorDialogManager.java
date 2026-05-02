package org.greenrobot.eventbus.util;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import org.greenrobot.eventbus.EventBus;

/* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/util/ErrorDialogManager.class */
public class ErrorDialogManager {
    public static ErrorDialogFragmentFactory<?> factory;
    protected static final String TAG_ERROR_DIALOG = "de.greenrobot.eventbus.error_dialog";
    protected static final String TAG_ERROR_DIALOG_MANAGER = "de.greenrobot.eventbus.error_dialog_manager";
    public static final String KEY_TITLE = "de.greenrobot.eventbus.errordialog.title";
    public static final String KEY_MESSAGE = "de.greenrobot.eventbus.errordialog.message";
    public static final String KEY_FINISH_AFTER_DIALOG = "de.greenrobot.eventbus.errordialog.finish_after_dialog";
    public static final String KEY_ICON_ID = "de.greenrobot.eventbus.errordialog.icon_id";
    public static final String KEY_EVENT_TYPE_ON_CLOSE = "de.greenrobot.eventbus.errordialog.event_type_on_close";

    /* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/util/ErrorDialogManager$SupportManagerFragment.class */
    public static class SupportManagerFragment extends Fragment {
        protected boolean finishAfterDialog;
        protected Bundle argumentsForErrorDialog;
        private EventBus eventBus;
        private boolean skipRegisterOnNextResume;
        private Object executionScope;

        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            this.eventBus = ErrorDialogManager.factory.config.getEventBus();
            this.eventBus.register(this);
            this.skipRegisterOnNextResume = true;
        }

        public void onResume() {
            super.onResume();
            if (this.skipRegisterOnNextResume) {
                this.skipRegisterOnNextResume = false;
            } else {
                this.eventBus = ErrorDialogManager.factory.config.getEventBus();
                this.eventBus.register(this);
            }
        }

        public void onPause() {
            this.eventBus.unregister(this);
            super.onPause();
        }

        public void onEventMainThread(ThrowableFailureEvent event) {
            if (!ErrorDialogManager.isInExecutionScope(this.executionScope, event)) {
                return;
            }
            ErrorDialogManager.checkLogException(event);
            FragmentManager fm = getFragmentManager();
            fm.executePendingTransactions();
            DialogFragment existingFragment = fm.findFragmentByTag(ErrorDialogManager.TAG_ERROR_DIALOG);
            if (existingFragment != null) {
                existingFragment.dismiss();
            }
            DialogFragment errorFragment = (DialogFragment) ErrorDialogManager.factory.prepareErrorFragment(event, this.finishAfterDialog, this.argumentsForErrorDialog);
            if (errorFragment != null) {
                errorFragment.show(fm, ErrorDialogManager.TAG_ERROR_DIALOG);
            }
        }

        public static void attachTo(Activity activity, Object executionScope, boolean finishAfterDialog, Bundle argumentsForErrorDialog) {
            FragmentManager fm = ((FragmentActivity) activity).getSupportFragmentManager();
            SupportManagerFragment fragment = (SupportManagerFragment) fm.findFragmentByTag(ErrorDialogManager.TAG_ERROR_DIALOG_MANAGER);
            if (fragment == null) {
                fragment = new SupportManagerFragment();
                fm.beginTransaction().add(fragment, ErrorDialogManager.TAG_ERROR_DIALOG_MANAGER).commit();
                fm.executePendingTransactions();
            }
            fragment.finishAfterDialog = finishAfterDialog;
            fragment.argumentsForErrorDialog = argumentsForErrorDialog;
            fragment.executionScope = executionScope;
        }
    }

    @TargetApi(11)
    /* loaded from: eventbus-3.0.0.jar:org/greenrobot/eventbus/util/ErrorDialogManager$HoneycombManagerFragment.class */
    public static class HoneycombManagerFragment extends android.app.Fragment {
        protected boolean finishAfterDialog;
        protected Bundle argumentsForErrorDialog;
        private EventBus eventBus;
        private Object executionScope;

        @Override // android.app.Fragment
        public void onResume() {
            super.onResume();
            this.eventBus = ErrorDialogManager.factory.config.getEventBus();
            this.eventBus.register(this);
        }

        @Override // android.app.Fragment
        public void onPause() {
            this.eventBus.unregister(this);
            super.onPause();
        }

        public void onEventMainThread(ThrowableFailureEvent event) {
            if (!ErrorDialogManager.isInExecutionScope(this.executionScope, event)) {
                return;
            }
            ErrorDialogManager.checkLogException(event);
            android.app.FragmentManager fm = getFragmentManager();
            fm.executePendingTransactions();
            android.app.DialogFragment existingFragment = (android.app.DialogFragment) fm.findFragmentByTag(ErrorDialogManager.TAG_ERROR_DIALOG);
            if (existingFragment != null) {
                existingFragment.dismiss();
            }
            android.app.DialogFragment errorFragment = (android.app.DialogFragment) ErrorDialogManager.factory.prepareErrorFragment(event, this.finishAfterDialog, this.argumentsForErrorDialog);
            if (errorFragment != null) {
                errorFragment.show(fm, ErrorDialogManager.TAG_ERROR_DIALOG);
            }
        }

        public static void attachTo(Activity activity, Object executionScope, boolean finishAfterDialog, Bundle argumentsForErrorDialog) {
            android.app.FragmentManager fm = activity.getFragmentManager();
            HoneycombManagerFragment fragment = (HoneycombManagerFragment) fm.findFragmentByTag(ErrorDialogManager.TAG_ERROR_DIALOG_MANAGER);
            if (fragment == null) {
                fragment = new HoneycombManagerFragment();
                fm.beginTransaction().add(fragment, ErrorDialogManager.TAG_ERROR_DIALOG_MANAGER).commit();
                fm.executePendingTransactions();
            }
            fragment.finishAfterDialog = finishAfterDialog;
            fragment.argumentsForErrorDialog = argumentsForErrorDialog;
            fragment.executionScope = executionScope;
        }
    }

    public static void attachTo(Activity activity) {
        attachTo(activity, false, null);
    }

    public static void attachTo(Activity activity, boolean finishAfterDialog) {
        attachTo(activity, finishAfterDialog, null);
    }

    public static void attachTo(Activity activity, boolean finishAfterDialog, Bundle argumentsForErrorDialog) {
        Object executionScope = activity.getClass();
        attachTo(activity, executionScope, finishAfterDialog, argumentsForErrorDialog);
    }

    public static void attachTo(Activity activity, Object executionScope, boolean finishAfterDialog, Bundle argumentsForErrorDialog) {
        if (factory == null) {
            throw new RuntimeException("You must set the static factory field to configure error dialogs for your app.");
        }
        if (isSupportActivity(activity)) {
            SupportManagerFragment.attachTo(activity, executionScope, finishAfterDialog, argumentsForErrorDialog);
        } else {
            HoneycombManagerFragment.attachTo(activity, executionScope, finishAfterDialog, argumentsForErrorDialog);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x007d, code lost:
    
        throw new java.lang.RuntimeException("Please use SherlockFragmentActivity. Illegal activity: " + r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean isSupportActivity(android.app.Activity r5) {
        /*
            r0 = 0
            r6 = r0
            r0 = r5
            java.lang.Class r0 = r0.getClass()
            java.lang.Class r0 = r0.getSuperclass()
            r7 = r0
        La:
            r0 = r7
            if (r0 != 0) goto L2c
            java.lang.RuntimeException r0 = new java.lang.RuntimeException
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r3 = r2
            r3.<init>()
            java.lang.String r3 = "Illegal activity type: "
            java.lang.StringBuilder r2 = r2.append(r3)
            r3 = r5
            java.lang.Class r3 = r3.getClass()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            r1.<init>(r2)
            throw r0
        L2c:
            r0 = r7
            java.lang.String r0 = r0.getName()
            r8 = r0
            r0 = r8
            java.lang.String r1 = "android.support.v4.app.FragmentActivity"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L3f
            r0 = 1
            r6 = r0
            goto La1
        L3f:
            r0 = r8
            java.lang.String r1 = "com.actionbarsherlock.app"
            boolean r0 = r0.startsWith(r1)
            if (r0 == 0) goto L7e
            r0 = r8
            java.lang.String r1 = ".SherlockActivity"
            boolean r0 = r0.endsWith(r1)
            if (r0 != 0) goto L63
            r0 = r8
            java.lang.String r1 = ".SherlockListActivity"
            boolean r0 = r0.endsWith(r1)
            if (r0 != 0) goto L63
            r0 = r8
            java.lang.String r1 = ".SherlockPreferenceActivity"
            boolean r0 = r0.endsWith(r1)
            if (r0 == 0) goto L7e
        L63:
            java.lang.RuntimeException r0 = new java.lang.RuntimeException
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r3 = r2
            r3.<init>()
            java.lang.String r3 = "Please use SherlockFragmentActivity. Illegal activity: "
            java.lang.StringBuilder r2 = r2.append(r3)
            r3 = r8
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            r1.<init>(r2)
            throw r0
        L7e:
            r0 = r8
            java.lang.String r1 = "android.app.Activity"
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L99
            int r0 = android.os.Build.VERSION.SDK_INT
            r1 = 11
            if (r0 >= r1) goto La1
            java.lang.RuntimeException r0 = new java.lang.RuntimeException
            r1 = r0
            java.lang.String r2 = "Illegal activity without fragment support. Either use Android 3.0+ or android.support.v4.app.FragmentActivity."
            r1.<init>(r2)
            throw r0
        L99:
            r0 = r7
            java.lang.Class r0 = r0.getSuperclass()
            r7 = r0
            goto La
        La1:
            r0 = r6
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.greenrobot.eventbus.util.ErrorDialogManager.isSupportActivity(android.app.Activity):boolean");
    }

    protected static void checkLogException(ThrowableFailureEvent event) {
        if (factory.config.logExceptions) {
            String tag = factory.config.tagForLoggingExceptions;
            if (tag == null) {
                tag = EventBus.TAG;
            }
            Log.i(tag, "Error dialog manager received exception", event.throwable);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isInExecutionScope(Object executionScope, ThrowableFailureEvent event) {
        Object eventExecutionScope;
        if (event != null && (eventExecutionScope = event.getExecutionScope()) != null && !eventExecutionScope.equals(executionScope)) {
            return false;
        }
        return true;
    }
}
