.class public final Lorg/acra/ACRA;
.super Ljava/lang/Object;
.source "ACRA.java"


# static fields
.field private static final ACRA_PRIVATE_PROCESS_NAME:Ljava/lang/String; = ":acra"

.field public static DEV_LOGGING:Z = false

.field public static final LOG_TAG:Ljava/lang/String;

.field public static final PREF_ALWAYS_ACCEPT:Ljava/lang/String; = "acra.alwaysaccept"

.field public static final PREF_DISABLE_ACRA:Ljava/lang/String; = "acra.disable"

.field public static final PREF_ENABLE_ACRA:Ljava/lang/String; = "acra.enable"

.field public static final PREF_ENABLE_DEVICE_ID:Ljava/lang/String; = "acra.deviceid.enable"

.field public static final PREF_ENABLE_SYSTEM_LOGS:Ljava/lang/String; = "acra.syslog.enable"

.field public static final PREF_LAST_VERSION_NR:Ljava/lang/String; = "acra.lastVersionNr"

.field public static final PREF_USER_EMAIL_ADDRESS:Ljava/lang/String; = "acra.user.email"

.field private static final PREF__LEGACY_ALREADY_CONVERTED_TO_4_8_0:Ljava/lang/String; = "acra.legacyAlreadyConvertedTo4.8.0"

.field private static configProxy:Lorg/acra/config/ACRAConfiguration;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static errorReporterSingleton:Lorg/acra/ErrorReporter;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public static log:Lorg/acra/log/ACRALog;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private static mApplication:Landroid/app/Application;

.field private static mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const/4 v0, 0x0

    sput-boolean v0, Lorg/acra/ACRA;->DEV_LOGGING:Z

    .line 57
    const-class v0, Lorg/acra/ACRA;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    .line 60
    new-instance v0, Lorg/acra/log/AndroidLogDelegate;

    invoke-direct {v0}, Lorg/acra/log/AndroidLogDelegate;-><init>()V

    sput-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/SharedPreferences;)Z
    .registers 2
    .param p0, "x0"    # Landroid/content/SharedPreferences;

    .prologue
    .line 52
    invoke-static {p0}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v0

    return v0
.end method

.method public static getACRASharedPreferences()Landroid/content/SharedPreferences;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 366
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    if-nez v0, :cond_c

    .line 367
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call ACRA.getACRASharedPreferences() before ACRA.init()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 369
    :cond_c
    new-instance v0, Lorg/acra/prefs/SharedPreferencesFactory;

    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    sget-object v2, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, v1, v2}, Lorg/acra/prefs/SharedPreferencesFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    invoke-virtual {v0}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static getConfig()Lorg/acra/config/ACRAConfiguration;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 380
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    if-nez v0, :cond_c

    .line 381
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call ACRA.getConfig() before ACRA.init()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 383
    :cond_c
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    return-object v0
.end method

.method private static getCurrentProcessName()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 318
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    const-string v2, "/proc/self/cmdline"

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/acra/util/IOUtils;->streamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_10

    move-result-object v1

    .line 320
    .local v0, "e":Ljava/io/IOException;
    :goto_f
    return-object v1

    .line 319
    .end local v0    # "e":Ljava/io/IOException;
    :catch_10
    move-exception v0

    .line 320
    .restart local v0    # "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public static getErrorReporter()Lorg/acra/ErrorReporter;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 330
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    if-nez v0, :cond_c

    .line 331
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access ErrorReporter before ACRA#init"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_c
    sget-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    return-object v0
.end method

.method public static init(Landroid/app/Application;)V
    .registers 7
    .param p0, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 138
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lorg/acra/annotation/ReportsCrashes;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/acra/annotation/ReportsCrashes;

    .line 139
    .local v1, "reportsCrashes":Lorg/acra/annotation/ReportsCrashes;
    if-nez v1, :cond_2d

    .line 140
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ACRA#init(Application) called but no ReportsCrashes annotation on Application "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :goto_2c
    return-void

    .line 144
    :cond_2d
    :try_start_2d
    new-instance v2, Lorg/acra/config/ConfigurationBuilder;

    invoke-direct {v2, p0}, Lorg/acra/config/ConfigurationBuilder;-><init>(Landroid/app/Application;)V

    invoke-virtual {v2}, Lorg/acra/config/ConfigurationBuilder;->build()Lorg/acra/config/ACRAConfiguration;

    move-result-object v2

    invoke-static {p0, v2}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;)V
    :try_end_39
    .catch Lorg/acra/config/ACRAConfigurationException; {:try_start_2d .. :try_end_39} :catch_3a

    goto :goto_2c

    .line 145
    :catch_3a
    move-exception v0

    .line 146
    .local v0, "e":Lorg/acra/config/ACRAConfigurationException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Configuration Error - ACRA not started : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/acra/config/ACRAConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2c
.end method

.method public static init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;)V
    .registers 3
    .param p0, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 200
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Z)V

    .line 201
    return-void
.end method

.method public static init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Z)V
    .registers 15
    .param p0, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "checkReportsOnApplicationStart"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v10, 0x0

    .line 217
    invoke-static {}, Lorg/acra/ACRA;->isACRASenderServiceProcess()Z

    move-result v8

    .line 218
    .local v8, "senderServiceProcess":Z
    if-eqz v8, :cond_15

    .line 219
    sget-boolean v0, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v0, :cond_15

    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Not initialising ACRA to listen for uncaught Exceptions as this is the SendWorker process and we only send reports, we don\'t capture them to avoid infinite loops"

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    :cond_15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_35

    move v5, v6

    .line 223
    .local v5, "supportedAndroidVersion":Z
    :goto_1c
    if-nez v5, :cond_27

    .line 225
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA 4.7.0+ requires Froyo or greater. ACRA is disabled and will NOT catch crashes or send messages."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :cond_27
    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    if-eqz v0, :cond_37

    .line 229
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA#init called more than once. Won\'t do anything more."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    :goto_34
    return-void

    .end local v5    # "supportedAndroidVersion":Z
    :cond_35
    move v5, v10

    .line 222
    goto :goto_1c

    .line 232
    .restart local v5    # "supportedAndroidVersion":Z
    :cond_37
    sput-object p0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    .line 235
    if-nez p1, :cond_45

    .line 236
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA#init called but no ACRAConfiguration provided"

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34

    .line 239
    :cond_45
    sput-object p1, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    .line 241
    new-instance v0, Lorg/acra/prefs/SharedPreferencesFactory;

    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    sget-object v2, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, v1, v2}, Lorg/acra/prefs/SharedPreferencesFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    invoke-virtual {v0}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v3

    .line 244
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string v0, "acra.legacyAlreadyConvertedTo4.8.0"

    invoke-interface {v3, v0, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_71

    .line 246
    new-instance v0, Lorg/acra/legacy/ReportMigrator;

    invoke-direct {v0, p0}, Lorg/acra/legacy/ReportMigrator;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lorg/acra/legacy/ReportMigrator;->migrate()V

    .line 249
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "acra.legacyAlreadyConvertedTo4.8.0"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 250
    .local v7, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {v7}, Lorg/acra/prefs/PrefUtils;->save(Landroid/content/SharedPreferences$Editor;)V

    .line 254
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_71
    if-eqz v5, :cond_ed

    invoke-static {v3}, Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z

    move-result v0

    if-nez v0, :cond_ed

    move v4, v6

    .line 255
    .local v4, "enableAcra":Z
    :goto_7a
    if-nez v8, :cond_b0

    .line 257
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ACRA is "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    if-eqz v4, :cond_ef

    const-string v0, "enabled"

    :goto_8f
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v11, " for "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v11, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-virtual {v11}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v11, ", initializing..."

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    :cond_b0
    new-instance v0, Lorg/acra/ErrorReporter;

    sget-object v1, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    sget-object v2, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    if-nez v8, :cond_f2

    :goto_b8
    invoke-direct/range {v0 .. v6}, Lorg/acra/ErrorReporter;-><init>(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Landroid/content/SharedPreferences;ZZZ)V

    sput-object v0, Lorg/acra/ACRA;->errorReporterSingleton:Lorg/acra/ErrorReporter;

    .line 263
    if-eqz p2, :cond_df

    if-nez v8, :cond_df

    .line 264
    new-instance v9, Lorg/acra/util/ApplicationStartupProcessor;

    sget-object v0, Lorg/acra/ACRA;->mApplication:Landroid/app/Application;

    invoke-direct {v9, v0, p1}, Lorg/acra/util/ApplicationStartupProcessor;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 265
    .local v9, "startupProcessor":Lorg/acra/util/ApplicationStartupProcessor;
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v0

    if-eqz v0, :cond_d1

    .line 266
    invoke-virtual {v9}, Lorg/acra/util/ApplicationStartupProcessor;->deleteUnsentReportsFromOldAppVersion()V

    .line 268
    :cond_d1
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v0

    if-eqz v0, :cond_da

    .line 269
    invoke-virtual {v9}, Lorg/acra/util/ApplicationStartupProcessor;->deleteAllUnapprovedReportsBarOne()V

    .line 271
    :cond_da
    if-eqz v4, :cond_df

    .line 272
    invoke-virtual {v9}, Lorg/acra/util/ApplicationStartupProcessor;->sendApprovedReports()V

    .line 279
    .end local v9    # "startupProcessor":Lorg/acra/util/ApplicationStartupProcessor;
    :cond_df
    new-instance v0, Lorg/acra/ACRA$1;

    invoke-direct {v0}, Lorg/acra/ACRA$1;-><init>()V

    sput-object v0, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 293
    sget-object v0, Lorg/acra/ACRA;->mPrefListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v3, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    goto/16 :goto_34

    .end local v4    # "enableAcra":Z
    :cond_ed
    move v4, v10

    .line 254
    goto :goto_7a

    .line 257
    .restart local v4    # "enableAcra":Z
    :cond_ef
    const-string v0, "disabled"

    goto :goto_8f

    :cond_f2
    move v6, v10

    .line 259
    goto :goto_b8
.end method

.method public static init(Landroid/app/Application;Lorg/acra/config/ConfigurationBuilder;)V
    .registers 3
    .param p0, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "builder"    # Lorg/acra/config/ConfigurationBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 164
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/config/ConfigurationBuilder;Z)V

    .line 165
    return-void
.end method

.method public static init(Landroid/app/Application;Lorg/acra/config/ConfigurationBuilder;Z)V
    .registers 8
    .param p0, "app"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "builder"    # Lorg/acra/config/ConfigurationBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "checkReportsOnApplicationStart"    # Z

    .prologue
    .line 180
    :try_start_0
    invoke-virtual {p1}, Lorg/acra/config/ConfigurationBuilder;->build()Lorg/acra/config/ACRAConfiguration;

    move-result-object v1

    invoke-static {p0, v1, p2}, Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Z)V
    :try_end_7
    .catch Lorg/acra/config/ACRAConfigurationException; {:try_start_0 .. :try_end_7} :catch_8

    .line 184
    :goto_7
    return-void

    .line 181
    :catch_8
    move-exception v0

    .line 182
    .local v0, "e":Lorg/acra/config/ACRAConfigurationException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Configuration Error - ACRA not started : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lorg/acra/config/ACRAConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7
.end method

.method public static isACRASenderServiceProcess()Z
    .registers 5

    .prologue
    .line 309
    invoke-static {}, Lorg/acra/ACRA;->getCurrentProcessName()Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "processName":Ljava/lang/String;
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_28

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA processName=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x27

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    :cond_28
    if-eqz v0, :cond_34

    const-string v1, ":acra"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_34

    const/4 v1, 0x1

    :goto_33
    return v1

    :cond_34
    const/4 v1, 0x0

    goto :goto_33
.end method

.method public static isInitialised()Z
    .registers 1

    .prologue
    .line 301
    sget-object v0, Lorg/acra/ACRA;->configProxy:Lorg/acra/config/ACRAConfiguration;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static setLog(Lorg/acra/log/ACRALog;)V
    .registers 3
    .param p0, "log"    # Lorg/acra/log/ACRALog;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 388
    if-nez p0, :cond_a

    .line 389
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "ACRALog cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 391
    :cond_a
    sput-object p0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    .line 392
    return-void
.end method

.method private static shouldDisableACRA(Landroid/content/SharedPreferences;)Z
    .registers 6
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x1

    .line 349
    const/4 v0, 0x0

    .line 351
    .local v0, "disableAcra":Z
    :try_start_2
    const-string v3, "acra.enable"

    const/4 v4, 0x1

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 352
    .local v1, "enableAcra":Z
    const-string v3, "acra.disable"

    if-nez v1, :cond_12

    :goto_d
    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_10} :catch_14

    move-result v0

    .line 356
    .end local v1    # "enableAcra":Z
    :goto_11
    return v0

    .line 352
    .restart local v1    # "enableAcra":Z
    :cond_12
    const/4 v2, 0x0

    goto :goto_d

    .line 353
    .end local v1    # "enableAcra":Z
    :catch_14
    move-exception v2

    goto :goto_11
.end method
