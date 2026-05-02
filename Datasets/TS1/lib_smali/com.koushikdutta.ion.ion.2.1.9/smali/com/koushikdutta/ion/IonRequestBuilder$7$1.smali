.class Lcom/koushikdutta/ion/IonRequestBuilder$7$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "IonRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$7;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<[B",
        "Lcom/koushikdutta/async/ByteBufferList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$7;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$7;)V
    .registers 2
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$7;

    .prologue
    .line 713
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$7$1;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$7;

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
    .line 716
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getAllByteArray()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder$7$1;->setComplete(Ljava/lang/Object;)Z

    .line 717
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
    .line 713
    check-cast p1, Lcom/koushikdutta/async/ByteBufferList;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$7$1;->transform(Lcom/koushikdutta/async/ByteBufferList;)V

    return-void
.end method
