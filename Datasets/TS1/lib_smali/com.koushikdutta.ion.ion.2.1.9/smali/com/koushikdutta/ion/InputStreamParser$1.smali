.class Lcom/koushikdutta/ion/InputStreamParser$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "InputStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/InputStreamParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Ljava/io/InputStream;",
        "Lcom/koushikdutta/async/ByteBufferList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/InputStreamParser;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/InputStreamParser;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/ion/InputStreamParser;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/koushikdutta/ion/InputStreamParser$1;->this$0:Lcom/koushikdutta/ion/InputStreamParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected transform(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 3
    .param p1, "result"    # Lcom/koushikdutta/async/ByteBufferList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    new-instance v0, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;-><init>(Lcom/koushikdutta/async/ByteBufferList;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/InputStreamParser$1;->setComplete(Ljava/lang/Object;)Z

    .line 27
    return-void
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    check-cast p1, Lcom/koushikdutta/async/ByteBufferList;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/InputStreamParser$1;->transform(Lcom/koushikdutta/async/ByteBufferList;)V

    return-void
.end method
