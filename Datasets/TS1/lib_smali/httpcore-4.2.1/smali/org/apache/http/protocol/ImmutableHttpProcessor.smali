.class public final Lorg/apache/http/protocol/ImmutableHttpProcessor;
.super Ljava/lang/Object;
.source "ImmutableHttpProcessor.java"

# interfaces
.implements Lorg/apache/http/protocol/HttpProcessor;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

.field private final responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestInterceptorList;Lorg/apache/http/protocol/HttpResponseInterceptorList;)V
    .registers 8
    .param p1, "requestInterceptors"    # Lorg/apache/http/protocol/HttpRequestInterceptorList;
    .param p2, "responseInterceptors"    # Lorg/apache/http/protocol/HttpResponseInterceptorList;

    .prologue
    const/4 v4, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    if-eqz p1, :cond_1c

    .line 78
    invoke-interface {p1}, Lorg/apache/http/protocol/HttpRequestInterceptorList;->getRequestInterceptorCount()I

    move-result v0

    .line 79
    .local v0, "count":I
    new-array v2, v0, [Lorg/apache/http/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    .line 80
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v0, :cond_20

    .line 81
    iget-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    invoke-interface {p1, v1}, Lorg/apache/http/protocol/HttpRequestInterceptorList;->getRequestInterceptor(I)Lorg/apache/http/HttpRequestInterceptor;

    move-result-object v3

    aput-object v3, v2, v1

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 84
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_1c
    new-array v2, v4, [Lorg/apache/http/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    .line 86
    :cond_20
    if-eqz p2, :cond_38

    .line 87
    invoke-interface {p2}, Lorg/apache/http/protocol/HttpResponseInterceptorList;->getResponseInterceptorCount()I

    move-result v0

    .line 88
    .restart local v0    # "count":I
    new-array v2, v0, [Lorg/apache/http/HttpResponseInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    .line 89
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2b
    if-ge v1, v0, :cond_3c

    .line 90
    iget-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    invoke-interface {p2, v1}, Lorg/apache/http/protocol/HttpResponseInterceptorList;->getResponseInterceptor(I)Lorg/apache/http/HttpResponseInterceptor;

    move-result-object v3

    aput-object v3, v2, v1

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 93
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_38
    new-array v2, v4, [Lorg/apache/http/HttpResponseInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    .line 95
    :cond_3c
    return-void
.end method

.method public constructor <init>([Lorg/apache/http/HttpRequestInterceptor;)V
    .registers 3
    .param p1, "requestInterceptors"    # [Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;[Lorg/apache/http/HttpResponseInterceptor;)V

    .line 99
    return-void
.end method

.method public constructor <init>([Lorg/apache/http/HttpRequestInterceptor;[Lorg/apache/http/HttpResponseInterceptor;)V
    .registers 8
    .param p1, "requestInterceptors"    # [Lorg/apache/http/HttpRequestInterceptor;
    .param p2, "responseInterceptors"    # [Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    const/4 v4, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    if-eqz p1, :cond_17

    .line 54
    array-length v0, p1

    .line 55
    .local v0, "count":I
    new-array v2, v0, [Lorg/apache/http/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    .line 56
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v0, :cond_1b

    .line 57
    iget-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    aget-object v3, p1, v1

    aput-object v3, v2, v1

    .line 56
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 60
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_17
    new-array v2, v4, [Lorg/apache/http/HttpRequestInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    .line 62
    :cond_1b
    if-eqz p2, :cond_2e

    .line 63
    array-length v0, p2

    .line 64
    .restart local v0    # "count":I
    new-array v2, v0, [Lorg/apache/http/HttpResponseInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    .line 65
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_23
    if-ge v1, v0, :cond_32

    .line 66
    iget-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    aget-object v3, p2, v1

    aput-object v3, v2, v1

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 69
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_2e
    new-array v2, v4, [Lorg/apache/http/HttpResponseInterceptor;

    iput-object v2, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    .line 71
    :cond_32
    return-void
.end method

.method public constructor <init>([Lorg/apache/http/HttpResponseInterceptor;)V
    .registers 3
    .param p1, "responseInterceptors"    # [Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;[Lorg/apache/http/HttpResponseInterceptor;)V

    .line 103
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 5
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    array-length v1, v1

    if-ge v0, v1, :cond_10

    .line 109
    iget-object v1, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lorg/apache/http/HttpRequestInterceptor;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2}, Lorg/apache/http/HttpRequestInterceptor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 111
    :cond_10
    return-void
.end method

.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 5
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 116
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    array-length v1, v1

    if-ge v0, v1, :cond_10

    .line 117
    iget-object v1, p0, Lorg/apache/http/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lorg/apache/http/HttpResponseInterceptor;

    aget-object v1, v1, v0

    invoke-interface {v1, p1, p2}, Lorg/apache/http/HttpResponseInterceptor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 116
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 119
    :cond_10
    return-void
.end method
