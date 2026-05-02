.class public abstract Lcom/octo/android/robospice/persistence/ObjectPersister;
.super Ljava/lang/Object;
.source "ObjectPersister.java"

# interfaces
.implements Lcom/octo/android/robospice/persistence/Persister;
.implements Lcom/octo/android/robospice/persistence/CacheCleaner;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/octo/android/robospice/persistence/Persister;",
        "Lcom/octo/android/robospice/persistence/CacheCleaner;"
    }
.end annotation


# instance fields
.field private application:Landroid/app/Application;

.field private clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private isAsyncSaveEnabled:Z


# direct methods
.method public constructor <init>(Landroid/app/Application;Ljava/lang/Class;)V
    .registers 3
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->application:Landroid/app/Application;

    .line 26
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->clazz:Ljava/lang/Class;

    .line 27
    return-void
.end method


# virtual methods
.method public canHandleClass(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->clazz:Ljava/lang/Class;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public abstract getAllCacheKeys()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method

.method public getApplication()Landroid/app/Application;
    .registers 2

    .prologue
    .line 30
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->application:Landroid/app/Application;

    return-object v0
.end method

.method public abstract getCreationDateInCache(Ljava/lang/Object;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation
.end method

.method public getHandledClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->clazz:Ljava/lang/Class;

    return-object v0
.end method

.method public isAsyncSaveEnabled()Z
    .registers 2

    .prologue
    .line 78
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->isAsyncSaveEnabled:Z

    return v0
.end method

.method public abstract isDataInCache(Ljava/lang/Object;J)Z
.end method

.method public abstract loadAllDataFromCache()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation
.end method

.method public abstract loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "J)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation
.end method

.method public abstract removeAllDataFromCache()V
.end method

.method public abstract removeDataFromCache(Ljava/lang/Object;)Z
.end method

.method public abstract saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation
.end method

.method public setAsyncSaveEnabled(Z)V
    .registers 2
    .param p1, "isAsyncSaveEnabled"    # Z

    .prologue
    .line 82
    .local p0, "this":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    iput-boolean p1, p0, Lcom/octo/android/robospice/persistence/ObjectPersister;->isAsyncSaveEnabled:Z

    .line 83
    return-void
.end method
