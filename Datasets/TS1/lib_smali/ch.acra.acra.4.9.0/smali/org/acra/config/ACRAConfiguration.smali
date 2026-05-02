.class public final Lorg/acra/config/ACRAConfiguration;
.super Ljava/lang/Object;
.source "ACRAConfiguration.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private final additionalDropBoxTags:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final additionalSharedPreferences:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final alsoReportToAndroidFramework:Z

.field private final applicationLogFile:Ljava/lang/String;

.field private final applicationLogFileLines:I

.field private final buildConfigClass:Ljava/lang/Class;

.field private final certificatePath:Ljava/lang/String;

.field private final certificateType:Ljava/lang/String;

.field private final connectionTimeout:I

.field private final deleteOldUnsentReportsOnApplicationStart:Z

.field private final deleteUnapprovedReportsOnApplicationStart:Z

.field private final dropboxCollectionMinutes:I

.field private final excludeMatchingSettingsKeys:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final excludeMatchingSharedPreferencesKeys:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final formUri:Ljava/lang/String;

.field private final formUriBasicAuthLogin:Ljava/lang/String;

.field private final formUriBasicAuthPassword:Ljava/lang/String;

.field private final httpHeaders:Lorg/acra/collections/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final httpMethod:Lorg/acra/sender/HttpSender$Method;

.field private final includeDropBoxSystemTags:Z

.field private final keyStoreFactoryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/security/KeyStoreFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final logcatArguments:Lorg/acra/collections/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final logcatFilterByPid:Z

.field private final mailTo:Ljava/lang/String;

.field private final reportContent:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Lorg/acra/ReportField;",
            ">;"
        }
    .end annotation
.end field

.field private final reportDialogClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/dialog/BaseCrashReportDialog;",
            ">;"
        }
    .end annotation
.end field

.field private final reportPrimerClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/builder/ReportPrimer;",
            ">;"
        }
    .end annotation
.end field

.field private final reportSenderFactoryClasses:Lorg/acra/collections/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;>;"
        }
    .end annotation
.end field

.field private final reportType:Lorg/acra/sender/HttpSender$Type;

.field private final reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

.field private final resCertificate:I
    .annotation build Landroid/support/annotation/RawRes;
    .end annotation
.end field

.field private final resDialogCommentPrompt:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogEmailPrompt:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogIcon:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field private final resDialogNegativeButtonText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogOkToast:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogPositiveButtonText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resDialogTheme:I
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation
.end field

.field private final resDialogTitle:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resNotifIcon:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field private final resNotifText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resNotifTickerText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resNotifTitle:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final resToastText:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private final sendReportsInDevMode:Z

.field private final sharedPreferencesMode:I

.field private final sharedPreferencesName:Ljava/lang/String;

.field private final socketTimeout:I


# direct methods
.method constructor <init>(Lorg/acra/config/ConfigurationBuilder;)V
    .registers 4
    .param p1, "builder"    # Lorg/acra/config/ConfigurationBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->additionalDropBoxTags()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->additionalDropBoxTags:Lorg/acra/collections/ImmutableSet;

    .line 120
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->additionalSharedPreferences()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->additionalSharedPreferences:Lorg/acra/collections/ImmutableSet;

    .line 121
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->connectionTimeout()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->connectionTimeout:I

    .line 122
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportContent()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportContent:Lorg/acra/collections/ImmutableSet;

    .line 123
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart:Z

    .line 124
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart:Z

    .line 125
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->dropboxCollectionMinutes()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->dropboxCollectionMinutes:I

    .line 126
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->alsoReportToAndroidFramework()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->alsoReportToAndroidFramework:Z

    .line 127
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->formUri()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUri:Ljava/lang/String;

    .line 128
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthLogin:Ljava/lang/String;

    .line 129
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthPassword:Ljava/lang/String;

    .line 130
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->includeDropBoxSystemTags()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->includeDropBoxSystemTags:Z

    .line 131
    new-instance v0, Lorg/acra/collections/ImmutableList;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->logcatArguments()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableList;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->logcatArguments:Lorg/acra/collections/ImmutableList;

    .line 132
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->mailTo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->mailTo:Ljava/lang/String;

    .line 133
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportingInteractionMode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    .line 134
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogIcon()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogIcon:I

    .line 135
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogPositiveButtonText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogPositiveButtonText:I

    .line 136
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogNegativeButtonText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogNegativeButtonText:I

    .line 137
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogCommentPrompt()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogCommentPrompt:I

    .line 138
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogEmailPrompt()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogEmailPrompt:I

    .line 139
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogOkToast()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogOkToast:I

    .line 140
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogText:I

    .line 141
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogTitle()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogTitle:I

    .line 142
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resDialogTheme()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogTheme:I

    .line 143
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resNotifIcon()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifIcon:I

    .line 144
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resNotifText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifText:I

    .line 145
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resNotifTickerText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifTickerText:I

    .line 146
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resNotifTitle()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifTitle:I

    .line 147
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resToastText()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resToastText:I

    .line 148
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesMode()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->sharedPreferencesMode:I

    .line 149
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->sharedPreferencesName:Ljava/lang/String;

    .line 150
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->socketTimeout()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->socketTimeout:I

    .line 151
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->logcatFilterByPid()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->logcatFilterByPid:Z

    .line 152
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->sendReportsInDevMode()Z

    move-result v0

    iput-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->sendReportsInDevMode:Z

    .line 153
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSharedPreferencesKeys:Lorg/acra/collections/ImmutableSet;

    .line 154
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->excludeMatchingSettingsKeys()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSettingsKeys:Lorg/acra/collections/ImmutableSet;

    .line 155
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->buildConfigClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->buildConfigClass:Ljava/lang/Class;

    .line 156
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->applicationLogFile()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->applicationLogFile:Ljava/lang/String;

    .line 157
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->applicationLogFileLines()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->applicationLogFileLines:I

    .line 158
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportDialogClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportDialogClass:Ljava/lang/Class;

    .line 159
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportPrimerClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportPrimerClass:Ljava/lang/Class;

    .line 160
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->httpMethod()Lorg/acra/sender/HttpSender$Method;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 161
    new-instance v0, Lorg/acra/collections/ImmutableMap;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->httpHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->httpHeaders:Lorg/acra/collections/ImmutableMap;

    .line 162
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportType:Lorg/acra/sender/HttpSender$Type;

    .line 163
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->reportSenderFactoryClasses()[Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportSenderFactoryClasses:Lorg/acra/collections/ImmutableSet;

    .line 164
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->keyStoreFactoryClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->keyStoreFactoryClass:Ljava/lang/Class;

    .line 165
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->resCertificate()I

    move-result v0

    iput v0, p0, Lorg/acra/config/ACRAConfiguration;->resCertificate:I

    .line 166
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->certificatePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->certificatePath:Ljava/lang/String;

    .line 167
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->certificateType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/config/ACRAConfiguration;->certificateType:Ljava/lang/String;

    .line 168
    return-void
.end method


# virtual methods
.method public additionalDropBoxTags()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 192
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->additionalDropBoxTags:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public additionalSharedPreferences()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->additionalSharedPreferences:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public alsoReportToAndroidFramework()Z
    .registers 2

    .prologue
    .line 217
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->alsoReportToAndroidFramework:Z

    return v0
.end method

.method public applicationLogFile()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->applicationLogFile:Ljava/lang/String;

    return-object v0
.end method

.method public applicationLogFileLines()I
    .registers 2

    .prologue
    .line 372
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->applicationLogFileLines:I

    return v0
.end method

.method public buildConfigClass()Ljava/lang/Class;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 363
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->buildConfigClass:Ljava/lang/Class;

    return-object v0
.end method

.method public certificatePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->certificatePath:Ljava/lang/String;

    return-object v0
.end method

.method public certificateType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 415
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->certificateType:Ljava/lang/String;

    return-object v0
.end method

.method public connectionTimeout()I
    .registers 2

    .prologue
    .line 201
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->connectionTimeout:I

    return v0
.end method

.method public deleteOldUnsentReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 209
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart:Z

    return v0
.end method

.method public deleteUnapprovedReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 205
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart:Z

    return v0
.end method

.method public dropboxCollectionMinutes()I
    .registers 2

    .prologue
    .line 213
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->dropboxCollectionMinutes:I

    return v0
.end method

.method public excludeMatchingSettingsKeys()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 352
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSettingsKeys:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public excludeMatchingSharedPreferencesKeys()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 347
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->excludeMatchingSharedPreferencesKeys:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public formUri()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUri:Ljava/lang/String;

    return-object v0
.end method

.method public formUriBasicAuthLogin()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 227
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthLogin:Ljava/lang/String;

    return-object v0
.end method

.method public formUriBasicAuthPassword()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthPassword:Ljava/lang/String;

    return-object v0
.end method

.method public getHttpHeaders()Lorg/acra/collections/ImmutableMap;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->httpHeaders:Lorg/acra/collections/ImmutableMap;

    return-object v0
.end method

.method public getReportFields()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Lorg/acra/ReportField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportContent:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public httpMethod()Lorg/acra/sender/HttpSender$Method;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 387
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->httpMethod:Lorg/acra/sender/HttpSender$Method;

    return-object v0
.end method

.method public includeDropBoxSystemTags()Z
    .registers 2

    .prologue
    .line 236
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->includeDropBoxSystemTags:Z

    return v0
.end method

.method public keyStoreFactoryClass()Ljava/lang/Class;
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
    .line 402
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->keyStoreFactoryClass:Ljava/lang/Class;

    return-object v0
.end method

.method public logcatArguments()Lorg/acra/collections/ImmutableList;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 241
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->logcatArguments:Lorg/acra/collections/ImmutableList;

    return-object v0
.end method

.method public logcatFilterByPid()Z
    .registers 2

    .prologue
    .line 338
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->logcatFilterByPid:Z

    return v0
.end method

.method public mailTo()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 246
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->mailTo:Ljava/lang/String;

    return-object v0
.end method

.method public mode()Lorg/acra/ReportingInteractionMode;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 251
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportingInteractionMode:Lorg/acra/ReportingInteractionMode;

    return-object v0
.end method

.method public reportDialogClass()Ljava/lang/Class;
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
    .line 377
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportDialogClass:Ljava/lang/Class;

    return-object v0
.end method

.method public reportPrimerClass()Ljava/lang/Class;
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
    .line 382
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportPrimerClass:Ljava/lang/Class;

    return-object v0
.end method

.method public reportSenderFactoryClasses()Lorg/acra/collections/ImmutableSet;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/acra/collections/ImmutableSet",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 397
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportSenderFactoryClasses:Lorg/acra/collections/ImmutableSet;

    return-object v0
.end method

.method public reportType()Lorg/acra/sender/HttpSender$Type;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 392
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->reportType:Lorg/acra/sender/HttpSender$Type;

    return-object v0
.end method

.method public resCertificate()I
    .registers 2
    .annotation build Landroid/support/annotation/RawRes;
    .end annotation

    .prologue
    .line 407
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resCertificate:I

    return v0
.end method

.method public resDialogCommentPrompt()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 266
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogCommentPrompt:I

    return v0
.end method

.method public resDialogEmailPrompt()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 271
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogEmailPrompt:I

    return v0
.end method

.method public resDialogIcon()I
    .registers 2
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 276
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogIcon:I

    return v0
.end method

.method public resDialogNegativeButtonText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 261
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogNegativeButtonText:I

    return v0
.end method

.method public resDialogOkToast()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 281
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogOkToast:I

    return v0
.end method

.method public resDialogPositiveButtonText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 256
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogPositiveButtonText:I

    return v0
.end method

.method public resDialogText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 286
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogText:I

    return v0
.end method

.method public resDialogTheme()I
    .registers 2
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation

    .prologue
    .line 296
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogTheme:I

    return v0
.end method

.method public resDialogTitle()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 291
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resDialogTitle:I

    return v0
.end method

.method public resNotifIcon()I
    .registers 2
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 301
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifIcon:I

    return v0
.end method

.method public resNotifText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 306
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifText:I

    return v0
.end method

.method public resNotifTickerText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 311
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifTickerText:I

    return v0
.end method

.method public resNotifTitle()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 316
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resNotifTitle:I

    return v0
.end method

.method public resToastText()I
    .registers 2
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 321
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->resToastText:I

    return v0
.end method

.method public sendReportsInDevMode()Z
    .registers 2

    .prologue
    .line 342
    iget-boolean v0, p0, Lorg/acra/config/ACRAConfiguration;->sendReportsInDevMode:Z

    return v0
.end method

.method public sharedPreferencesMode()I
    .registers 2

    .prologue
    .line 325
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->sharedPreferencesMode:I

    return v0
.end method

.method public sharedPreferencesName()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lorg/acra/config/ACRAConfiguration;->sharedPreferencesName:Ljava/lang/String;

    return-object v0
.end method

.method public socketTimeout()I
    .registers 2

    .prologue
    .line 334
    iget v0, p0, Lorg/acra/config/ACRAConfiguration;->socketTimeout:I

    return v0
.end method
