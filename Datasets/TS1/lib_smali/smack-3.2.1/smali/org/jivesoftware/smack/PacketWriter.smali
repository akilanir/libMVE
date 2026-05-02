.class Lorg/jivesoftware/smack/PacketWriter;
.super Ljava/lang/Object;
.source "PacketWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;
    }
.end annotation


# instance fields
.field private connection:Lorg/jivesoftware/smack/XMPPConnection;

.field private done:Z

.field private keepAliveThread:Ljava/lang/Thread;

.field private lastActive:J

.field private final queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lorg/jivesoftware/smack/packet/Packet;",
            ">;"
        }
    .end annotation
.end field

.field private writer:Ljava/io/Writer;

.field private writerThread:Ljava/lang/Thread;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/XMPPConnection;)V
    .registers 5
    .param p1, "connection"    # Lorg/jivesoftware/smack/XMPPConnection;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    .line 61
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x1f4

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(IZ)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    .line 62
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    .line 63
    invoke-virtual {p0}, Lorg/jivesoftware/smack/PacketWriter;->init()V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/PacketWriter;Ljava/lang/Thread;)V
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/PacketWriter;->writePackets(Ljava/lang/Thread;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/PacketWriter;)Z
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 40
    iget-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    return v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/PacketWriter;)Ljava/lang/Thread;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/PacketWriter;)Ljava/io/Writer;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smack/PacketWriter;)J
    .registers 3
    .param p0, "x0"    # Lorg/jivesoftware/smack/PacketWriter;

    .prologue
    .line 40
    iget-wide v0, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    return-wide v0
.end method

.method private nextPacket()Lorg/jivesoftware/smack/packet/Packet;
    .registers 4

    .prologue
    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "packet":Lorg/jivesoftware/smack/packet/Packet;
    :goto_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v1, :cond_1e

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;

    .restart local v0    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    if-nez v0, :cond_1e

    .line 172
    :try_start_f
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    monitor-enter v2
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_12} :catch_1c

    .line 173
    :try_start_12
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 174
    monitor-exit v2

    goto :goto_1

    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_19

    :try_start_1b
    throw v1
    :try_end_1c
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1c} :catch_1c

    .line 176
    :catch_1c
    move-exception v1

    goto :goto_1

    .line 180
    :cond_1e
    return-object v0
.end method

.method private writePackets(Ljava/lang/Thread;)V
    .registers 9
    .param p1, "thisThread"    # Ljava/lang/Thread;

    .prologue
    .line 186
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 188
    :cond_3
    :goto_3
    iget-boolean v3, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v3, :cond_3d

    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    if-ne v3, p1, :cond_3d

    .line 189
    invoke-direct {p0}, Lorg/jivesoftware/smack/PacketWriter;->nextPacket()Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 190
    .local v2, "packet":Lorg/jivesoftware/smack/packet/Packet;
    if-eqz v2, :cond_3

    .line 191
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    monitor-enter v4
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_14} :catch_2d

    .line 192
    :try_start_14
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 193
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->flush()V

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/jivesoftware/smack/PacketWriter;->lastActive:J

    .line 196
    monitor-exit v4

    goto :goto_3

    :catchall_2a
    move-exception v3

    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_14 .. :try_end_2c} :catchall_2a

    :try_start_2c
    throw v3
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2d} :catch_2d

    .line 235
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catch_2d
    move-exception v1

    .line 236
    .local v1, "ioe":Ljava/io/IOException;
    iget-boolean v3, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v3, :cond_3c

    .line 237
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 238
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v3, v3, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    .line 241
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_3c
    :goto_3c
    return-void

    .line 203
    :cond_3d
    :try_start_3d
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    monitor-enter v4
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_40} :catch_5d
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_2d

    .line 204
    :goto_40
    :try_start_40
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7a

    .line 205
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->remove()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/Packet;

    .line 206
    .restart local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_40

    .line 209
    .end local v2    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :catchall_5a
    move-exception v3

    monitor-exit v4
    :try_end_5c
    .catchall {:try_start_40 .. :try_end_5c} :catchall_5a

    :try_start_5c
    throw v3
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5d} :catch_5d
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5d} :catch_2d

    .line 211
    :catch_5d
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5e
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 216
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_61
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->clear()V
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_66} :catch_2d

    .line 220
    :try_start_66
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    const-string v4, "</stream:stream>"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 221
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->flush()V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_72} :catch_81
    .catchall {:try_start_66 .. :try_end_72} :catchall_8a

    .line 228
    :try_start_72
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->close()V
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_77} :catch_78
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_77} :catch_2d

    goto :goto_3c

    .line 230
    :catch_78
    move-exception v3

    goto :goto_3c

    .line 208
    :cond_7a
    :try_start_7a
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->flush()V

    .line 209
    monitor-exit v4
    :try_end_80
    .catchall {:try_start_7a .. :try_end_80} :catchall_5a

    goto :goto_61

    .line 223
    :catch_81
    move-exception v3

    .line 228
    :try_start_82
    iget-object v3, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->close()V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_87} :catch_88
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_87} :catch_2d

    goto :goto_3c

    .line 230
    :catch_88
    move-exception v3

    goto :goto_3c

    .line 227
    :catchall_8a
    move-exception v3

    .line 228
    :try_start_8b
    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v4}, Ljava/io/Writer;->close()V
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_90} :catch_91
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_90} :catch_2d

    .line 232
    :goto_90
    :try_start_90
    throw v3
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_91} :catch_2d

    .line 230
    :catch_91
    move-exception v4

    goto :goto_90
.end method


# virtual methods
.method cleanup()V
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->interceptors:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 159
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->sendListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 160
    return-void
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 74
    new-instance v0, Lorg/jivesoftware/smack/PacketWriter$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/PacketWriter$1;-><init>(Lorg/jivesoftware/smack/PacketWriter;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    .line 79
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Smack Packet Writer ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->connectionCounterValue:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 81
    return-void
.end method

.method openStream()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 252
    .local v0, "stream":Ljava/lang/StringBuilder;
    const-string v1, "<stream:stream"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    const-string v1, " to=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    const-string v1, " xmlns=\"jabber:client\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    const-string v1, " xmlns:stream=\"http://etherx.jabber.org/streams\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    const-string v1, " version=\"1.0\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 258
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V

    .line 259
    return-void
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 89
    iget-boolean v1, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    if-nez v1, :cond_1c

    .line 92
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/XMPPConnection;->firePacketInterceptors(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 95
    :try_start_9
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_e} :catch_1d

    .line 101
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    monitor-enter v2

    .line 102
    :try_start_11
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 103
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_11 .. :try_end_17} :catchall_22

    .line 107
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/XMPPConnection;->firePacketSendingListeners(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 109
    :cond_1c
    :goto_1c
    return-void

    .line 97
    :catch_1d
    move-exception v0

    .line 98
    .local v0, "ie":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1c

    .line 103
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :catchall_22
    move-exception v1

    :try_start_23
    monitor-exit v2
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v1
.end method

.method setWriter(Ljava/io/Writer;)V
    .registers 2
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;

    .line 141
    return-void
.end method

.method public shutdown()V
    .registers 3

    .prologue
    .line 148
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketWriter;->done:Z

    .line 149
    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    monitor-enter v1

    .line 150
    :try_start_6
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 151
    monitor-exit v1

    .line 152
    return-void

    .line 151
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_d

    throw v0
.end method

.method startKeepAliveProcess()V
    .registers 6

    .prologue
    .line 128
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getKeepAliveInterval()I

    move-result v0

    .line 129
    .local v0, "keepAliveInterval":I
    if-lez v0, :cond_44

    .line 130
    new-instance v1, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;

    invoke-direct {v1, p0, v0}, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;-><init>(Lorg/jivesoftware/smack/PacketWriter;I)V

    .line 131
    .local v1, "task":Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    .line 132
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->setThread(Ljava/lang/Thread;)V

    .line 133
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 134
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Smack Keep Alive ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/PacketWriter;->connection:Lorg/jivesoftware/smack/XMPPConnection;

    iget v4, v4, Lorg/jivesoftware/smack/XMPPConnection;->connectionCounterValue:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 135
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 137
    .end local v1    # "task":Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;
    :cond_44
    return-void
.end method

.method public startup()V
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter;->writerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 118
    return-void
.end method
