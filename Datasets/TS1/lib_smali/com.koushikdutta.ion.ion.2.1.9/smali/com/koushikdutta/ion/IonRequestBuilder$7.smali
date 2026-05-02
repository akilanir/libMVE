.class Lcom/koushikdutta/ion/IonRequestBuilder$7;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->asByteArray()Lcom/koushikdutta/ion/future/ResponseFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser",
        "<[B>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 709
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$7;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 728
    const-class v0, [B

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
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 712
    new-instance v0, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/parser/ByteBufferListParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/IonRequestBuilder$7$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder$7$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$7;)V

    .line 713
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    return-object v0
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "x0"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 709
    check-cast p2, [B

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/ion/IonRequestBuilder$7;->write(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method

.method public write(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 6
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "value"    # [B
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 723
    new-instance v0, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    new-instance v1, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v1, p2}, Lcom/koushikdutta/async/ByteBufferList;-><init>([B)V

    invoke-virtual {v0, p1, v1, p3}, Lcom/koushikdutta/async/parser/ByteBufferListParser;->write(Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/ByteBufferList;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 724
    return-void
.end method
