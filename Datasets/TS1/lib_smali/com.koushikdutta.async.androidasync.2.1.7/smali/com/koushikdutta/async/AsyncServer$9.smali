.class Lcom/koushikdutta/async/AsyncServer$9;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "AsyncServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->getByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Ljava/net/InetAddress;",
        "[",
        "Ljava/net/InetAddress;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;)V
    .registers 2

    .prologue
    .line 443
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$9;->this$0:Lcom/koushikdutta/async/AsyncServer;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 443
    check-cast p1, [Ljava/net/InetAddress;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncServer$9;->transform([Ljava/net/InetAddress;)V

    return-void
.end method

.method protected transform([Ljava/net/InetAddress;)V
    .registers 3
    .param p1, "result"    # [Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 446
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer$9;->setComplete(Ljava/lang/Object;)Z

    .line 447
    return-void
.end method
