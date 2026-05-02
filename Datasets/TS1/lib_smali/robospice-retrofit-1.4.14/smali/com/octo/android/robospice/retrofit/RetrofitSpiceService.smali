.class public abstract Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;
.super Lcom/octo/android/robospice/SpiceService;
.source "RetrofitSpiceService.java"


# instance fields
.field private builder:Lretrofit/RestAdapter$Builder;

.field private mConverter:Lretrofit/converter/Converter;

.field private restAdapter:Lretrofit/RestAdapter;

.field protected retrofitInterfaceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private retrofitInterfaceToServiceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceToServiceMap:Ljava/util/Map;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getSpiceRequest()Lcom/octo/android/robospice/request/SpiceRequest;

    move-result-object v1

    instance-of v1, v1, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;

    if-eqz v1, :cond_19

    .line 62
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getSpiceRequest()Lcom/octo/android/robospice/request/SpiceRequest;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;

    .line 63
    .local v0, "retrofitSpiceRequest":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;
    invoke-virtual {v0}, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->getRetrofitedInterfaceClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->getRetrofitService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->setService(Ljava/lang/Object;)V

    .line 65
    .end local v0    # "retrofitSpiceRequest":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;
    :cond_19
    invoke-super {p0, p1, p2}, Lcom/octo/android/robospice/SpiceService;->addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 66
    return-void
.end method

.method protected addRetrofitInterface(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "serviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method protected abstract createConverter()Lretrofit/converter/Converter;
.end method

.method protected createRestAdapterBuilder()Lretrofit/RestAdapter$Builder;
    .registers 3

    .prologue
    .line 35
    new-instance v0, Lretrofit/RestAdapter$Builder;

    invoke-direct {v0}, Lretrofit/RestAdapter$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->getServerUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->getConverter()Lretrofit/converter/Converter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setConverter(Lretrofit/converter/Converter;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected final getConverter()Lretrofit/converter/Converter;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->mConverter:Lretrofit/converter/Converter;

    if-nez v0, :cond_a

    .line 42
    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->createConverter()Lretrofit/converter/Converter;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->mConverter:Lretrofit/converter/Converter;

    .line 45
    :cond_a
    iget-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->mConverter:Lretrofit/converter/Converter;

    return-object v0
.end method

.method public final getRetrofitInterfaceList()Ljava/util/List;
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
    .line 69
    iget-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceList:Ljava/util/List;

    return-object v0
.end method

.method protected getRetrofitService(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "serviceClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceToServiceMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 51
    .local v0, "service":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_13

    .line 52
    iget-object v1, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->restAdapter:Lretrofit/RestAdapter;

    invoke-virtual {v1, p1}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->retrofitInterfaceToServiceMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    :cond_13
    return-object v0
.end method

.method protected abstract getServerUrl()Ljava/lang/String;
.end method

.method public onCreate()V
    .registers 2

    .prologue
    .line 27
    invoke-super {p0}, Lcom/octo/android/robospice/SpiceService;->onCreate()V

    .line 28
    invoke-virtual {p0}, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->createRestAdapterBuilder()Lretrofit/RestAdapter$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->builder:Lretrofit/RestAdapter$Builder;

    .line 29
    iget-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->builder:Lretrofit/RestAdapter$Builder;

    invoke-virtual {v0}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/retrofit/RetrofitSpiceService;->restAdapter:Lretrofit/RestAdapter;

    .line 30
    return-void
.end method
