.class final Lcom/koushikdutta/async/AsyncServer$1;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->wakeup(Lcom/koushikdutta/async/SelectorWrapper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$selector:Lcom/koushikdutta/async/SelectorWrapper;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 2

    .prologue
    .line 130
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$1;->val$selector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 134
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$1;->val$selector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-virtual {v1}, Lcom/koushikdutta/async/SelectorWrapper;->wakeupOnce()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 139
    :goto_5
    return-void

    .line 136
    :catch_6
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "NIO"

    const-string v2, "Selector Exception? L Preview?"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method
