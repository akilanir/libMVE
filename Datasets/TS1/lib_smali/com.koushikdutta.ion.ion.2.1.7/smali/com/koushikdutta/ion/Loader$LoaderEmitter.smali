.class public Lcom/koushikdutta/ion/Loader$LoaderEmitter;
.super Ljava/lang/Object;
.source "Loader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/Loader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LoaderEmitter"
.end annotation


# instance fields
.field emitter:Lcom/koushikdutta/async/DataEmitter;

.field headers:Lcom/koushikdutta/ion/HeadersResponse;

.field length:J

.field request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/DataEmitter;JLcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 7
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "length"    # J
    .param p4, "servedFrom"    # Lcom/koushikdutta/ion/ResponseServedFrom;
    .param p5, "headers"    # Lcom/koushikdutta/ion/HeadersResponse;
    .param p6, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-wide p2, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->length:J

    .line 24
    iput-object p1, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->emitter:Lcom/koushikdutta/async/DataEmitter;

    .line 25
    iput-object p4, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 26
    iput-object p5, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    .line 27
    iput-object p6, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 28
    return-void
.end method


# virtual methods
.method public getDataEmitter()Lcom/koushikdutta/async/DataEmitter;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->emitter:Lcom/koushikdutta/async/DataEmitter;

    return-object v0
.end method

.method public getHeaders()Lcom/koushikdutta/ion/HeadersResponse;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->headers:Lcom/koushikdutta/ion/HeadersResponse;

    return-object v0
.end method

.method public getRequest()Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    return-object v0
.end method

.method public getServedFrom()Lcom/koushikdutta/ion/ResponseServedFrom;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    return-object v0
.end method

.method public length()J
    .registers 3

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;->length:J

    return-wide v0
.end method
