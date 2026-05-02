.class public Lcom/koushikdutta/async/http/body/StringBody;
.super Ljava/lang/Object;
.source "StringBody.java"

# interfaces
.implements Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "text/plain"


# instance fields
.field mBodyBytes:[B

.field string:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/koushikdutta/async/http/body/StringBody;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/koushikdutta/async/http/body/StringBody;->string:Ljava/lang/String;

    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 11
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/body/StringBody;->get()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/body/StringBody;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    const-string v0, "text/plain"

    return-object v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    if-nez v0, :cond_c

    .line 55
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->string:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    .line 56
    :cond_c
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    array-length v0, v0

    return v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 5
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 24
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/parser/StringParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/http/body/StringBody$1;

    invoke-direct {v1, p0, p2}, Lcom/koushikdutta/async/http/body/StringBody$1;-><init>(Lcom/koushikdutta/async/http/body/StringBody;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    .line 31
    return-void
.end method

.method public readFullyOnRequest()Z
    .registers 2

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->string:Ljava/lang/String;

    return-object v0
.end method

.method public write(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 5
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    if-nez v0, :cond_c

    .line 38
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->string:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    .line 39
    :cond_c
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/StringBody;->mBodyBytes:[B

    invoke-static {p2, v0, p3}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 40
    return-void
.end method
