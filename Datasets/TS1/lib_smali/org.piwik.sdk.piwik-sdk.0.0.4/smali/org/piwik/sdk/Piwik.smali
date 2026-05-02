.class public Lorg/piwik/sdk/Piwik;
.super Ljava/lang/Object;
.source "Piwik.java"


# static fields
.field public static final LOGGER_PREFIX:Ljava/lang/String; = "PIWIK:"

.field public static final PREFERENCE_FILE_NAME:Ljava/lang/String; = "org.piwik.sdk"

.field public static final PREFERENCE_KEY_OPTOUT:Ljava/lang/String; = "piwik.optout"

.field private static sInstance:Lorg/piwik/sdk/Piwik;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDebug:Z

.field private mDryRun:Z

.field private mOptOut:Z

.field private final mSharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mOptOut:Z

    .line 25
    iput-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mDryRun:Z

    .line 28
    iput-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mDebug:Z

    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lorg/piwik/sdk/Piwik;->mContext:Landroid/content/Context;

    .line 39
    invoke-virtual {p0}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "org.piwik.sdk"

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/piwik/sdk/Piwik;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 40
    invoke-virtual {p0}, Lorg/piwik/sdk/Piwik;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "piwik.optout"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mOptOut:Z

    .line 41
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lorg/piwik/sdk/Piwik;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    const-class v0, Lorg/piwik/sdk/Piwik;

    monitor-enter v0

    .line 32
    :try_start_3
    sget-object v1, Lorg/piwik/sdk/Piwik;->sInstance:Lorg/piwik/sdk/Piwik;

    if-nez v1, :cond_e

    .line 33
    new-instance v1, Lorg/piwik/sdk/Piwik;

    invoke-direct {v1, p0}, Lorg/piwik/sdk/Piwik;-><init>(Landroid/content/Context;)V

    sput-object v1, Lorg/piwik/sdk/Piwik;->sInstance:Lorg/piwik/sdk/Piwik;

    .line 34
    :cond_e
    sget-object v1, Lorg/piwik/sdk/Piwik;->sInstance:Lorg/piwik/sdk/Piwik;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-object v1

    .line 31
    .end local p0    # "context":Landroid/content/Context;
    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public getApplicationDomain()Ljava/lang/String;
    .registers 2

    .line 114
    invoke-virtual {p0}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getContext()Landroid/content/Context;
    .registers 2

    .line 44
    iget-object v0, p0, Lorg/piwik/sdk/Piwik;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getSharedPreferences()Landroid/content/SharedPreferences;
    .registers 2

    .line 123
    iget-object v0, p0, Lorg/piwik/sdk/Piwik;->mSharedPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public isDebug()Z
    .registers 2

    .line 94
    iget-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mDebug:Z

    return v0
.end method

.method public isDryRun()Z
    .registers 2

    .line 90
    iget-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mDryRun:Z

    return v0
.end method

.method public isOptOut()Z
    .registers 2

    .line 86
    iget-boolean v0, p0, Lorg/piwik/sdk/Piwik;->mOptOut:Z

    return v0
.end method

.method public declared-synchronized newTracker(Ljava/lang/String;I)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "trackerUrl"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "siteId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    monitor-enter p0

    .line 67
    :try_start_1
    new-instance v0, Lorg/piwik/sdk/Tracker;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, p0}, Lorg/piwik/sdk/Tracker;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/piwik/sdk/Piwik;)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    monitor-exit p0

    return-object v0

    .line 67
    .end local p1    # "trackerUrl":Ljava/lang/String;
    .end local p2    # "siteId":I
    :catchall_9
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized newTracker(Ljava/lang/String;ILjava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "trackerUrl"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "siteId"    # I
    .param p3, "authToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    monitor-enter p0

    .line 57
    :try_start_1
    new-instance v0, Lorg/piwik/sdk/Tracker;

    invoke-direct {v0, p1, p2, p3, p0}, Lorg/piwik/sdk/Tracker;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/piwik/sdk/Piwik;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object v0

    .line 57
    .end local p1    # "trackerUrl":Ljava/lang/String;
    .end local p2    # "siteId":I
    .end local p3    # "authToken":Ljava/lang/String;
    :catchall_8
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setDebug(Z)V
    .registers 3
    .param p1, "debug"    # Z

    .line 98
    iput-boolean p1, p0, Lorg/piwik/sdk/Piwik;->mDebug:Z

    .line 99
    if-eqz p1, :cond_6

    const/4 v0, 0x2

    goto :goto_7

    :cond_6
    const/4 v0, -0x1

    :goto_7
    sput v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    .line 100
    return-void
.end method

.method public setDryRun(Z)V
    .registers 2
    .param p1, "dryRun"    # Z

    .line 110
    iput-boolean p1, p0, Lorg/piwik/sdk/Piwik;->mDryRun:Z

    .line 111
    return-void
.end method

.method public setOptOut(Z)V
    .registers 4
    .param p1, "optOut"    # Z

    .line 78
    iput-boolean p1, p0, Lorg/piwik/sdk/Piwik;->mOptOut:Z

    .line 79
    invoke-virtual {p0}, Lorg/piwik/sdk/Piwik;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "piwik.optout"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 80
    return-void
.end method
