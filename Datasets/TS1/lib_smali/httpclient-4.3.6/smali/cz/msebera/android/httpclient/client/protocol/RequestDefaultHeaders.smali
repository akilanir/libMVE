.class public Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;
.super Ljava/lang/Object;
.source "RequestDefaultHeaders.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpRequestInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final defaultHeaders:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lcz/msebera/android/httpclient/Header;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;-><init>(Ljava/util/Collection;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcz/msebera/android/httpclient/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "defaultHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lcz/msebera/android/httpclient/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;->defaultHeaders:Ljava/util/Collection;

    .line 59
    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 8
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v3, "HTTP request"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "method":Ljava/lang/String;
    const-string v3, "CONNECT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 87
    :cond_15
    return-void

    .line 77
    :cond_16
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v3

    const-string v4, "http.default-headers"

    invoke-interface {v3, v4}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 78
    .local v1, "defHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lcz/msebera/android/httpclient/Header;>;"
    if-nez v1, :cond_26

    .line 79
    iget-object v1, p0, Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;->defaultHeaders:Ljava/util/Collection;

    .line 82
    :cond_26
    if-eqz v1, :cond_15

    .line 83
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/Header;

    .line 84
    .local v0, "defHeader":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpRequest;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    goto :goto_2c
.end method
