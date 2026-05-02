.class public Lcom/koushikdutta/ion/gson/GsonBody;
.super Ljava/lang/Object;
.source "GsonBody.java"

# interfaces
.implements Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/gson/JsonElement;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "application/json"


# instance fields
.field gson:Lcom/google/gson/Gson;

.field json:Lcom/google/gson/JsonElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field mBodyBytes:[B


# direct methods
.method public constructor <init>(Lcom/google/gson/Gson;Lcom/google/gson/JsonElement;)V
    .registers 3
    .param p1, "gson"    # Lcom/google/gson/Gson;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/Gson;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    .local p2, "json":Lcom/google/gson/JsonElement;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p2, p0, Lcom/koushikdutta/ion/gson/GsonBody;->json:Lcom/google/gson/JsonElement;

    .line 23
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonBody;->gson:Lcom/google/gson/Gson;

    .line 24
    return-void
.end method


# virtual methods
.method public get()Lcom/google/gson/JsonElement;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonBody;->json:Lcom/google/gson/JsonElement;

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 17
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    invoke-virtual {p0}, Lcom/koushikdutta/ion/gson/GsonBody;->get()Lcom/google/gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    const-string v0, "application/json"

    return-object v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 54
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    if-nez v0, :cond_10

    .line 55
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonBody;->json:Lcom/google/gson/JsonElement;

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    .line 56
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    array-length v0, v0

    return v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 5
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 28
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "not implemented"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public readFullyOnRequest()Z
    .registers 2

    .prologue
    .line 49
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public write(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 8
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 33
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonBody;, "Lcom/koushikdutta/ion/gson/GsonBody<TT;>;"
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    if-nez v2, :cond_1b

    .line 34
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 35
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 36
    .local v1, "out":Ljava/io/OutputStreamWriter;
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/GsonBody;->gson:Lcom/google/gson/Gson;

    iget-object v3, p0, Lcom/koushikdutta/ion/gson/GsonBody;->json:Lcom/google/gson/JsonElement;

    invoke-virtual {v2, v3, v1}, Lcom/google/gson/Gson;->toJson(Lcom/google/gson/JsonElement;Ljava/lang/Appendable;)V

    .line 37
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    .line 39
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "out":Ljava/io/OutputStreamWriter;
    :cond_1b
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/GsonBody;->mBodyBytes:[B

    invoke-static {p2, v2, p3}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 40
    return-void
.end method
