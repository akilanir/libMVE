.class public Lzmq/TcpAddress$TcpAddressMask;
.super Lzmq/TcpAddress;
.source "TcpAddress.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/TcpAddress;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TcpAddressMask"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lzmq/TcpAddress;-><init>()V

    return-void
.end method


# virtual methods
.method public matchAddress(Ljava/net/SocketAddress;)Z
    .registers 3
    .param p1, "addr"    # Ljava/net/SocketAddress;

    .prologue
    .line 34
    iget-object v0, p0, Lzmq/TcpAddress$TcpAddressMask;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v0, p1}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
