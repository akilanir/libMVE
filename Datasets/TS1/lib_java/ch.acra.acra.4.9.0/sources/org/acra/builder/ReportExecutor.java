package org.acra.builder;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Looper;
import android.os.Process;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.NotificationCompat;
import java.io.File;
import java.lang.Thread;
import java.util.Date;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.ReportingInteractionMode;
import org.acra.collector.CrashReportData;
import org.acra.collector.CrashReportDataFactory;
import org.acra.config.ACRAConfiguration;
import org.acra.file.CrashReportPersister;
import org.acra.file.ReportLocator;
import org.acra.prefs.SharedPreferencesFactory;
import org.acra.sender.SenderServiceStarter;
import org.acra.util.ToastSender;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/builder/ReportExecutor.class */
public final class ReportExecutor {
    private static final int THREAD_SLEEP_INTERVAL_MILLIS = 100;
    private final Context context;
    private final ACRAConfiguration config;
    private final CrashReportDataFactory crashReportDataFactory;
    private final LastActivityManager lastActivityManager;
    private final Thread.UncaughtExceptionHandler defaultExceptionHandler;
    private final ReportPrimer reportPrimer;
    private boolean enabled = false;
    private static int mNotificationCounter = 0;

    public ReportExecutor(@NonNull Context context, @NonNull ACRAConfiguration config, @NonNull CrashReportDataFactory crashReportDataFactory, @NonNull LastActivityManager lastActivityManager, @Nullable Thread.UncaughtExceptionHandler defaultExceptionHandler, @NonNull ReportPrimer reportPrimer) {
        this.context = context;
        this.config = config;
        this.crashReportDataFactory = crashReportDataFactory;
        this.lastActivityManager = lastActivityManager;
        this.defaultExceptionHandler = defaultExceptionHandler;
        this.reportPrimer = reportPrimer;
    }

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/builder/ReportExecutor$TimeHelper.class */
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

    public void handReportToDefaultExceptionHandler(@Nullable Thread t, @NonNull Throwable e) {
        if (this.defaultExceptionHandler != null) {
            ACRA.log.i(ACRA.LOG_TAG, "ACRA is disabled for " + this.context.getPackageName() + " - forwarding uncaught Exception on to default ExceptionHandler");
            this.defaultExceptionHandler.uncaughtException(t, e);
        } else {
            ACRA.log.e(ACRA.LOG_TAG, "ACRA is disabled for " + this.context.getPackageName() + " - no default ExceptionHandler");
            ACRA.log.e(ACRA.LOG_TAG, "ACRA caught a " + e.getClass().getSimpleName() + " for " + this.context.getPackageName(), e);
        }
    }

    public boolean isEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    /* JADX WARN: Type inference failed for: r0v35, types: [org.acra.builder.ReportExecutor$2] */
    /* JADX WARN: Type inference failed for: r0v47, types: [org.acra.builder.ReportExecutor$1] */
    public void execute(@NonNull final ReportBuilder reportBuilder) {
        ReportingInteractionMode reportingInteractionMode;
        if (!this.enabled) {
            ACRA.log.v(ACRA.LOG_TAG, "ACRA is disabled. Report not sent.");
            return;
        }
        this.reportPrimer.primeReport(this.context, reportBuilder);
        boolean sendOnlySilentReports = false;
        if (!reportBuilder.isSendSilently()) {
            reportingInteractionMode = this.config.mode();
        } else {
            reportingInteractionMode = ReportingInteractionMode.SILENT;
            if (this.config.mode() != ReportingInteractionMode.SILENT) {
                sendOnlySilentReports = true;
            }
        }
        boolean shouldDisplayToast = reportingInteractionMode == ReportingInteractionMode.TOAST || (this.config.resToastText() != 0 && (reportingInteractionMode == ReportingInteractionMode.NOTIFICATION || reportingInteractionMode == ReportingInteractionMode.DIALOG));
        final TimeHelper sentToastTimeMillis = new TimeHelper();
        if (shouldDisplayToast) {
            new Thread() { // from class: org.acra.builder.ReportExecutor.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    Looper.prepare();
                    ToastSender.sendToast(ReportExecutor.this.context, ReportExecutor.this.config.resToastText(), 1);
                    sentToastTimeMillis.setInitialTimeMillis(System.currentTimeMillis());
                    Looper.loop();
                }
            }.start();
        }
        CrashReportData crashReportData = this.crashReportDataFactory.createCrashData(reportBuilder);
        final File reportFile = getReportFileName(crashReportData);
        saveCrashReportFile(reportFile, crashReportData);
        SharedPreferences prefs = new SharedPreferencesFactory(this.context, this.config).create();
        if (reportingInteractionMode == ReportingInteractionMode.SILENT || reportingInteractionMode == ReportingInteractionMode.TOAST || prefs.getBoolean(ACRA.PREF_ALWAYS_ACCEPT, false)) {
            startSendingReports(sendOnlySilentReports);
            if (reportingInteractionMode == ReportingInteractionMode.SILENT && !reportBuilder.isEndApplication()) {
                return;
            }
        } else if (reportingInteractionMode == ReportingInteractionMode.NOTIFICATION) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Creating Notification.");
            }
            createNotification(reportFile, reportBuilder);
        }
        final boolean showDirectDialog = reportingInteractionMode == ReportingInteractionMode.DIALOG && !prefs.getBoolean(ACRA.PREF_ALWAYS_ACCEPT, false);
        if (shouldDisplayToast) {
            new Thread() { // from class: org.acra.builder.ReportExecutor.2
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "Waiting for 2000 millis from " + sentToastTimeMillis.initialTimeMillis + " currentMillis=" + System.currentTimeMillis());
                    }
                    long sleep = 2000 - sentToastTimeMillis.getElapsedTime();
                    if (sleep > 0) {
                        try {
                            Thread.sleep(sleep);
                        } catch (InterruptedException e1) {
                            if (ACRA.DEV_LOGGING) {
                                ACRA.log.d(ACRA.LOG_TAG, "Interrupted while waiting for Toast to end.", e1);
                            }
                        }
                    }
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "Finished waiting for Toast");
                    }
                    ReportExecutor.this.dialogAndEnd(reportBuilder, reportFile, showDirectDialog);
                }
            }.start();
        } else {
            dialogAndEnd(reportBuilder, reportFile, showDirectDialog);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dialogAndEnd(@NonNull ReportBuilder reportBuilder, @NonNull File reportFile, boolean shouldShowDialog) {
        if (shouldShowDialog) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Creating CrashReportDialog for " + reportFile);
            }
            Intent dialogIntent = createCrashReportDialogIntent(reportFile, reportBuilder);
            dialogIntent.setFlags(268435456);
            this.context.startActivity(dialogIntent);
        }
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Wait for Toast + worker ended. Kill Application ? " + reportBuilder.isEndApplication());
        }
        if (reportBuilder.isEndApplication()) {
            endApplication(reportBuilder.getUncaughtExceptionThread(), reportBuilder.getException());
        }
    }

    private void endApplication(@Nullable Thread uncaughtExceptionThread, Throwable th) {
        boolean letDefaultHandlerEndApplication = this.config.alsoReportToAndroidFramework();
        boolean handlingUncaughtException = uncaughtExceptionThread != null;
        if (handlingUncaughtException && letDefaultHandlerEndApplication && this.defaultExceptionHandler != null) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Handing Exception on to default ExceptionHandler");
            }
            this.defaultExceptionHandler.uncaughtException(uncaughtExceptionThread, th);
            return;
        }
        Activity lastActivity = this.lastActivityManager.getLastActivity();
        if (lastActivity != null) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Finishing the last Activity prior to killing the Process");
            }
            lastActivity.finish();
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Finished " + lastActivity.getClass());
            }
            this.lastActivityManager.clearLastActivity();
        }
        Process.killProcess(Process.myPid());
        System.exit(10);
    }

    private void startSendingReports(boolean onlySendSilentReports) {
        if (this.enabled) {
            SenderServiceStarter starter = new SenderServiceStarter(this.context, this.config);
            starter.startService(onlySendSilentReports, true);
        } else {
            ACRA.log.w(ACRA.LOG_TAG, "Would be sending reports, but ACRA is disabled");
        }
    }

    private void createNotification(@NonNull File reportFile, @NonNull ReportBuilder reportBuilder) {
        NotificationManager notificationManager = (NotificationManager) this.context.getSystemService("notification");
        int icon = this.config.resNotifIcon();
        CharSequence tickerText = this.context.getText(this.config.resNotifTickerText());
        long when = System.currentTimeMillis();
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Creating Notification for " + reportFile);
        }
        Intent crashReportDialogIntent = createCrashReportDialogIntent(reportFile, reportBuilder);
        Context context = this.context;
        int i = mNotificationCounter;
        mNotificationCounter = i + 1;
        PendingIntent contentIntent = PendingIntent.getActivity(context, i, crashReportDialogIntent, 134217728);
        CharSequence contentTitle = this.context.getText(this.config.resNotifTitle());
        CharSequence contentText = this.context.getText(this.config.resNotifText());
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this.context);
        Notification notification = builder.setSmallIcon(icon).setTicker(tickerText).setWhen(when).setAutoCancel(true).setContentTitle(contentTitle).setContentText(contentText).setContentIntent(contentIntent).build();
        notification.flags |= 16;
        Intent deleteIntent = createCrashReportDialogIntent(reportFile, reportBuilder);
        deleteIntent.putExtra(ACRAConstants.EXTRA_FORCE_CANCEL, true);
        notification.deleteIntent = PendingIntent.getActivity(this.context, -1, deleteIntent, 0);
        notificationManager.notify(ACRAConstants.NOTIF_CRASH_ID, notification);
    }

    @NonNull
    private File getReportFileName(@NonNull CrashReportData crashData) {
        String timestamp = crashData.getProperty(ReportField.USER_CRASH_DATE);
        String isSilent = crashData.getProperty(ReportField.IS_SILENT);
        String fileName = (timestamp != null ? timestamp : Long.valueOf(new Date().getTime())) + (isSilent != null ? ACRAConstants.SILENT_SUFFIX : "") + ACRAConstants.REPORTFILE_EXTENSION;
        ReportLocator reportLocator = new ReportLocator(this.context);
        return new File(reportLocator.getUnapprovedFolder(), fileName);
    }

    private void saveCrashReportFile(@NonNull File file, @NonNull CrashReportData crashData) {
        try {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Writing crash report file " + file);
            }
            CrashReportPersister persister = new CrashReportPersister();
            persister.store(crashData, file);
        } catch (Exception e) {
            ACRA.log.e(ACRA.LOG_TAG, "An error occurred while writing the report file...", e);
        }
    }

    @NonNull
    private Intent createCrashReportDialogIntent(@NonNull File reportFile, @NonNull ReportBuilder reportBuilder) {
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Creating DialogIntent for " + reportFile + " exception=" + reportBuilder.getException());
        }
        Intent dialogIntent = new Intent(this.context, this.config.reportDialogClass());
        dialogIntent.putExtra(ACRAConstants.EXTRA_REPORT_FILE, reportFile);
        dialogIntent.putExtra(ACRAConstants.EXTRA_REPORT_EXCEPTION, reportBuilder.getException());
        dialogIntent.putExtra(ACRAConstants.EXTRA_REPORT_CONFIG, this.config);
        return dialogIntent;
    }
}
