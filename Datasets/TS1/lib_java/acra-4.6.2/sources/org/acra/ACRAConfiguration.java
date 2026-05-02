package org.acra;

import java.lang.annotation.Annotation;
import java.security.KeyStore;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.acra.annotation.ReportsCrashes;
import org.acra.sender.HttpSender;
import org.acra.util.DefaultHttpsSocketFactoryFactory;
import org.acra.util.HttpsSocketFactoryFactory;
import org.acra.util.ReflectionException;
import org.acra.util.ReflectionHelper;

/* loaded from: acra-4.6.2.jar:org/acra/ACRAConfiguration.class */
public class ACRAConfiguration implements ReportsCrashes {
    private final ReflectionHelper reflectionHelper;
    private String[] mAdditionalDropboxTags;
    private String[] mAdditionalSharedPreferences;
    private Integer mConnectionTimeout;
    private ReportField[] mCustomReportContent;
    private Boolean mDeleteUnapprovedReportsOnApplicationStart;
    private Boolean mDeleteOldUnsentReportsOnApplicationStart;
    private Integer mDropboxCollectionMinutes;
    private Boolean mForceCloseDialogAfterToast;
    private String mFormUri;
    private String mFormUriBasicAuthLogin;
    private String mFormUriBasicAuthPassword;
    private Boolean mIncludeDropboxSystemTags;
    private String[] mLogcatArguments;
    private String mMailTo;
    private Integer mMaxNumberOfRequestRetries;
    private ReportingInteractionMode mMode;
    private ReportsCrashes mReportsCrashes;
    private Class<? extends BaseCrashReportDialog> mReportDialogClass;
    private Integer mResDialogPositiveButtonText;
    private Integer mResDialogNegativeButtonText;
    private Integer mResDialogCommentPrompt;
    private Integer mResDialogEmailPrompt;
    private Integer mResDialogIcon;
    private Integer mResDialogOkToast;
    private Integer mResDialogText;
    private Integer mResDialogTitle;
    private Integer mResNotifIcon;
    private Integer mResNotifText;
    private Integer mResNotifTickerText;
    private Integer mResNotifTitle;
    private Integer mResToastText;
    private Integer mSharedPreferenceMode;
    private String mSharedPreferenceName;
    private Integer mSocketTimeout;
    private Boolean mLogcatFilterByPid;
    private Boolean mSendReportsInDevMode;
    private Boolean mSendReportsAtShutdown;
    private String[] mExcludeMatchingSharedPreferencesKeys;
    private String[] mExcludeMatchingSettingsKeys;
    private Class mBuildConfigClass;
    private String mApplicationLogFile;
    private Integer mApplicationLogFileLines;
    private Boolean mDisableSSLCertValidation;
    private String mHttpsSocketFactoryFactoryClass;
    private HttpsSocketFactoryFactory mHttpsSocketFactoryFactory;
    private HttpSender.Method mHttpMethod;
    private HttpSender.Type mReportType;
    private Map<String, String> mHttpHeaders;
    private KeyStore mKeyStore;

    public ACRAConfiguration setHttpHeaders(Map<String, String> headers) {
        this.mHttpHeaders = headers;
        return this;
    }

    public Map<String, String> getHttpHeaders() {
        return this.mHttpHeaders;
    }

    public List<ReportField> getReportFields() {
        ReportField[] fieldsList;
        ReportField[] customReportFields = customReportContent();
        if (customReportFields.length != 0) {
            ACRA.log.d(ACRA.LOG_TAG, "Using custom Report Fields");
            fieldsList = customReportFields;
        } else if (mailTo() == null || "".equals(mailTo())) {
            ACRA.log.d(ACRA.LOG_TAG, "Using default Report Fields");
            fieldsList = ACRAConstants.DEFAULT_REPORT_FIELDS;
        } else {
            ACRA.log.d(ACRA.LOG_TAG, "Using default Mail Report Fields");
            fieldsList = ACRAConstants.DEFAULT_MAIL_REPORT_FIELDS;
        }
        return Arrays.asList(fieldsList);
    }

    public ACRAConfiguration setAdditionalDropboxTags(String[] additionalDropboxTags) {
        this.mAdditionalDropboxTags = additionalDropboxTags;
        return this;
    }

    public ACRAConfiguration setAdditionalSharedPreferences(String[] additionalSharedPreferences) {
        this.mAdditionalSharedPreferences = additionalSharedPreferences;
        return this;
    }

    public ACRAConfiguration setConnectionTimeout(Integer connectionTimeout) {
        this.mConnectionTimeout = connectionTimeout;
        return this;
    }

    public ACRAConfiguration setCustomReportContent(ReportField[] customReportContent) {
        this.mCustomReportContent = customReportContent;
        return this;
    }

    public ACRAConfiguration setDeleteUnapprovedReportsOnApplicationStart(Boolean deleteUnapprovedReportsOnApplicationStart) {
        this.mDeleteUnapprovedReportsOnApplicationStart = deleteUnapprovedReportsOnApplicationStart;
        return this;
    }

    public ACRAConfiguration setDeleteOldUnsentReportsOnApplicationStart(Boolean deleteOldUnsentReportsOnApplicationStart) {
        this.mDeleteOldUnsentReportsOnApplicationStart = deleteOldUnsentReportsOnApplicationStart;
        return this;
    }

    public ACRAConfiguration setDropboxCollectionMinutes(Integer dropboxCollectionMinutes) {
        this.mDropboxCollectionMinutes = dropboxCollectionMinutes;
        return this;
    }

    public ACRAConfiguration setForceCloseDialogAfterToast(Boolean forceCloseDialogAfterToast) {
        this.mForceCloseDialogAfterToast = forceCloseDialogAfterToast;
        return this;
    }

    public ACRAConfiguration setFormUri(String formUri) {
        this.mFormUri = formUri;
        return this;
    }

    public ACRAConfiguration setFormUriBasicAuthLogin(String formUriBasicAuthLogin) {
        this.mFormUriBasicAuthLogin = formUriBasicAuthLogin;
        return this;
    }

    public ACRAConfiguration setFormUriBasicAuthPassword(String formUriBasicAuthPassword) {
        this.mFormUriBasicAuthPassword = formUriBasicAuthPassword;
        return this;
    }

    public ACRAConfiguration setIncludeDropboxSystemTags(Boolean includeDropboxSystemTags) {
        this.mIncludeDropboxSystemTags = includeDropboxSystemTags;
        return this;
    }

    public ACRAConfiguration setLogcatArguments(String[] logcatArguments) {
        this.mLogcatArguments = logcatArguments;
        return this;
    }

    public ACRAConfiguration setMailTo(String mailTo) {
        this.mMailTo = mailTo;
        return this;
    }

    public ACRAConfiguration setMaxNumberOfRequestRetries(Integer maxNumberOfRequestRetries) {
        this.mMaxNumberOfRequestRetries = maxNumberOfRequestRetries;
        return this;
    }

    public ACRAConfiguration setMode(ReportingInteractionMode mode) throws ACRAConfigurationException {
        this.mMode = mode;
        ACRA.checkCrashResources(this);
        return this;
    }

    public ACRAConfiguration setResDialogPositiveButtonText(int resId) {
        this.mResDialogPositiveButtonText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogNegativeButtonText(int resId) {
        this.mResDialogNegativeButtonText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setReportDialogClass(Class<? extends BaseCrashReportDialog> reportDialogClass) {
        this.mReportDialogClass = reportDialogClass;
        return this;
    }

    public ACRAConfiguration setResDialogCommentPrompt(int resId) {
        this.mResDialogCommentPrompt = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogEmailPrompt(int resId) {
        this.mResDialogEmailPrompt = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogIcon(int resId) {
        this.mResDialogIcon = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogOkToast(int resId) {
        this.mResDialogOkToast = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogText(int resId) {
        this.mResDialogText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResDialogTitle(int resId) {
        this.mResDialogTitle = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResNotifIcon(int resId) {
        this.mResNotifIcon = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResNotifText(int resId) {
        this.mResNotifText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResNotifTickerText(int resId) {
        this.mResNotifTickerText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResNotifTitle(int resId) {
        this.mResNotifTitle = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setResToastText(int resId) {
        this.mResToastText = Integer.valueOf(resId);
        return this;
    }

    public ACRAConfiguration setSharedPreferenceMode(Integer sharedPreferenceMode) {
        this.mSharedPreferenceMode = sharedPreferenceMode;
        return this;
    }

    public ACRAConfiguration setSharedPreferenceName(String sharedPreferenceName) {
        this.mSharedPreferenceName = sharedPreferenceName;
        return this;
    }

    public ACRAConfiguration setSocketTimeout(Integer socketTimeout) {
        this.mSocketTimeout = socketTimeout;
        return this;
    }

    public ACRAConfiguration setLogcatFilterByPid(Boolean filterByPid) {
        this.mLogcatFilterByPid = filterByPid;
        return this;
    }

    public ACRAConfiguration setSendReportsInDevMode(Boolean sendReportsInDevMode) {
        this.mSendReportsInDevMode = sendReportsInDevMode;
        return this;
    }

    public ACRAConfiguration setSendReportsAtShutdown(Boolean sendReportsAtShutdown) {
        this.mSendReportsAtShutdown = sendReportsAtShutdown;
        return this;
    }

    public ACRAConfiguration setExcludeMatchingSharedPreferencesKeys(String[] excludeMatchingSharedPreferencesKeys) {
        this.mExcludeMatchingSharedPreferencesKeys = excludeMatchingSharedPreferencesKeys;
        return this;
    }

    public ACRAConfiguration setExcludeMatchingSettingsKeys(String[] excludeMatchingSettingsKeys) {
        this.mExcludeMatchingSettingsKeys = excludeMatchingSettingsKeys;
        return this;
    }

    public ACRAConfiguration setBuildConfigClass(Class buildConfigClass) {
        this.mBuildConfigClass = buildConfigClass;
        return this;
    }

    public ACRAConfiguration setApplicationLogFile(String applicationLogFile) {
        this.mApplicationLogFile = applicationLogFile;
        return this;
    }

    public ACRAConfiguration setApplicationLogFileLines(int applicationLogFileLines) {
        this.mApplicationLogFileLines = Integer.valueOf(applicationLogFileLines);
        return this;
    }

    public ACRAConfiguration setDisableSSLCertValidation(boolean disableSSLCertValidation) {
        this.mDisableSSLCertValidation = Boolean.valueOf(disableSSLCertValidation);
        return this;
    }

    public ACRAConfiguration setHttpMethod(HttpSender.Method httpMethod) {
        this.mHttpMethod = httpMethod;
        return this;
    }

    public ACRAConfiguration setReportType(HttpSender.Type type) {
        this.mReportType = type;
        return this;
    }

    public void setKeyStore(KeyStore keyStore) {
        this.mKeyStore = keyStore;
    }

    public ACRAConfiguration(ReportsCrashes defaults) {
        this.reflectionHelper = new ReflectionHelper();
        this.mAdditionalDropboxTags = null;
        this.mAdditionalSharedPreferences = null;
        this.mConnectionTimeout = null;
        this.mCustomReportContent = null;
        this.mDeleteUnapprovedReportsOnApplicationStart = null;
        this.mDeleteOldUnsentReportsOnApplicationStart = null;
        this.mDropboxCollectionMinutes = null;
        this.mForceCloseDialogAfterToast = null;
        this.mFormUri = null;
        this.mFormUriBasicAuthLogin = null;
        this.mFormUriBasicAuthPassword = null;
        this.mIncludeDropboxSystemTags = null;
        this.mLogcatArguments = null;
        this.mMailTo = null;
        this.mMaxNumberOfRequestRetries = null;
        this.mMode = null;
        this.mReportsCrashes = null;
        this.mReportDialogClass = null;
        this.mResDialogPositiveButtonText = null;
        this.mResDialogNegativeButtonText = null;
        this.mResDialogCommentPrompt = null;
        this.mResDialogEmailPrompt = null;
        this.mResDialogIcon = null;
        this.mResDialogOkToast = null;
        this.mResDialogText = null;
        this.mResDialogTitle = null;
        this.mResNotifIcon = null;
        this.mResNotifText = null;
        this.mResNotifTickerText = null;
        this.mResNotifTitle = null;
        this.mResToastText = null;
        this.mSharedPreferenceMode = null;
        this.mSharedPreferenceName = null;
        this.mSocketTimeout = null;
        this.mLogcatFilterByPid = null;
        this.mSendReportsInDevMode = null;
        this.mSendReportsAtShutdown = null;
        this.mExcludeMatchingSharedPreferencesKeys = null;
        this.mExcludeMatchingSettingsKeys = null;
        this.mApplicationLogFile = null;
        this.mApplicationLogFileLines = null;
        this.mDisableSSLCertValidation = null;
        this.mHttpsSocketFactoryFactoryClass = null;
        this.mHttpMethod = null;
        this.mReportType = null;
        this.mReportsCrashes = defaults;
    }

    public ACRAConfiguration() {
        this(null);
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String[] additionalDropBoxTags() {
        if (this.mAdditionalDropboxTags != null) {
            return this.mAdditionalDropboxTags;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.additionalDropBoxTags();
        }
        return new String[0];
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String[] additionalSharedPreferences() {
        if (this.mAdditionalSharedPreferences != null) {
            return this.mAdditionalSharedPreferences;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.additionalSharedPreferences();
        }
        return new String[0];
    }

    @Override // java.lang.annotation.Annotation
    public Class<? extends Annotation> annotationType() {
        return this.mReportsCrashes.annotationType();
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int connectionTimeout() {
        if (this.mConnectionTimeout != null) {
            return this.mConnectionTimeout.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.connectionTimeout();
        }
        return ACRAConstants.DEFAULT_CONNECTION_TIMEOUT;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public ReportField[] customReportContent() {
        if (this.mCustomReportContent != null) {
            return this.mCustomReportContent;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.customReportContent();
        }
        return new ReportField[0];
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean deleteUnapprovedReportsOnApplicationStart() {
        if (this.mDeleteUnapprovedReportsOnApplicationStart != null) {
            return this.mDeleteUnapprovedReportsOnApplicationStart.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.deleteUnapprovedReportsOnApplicationStart();
        }
        return true;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean deleteOldUnsentReportsOnApplicationStart() {
        if (this.mDeleteOldUnsentReportsOnApplicationStart != null) {
            return this.mDeleteOldUnsentReportsOnApplicationStart.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.deleteOldUnsentReportsOnApplicationStart();
        }
        return true;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int dropboxCollectionMinutes() {
        if (this.mDropboxCollectionMinutes != null) {
            return this.mDropboxCollectionMinutes.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.dropboxCollectionMinutes();
        }
        return 5;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean forceCloseDialogAfterToast() {
        if (this.mForceCloseDialogAfterToast != null) {
            return this.mForceCloseDialogAfterToast.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.forceCloseDialogAfterToast();
        }
        return false;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String formUri() {
        if (this.mFormUri != null) {
            return this.mFormUri;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.formUri();
        }
        return "";
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String formUriBasicAuthLogin() {
        if (this.mFormUriBasicAuthLogin != null) {
            return this.mFormUriBasicAuthLogin;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.formUriBasicAuthLogin();
        }
        return ACRAConstants.NULL_VALUE;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String formUriBasicAuthPassword() {
        if (this.mFormUriBasicAuthPassword != null) {
            return this.mFormUriBasicAuthPassword;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.formUriBasicAuthPassword();
        }
        return ACRAConstants.NULL_VALUE;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean includeDropBoxSystemTags() {
        if (this.mIncludeDropboxSystemTags != null) {
            return this.mIncludeDropboxSystemTags.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.includeDropBoxSystemTags();
        }
        return false;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String[] logcatArguments() {
        if (this.mLogcatArguments != null) {
            return this.mLogcatArguments;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.logcatArguments();
        }
        return new String[]{"-t", Integer.toString(100), "-v", "time"};
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String mailTo() {
        if (this.mMailTo != null) {
            return this.mMailTo;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.mailTo();
        }
        return "";
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int maxNumberOfRequestRetries() {
        if (this.mMaxNumberOfRequestRetries != null) {
            return this.mMaxNumberOfRequestRetries.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.maxNumberOfRequestRetries();
        }
        return 3;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public ReportingInteractionMode mode() {
        if (this.mMode != null) {
            return this.mMode;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.mode();
        }
        return ReportingInteractionMode.SILENT;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogPositiveButtonText() {
        if (this.mResDialogPositiveButtonText != null) {
            return this.mResDialogPositiveButtonText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogPositiveButtonText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogNegativeButtonText() {
        if (this.mResDialogNegativeButtonText != null) {
            return this.mResDialogNegativeButtonText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogNegativeButtonText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogCommentPrompt() {
        if (this.mResDialogCommentPrompt != null) {
            return this.mResDialogCommentPrompt.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogCommentPrompt();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogEmailPrompt() {
        if (this.mResDialogEmailPrompt != null) {
            return this.mResDialogEmailPrompt.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogEmailPrompt();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogIcon() {
        if (this.mResDialogIcon != null) {
            return this.mResDialogIcon.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogIcon();
        }
        return 17301543;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogOkToast() {
        if (this.mResDialogOkToast != null) {
            return this.mResDialogOkToast.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogOkToast();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogText() {
        if (this.mResDialogText != null) {
            return this.mResDialogText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resDialogTitle() {
        if (this.mResDialogTitle != null) {
            return this.mResDialogTitle.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resDialogTitle();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resNotifIcon() {
        if (this.mResNotifIcon != null) {
            return this.mResNotifIcon.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resNotifIcon();
        }
        return 17301624;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resNotifText() {
        if (this.mResNotifText != null) {
            return this.mResNotifText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resNotifText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resNotifTickerText() {
        if (this.mResNotifTickerText != null) {
            return this.mResNotifTickerText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resNotifTickerText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resNotifTitle() {
        if (this.mResNotifTitle != null) {
            return this.mResNotifTitle.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resNotifTitle();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int resToastText() {
        if (this.mResToastText != null) {
            return this.mResToastText.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.resToastText();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int sharedPreferencesMode() {
        if (this.mSharedPreferenceMode != null) {
            return this.mSharedPreferenceMode.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.sharedPreferencesMode();
        }
        return 0;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String sharedPreferencesName() {
        if (this.mSharedPreferenceName != null) {
            return this.mSharedPreferenceName;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.sharedPreferencesName();
        }
        return "";
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int socketTimeout() {
        if (this.mSocketTimeout != null) {
            return this.mSocketTimeout.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.socketTimeout();
        }
        return ACRAConstants.DEFAULT_SOCKET_TIMEOUT;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean logcatFilterByPid() {
        if (this.mLogcatFilterByPid != null) {
            return this.mLogcatFilterByPid.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.logcatFilterByPid();
        }
        return false;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean sendReportsInDevMode() {
        if (this.mSendReportsInDevMode != null) {
            return this.mSendReportsInDevMode.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.sendReportsInDevMode();
        }
        return true;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean sendReportsAtShutdown() {
        if (this.mSendReportsAtShutdown != null) {
            return this.mSendReportsAtShutdown.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.sendReportsAtShutdown();
        }
        return true;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String[] excludeMatchingSharedPreferencesKeys() {
        if (this.mExcludeMatchingSharedPreferencesKeys != null) {
            return this.mExcludeMatchingSharedPreferencesKeys;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.excludeMatchingSharedPreferencesKeys();
        }
        return new String[0];
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String[] excludeMatchingSettingsKeys() {
        if (this.mExcludeMatchingSettingsKeys != null) {
            return this.mExcludeMatchingSettingsKeys;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.excludeMatchingSettingsKeys();
        }
        return new String[0];
    }

    @Override // org.acra.annotation.ReportsCrashes
    public Class buildConfigClass() {
        if (this.mBuildConfigClass != null) {
            return this.mBuildConfigClass;
        }
        if (this.mReportsCrashes != null && this.mReportsCrashes.buildConfigClass() != null) {
            return this.mReportsCrashes.buildConfigClass();
        }
        return null;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String applicationLogFile() {
        if (this.mApplicationLogFile != null) {
            return this.mApplicationLogFile;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.applicationLogFile();
        }
        return "";
    }

    @Override // org.acra.annotation.ReportsCrashes
    public int applicationLogFileLines() {
        if (this.mApplicationLogFileLines != null) {
            return this.mApplicationLogFileLines.intValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.applicationLogFileLines();
        }
        return 100;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public boolean disableSSLCertValidation() {
        if (this.mDisableSSLCertValidation != null) {
            return this.mDisableSSLCertValidation.booleanValue();
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.disableSSLCertValidation();
        }
        return false;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public String httpsSocketFactoryFactoryClass() {
        if (this.mHttpsSocketFactoryFactoryClass != null) {
            return this.mHttpsSocketFactoryFactoryClass;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.httpsSocketFactoryFactoryClass();
        }
        return null;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public Class<? extends BaseCrashReportDialog> reportDialogClass() {
        if (this.mReportDialogClass != null) {
            return this.mReportDialogClass;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.reportDialogClass();
        }
        return CrashReportDialog.class;
    }

    public void setHttpsSocketFactoryFactory(HttpsSocketFactoryFactory httpsSocketFactoryFactory) {
        this.mHttpsSocketFactoryFactory = httpsSocketFactoryFactory;
    }

    public HttpsSocketFactoryFactory getHttpSocketFactoryFactory() {
        if (this.mHttpsSocketFactoryFactory != null) {
            return this.mHttpsSocketFactoryFactory;
        }
        String httpsSocketFactoryFactoryClass = httpsSocketFactoryFactoryClass();
        if (httpsSocketFactoryFactoryClass != null) {
            try {
                Object object = this.reflectionHelper.create(this.mReportsCrashes.httpsSocketFactoryFactoryClass());
                if (object instanceof HttpsSocketFactoryFactory) {
                    this.mHttpsSocketFactoryFactory = (HttpsSocketFactoryFactory) object;
                } else {
                    ACRA.log.w(ACRA.LOG_TAG, "Using default httpsSocketFactoryFactory - not a HttpSocketFactoryFactory : " + httpsSocketFactoryFactoryClass);
                }
            } catch (ReflectionException e) {
                ACRA.log.w(ACRA.LOG_TAG, "Using default httpsSocketFactoryFactory - Could not construct : " + httpsSocketFactoryFactoryClass);
            }
        }
        if (this.mHttpsSocketFactoryFactoryClass == null) {
            this.mHttpsSocketFactoryFactory = DefaultHttpsSocketFactoryFactory.INSTANCE;
        }
        return this.mHttpsSocketFactoryFactory;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public HttpSender.Method httpMethod() {
        if (this.mHttpMethod != null) {
            return this.mHttpMethod;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.httpMethod();
        }
        return HttpSender.Method.POST;
    }

    @Override // org.acra.annotation.ReportsCrashes
    public HttpSender.Type reportType() {
        if (this.mReportType != null) {
            return this.mReportType;
        }
        if (this.mReportsCrashes != null) {
            return this.mReportsCrashes.reportType();
        }
        return HttpSender.Type.FORM;
    }

    public KeyStore keyStore() {
        if (this.mKeyStore != null) {
            return this.mKeyStore;
        }
        return null;
    }

    public static boolean isNull(String aString) {
        return aString == null || ACRAConstants.NULL_VALUE.equals(aString);
    }
}
