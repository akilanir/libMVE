.class Lcom/koushikdutta/ion/mock/MockResponseFuture$1;
.super Ljava/lang/Object;
.source "MockResponseFuture.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/mock/MockResponseFuture;->withResponse()Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/mock/MockResponseFuture;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/mock/MockResponseFuture;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/mock/MockResponseFuture;

    .prologue
    .line 37
    .local p0, "this":Lcom/koushikdutta/ion/mock/MockResponseFuture$1;, "Lcom/koushikdutta/ion/mock/MockResponseFuture.1;"
    iput-object p1, p0, Lcom/koushikdutta/ion/mock/MockResponseFuture$1;->this$0:Lcom/koushikdutta/ion/mock/MockResponseFuture;

    iput-object p2, p0, Lcom/koushikdutta/ion/mock/MockResponseFuture$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/koushikdutta/ion/mock/MockResponseFuture$1;, "Lcom/koushikdutta/ion/mock/MockResponseFuture.1;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/koushikdutta/ion/mock/MockResponseFuture$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iget-object v1, p0, Lcom/koushikdutta/ion/mock/MockResponseFuture$1;->this$0:Lcom/koushikdutta/ion/mock/MockResponseFuture;

    # invokes: Lcom/koushikdutta/ion/mock/MockResponseFuture;->getResponse(Ljava/lang/Exception;Ljava/lang/Object;)Lcom/koushikdutta/ion/Response;
    invoke-static {v1, p1, p2}, Lcom/koushikdutta/ion/mock/MockResponseFuture;->access$000(Lcom/koushikdutta/ion/mock/MockResponseFuture;Ljava/lang/Exception;Ljava/lang/Object;)Lcom/koushikdutta/ion/Response;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 41
    return-void
.end method
