package org.acra.collector;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Environment;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.acra.ACRA;
import org.acra.ReportField;
import org.acra.builder.ReportBuilder;
import org.acra.config.ACRAConfiguration;
import org.acra.util.Installation;
import org.acra.util.PackageManagerWrapper;
import org.acra.util.ReportUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/CrashReportDataFactory.class */
public final class CrashReportDataFactory {
    private final Context context;
    private final ACRAConfiguration config;
    private final SharedPreferences prefs;
    private final Map<String, String> customParameters = new LinkedHashMap();
    private final Calendar appStartDate;
    private final String initialConfiguration;

    public CrashReportDataFactory(@NonNull Context context, @NonNull ACRAConfiguration config, @NonNull SharedPreferences prefs, @NonNull Calendar appStartDate, @Nullable String initialConfiguration) {
        this.context = context;
        this.config = config;
        this.prefs = prefs;
        this.appStartDate = appStartDate;
        this.initialConfiguration = initialConfiguration;
    }

    public String putCustomData(@NonNull String key, String value) {
        return this.customParameters.put(key, value);
    }

    public String removeCustomData(@NonNull String key) {
        return this.customParameters.remove(key);
    }

    public void clearCustomData() {
        this.customParameters.clear();
    }

    public String getCustomData(@NonNull String key) {
        return this.customParameters.get(key);
    }

    @NonNull
    public CrashReportData createCrashData(@NonNull ReportBuilder builder) {
        CrashReportData crashReportData = new CrashReportData();
        try {
            Set<ReportField> crashReportFields = this.config.getReportFields();
            try {
                crashReportData.put((CrashReportData) ReportField.STACK_TRACE, (ReportField) getStackTrace(builder.getMessage(), builder.getException()));
            } catch (RuntimeException e) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving STACK_TRACE data", e);
            }
            PackageManagerWrapper pm = new PackageManagerWrapper(this.context);
            boolean hasReadLogsPermission = pm.hasPermission("android.permission.READ_LOGS") || Build.VERSION.SDK_INT >= 16;
            if (this.prefs.getBoolean(ACRA.PREF_ENABLE_SYSTEM_LOGS, true) && hasReadLogsPermission) {
                if (ACRA.DEV_LOGGING) {
                    ACRA.log.d(ACRA.LOG_TAG, "READ_LOGS granted! ACRA can include LogCat and DropBox data.");
                }
                LogCatCollector logCatCollector = new LogCatCollector();
                if (crashReportFields.contains(ReportField.LOGCAT)) {
                    try {
                        crashReportData.put((CrashReportData) ReportField.LOGCAT, (ReportField) logCatCollector.collectLogCat(this.config, null));
                    } catch (RuntimeException e2) {
                        ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving LOGCAT data", e2);
                    }
                }
                if (crashReportFields.contains(ReportField.EVENTSLOG)) {
                    try {
                        crashReportData.put((CrashReportData) ReportField.EVENTSLOG, (ReportField) logCatCollector.collectLogCat(this.config, "events"));
                    } catch (RuntimeException e3) {
                        ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving EVENTSLOG data", e3);
                    }
                }
                if (crashReportFields.contains(ReportField.RADIOLOG)) {
                    try {
                        crashReportData.put((CrashReportData) ReportField.RADIOLOG, (ReportField) logCatCollector.collectLogCat(this.config, "radio"));
                    } catch (RuntimeException e4) {
                        ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving RADIOLOG data", e4);
                    }
                }
                if (crashReportFields.contains(ReportField.DROPBOX)) {
                    try {
                        crashReportData.put((CrashReportData) ReportField.DROPBOX, (ReportField) new DropBoxCollector().read(this.context, this.config));
                    } catch (RuntimeException e5) {
                        ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving DROPBOX data", e5);
                    }
                }
            } else if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "READ_LOGS not allowed. ACRA will not include LogCat and DropBox data.");
            }
            try {
                crashReportData.put((CrashReportData) ReportField.USER_APP_START_DATE, (ReportField) ReportUtils.getTimeString(this.appStartDate));
            } catch (RuntimeException e6) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving USER_APP_START_DATE data", e6);
            }
            if (builder.isSendSilently()) {
                crashReportData.put((CrashReportData) ReportField.IS_SILENT, (ReportField) "true");
            }
            try {
                crashReportData.put((CrashReportData) ReportField.REPORT_ID, (ReportField) UUID.randomUUID().toString());
            } catch (RuntimeException e7) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving REPORT_ID data", e7);
            }
            try {
                Calendar curDate = new GregorianCalendar();
                crashReportData.put((CrashReportData) ReportField.USER_CRASH_DATE, (ReportField) ReportUtils.getTimeString(curDate));
            } catch (RuntimeException e8) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving USER_CRASH_DATE data", e8);
            }
            if (crashReportFields.contains(ReportField.STACK_TRACE_HASH)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.STACK_TRACE_HASH, (ReportField) getStackTraceHash(builder.getException()));
                } catch (RuntimeException e9) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving STACK_TRACE_HASH data", e9);
                }
            }
            if (crashReportFields.contains(ReportField.INSTALLATION_ID)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.INSTALLATION_ID, (ReportField) Installation.id(this.context));
                } catch (RuntimeException e10) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving INSTALLATION_ID data", e10);
                }
            }
            if (crashReportFields.contains(ReportField.INITIAL_CONFIGURATION)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.INITIAL_CONFIGURATION, (ReportField) this.initialConfiguration);
                } catch (RuntimeException e11) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving INITIAL_CONFIGURATION data", e11);
                }
            }
            if (crashReportFields.contains(ReportField.CRASH_CONFIGURATION)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.CRASH_CONFIGURATION, (ReportField) ConfigurationCollector.collectConfiguration(this.context));
                } catch (RuntimeException e12) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving CRASH_CONFIGURATION data", e12);
                }
            }
            if (!(builder.getException() instanceof OutOfMemoryError) && crashReportFields.contains(ReportField.DUMPSYS_MEMINFO)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.DUMPSYS_MEMINFO, (ReportField) DumpSysCollector.collectMemInfo());
                } catch (RuntimeException e13) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving DUMPSYS_MEMINFO data", e13);
                }
            }
            if (crashReportFields.contains(ReportField.PACKAGE_NAME)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.PACKAGE_NAME, (ReportField) this.context.getPackageName());
                } catch (RuntimeException e14) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving PACKAGE_NAME data", e14);
                }
            }
            if (crashReportFields.contains(ReportField.BUILD)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.BUILD, (ReportField) (ReflectionCollector.collectConstants(Build.class) + ReflectionCollector.collectConstants(Build.VERSION.class, "VERSION")));
                } catch (RuntimeException e15) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving BUILD data", e15);
                }
            }
            if (crashReportFields.contains(ReportField.PHONE_MODEL)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.PHONE_MODEL, (ReportField) Build.MODEL);
                } catch (RuntimeException e16) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving PHONE_MODEL data", e16);
                }
            }
            if (crashReportFields.contains(ReportField.ANDROID_VERSION)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.ANDROID_VERSION, (ReportField) Build.VERSION.RELEASE);
                } catch (RuntimeException e17) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving ANDROID_VERSION data", e17);
                }
            }
            if (crashReportFields.contains(ReportField.BRAND)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.BRAND, (ReportField) Build.BRAND);
                } catch (RuntimeException e18) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving BRAND data", e18);
                }
            }
            if (crashReportFields.contains(ReportField.PRODUCT)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.PRODUCT, (ReportField) Build.PRODUCT);
                } catch (RuntimeException e19) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving PRODUCT data", e19);
                }
            }
            if (crashReportFields.contains(ReportField.TOTAL_MEM_SIZE)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.TOTAL_MEM_SIZE, (ReportField) Long.toString(ReportUtils.getTotalInternalMemorySize()));
                } catch (RuntimeException e20) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving TOTAL_MEM_SIZE data", e20);
                }
            }
            if (crashReportFields.contains(ReportField.AVAILABLE_MEM_SIZE)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.AVAILABLE_MEM_SIZE, (ReportField) Long.toString(ReportUtils.getAvailableInternalMemorySize()));
                } catch (RuntimeException e21) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving AVAILABLE_MEM_SIZE data", e21);
                }
            }
            if (crashReportFields.contains(ReportField.FILE_PATH)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.FILE_PATH, (ReportField) ReportUtils.getApplicationFilePath(this.context));
                } catch (RuntimeException e22) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving FILE_PATH data", e22);
                }
            }
            if (crashReportFields.contains(ReportField.DISPLAY)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.DISPLAY, (ReportField) DisplayManagerCollector.collectDisplays(this.context));
                } catch (RuntimeException e23) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving DISPLAY data", e23);
                }
            }
            if (crashReportFields.contains(ReportField.CUSTOM_DATA)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.CUSTOM_DATA, (ReportField) createCustomInfoString(builder.getCustomData()));
                } catch (RuntimeException e24) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving CUSTOM_DATA data", e24);
                }
            }
            if (crashReportFields.contains(ReportField.BUILD_CONFIG)) {
                try {
                    Class buildConfigClass = getBuildConfigClass();
                    crashReportData.put((CrashReportData) ReportField.BUILD_CONFIG, (ReportField) ReflectionCollector.collectConstants(buildConfigClass));
                } catch (ClassNotFoundException e25) {
                } catch (RuntimeException e26) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving BUILD_CONFIG data", e26);
                }
            }
            if (crashReportFields.contains(ReportField.USER_EMAIL)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.USER_EMAIL, (ReportField) this.prefs.getString(ACRA.PREF_USER_EMAIL_ADDRESS, "N/A"));
                } catch (RuntimeException e27) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving USER_EMAIL data", e27);
                }
            }
            if (crashReportFields.contains(ReportField.DEVICE_FEATURES)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.DEVICE_FEATURES, (ReportField) DeviceFeaturesCollector.getFeatures(this.context));
                } catch (RuntimeException e28) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving DEVICE_FEATURES data", e28);
                }
            }
            if (crashReportFields.contains(ReportField.ENVIRONMENT)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.ENVIRONMENT, (ReportField) ReflectionCollector.collectStaticGettersResults(Environment.class));
                } catch (RuntimeException e29) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving ENVIRONMENT data", e29);
                }
            }
            SettingsCollector settingsCollector = new SettingsCollector(this.context, this.config);
            if (crashReportFields.contains(ReportField.SETTINGS_SYSTEM)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.SETTINGS_SYSTEM, (ReportField) settingsCollector.collectSystemSettings());
                } catch (RuntimeException e30) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving SETTINGS_SYSTEM data", e30);
                }
            }
            if (crashReportFields.contains(ReportField.SETTINGS_SECURE)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.SETTINGS_SECURE, (ReportField) settingsCollector.collectSecureSettings());
                } catch (RuntimeException e31) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving SETTINGS_SECURE data", e31);
                }
            }
            if (crashReportFields.contains(ReportField.SETTINGS_GLOBAL)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.SETTINGS_GLOBAL, (ReportField) settingsCollector.collectGlobalSettings());
                } catch (RuntimeException e32) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving SETTINGS_GLOBAL data", e32);
                }
            }
            if (crashReportFields.contains(ReportField.SHARED_PREFERENCES)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.SHARED_PREFERENCES, (ReportField) new SharedPreferencesCollector(this.context, this.config).collect());
                } catch (RuntimeException e33) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving SHARED_PREFERENCES data", e33);
                }
            }
            try {
                PackageInfo pi = pm.getPackageInfo();
                if (pi != null) {
                    if (crashReportFields.contains(ReportField.APP_VERSION_CODE)) {
                        crashReportData.put((CrashReportData) ReportField.APP_VERSION_CODE, (ReportField) Integer.toString(pi.versionCode));
                    }
                    if (crashReportFields.contains(ReportField.APP_VERSION_NAME)) {
                        crashReportData.put((CrashReportData) ReportField.APP_VERSION_NAME, (ReportField) (pi.versionName != null ? pi.versionName : "not set"));
                    }
                } else {
                    crashReportData.put((CrashReportData) ReportField.APP_VERSION_NAME, (ReportField) "Package info unavailable");
                }
            } catch (RuntimeException e34) {
                ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving APP_VERSION_CODE and APP_VERSION_NAME data", e34);
            }
            if (crashReportFields.contains(ReportField.DEVICE_ID) && this.prefs.getBoolean(ACRA.PREF_ENABLE_DEVICE_ID, true) && pm.hasPermission("android.permission.READ_PHONE_STATE")) {
                try {
                    String deviceId = ReportUtils.getDeviceId(this.context);
                    if (deviceId != null) {
                        crashReportData.put((CrashReportData) ReportField.DEVICE_ID, (ReportField) deviceId);
                    }
                } catch (RuntimeException e35) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving DEVICE_ID data", e35);
                }
            }
            if (crashReportFields.contains(ReportField.APPLICATION_LOG)) {
                try {
                    String logFile = new LogFileCollector().collectLogFile(this.context, this.config.applicationLogFile(), this.config.applicationLogFileLines());
                    crashReportData.put((CrashReportData) ReportField.APPLICATION_LOG, (ReportField) logFile);
                } catch (IOException e36) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while reading application log file " + this.config.applicationLogFile(), e36);
                } catch (RuntimeException e37) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving APPLICATION_LOG data", e37);
                }
            }
            if (crashReportFields.contains(ReportField.MEDIA_CODEC_LIST)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.MEDIA_CODEC_LIST, (ReportField) MediaCodecListCollector.collectMediaCodecList());
                } catch (RuntimeException e38) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving MEDIA_CODEC_LIST data", e38);
                }
            }
            if (crashReportFields.contains(ReportField.THREAD_DETAILS)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.THREAD_DETAILS, (ReportField) ThreadCollector.collect(builder.getUncaughtExceptionThread()));
                } catch (RuntimeException e39) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving THREAD_DETAILS data", e39);
                }
            }
            if (crashReportFields.contains(ReportField.USER_IP)) {
                try {
                    crashReportData.put((CrashReportData) ReportField.USER_IP, (ReportField) ReportUtils.getLocalIpAddress());
                } catch (RuntimeException e40) {
                    ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving USER_IP data", e40);
                }
            }
        } catch (RuntimeException e41) {
            ACRA.log.e(ACRA.LOG_TAG, "Error while retrieving crash data", e41);
        }
        return crashReportData;
    }

    @NonNull
    private String createCustomInfoString(@Nullable Map<String, String> reportCustomData) {
        Map<String, String> params = this.customParameters;
        if (reportCustomData != null) {
            params = new HashMap(params);
            params.putAll(reportCustomData);
        }
        StringBuilder customInfo = new StringBuilder();
        for (Map.Entry<String, String> currentEntry : params.entrySet()) {
            customInfo.append(currentEntry.getKey());
            customInfo.append(" = ");
            String currentVal = currentEntry.getValue();
            if (currentVal != null) {
                customInfo.append(currentVal.replaceAll("\n", "\\\\n"));
            } else {
                customInfo.append("null");
            }
            customInfo.append('\n');
        }
        return customInfo.toString();
    }

    @NonNull
    private String getStackTrace(@Nullable String msg, @Nullable Throwable th) {
        Writer result = new StringWriter();
        PrintWriter printWriter = new PrintWriter(result);
        if (msg != null && !TextUtils.isEmpty(msg)) {
            printWriter.println(msg);
        }
        Throwable th2 = th;
        while (true) {
            Throwable cause = th2;
            if (cause != null) {
                cause.printStackTrace(printWriter);
                th2 = cause.getCause();
            } else {
                String stacktraceAsString = result.toString();
                printWriter.close();
                return stacktraceAsString;
            }
        }
    }

    @NonNull
    private String getStackTraceHash(@Nullable Throwable th) {
        StringBuilder res = new StringBuilder();
        Throwable th2 = th;
        while (true) {
            Throwable cause = th2;
            if (cause != null) {
                StackTraceElement[] stackTraceElements = cause.getStackTrace();
                for (StackTraceElement e : stackTraceElements) {
                    res.append(e.getClassName());
                    res.append(e.getMethodName());
                }
                th2 = cause.getCause();
            } else {
                return Integer.toHexString(res.toString().hashCode());
            }
        }
    }

    @NonNull
    private Class<?> getBuildConfigClass() throws ClassNotFoundException {
        Class configuredBuildConfig = this.config.buildConfigClass();
        if (!configuredBuildConfig.equals(Object.class)) {
            return configuredBuildConfig;
        }
        String className = this.context.getPackageName() + ".BuildConfig";
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            ACRA.log.e(ACRA.LOG_TAG, "Not adding buildConfig to log. Class Not found : " + className + ". Please configure 'buildConfigClass' in your ACRA config");
            throw e;
        }
    }
}
