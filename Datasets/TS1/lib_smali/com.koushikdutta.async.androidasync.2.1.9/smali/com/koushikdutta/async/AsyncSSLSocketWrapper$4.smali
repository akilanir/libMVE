.class Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;
.super Ljava/lang/Object;
.source "AsyncSSLSocketWrapper.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncSSLSocketWrapper;-><init>(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/String;ILjavax/net/ssl/SSLEngine;[Ljavax/net/ssl/TrustManager;Ljavax/net/ssl/HostnameVerifier;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-boolean v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEnded:Z

    if-eqz v0, :cond_7

    .line 158
    :cond_6
    :goto_6
    return-void

    .line 154
    :cond_7
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEnded:Z

    .line 155
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iput-object p1, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndException:Ljava/lang/Exception;

    .line 156
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    if-eqz v0, :cond_6

    .line 157
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_6
.end method
