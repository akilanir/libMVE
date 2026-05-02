.class public Lorg/springframework/http/client/InterceptingClientHttpRequestFactory;
.super Lorg/springframework/http/client/AbstractClientHttpRequestFactoryWrapper;
.source "InterceptingClientHttpRequestFactory.java"


# instance fields
.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/springframework/http/client/ClientHttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/springframework/http/client/ClientHttpRequestFactory;Ljava/util/List;)V
    .registers 4
    .param p1, "requestFactory"    # Lorg/springframework/http/client/ClientHttpRequestFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/springframework/http/client/ClientHttpRequestFactory;",
            "Ljava/util/List",
            "<",
            "Lorg/springframework/http/client/ClientHttpRequestInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "interceptors":Ljava/util/List;, "Ljava/util/List<Lorg/springframework/http/client/ClientHttpRequestInterceptor;>;"
    invoke-direct {p0, p1}, Lorg/springframework/http/client/AbstractClientHttpRequestFactoryWrapper;-><init>(Lorg/springframework/http/client/ClientHttpRequestFactory;)V

    .line 45
    const-string v0, "\'requestFactory\' must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    if-eqz p2, :cond_d

    .end local p2    # "interceptors":Ljava/util/List;, "Ljava/util/List<Lorg/springframework/http/client/ClientHttpRequestInterceptor;>;"
    :goto_a
    iput-object p2, p0, Lorg/springframework/http/client/InterceptingClientHttpRequestFactory;->interceptors:Ljava/util/List;

    .line 47
    return-void

    .line 46
    .restart local p2    # "interceptors":Ljava/util/List;, "Ljava/util/List<Lorg/springframework/http/client/ClientHttpRequestInterceptor;>;"
    :cond_d
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p2

    goto :goto_a
.end method


# virtual methods
.method protected createRequest(Ljava/net/URI;Lorg/springframework/http/HttpMethod;Lorg/springframework/http/client/ClientHttpRequestFactory;)Lorg/springframework/http/client/ClientHttpRequest;
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "httpMethod"    # Lorg/springframework/http/HttpMethod;
    .param p3, "requestFactory"    # Lorg/springframework/http/client/ClientHttpRequestFactory;

    .prologue
    .line 51
    new-instance v0, Lorg/springframework/http/client/InterceptingClientHttpRequest;

    iget-object v1, p0, Lorg/springframework/http/client/InterceptingClientHttpRequestFactory;->interceptors:Ljava/util/List;

    invoke-direct {v0, p3, v1, p1, p2}, Lorg/springframework/http/client/InterceptingClientHttpRequest;-><init>(Lorg/springframework/http/client/ClientHttpRequestFactory;Ljava/util/List;Ljava/net/URI;Lorg/springframework/http/HttpMethod;)V

    return-object v0
.end method
