.class Lcom/koushikdutta/ion/InputStreamParser;
.super Ljava/lang/Object;
.source "InputStreamParser.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser",
        "<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 38
    const-class v0, Ljava/io/InputStream;

    return-object v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/DataEmitter;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/parser/ByteBufferListParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/InputStreamParser$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/InputStreamParser$1;-><init>(Lcom/koushikdutta/ion/InputStreamParser;)V

    .line 23
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    return-object v0
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Ljava/io/InputStream;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 6
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "value"    # Ljava/io/InputStream;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 33
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "not implemented"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "x0"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 19
    check-cast p2, Ljava/io/InputStream;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/ion/InputStreamParser;->write(Lcom/koushikdutta/async/DataSink;Ljava/io/InputStream;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
