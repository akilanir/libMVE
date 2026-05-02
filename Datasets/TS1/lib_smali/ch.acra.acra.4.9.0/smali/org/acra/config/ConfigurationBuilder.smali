.class public final Lorg/acra/config/ConfigurationBuilder;
.super Ljava/lang/Object;
.source "ConfigurationBuilder.java"


# instance fields
.field private additionalDropBoxTags:[Ljava/lang/String;

.field private additionalSharedPreferences:[Ljava/lang/String;

.field private alsoReportToAndroidFramework:Ljava/lang/Boolean;

.field private final annotationType:Ljava/lang/Class;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation
.end field

.field private applicationLogFile:Ljava/lang/String;

.field private applicationLogFileLines:Ljava/lang/Integer;

.field private buildConfigClass:Ljava/lang/Class;

.field private certificatePath:Ljava/lang/String;

.field private certificateType:Ljava/lang/String;

.field private connectionTimeout:Ljava/lang/Integer;

.field private customReportContent:[Lorg/acra/ReportField;

.field private deleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

.field private deleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

.field private dropboxCollectionMinutes:Ljava/lang/Integer;

.field private excludeMatchingSettingsKeys:[Ljava/lang/String;

.field private excludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

.field private formUri:Ljava/lang/String;

.field private formUriBasicAuthLogin:Ljava/lang/String;

.field private formUriBasicAuthPassword:Ljava/lang/String;

.field private final httpHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private httpMethod:Lorg/acra/sender/HttpSender$Method;

.field private includeDropBoxSystemTags:Ljava/lang/Boolean;

.field private keyStoreFactoryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/security/KeyStoreFactory;",
            ">;"
        }
    .end annotation
.end field

.field private logcatArguments:[Ljava/lang/String;

.field private logcatFilterByPid:Ljava/lang/Boolean;

.field private mailTo:Ljava/lang/String;

.field private final reportContentChanges:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/acra/ReportField;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private reportDialogClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/dialog/BaseCrashReportDialog;",
            ">;"
        }
    .end annotation
.end field

.field private reportPrimerClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/builder/ReportPrimer;",
            ">;"
        }
    .end annotation
.end field

.field private reportSenderFactoryClasses:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;"
        }
    .end annotation
.end field

.field private reportType:Lorg/acra/sender/HttpSender$Type;

.field private reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

.field private resCertificate:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/RawRes;
    .end annotation
.end field

.field private resDialogCommentPrompt:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogEmailPrompt:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogIcon:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field private resDialogNegativeButtonText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogOkToast:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogPositiveButtonText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resDialogTheme:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation
.end field

.field private resDialogTitle:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resNotifIcon:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field private resNotifText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resNotifTickerText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resNotifTitle:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private resToastText:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private sendReportsInDevMode:Ljava/lang/Boolean;

.field private sharedPreferencesMode:Ljava/lang/Integer;

.field private sharedPreferencesName:Ljava/lang/String;

.field private socketTimeout:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 5
    .param p1, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v1, Ljava/util/EnumMap;

    const-class v2, Lorg/acra/ReportField;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportContentChanges:Ljava/util/Map;

    .line 114
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->httpHeaders:Ljava/util/Map;

    .line 131
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/acra/annotation/ReportsCrashes;

    .line 133
    .local v0, "annotationConfig":Lorg/acra/annotation/ReportsCrashes;
    if-eqz v0, :cond_1b0

    .line 134
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->annotationType()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->annotationType:Ljava/lang/Class;

    .line 136
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->additionalDropBoxTags()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->additionalDropBoxTags:[Ljava/lang/String;

    .line 137
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->additionalSharedPreferences()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->additionalSharedPreferences:[Ljava/lang/String;

    .line 138
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->connectionTimeout()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->connectionTimeout:Ljava/lang/Integer;

    .line 139
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->customReportContent:[Lorg/acra/ReportField;

    .line 140
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->deleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 141
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->deleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 142
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->dropboxCollectionMinutes()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->dropboxCollectionMinutes:Ljava/lang/Integer;

    .line 143
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->alsoReportToAndroidFramework()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->alsoReportToAndroidFramework:Ljava/lang/Boolean;

    .line 144
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->formUri:Ljava/lang/String;

    .line 145
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthLogin:Ljava/lang/String;

    .line 146
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthPassword:Ljava/lang/String;

    .line 147
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->includeDropBoxSystemTags()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->includeDropBoxSystemTags:Ljava/lang/Boolean;

    .line 148
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->logcatArguments()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->logcatArguments:[Ljava/lang/String;

    .line 149
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    .line 150
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    .line 151
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogIcon()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogIcon:Ljava/lang/Integer;

    .line 152
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogPositiveButtonText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogPositiveButtonText:Ljava/lang/Integer;

    .line 153
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogNegativeButtonText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogNegativeButtonText:Ljava/lang/Integer;

    .line 154
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogCommentPrompt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogCommentPrompt:Ljava/lang/Integer;

    .line 155
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogEmailPrompt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogEmailPrompt:Ljava/lang/Integer;

    .line 156
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogOkToast()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogOkToast:Ljava/lang/Integer;

    .line 157
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogText:Ljava/lang/Integer;

    .line 158
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogTitle()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTitle:Ljava/lang/Integer;

    .line 159
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogTheme()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTheme:Ljava/lang/Integer;

    .line 160
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifIcon()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifIcon:Ljava/lang/Integer;

    .line 161
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifText:Ljava/lang/Integer;

    .line 162
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText:Ljava/lang/Integer;

    .line 163
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle:Ljava/lang/Integer;

    .line 164
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resToastText()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resToastText:Ljava/lang/Integer;

    .line 165
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesMode:Ljava/lang/Integer;

    .line 166
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesName:Ljava/lang/String;

    .line 167
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->socketTimeout()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->socketTimeout:Ljava/lang/Integer;

    .line 168
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->logcatFilterByPid()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->logcatFilterByPid:Ljava/lang/Boolean;

    .line 169
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sendReportsInDevMode()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->sendReportsInDevMode:Ljava/lang/Boolean;

    .line 170
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 171
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->excludeMatchingSettingsKeys()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 172
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->buildConfigClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->buildConfigClass:Ljava/lang/Class;

    .line 173
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->applicationLogFile()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFile:Ljava/lang/String;

    .line 174
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->applicationLogFileLines()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFileLines:Ljava/lang/Integer;

    .line 175
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportDialogClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass:Ljava/lang/Class;

    .line 176
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportPrimerClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportPrimerClass:Ljava/lang/Class;

    .line 177
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->httpMethod()Lorg/acra/sender/HttpSender$Method;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 178
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportType:Lorg/acra/sender/HttpSender$Type;

    .line 179
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportSenderFactoryClasses()[Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->reportSenderFactoryClasses:[Ljava/lang/Class;

    .line 180
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->keyStoreFactoryClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->keyStoreFactoryClass:Ljava/lang/Class;

    .line 181
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resCertificate()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->resCertificate:Ljava/lang/Integer;

    .line 182
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->certificatePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->certificatePath:Ljava/lang/String;

    .line 183
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->certificateType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->certificateType:Ljava/lang/String;

    .line 187
    :goto_1af
    return-void

    .line 185
    :cond_1b0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/acra/config/ConfigurationBuilder;->annotationType:Ljava/lang/Class;

    goto :goto_1af
.end method


# virtual methods
.method additionalDropBoxTags()[Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 802
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->additionalDropBoxTags:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 803
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->additionalDropBoxTags:[Ljava/lang/String;

    .line 805
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method additionalSharedPreferences()[Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 810
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->additionalSharedPreferences:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 811
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->additionalSharedPreferences:[Ljava/lang/String;

    .line 813
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method alsoReportToAndroidFramework()Z
    .registers 2

    .prologue
    .line 878
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->alsoReportToAndroidFramework:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 879
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->alsoReportToAndroidFramework:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 881
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method annotationType()Ljava/lang/Class;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 821
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->annotationType:Ljava/lang/Class;

    return-object v0
.end method

.method applicationLogFile()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1118
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFile:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1119
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFile:Ljava/lang/String;

    .line 1121
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method applicationLogFileLines()I
    .registers 2

    .prologue
    .line 1125
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFileLines:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1126
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFileLines:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1128
    :goto_a
    return v0

    :cond_b
    const/16 v0, 0x64

    goto :goto_a
.end method

.method public build()Lorg/acra/config/ACRAConfiguration;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/config/ACRAConfigurationException;
        }
    .end annotation

    .prologue
    .line 201
    sget-object v0, Lorg/acra/config/ConfigurationBuilder$1;->$SwitchMap$org$acra$ReportingInteractionMode:[I

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode()Lorg/acra/ReportingInteractionMode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ReportingInteractionMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_72

    .line 224
    :cond_f
    new-instance v0, Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, p0}, Lorg/acra/config/ACRAConfiguration;-><init>(Lorg/acra/config/ConfigurationBuilder;)V

    return-object v0

    .line 203
    :pswitch_15
    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resToastText()I

    move-result v0

    if-nez v0, :cond_f

    .line 204
    new-instance v0, Lorg/acra/config/ACRAConfigurationException;

    const-string v1, "TOAST mode: you have to define the resToastText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/config/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :pswitch_23
    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText()I

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle()I

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resNotifText()I

    move-result v0

    if-nez v0, :cond_3d

    .line 209
    :cond_35
    new-instance v0, Lorg/acra/config/ACRAConfigurationException;

    const-string v1, "NOTIFICATION mode: you have to define at least the resNotifTickerText, resNotifTitle, resNotifText parameters in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/config/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_3d
    const-class v0, Lorg/acra/dialog/CrashReportDialog;

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resDialogText()I

    move-result v0

    if-nez v0, :cond_f

    .line 212
    new-instance v0, Lorg/acra/config/ACRAConfigurationException;

    const-string v1, "NOTIFICATION mode: using the (default) CrashReportDialog requires you have to define the resDialogText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/config/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    :pswitch_57
    const-class v0, Lorg/acra/dialog/CrashReportDialog;

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lorg/acra/config/ConfigurationBuilder;->resDialogText()I

    move-result v0

    if-nez v0, :cond_f

    .line 217
    new-instance v0, Lorg/acra/config/ACRAConfigurationException;

    const-string v1, "DIALOG mode: using the (default) CrashReportDialog requires you to define the resDialogText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/config/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 201
    nop

    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_15
        :pswitch_23
        :pswitch_57
    .end packed-switch
.end method

.method buildConfigClass()Ljava/lang/Class;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1110
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->buildConfigClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1111
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->buildConfigClass:Ljava/lang/Class;

    .line 1113
    :goto_6
    return-object v0

    :cond_7
    const-class v0, Ljava/lang/Object;

    goto :goto_6
.end method

.method certificatePath()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1190
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->certificatePath:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1191
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->certificatePath:Ljava/lang/String;

    .line 1193
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method certificateType()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1198
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->certificateType:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1199
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->certificateType:Ljava/lang/String;

    .line 1201
    :goto_6
    return-object v0

    :cond_7
    const-string v0, "X.509"

    goto :goto_6
.end method

.method connectionTimeout()I
    .registers 2

    .prologue
    .line 825
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->connectionTimeout:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 826
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->connectionTimeout:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 828
    :goto_a
    return v0

    :cond_b
    const/16 v0, 0x1388

    goto :goto_a
.end method

.method deleteOldUnsentReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 864
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 865
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 867
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method

.method deleteUnapprovedReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 857
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 858
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 860
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method

.method dropboxCollectionMinutes()I
    .registers 2

    .prologue
    .line 871
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->dropboxCollectionMinutes:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 872
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->dropboxCollectionMinutes:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 874
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x5

    goto :goto_a
.end method

.method excludeMatchingSettingsKeys()[Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1098
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSettingsKeys:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1099
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 1101
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1090
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1091
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 1093
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method formUri()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 886
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUri:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 887
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUri:Ljava/lang/String;

    .line 889
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method formUriBasicAuthLogin()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 894
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthLogin:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 895
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthLogin:Ljava/lang/String;

    .line 897
    :goto_6
    return-object v0

    :cond_7
    const-string v0, "ACRA-NULL-STRING"

    goto :goto_6
.end method

.method formUriBasicAuthPassword()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 902
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthPassword:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 903
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthPassword:Ljava/lang/String;

    .line 905
    :goto_6
    return-object v0

    :cond_7
    const-string v0, "ACRA-NULL-STRING"

    goto :goto_6
.end method

.method httpHeaders()Ljava/util/Map;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1206
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->httpHeaders:Ljava/util/Map;

    return-object v0
.end method

.method httpMethod()Lorg/acra/sender/HttpSender$Method;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1149
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    if-eqz v0, :cond_7

    .line 1150
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 1152
    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/acra/sender/HttpSender$Method;->POST:Lorg/acra/sender/HttpSender$Method;

    goto :goto_6
.end method

.method includeDropBoxSystemTags()Z
    .registers 2

    .prologue
    .line 909
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->includeDropBoxSystemTags:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 910
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->includeDropBoxSystemTags:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 912
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method keyStoreFactoryClass()Ljava/lang/Class;
    .registers 2
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

    .prologue
    .line 1174
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->keyStoreFactoryClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1175
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->keyStoreFactoryClass:Ljava/lang/Class;

    .line 1177
    :goto_6
    return-object v0

    :cond_7
    const-class v0, Lorg/acra/security/NoKeyStoreFactory;

    goto :goto_6
.end method

.method logcatArguments()[Ljava/lang/String;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 917
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->logcatArguments:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 918
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->logcatArguments:[Ljava/lang/String;

    .line 920
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "-t"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const/16 v2, 0x64

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "-v"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "time"

    aput-object v2, v0, v1

    goto :goto_6
.end method

.method logcatFilterByPid()Z
    .registers 2

    .prologue
    .line 1075
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->logcatFilterByPid:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1076
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->logcatFilterByPid:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1078
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method mailTo()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 925
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 926
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    .line 928
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method reportContent()Ljava/util/Set;
    .registers 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/acra/ReportField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 833
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 834
    .local v1, "reportContent":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    iget-object v2, p0, Lorg/acra/config/ConfigurationBuilder;->customReportContent:[Lorg/acra/ReportField;

    if-eqz v2, :cond_4e

    iget-object v2, p0, Lorg/acra/config/ConfigurationBuilder;->customReportContent:[Lorg/acra/ReportField;

    array-length v2, v2

    if-eqz v2, :cond_4e

    .line 835
    sget-boolean v2, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v2, :cond_1b

    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using custom Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    :cond_1b
    iget-object v2, p0, Lorg/acra/config/ConfigurationBuilder;->customReportContent:[Lorg/acra/ReportField;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 846
    :goto_24
    iget-object v2, p0, Lorg/acra/config/ConfigurationBuilder;->reportContentChanges:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_92

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 847
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/Boolean;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_8a

    .line 848
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    .line 837
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/Boolean;>;"
    :cond_4e
    iget-object v2, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    if-eqz v2, :cond_5c

    const-string v2, ""

    iget-object v3, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_73

    .line 838
    :cond_5c
    sget-boolean v2, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v2, :cond_69

    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_69
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_24

    .line 841
    :cond_73
    sget-boolean v2, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v2, :cond_80

    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Mail Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 842
    :cond_80
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_MAIL_REPORT_FIELDS:[Lorg/acra/ReportField;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_24

    .line 850
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/Boolean;>;"
    :cond_8a
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_2e

    .line 853
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/Boolean;>;"
    :cond_92
    return-object v1
.end method

.method reportDialogClass()Ljava/lang/Class;
    .registers 2
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

    .prologue
    .line 1133
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1134
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass:Ljava/lang/Class;

    .line 1136
    :goto_6
    return-object v0

    :cond_7
    const-class v0, Lorg/acra/dialog/CrashReportDialog;

    goto :goto_6
.end method

.method reportPrimerClass()Ljava/lang/Class;
    .registers 2
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

    .prologue
    .line 1141
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportPrimerClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1142
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportPrimerClass:Ljava/lang/Class;

    .line 1144
    :goto_6
    return-object v0

    :cond_7
    const-class v0, Lorg/acra/builder/NoOpReportPrimer;

    goto :goto_6
.end method

.method reportSenderFactoryClasses()[Ljava/lang/Class;
    .registers 4
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

    .prologue
    .line 1165
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportSenderFactoryClasses:[Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1166
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportSenderFactoryClasses:[Ljava/lang/Class;

    .line 1169
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lorg/acra/sender/DefaultReportSenderFactory;

    aput-object v2, v0, v1

    goto :goto_6
.end method

.method reportType()Lorg/acra/sender/HttpSender$Type;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1157
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportType:Lorg/acra/sender/HttpSender$Type;

    if-eqz v0, :cond_7

    .line 1158
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportType:Lorg/acra/sender/HttpSender$Type;

    .line 1160
    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/acra/sender/HttpSender$Type;->FORM:Lorg/acra/sender/HttpSender$Type;

    goto :goto_6
.end method

.method reportingInteractionMode()Lorg/acra/ReportingInteractionMode;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 933
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    if-eqz v0, :cond_7

    .line 934
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    .line 936
    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    goto :goto_6
.end method

.method resCertificate()I
    .registers 2
    .annotation build Landroid/support/annotation/RawRes;
    .end annotation

    .prologue
    .line 1182
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resCertificate:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1183
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resCertificate:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1185
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resDialogCommentPrompt()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 957
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogCommentPrompt:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 958
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogCommentPrompt:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 960
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resDialogEmailPrompt()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 965
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogEmailPrompt:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 966
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogEmailPrompt:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 968
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resDialogIcon()I
    .registers 2
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 973
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogIcon:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 974
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogIcon:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 976
    :goto_a
    return v0

    :cond_b
    const v0, 0x1080027

    goto :goto_a
.end method

.method resDialogNegativeButtonText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 949
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogNegativeButtonText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 950
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogNegativeButtonText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 952
    :goto_a
    return v0

    :cond_b
    const/high16 v0, 0x1040000

    goto :goto_a
.end method

.method resDialogOkToast()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 981
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogOkToast:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 982
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogOkToast:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 984
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogPositiveButtonText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 941
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogPositiveButtonText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 942
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogPositiveButtonText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 944
    :goto_a
    return v0

    :cond_b
    const v0, 0x104000a

    goto :goto_a
.end method

.method resDialogText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 989
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 990
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 992
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resDialogTheme()I
    .registers 2
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation

    .prologue
    .line 1005
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTheme:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1006
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTheme:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1008
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resDialogTitle()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 997
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTitle:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 998
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTitle:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1000
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resNotifIcon()I
    .registers 2
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 1013
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifIcon:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1014
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifIcon:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1016
    :goto_a
    return v0

    :cond_b
    const v0, 0x1080078

    goto :goto_a
.end method

.method resNotifText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 1021
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1022
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1024
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resNotifTickerText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 1029
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1030
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1032
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resNotifTitle()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 1037
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1038
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1040
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method resToastText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 1045
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resToastText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1046
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resToastText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1048
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method sendReportsInDevMode()Z
    .registers 2

    .prologue
    .line 1082
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sendReportsInDevMode:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1083
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sendReportsInDevMode:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1085
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public varargs setAdditionalDropboxTags([Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "additionalDropboxTags"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 247
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->additionalDropBoxTags:[Ljava/lang/String;

    .line 248
    return-object p0
.end method

.method public varargs setAdditionalSharedPreferences([Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "additionalSharedPreferences"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 257
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->additionalSharedPreferences:[Ljava/lang/String;

    .line 258
    return-object p0
.end method

.method public setAlsoReportToAndroidFramework(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "alsoReportToAndroidFramework"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 332
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->alsoReportToAndroidFramework:Ljava/lang/Boolean;

    .line 333
    return-object p0
.end method

.method public setApplicationLogFile(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "applicationLogFile"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 707
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFile:Ljava/lang/String;

    .line 708
    return-object p0
.end method

.method public setApplicationLogFileLines(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "applicationLogFileLines"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 719
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->applicationLogFileLines:Ljava/lang/Integer;

    .line 720
    return-object p0
.end method

.method public setBuildConfigClass(Ljava/lang/Class;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "buildConfigClass"    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 696
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->buildConfigClass:Ljava/lang/Class;

    .line 697
    return-object p0
.end method

.method public setCertificate(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resCertificate"    # I
        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 760
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resCertificate:Ljava/lang/Integer;

    .line 761
    return-object p0
.end method

.method public setCertificate(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "certificatePath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 770
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->certificatePath:Ljava/lang/String;

    .line 771
    return-object p0
.end method

.method public setCertificateType(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 780
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->certificateType:Ljava/lang/String;

    .line 781
    return-object p0
.end method

.method public setConnectionTimeout(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "connectionTimeout"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 267
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->connectionTimeout:Ljava/lang/Integer;

    .line 268
    return-object p0
.end method

.method public varargs setCustomReportContent([Lorg/acra/ReportField;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "customReportContent"    # [Lorg/acra/ReportField;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 277
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->customReportContent:[Lorg/acra/ReportField;

    .line 278
    return-object p0
.end method

.method public setDeleteOldUnsentReportsOnApplicationStart(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "deleteOldUnsentReportsOnApplicationStart"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 310
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 311
    return-object p0
.end method

.method public setDeleteUnapprovedReportsOnApplicationStart(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "deleteUnapprovedReportsOnApplicationStart"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 300
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->deleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 301
    return-object p0
.end method

.method public setDropboxCollectionMinutes(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "dropboxCollectionMinutes"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 320
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->dropboxCollectionMinutes:Ljava/lang/Integer;

    .line 321
    return-object p0
.end method

.method public varargs setExcludeMatchingSettingsKeys([Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "excludeMatchingSettingsKeys"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 690
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 691
    return-object p0
.end method

.method public varargs setExcludeMatchingSharedPreferencesKeys([Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "excludeMatchingSharedPreferencesKeys"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 678
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 679
    return-object p0
.end method

.method public setFormUri(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "formUri"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 344
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->formUri:Ljava/lang/String;

    .line 345
    return-object p0
.end method

.method public setFormUriBasicAuthLogin(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "formUriBasicAuthLogin"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 354
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthLogin:Ljava/lang/String;

    .line 355
    return-object p0
.end method

.method public setFormUriBasicAuthPassword(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "formUriBasicAuthPassword"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 364
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthPassword:Ljava/lang/String;

    .line 365
    return-object p0
.end method

.method public setHttpHeaders(Ljava/util/Map;)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/acra/config/ConfigurationBuilder;"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->httpHeaders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 237
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->httpHeaders:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 238
    return-object p0
.end method

.method public setHttpMethod(Lorg/acra/sender/HttpSender$Method;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "httpMethod"    # Lorg/acra/sender/HttpSender$Method;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 729
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 730
    return-object p0
.end method

.method public setIncludeDropboxSystemTags(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "includeDropboxSystemTags"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 374
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->includeDropBoxSystemTags:Ljava/lang/Boolean;

    .line 375
    return-object p0
.end method

.method public setKeyStoreFactoryClass(Ljava/lang/Class;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/security/KeyStoreFactory;",
            ">;)",
            "Lorg/acra/config/ConfigurationBuilder;"
        }
    .end annotation

    .prologue
    .line 750
    .local p1, "keyStoreFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/security/KeyStoreFactory;>;"
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->keyStoreFactoryClass:Ljava/lang/Class;

    .line 751
    return-object p0
.end method

.method public varargs setLogcatArguments([Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "logcatArguments"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 384
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->logcatArguments:[Ljava/lang/String;

    .line 385
    return-object p0
.end method

.method public setLogcatFilterByPid(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "filterByPid"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 645
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->logcatFilterByPid:Ljava/lang/Boolean;

    .line 646
    return-object p0
.end method

.method public setMailTo(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "mailTo"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 396
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->mailTo:Ljava/lang/String;

    .line 397
    return-object p0
.end method

.method public setMode(Lorg/acra/ReportingInteractionMode;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "mode"    # Lorg/acra/ReportingInteractionMode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 409
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    .line 410
    return-object p0
.end method

.method public setReportDialogClass(Ljava/lang/Class;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/dialog/BaseCrashReportDialog;",
            ">;)",
            "Lorg/acra/config/ConfigurationBuilder;"
        }
    .end annotation

    .prologue
    .line 439
    .local p1, "reportDialogClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/dialog/BaseCrashReportDialog;>;"
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass:Ljava/lang/Class;

    .line 440
    return-object p0
.end method

.method public setReportField(Lorg/acra/ReportField;Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 5
    .param p1, "field"    # Lorg/acra/ReportField;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "enable"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->reportContentChanges:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    return-object p0
.end method

.method public setReportPrimerClass(Ljava/lang/Class;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/builder/ReportPrimer;",
            ">;)",
            "Lorg/acra/config/ConfigurationBuilder;"
        }
    .end annotation

    .prologue
    .line 793
    .local p1, "reportPrimerClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/builder/ReportPrimer;>;"
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportPrimerClass:Ljava/lang/Class;

    .line 794
    return-object p0
.end method

.method public final varargs setReportSenderFactoryClasses([Ljava/lang/Class;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1    # [Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;)",
            "Lorg/acra/config/ConfigurationBuilder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 787
    .local p1, "reportSenderFactoryClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<+Lorg/acra/sender/ReportSenderFactory;>;"
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportSenderFactoryClasses:[Ljava/lang/Class;

    .line 788
    return-object p0
.end method

.method public setReportType(Lorg/acra/sender/HttpSender$Type;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "type"    # Lorg/acra/sender/HttpSender$Type;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 740
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportType:Lorg/acra/sender/HttpSender$Type;

    .line 741
    return-object p0
.end method

.method public setReportingInteractionMode(Lorg/acra/ReportingInteractionMode;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "mode"    # Lorg/acra/ReportingInteractionMode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 421
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    .line 422
    return-object p0
.end method

.method public setResDialogCommentPrompt(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 453
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogCommentPrompt:Ljava/lang/Integer;

    .line 454
    return-object p0
.end method

.method public setResDialogEmailPrompt(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 467
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogEmailPrompt:Ljava/lang/Integer;

    .line 468
    return-object p0
.end method

.method public setResDialogIcon(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 481
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogIcon:Ljava/lang/Integer;

    .line 482
    return-object p0
.end method

.method public setResDialogNegativeButtonText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 433
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogNegativeButtonText:Ljava/lang/Integer;

    .line 434
    return-object p0
.end method

.method public setResDialogOkToast(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 495
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogOkToast:Ljava/lang/Integer;

    .line 496
    return-object p0
.end method

.method public setResDialogPositiveButtonText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 427
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogPositiveButtonText:Ljava/lang/Integer;

    .line 428
    return-object p0
.end method

.method public setResDialogText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 509
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogText:Ljava/lang/Integer;

    .line 510
    return-object p0
.end method

.method public setResDialogTheme(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 533
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTheme:Ljava/lang/Integer;

    .line 534
    return-object p0
.end method

.method public setResDialogTitle(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 523
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resDialogTitle:Ljava/lang/Integer;

    .line 524
    return-object p0
.end method

.method public setResNotifIcon(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 547
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifIcon:Ljava/lang/Integer;

    .line 548
    return-object p0
.end method

.method public setResNotifText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 561
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifText:Ljava/lang/Integer;

    .line 562
    return-object p0
.end method

.method public setResNotifTickerText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 576
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText:Ljava/lang/Integer;

    .line 577
    return-object p0
.end method

.method public setResNotifTitle(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 590
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle:Ljava/lang/Integer;

    .line 591
    return-object p0
.end method

.method public setResToastText(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 604
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->resToastText:Ljava/lang/Integer;

    .line 605
    return-object p0
.end method

.method public setSendReportsAtShutdown(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "sendReportsAtShutdown"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 667
    return-object p0
.end method

.method public setSendReportsInDevMode(Z)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "sendReportsInDevMode"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 656
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sendReportsInDevMode:Ljava/lang/Boolean;

    .line 657
    return-object p0
.end method

.method public setSharedPreferenceMode(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "sharedPreferenceMode"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 614
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesMode:Ljava/lang/Integer;

    .line 615
    return-object p0
.end method

.method public setSharedPreferenceName(Ljava/lang/String;)Lorg/acra/config/ConfigurationBuilder;
    .registers 2
    .param p1, "sharedPreferenceName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 624
    iput-object p1, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesName:Ljava/lang/String;

    .line 625
    return-object p0
.end method

.method public setSocketTimeout(I)Lorg/acra/config/ConfigurationBuilder;
    .registers 3
    .param p1, "socketTimeout"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 634
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->socketTimeout:Ljava/lang/Integer;

    .line 635
    return-object p0
.end method

.method sharedPreferencesMode()I
    .registers 2

    .prologue
    .line 1052
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesMode:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1053
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesMode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1055
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method sharedPreferencesName()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1060
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1061
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesName:Ljava/lang/String;

    .line 1064
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method socketTimeout()I
    .registers 2

    .prologue
    .line 1068
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->socketTimeout:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1069
    iget-object v0, p0, Lorg/acra/config/ConfigurationBuilder;->socketTimeout:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1071
    :goto_a
    return v0

    :cond_b
    const/16 v0, 0x4e20

    goto :goto_a
.end method
