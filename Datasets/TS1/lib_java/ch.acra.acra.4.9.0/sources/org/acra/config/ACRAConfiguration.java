package org.acra.config;

import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RawRes;
import android.support.annotation.StringRes;
import android.support.annotation.StyleRes;
import java.io.Serializable;
import org.acra.ReportField;
import org.acra.ReportingInteractionMode;
import org.acra.builder.ReportPrimer;
import org.acra.collections.ImmutableList;
import org.acra.collections.ImmutableMap;
import org.acra.collections.ImmutableSet;
import org.acra.dialog.BaseCrashReportDialog;
import org.acra.security.KeyStoreFactory;
import org.acra.sender.HttpSender;
import org.acra.sender.ReportSenderFactory;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/config/ACRAConfiguration.class */
public final class ACRAConfiguration implements Serializable {
    private final ImmutableSet<String> additionalDropBoxTags;
    private final ImmutableSet<String> additionalSharedPreferences;
    private final int connectionTimeout;
    private final ImmutableSet<ReportField> reportContent;
    private final boolean deleteUnapprovedReportsOnApplicationStart;
    private final boolean deleteOldUnsentReportsOnApplicationStart;
    private final int dropboxCollectionMinutes;
    private final boolean alsoReportToAndroidFramework;
    private final String formUri;
    private final String formUriBasicAuthLogin;
    private final String formUriBasicAuthPassword;
    private final boolean includeDropBoxSystemTags;
    private final ImmutableList<String> logcatArguments;
    private final String mailTo;
    private final ReportingInteractionMode reportingInteractionMode;
    private final Class<? extends BaseCrashReportDialog> reportDialogClass;
    private final Class<? extends ReportPrimer> reportPrimerClass;

    @StringRes
    private final int resDialogPositiveButtonText;

    @StringRes
    private final int resDialogNegativeButtonText;

    @StringRes
    private final int resDialogCommentPrompt;

    @StringRes
    private final int resDialogEmailPrompt;

    @DrawableRes
    private final int resDialogIcon;

    @StringRes
    private final int resDialogOkToast;

    @StringRes
    private final int resDialogText;

    @StringRes
    private final int resDialogTitle;

    @StyleRes
    private final int resDialogTheme;

    @DrawableRes
    private final int resNotifIcon;

    @StringRes
    private final int resNotifText;

    @StringRes
    private final int resNotifTickerText;

    @StringRes
    private final int resNotifTitle;

    @StringRes
    private final int resToastText;
    private final int sharedPreferencesMode;
    private final String sharedPreferencesName;
    private final int socketTimeout;
    private final boolean logcatFilterByPid;
    private final boolean sendReportsInDevMode;
    private final ImmutableSet<String> excludeMatchingSharedPreferencesKeys;
    private final ImmutableSet<String> excludeMatchingSettingsKeys;
    private final Class buildConfigClass;
    private final String applicationLogFile;
    private final int applicationLogFileLines;
    private final HttpSender.Method httpMethod;
    private final HttpSender.Type reportType;
    private final ImmutableMap<String, String> httpHeaders;
    private final Class<? extends KeyStoreFactory> keyStoreFactoryClass;
    private final ImmutableSet<Class<? extends ReportSenderFactory>> reportSenderFactoryClasses;

    @RawRes
    private final int resCertificate;
    private final String certificatePath;
    private final String certificateType;

    ACRAConfiguration(@NonNull ConfigurationBuilder builder) {
        this.additionalDropBoxTags = new ImmutableSet<>(builder.additionalDropBoxTags());
        this.additionalSharedPreferences = new ImmutableSet<>(builder.additionalSharedPreferences());
        this.connectionTimeout = builder.connectionTimeout();
        this.reportContent = new ImmutableSet<>(builder.reportContent());
        this.deleteUnapprovedReportsOnApplicationStart = builder.deleteUnapprovedReportsOnApplicationStart();
        this.deleteOldUnsentReportsOnApplicationStart = builder.deleteOldUnsentReportsOnApplicationStart();
        this.dropboxCollectionMinutes = builder.dropboxCollectionMinutes();
        this.alsoReportToAndroidFramework = builder.alsoReportToAndroidFramework();
        this.formUri = builder.formUri();
        this.formUriBasicAuthLogin = builder.formUriBasicAuthLogin();
        this.formUriBasicAuthPassword = builder.formUriBasicAuthPassword();
        this.includeDropBoxSystemTags = builder.includeDropBoxSystemTags();
        this.logcatArguments = new ImmutableList<>(builder.logcatArguments());
        this.mailTo = builder.mailTo();
        this.reportingInteractionMode = builder.reportingInteractionMode();
        this.resDialogIcon = builder.resDialogIcon();
        this.resDialogPositiveButtonText = builder.resDialogPositiveButtonText();
        this.resDialogNegativeButtonText = builder.resDialogNegativeButtonText();
        this.resDialogCommentPrompt = builder.resDialogCommentPrompt();
        this.resDialogEmailPrompt = builder.resDialogEmailPrompt();
        this.resDialogOkToast = builder.resDialogOkToast();
        this.resDialogText = builder.resDialogText();
        this.resDialogTitle = builder.resDialogTitle();
        this.resDialogTheme = builder.resDialogTheme();
        this.resNotifIcon = builder.resNotifIcon();
        this.resNotifText = builder.resNotifText();
        this.resNotifTickerText = builder.resNotifTickerText();
        this.resNotifTitle = builder.resNotifTitle();
        this.resToastText = builder.resToastText();
        this.sharedPreferencesMode = builder.sharedPreferencesMode();
        this.sharedPreferencesName = builder.sharedPreferencesName();
        this.socketTimeout = builder.socketTimeout();
        this.logcatFilterByPid = builder.logcatFilterByPid();
        this.sendReportsInDevMode = builder.sendReportsInDevMode();
        this.excludeMatchingSharedPreferencesKeys = new ImmutableSet<>(builder.excludeMatchingSharedPreferencesKeys());
        this.excludeMatchingSettingsKeys = new ImmutableSet<>(builder.excludeMatchingSettingsKeys());
        this.buildConfigClass = builder.buildConfigClass();
        this.applicationLogFile = builder.applicationLogFile();
        this.applicationLogFileLines = builder.applicationLogFileLines();
        this.reportDialogClass = builder.reportDialogClass();
        this.reportPrimerClass = builder.reportPrimerClass();
        this.httpMethod = builder.httpMethod();
        this.httpHeaders = new ImmutableMap<>(builder.httpHeaders());
        this.reportType = builder.reportType();
        this.reportSenderFactoryClasses = new ImmutableSet<>(builder.reportSenderFactoryClasses());
        this.keyStoreFactoryClass = builder.keyStoreFactoryClass();
        this.resCertificate = builder.resCertificate();
        this.certificatePath = builder.certificatePath();
        this.certificateType = builder.certificateType();
    }

    @NonNull
    public ImmutableMap<String, String> getHttpHeaders() {
        return this.httpHeaders;
    }

    @NonNull
    public ImmutableSet<ReportField> getReportFields() {
        return this.reportContent;
    }

    @NonNull
    public ImmutableSet<String> additionalDropBoxTags() {
        return this.additionalDropBoxTags;
    }

    @NonNull
    public ImmutableSet<String> additionalSharedPreferences() {
        return this.additionalSharedPreferences;
    }

    public int connectionTimeout() {
        return this.connectionTimeout;
    }

    public boolean deleteUnapprovedReportsOnApplicationStart() {
        return this.deleteUnapprovedReportsOnApplicationStart;
    }

    public boolean deleteOldUnsentReportsOnApplicationStart() {
        return this.deleteOldUnsentReportsOnApplicationStart;
    }

    public int dropboxCollectionMinutes() {
        return this.dropboxCollectionMinutes;
    }

    public boolean alsoReportToAndroidFramework() {
        return this.alsoReportToAndroidFramework;
    }

    @Nullable
    public String formUri() {
        return this.formUri;
    }

    @Nullable
    public String formUriBasicAuthLogin() {
        return this.formUriBasicAuthLogin;
    }

    @Nullable
    public String formUriBasicAuthPassword() {
        return this.formUriBasicAuthPassword;
    }

    public boolean includeDropBoxSystemTags() {
        return this.includeDropBoxSystemTags;
    }

    @NonNull
    public ImmutableList<String> logcatArguments() {
        return this.logcatArguments;
    }

    @Nullable
    public String mailTo() {
        return this.mailTo;
    }

    @NonNull
    public ReportingInteractionMode mode() {
        return this.reportingInteractionMode;
    }

    @StringRes
    public int resDialogPositiveButtonText() {
        return this.resDialogPositiveButtonText;
    }

    @StringRes
    public int resDialogNegativeButtonText() {
        return this.resDialogNegativeButtonText;
    }

    @StringRes
    public int resDialogCommentPrompt() {
        return this.resDialogCommentPrompt;
    }

    @StringRes
    public int resDialogEmailPrompt() {
        return this.resDialogEmailPrompt;
    }

    @DrawableRes
    public int resDialogIcon() {
        return this.resDialogIcon;
    }

    @StringRes
    public int resDialogOkToast() {
        return this.resDialogOkToast;
    }

    @StringRes
    public int resDialogText() {
        return this.resDialogText;
    }

    @StringRes
    public int resDialogTitle() {
        return this.resDialogTitle;
    }

    @StyleRes
    public int resDialogTheme() {
        return this.resDialogTheme;
    }

    @DrawableRes
    public int resNotifIcon() {
        return this.resNotifIcon;
    }

    @StringRes
    public int resNotifText() {
        return this.resNotifText;
    }

    @StringRes
    public int resNotifTickerText() {
        return this.resNotifTickerText;
    }

    @StringRes
    public int resNotifTitle() {
        return this.resNotifTitle;
    }

    @StringRes
    public int resToastText() {
        return this.resToastText;
    }

    public int sharedPreferencesMode() {
        return this.sharedPreferencesMode;
    }

    @NonNull
    public String sharedPreferencesName() {
        return this.sharedPreferencesName;
    }

    public int socketTimeout() {
        return this.socketTimeout;
    }

    public boolean logcatFilterByPid() {
        return this.logcatFilterByPid;
    }

    public boolean sendReportsInDevMode() {
        return this.sendReportsInDevMode;
    }

    @NonNull
    public ImmutableSet<String> excludeMatchingSharedPreferencesKeys() {
        return this.excludeMatchingSharedPreferencesKeys;
    }

    @NonNull
    public ImmutableSet<String> excludeMatchingSettingsKeys() {
        return this.excludeMatchingSettingsKeys;
    }

    @NonNull
    public Class buildConfigClass() {
        return this.buildConfigClass;
    }

    @NonNull
    public String applicationLogFile() {
        return this.applicationLogFile;
    }

    public int applicationLogFileLines() {
        return this.applicationLogFileLines;
    }

    @NonNull
    public Class<? extends BaseCrashReportDialog> reportDialogClass() {
        return this.reportDialogClass;
    }

    @NonNull
    public Class<? extends ReportPrimer> reportPrimerClass() {
        return this.reportPrimerClass;
    }

    @NonNull
    public HttpSender.Method httpMethod() {
        return this.httpMethod;
    }

    @NonNull
    public HttpSender.Type reportType() {
        return this.reportType;
    }

    @NonNull
    public ImmutableSet<Class<? extends ReportSenderFactory>> reportSenderFactoryClasses() {
        return this.reportSenderFactoryClasses;
    }

    @NonNull
    public Class<? extends KeyStoreFactory> keyStoreFactoryClass() {
        return this.keyStoreFactoryClass;
    }

    @RawRes
    public int resCertificate() {
        return this.resCertificate;
    }

    public String certificatePath() {
        return this.certificatePath;
    }

    public String certificateType() {
        return this.certificateType;
    }
}
