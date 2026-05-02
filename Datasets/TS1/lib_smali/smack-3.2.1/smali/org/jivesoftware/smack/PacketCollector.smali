.class public Lorg/jivesoftware/smack/PacketCollector;
.super Ljava/lang/Object;
.source "PacketCollector.java"


# instance fields
.field private cancelled:Z

.field private conection:Lorg/jivesoftware/smack/Connection;

.field private maxPackets:I

.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private resultQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/jivesoftware/smack/packet/Packet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 4
    .param p1, "conection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketCollectorSize()I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smack/PacketCollector;->maxPackets:I

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    .line 64
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketCollector;->conection:Lorg/jivesoftware/smack/Connection;

    .line 65
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 66
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    .line 67
    return-void
.end method

.method protected constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/filter/PacketFilter;I)V
    .registers 4
    .param p1, "conection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;
    .param p3, "maxSize"    # I

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/PacketCollector;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 79
    iput p3, p0, Lorg/jivesoftware/smack/PacketCollector;->maxPackets:I

    .line 80
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 89
    iget-boolean v0, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    if-nez v0, :cond_c

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/PacketCollector;->cancelled:Z

    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->conection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/Connection;->removePacketCollector(Lorg/jivesoftware/smack/PacketCollector;)V

    .line 93
    :cond_c
    return-void
.end method

.method public getPacketFilter()Lorg/jivesoftware/smack/filter/PacketFilter;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    return-object v0
.end method

.method public declared-synchronized nextResult()Lorg/jivesoftware/smack/packet/Packet;
    .registers 2

    .prologue
    .line 130
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_19

    move-result v0

    if-eqz v0, :cond_f

    .line 132
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_c} :catch_d
    .catchall {:try_start_9 .. :try_end_c} :catchall_19

    goto :goto_1

    .line 134
    :catch_d
    move-exception v0

    goto :goto_1

    .line 138
    :cond_f
    :try_start_f
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_19

    monitor-exit p0

    return-object v0

    .line 130
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized nextResult(J)Lorg/jivesoftware/smack/packet/Packet;
    .registers 11
    .param p1, "timeout"    # J

    .prologue
    .line 151
    monitor-enter p0

    :try_start_1
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 152
    move-wide v4, p1

    .line 153
    .local v4, "waitTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_45

    move-result-wide v2

    .line 157
    .local v2, "start":J
    :goto_e
    :try_start_e
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_13} :catch_48
    .catchall {:try_start_e .. :try_end_13} :catchall_45

    move-result v6

    if-eqz v6, :cond_1c

    .line 158
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gtz v6, :cond_27

    .line 171
    :cond_1c
    :goto_1c
    :try_start_1c
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_21
    .catchall {:try_start_1c .. :try_end_21} :catchall_45

    move-result v6

    if-eqz v6, :cond_33

    .line 172
    const/4 v6, 0x0

    .line 181
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :goto_25
    monitor-exit p0

    return-object v6

    .line 161
    .restart local v2    # "start":J
    .restart local v4    # "waitTime":J
    :cond_27
    :try_start_27
    invoke-virtual {p0, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 162
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_2d
    .catch Ljava/lang/InterruptedException; {:try_start_27 .. :try_end_2d} :catch_48
    .catchall {:try_start_27 .. :try_end_2d} :catchall_45

    move-result-wide v0

    .line 163
    .local v0, "now":J
    sub-long v6, v0, v2

    sub-long/2addr v4, v6

    .line 164
    move-wide v2, v0

    .line 165
    goto :goto_e

    .line 176
    .end local v0    # "now":J
    :cond_33
    :try_start_33
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/Packet;

    goto :goto_25

    .line 181
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :cond_3c
    iget-object v6, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_44
    .catchall {:try_start_33 .. :try_end_44} :catchall_45

    goto :goto_25

    .line 151
    :catchall_45
    move-exception v6

    monitor-exit p0

    throw v6

    .line 167
    .restart local v2    # "start":J
    .restart local v4    # "waitTime":J
    :catch_48
    move-exception v6

    goto :goto_1c
.end method

.method public declared-synchronized pollResult()Lorg/jivesoftware/smack/packet/Packet;
    .registers 2

    .prologue
    .line 114
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_15

    move-result v0

    if-eqz v0, :cond_c

    .line 115
    const/4 v0, 0x0

    .line 118
    :goto_a
    monitor-exit p0

    return-object v0

    :cond_c
    :try_start_c
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Packet;
    :try_end_14
    .catchall {:try_start_c .. :try_end_14} :catchall_15

    goto :goto_a

    .line 114
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 192
    monitor-enter p0

    if-nez p1, :cond_5

    .line 205
    :cond_3
    :goto_3
    monitor-exit p0

    return-void

    .line 195
    :cond_5
    :try_start_5
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 197
    :cond_11
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget v1, p0, Lorg/jivesoftware/smack/PacketCollector;->maxPackets:I

    if-ne v0, v1, :cond_20

    .line 198
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 201
    :cond_20
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketCollector;->resultQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 203
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_28
    .catchall {:try_start_5 .. :try_end_28} :catchall_29

    goto :goto_3

    .line 192
    :catchall_29
    move-exception v0

    monitor-exit p0

    throw v0
.end method
