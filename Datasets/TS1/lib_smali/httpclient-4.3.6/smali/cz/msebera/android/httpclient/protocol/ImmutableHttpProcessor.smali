.class public final Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
.super Ljava/lang/Object;
.source "ImmutableHttpProcessor.java"

# interfaces
.implements Lcz/msebera/android/httpclient/protocol/HttpProcessor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

.field private final responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpRequestInterceptorList;Lcz/msebera/android/httpclient/protocol/HttpResponseInterceptorList;)V
    .registers 8
    .param p1, "requestInterceptors"    # Lcz/msebera/android/httpclient/protocol/HttpRequestInterceptorList;
    .param p2, "responseInterceptors"    # Lcz/msebera/android/httpclient/protocol/HttpResponseInterceptorList;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    if-eqz p1, :cond_1c

    .line 100
    invoke-interface {p1}, Lcz/msebera/android/httpclient/protocol/HttpRequestInterceptorList;->getRequestInterceptorCount()I

    move-result v0

    .line 101
    .local v0, "count":I
    new-array v2, v0, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 102
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    if-ge v1, v0, :cond_20

    .line 103
    iget-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/protocol/HttpRequestInterceptorList;->getRequestInterceptor(I)Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    move-result-object v3

    aput-object v3, v2, v1

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 106
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_1c
    new-array v2, v4, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 108
    :cond_20
    if-eqz p2, :cond_38

    .line 109
    invoke-interface {p2}, Lcz/msebera/android/httpclient/protocol/HttpResponseInterceptorList;->getResponseInterceptorCount()I

    move-result v0

    .line 110
    .restart local v0    # "count":I
    new-array v2, v0, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 111
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2b
    if-ge v1, v0, :cond_3c

    .line 112
    iget-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    invoke-interface {p2, v1}, Lcz/msebera/android/httpclient/protocol/HttpResponseInterceptorList;->getResponseInterceptor(I)Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    move-result-object v3

    aput-object v3, v2, v1

    .line 111
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 115
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_38
    new-array v2, v4, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 117
    :cond_3c
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequestInterceptor;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponseInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "requestInterceptors":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/HttpRequestInterceptor;>;"
    .local p2, "responseInterceptors":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/HttpResponseInterceptor;>;"
    const/4 v2, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    if-eqz p1, :cond_25

    .line 78
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 79
    .local v0, "l":I
    new-array v1, v0, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    invoke-interface {p1, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 83
    .end local v0    # "l":I
    :goto_14
    if-eqz p2, :cond_2a

    .line 84
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    .line 85
    .restart local v0    # "l":I
    new-array v1, v0, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    invoke-interface {p2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 89
    .end local v0    # "l":I
    :goto_24
    return-void

    .line 81
    :cond_25
    new-array v1, v2, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    goto :goto_14

    .line 87
    :cond_2a
    new-array v1, v2, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    goto :goto_24
.end method

.method public varargs constructor <init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;)V
    .registers 3
    .param p1, "requestInterceptors"    # [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;-><init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;[Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V

    .line 121
    return-void
.end method

.method public constructor <init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;[Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V
    .registers 6
    .param p1, "requestInterceptors"    # [Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .param p2, "responseInterceptors"    # [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    if-eqz p1, :cond_1d

    .line 55
    array-length v0, p1

    .line 56
    .local v0, "l":I
    new-array v1, v0, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 57
    iget-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .end local v0    # "l":I
    :goto_10
    if-eqz p2, :cond_22

    .line 62
    array-length v0, p2

    .line 63
    .restart local v0    # "l":I
    new-array v1, v0, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 64
    iget-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    invoke-static {p2, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    .end local v0    # "l":I
    :goto_1c
    return-void

    .line 59
    :cond_1d
    new-array v1, v2, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    goto :goto_10

    .line 66
    :cond_22
    new-array v1, v2, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    iput-object v1, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    goto :goto_1c
.end method

.method public varargs constructor <init>([Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V
    .registers 3
    .param p1, "responseInterceptors"    # [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;-><init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;[Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V

    .line 125
    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->requestInterceptors:[Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_e

    aget-object v0, v2, v1

    .line 131
    .local v0, "requestInterceptor":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/HttpRequestInterceptor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 133
    .end local v0    # "requestInterceptor":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    :cond_e
    return-void
.end method

.method public process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 7
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v2, p0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;->responseInterceptors:[Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_e

    aget-object v0, v2, v1

    .line 139
    .local v0, "responseInterceptor":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/HttpResponseInterceptor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 141
    .end local v0    # "responseInterceptor":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    :cond_e
    return-void
.end method
