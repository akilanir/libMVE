.class Lcom/jcraft/jsch/PortWatcher;
.super Ljava/lang/Object;
.source "PortWatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static anyLocalAddress:Ljava/net/InetAddress;

.field private static pool:Ljava/util/Vector;


# instance fields
.field boundaddress:Ljava/net/InetAddress;

.field connectTimeout:I

.field host:Ljava/lang/String;

.field lport:I

.field rport:I

.field session:Lcom/jcraft/jsch/Session;

.field ss:Ljava/net/ServerSocket;

.field thread:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lcom/jcraft/jsch/PortWatcher;->anyLocalAddress:Ljava/net/InetAddress;

    .line 45
    :try_start_a
    const-string v0, "0.0.0.0"

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/PortWatcher;->anyLocalAddress:Ljava/net/InetAddress;
    :try_end_12
    .catch Ljava/net/UnknownHostException; {:try_start_a .. :try_end_12} :catch_13

    .line 48
    :goto_12
    return-void

    .line 46
    :catch_13
    move-exception v0

    goto :goto_12
.end method

.method constructor <init>(Lcom/jcraft/jsch/Session;Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)V
    .registers 13
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "lport"    # I
    .param p4, "host"    # Ljava/lang/String;
    .param p5, "rport"    # I
    .param p6, "factory"    # Lcom/jcraft/jsch/ServerSocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput v3, p0, Lcom/jcraft/jsch/PortWatcher;->connectTimeout:I

    .line 144
    iput-object p1, p0, Lcom/jcraft/jsch/PortWatcher;->session:Lcom/jcraft/jsch/Session;

    .line 145
    iput p3, p0, Lcom/jcraft/jsch/PortWatcher;->lport:I

    .line 146
    iput-object p4, p0, Lcom/jcraft/jsch/PortWatcher;->host:Ljava/lang/String;

    .line 147
    iput p5, p0, Lcom/jcraft/jsch/PortWatcher;->rport:I

    .line 149
    :try_start_e
    invoke-static {p2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, p0, Lcom/jcraft/jsch/PortWatcher;->boundaddress:Ljava/net/InetAddress;

    .line 150
    if-nez p6, :cond_2e

    new-instance v3, Ljava/net/ServerSocket;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/jcraft/jsch/PortWatcher;->boundaddress:Ljava/net/InetAddress;

    invoke-direct {v3, p3, v4, v5}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    :goto_1e
    iput-object v3, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_20} :catch_36

    .line 161
    if-nez p3, :cond_2d

    .line 162
    iget-object v3, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v0

    .line 163
    .local v0, "assigned":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2d

    .line 164
    iput v0, p0, Lcom/jcraft/jsch/PortWatcher;->lport:I

    .line 166
    .end local v0    # "assigned":I
    :cond_2d
    return-void

    .line 150
    :cond_2e
    const/4 v3, 0x0

    :try_start_2f
    iget-object v4, p0, Lcom/jcraft/jsch/PortWatcher;->boundaddress:Ljava/net/InetAddress;

    invoke-interface {p6, p3, v3, v4}, Lcom/jcraft/jsch/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_34} :catch_36

    move-result-object v3

    goto :goto_1e

    .line 154
    :catch_36
    move-exception v1

    .line 156
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PortForwardingL: local port "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " cannot be bound."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "message":Ljava/lang/String;
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_64

    .line 158
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v3, v2, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 159
    :cond_64
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v3, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method static addPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)Lcom/jcraft/jsch/PortWatcher;
    .registers 13
    .param p0, "session"    # Lcom/jcraft/jsch/Session;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "rport"    # I
    .param p5, "ssf"    # Lcom/jcraft/jsch/ServerSocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {p1}, Lcom/jcraft/jsch/PortWatcher;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 107
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/PortWatcher;->getPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)Lcom/jcraft/jsch/PortWatcher;

    move-result-object v1

    if-eqz v1, :cond_33

    .line 108
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PortForwardingL: local port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is already registered."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_33
    new-instance v0, Lcom/jcraft/jsch/PortWatcher;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/PortWatcher;-><init>(Lcom/jcraft/jsch/Session;Ljava/lang/String;ILjava/lang/String;ILcom/jcraft/jsch/ServerSocketFactory;)V

    .line 111
    .local v0, "pw":Lcom/jcraft/jsch/PortWatcher;
    sget-object v1, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 112
    return-object v0
.end method

.method static delPort(Lcom/jcraft/jsch/Session;)V
    .registers 9
    .param p0, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 124
    sget-object v7, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    monitor-enter v7

    .line 125
    :try_start_3
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v3, v6, [Lcom/jcraft/jsch/PortWatcher;

    .line 126
    .local v3, "foo":[Lcom/jcraft/jsch/PortWatcher;
    const/4 v1, 0x0

    .line 127
    .local v1, "count":I
    const/4 v4, 0x0

    .local v4, "i":I
    move v2, v1

    .end local v1    # "count":I
    .local v2, "count":I
    :goto_e
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v4, v6, :cond_31

    .line 128
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/jcraft/jsch/PortWatcher;

    move-object v0, v6

    check-cast v0, Lcom/jcraft/jsch/PortWatcher;

    move-object v5, v0

    .line 129
    .local v5, "p":Lcom/jcraft/jsch/PortWatcher;
    iget-object v6, v5, Lcom/jcraft/jsch/PortWatcher;->session:Lcom/jcraft/jsch/Session;

    if-ne v6, p0, :cond_43

    .line 130
    invoke-virtual {v5}, Lcom/jcraft/jsch/PortWatcher;->delete()V

    .line 131
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    aput-object v5, v3, v2

    .line 127
    :goto_2d
    add-int/lit8 v4, v4, 0x1

    move v2, v1

    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_e

    .line 134
    .end local v5    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_31
    const/4 v4, 0x0

    :goto_32
    if-ge v4, v2, :cond_3e

    .line 135
    aget-object v5, v3, v4

    .line 136
    .restart local v5    # "p":Lcom/jcraft/jsch/PortWatcher;
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v5}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 134
    add-int/lit8 v4, v4, 0x1

    goto :goto_32

    .line 138
    .end local v5    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_3e
    monitor-exit v7

    .line 139
    return-void

    .line 138
    .end local v2    # "count":I
    .end local v3    # "foo":[Lcom/jcraft/jsch/PortWatcher;
    .end local v4    # "i":I
    :catchall_40
    move-exception v6

    monitor-exit v7
    :try_end_42
    .catchall {:try_start_3 .. :try_end_42} :catchall_40

    throw v6

    .restart local v2    # "count":I
    .restart local v3    # "foo":[Lcom/jcraft/jsch/PortWatcher;
    .restart local v4    # "i":I
    .restart local v5    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_43
    move v1, v2

    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_2d
.end method

.method static delPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)V
    .registers 7
    .param p0, "session"    # Lcom/jcraft/jsch/Session;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-static {p1}, Lcom/jcraft/jsch/PortWatcher;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 116
    invoke-static {p0, p1, p2}, Lcom/jcraft/jsch/PortWatcher;->getPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)Lcom/jcraft/jsch/PortWatcher;

    move-result-object v0

    .line 117
    .local v0, "pw":Lcom/jcraft/jsch/PortWatcher;
    if-nez v0, :cond_33

    .line 118
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PortForwardingL: local port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not registered."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :cond_33
    invoke-virtual {v0}, Lcom/jcraft/jsch/PortWatcher;->delete()V

    .line 121
    sget-object v1, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 122
    return-void
.end method

.method static getPort(Lcom/jcraft/jsch/Session;Ljava/lang/String;I)Lcom/jcraft/jsch/PortWatcher;
    .registers 11
    .param p0, "session"    # Lcom/jcraft/jsch/Session;
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "lport"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 78
    :try_start_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_3
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_3} :catch_3c

    move-result-object v1

    .line 83
    .local v1, "addr":Ljava/net/InetAddress;
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 84
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    :try_start_8
    sget-object v5, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v2, v5, :cond_5f

    .line 85
    sget-object v5, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/PortWatcher;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/PortWatcher;

    move-object v3, v0

    .line 86
    .local v3, "p":Lcom/jcraft/jsch/PortWatcher;
    iget-object v5, v3, Lcom/jcraft/jsch/PortWatcher;->session:Lcom/jcraft/jsch/Session;

    if-ne v5, p0, :cond_5c

    iget v5, v3, Lcom/jcraft/jsch/PortWatcher;->lport:I

    if-ne v5, p2, :cond_5c

    .line 87
    sget-object v5, Lcom/jcraft/jsch/PortWatcher;->anyLocalAddress:Ljava/net/InetAddress;

    if-eqz v5, :cond_32

    iget-object v5, v3, Lcom/jcraft/jsch/PortWatcher;->boundaddress:Ljava/net/InetAddress;

    sget-object v7, Lcom/jcraft/jsch/PortWatcher;->anyLocalAddress:Ljava/net/InetAddress;

    invoke-virtual {v5, v7}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    :cond_32
    iget-object v5, v3, Lcom/jcraft/jsch/PortWatcher;->boundaddress:Ljava/net/InetAddress;

    invoke-virtual {v5, v1}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5c

    .line 90
    :cond_3a
    monitor-exit v6
    :try_end_3b
    .catchall {:try_start_8 .. :try_end_3b} :catchall_62

    .line 93
    .end local v3    # "p":Lcom/jcraft/jsch/PortWatcher;
    :goto_3b
    return-object v3

    .line 80
    .end local v1    # "addr":Ljava/net/InetAddress;
    .end local v2    # "i":I
    :catch_3c
    move-exception v4

    .line 81
    .local v4, "uhe":Ljava/net/UnknownHostException;
    new-instance v5, Lcom/jcraft/jsch/JSchException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "PortForwardingL: invalid address "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " specified."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 84
    .end local v4    # "uhe":Ljava/net/UnknownHostException;
    .restart local v1    # "addr":Ljava/net/InetAddress;
    .restart local v2    # "i":I
    .restart local v3    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_5c
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 93
    .end local v3    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_5f
    const/4 v3, 0x0

    :try_start_60
    monitor-exit v6

    goto :goto_3b

    .line 94
    :catchall_62
    move-exception v5

    monitor-exit v6
    :try_end_64
    .catchall {:try_start_60 .. :try_end_64} :catchall_62

    throw v5
.end method

.method static getPortForwarding(Lcom/jcraft/jsch/Session;)[Ljava/lang/String;
    .registers 9
    .param p0, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 60
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 61
    .local v2, "foo":Ljava/util/Vector;
    sget-object v6, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    monitor-enter v6

    .line 62
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_9
    :try_start_9
    sget-object v5, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v3, v5, :cond_4e

    .line 63
    sget-object v5, Lcom/jcraft/jsch/PortWatcher;->pool:Ljava/util/Vector;

    invoke-virtual {v5, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/PortWatcher;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/PortWatcher;

    move-object v4, v0

    .line 64
    .local v4, "p":Lcom/jcraft/jsch/PortWatcher;
    iget-object v5, v4, Lcom/jcraft/jsch/PortWatcher;->session:Lcom/jcraft/jsch/Session;

    if-ne v5, p0, :cond_4b

    .line 65
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, v4, Lcom/jcraft/jsch/PortWatcher;->lport:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, v4, Lcom/jcraft/jsch/PortWatcher;->host:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v4, Lcom/jcraft/jsch/PortWatcher;->rport:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 62
    :cond_4b
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 68
    .end local v4    # "p":Lcom/jcraft/jsch/PortWatcher;
    :cond_4e
    monitor-exit v6
    :try_end_4f
    .catchall {:try_start_9 .. :try_end_4f} :catchall_69

    .line 69
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v1, v5, [Ljava/lang/String;

    .line 70
    .local v1, "bar":[Ljava/lang/String;
    const/4 v3, 0x0

    :goto_56
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v3, v5, :cond_6c

    .line 71
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    check-cast v5, Ljava/lang/String;

    aput-object v5, v1, v3

    .line 70
    add-int/lit8 v3, v3, 0x1

    goto :goto_56

    .line 68
    .end local v1    # "bar":[Ljava/lang/String;
    :catchall_69
    move-exception v5

    :try_start_6a
    monitor-exit v6
    :try_end_6b
    .catchall {:try_start_6a .. :try_end_6b} :catchall_69

    throw v5

    .line 73
    .restart local v1    # "bar":[Ljava/lang/String;
    :cond_6c
    return-object v1
.end method

.method private static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "address"    # Ljava/lang/String;

    .prologue
    .line 97
    if-eqz p0, :cond_12

    .line 98
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 99
    :cond_10
    const-string p0, "0.0.0.0"

    .line 103
    :cond_12
    :goto_12
    return-object p0

    .line 100
    :cond_13
    const-string v0, "localhost"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 101
    const-string p0, "127.0.0.1"

    goto :goto_12
.end method


# virtual methods
.method delete()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 197
    iput-object v0, p0, Lcom/jcraft/jsch/PortWatcher;->thread:Ljava/lang/Runnable;

    .line 199
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V

    .line 200
    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_f} :catch_10

    .line 204
    :goto_f
    return-void

    .line 202
    :catch_10
    move-exception v0

    goto :goto_f
.end method

.method public run()V
    .registers 7

    .prologue
    .line 169
    iput-object p0, p0, Lcom/jcraft/jsch/PortWatcher;->thread:Ljava/lang/Runnable;

    .line 171
    :cond_2
    :goto_2
    :try_start_2
    iget-object v4, p0, Lcom/jcraft/jsch/PortWatcher;->thread:Ljava/lang/Runnable;

    if-eqz v4, :cond_53

    .line 172
    iget-object v4, p0, Lcom/jcraft/jsch/PortWatcher;->ss:Ljava/net/ServerSocket;

    invoke-virtual {v4}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v3

    .line 173
    .local v3, "socket":Ljava/net/Socket;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 174
    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 175
    .local v1, "in":Ljava/io/InputStream;
    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 176
    .local v2, "out":Ljava/io/OutputStream;
    new-instance v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;-><init>()V

    .line 177
    .local v0, "channel":Lcom/jcraft/jsch/ChannelDirectTCPIP;
    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->init()V

    .line 178
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setInputStream(Ljava/io/InputStream;)V

    .line 179
    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setOutputStream(Ljava/io/OutputStream;)V

    .line 180
    iget-object v4, p0, Lcom/jcraft/jsch/PortWatcher;->session:Lcom/jcraft/jsch/Session;

    invoke-virtual {v4, v0}, Lcom/jcraft/jsch/Session;->addChannel(Lcom/jcraft/jsch/Channel;)V

    .line 181
    iget-object v4, p0, Lcom/jcraft/jsch/PortWatcher;->host:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setHost(Ljava/lang/String;)V

    .line 182
    iget v4, p0, Lcom/jcraft/jsch/PortWatcher;->rport:I

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setPort(I)V

    .line 183
    invoke-virtual {v3}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setOrgIPAddress(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v3}, Ljava/net/Socket;->getPort()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->setOrgPort(I)V

    .line 185
    iget v4, p0, Lcom/jcraft/jsch/PortWatcher;->connectTimeout:I

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/ChannelDirectTCPIP;->connect(I)V

    .line 186
    iget v4, v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;->exitstatus:I
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4e} :catch_52

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    goto :goto_2

    .line 190
    .end local v0    # "channel":Lcom/jcraft/jsch/ChannelDirectTCPIP;
    .end local v1    # "in":Ljava/io/InputStream;
    .end local v2    # "out":Ljava/io/OutputStream;
    .end local v3    # "socket":Ljava/net/Socket;
    :catch_52
    move-exception v4

    .line 193
    :cond_53
    invoke-virtual {p0}, Lcom/jcraft/jsch/PortWatcher;->delete()V

    .line 194
    return-void
.end method

.method setConnectTimeout(I)V
    .registers 2
    .param p1, "connectTimeout"    # I

    .prologue
    .line 207
    iput p1, p0, Lcom/jcraft/jsch/PortWatcher;->connectTimeout:I

    .line 208
    return-void
.end method
