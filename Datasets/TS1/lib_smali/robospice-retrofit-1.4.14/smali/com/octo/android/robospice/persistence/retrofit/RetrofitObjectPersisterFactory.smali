.class public Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;
.super Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;
.source "RetrofitObjectPersisterFactory.java"


# instance fields
.field private converter:Lretrofit/converter/Converter;


# direct methods
.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .param p3, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lretrofit/converter/Converter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 40
    .local p3, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .param p4, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lretrofit/converter/Converter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V

    .line 31
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;->converter:Lretrofit/converter/Converter;

    .line 32
    return-void
.end method


# virtual methods
.method public createInFileObjectPersister(Ljava/lang/Class;Ljava/io/File;)Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
    .registers 6
    .param p2, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DATA:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TDATA;>;",
            "Ljava/io/File;",
            ")",
            "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
            "<TDATA;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TDATA;>;"
    new-instance v0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;

    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;->getApplication()Landroid/app/Application;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;->converter:Lretrofit/converter/Converter;

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/lang/Class;Ljava/io/File;)V

    return-object v0
.end method
