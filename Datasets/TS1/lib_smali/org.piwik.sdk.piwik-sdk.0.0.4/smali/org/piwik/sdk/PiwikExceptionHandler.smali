.class public Lorg/piwik/sdk/PiwikExceptionHandler;
.super Ljava/lang/Object;
.source "PiwikExceptionHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private final mDefaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final mTracker:Lorg/piwik/sdk/Tracker;


# direct methods
.method public constructor <init>(Lorg/piwik/sdk/Tracker;)V
    .registers 3
    .param p1, "tracker"    # Lorg/piwik/sdk/Tracker;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mTracker:Lorg/piwik/sdk/Tracker;

    .line 23
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    iput-object v0, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mDefaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 24
    return-void
.end method


# virtual methods
.method public getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    .registers 2

    .line 36
    iget-object v0, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mDefaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-object v0
.end method

.method public getTracker()Lorg/piwik/sdk/Tracker;
    .registers 2

    .line 27
    iget-object v0, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mTracker:Lorg/piwik/sdk/Tracker;

    return-object v0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .line 42
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "excInfo":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getTracker()Lorg/piwik/sdk/Tracker;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v0, v2}, Lorg/piwik/sdk/Tracker;->trackException(Ljava/lang/Throwable;Ljava/lang/String;Z)V

    .line 45
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getTracker()Lorg/piwik/sdk/Tracker;

    move-result-object v1

    invoke-virtual {v1}, Lorg/piwik/sdk/Tracker;->dispatch()Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_22
    .catchall {:try_start_0 .. :try_end_13} :catchall_20

    .line 50
    .end local v0    # "excInfo":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    if-eq v0, p0, :cond_3d

    goto :goto_36

    :catchall_20
    move-exception v0

    goto :goto_3e

    .line 46
    :catch_22
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    :try_start_23
    const-string v1, "PIWIK:Tracker"

    const-string v2, "Couldn\'t track uncaught exception"

    invoke-static {v1, v2, v0}, Lorg/piwik/sdk/tools/Logy;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2a
    .catchall {:try_start_23 .. :try_end_2a} :catchall_20

    .line 50
    .end local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    if-eq v0, p0, :cond_3d

    .line 51
    :goto_36
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 54
    :cond_3d
    return-void

    .line 50
    :goto_3e
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    if-eqz v1, :cond_51

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    if-eq v1, p0, :cond_51

    .line 51
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_51
    throw v0
.end method
