package org.acra;

import android.app.Application;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.lang.Thread;
import java.util.Calendar;
import java.util.GregorianCalendar;
import org.acra.builder.LastActivityManager;
import org.acra.builder.NoOpReportPrimer;
import org.acra.builder.ReportBuilder;
import org.acra.builder.ReportExecutor;
import org.acra.builder.ReportPrimer;
import org.acra.collector.ConfigurationCollector;
import org.acra.collector.CrashReportDataFactory;
import org.acra.config.ACRAConfiguration;
import org.acra.util.ApplicationStartupProcessor;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/ErrorReporter.class */
public class ErrorReporter implements Thread.UncaughtExceptionHandler {
    private final boolean supportedAndroidVersion;
    private final Application context;

    @NonNull
    private final ACRAConfiguration config;

    @NonNull
    private final CrashReportDataFactory crashReportDataFactory;

    @NonNull
    private final ReportExecutor reportExecutor;

    @NonNull
    private volatile ExceptionHandlerInitializer exceptionHandlerInitializer = new ExceptionHandlerInitializer() { // from class: org.acra.ErrorReporter.1
        @Override // org.acra.ExceptionHandlerInitializer
        public void initializeExceptionHandler(ErrorReporter reporter) {
        }
    };

    ErrorReporter(@NonNull Application context, @NonNull ACRAConfiguration config, @NonNull SharedPreferences prefs, boolean enabled, boolean supportedAndroidVersion, boolean listenForUncaughtExceptions) {
        String initialConfiguration;
        Thread.UncaughtExceptionHandler defaultExceptionHandler;
        this.context = context;
        this.config = config;
        this.supportedAndroidVersion = supportedAndroidVersion;
        if (config.getReportFields().contains(ReportField.INITIAL_CONFIGURATION)) {
            initialConfiguration = ConfigurationCollector.collectConfiguration(this.context);
        } else {
            initialConfiguration = null;
        }
        Calendar appStartDate = new GregorianCalendar();
        this.crashReportDataFactory = new CrashReportDataFactory(this.context, config, prefs, appStartDate, initialConfiguration);
        if (listenForUncaughtExceptions) {
            defaultExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(this);
        } else {
            defaultExceptionHandler = null;
        }
        LastActivityManager lastActivityManager = new LastActivityManager(this.context);
        ReportPrimer reportPrimer = getReportPrimer(config);
        this.reportExecutor = new ReportExecutor(context, config, this.crashReportDataFactory, lastActivityManager, defaultExceptionHandler, reportPrimer);
        this.reportExecutor.setEnabled(enabled);
    }

    @Deprecated
    public void addCustomData(@NonNull String key, String value) {
        putCustomData(key, value);
    }

    public String putCustomData(@NonNull String key, String value) {
        return this.crashReportDataFactory.putCustomData(key, value);
    }

    public void setExceptionHandlerInitializer(@Nullable ExceptionHandlerInitializer initializer) {
        this.exceptionHandlerInitializer = initializer != null ? initializer : new ExceptionHandlerInitializer() { // from class: org.acra.ErrorReporter.2
            @Override // org.acra.ExceptionHandlerInitializer
            public void initializeExceptionHandler(ErrorReporter reporter) {
            }
        };
    }

    public String removeCustomData(@NonNull String key) {
        return this.crashReportDataFactory.removeCustomData(key);
    }

    public void clearCustomData() {
        this.crashReportDataFactory.clearCustomData();
    }

    public String getCustomData(@NonNull String key) {
        return this.crashReportDataFactory.getCustomData(key);
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(@Nullable Thread t, @NonNull Throwable e) {
        if (!this.reportExecutor.isEnabled()) {
            this.reportExecutor.handReportToDefaultExceptionHandler(t, e);
            return;
        }
        try {
            ACRA.log.e(ACRA.LOG_TAG, "ACRA caught a " + e.getClass().getSimpleName() + " for " + this.context.getPackageName(), e);
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Building report");
            }
            performDeprecatedReportPriming();
            new ReportBuilder().uncaughtExceptionThread(t).exception(e).endApplication().build(this.reportExecutor);
        } catch (Throwable fatality) {
            ACRA.log.e(ACRA.LOG_TAG, "ACRA failed to capture the error - handing off to native error reporter", fatality);
            this.reportExecutor.handReportToDefaultExceptionHandler(t, e);
        }
    }

    public void handleSilentException(@Nullable Throwable e) {
        performDeprecatedReportPriming();
        new ReportBuilder().exception(e).sendSilently().build(this.reportExecutor);
    }

    public void setEnabled(boolean enabled) {
        if (this.supportedAndroidVersion) {
            ACRA.log.i(ACRA.LOG_TAG, "ACRA is " + (enabled ? "enabled" : "disabled") + " for " + this.context.getPackageName());
            this.reportExecutor.setEnabled(enabled);
        } else {
            ACRA.log.w(ACRA.LOG_TAG, "ACRA 4.7.0+ requires Froyo or greater. ACRA is disabled and will NOT catch crashes or send messages.");
        }
    }

    public void checkReportsOnApplicationStart() {
        ApplicationStartupProcessor startupProcessor = new ApplicationStartupProcessor(this.context, this.config);
        if (this.config.deleteOldUnsentReportsOnApplicationStart()) {
            startupProcessor.deleteUnsentReportsFromOldAppVersion();
        }
        if (this.config.deleteUnapprovedReportsOnApplicationStart()) {
            startupProcessor.deleteAllUnapprovedReportsBarOne();
        }
        if (this.reportExecutor.isEnabled()) {
            startupProcessor.sendApprovedReports();
        }
    }

    public void handleException(@Nullable Throwable e, boolean endApplication) {
        performDeprecatedReportPriming();
        ReportBuilder builder = new ReportBuilder();
        builder.exception(e);
        if (endApplication) {
            builder.endApplication();
        }
        builder.build(this.reportExecutor);
    }

    public void handleException(@Nullable Throwable e) {
        handleException(e, false);
    }

    private void performDeprecatedReportPriming() {
        try {
            this.exceptionHandlerInitializer.initializeExceptionHandler(this);
        } catch (Exception e) {
            ACRA.log.w(ACRA.LOG_TAG, "Failed to initialize " + this.exceptionHandlerInitializer + " from #handleException");
        }
    }

    @NonNull
    private static ReportPrimer getReportPrimer(@NonNull ACRAConfiguration config) {
        try {
            return config.reportPrimerClass().newInstance();
        } catch (IllegalAccessException e) {
            ACRA.log.w(ACRA.LOG_TAG, "Could not construct ReportPrimer from " + config.reportPrimerClass() + " - not priming", e);
            return new NoOpReportPrimer();
        } catch (InstantiationException e2) {
            ACRA.log.w(ACRA.LOG_TAG, "Could not construct ReportPrimer from " + config.reportPrimerClass() + " - not priming", e2);
            return new NoOpReportPrimer();
        }
    }
}
