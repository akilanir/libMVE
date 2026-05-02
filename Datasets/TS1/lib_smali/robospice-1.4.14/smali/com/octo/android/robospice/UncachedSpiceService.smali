.class public Lcom/octo/android/robospice/UncachedSpiceService;
.super Lcom/octo/android/robospice/SpiceService;
.source "UncachedSpiceService.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;-><init>()V

    return-void
.end method


# virtual methods
.method public createCacheManager(Landroid/app/Application;)Lcom/octo/android/robospice/persistence/CacheManager;
    .registers 3
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 19
    new-instance v0, Lcom/octo/android/robospice/UncachedSpiceService$1;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/UncachedSpiceService$1;-><init>(Lcom/octo/android/robospice/UncachedSpiceService;)V

    return-object v0
.end method
