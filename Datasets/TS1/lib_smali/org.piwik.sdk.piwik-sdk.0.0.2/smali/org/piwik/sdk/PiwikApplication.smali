.class public abstract Lorg/piwik/sdk/PiwikApplication;
.super Landroid/app/Application;
.source "PiwikApplication.java"


# instance fields
.field private mPiwikTracker:Lorg/piwik/sdk/Tracker;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public getPiwik()Lorg/piwik/sdk/Piwik;
    .registers 2

    .prologue
    .line 19
    invoke-static {p0}, Lorg/piwik/sdk/Piwik;->getInstance(Landroid/content/Context;)Lorg/piwik/sdk/Piwik;

    move-result-object v0

    return-object v0
.end method

.method public abstract getSiteId()Ljava/lang/Integer;
.end method

.method public declared-synchronized getTracker()Lorg/piwik/sdk/Tracker;
    .registers 5

    .prologue
    .line 28
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_2b

    if-nez v1, :cond_1b

    .line 30
    :try_start_5
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikApplication;->getPiwik()Lorg/piwik/sdk/Piwik;

    move-result-object v1

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikApplication;->getTrackerUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikApplication;->getSiteId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/piwik/sdk/Piwik;->newTracker(Ljava/lang/String;I)Lorg/piwik/sdk/Tracker;

    move-result-object v1

    iput-object v1, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;
    :try_end_1b
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_1b} :catch_1f
    .catchall {:try_start_5 .. :try_end_1b} :catchall_2b

    .line 36
    :cond_1b
    :try_start_1b
    iget-object v1, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;
    :try_end_1d
    .catchall {:try_start_1b .. :try_end_1d} :catchall_2b

    monitor-exit p0

    return-object v1

    .line 31
    :catch_1f
    move-exception v0

    .line 32
    .local v0, "e":Ljava/net/MalformedURLException;
    :try_start_20
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 33
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Tracker URL was malformed."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2b
    .catchall {:try_start_20 .. :try_end_2b} :catchall_2b

    .line 28
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catchall_2b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public abstract getTrackerUrl()Ljava/lang/String;
.end method

.method public onLowMemory()V
    .registers 3

    .prologue
    .line 52
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_f

    iget-object v0, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;

    if-eqz v0, :cond_f

    .line 53
    iget-object v0, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;

    invoke-virtual {v0}, Lorg/piwik/sdk/Tracker;->dispatch()Z

    .line 55
    :cond_f
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 56
    return-void
.end method

.method public onTrimMemory(I)V
    .registers 3
    .param p1, "level"    # I

    .prologue
    .line 60
    const/16 v0, 0x14

    if-eq p1, v0, :cond_8

    const/16 v0, 0x50

    if-ne p1, v0, :cond_11

    :cond_8
    iget-object v0, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;

    if-eqz v0, :cond_11

    .line 61
    iget-object v0, p0, Lorg/piwik/sdk/PiwikApplication;->mPiwikTracker:Lorg/piwik/sdk/Tracker;

    invoke-virtual {v0}, Lorg/piwik/sdk/Tracker;->dispatch()Z

    .line 63
    :cond_11
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 64
    return-void
.end method
