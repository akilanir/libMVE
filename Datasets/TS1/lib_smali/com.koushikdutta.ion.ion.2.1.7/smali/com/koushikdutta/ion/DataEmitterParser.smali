.class Lcom/koushikdutta/ion/DataEmitterParser;
.super Ljava/lang/Object;
.source "DataEmitterParser.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser",
        "<",
        "Lcom/koushikdutta/async/DataEmitter;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 31
    const-class v0, Lcom/koushikdutta/async/DataEmitter;

    return-object v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
    .registers 3
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/DataEmitter;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/DataEmitter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 20
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/async/DataEmitter;>;"
    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 21
    return-object v0
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "value"    # Lcom/koushikdutta/async/DataEmitter;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 26
    invoke-static {p2, p1, p3}, Lcom/koushikdutta/async/Util;->pump(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 27
    return-void
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "x0"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 16
    check-cast p2, Lcom/koushikdutta/async/DataEmitter;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/ion/DataEmitterParser;->write(Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
