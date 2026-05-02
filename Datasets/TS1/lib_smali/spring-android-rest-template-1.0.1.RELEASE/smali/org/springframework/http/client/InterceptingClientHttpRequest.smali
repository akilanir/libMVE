.class Lorg/springframework/http/client/InterceptingClientHttpRequest;
.super Lorg/springframework/http/client/AbstractBufferingClientHttpRequest;
.source "InterceptingClientHttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/springframework/http/client/InterceptingClientHttpRequest$1;,
        Lorg/springframework/http/client/InterceptingClientHttpRequest$RequestExecution;
    }
.end annotation


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

.field private method:Lorg/springframework/http/HttpMethod;

.field private final requestFactory:Lorg/springframework/http/client/ClientHttpRequestFactory;

.field private uri:Ljava/net/URI;


# direct methods
.method protected constructor <init>(Lorg/springframework/http/client/ClientHttpRequestFactory;Ljava/util/List;Ljava/net/URI;Lorg/springframework/http/HttpMethod;)V
    .registers 5
    .param p1, "requestFactory"    # Lorg/springframework/http/client/ClientHttpRequestFactory;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "method"    # Lorg/springframework/http/HttpMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/springframework/http/client/ClientHttpRequestFactory;",
            "Ljava/util/List",
            "<",
            "Lorg/springframework/http/client/ClientHttpRequestInterceptor;",
            ">;",
            "Ljava/net/URI;",
            "Lorg/springframework/http/HttpMethod;",
            ")V"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "interceptors":Ljava/util/List;, "Ljava/util/List<Lorg/springframework/http/client/ClientHttpRequestInterceptor;>;"
    invoke-direct {p0}, Lorg/springframework/http/client/AbstractBufferingClientHttpRequest;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->requestFactory:Lorg/springframework/http/client/ClientHttpRequestFactory;

    .line 50
    iput-object p2, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->interceptors:Ljava/util/List;

    .line 51
    iput-object p4, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->method:Lorg/springframework/http/HttpMethod;

    .line 52
    iput-object p3, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->uri:Ljava/net/URI;

    .line 53
    return-void
.end method

.method static synthetic access$100(Lorg/springframework/http/client/InterceptingClientHttpRequest;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/springframework/http/client/InterceptingClientHttpRequest;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lorg/springframework/http/client/InterceptingClientHttpRequest;)Lorg/springframework/http/client/ClientHttpRequestFactory;
    .registers 2
    .param p0, "x0"    # Lorg/springframework/http/client/InterceptingClientHttpRequest;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->requestFactory:Lorg/springframework/http/client/ClientHttpRequestFactory;

    return-object v0
.end method


# virtual methods
.method protected final executeInternal(Lorg/springframework/http/HttpHeaders;[B)Lorg/springframework/http/client/ClientHttpResponse;
    .registers 5
    .param p1, "headers"    # Lorg/springframework/http/HttpHeaders;
    .param p2, "bufferedOutput"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    new-instance v0, Lorg/springframework/http/client/InterceptingClientHttpRequest$RequestExecution;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/springframework/http/client/InterceptingClientHttpRequest$RequestExecution;-><init>(Lorg/springframework/http/client/InterceptingClientHttpRequest;Lorg/springframework/http/client/InterceptingClientHttpRequest$1;)V

    .line 67
    .local v0, "requestExecution":Lorg/springframework/http/client/InterceptingClientHttpRequest$RequestExecution;
    invoke-virtual {v0, p0, p2}, Lorg/springframework/http/client/InterceptingClientHttpRequest$RequestExecution;->execute(Lorg/springframework/http/HttpRequest;[B)Lorg/springframework/http/client/ClientHttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public getMethod()Lorg/springframework/http/HttpMethod;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->method:Lorg/springframework/http/HttpMethod;

    return-object v0
.end method

.method public getURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/springframework/http/client/InterceptingClientHttpRequest;->uri:Ljava/net/URI;

    return-object v0
.end method
