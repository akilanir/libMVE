.class public Lorg/zeromq/ZMQ;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZMQ$Event;,
        Lorg/zeromq/ZMQ$Error;,
        Lorg/zeromq/ZMQ$PollItem;,
        Lorg/zeromq/ZMQ$Poller;,
        Lorg/zeromq/ZMQ$Socket;,
        Lorg/zeromq/ZMQ$Context;
    }
.end annotation


# static fields
.field public static final CHARSET:Ljava/nio/charset/Charset;

.field public static final DEALER:I = 0x5

.field public static final DONTWAIT:I = 0x1

.field public static final DOWNSTREAM:I = 0x8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final EVENT_ACCEPTED:I = 0x20

.field public static final EVENT_ACCEPT_FAILED:I = 0x40

.field public static final EVENT_ALL:I = 0x7ff

.field public static final EVENT_BIND_FAILED:I = 0x10

.field public static final EVENT_CLOSED:I = 0x80

.field public static final EVENT_CLOSE_FAILED:I = 0x100

.field public static final EVENT_CONNECTED:I = 0x1

.field public static final EVENT_CONNECT_DELAYED:I = 0x2

.field public static final EVENT_CONNECT_RETRIED:I = 0x4

.field public static final EVENT_DELAYED:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final EVENT_DISCONNECTED:I = 0x200

.field public static final EVENT_LISTENING:I = 0x8

.field public static final EVENT_MONITOR_STOPPED:I = 0x400

.field public static final EVENT_RETRIED:I = 0x4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORWARDER:I = 0x2

.field public static final MESSAGE_SEPARATOR:[B

.field public static final NOBLOCK:I = 0x1

.field public static final PAIR:I = 0x0

.field public static final PUB:I = 0x1

.field public static final PULL:I = 0x7

.field public static final PUSH:I = 0x8

.field public static final QUEUE:I = 0x3

.field public static final REP:I = 0x4

.field public static final REQ:I = 0x3

.field public static final ROUTER:I = 0x6

.field public static final SNDMORE:I = 0x2

.field public static final STREAMER:I = 0x1

.field public static final SUB:I = 0x2

.field public static final SUBSCRIPTION_ALL:[B

.field public static final UPSTREAM:I = 0x7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final XPUB:I = 0x9

.field public static final XREP:I = 0x6

.field public static final XREQ:I = 0x5

.field public static final XSUB:I = 0xa


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 236
    new-array v0, v1, [B

    sput-object v0, Lorg/zeromq/ZMQ;->MESSAGE_SEPARATOR:[B

    .line 238
    new-array v0, v1, [B

    sput-object v0, Lorg/zeromq/ZMQ;->SUBSCRIPTION_ALL:[B

    .line 240
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    return-void
.end method

.method public static context(I)Lorg/zeromq/ZMQ$Context;
    .registers 2
    .param p0, "ioThreads"    # I

    .prologue
    .line 255
    new-instance v0, Lorg/zeromq/ZMQ$Context;

    invoke-direct {v0, p0}, Lorg/zeromq/ZMQ$Context;-><init>(I)V

    return-object v0
.end method

.method public static device(ILorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;)Z
    .registers 6
    .param p0, "type"    # I
    .param p1, "frontend"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "backend"    # Lorg/zeromq/ZMQ$Socket;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1911
    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p1}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v0

    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p2}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lzmq/ZMQ;->proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z

    move-result v0

    return v0
.end method

.method public static getFullVersion()I
    .registers 3

    .prologue
    .line 1979
    const/4 v0, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x5

    invoke-static {v0, v1, v2}, Lzmq/ZMQ;->makeVersion(III)I

    move-result v0

    return v0
.end method

.method public static getMajorVersion()I
    .registers 1

    .prologue
    .line 1955
    const/4 v0, 0x3

    return v0
.end method

.method public static getMinorVersion()I
    .registers 1

    .prologue
    .line 1963
    const/4 v0, 0x2

    return v0
.end method

.method public static getPatchVersion()I
    .registers 1

    .prologue
    .line 1971
    const/4 v0, 0x5

    return v0
.end method

.method public static getVersionString()Ljava/lang/String;
    .registers 1

    .prologue
    .line 2003
    const-string v0, "3.2.5"

    return-object v0
.end method

.method public static makeVersion(III)I
    .registers 4
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .param p2, "patch"    # I

    .prologue
    .line 1995
    invoke-static {p0, p1, p2}, Lzmq/ZMQ;->makeVersion(III)I

    move-result v0

    return v0
.end method

.method public static poll([Lorg/zeromq/ZMQ$PollItem;IJ)I
    .registers 7
    .param p0, "items"    # [Lorg/zeromq/ZMQ$PollItem;
    .param p1, "count"    # I
    .param p2, "timeout"    # J

    .prologue
    .line 1942
    new-array v1, p1, [Lzmq/PollItem;

    .line 1943
    .local v1, "pollItems":[Lzmq/PollItem;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p1, :cond_10

    .line 1944
    aget-object v2, p0, v0

    # getter for: Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;
    invoke-static {v2}, Lorg/zeromq/ZMQ$PollItem;->access$200(Lorg/zeromq/ZMQ$PollItem;)Lzmq/PollItem;

    move-result-object v2

    aput-object v2, v1, v0

    .line 1943
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 1947
    :cond_10
    invoke-static {v1, p1, p2, p3}, Lzmq/ZMQ;->poll([Lzmq/PollItem;IJ)I

    move-result v2

    return v2
.end method

.method public static poll([Lorg/zeromq/ZMQ$PollItem;J)I
    .registers 4
    .param p0, "items"    # [Lorg/zeromq/ZMQ$PollItem;
    .param p1, "timeout"    # J

    .prologue
    .line 1937
    array-length v0, p0

    invoke-static {p0, v0, p1, p2}, Lorg/zeromq/ZMQ;->poll([Lorg/zeromq/ZMQ$PollItem;IJ)I

    move-result v0

    return v0
.end method

.method public static proxy(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;)Z
    .registers 6
    .param p0, "frontend"    # Lorg/zeromq/ZMQ$Socket;
    .param p1, "backend"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "capture"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 1932
    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p0}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v1

    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p1}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v2

    if-eqz p2, :cond_13

    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p2}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v0

    :goto_e
    invoke-static {v1, v2, v0}, Lzmq/ZMQ;->proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z

    move-result v0

    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_e
.end method
