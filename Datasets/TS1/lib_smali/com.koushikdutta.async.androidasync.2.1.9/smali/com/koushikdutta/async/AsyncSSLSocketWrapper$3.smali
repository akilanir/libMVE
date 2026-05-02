.class Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;
.super Ljava/lang/Object;
.source "AsyncSSLSocketWrapper.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/WritableCallback;


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
    .line 138
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWriteable()V
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWriteableCallback:Lcom/koushikdutta/async/callback/WritableCallback;

    if-eqz v0, :cond_d

    .line 142
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWriteableCallback:Lcom/koushikdutta/async/callback/WritableCallback;

    invoke-interface {v0}, Lcom/koushikdutta/async/callback/WritableCallback;->onWriteable()V

    .line 143
    :cond_d
    return-void
.end method
