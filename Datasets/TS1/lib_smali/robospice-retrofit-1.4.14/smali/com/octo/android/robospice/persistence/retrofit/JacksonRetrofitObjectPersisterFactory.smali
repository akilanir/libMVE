.class public Lcom/octo/android/robospice/persistence/retrofit/JacksonRetrofitObjectPersisterFactory;
.super Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;
.source "JacksonRetrofitObjectPersisterFactory.java"


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
    .line 33
    new-instance v0, Lretrofit/converter/JacksonConverter;

    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/JacksonConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;)V

    .line 34
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
    .line 19
    new-instance v0, Lretrofit/converter/JacksonConverter;

    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/JacksonConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V

    .line 20
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
    .line 29
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    new-instance v0, Lretrofit/converter/JacksonConverter;

    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/JacksonConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;)V

    .line 30
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
    .line 24
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    new-instance v0, Lretrofit/converter/JacksonConverter;

    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/JacksonConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/util/List;Ljava/io/File;)V

    .line 25
    return-void
.end method
