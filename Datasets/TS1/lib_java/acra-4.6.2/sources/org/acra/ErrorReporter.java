package org.acra;

import android.app.Activity;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Looper;
import android.os.Process;
import android.text.format.Time;
import java.io.File;
import java.lang.Thread;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.acra.annotation.ReportsCrashes;
import org.acra.collector.Compatibility;
import org.acra.collector.ConfigurationCollector;
import org.acra.collector.CrashReportData;
import org.acra.collector.CrashReportDataFactory;
import org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat;
import org.acra.jraf.android.util.activitylifecyclecallbackscompat.ApplicationHelper;
import org.acra.sender.EmailIntentSender;
import org.acra.sender.HttpSender;
import org.acra.sender.ReportSender;
import org.acra.util.PackageManagerWrapper;
import org.acra.util.ToastSender;

/* loaded from: acra-4.6.2.jar:org/acra/ErrorReporter.class */
public class ErrorReporter implements Thread.UncaughtExceptionHandler {
    private boolean enabled;
    private final Application mContext;
    private final SharedPreferences prefs;
    private final CrashReportDataFactory crashReportDataFactory;
    private final Thread.UncaughtExceptionHandler mDfltExceptionHandler;
    private static final ExceptionHandlerInitializer NULL_EXCEPTION_HANDLER_INITIALIZER = new ExceptionHandlerInitializer() { // from class: org.acra.ErrorReporter.1
        @Override // org.acra.ExceptionHandlerInitializer
        public void initializeExceptionHandler(ErrorReporter reporter) {
        }
    };
    private static int mNotificationCounter = 0;
    private final List<ReportSender> mReportSenders = new ArrayList();
    private final CrashReportFileNameParser fileNameParser = new CrashReportFileNameParser();
    private WeakReference<Activity> lastActivityCreated = new WeakReference<>(null);
    private boolean toastWaitEnded = true;
    private volatile ExceptionHandlerInitializer exceptionHandlerInitializer = NULL_EXCEPTION_HANDLER_INITIALIZER;

    ErrorReporter(Application context, SharedPreferences prefs, boolean enabled) {
        String initialConfiguration;
        this.enabled = false;
        this.mContext = context;
        this.prefs = prefs;
        this.enabled = enabled;
        if (ACRA.getConfig().getReportFields().contains(ReportField.INITIAL_CONFIGURATION)) {
            initialConfiguration = ConfigurationCollector.collectConfiguration(this.mContext);
        } else {
            initialConfiguration = null;
        }
        Time appStartDate = new Time();
        appStartDate.setToNow();
        if (Compatibility.getAPILevel() >= 14) {
            ApplicationHelper.registerActivityLifecycleCallbacks(context, new ActivityLifecycleCallbacksCompat() { // from class: org.acra.ErrorReporter.2
                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                    if (!(activity instanceof BaseCrashReportDialog)) {
                        ErrorReporter.this.lastActivityCreated = new WeakReference(activity);
                    }
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityStarted(Activity activity) {
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityResumed(Activity activity) {
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityPaused(Activity activity) {
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityStopped(Activity activity) {
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override // org.acra.jraf.android.util.activitylifecyclecallbackscompat.ActivityLifecycleCallbacksCompat
                public void onActivityDestroyed(Activity activity) {
                }
            });
        }
        this.crashReportDataFactory = new CrashReportDataFactory(this.mContext, prefs, appStartDate, initialConfiguration);
        this.mDfltExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(this);
    }

    @Deprecated
    public static ErrorReporter getInstance() {
        return ACRA.getErrorReporter();
    }

    @Deprecated
    public void addCustomData(String key, String value) {
        this.crashReportDataFactory.putCustomData(key, value);
    }

    public String putCustomData(String key, String value) {
        return this.crashReportDataFactory.putCustomData(key, value);
    }

    public void setExceptionHandlerInitializer(ExceptionHandlerInitializer initializer) {
        this.exceptionHandlerInitializer = initializer != null ? initializer : NULL_EXCEPTION_HANDLER_INITIALIZER;
    }

    public String removeCustomData(String key) {
        return this.crashReportDataFactory.removeCustomData(key);
    }

    public void clearCustomData() {
        this.crashReportDataFactory.clearCustomData();
    }

    public String getCustomData(String key) {
        return this.crashReportDataFactory.getCustomData(key);
    }

    public void addReportSender(ReportSender sender) {
        this.mReportSenders.add(sender);
    }

    public void removeReportSender(ReportSender sender) {
        this.mReportSenders.remove(sender);
    }

    public void removeReportSenders(Class<?> senderClass) {
        if (ReportSender.class.isAssignableFrom(senderClass)) {
            for (ReportSender sender : this.mReportSenders) {
                if (senderClass.isInstance(sender)) {
                    this.mReportSenders.remove(sender);
                }
            }
        }
    }

    public void removeAllReportSenders() {
        this.mReportSenders.clear();
    }

    public void setReportSender(ReportSender sender) {
        removeAllReportSenders();
        addReportSender(sender);
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread t, Throwable e) {
        try {
            if (!this.enabled) {
                if (this.mDfltExceptionHandler != null) {
                    ACRA.log.e(ACRA.LOG_TAG, "ACRA is disabled for " + this.mContext.getPackageName() + " - forwarding uncaught Exception on to default ExceptionHandler");
                    this.mDfltExceptionHandler.uncaughtException(t, e);
                    return;
                } else {
                    ACRA.log.e(ACRA.LOG_TAG, "ACRA is disabled for " + this.mContext.getPackageName() + " - no default ExceptionHandler");
                    ACRA.log.e(ACRA.LOG_TAG, "ACRA caught a " + e.getClass().getSimpleName() + " for " + this.mContext.getPackageName(), e);
                    return;
                }
            }
            ACRA.log.e(ACRA.LOG_TAG, "ACRA caught a " + e.getClass().getSimpleName() + " for " + this.mContext.getPackageName(), e);
            ACRA.log.d(ACRA.LOG_TAG, "Building report");
            reportBuilder().uncaughtExceptionThread(t).exception(e).endsApplication().send();
        } catch (Throwable th) {
            if (this.mDfltExceptionHandler != null) {
                this.mDfltExceptionHandler.uncaughtException(t, e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void endApplication(Thread uncaughtExceptionThread, Throwable th) {
        boolean letDefaultHandlerEndApplication = ACRA.getConfig().mode() == ReportingInteractionMode.SILENT || (ACRA.getConfig().mode() == ReportingInteractionMode.TOAST && ACRA.getConfig().forceCloseDialogAfterToast());
        boolean handlingUncaughtException = uncaughtExceptionThread != null;
        if (handlingUncaughtException && letDefaultHandlerEndApplication && this.mDfltExceptionHandler != null) {
            ACRA.log.d(ACRA.LOG_TAG, "Handing Exception on to default ExceptionHandler");
            this.mDfltExceptionHandler.uncaughtException(uncaughtExceptionThread, th);
            return;
        }
        ACRA.log.e(ACRA.LOG_TAG, this.mContext.getPackageName() + " fatal error : " + th.getMessage(), th);
        Activity lastActivity = this.lastActivityCreated.get();
        if (lastActivity != null) {
            ACRA.log.i(ACRA.LOG_TAG, "Finishing the last Activity prior to killing the Process");
            lastActivity.finish();
            ACRA.log.i(ACRA.LOG_TAG, "Finished " + lastActivity.getClass());
            this.lastActivityCreated.clear();
        }
        Process.killProcess(Process.myPid());
        System.exit(10);
    }

    public void handleSilentException(Throwable e) {
        if (this.enabled) {
            reportBuilder().exception(e).forceSilent().send();
            ACRA.log.d(ACRA.LOG_TAG, "ACRA sent Silent report.");
        } else {
            ACRA.log.d(ACRA.LOG_TAG, "ACRA is disabled. Silent report not sent.");
        }
    }

    public void setEnabled(boolean enabled) {
        ACRA.log.i(ACRA.LOG_TAG, "ACRA is " + (enabled ? "enabled" : "disabled") + " for " + this.mContext.getPackageName());
        this.enabled = enabled;
    }

    SendWorker startSendingReports(boolean onlySendSilentReports, boolean approveReportsFirst) {
        SendWorker worker = new SendWorker(this.mContext, this.mReportSenders, onlySendSilentReports, approveReportsFirst);
        worker.start();
        return worker;
    }

    void deletePendingReports() {
        deletePendingReports(true, true, 0);
    }

    public void checkReportsOnApplicationStart() {
        if (ACRA.getConfig().deleteOldUnsentReportsOnApplicationStart()) {
            long lastVersionNr = this.prefs.getInt(ACRA.PREF_LAST_VERSION_NR, 0);
            PackageManagerWrapper packageManagerWrapper = new PackageManagerWrapper(this.mContext);
            PackageInfo packageInfo = packageManagerWrapper.getPackageInfo();
            if (packageInfo != null) {
                boolean newVersion = ((long) packageInfo.versionCode) > lastVersionNr;
                if (newVersion) {
                    deletePendingReports();
                }
                SharedPreferences.Editor prefsEditor = this.prefs.edit();
                prefsEditor.putInt(ACRA.PREF_LAST_VERSION_NR, packageInfo.versionCode);
                prefsEditor.commit();
            }
        }
        ReportingInteractionMode reportingInteractionMode = ACRA.getConfig().mode();
        if ((reportingInteractionMode == ReportingInteractionMode.NOTIFICATION || reportingInteractionMode == ReportingInteractionMode.DIALOG) && ACRA.getConfig().deleteUnapprovedReportsOnApplicationStart()) {
            deletePendingNonApprovedReports(true);
        }
        CrashReportFinder reportFinder = new CrashReportFinder(this.mContext);
        String[] filesList = reportFinder.getCrashReportFiles();
        if (filesList != null && filesList.length > 0) {
            boolean onlySilentOrApprovedReports = containsOnlySilentOrApprovedReports(filesList);
            if (reportingInteractionMode != ReportingInteractionMode.SILENT && reportingInteractionMode != ReportingInteractionMode.TOAST) {
                if (!onlySilentOrApprovedReports) {
                    return;
                }
                if (reportingInteractionMode != ReportingInteractionMode.NOTIFICATION && reportingInteractionMode != ReportingInteractionMode.DIALOG) {
                    return;
                }
            }
            if (reportingInteractionMode == ReportingInteractionMode.TOAST && !onlySilentOrApprovedReports) {
                ToastSender.sendToast(this.mContext, ACRA.getConfig().resToastText(), 1);
            }
            ACRA.log.v(ACRA.LOG_TAG, "About to start ReportSenderWorker from #checkReportOnApplicationStart");
            startSendingReports(false, false);
        }
    }

    void deletePendingNonApprovedReports(boolean keepOne) {
        int nbReportsToKeep = keepOne ? 1 : 0;
        deletePendingReports(false, true, nbReportsToKeep);
    }

    public void handleException(Throwable e, boolean endApplication) {
        ReportBuilder builder = reportBuilder().exception(e);
        if (endApplication) {
            builder.endsApplication();
        }
        builder.send();
    }

    public void handleException(Throwable e) {
        reportBuilder().exception(e).send();
    }

    public ReportBuilder reportBuilder() {
        return new ReportBuilder();
    }

    /* loaded from: acra-4.6.2.jar:org/acra/ErrorReporter$TimeHelper.class */
    private static class TimeHelper {
        private Long initialTimeMillis;

        private TimeHelper() {
        }

        public void setInitialTimeMillis(long initialTimeMillis) {
            this.initialTimeMillis = Long.valueOf(initialTimeMillis);
        }

        public long getElapsedTime() {
            if (this.initialTimeMillis == null) {
                return 0L;
            }
            return System.currentTimeMillis() - this.initialTimeMillis.longValue();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v39, types: [org.acra.ErrorReporter$5] */
    /* JADX WARN: Type inference failed for: r0v45, types: [org.acra.ErrorReporter$4] */
    /* JADX WARN: Type inference failed for: r0v57, types: [org.acra.ErrorReporter$3] */
    public void report(final ReportBuilder reportBuilder) {
        ReportingInteractionMode reportingInteractionMode;
        if (!this.enabled) {
            return;
        }
        try {
            this.exceptionHandlerInitializer.initializeExceptionHandler(this);
        } catch (Exception e) {
            ACRA.log.d(ACRA.LOG_TAG, "Failed to initlize " + this.exceptionHandlerInitializer + " from #handleException");
        }
        boolean sendOnlySilentReports = false;
        if (!reportBuilder.mForceSilent) {
            reportingInteractionMode = ACRA.getConfig().mode();
        } else {
            reportingInteractionMode = ReportingInteractionMode.SILENT;
            if (ACRA.getConfig().mode() != ReportingInteractionMode.SILENT) {
                sendOnlySilentReports = true;
            }
        }
        boolean shouldDisplayToast = reportingInteractionMode == ReportingInteractionMode.TOAST || (ACRA.getConfig().resToastText() != 0 && (reportingInteractionMode == ReportingInteractionMode.NOTIFICATION || reportingInteractionMode == ReportingInteractionMode.DIALOG));
        final TimeHelper sentToastTimeMillis = new TimeHelper();
        if (shouldDisplayToast) {
            new Thread() { // from class: org.acra.ErrorReporter.3
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    Looper.prepare();
                    ToastSender.sendToast(ErrorReporter.this.mContext, ACRA.getConfig().resToastText(), 1);
                    sentToastTimeMillis.setInitialTimeMillis(System.currentTimeMillis());
                    Looper.loop();
                }
            }.start();
        }
        CrashReportData crashReportData = this.crashReportDataFactory.createCrashData(reportBuilder.mMessage, reportBuilder.mException, reportBuilder.mCustomData, reportBuilder.mForceSilent, reportBuilder.mUncaughtExceptionThread);
        final String reportFileName = getReportFileName(crashReportData);
        saveCrashReportFile(reportFileName, crashReportData);
        if (reportBuilder.mEndsApplication && !ACRA.getConfig().sendReportsAtShutdown()) {
            endApplication(reportBuilder.mUncaughtExceptionThread, reportBuilder.mException);
        }
        SendWorker sender = null;
        if (reportingInteractionMode == ReportingInteractionMode.SILENT || reportingInteractionMode == ReportingInteractionMode.TOAST || this.prefs.getBoolean(ACRA.PREF_ALWAYS_ACCEPT, false)) {
            ACRA.log.d(ACRA.LOG_TAG, "About to start ReportSenderWorker from #handleException");
            sender = startSendingReports(sendOnlySilentReports, true);
            if (reportingInteractionMode == ReportingInteractionMode.SILENT && !reportBuilder.mEndsApplication) {
                return;
            }
        } else if (reportingInteractionMode == ReportingInteractionMode.NOTIFICATION) {
            ACRA.log.d(ACRA.LOG_TAG, "Creating Notification.");
            createNotification(reportFileName, reportBuilder);
        }
        this.toastWaitEnded = true;
        if (shouldDisplayToast) {
            this.toastWaitEnded = false;
            new Thread() { // from class: org.acra.ErrorReporter.4
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    ACRA.log.d(ACRA.LOG_TAG, "Waiting for 2000 millis from " + sentToastTimeMillis.initialTimeMillis + " currentMillis=" + System.currentTimeMillis());
                    while (sentToastTimeMillis.getElapsedTime() < 2000) {
                        try {
                            Thread.sleep(100L);
                        } catch (InterruptedException e1) {
                            ACRA.log.d(ACRA.LOG_TAG, "Interrupted while waiting for Toast to end.", e1);
                        }
                    }
                    ErrorReporter.this.toastWaitEnded = true;
                }
            }.start();
        }
        final SendWorker worker = sender;
        final boolean showDirectDialog = reportingInteractionMode == ReportingInteractionMode.DIALOG && !this.prefs.getBoolean(ACRA.PREF_ALWAYS_ACCEPT, false);
        new Thread() { // from class: org.acra.ErrorReporter.5
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                ACRA.log.d(ACRA.LOG_TAG, "Waiting for Toast");
                while (!ErrorReporter.this.toastWaitEnded) {
                    try {
                        Thread.sleep(100L);
                    } catch (InterruptedException e1) {
                        ACRA.log.d(ACRA.LOG_TAG, "Error : ", e1);
                    }
                }
                ACRA.log.d(ACRA.LOG_TAG, "Finished waiting for Toast");
                if (worker != null) {
                    ACRA.log.d(ACRA.LOG_TAG, "Waiting for Worker");
                    while (worker.isAlive()) {
                        try {
                            Thread.sleep(100L);
                        } catch (InterruptedException e12) {
                            ACRA.log.d(ACRA.LOG_TAG, "Error : ", e12);
                        }
                    }
                    ACRA.log.d(ACRA.LOG_TAG, "Finished waiting for Worker");
                }
                if (showDirectDialog) {
                    ACRA.log.d(ACRA.LOG_TAG, "Creating CrashReportDialog for " + reportFileName);
                    Intent dialogIntent = ErrorReporter.this.createCrashReportDialogIntent(reportFileName, reportBuilder);
                    dialogIntent.setFlags(268435456);
                    ErrorReporter.this.mContext.startActivity(dialogIntent);
                }
                ACRA.log.d(ACRA.LOG_TAG, "Wait for Toast + worker ended. Kill Application ? " + reportBuilder.mEndsApplication);
                if (reportBuilder.mEndsApplication) {
                    ErrorReporter.this.endApplication(reportBuilder.mUncaughtExceptionThread, reportBuilder.mException);
                }
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Intent createCrashReportDialogIntent(String reportFileName, ReportBuilder reportBuilder) {
        ACRA.log.d(ACRA.LOG_TAG, "Creating DialogIntent for " + reportFileName + " exception=" + reportBuilder.mException);
        Intent dialogIntent = new Intent(this.mContext, ACRA.getConfig().reportDialogClass());
        dialogIntent.putExtra(ACRAConstants.EXTRA_REPORT_FILE_NAME, reportFileName);
        dialogIntent.putExtra(ACRAConstants.EXTRA_REPORT_EXCEPTION, reportBuilder.mException);
        return dialogIntent;
    }

    private void createNotification(String reportFileName, ReportBuilder reportBuilder) {
        NotificationManager notificationManager = (NotificationManager) this.mContext.getSystemService("notification");
        ReportsCrashes conf = ACRA.getConfig();
        int icon = conf.resNotifIcon();
        CharSequence tickerText = this.mContext.getText(conf.resNotifTickerText());
        long when = System.currentTimeMillis();
        Notification notification = new Notification(icon, tickerText, when);
        CharSequence contentTitle = this.mContext.getText(conf.resNotifTitle());
        CharSequence contentText = this.mContext.getText(conf.resNotifText());
        ACRA.log.d(ACRA.LOG_TAG, "Creating Notification for " + reportFileName);
        Intent crashReportDialogIntent = createCrashReportDialogIntent(reportFileName, reportBuilder);
        Application application = this.mContext;
        int i = mNotificationCounter;
        mNotificationCounter = i + 1;
        PendingIntent contentIntent = PendingIntent.getActivity(application, i, crashReportDialogIntent, 134217728);
        notification.setLatestEventInfo(this.mContext, contentTitle, contentText, contentIntent);
        notification.flags |= 16;
        Intent deleteIntent = createCrashReportDialogIntent(reportFileName, reportBuilder);
        deleteIntent.putExtra("FORCE_CANCEL", true);
        notification.deleteIntent = PendingIntent.getActivity(this.mContext, -1, deleteIntent, 0);
        notificationManager.notify(666, notification);
    }

    private String getReportFileName(CrashReportData crashData) {
        Time now = new Time();
        now.setToNow();
        long timestamp = now.toMillis(false);
        String isSilent = crashData.getProperty(ReportField.IS_SILENT);
        return "" + timestamp + (isSilent != null ? ACRAConstants.SILENT_SUFFIX : "") + ACRAConstants.REPORTFILE_EXTENSION;
    }

    private void saveCrashReportFile(String fileName, CrashReportData crashData) {
        try {
            ACRA.log.d(ACRA.LOG_TAG, "Writing crash report file " + fileName + ".");
            CrashReportPersister persister = new CrashReportPersister(this.mContext);
            persister.store(crashData, fileName);
        } catch (Exception e) {
            ACRA.log.e(ACRA.LOG_TAG, "An error occurred while writing the report file...", e);
        }
    }

    private void deletePendingReports(boolean deleteApprovedReports, boolean deleteNonApprovedReports, int nbOfLatestToKeep) {
        CrashReportFinder reportFinder = new CrashReportFinder(this.mContext);
        String[] filesList = reportFinder.getCrashReportFiles();
        Arrays.sort(filesList);
        for (int iFile = 0; iFile < filesList.length - nbOfLatestToKeep; iFile++) {
            String fileName = filesList[iFile];
            boolean isReportApproved = this.fileNameParser.isApproved(fileName);
            if ((isReportApproved && deleteApprovedReports) || (!isReportApproved && deleteNonApprovedReports)) {
                File fileToDelete = new File(this.mContext.getFilesDir(), fileName);
                ACRA.log.d(ACRA.LOG_TAG, "Deleting file " + fileName);
                if (!fileToDelete.delete()) {
                    ACRA.log.e(ACRA.LOG_TAG, "Could not delete report : " + fileToDelete);
                }
            }
        }
    }

    private boolean containsOnlySilentOrApprovedReports(String[] reportFileNames) {
        for (String reportFileName : reportFileNames) {
            if (!this.fileNameParser.isApproved(reportFileName)) {
                return false;
            }
        }
        return true;
    }

    public void setDefaultReportSenders() {
        ReportsCrashes conf = ACRA.getConfig();
        Application mApplication = ACRA.getApplication();
        removeAllReportSenders();
        if (!"".equals(conf.mailTo())) {
            ACRA.log.w(ACRA.LOG_TAG, mApplication.getPackageName() + " reports will be sent by email (if accepted by user).");
            setReportSender(new EmailIntentSender(mApplication));
            return;
        }
        PackageManagerWrapper pm = new PackageManagerWrapper(mApplication);
        if (!pm.hasPermission("android.permission.INTERNET")) {
            ACRA.log.e(ACRA.LOG_TAG, mApplication.getPackageName() + " should be granted permission android.permission.INTERNET if you want your crash reports to be sent. If you don't want to add this permission to your application you can also enable sending reports by email. If this is your will then provide your email address in @ReportsCrashes(mailTo=\"your.account@domain.com\"");
        } else if (conf.formUri() != null && !"".equals(conf.formUri())) {
            setReportSender(new HttpSender(ACRA.getConfig().httpMethod(), ACRA.getConfig().reportType(), null));
        }
    }

    /* loaded from: acra-4.6.2.jar:org/acra/ErrorReporter$ReportBuilder.class */
    public final class ReportBuilder {
        private String mMessage;
        private Thread mUncaughtExceptionThread;
        private Throwable mException;
        private Map<String, String> mCustomData;
        private boolean mForceSilent = false;
        private boolean mEndsApplication = false;

        public ReportBuilder() {
        }

        public ReportBuilder message(String msg) {
            this.mMessage = msg;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public ReportBuilder uncaughtExceptionThread(Thread thread) {
            this.mUncaughtExceptionThread = thread;
            return this;
        }

        public ReportBuilder exception(Throwable e) {
            this.mException = e;
            return this;
        }

        private void initCustomData() {
            if (this.mCustomData == null) {
                this.mCustomData = new HashMap();
            }
        }

        public ReportBuilder customData(Map<String, String> customData) {
            initCustomData();
            this.mCustomData.putAll(customData);
            return this;
        }

        public ReportBuilder customData(String key, String value) {
            initCustomData();
            this.mCustomData.put(key, value);
            return this;
        }

        public ReportBuilder forceSilent() {
            this.mForceSilent = true;
            return this;
        }

        public ReportBuilder endsApplication() {
            this.mEndsApplication = true;
            return this;
        }

        public void send() {
            if (this.mMessage == null && this.mException == null) {
                this.mMessage = "Report requested by developer";
            }
            ErrorReporter.this.report(this);
        }
    }
}
