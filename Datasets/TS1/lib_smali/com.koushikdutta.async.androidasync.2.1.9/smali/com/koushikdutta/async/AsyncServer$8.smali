.class final Lcom/koushikdutta/async/AsyncServer$8;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/net/InetAddress;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 428
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 428
    check-cast p1, Ljava/net/InetAddress;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/net/InetAddress;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer$8;->compare(Ljava/net/InetAddress;Ljava/net/InetAddress;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/net/InetAddress;Ljava/net/InetAddress;)I
    .registers 5
    .param p1, "lhs"    # Ljava/net/InetAddress;
    .param p2, "rhs"    # Ljava/net/InetAddress;

    .prologue
    const/4 v0, 0x0

    .line 431
    instance-of v1, p1, Ljava/net/Inet4Address;

    if-eqz v1, :cond_a

    instance-of v1, p2, Ljava/net/Inet4Address;

    if-eqz v1, :cond_a

    .line 437
    :cond_9
    :goto_9
    return v0

    .line 433
    :cond_a
    instance-of v1, p1, Ljava/net/Inet6Address;

    if-eqz v1, :cond_12

    instance-of v1, p2, Ljava/net/Inet6Address;

    if-nez v1, :cond_9

    .line 435
    :cond_12
    instance-of v0, p1, Ljava/net/Inet4Address;

    if-eqz v0, :cond_1c

    instance-of v0, p2, Ljava/net/Inet6Address;

    if-eqz v0, :cond_1c

    .line 436
    const/4 v0, -0x1

    goto :goto_9

    .line 437
    :cond_1c
    const/4 v0, 0x1

    goto :goto_9
.end method
