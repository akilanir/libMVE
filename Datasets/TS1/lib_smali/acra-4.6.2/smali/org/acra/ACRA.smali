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


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-class v0, Lorg/acra/ACRA;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    .line 47
    new-instance v0, Lorg/acra/log/AndroidLogDelegate;

    invoke-direct {v0}, Lorg/acra/log/AndroidLogDelegate;-><init>()V

    sput-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    return-void
.end method

.method static synthetic access$000(Landroid/content/SharedPreferences;)Z
    .registers 2
    .param p0, "x0"    # Landroid/content/SharedPreferences;

    .prologue
    .line 41
    invoke-static {p0}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v0

    return v0
.end method

.method static checkCrashResources(Lorg/acra/annotation/ReportsCrashes;)V
    .registers 3
    .param p0, "conf"    # Lorg/acra/annotation/ReportsCrashes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/ACRAConfigurationException;
        }
    .end annotation

    .prologue
    .line 257
    sget-object v0, Lorg/acra/ACRA$2;->$SwitchMap$org$acra$ReportingInteractionMode:[I

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ReportingInteractionMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_6c

    .line 283
    :cond_f
    return-void

    .line 259
    :pswitch_10
    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resToastText()I

    move-result v0

    if-nez v0, :cond_f

    .line 260
    new-instance v0, Lorg/acra/ACRAConfigurationException;

    const-string v1, "TOAST mode: you have to define the resToastText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 265
    :pswitch_1e
    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v0

    if-nez v0, :cond_38

    .line 266
    :cond_30
    new-instance v0, Lorg/acra/ACRAConfigurationException;

    const-string v1, "NOTIFICATION mode: you have to define at least the resNotifTickerText, resNotifTitle, resNotifText parameters in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 269
    :cond_38
    const-class v0, Lorg/acra/CrashReportDialog;

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->reportDialogClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v0

    if-nez v0, :cond_f

    .line 270
    new-instance v0, Lorg/acra/ACRAConfigurationException;

    const-string v1, "NOTIFICATION mode: using the (default) CrashReportDialog requires you have to define the resDialogText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :pswitch_52
    const-class v0, Lorg/acra/CrashReportDialog;

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->reportDialogClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {p0}, Lorg/acra/annotation/ReportsCrashes;->resDialogText()I

    move-result v0

    if-nez v0, :cond_f

    .line 276
    new-instance v0, Lorg/acra/ACRAConfigurationException;

    const-string v1, "DIALOG mode: using the (default) CrashReportDialog requires you to define the resDialogText parameter in your application @ReportsCrashes() annotation."

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfigurationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_10
        :pswitch_1e
        :pswitch_52
    .end packed-switch
.end method

.method public static getACRASharedPreferences()Landroid/content/SharedPreferences;
    .registers 4

    .prologue
    .line 295
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 296
    .local v0, "conf":Lorg/acra/annotation/ReportsCrashes;
    const-string v1, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 297
    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->sharedPreferencesMode()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 299
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
    .line 359
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method public static getConfig()Lorg/acra/ACRAConfiguration;
    .registers 3

    .prologue
    .line 309
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    if-nez v0, :cond_19

    .line 310
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    if-nez v0, :cond_11

    .line 311
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Calling ACRA.getConfig() before ACRA.init() gives you an empty configuration instance. You might prefer calling ACRA.getNewDefaultConfig(Application) to get an instance with default values taken from a @ReportsCrashes annotation."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    :cond_11
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-static {v0}, Lorg/acra/ACRA;->getNewDefaultConfig(Landroid/app/Application;)Lorg/acra/ACRAConfiguration;

    move-result-object v0

    sput-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    .line 316
    :cond_19
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    return-object v0
.end method

.method public static getErrorReporter()Lorg/acra/ErrorReporter;
    .registers 2

    .prologue
    .line 221
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    if-nez v0, :cond_c

    .line 222
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access ErrorReporter before ACRA#init"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_c
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    return-object v0
.end method

.method public static getNewDefaultConfig(Landroid/app/Application;)Lorg/acra/ACRAConfiguration;
    .registers 4
    .param p0, "app"    # Landroid/app/Application;

    .prologue
    .line 335
    if-eqz p0, :cond_15

    .line 336
    new-instance v1, Lorg/acra/ACRAConfiguration;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/acra/annotation/ReportsCrashes;

    invoke-direct {v1, v0}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    move-object v0, v1

    .line 338
    :goto_14
    return-object v0

    :cond_15
    new-instance v0, Lorg/acra/ACRAConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    goto :goto_14
.end method

.method public static init(Landroid/app/Application;)V
    .registers 6
    .param p0, "app"    # Landroid/app/Application;

    .prologue
    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/acra/annotation/ReportsCrashes;

    .line 116
    .local v0, "reportsCrashes":Lorg/acra/annotation/ReportsCrashes;
    if-nez v0, :cond_2d

    .line 117
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA#init called but no ReportsCrashes annotation on Application "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :goto_2c
    return-void

    .line 121
    :cond_2d
    new-instance v1, Lorg/acra/ACRAConfiguration;

    invoke-direct {v1, v0}, Lorg/acra/ACRAConfiguration;-><init>(Lorg/acra/annotation/ReportsCrashes;)V

    invoke-static {p0, v1}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/ACRAConfiguration;)V

    goto :goto_2c
.end method

.method public static init(Landroid/app/Application;Lorg/acra/ACRAConfiguration;)V
    .registers 3
    .param p0, "app"    # Landroid/app/Application;
    .param p1, "config"    # Lorg/acra/ACRAConfiguration;

    .prologue
    .line 136
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/ACRAConfiguration;Z)V

    .line 137
    return-void
.end method

.method public static init(Landroid/app/Application;Lorg/acra/ACRAConfiguration;Z)V
    .registers 11
    .param p0, "app"    # Landroid/app/Application;
    .param p1, "config"    # Lorg/acra/ACRAConfiguration;
    .param p2, "checkReportsOnApplicationStart"    # Z

    .prologue
    .line 157
    sget-object v4, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    if-eqz v4, :cond_e

    .line 158
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "ACRA#init called more than once. Won\'t do anything more."

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    :goto_d
    return-void

    .line 161
    :cond_e
    sput-object p0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    .line 163
    if-nez p1, :cond_1c

    .line 164
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "ACRA#init called but no ACRAConfiguration provided"

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 167
    :cond_1c
    invoke-static {p1}, Lorg/acra/ACRA;->setConfig(Lorg/acra/ACRAConfiguration;)V

    .line 169
    invoke-static {}, Lorg/acra/ACRA;->getACRASharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    .line 172
    .local v3, "prefs":Landroid/content/SharedPreferences;
    :try_start_23
    invoke-static {p1}, Lorg/acra/ACRA;->checkCrashResources(Lorg/acra/annotation/ReportsCrashes;)V

    .line 174
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

    const-string v7, ", initializing..."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    invoke-static {v3}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v4

    if-nez v4, :cond_71

    const/4 v1, 0x1

    .line 178
    .local v1, "enableAcra":Z
    :goto_53
    new-instance v2, Lorg/acra/ErrorReporter;

    sget-object v4, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-direct {v2, v4, v3, v1}, Lorg/acra/ErrorReporter;-><init>(Landroid/app/Application;Landroid/content/SharedPreferences;Z)V

    .line 181
    .local v2, "errorReporter":Lorg/acra/ErrorReporter;
    invoke-virtual {v2}, Lorg/acra/ErrorReporter;->setDefaultReportSenders()V

    .line 183
    sput-object v2, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    .line 186
    if-eqz p2, :cond_64

    .line 187
    invoke-virtual {v2}, Lorg/acra/ErrorReporter;->checkReportsOnApplicationStart()V
    :try_end_64
    .catch Lorg/acra/ACRAConfigurationException; {:try_start_23 .. :try_end_64} :catch_73

    .line 197
    .end local v1    # "enableAcra":Z
    .end local v2    # "errorReporter":Lorg/acra/ErrorReporter;
    :cond_64
    :goto_64
    new-instance v4, Lorg/acra/ACRA$1;

    invoke-direct {v4}, Lorg/acra/ACRA$1;-><init>()V

    sput-object v4, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 211
    sget-object v4, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    goto :goto_d

    .line 177
    :cond_71
    const/4 v1, 0x0

    goto :goto_53

    .line 190
    :catch_73
    move-exception v0

    .line 191
    .local v0, "e":Lorg/acra/ACRAConfigurationException;
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Error : "

    invoke-interface {v4, v5, v6, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_64
.end method

.method static isDebuggable()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 350
    sget-object v3, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 352
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

    .line 354
    :cond_19
    :goto_19
    return v2

    .line 353
    :catch_1a
    move-exception v0

    .line 354
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_19
.end method

.method public static setConfig(Lorg/acra/ACRAConfiguration;)V
    .registers 1
    .param p0, "conf"    # Lorg/acra/ACRAConfiguration;

    .prologue
    .line 326
    sput-object p0, Lorg/acra/ACRA;->configProxy:Lorg/acra/ACRAConfiguration;

    .line 327
    return-void
.end method

.method public static setLog(Lorg/acra/log/ACRALog;)V
    .registers 3
    .param p0, "log"    # Lorg/acra/log/ACRALog;

    .prologue
    .line 363
    if-nez p0, :cond_a

    .line 364
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "ACRALog cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_a
    sput-object p0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    .line 367
    return-void
.end method

.method private static shouldDisableACRA(Landroid/content/SharedPreferences;)Z
    .registers 6
    .param p0, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v2, 0x1

    .line 240
    const/4 v0, 0x0

    .line 242
    .local v0, "disableAcra":Z
    :try_start_2
    const-string v3, "acra.enable"

    const/4 v4, 0x1

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 243
    .local v1, "enableAcra":Z
    const-string v3, "acra.disable"

    if-nez v1, :cond_12

    :goto_d
    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_10} :catch_14

    move-result v0

    .line 247
    .end local v1    # "enableAcra":Z
    :goto_11
    return v0

    .line 243
    .restart local v1    # "enableAcra":Z
    :cond_12
    const/4 v2, 0x0

    goto :goto_d

    .line 244
    .end local v1    # "enableAcra":Z
    :catch_14
    move-exception v2

    goto :goto_11
.end method
