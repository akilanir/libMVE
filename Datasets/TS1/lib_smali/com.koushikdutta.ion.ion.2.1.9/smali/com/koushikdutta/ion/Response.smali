.class public Lcom/koushikdutta/ion/Response;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private exception:Ljava/lang/Exception;

.field private headers:Lcom/koushikdutta/ion/HeadersResponse;

.field private request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field private result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 6
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "servedFrom"    # Lcom/koushikdutta/ion/ResponseServedFrom;
    .param p3, "headers"    # Lcom/koushikdutta/ion/HeadersResponse;
    .param p4, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/ion/ResponseServedFrom;",
            "Lcom/koushikdutta/ion/HeadersResponse;",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 9
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    .local p5, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/koushikdutta/ion/Response;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 11
    iput-object p2, p0, Lcom/koushikdutta/ion/Response;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 12
    iput-object p3, p0, Lcom/koushikdutta/ion/Response;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    .line 13
    iput-object p4, p0, Lcom/koushikdutta/ion/Response;->exception:Ljava/lang/Exception;

    .line 14
    iput-object p5, p0, Lcom/koushikdutta/ion/Response;->result:Ljava/lang/Object;

    .line 15
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 34
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/Response;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getHeaders()Lcom/koushikdutta/ion/HeadersResponse;
    .registers 2

    .prologue
    .line 39
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/Response;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    return-object v0
.end method

.method public getRequest()Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 2

    .prologue
    .line 24
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/Response;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    return-object v0
.end method

.method public getResult()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/Response;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public getServedFrom()Lcom/koushikdutta/ion/ResponseServedFrom;
    .registers 2

    .prologue
    .line 19
    .local p0, "this":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/Response;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    return-object v0
.end method
