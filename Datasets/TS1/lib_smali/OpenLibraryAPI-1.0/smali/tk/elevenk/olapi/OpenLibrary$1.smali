.class final Ltk/elevenk/olapi/OpenLibrary$1;
.super Lorg/apache/http/impl/client/DefaultRedirectHandler;
.source "OpenLibrary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltk/elevenk/olapi/OpenLibrary;->getRedirectHandler()Lorg/apache/http/client/RedirectHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 244
    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultRedirectHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public isRedirectRequested(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 247
    invoke-super {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultRedirectHandler;->isRedirectRequested(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    .line 248
    .local v0, "isRedirect":Z
    if-nez v0, :cond_17

    .line 249
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 250
    .local v1, "responseCode":I
    const/16 v2, 0x12d

    if-eq v1, v2, :cond_16

    const/16 v2, 0x12e

    if-ne v1, v2, :cond_17

    .line 251
    :cond_16
    const/4 v0, 0x1

    .line 254
    .end local v0    # "isRedirect":Z
    .end local v1    # "responseCode":I
    :cond_17
    return v0
.end method
