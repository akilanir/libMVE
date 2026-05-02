.class public abstract Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
.super Ljava/lang/Object;
.source "ObjectPersisterFactory.java"

# interfaces
.implements Lcom/octo/android/robospice/persistence/Persister;


# instance fields
.field private isAsyncSaveEnabled:Z

.field private listHandledClasses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private mApplication:Landroid/app/Application;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 3
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/util/List;)V
    .registers 3
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->mApplication:Landroid/app/Application;

    .line 52
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->listHandledClasses:Ljava/util/List;

    .line 53
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
    .line 69
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->listHandledClasses:Ljava/util/List;

    if-nez v0, :cond_6

    .line 70
    const/4 v0, 0x1

    .line 72
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->listHandledClasses:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public abstract createObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DATA:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TDATA;>;)",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<TDATA;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation
.end method

.method protected final getApplication()Landroid/app/Application;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method protected getListHandledClasses()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->listHandledClasses:Ljava/util/List;

    return-object v0
.end method

.method public isAsyncSaveEnabled()Z
    .registers 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->isAsyncSaveEnabled:Z

    return v0
.end method

.method public setAsyncSaveEnabled(Z)V
    .registers 2
    .param p1, "isAsyncSaveEnabled"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->isAsyncSaveEnabled:Z

    .line 99
    return-void
.end method
