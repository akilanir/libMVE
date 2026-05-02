package org.acra.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.acra.BaseCrashReportDialog;
import org.acra.CrashReportDialog;
import org.acra.ReportField;
import org.acra.ReportingInteractionMode;
import org.acra.sender.HttpSender;

@Target({ElementType.TYPE})
@Inherited
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: acra-4.6.2.jar:org/acra/annotation/ReportsCrashes.class */
public @interface ReportsCrashes {
    String formUri() default "";

    ReportingInteractionMode mode() default ReportingInteractionMode.SILENT;

    int resDialogPositiveButtonText() default 17039370;

    int resDialogNegativeButtonText() default 17039360;

    int resDialogCommentPrompt() default 0;

    int resDialogEmailPrompt() default 0;

    int resDialogIcon() default 17301543;

    int resDialogOkToast() default 0;

    int resDialogText() default 0;

    int resDialogTitle() default 0;

    int resNotifIcon() default 17301624;

    int resNotifText() default 0;

    int resNotifTickerText() default 0;

    int resNotifTitle() default 0;

    int resToastText() default 0;

    String sharedPreferencesName() default "";

    int sharedPreferencesMode() default 0;

    boolean includeDropBoxSystemTags() default false;

    String[] additionalDropBoxTags() default {};

    int dropboxCollectionMinutes() default 5;

    String[] logcatArguments() default {"-t", "100", "-v", "time"};

    String formUriBasicAuthLogin() default "ACRA-NULL-STRING";

    String formUriBasicAuthPassword() default "ACRA-NULL-STRING";

    ReportField[] customReportContent() default {};

    String mailTo() default "";

    boolean deleteUnapprovedReportsOnApplicationStart() default true;

    boolean deleteOldUnsentReportsOnApplicationStart() default true;

    int connectionTimeout() default 3000;

    int socketTimeout() default 5000;

    int maxNumberOfRequestRetries() default 3;

    boolean forceCloseDialogAfterToast() default false;

    String[] additionalSharedPreferences() default {};

    boolean logcatFilterByPid() default false;

    boolean sendReportsInDevMode() default true;

    boolean sendReportsAtShutdown() default true;

    String[] excludeMatchingSharedPreferencesKeys() default {};

    String[] excludeMatchingSettingsKeys() default {};

    Class buildConfigClass() default Object.class;

    String applicationLogFile() default "";

    int applicationLogFileLines() default 100;

    boolean disableSSLCertValidation() default false;

    String httpsSocketFactoryFactoryClass() default "org.acra.util.DefaultHttpsSocketFactoryFactory";

    Class<? extends BaseCrashReportDialog> reportDialogClass() default CrashReportDialog.class;

    HttpSender.Method httpMethod() default HttpSender.Method.POST;

    HttpSender.Type reportType() default HttpSender.Type.FORM;
}
