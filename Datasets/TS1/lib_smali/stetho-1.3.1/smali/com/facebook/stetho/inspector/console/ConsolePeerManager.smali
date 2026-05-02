.class public Lcom/facebook/stetho/inspector/console/ConsolePeerManager;
.super Lcom/facebook/stetho/inspector/helper/ChromePeerManager;
.source "ConsolePeerManager.java"


# static fields
.field private static sInstance:Lcom/facebook/stetho/inspector/console/ConsolePeerManager;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    .line 22
    return-void
.end method

.method public static declared-synchronized getInstanceOrNull()Lcom/facebook/stetho/inspector/console/ConsolePeerManager;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 26
    const-class v0, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;->sInstance:Lcom/facebook/stetho/inspector/console/ConsolePeerManager;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized getOrCreateInstance()Lcom/facebook/stetho/inspector/console/ConsolePeerManager;
    .registers 2

    .prologue
    .line 30
    const-class v1, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;->sInstance:Lcom/facebook/stetho/inspector/console/ConsolePeerManager;

    if-nez v0, :cond_e

    .line 31
    new-instance v0, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;-><init>()V

    sput-object v0, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;->sInstance:Lcom/facebook/stetho/inspector/console/ConsolePeerManager;

    .line 33
    :cond_e
    sget-object v0, Lcom/facebook/stetho/inspector/console/ConsolePeerManager;->sInstance:Lcom/facebook/stetho/inspector/console/ConsolePeerManager;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 30
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method
