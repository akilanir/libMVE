.class Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1$1;
.super Ljava/lang/Object;
.source "AsyncHttpServerResponseImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;->onCompleted(Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;)V
    .registers 2

    .prologue
    .line 127
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 130
    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;

    move-result-object v0

    .line 131
    .local v0, "wb":Lcom/koushikdutta/async/callback/WritableCallback;
    if-eqz v0, :cond_d

    .line 132
    invoke-interface {v0}, Lcom/koushikdutta/async/callback/WritableCallback;->onWriteable()V

    .line 133
    :cond_d
    return-void
.end method
