package cat.ereza.customactivityoncrash;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.util.Log;
import cat.ereza.customactivityoncrash.activity.DefaultErrorActivity;
import java.io.PrintWriter;
import java.io.Serializable;
import java.io.StringWriter;
import java.lang.Thread;
import java.lang.ref.WeakReference;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

@SuppressLint({"NewApi"})
/* loaded from: cat.ereza.customactivityoncrash.1.4.0.jar:cat/ereza/customactivityoncrash/CustomActivityOnCrash.class */
public final class CustomActivityOnCrash {
    private static final String EXTRA_RESTART_ACTIVITY_CLASS = "cat.ereza.customactivityoncrash.EXTRA_RESTART_ACTIVITY_CLASS";
    private static final String EXTRA_SHOW_ERROR_DETAILS = "cat.ereza.customactivityoncrash.EXTRA_SHOW_ERROR_DETAILS";
    private static final String EXTRA_STACK_TRACE = "cat.ereza.customactivityoncrash.EXTRA_STACK_TRACE";
    private static final String EXTRA_IMAGE_DRAWABLE_ID = "cat.ereza.customactivityoncrash.EXTRA_IMAGE_DRAWABLE_ID";
    private static final String TAG = "CustomActivityOnCrash";
    private static final String INTENT_ACTION_ERROR_ACTIVITY = "cat.ereza.customactivityoncrash.ERROR";
    private static final String INTENT_ACTION_RESTART_ACTIVITY = "cat.ereza.customactivityoncrash.RESTART";
    private static final String CAOC_HANDLER_PACKAGE_NAME = "cat.ereza.customactivityoncrash";
    private static final String DEFAULT_HANDLER_PACKAGE_NAME = "com.android.internal.os";
    private static final int MAX_STACK_TRACE_SIZE = 131071;
    private static Application application;
    private static WeakReference<Activity> lastActivityCreated = new WeakReference<>(null);
    private static boolean isInBackground = false;
    private static boolean launchErrorActivityWhenInBackground = true;
    private static boolean showErrorDetails = true;
    private static boolean enableAppRestart = true;
    private static int defaultErrorActivityDrawableId = R.drawable.customactivityoncrash_error_image;
    private static Class<? extends Activity> errorActivityClass = null;
    private static Class<? extends Activity> restartActivityClass = null;

    public static void install(Context context) {
        try {
            if (context == null) {
                Log.e(TAG, "Install failed: context is null!");
            } else {
                if (Build.VERSION.SDK_INT < 14) {
                    Log.w(TAG, "CustomActivityOnCrash will be installed, but may not be reliable in API lower than 14");
                }
                Thread.UncaughtExceptionHandler oldHandler = Thread.getDefaultUncaughtExceptionHandler();
                if (oldHandler != null && oldHandler.getClass().getName().startsWith("cat.ereza.customactivityoncrash")) {
                    Log.e(TAG, "You have already installed CustomActivityOnCrash, doing nothing!");
                } else {
                    if (oldHandler != null && !oldHandler.getClass().getName().startsWith(DEFAULT_HANDLER_PACKAGE_NAME)) {
                        Log.e(TAG, "IMPORTANT WARNING! You already have an UncaughtExceptionHandler, are you sure this is correct? If you use ACRA, Crashlytics or similar libraries, you must initialize them AFTER CustomActivityOnCrash! Installing anyway, but your original handler will not be called.");
                    }
                    application = (Application) context.getApplicationContext();
                    Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: cat.ereza.customactivityoncrash.CustomActivityOnCrash.1
                        @Override // java.lang.Thread.UncaughtExceptionHandler
                        public void uncaughtException(Thread thread, Throwable throwable) {
                            Log.e(CustomActivityOnCrash.TAG, "App has crashed, executing CustomActivityOnCrash's UncaughtExceptionHandler", throwable);
                            if (CustomActivityOnCrash.errorActivityClass == null) {
                                Class unused = CustomActivityOnCrash.errorActivityClass = CustomActivityOnCrash.guessErrorActivityClass(CustomActivityOnCrash.application);
                            }
                            if (!CustomActivityOnCrash.isStackTraceLikelyConflictive(throwable, CustomActivityOnCrash.errorActivityClass)) {
                                if (CustomActivityOnCrash.launchErrorActivityWhenInBackground || !CustomActivityOnCrash.isInBackground) {
                                    Intent intent = new Intent(CustomActivityOnCrash.application, (Class<?>) CustomActivityOnCrash.errorActivityClass);
                                    StringWriter sw = new StringWriter();
                                    PrintWriter pw = new PrintWriter(sw);
                                    throwable.printStackTrace(pw);
                                    String stackTraceString = sw.toString();
                                    if (stackTraceString.length() > CustomActivityOnCrash.MAX_STACK_TRACE_SIZE) {
                                        stackTraceString = stackTraceString.substring(0, CustomActivityOnCrash.MAX_STACK_TRACE_SIZE - " [stack trace too large]".length()) + " [stack trace too large]";
                                    }
                                    if (!CustomActivityOnCrash.enableAppRestart || CustomActivityOnCrash.restartActivityClass != null) {
                                        if (!CustomActivityOnCrash.enableAppRestart) {
                                            Class unused2 = CustomActivityOnCrash.restartActivityClass = null;
                                        }
                                    } else {
                                        Class unused3 = CustomActivityOnCrash.restartActivityClass = CustomActivityOnCrash.guessRestartActivityClass(CustomActivityOnCrash.application);
                                    }
                                    intent.putExtra(CustomActivityOnCrash.EXTRA_STACK_TRACE, stackTraceString);
                                    intent.putExtra(CustomActivityOnCrash.EXTRA_RESTART_ACTIVITY_CLASS, CustomActivityOnCrash.restartActivityClass);
                                    intent.putExtra(CustomActivityOnCrash.EXTRA_SHOW_ERROR_DETAILS, CustomActivityOnCrash.showErrorDetails);
                                    intent.putExtra(CustomActivityOnCrash.EXTRA_IMAGE_DRAWABLE_ID, CustomActivityOnCrash.defaultErrorActivityDrawableId);
                                    intent.setFlags(268468224);
                                    CustomActivityOnCrash.application.startActivity(intent);
                                }
                            } else {
                                Log.e(CustomActivityOnCrash.TAG, "Your application class or your error activity have crashed, the custom activity will not be launched!");
                            }
                            Activity lastActivity = (Activity) CustomActivityOnCrash.lastActivityCreated.get();
                            if (lastActivity != null) {
                                lastActivity.finish();
                                CustomActivityOnCrash.lastActivityCreated.clear();
                            }
                            CustomActivityOnCrash.killCurrentProcess();
                        }
                    });
                    if (Build.VERSION.SDK_INT >= 14) {
                        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() { // from class: cat.ereza.customactivityoncrash.CustomActivityOnCrash.2
                            int currentlyStartedActivities = 0;

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                                if (activity.getClass() != CustomActivityOnCrash.errorActivityClass) {
                                    WeakReference unused = CustomActivityOnCrash.lastActivityCreated = new WeakReference(activity);
                                }
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityStarted(Activity activity) {
                                this.currentlyStartedActivities++;
                                boolean unused = CustomActivityOnCrash.isInBackground = this.currentlyStartedActivities == 0;
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityResumed(Activity activity) {
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityPaused(Activity activity) {
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityStopped(Activity activity) {
                                this.currentlyStartedActivities--;
                                boolean unused = CustomActivityOnCrash.isInBackground = this.currentlyStartedActivities == 0;
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                            }

                            @Override // android.app.Application.ActivityLifecycleCallbacks
                            public void onActivityDestroyed(Activity activity) {
                            }
                        });
                    }
                    Log.i(TAG, "CustomActivityOnCrash has been installed.");
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "An unknown error occurred while installing CustomActivityOnCrash, it may not have been properly initialized. Please report this as a bug if needed.", t);
        }
    }

    public static boolean isShowErrorDetailsFromIntent(Intent intent) {
        return intent.getBooleanExtra(EXTRA_SHOW_ERROR_DETAILS, true);
    }

    public static int getDefaultErrorActivityDrawableIdFromIntent(Intent intent) {
        return intent.getIntExtra(EXTRA_IMAGE_DRAWABLE_ID, R.drawable.customactivityoncrash_error_image);
    }

    public static String getStackTraceFromIntent(Intent intent) {
        return intent.getStringExtra(EXTRA_STACK_TRACE);
    }

    public static String getAllErrorDetailsFromIntent(Context context, Intent intent) {
        Date currentDate = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
        String buildDateAsString = getBuildDateAsString(context, dateFormat);
        String versionName = getVersionName(context);
        String errorDetails = BuildConfig.FLAVOR + "Build version: " + versionName + " \n";
        return ((((errorDetails + "Build date: " + buildDateAsString + " \n") + "Current date: " + dateFormat.format(currentDate) + " \n") + "Device: " + getDeviceModelName() + " \n\n") + "Stack trace:  \n") + getStackTraceFromIntent(intent);
    }

    public static Class<? extends Activity> getRestartActivityClassFromIntent(Intent intent) {
        Serializable serializedClass = intent.getSerializableExtra(EXTRA_RESTART_ACTIVITY_CLASS);
        if (serializedClass != null && (serializedClass instanceof Class)) {
            return (Class) serializedClass;
        }
        return null;
    }

    public static void restartApplicationWithIntent(Activity activity, Intent intent) {
        intent.addFlags(268468224);
        activity.finish();
        activity.startActivity(intent);
        killCurrentProcess();
    }

    public static void closeApplication(Activity activity) {
        activity.finish();
        killCurrentProcess();
    }

    public static boolean isLaunchErrorActivityWhenInBackground() {
        return launchErrorActivityWhenInBackground;
    }

    public static void setLaunchErrorActivityWhenInBackground(boolean launchErrorActivityWhenInBackground2) {
        launchErrorActivityWhenInBackground = launchErrorActivityWhenInBackground2;
    }

    public static boolean isShowErrorDetails() {
        return showErrorDetails;
    }

    public static void setShowErrorDetails(boolean showErrorDetails2) {
        showErrorDetails = showErrorDetails2;
    }

    public static int getDefaultErrorActivityDrawable() {
        return defaultErrorActivityDrawableId;
    }

    public static void setDefaultErrorActivityDrawable(int defaultErrorActivityDrawableId2) {
        defaultErrorActivityDrawableId = defaultErrorActivityDrawableId2;
    }

    public static boolean isEnableAppRestart() {
        return enableAppRestart;
    }

    public static void setEnableAppRestart(boolean enableAppRestart2) {
        enableAppRestart = enableAppRestart2;
    }

    public static Class<? extends Activity> getErrorActivityClass() {
        return errorActivityClass;
    }

    public static void setErrorActivityClass(Class<? extends Activity> errorActivityClass2) {
        errorActivityClass = errorActivityClass2;
    }

    public static Class<? extends Activity> getRestartActivityClass() {
        return restartActivityClass;
    }

    public static void setRestartActivityClass(Class<? extends Activity> restartActivityClass2) {
        restartActivityClass = restartActivityClass2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isStackTraceLikelyConflictive(Throwable throwable, Class<? extends Activity> activityClass) {
        Throwable cause;
        do {
            StackTraceElement[] stackTrace = throwable.getStackTrace();
            for (StackTraceElement element : stackTrace) {
                if ((element.getClassName().equals("android.app.ActivityThread") && element.getMethodName().equals("handleBindApplication")) || element.getClassName().equals(activityClass.getName())) {
                    return true;
                }
            }
            cause = throwable.getCause();
            throwable = cause;
        } while (cause != null);
        return false;
    }

    private static String getBuildDateAsString(Context context, DateFormat dateFormat) {
        String buildDate;
        try {
            ApplicationInfo ai = context.getPackageManager().getApplicationInfo(context.getPackageName(), 0);
            ZipFile zf = new ZipFile(ai.sourceDir);
            ZipEntry ze = zf.getEntry("classes.dex");
            long time = ze.getTime();
            buildDate = dateFormat.format(new Date(time));
            zf.close();
        } catch (Exception e) {
            buildDate = "Unknown";
        }
        return buildDate;
    }

    private static String getVersionName(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return packageInfo.versionName;
        } catch (Exception e) {
            return "Unknown";
        }
    }

    private static String getDeviceModelName() {
        String manufacturer = Build.MANUFACTURER;
        String model = Build.MODEL;
        if (model.startsWith(manufacturer)) {
            return capitalize(model);
        }
        return capitalize(manufacturer) + " " + model;
    }

    private static String capitalize(String s) {
        if (s == null || s.length() == 0) {
            return BuildConfig.FLAVOR;
        }
        char first = s.charAt(0);
        if (Character.isUpperCase(first)) {
            return s;
        }
        return Character.toUpperCase(first) + s.substring(1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Class<? extends Activity> guessRestartActivityClass(Context context) {
        Class<? extends Activity> resolvedActivityClass = getRestartActivityClassWithIntentFilter(context);
        if (resolvedActivityClass == null) {
            resolvedActivityClass = getLauncherActivity(context);
        }
        return resolvedActivityClass;
    }

    private static Class<? extends Activity> getRestartActivityClassWithIntentFilter(Context context) {
        List<ResolveInfo> resolveInfos = context.getPackageManager().queryIntentActivities(new Intent().setAction(INTENT_ACTION_RESTART_ACTIVITY), 64);
        if (resolveInfos != null && resolveInfos.size() > 0) {
            ResolveInfo resolveInfo = resolveInfos.get(0);
            try {
                return Class.forName(resolveInfo.activityInfo.name);
            } catch (ClassNotFoundException e) {
                Log.e(TAG, "Failed when resolving the restart activity class via intent filter, stack trace follows!", e);
                return null;
            }
        }
        return null;
    }

    private static Class<? extends Activity> getLauncherActivity(Context context) {
        Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (intent != null) {
            try {
                return Class.forName(intent.getComponent().getClassName());
            } catch (ClassNotFoundException e) {
                Log.e(TAG, "Failed when resolving the restart activity class via getLaunchIntentForPackage, stack trace follows!", e);
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Class<? extends Activity> guessErrorActivityClass(Context context) {
        Class<? extends Activity> resolvedActivityClass = getErrorActivityClassWithIntentFilter(context);
        if (resolvedActivityClass == null) {
            resolvedActivityClass = DefaultErrorActivity.class;
        }
        return resolvedActivityClass;
    }

    private static Class<? extends Activity> getErrorActivityClassWithIntentFilter(Context context) {
        List<ResolveInfo> resolveInfos = context.getPackageManager().queryIntentActivities(new Intent().setAction(INTENT_ACTION_ERROR_ACTIVITY), 64);
        if (resolveInfos != null && resolveInfos.size() > 0) {
            ResolveInfo resolveInfo = resolveInfos.get(0);
            try {
                return Class.forName(resolveInfo.activityInfo.name);
            } catch (ClassNotFoundException e) {
                Log.e(TAG, "Failed when resolving the error activity class via intent filter, stack trace follows!", e);
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void killCurrentProcess() {
        Process.killProcess(Process.myPid());
        System.exit(10);
    }
}
