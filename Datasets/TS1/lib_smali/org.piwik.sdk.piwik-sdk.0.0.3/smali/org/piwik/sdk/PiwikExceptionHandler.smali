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

    .prologue
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

    .prologue
    .line 36
    iget-object v0, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mDefaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-object v0
.end method

.method public getTracker()Lorg/piwik/sdk/Tracker;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lorg/piwik/sdk/PiwikExceptionHandler;->mTracker:Lorg/piwik/sdk/Tracker;

    return-object v0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 42
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "excInfo":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getTracker()Lorg/piwik/sdk/Tracker;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p2, v1, v3}, Lorg/piwik/sdk/Tracker;->trackException(Ljava/lang/Throwable;Ljava/lang/String;Z)V

    .line 45
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getTracker()Lorg/piwik/sdk/Tracker;

    move-result-object v2

    invoke-virtual {v2}, Lorg/piwik/sdk/Tracker;->dispatch()Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_27
    .catchall {:try_start_0 .. :try_end_13} :catchall_43

    .line 50
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    if-eq v2, p0, :cond_26

    .line 51
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 54
    .end local v1    # "excInfo":Ljava/lang/String;
    :cond_26
    :goto_26
    return-void

    .line 46
    :catch_27
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    :try_start_28
    const-string v2, "PIWIK:Tracker"

    const-string v3, "Couldn\'t track uncaught exception"

    invoke-static {v2, v3, v0}, Lorg/piwik/sdk/tools/Logy;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_43

    .line 50
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    if-eq v2, p0, :cond_26

    .line 51
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_26

    .line 50
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_43
    move-exception v2

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v3

    if-eqz v3, :cond_57

    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v3

    if-eq v3, p0, :cond_57

    .line 51
    invoke-virtual {p0}, Lorg/piwik/sdk/PiwikExceptionHandler;->getDefaultExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v3

    invoke-interface {v3, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_57
    throw v2
.end method
