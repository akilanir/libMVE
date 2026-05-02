.class public final Linfo/metadude/java/library/halfnarp/ApiModule;
.super Ljava/lang/Object;
.source "ApiModule.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createRetrofit(Ljava/lang/String;Ljava/util/List;)Lretrofit/Retrofit;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Interceptor;",
            ">;)",
            "Lretrofit/Retrofit;"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "httpClientInterceptors":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Interceptor;>;"
    new-instance v0, Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v0}, Lcom/squareup/okhttp/OkHttpClient;-><init>()V

    .line 25
    .local v0, "httpClient":Lcom/squareup/okhttp/OkHttpClient;
    if-eqz p1, :cond_e

    .line 26
    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->interceptors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    :cond_e
    new-instance v1, Lretrofit/Retrofit$Builder;

    invoke-direct {v1}, Lretrofit/Retrofit$Builder;-><init>()V

    invoke-virtual {v1, p0}, Lretrofit/Retrofit$Builder;->baseUrl(Ljava/lang/String;)Lretrofit/Retrofit$Builder;

    move-result-object v1

    invoke-static {}, Linfo/metadude/java/library/halfnarp/ApiModule;->provideObjectMapper()Lcom/fasterxml/jackson/databind/ObjectMapper;

    move-result-object v2

    invoke-static {v2}, Lretrofit/JacksonConverterFactory;->create(Lcom/fasterxml/jackson/databind/ObjectMapper;)Lretrofit/JacksonConverterFactory;

    move-result-object v2

    invoke-virtual {v1, v2}, Lretrofit/Retrofit$Builder;->addConverterFactory(Lretrofit/Converter$Factory;)Lretrofit/Retrofit$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lretrofit/Retrofit$Builder;->client(Lcom/squareup/okhttp/OkHttpClient;)Lretrofit/Retrofit$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/Retrofit$Builder;->build()Lretrofit/Retrofit;

    move-result-object v1

    return-object v1
.end method

.method public static getTalkPreferencesService()Linfo/metadude/java/library/halfnarp/TalkPreferencesService;
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    invoke-static {v0}, Linfo/metadude/java/library/halfnarp/ApiModule;->getTalkPreferencesService(Ljava/util/List;)Linfo/metadude/java/library/halfnarp/TalkPreferencesService;

    move-result-object v0

    return-object v0
.end method

.method public static getTalkPreferencesService(Ljava/util/List;)Linfo/metadude/java/library/halfnarp/TalkPreferencesService;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Interceptor;",
            ">;)",
            "Linfo/metadude/java/library/halfnarp/TalkPreferencesService;"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "httpClientInterceptors":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Interceptor;>;"
    const-string v0, "http://halfnarp.events.ccc.de"

    invoke-static {v0, p0}, Linfo/metadude/java/library/halfnarp/ApiModule;->createRetrofit(Ljava/lang/String;Ljava/util/List;)Lretrofit/Retrofit;

    move-result-object v0

    const-class v1, Linfo/metadude/java/library/halfnarp/TalkPreferencesService;

    invoke-virtual {v0, v1}, Lretrofit/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Linfo/metadude/java/library/halfnarp/TalkPreferencesService;

    return-object v0
.end method

.method private static provideObjectMapper()Lcom/fasterxml/jackson/databind/ObjectMapper;
    .registers 2

    .prologue
    .line 37
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    .line 38
    .local v0, "objectMapper":Lcom/fasterxml/jackson/databind/ObjectMapper;
    sget-object v1, Lcom/fasterxml/jackson/databind/PropertyNamingStrategy;->CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES:Lcom/fasterxml/jackson/databind/PropertyNamingStrategy;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/ObjectMapper;->setPropertyNamingStrategy(Lcom/fasterxml/jackson/databind/PropertyNamingStrategy;)Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 40
    return-object v0
.end method
