package org.acra.annotation;

import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.RawRes;
import android.support.annotation.StringRes;
import android.support.annotation.StyleRes;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import org.acra.ReportField;
import org.acra.ReportingInteractionMode;
import org.acra.builder.NoOpReportPrimer;
import org.acra.builder.ReportPrimer;
import org.acra.dialog.BaseCrashReportDialog;
import org.acra.dialog.CrashReportDialog;
import org.acra.security.KeyStoreFactory;
import org.acra.security.NoKeyStoreFactory;
import org.acra.sender.DefaultReportSenderFactory;
import org.acra.sender.HttpSender;
import org.acra.sender.ReportSenderFactory;

@Target({ElementType.TYPE})
@Inherited
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/annotation/ReportsCrashes.class */
public @interface ReportsCrashes {
    @NonNull
    String formUri() default "";

    @NonNull
    ReportingInteractionMode mode() default ReportingInteractionMode.SILENT;

    @StringRes
    int resDialogPositiveButtonText() default 17039370;

    @StringRes
    int resDialogNegativeButtonText() default 17039360;

    @StringRes
    int resDialogCommentPrompt() default 0;

    @StringRes
    int resDialogEmailPrompt() default 0;

    @DrawableRes
    int resDialogIcon() default 17301543;

    @StringRes
    int resDialogOkToast() default 0;

    @StringRes
    int resDialogText() default 0;

    @StringRes
    int resDialogTitle() default 0;

    @StyleRes
    int resDialogTheme() default 0;

    @DrawableRes
    int resNotifIcon() default 17301624;

    @StringRes
    int resNotifText() default 0;

    @StringRes
    int resNotifTickerText() default 0;

    @StringRes
    int resNotifTitle() default 0;

    @StringRes
    int resToastText() default 0;

    @NonNull
    String sharedPreferencesName() default "";

    int sharedPreferencesMode() default 0;

    boolean includeDropBoxSystemTags() default false;

    @NonNull
    String[] additionalDropBoxTags() default {};

    int dropboxCollectionMinutes() default 5;

    @NonNull
    String[] logcatArguments() default {"-t", "100", "-v", "time"};

    @NonNull
    String formUriBasicAuthLogin() default "ACRA-NULL-STRING";

    @NonNull
    String formUriBasicAuthPassword() default "ACRA-NULL-STRING";

    @NonNull
    ReportField[] customReportContent() default {};

    @NonNull
    String mailTo() default "";

    boolean deleteUnapprovedReportsOnApplicationStart() default true;

    boolean deleteOldUnsentReportsOnApplicationStart() default true;

    int connectionTimeout() default 5000;

    int socketTimeout() default 20000;

    boolean alsoReportToAndroidFramework() default false;

    @NonNull
    String[] additionalSharedPreferences() default {};

    boolean logcatFilterByPid() default false;

    boolean sendReportsInDevMode() default true;

    boolean sendReportsAtShutdown() default true;

    @NonNull
    String[] excludeMatchingSharedPreferencesKeys() default {};

    @NonNull
    String[] excludeMatchingSettingsKeys() default {};

    @NonNull
    Class buildConfigClass() default Object.class;

    @NonNull
    Class<? extends ReportSenderFactory>[] reportSenderFactoryClasses() default {DefaultReportSenderFactory.class};

    @NonNull
    String applicationLogFile() default "";

    int applicationLogFileLines() default 100;

    @NonNull
    Class<? extends BaseCrashReportDialog> reportDialogClass() default CrashReportDialog.class;

    @NonNull
    Class<? extends ReportPrimer> reportPrimerClass() default NoOpReportPrimer.class;

    @NonNull
    HttpSender.Method httpMethod() default HttpSender.Method.POST;

    @NonNull
    HttpSender.Type reportType() default HttpSender.Type.FORM;

    @NonNull
    Class<? extends KeyStoreFactory> keyStoreFactoryClass() default NoKeyStoreFactory.class;

    @NonNull
    String certificatePath() default "";

    @RawRes
    int resCertificate() default 0;

    @NonNull
    String certificateType() default "X.509";
}
