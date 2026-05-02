.class Lcom/octo/android/robospice/UncachedSpiceService$1;
.super Lcom/octo/android/robospice/persistence/CacheManager;
.source "UncachedSpiceService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/UncachedSpiceService;->createCacheManager(Landroid/app/Application;)Lcom/octo/android/robospice/persistence/CacheManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/UncachedSpiceService;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/UncachedSpiceService;)V
    .registers 2

    .prologue
    .line 19
    iput-object p1, p0, Lcom/octo/android/robospice/UncachedSpiceService$1;->this$0:Lcom/octo/android/robospice/UncachedSpiceService;

    invoke-direct {p0}, Lcom/octo/android/robospice/persistence/CacheManager;-><init>()V

    return-void
.end method


# virtual methods
.method public saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "data":Ljava/lang/Object;, "TT;"
    return-object p1
.end method
