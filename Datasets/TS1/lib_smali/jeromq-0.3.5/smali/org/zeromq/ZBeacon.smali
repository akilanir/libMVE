.class public Lorg/zeromq/ZBeacon;
.super Ljava/lang/Object;
.source "ZBeacon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZBeacon$BroadcastServer;,
        Lorg/zeromq/ZBeacon$BroadcastClient;,
        Lorg/zeromq/ZBeacon$Listener;
    }
.end annotation


# static fields
.field public static final DEFAULT_BROADCAST_HOST:Ljava/lang/String; = "255.255.255.255"

.field public static final DEFAULT_BROADCAST_INTERVAL:J = 0x3e8L


# instance fields
.field private final beacon:[B

.field private final broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

.field private broadcastInetAddress:Ljava/net/InetAddress;

.field private broadcastInterval:J

.field private final broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

.field private listener:Lorg/zeromq/ZBeacon$Listener;

.field private final port:I

.field private prefix:[B


# direct methods
.method public constructor <init>(I[B)V
    .registers 4
    .param p1, "port"    # I
    .param p2, "beacon"    # [B

    .prologue
    .line 49
    const-string v0, "255.255.255.255"

    invoke-direct {p0, v0, p1, p2}, Lorg/zeromq/ZBeacon;-><init>(Ljava/lang/String;I[B)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[B)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "beacon"    # [B

    .prologue
    .line 54
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/zeromq/ZBeacon;-><init>(Ljava/lang/String;I[BZ)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[BZ)V
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "beacon"    # [B
    .param p4, "ignoreLocalAddress"    # Z

    .prologue
    const/4 v3, 0x1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v1, 0x0

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/zeromq/ZBeacon;->prefix:[B

    .line 44
    const-wide/16 v1, 0x3e8

    iput-wide v1, p0, Lorg/zeromq/ZBeacon;->broadcastInterval:J

    .line 45
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;

    .line 59
    iput p2, p0, Lorg/zeromq/ZBeacon;->port:I

    .line 60
    iput-object p3, p0, Lorg/zeromq/ZBeacon;->beacon:[B

    .line 62
    :try_start_14
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lorg/zeromq/ZBeacon;->broadcastInetAddress:Ljava/net/InetAddress;
    :try_end_1a
    .catch Ljava/net/UnknownHostException; {:try_start_14 .. :try_end_1a} :catch_33

    .line 68
    new-instance v1, Lorg/zeromq/ZBeacon$BroadcastServer;

    invoke-direct {v1, p0, p4}, Lorg/zeromq/ZBeacon$BroadcastServer;-><init>(Lorg/zeromq/ZBeacon;Z)V

    iput-object v1, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    .line 69
    iget-object v1, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    invoke-virtual {v1, v3}, Lorg/zeromq/ZBeacon$BroadcastServer;->setDaemon(Z)V

    .line 70
    new-instance v1, Lorg/zeromq/ZBeacon$BroadcastClient;

    invoke-direct {v1, p0}, Lorg/zeromq/ZBeacon$BroadcastClient;-><init>(Lorg/zeromq/ZBeacon;)V

    iput-object v1, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    .line 71
    iget-object v1, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    invoke-virtual {v1, v3}, Lorg/zeromq/ZBeacon$BroadcastClient;->setDaemon(Z)V

    .line 72
    return-void

    .line 64
    :catch_33
    move-exception v0

    .line 65
    .local v0, "unknownHostException":Ljava/net/UnknownHostException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$000(Lorg/zeromq/ZBeacon;)Ljava/net/InetAddress;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastInetAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method static synthetic access$100(Lorg/zeromq/ZBeacon;)I
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget v0, p0, Lorg/zeromq/ZBeacon;->port:I

    return v0
.end method

.method static synthetic access$200(Lorg/zeromq/ZBeacon;)[B
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->beacon:[B

    return-object v0
.end method

.method static synthetic access$300(Lorg/zeromq/ZBeacon;)J
    .registers 3
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget-wide v0, p0, Lorg/zeromq/ZBeacon;->broadcastInterval:J

    return-wide v0
.end method

.method static synthetic access$400(Lorg/zeromq/ZBeacon;)[B
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->prefix:[B

    return-object v0
.end method

.method static synthetic access$500(Lorg/zeromq/ZBeacon;)Lorg/zeromq/ZBeacon$Listener;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZBeacon;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;

    return-object v0
.end method


# virtual methods
.method public getBroadcastInterval()J
    .registers 3

    .prologue
    .line 248
    iget-wide v0, p0, Lorg/zeromq/ZBeacon;->broadcastInterval:J

    return-wide v0
.end method

.method public getListener()Lorg/zeromq/ZBeacon$Listener;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;

    return-object v0
.end method

.method public getPrefix()[B
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->prefix:[B

    return-object v0
.end method

.method public setBroadcastInterval(J)V
    .registers 3
    .param p1, "broadcastInterval"    # J

    .prologue
    .line 253
    iput-wide p1, p0, Lorg/zeromq/ZBeacon;->broadcastInterval:J

    .line 254
    return-void
.end method

.method public setListener(Lorg/zeromq/ZBeacon$Listener;)V
    .registers 2
    .param p1, "listener"    # Lorg/zeromq/ZBeacon$Listener;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;

    .line 107
    return-void
.end method

.method public setPrefix([B)V
    .registers 2
    .param p1, "prefix"    # [B

    .prologue
    .line 96
    iput-object p1, p0, Lorg/zeromq/ZBeacon;->prefix:[B

    .line 97
    return-void
.end method

.method public start()V
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;

    if-eqz v0, :cond_9

    .line 77
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastServer;->start()V

    .line 79
    :cond_9
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastClient;->start()V

    .line 80
    return-void
.end method

.method public stop()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    if-eqz v0, :cond_e

    .line 85
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastClient;->interrupt()V

    .line 86
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastClient:Lorg/zeromq/ZBeacon$BroadcastClient;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastClient;->join()V

    .line 88
    :cond_e
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    if-eqz v0, :cond_1c

    .line 89
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastServer;->interrupt()V

    .line 90
    iget-object v0, p0, Lorg/zeromq/ZBeacon;->broadcastServer:Lorg/zeromq/ZBeacon$BroadcastServer;

    invoke-virtual {v0}, Lorg/zeromq/ZBeacon$BroadcastServer;->join()V

    .line 92
    :cond_1c
    return-void
.end method
