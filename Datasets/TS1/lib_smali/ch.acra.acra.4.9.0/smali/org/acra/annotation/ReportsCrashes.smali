.class public interface abstract annotation Lorg/acra/annotation/ReportsCrashes;
.super Ljava/lang/Object;
.source "ReportsCrashes.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lorg/acra/annotation/ReportsCrashes;
        additionalDropBoxTags = {}
        additionalSharedPreferences = {}
        alsoReportToAndroidFramework = false
        applicationLogFile = ""
        applicationLogFileLines = 0x64
        buildConfigClass = Ljava/lang/Object;
        certificatePath = ""
        certificateType = "X.509"
        connectionTimeout = 0x1388
        customReportContent = {}
        deleteOldUnsentReportsOnApplicationStart = true
        deleteUnapprovedReportsOnApplicationStart = true
        dropboxCollectionMinutes = 0x5
        excludeMatchingSettingsKeys = {}
        excludeMatchingSharedPreferencesKeys = {}
        formUri = ""
        formUriBasicAuthLogin = "ACRA-NULL-STRING"
        formUriBasicAuthPassword = "ACRA-NULL-STRING"
        httpMethod = .enum Lorg/acra/sender/HttpSender$Method;->POST:Lorg/acra/sender/HttpSender$Method;
        includeDropBoxSystemTags = false
        keyStoreFactoryClass = Lorg/acra/security/NoKeyStoreFactory;
        logcatArguments = {
            "-t",
            "100",
            "-v",
            "time"
        }
        logcatFilterByPid = false
        mailTo = ""
        mode = .enum Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;
        reportDialogClass = Lorg/acra/dialog/CrashReportDialog;
        reportPrimerClass = Lorg/acra/builder/NoOpReportPrimer;
        reportSenderFactoryClasses = {
            Lorg/acra/sender/DefaultReportSenderFactory;
        }
        reportType = .enum Lorg/acra/sender/HttpSender$Type;->FORM:Lorg/acra/sender/HttpSender$Type;
        resCertificate = 0x0
        resDialogCommentPrompt = 0x0
        resDialogEmailPrompt = 0x0
        resDialogIcon = 0x1080027
        resDialogNegativeButtonText = 0x1040000
        resDialogOkToast = 0x0
        resDialogPositiveButtonText = 0x104000a
        resDialogText = 0x0
        resDialogTheme = 0x0
        resDialogTitle = 0x0
        resNotifIcon = 0x1080078
        resNotifText = 0x0
        resNotifTickerText = 0x0
        resNotifTitle = 0x0
        resToastText = 0x0
        sendReportsAtShutdown = true
        sendReportsInDevMode = true
        sharedPreferencesMode = 0x0
        sharedPreferencesName = ""
        socketTimeout = 0x4e20
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Inherited;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract additionalDropBoxTags()[Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract additionalSharedPreferences()[Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract alsoReportToAndroidFramework()Z
.end method

.method public abstract applicationLogFile()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract applicationLogFileLines()I
.end method

.method public abstract buildConfigClass()Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract certificatePath()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract certificateType()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract connectionTimeout()I
.end method

.method public abstract customReportContent()[Lorg/acra/ReportField;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract deleteOldUnsentReportsOnApplicationStart()Z
.end method

.method public abstract deleteUnapprovedReportsOnApplicationStart()Z
.end method

.method public abstract dropboxCollectionMinutes()I
.end method

.method public abstract excludeMatchingSettingsKeys()[Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract formUri()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract formUriBasicAuthLogin()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract formUriBasicAuthPassword()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract httpMethod()Lorg/acra/sender/HttpSender$Method;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract includeDropBoxSystemTags()Z
.end method

.method public abstract keyStoreFactoryClass()Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/security/KeyStoreFactory;",
            ">;"
        }
    .end annotation
.end method

.method public abstract logcatArguments()[Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract logcatFilterByPid()Z
.end method

.method public abstract mailTo()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract mode()Lorg/acra/ReportingInteractionMode;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract reportDialogClass()Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/dialog/BaseCrashReportDialog;",
            ">;"
        }
    .end annotation
.end method

.method public abstract reportPrimerClass()Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/builder/ReportPrimer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract reportSenderFactoryClasses()[Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;"
        }
    .end annotation
.end method

.method public abstract reportType()Lorg/acra/sender/HttpSender$Type;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract resCertificate()I
    .annotation build Landroid/support/annotation/RawRes;
    .end annotation
.end method

.method public abstract resDialogCommentPrompt()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogEmailPrompt()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogIcon()I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end method

.method public abstract resDialogNegativeButtonText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogOkToast()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogPositiveButtonText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resDialogTheme()I
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation
.end method

.method public abstract resDialogTitle()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resNotifIcon()I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end method

.method public abstract resNotifText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resNotifTickerText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resNotifTitle()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract resToastText()I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end method

.method public abstract sendReportsAtShutdown()Z
.end method

.method public abstract sendReportsInDevMode()Z
.end method

.method public abstract sharedPreferencesMode()I
.end method

.method public abstract sharedPreferencesName()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract socketTimeout()I
.end method
