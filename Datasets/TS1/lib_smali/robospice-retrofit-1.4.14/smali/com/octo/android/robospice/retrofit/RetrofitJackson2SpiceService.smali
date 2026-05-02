.class public abstract Lcom/octo/android/robospice/retrofit/RetrofitJackson2SpiceService;
.super Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;
.source "RetrofitJackson2SpiceService.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;-><init>()V

    return-void
.end method


# virtual methods
.method public createCacheManager(Landroid/app/Application;)Lcom/octo/android/robospice/persistence/CacheManager;
    .registers 6
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v0, Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-direct {v0}, Lcom/octo/android/robospice/persistence/CacheManager;-><init>()V

    .line 31
    .local v0, "cacheManager":Lcom/octo/android/robospice/persistence/CacheManager;
    new-instance v1, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;

    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitJackson2SpiceService;->getConverter()Lretrofit/converter/Converter;

    move-result-object v2

    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitJackson2SpiceService;->getCacheFolder()Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, p1, v2, v3}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/io/File;)V

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/persistence/CacheManager;->addPersister(Lcom/octo/android/robospice/persistence/Persister;)V

    .line 32
    return-object v0
.end method

.method protected createConverter()Lretrofit/converter/Converter;
    .registers 3

    .prologue
    .line 37
    new-instance v0, Lretrofit/converter/JacksonConverter;

    new-instance v1, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-direct {v0, v1}, Lretrofit/converter/JacksonConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    return-object v0
.end method

.method public getCacheFolder()Ljava/io/File;
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    return-object v0
.end method
