.class public Lcom/octo/android/robospice/persistence/retrofit/GsonRetrofitObjectPersisterFactory;
.super Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;
.source "GsonRetrofitObjectPersisterFactory.java"


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lretrofit/converter/GsonConverter;

    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/io/File;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Lretrofit/converter/GsonConverter;

    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/util/List;)V
    .registers 5
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    new-instance v0, Lretrofit/converter/GsonConverter;

    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V
    .registers 6
    .param p1, "application"    # Landroid/app/Application;
    .param p3, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
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
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    new-instance v0, Lretrofit/converter/GsonConverter;

    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .param p3, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V

    .line 22
    return-void
.end method
