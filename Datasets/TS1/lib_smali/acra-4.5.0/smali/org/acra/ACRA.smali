.class public Lorg/acra/ACRA;
.super Ljava/lang/Object;
.source "ACRA.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/ACRA$2;
    }
.end annotation


# static fields
.field public static final DEV_LOGGING:Z = false

.field public static final LOG_TAG:Ljava/lang/String;

.field public static final PREF_ALWAYS_ACCEPT:Ljava/lang/String; = "acra.alwaysaccept"

.field public static final PREF_DISABLE_ACRA:Ljava/lang/String; = "acra.disable"

.field public static final PREF_ENABLE_ACRA:Ljava/lang/String; = "acra.enable"

.field public static final PREF_ENABLE_DEVICE_ID:Ljava/lang/String; = "acra.deviceid.enable"

.field public static final PREF_ENABLE_SYSTEM_LOGS:Ljava/lang/String; = "acra.syslog.enable"

.field public static final PREF_LAST_VERSION_NR:Ljava/lang/String; = "acra.lastVersionNr"

.field public static final PREF_USER_EMAIL_ADDRESS:Ljava/lang/String; = "acra.user.email"

.field private static configProxy:Lorg/acra/ACRAConfiguration;

.field private static errorReporterSingleton:Lorg/acra/ErrorReporter;

.field public static log:Lorg/acra/log/ACRALog;

.field private static mApplication:Landroid/app/Application;

.field private static mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private static mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lorg/acra/ACRA;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    .line 46
    new-instance v0, Lorg/acra/log/AndroidLogDelegate;

    invoke-direct {v0}, Lorg/acra/log/AndroidLogDelegate;-><init>()V

    sput-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    return-void
.end method

.method static synthetic access$000(Landroid/content/SharedPreferences;)Z
    .registers 2
    .param p0, "x0"    # Landroid/content/SharedPreferences;

    .prologue
    .line 40
    invoke-static {p0}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v0

    return v0
.end method

.method static checkCrashResources()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/ACRAConfigurationException;
        }
    .end annotation

    .prologue
    .line 214
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 215
    .local v0, "conf":Lorg/acra/annotation/ReportsCrashes;
    sget-object v1, Lorg/acra/ACRA$2;->$SwitchMap$org$acra$ReportingInteractionMode:[I

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/ReportingInteractionMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_50

    .line 238
    :cond_13
    return-void

    .line 217
    :pswitch_14
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resToastText()I

    move-result v1

    if-nez v1, :cond_13

    .line 218
    new-instance v1, Lorg/acra/ACRAConfigurationException;

    const-string v2, "TOAST mode: you have to define the resToastText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v1, v2}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 223
    :pswitch_22
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v1

    if-nez v1, :cond_13

    .line 225
    :cond_3a
    new-instance v1, Lorg/acra/ACRAConfigurationException;

    const-string v2, "NOTIFICATION mode: you have to define at least the resNotifTickerText, resNotifTitle, resNotifText, resDialogText parameters in your application @ReportsCrashes() annotation."

    invoke-direct {v1, v2}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 230
    :pswitch_42
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v1

    if-nez v1, :cond_13

    .line 231
    new-instance v1, Lorg/acra/ACRAConfigurationException;

    const-string v2, "DIALOG mode: you have to define at least the resDialogText parameters in your application @ReportsCrashes() annotation."

    invoke-direct {v1, v2}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 215
    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_14
        :pswitch_22
        :pswitch_42
    .end packed-switch
.end method

.method public static getACRASharedPreferences()Landroid/content/SharedPreferences;
    .registers 4

    .prologue
    .line 250
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 251
    .local v0, "conf":Lorg/acra/annotation/ReportsCrashes;
    const-string v1, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 252
    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesMode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 254
    :goto_1e
    return-object v1

    :cond_1f
    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    goto :goto_1e
.end method

.method static getApplication()Landroid/app/Application;
    .registers 1

    .prologue
    .line 313
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method public static getConfig()Lorg/acra/ACRAConfiguration;
    .registers 3

    .prologue
    .line 264
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    if-nez v0, :cond_19

    .line 265
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    if-nez v0, :cond_11

    .line 266
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Calling ACRA.getConfig() before ACRA.init() gives you an empty configuration instance. You might prefer calling ACRA.getNewDefaultConfig(Application) to get an instance with default values taken from a @ReportsCrashes annotation."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    :cond_11
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-static {v0}, Lorg/acra/ACRA;->getNewDefaultConfig(Landroid/app/Application;)Lorg/acra/ACRAConfiguration;

    move-result-object v0

    sput-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    .line 271
    :cond_19
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    return-object v0
.end method

.method public static getErrorReporter()Lorg/acra/ErrorReporter;
    .registers 2

    .prologue
    .line 178
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    if-nez v0, :cond_c

    .line 179
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access ErrorReporter before ACRA#init"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_c
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    return-object v0
.end method

.method public static getNewDefaultConfig(Landroid/app/Application;)Lorg/acra/ACRAConfiguration;
    .registers 4
    .param p0, "app"    # Landroid/app/Application;

    .prologue
    .line 289
    if-eqz p0, :cond_15

    .line 290
    new-instance v1, Lorg/acra/ACRAConfiguration;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/acra/annotation/ReportsCrashes;

    invoke-direct {v1, v0}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    move-object v0, v1

    .line 292
    :goto_14
    return-object v0

    :cond_15
    new-instance v0, Lorg/acra/ACRAConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    goto :goto_14
.end method

.method public static init(Landroid/app/Application;)V
    .registers 9
    .param p0, "app"    # Landroid/app/Application;

    .prologue
    .line 118
    sget-object v4, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    if-eqz v4, :cond_e

    .line 119
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "ACRA#init called more than once. Won\'t do anything more."

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :goto_d
    return-void

    .line 123
    :cond_e
    sput-object p0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    .line 124
    sget-object v4, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lorg/acra/annotation/ReportsCrashes;

    sput-object v4, Lorg/acra/ACRA;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    .line 125
    sget-object v4, Lorg/acra/ACRA;->mReportsCrashes:Lorg/acra/annotation/ReportsCrashes;

    if-nez v4, :cond_45

    .line 126
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ACRA#init called but no ReportsCrashes annotation on Application "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v7}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 131
    :cond_45
    invoke-static {}, Lorg/acra/ACRA;->getACRASharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    .line 134
    .local v3, "prefs":Landroid/content/SharedPreferences;
    :try_start_49
    invoke-static {}, Lorg/acra/ACRA;->checkCrashResources()V

    .line 136
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ACRA is enabled for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v7}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", intializing..."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-static {v3}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v4

    if-nez v4, :cond_93

    const/4 v1, 0x1

    .line 140
    .local v1, "enableAcra":Z
    :goto_79
    new-instance v2, Lorg/acra/ErrorReporter;

    sget-object v4, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-direct {v2, v4, v3, v1}, Lorg/acra/ErrorReporter;-><init>(Landroid/app/Application;Landroid/content/SharedPreferences;Z)V

    .line 143
    .local v2, "errorReporter":Lorg/acra/ErrorReporter;
    invoke-virtual {v2}, Lorg/acra/ErrorReporter;->setDefaultReportSenders()V

    .line 145
    sput-object v2, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;
    :try_end_85
    .catch Lorg/acra/ACRAConfigurationException; {:try_start_49 .. :try_end_85} :catch_95

    .line 154
    .end local v1    # "enableAcra":Z
    .end local v2    # "errorReporter":Lorg/acra/ErrorReporter;
    :goto_85
    new-instance v4, Lorg/acra/ACRA$1;

    invoke-direct {v4}, Lorg/acra/ACRA$1;-><init>()V

    sput-object v4, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 168
    sget-object v4, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    goto/16 :goto_d

    .line 139
    :cond_93
    const/4 v1, 0x0

    goto :goto_79

    .line 147
    :catch_95
    move-exception v0

    .line 148
    .local v0, "e":Lorg/acra/ACRAConfigurationException;
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Error : "

    invoke-interface {v4, v5, v6, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_85
.end method

.method static isDebuggable()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 304
    sget-object v3, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 306
    .local v1, "pm":Landroid/content/pm/PackageManager;
    :try_start_7
    sget-object v3, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_14
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_14} :catch_1a

    and-int/lit8 v3, v3, 0x2

    if-lez v3, :cond_19

    const/4 v2, 0x1

    .line 308
    :cond_19
    :goto_19
    return v2

    .line 307
    :catch_1a
    move-exception v0

    .line 308
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_19
.end method

.method public static setConfig(Lorg/acra/ACRAConfiguration;)V
    .registers 1
    .param p0, "conf"    # Lorg/acra/ACRAConfiguration;

    .prologue
    .line 281
    sput-object p0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    .line 282
    return-void
.end method

.method public static setLog(Lorg/acra/log/ACRALog;)V
    .registers 1
    .param p0, "log"    # Lorg/acra/log/ACRALog;

    .prologue
    .line 317
    sput-object p0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    .line 318
    return-void
.end method

.method private static shouldDisableACRA(Landroid/content/SharedPreferences;)Z
    .registers 6
    .param p0, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v2, 0x1

    .line 197
    const/4 v0, 0x0

    .line 199
    .local v0, "disableAcra":Z
    :try_start_2
    const-string v3, "acra.enable"

    const/4 v4, 0x1

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 200
    .local v1, "enableAcra":Z
    const-string v3, "acra.disable"

    if-nez v1, :cond_12

    :goto_d
    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_10} :catch_14

    move-result v0

    .line 204
    .end local v1    # "enableAcra":Z
    :goto_11
    return v0

    .line 200
    .restart local v1    # "enableAcra":Z
    :cond_12
    const/4 v2, 0x0

    goto :goto_d

    .line 201
    .end local v1    # "enableAcra":Z
    :catch_14
    move-exception v2

    goto :goto_11
.end method
