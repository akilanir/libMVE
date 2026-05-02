.class public Lorg/acra/ACRAConfiguration;
.super Ljava/lang/Object;
.source "ACRAConfiguration.java"

# interfaces
.implements Lorg/acra/annotation/ReportsCrashes;


# instance fields
.field private mAdditionalDropboxTags:[Ljava/lang/String;

.field private mAdditionalSharedPreferences:[Ljava/lang/String;

.field private mApplicationLogFile:Ljava/lang/String;

.field private mApplicationLogFileLines:Ljava/lang/Integer;

.field private mBuildConfigClass:Ljava/lang/Class;

.field private mConnectionTimeout:Ljava/lang/Integer;

.field private mCustomReportContent:[Lorg/acra/ReportField;

.field private mDeleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

.field private mDeleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

.field private mDisableSSLCertValidation:Ljava/lang/Boolean;

.field private mDropboxCollectionMinutes:Ljava/lang/Integer;

.field private mExcludeMatchingSettingsKeys:[Ljava/lang/String;

.field private mExcludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

.field private mForceCloseDialogAfterToast:Ljava/lang/Boolean;

.field private mFormUri:Ljava/lang/String;

.field private mFormUriBasicAuthLogin:Ljava/lang/String;

.field private mFormUriBasicAuthPassword:Ljava/lang/String;

.field private mHttpHeaders:Ljava/util/Map;
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

.field private mHttpMethod:Lorg/acra/sender/HttpSender$Method;

.field private mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

.field private mHttpsSocketFactoryFactoryClass:Ljava/lang/String;

.field private mIncludeDropboxSystemTags:Ljava/lang/Boolean;

.field private mKeyStore:Ljava/security/KeyStore;

.field private mLogcatArguments:[Ljava/lang/String;

.field private mLogcatFilterByPid:Ljava/lang/Boolean;

.field private mMailTo:Ljava/lang/String;

.field private mMaxNumberOfRequestRetries:Ljava/lang/Integer;

.field private mMode:Lorg/acra/ReportingInteractionMode;

.field private mReportDialogClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/BaseCrashReportDialog;",
            ">;"
        }
    .end annotation
.end field

.field private mReportType:Lorg/acra/sender/HttpSender$Type;

.field private mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

.field private mResDialogCommentPrompt:Ljava/lang/Integer;

.field private mResDialogEmailPrompt:Ljava/lang/Integer;

.field private mResDialogIcon:Ljava/lang/Integer;

.field private mResDialogNegativeButtonText:Ljava/lang/Integer;

.field private mResDialogOkToast:Ljava/lang/Integer;

.field private mResDialogPositiveButtonText:Ljava/lang/Integer;

.field private mResDialogText:Ljava/lang/Integer;

.field private mResDialogTitle:Ljava/lang/Integer;

.field private mResNotifIcon:Ljava/lang/Integer;

.field private mResNotifText:Ljava/lang/Integer;

.field private mResNotifTickerText:Ljava/lang/Integer;

.field private mResNotifTitle:Ljava/lang/Integer;

.field private mResToastText:Ljava/lang/Integer;

.field private mSendReportsAtShutdown:Ljava/lang/Boolean;

.field private mSendReportsInDevMode:Ljava/lang/Boolean;

.field private mSharedPreferenceMode:Ljava/lang/Integer;

.field private mSharedPreferenceName:Ljava/lang/String;

.field private mSocketTimeout:Ljava/lang/Integer;

.field private final reflectionHelper:Lorg/acra/util/ReflectionHelper;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 714
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    .line 715
    return-void
.end method

.method public constructor <init>(Lorg/acra/annotation/ReportsCrashes;)V
    .registers 4
    .param p1, "defaults"    # Lorg/acra/annotation/ReportsCrashes;

    .prologue
    const/4 v1, 0x0

    .line 705
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Lorg/acra/util/ReflectionHelper;

    invoke-direct {v0}, Lorg/acra/util/ReflectionHelper;-><init>()V

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->reflectionHelper:Lorg/acra/util/ReflectionHelper;

    .line 46
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mAdditionalDropboxTags:[Ljava/lang/String;

    .line 48
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mAdditionalSharedPreferences:[Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mConnectionTimeout:Ljava/lang/Integer;

    .line 50
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mCustomReportContent:[Lorg/acra/ReportField;

    .line 51
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mDeleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 52
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mDeleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 53
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mDropboxCollectionMinutes:Ljava/lang/Integer;

    .line 54
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mForceCloseDialogAfterToast:Ljava/lang/Boolean;

    .line 55
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mFormUri:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthLogin:Ljava/lang/String;

    .line 57
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthPassword:Ljava/lang/String;

    .line 58
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mIncludeDropboxSystemTags:Ljava/lang/Boolean;

    .line 60
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mLogcatArguments:[Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mMailTo:Ljava/lang/String;

    .line 62
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mMaxNumberOfRequestRetries:Ljava/lang/Integer;

    .line 63
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mMode:Lorg/acra/ReportingInteractionMode;

    .line 64
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    .line 65
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mReportDialogClass:Ljava/lang/Class;

    .line 67
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogPositiveButtonText:Ljava/lang/Integer;

    .line 68
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogNegativeButtonText:Ljava/lang/Integer;

    .line 69
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogCommentPrompt:Ljava/lang/Integer;

    .line 70
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogEmailPrompt:Ljava/lang/Integer;

    .line 71
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogIcon:Ljava/lang/Integer;

    .line 72
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogOkToast:Ljava/lang/Integer;

    .line 73
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogText:Ljava/lang/Integer;

    .line 74
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResDialogTitle:Ljava/lang/Integer;

    .line 75
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResNotifIcon:Ljava/lang/Integer;

    .line 76
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResNotifText:Ljava/lang/Integer;

    .line 77
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResNotifTickerText:Ljava/lang/Integer;

    .line 78
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResNotifTitle:Ljava/lang/Integer;

    .line 79
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mResToastText:Ljava/lang/Integer;

    .line 80
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceMode:Ljava/lang/Integer;

    .line 81
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceName:Ljava/lang/String;

    .line 82
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mSocketTimeout:Ljava/lang/Integer;

    .line 83
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mLogcatFilterByPid:Ljava/lang/Boolean;

    .line 84
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mSendReportsInDevMode:Ljava/lang/Boolean;

    .line 85
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mSendReportsAtShutdown:Ljava/lang/Boolean;

    .line 87
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 88
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFile:Ljava/lang/String;

    .line 91
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFileLines:Ljava/lang/Integer;

    .line 93
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mDisableSSLCertValidation:Ljava/lang/Boolean;

    .line 94
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactoryClass:Ljava/lang/String;

    .line 96
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mHttpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 97
    iput-object v1, p0, Lorg/acra/ACRAConfiguration;->mReportType:Lorg/acra/sender/HttpSender$Type;

    .line 706
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    .line 707
    return-void
.end method

.method public static isNull(Ljava/lang/String;)Z
    .registers 2
    .param p0, "aString"    # Ljava/lang/String;

    .prologue
    .line 1357
    if-eqz p0, :cond_a

    const-string v0, "ACRA-NULL-STRING"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method public additionalDropBoxTags()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 719
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mAdditionalDropboxTags:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 720
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mAdditionalDropboxTags:[Ljava/lang/String;

    .line 727
    :goto_6
    return-object v0

    .line 723
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 724
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->additionalDropBoxTags()[Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 727
    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method public additionalSharedPreferences()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 732
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mAdditionalSharedPreferences:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 733
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mAdditionalSharedPreferences:[Ljava/lang/String;

    .line 740
    :goto_6
    return-object v0

    .line 736
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 737
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->additionalSharedPreferences()[Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 740
    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method public annotationType()Ljava/lang/Class;
    .registers 2
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
    .line 745
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->annotationType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public applicationLogFile()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1222
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFile:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1223
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFile:Ljava/lang/String;

    .line 1230
    :goto_6
    return-object v0

    .line 1226
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1227
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->applicationLogFile()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 1230
    :cond_12
    const-string v0, ""

    goto :goto_6
.end method

.method public applicationLogFileLines()I
    .registers 2

    .prologue
    .line 1235
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFileLines:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1236
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFileLines:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1243
    :goto_a
    return v0

    .line 1239
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1240
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->applicationLogFileLines()I

    move-result v0

    goto :goto_a

    .line 1243
    :cond_16
    const/16 v0, 0x64

    goto :goto_a
.end method

.method public buildConfigClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 1209
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mBuildConfigClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1210
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mBuildConfigClass:Ljava/lang/Class;

    .line 1217
    :goto_6
    return-object v0

    .line 1213
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->buildConfigClass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 1214
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->buildConfigClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_6

    .line 1217
    :cond_1a
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public connectionTimeout()I
    .registers 2

    .prologue
    .line 750
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mConnectionTimeout:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 751
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mConnectionTimeout:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 758
    :goto_a
    return v0

    .line 754
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 755
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->connectionTimeout()I

    move-result v0

    goto :goto_a

    .line 758
    :cond_16
    const/16 v0, 0xbb8

    goto :goto_a
.end method

.method public customReportContent()[Lorg/acra/ReportField;
    .registers 2

    .prologue
    .line 763
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mCustomReportContent:[Lorg/acra/ReportField;

    if-eqz v0, :cond_7

    .line 764
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mCustomReportContent:[Lorg/acra/ReportField;

    .line 771
    :goto_6
    return-object v0

    .line 767
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 768
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v0

    goto :goto_6

    .line 771
    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/acra/ReportField;

    goto :goto_6
.end method

.method public deleteOldUnsentReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 789
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDeleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 790
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDeleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 797
    :goto_a
    return v0

    .line 793
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 794
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v0

    goto :goto_a

    .line 797
    :cond_16
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public deleteUnapprovedReportsOnApplicationStart()Z
    .registers 2

    .prologue
    .line 776
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDeleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 777
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDeleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 784
    :goto_a
    return v0

    .line 780
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 781
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v0

    goto :goto_a

    .line 784
    :cond_16
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public disableSSLCertValidation()Z
    .registers 2

    .prologue
    .line 1248
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDisableSSLCertValidation:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1249
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDisableSSLCertValidation:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1256
    :goto_a
    return v0

    .line 1252
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1253
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->disableSSLCertValidation()Z

    move-result v0

    goto :goto_a

    .line 1256
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public dropboxCollectionMinutes()I
    .registers 2

    .prologue
    .line 802
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDropboxCollectionMinutes:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 803
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mDropboxCollectionMinutes:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 810
    :goto_a
    return v0

    .line 806
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 807
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->dropboxCollectionMinutes()I

    move-result v0

    goto :goto_a

    .line 810
    :cond_16
    const/4 v0, 0x5

    goto :goto_a
.end method

.method public excludeMatchingSettingsKeys()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 1192
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSettingsKeys:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1193
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 1200
    :goto_6
    return-object v0

    .line 1196
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1197
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->excludeMatchingSettingsKeys()[Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 1200
    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method public excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 1179
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1180
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 1187
    :goto_6
    return-object v0

    .line 1183
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1184
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->excludeMatchingSharedPreferencesKeys()[Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 1187
    :cond_12
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_6
.end method

.method public forceCloseDialogAfterToast()Z
    .registers 2

    .prologue
    .line 815
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mForceCloseDialogAfterToast:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 816
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mForceCloseDialogAfterToast:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 823
    :goto_a
    return v0

    .line 819
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 820
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->forceCloseDialogAfterToast()Z

    move-result v0

    goto :goto_a

    .line 823
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public formUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 828
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUri:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 829
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUri:Ljava/lang/String;

    .line 836
    :goto_6
    return-object v0

    .line 832
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 833
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 836
    :cond_12
    const-string v0, ""

    goto :goto_6
.end method

.method public formUriBasicAuthLogin()Ljava/lang/String;
    .registers 2

    .prologue
    .line 841
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthLogin:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 842
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthLogin:Ljava/lang/String;

    .line 849
    :goto_6
    return-object v0

    .line 845
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 846
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 849
    :cond_12
    const-string v0, "ACRA-NULL-STRING"

    goto :goto_6
.end method

.method public formUriBasicAuthPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 854
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthPassword:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 855
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthPassword:Ljava/lang/String;

    .line 862
    :goto_6
    return-object v0

    .line 858
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 859
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 862
    :cond_12
    const-string v0, "ACRA-NULL-STRING"

    goto :goto_6
.end method

.method public getHttpHeaders()Ljava/util/Map;
    .registers 2
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
    .line 122
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mHttpHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getHttpSocketFactoryFactory()Lorg/acra/util/HttpsSocketFactoryFactory;
    .registers 8

    .prologue
    .line 1295
    iget-object v3, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

    if-eqz v3, :cond_7

    .line 1296
    iget-object v3, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

    .line 1318
    :goto_6
    return-object v3

    .line 1299
    :cond_7
    invoke-virtual {p0}, Lorg/acra/ACRAConfiguration;->httpsSocketFactoryFactoryClass()Ljava/lang/String;

    move-result-object v1

    .line 1300
    .local v1, "httpsSocketFactoryFactoryClass":Ljava/lang/String;
    if-eqz v1, :cond_21

    .line 1302
    :try_start_d
    iget-object v3, p0, Lorg/acra/ACRAConfiguration;->reflectionHelper:Lorg/acra/util/ReflectionHelper;

    iget-object v4, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v4}, Lorg/acra/annotation/ReportsCrashes;->httpsSocketFactoryFactoryClass()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/acra/util/ReflectionHelper;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1303
    .local v2, "object":Ljava/lang/Object;
    instance-of v3, v2, Lorg/acra/util/HttpsSocketFactoryFactory;

    if-eqz v3, :cond_2c

    .line 1304
    check-cast v2, Lorg/acra/util/HttpsSocketFactoryFactory;

    .end local v2    # "object":Ljava/lang/Object;
    iput-object v2, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;
    :try_end_21
    .catch Lorg/acra/util/ReflectionException; {:try_start_d .. :try_end_21} :catch_47

    .line 1314
    :cond_21
    :goto_21
    iget-object v3, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactoryClass:Ljava/lang/String;

    if-nez v3, :cond_29

    .line 1315
    sget-object v3, Lorg/acra/util/DefaultHttpsSocketFactoryFactory;->INSTANCE:Lorg/acra/util/HttpsSocketFactoryFactory;

    iput-object v3, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

    .line 1318
    :cond_29
    iget-object v3, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

    goto :goto_6

    .line 1306
    .restart local v2    # "object":Ljava/lang/Object;
    :cond_2c
    :try_start_2c
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Using default httpsSocketFactoryFactory - not a HttpSocketFactoryFactory : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_46
    .catch Lorg/acra/util/ReflectionException; {:try_start_2c .. :try_end_46} :catch_47

    goto :goto_21

    .line 1308
    .end local v2    # "object":Ljava/lang/Object;
    :catch_47
    move-exception v0

    .line 1309
    .local v0, "e":Lorg/acra/util/ReflectionException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Using default httpsSocketFactoryFactory - Could not construct : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_21
.end method

.method public getReportFields()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/acra/ReportField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/acra/ACRAConfiguration;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v0

    .line 132
    .local v0, "customReportFields":[Lorg/acra/ReportField;
    array-length v2, v0

    if-eqz v2, :cond_16

    .line 133
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using custom Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    move-object v1, v0

    .line 142
    .local v1, "fieldsList":[Lorg/acra/ReportField;
    :goto_11
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 135
    .end local v1    # "fieldsList":[Lorg/acra/ReportField;
    :cond_16
    invoke-virtual {p0}, Lorg/acra/ACRAConfiguration;->mailTo()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_28

    const-string v2, ""

    invoke-virtual {p0}, Lorg/acra/ACRAConfiguration;->mailTo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 136
    :cond_28
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    sget-object v1, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    .restart local v1    # "fieldsList":[Lorg/acra/ReportField;
    goto :goto_11

    .line 139
    .end local v1    # "fieldsList":[Lorg/acra/ReportField;
    :cond_34
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Mail Report Fields"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    sget-object v1, Lorg/acra/ACRAConstants;->DEFAULT_MAIL_REPORT_FIELDS:[Lorg/acra/ReportField;

    .restart local v1    # "fieldsList":[Lorg/acra/ReportField;
    goto :goto_11
.end method

.method public httpMethod()Lorg/acra/sender/HttpSender$Method;
    .registers 2

    .prologue
    .line 1324
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mHttpMethod:Lorg/acra/sender/HttpSender$Method;

    if-eqz v0, :cond_7

    .line 1325
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mHttpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 1332
    :goto_6
    return-object v0

    .line 1328
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1329
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->httpMethod()Lorg/acra/sender/HttpSender$Method;

    move-result-object v0

    goto :goto_6

    .line 1332
    :cond_12
    sget-object v0, Lorg/acra/sender/HttpSender$Method;->POST:Lorg/acra/sender/HttpSender$Method;

    goto :goto_6
.end method

.method public httpsSocketFactoryFactoryClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1261
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactoryClass:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1262
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactoryClass:Ljava/lang/String;

    .line 1269
    :goto_6
    return-object v0

    .line 1265
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1266
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->httpsSocketFactoryFactoryClass()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 1269
    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public includeDropBoxSystemTags()Z
    .registers 2

    .prologue
    .line 867
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mIncludeDropboxSystemTags:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 868
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mIncludeDropboxSystemTags:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 875
    :goto_a
    return v0

    .line 871
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 872
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->includeDropBoxSystemTags()Z

    move-result v0

    goto :goto_a

    .line 875
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public keyStore()Ljava/security/KeyStore;
    .registers 2

    .prologue
    .line 1349
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mKeyStore:Ljava/security/KeyStore;

    if-eqz v0, :cond_7

    .line 1350
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mKeyStore:Ljava/security/KeyStore;

    .line 1353
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public logcatArguments()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 880
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mLogcatArguments:[Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 881
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mLogcatArguments:[Ljava/lang/String;

    .line 888
    :goto_6
    return-object v0

    .line 884
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 885
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->logcatArguments()[Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 888
    :cond_12
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

.method public logcatFilterByPid()Z
    .registers 2

    .prologue
    .line 1140
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mLogcatFilterByPid:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1141
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mLogcatFilterByPid:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1148
    :goto_a
    return v0

    .line 1144
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1145
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->logcatFilterByPid()Z

    move-result v0

    goto :goto_a

    .line 1148
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public mailTo()Ljava/lang/String;
    .registers 2

    .prologue
    .line 893
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMailTo:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 894
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMailTo:Ljava/lang/String;

    .line 901
    :goto_6
    return-object v0

    .line 897
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 898
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 901
    :cond_12
    const-string v0, ""

    goto :goto_6
.end method

.method public maxNumberOfRequestRetries()I
    .registers 2

    .prologue
    .line 906
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMaxNumberOfRequestRetries:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 907
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMaxNumberOfRequestRetries:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 914
    :goto_a
    return v0

    .line 910
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 911
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->maxNumberOfRequestRetries()I

    move-result v0

    goto :goto_a

    .line 914
    :cond_16
    const/4 v0, 0x3

    goto :goto_a
.end method

.method public mode()Lorg/acra/ReportingInteractionMode;
    .registers 2

    .prologue
    .line 919
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMode:Lorg/acra/ReportingInteractionMode;

    if-eqz v0, :cond_7

    .line 920
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mMode:Lorg/acra/ReportingInteractionMode;

    .line 927
    :goto_6
    return-object v0

    .line 923
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 924
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    goto :goto_6

    .line 927
    :cond_12
    sget-object v0, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    goto :goto_6
.end method

.method public reportDialogClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/BaseCrashReportDialog;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1275
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportDialogClass:Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1276
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportDialogClass:Ljava/lang/Class;

    .line 1283
    :goto_6
    return-object v0

    .line 1279
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1280
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportDialogClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_6

    .line 1283
    :cond_12
    const-class v0, Lorg/acra/CrashReportDialog;

    goto :goto_6
.end method

.method public reportType()Lorg/acra/sender/HttpSender$Type;
    .registers 2

    .prologue
    .line 1337
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportType:Lorg/acra/sender/HttpSender$Type;

    if-eqz v0, :cond_7

    .line 1338
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportType:Lorg/acra/sender/HttpSender$Type;

    .line 1345
    :goto_6
    return-object v0

    .line 1341
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1342
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v0

    goto :goto_6

    .line 1345
    :cond_12
    sget-object v0, Lorg/acra/sender/HttpSender$Type;->FORM:Lorg/acra/sender/HttpSender$Type;

    goto :goto_6
.end method

.method public resDialogCommentPrompt()I
    .registers 2

    .prologue
    .line 958
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogCommentPrompt:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 959
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogCommentPrompt:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 966
    :goto_a
    return v0

    .line 962
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 963
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogCommentPrompt()I

    move-result v0

    goto :goto_a

    .line 966
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogEmailPrompt()I
    .registers 2

    .prologue
    .line 971
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogEmailPrompt:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 972
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogEmailPrompt:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 979
    :goto_a
    return v0

    .line 975
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 976
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogEmailPrompt()I

    move-result v0

    goto :goto_a

    .line 979
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogIcon()I
    .registers 2

    .prologue
    .line 984
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogIcon:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 985
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogIcon:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 992
    :goto_a
    return v0

    .line 988
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 989
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogIcon()I

    move-result v0

    goto :goto_a

    .line 992
    :cond_16
    const v0, 0x1080027

    goto :goto_a
.end method

.method public resDialogNegativeButtonText()I
    .registers 2

    .prologue
    .line 945
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogNegativeButtonText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 946
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogNegativeButtonText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 953
    :goto_a
    return v0

    .line 949
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 950
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogNegativeButtonText()I

    move-result v0

    goto :goto_a

    .line 953
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogOkToast()I
    .registers 2

    .prologue
    .line 997
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogOkToast:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 998
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogOkToast:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1005
    :goto_a
    return v0

    .line 1001
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1002
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogOkToast()I

    move-result v0

    goto :goto_a

    .line 1005
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogPositiveButtonText()I
    .registers 2

    .prologue
    .line 932
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogPositiveButtonText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 933
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogPositiveButtonText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 940
    :goto_a
    return v0

    .line 936
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 937
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogPositiveButtonText()I

    move-result v0

    goto :goto_a

    .line 940
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogText()I
    .registers 2

    .prologue
    .line 1010
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1011
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1018
    :goto_a
    return v0

    .line 1014
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1015
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v0

    goto :goto_a

    .line 1018
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resDialogTitle()I
    .registers 2

    .prologue
    .line 1023
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogTitle:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1024
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogTitle:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1031
    :goto_a
    return v0

    .line 1027
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1028
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogTitle()I

    move-result v0

    goto :goto_a

    .line 1031
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resNotifIcon()I
    .registers 2

    .prologue
    .line 1036
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifIcon:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1037
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifIcon:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1044
    :goto_a
    return v0

    .line 1040
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1041
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifIcon()I

    move-result v0

    goto :goto_a

    .line 1044
    :cond_16
    const v0, 0x1080078

    goto :goto_a
.end method

.method public resNotifText()I
    .registers 2

    .prologue
    .line 1049
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1050
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1057
    :goto_a
    return v0

    .line 1053
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1054
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v0

    goto :goto_a

    .line 1057
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resNotifTickerText()I
    .registers 2

    .prologue
    .line 1062
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTickerText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1063
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTickerText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1070
    :goto_a
    return v0

    .line 1066
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1067
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v0

    goto :goto_a

    .line 1070
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resNotifTitle()I
    .registers 2

    .prologue
    .line 1075
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTitle:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1076
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTitle:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1083
    :goto_a
    return v0

    .line 1079
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1080
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v0

    goto :goto_a

    .line 1083
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public resToastText()I
    .registers 2

    .prologue
    .line 1088
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResToastText:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1089
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mResToastText:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1096
    :goto_a
    return v0

    .line 1092
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1093
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resToastText()I

    move-result v0

    goto :goto_a

    .line 1096
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public sendReportsAtShutdown()Z
    .registers 2

    .prologue
    .line 1166
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSendReportsAtShutdown:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1167
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSendReportsAtShutdown:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1174
    :goto_a
    return v0

    .line 1170
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1171
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sendReportsAtShutdown()Z

    move-result v0

    goto :goto_a

    .line 1174
    :cond_16
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public sendReportsInDevMode()Z
    .registers 2

    .prologue
    .line 1153
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSendReportsInDevMode:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    .line 1154
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSendReportsInDevMode:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 1161
    :goto_a
    return v0

    .line 1157
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1158
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sendReportsInDevMode()Z

    move-result v0

    goto :goto_a

    .line 1161
    :cond_16
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public setAdditionalDropboxTags([Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "additionalDropboxTags"    # [Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mAdditionalDropboxTags:[Ljava/lang/String;

    .line 153
    return-object p0
.end method

.method public setAdditionalSharedPreferences([Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "additionalSharedPreferences"    # [Ljava/lang/String;

    .prologue
    .line 163
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mAdditionalSharedPreferences:[Ljava/lang/String;

    .line 164
    return-object p0
.end method

.method public setApplicationLogFile(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "applicationLogFile"    # Ljava/lang/String;

    .prologue
    .line 637
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFile:Ljava/lang/String;

    .line 638
    return-object p0
.end method

.method public setApplicationLogFileLines(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "applicationLogFileLines"    # I

    .prologue
    .line 651
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mApplicationLogFileLines:Ljava/lang/Integer;

    .line 652
    return-object p0
.end method

.method public setBuildConfigClass(Ljava/lang/Class;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "buildConfigClass"    # Ljava/lang/Class;

    .prologue
    .line 625
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mBuildConfigClass:Ljava/lang/Class;

    .line 626
    return-object p0
.end method

.method public setConnectionTimeout(Ljava/lang/Integer;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "connectionTimeout"    # Ljava/lang/Integer;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mConnectionTimeout:Ljava/lang/Integer;

    .line 175
    return-object p0
.end method

.method public setCustomReportContent([Lorg/acra/ReportField;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "customReportContent"    # [Lorg/acra/ReportField;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mCustomReportContent:[Lorg/acra/ReportField;

    .line 186
    return-object p0
.end method

.method public setDeleteOldUnsentReportsOnApplicationStart(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "deleteOldUnsentReportsOnApplicationStart"    # Ljava/lang/Boolean;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mDeleteOldUnsentReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 207
    return-object p0
.end method

.method public setDeleteUnapprovedReportsOnApplicationStart(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "deleteUnapprovedReportsOnApplicationStart"    # Ljava/lang/Boolean;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mDeleteUnapprovedReportsOnApplicationStart:Ljava/lang/Boolean;

    .line 197
    return-object p0
.end method

.method public setDisableSSLCertValidation(Z)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "disableSSLCertValidation"    # Z

    .prologue
    .line 663
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mDisableSSLCertValidation:Ljava/lang/Boolean;

    .line 664
    return-object p0
.end method

.method public setDropboxCollectionMinutes(Ljava/lang/Integer;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "dropboxCollectionMinutes"    # Ljava/lang/Integer;

    .prologue
    .line 217
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mDropboxCollectionMinutes:Ljava/lang/Integer;

    .line 218
    return-object p0
.end method

.method public setExcludeMatchingSettingsKeys([Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "excludeMatchingSettingsKeys"    # [Ljava/lang/String;

    .prologue
    .line 619
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSettingsKeys:[Ljava/lang/String;

    .line 620
    return-object p0
.end method

.method public setExcludeMatchingSharedPreferencesKeys([Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "excludeMatchingSharedPreferencesKeys"    # [Ljava/lang/String;

    .prologue
    .line 605
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mExcludeMatchingSharedPreferencesKeys:[Ljava/lang/String;

    .line 606
    return-object p0
.end method

.method public setForceCloseDialogAfterToast(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "forceCloseDialogAfterToast"    # Ljava/lang/Boolean;

    .prologue
    .line 228
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mForceCloseDialogAfterToast:Ljava/lang/Boolean;

    .line 229
    return-object p0
.end method

.method public setFormUri(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "formUri"    # Ljava/lang/String;

    .prologue
    .line 244
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mFormUri:Ljava/lang/String;

    .line 245
    return-object p0
.end method

.method public setFormUriBasicAuthLogin(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "formUriBasicAuthLogin"    # Ljava/lang/String;

    .prologue
    .line 255
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthLogin:Ljava/lang/String;

    .line 256
    return-object p0
.end method

.method public setFormUriBasicAuthPassword(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "formUriBasicAuthPassword"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mFormUriBasicAuthPassword:Ljava/lang/String;

    .line 267
    return-object p0
.end method

.method public setHttpHeaders(Ljava/util/Map;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/acra/ACRAConfiguration;"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mHttpHeaders:Ljava/util/Map;

    .line 111
    return-object p0
.end method

.method public setHttpMethod(Lorg/acra/sender/HttpSender$Method;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "httpMethod"    # Lorg/acra/sender/HttpSender$Method;

    .prologue
    .line 675
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mHttpMethod:Lorg/acra/sender/HttpSender$Method;

    .line 676
    return-object p0
.end method

.method public setHttpsSocketFactoryFactory(Lorg/acra/util/HttpsSocketFactoryFactory;)V
    .registers 2
    .param p1, "httpsSocketFactoryFactory"    # Lorg/acra/util/HttpsSocketFactoryFactory;

    .prologue
    .line 1291
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mHttpsSocketFactoryFactory:Lorg/acra/util/HttpsSocketFactoryFactory;

    .line 1292
    return-void
.end method

.method public setIncludeDropboxSystemTags(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "includeDropboxSystemTags"    # Ljava/lang/Boolean;

    .prologue
    .line 277
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mIncludeDropboxSystemTags:Ljava/lang/Boolean;

    .line 278
    return-object p0
.end method

.method public setKeyStore(Ljava/security/KeyStore;)V
    .registers 2
    .param p1, "keyStore"    # Ljava/security/KeyStore;

    .prologue
    .line 699
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mKeyStore:Ljava/security/KeyStore;

    .line 700
    return-void
.end method

.method public setLogcatArguments([Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "logcatArguments"    # [Ljava/lang/String;

    .prologue
    .line 288
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mLogcatArguments:[Ljava/lang/String;

    .line 289
    return-object p0
.end method

.method public setLogcatFilterByPid(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "filterByPid"    # Ljava/lang/Boolean;

    .prologue
    .line 564
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mLogcatFilterByPid:Ljava/lang/Boolean;

    .line 565
    return-object p0
.end method

.method public setMailTo(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "mailTo"    # Ljava/lang/String;

    .prologue
    .line 304
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mMailTo:Ljava/lang/String;

    .line 305
    return-object p0
.end method

.method public setMaxNumberOfRequestRetries(Ljava/lang/Integer;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "maxNumberOfRequestRetries"    # Ljava/lang/Integer;

    .prologue
    .line 315
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mMaxNumberOfRequestRetries:Ljava/lang/Integer;

    .line 316
    return-object p0
.end method

.method public setMode(Lorg/acra/ReportingInteractionMode;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "mode"    # Lorg/acra/ReportingInteractionMode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/ACRAConfigurationException;
        }
    .end annotation

    .prologue
    .line 331
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mMode:Lorg/acra/ReportingInteractionMode;

    .line 332
    invoke-static {p0}, Lorg/acra/ACRA;->checkCrashResources(Lorg/acra/annotation/ReportsCrashes;)V

    .line 333
    return-object p0
.end method

.method public setReportDialogClass(Ljava/lang/Class;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/BaseCrashReportDialog;",
            ">;)",
            "Lorg/acra/ACRAConfiguration;"
        }
    .end annotation

    .prologue
    .line 350
    .local p1, "reportDialogClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/BaseCrashReportDialog;>;"
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mReportDialogClass:Ljava/lang/Class;

    .line 351
    return-object p0
.end method

.method public setReportType(Lorg/acra/sender/HttpSender$Type;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "type"    # Lorg/acra/sender/HttpSender$Type;

    .prologue
    .line 688
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mReportType:Lorg/acra/sender/HttpSender$Type;

    .line 689
    return-object p0
.end method

.method public setResDialogCommentPrompt(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 366
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogCommentPrompt:Ljava/lang/Integer;

    .line 367
    return-object p0
.end method

.method public setResDialogEmailPrompt(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 382
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogEmailPrompt:Ljava/lang/Integer;

    .line 383
    return-object p0
.end method

.method public setResDialogIcon(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 397
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogIcon:Ljava/lang/Integer;

    .line 398
    return-object p0
.end method

.method public setResDialogNegativeButtonText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 344
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogNegativeButtonText:Ljava/lang/Integer;

    .line 345
    return-object p0
.end method

.method public setResDialogOkToast(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 412
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogOkToast:Ljava/lang/Integer;

    .line 413
    return-object p0
.end method

.method public setResDialogPositiveButtonText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 338
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogPositiveButtonText:Ljava/lang/Integer;

    .line 339
    return-object p0
.end method

.method public setResDialogText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 427
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogText:Ljava/lang/Integer;

    .line 428
    return-object p0
.end method

.method public setResDialogTitle(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 442
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResDialogTitle:Ljava/lang/Integer;

    .line 443
    return-object p0
.end method

.method public setResNotifIcon(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 457
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifIcon:Ljava/lang/Integer;

    .line 458
    return-object p0
.end method

.method public setResNotifText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 472
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifText:Ljava/lang/Integer;

    .line 473
    return-object p0
.end method

.method public setResNotifTickerText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 488
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTickerText:Ljava/lang/Integer;

    .line 489
    return-object p0
.end method

.method public setResNotifTitle(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 503
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResNotifTitle:Ljava/lang/Integer;

    .line 504
    return-object p0
.end method

.method public setResToastText(I)Lorg/acra/ACRAConfiguration;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 518
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/ACRAConfiguration;->mResToastText:Ljava/lang/Integer;

    .line 519
    return-object p0
.end method

.method public setSendReportsAtShutdown(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "sendReportsAtShutdown"    # Ljava/lang/Boolean;

    .prologue
    .line 591
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mSendReportsAtShutdown:Ljava/lang/Boolean;

    .line 592
    return-object p0
.end method

.method public setSendReportsInDevMode(Ljava/lang/Boolean;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "sendReportsInDevMode"    # Ljava/lang/Boolean;

    .prologue
    .line 577
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mSendReportsInDevMode:Ljava/lang/Boolean;

    .line 578
    return-object p0
.end method

.method public setSharedPreferenceMode(Ljava/lang/Integer;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "sharedPreferenceMode"    # Ljava/lang/Integer;

    .prologue
    .line 529
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceMode:Ljava/lang/Integer;

    .line 530
    return-object p0
.end method

.method public setSharedPreferenceName(Ljava/lang/String;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "sharedPreferenceName"    # Ljava/lang/String;

    .prologue
    .line 540
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceName:Ljava/lang/String;

    .line 541
    return-object p0
.end method

.method public setSocketTimeout(Ljava/lang/Integer;)Lorg/acra/ACRAConfiguration;
    .registers 2
    .param p1, "socketTimeout"    # Ljava/lang/Integer;

    .prologue
    .line 551
    iput-object p1, p0, Lorg/acra/ACRAConfiguration;->mSocketTimeout:Ljava/lang/Integer;

    .line 552
    return-object p0
.end method

.method public sharedPreferencesMode()I
    .registers 2

    .prologue
    .line 1101
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceMode:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1102
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceMode:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1109
    :goto_a
    return v0

    .line 1105
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1106
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesMode()I

    move-result v0

    goto :goto_a

    .line 1109
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public sharedPreferencesName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1114
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 1115
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSharedPreferenceName:Ljava/lang/String;

    .line 1122
    :goto_6
    return-object v0

    .line 1118
    :cond_7
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_12

    .line 1119
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 1122
    :cond_12
    const-string v0, ""

    goto :goto_6
.end method

.method public socketTimeout()I
    .registers 2

    .prologue
    .line 1127
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSocketTimeout:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    .line 1128
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mSocketTimeout:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1135
    :goto_a
    return v0

    .line 1131
    :cond_b
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-eqz v0, :cond_16

    .line 1132
    iget-object v0, p0, Lorg/acra/ACRAConfiguration;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->socketTimeout()I

    move-result v0

    goto :goto_a

    .line 1135
    :cond_16
    const/16 v0, 0x1388

    goto :goto_a
.end method
