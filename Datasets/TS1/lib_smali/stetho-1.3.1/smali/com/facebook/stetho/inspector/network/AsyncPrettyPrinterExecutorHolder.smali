.class final Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;
.super Ljava/lang/Object;
.source "AsyncPrettyPrinterExecutorHolder.java"


# static fields
.field private static sExecutorService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static ensureInitialized()V
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_a

    .line 29
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 31
    :cond_a
    return-void
.end method

.method public static getExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 35
    sget-object v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public static shutdown()V
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 40
    const/4 v0, 0x0

    sput-object v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 41
    return-void
.end method
