.class Lcom/jcraft/jsch/KnownHosts$HashedHostKey;
.super Lcom/jcraft/jsch/HostKey;
.source "KnownHosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/KnownHosts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HashedHostKey"
.end annotation


# static fields
.field private static final HASH_DELIM:Ljava/lang/String; = "|"

.field private static final HASH_MAGIC:Ljava/lang/String; = "|1|"


# instance fields
.field hash:[B

.field private hashed:Z

.field salt:[B

.field final synthetic this$0:Lcom/jcraft/jsch/KnownHosts;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;I[B)V
    .registers 12
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "type"    # I
    .param p4, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 519
    const-string v2, ""

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 520
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V
    .registers 16
    .param p2, "marker"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "type"    # I
    .param p5, "key"    # [B
    .param p6, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 521
    iput-object p1, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 522
    invoke-direct/range {v0 .. v5}, Lcom/jcraft/jsch/HostKey;-><init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;)V

    .line 510
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    .line 511
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 512
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 523
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_87

    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_87

    .line 525
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    const-string v1, "|1|"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 526
    .local v8, "data":Ljava/lang/String;
    const/4 v0, 0x0

    const-string v1, "|"

    invoke-virtual {v8, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 527
    .local v7, "_salt":Ljava/lang/String;
    const-string v0, "|"

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 528
    .local v6, "_hash":Ljava/lang/String;
    invoke-static {v7}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 529
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 530
    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v0, v0

    const/16 v1, 0x14

    if-ne v0, v1, :cond_81

    iget-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    array-length v0, v0

    const/16 v1, 0x14

    if-eq v0, v1, :cond_88

    .line 532
    :cond_81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 533
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 538
    .end local v6    # "_hash":Ljava/lang/String;
    .end local v7    # "_salt":Ljava/lang/String;
    .end local v8    # "data":Ljava/lang/String;
    :cond_87
    :goto_87
    return-void

    .line 536
    .restart local v6    # "_hash":Ljava/lang/String;
    .restart local v7    # "_salt":Ljava/lang/String;
    .restart local v8    # "data":Ljava/lang/String;
    :cond_88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    goto :goto_87
.end method

.method constructor <init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;[B)V
    .registers 5
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 516
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;-><init>(Lcom/jcraft/jsch/KnownHosts;Ljava/lang/String;I[B)V

    .line 517
    return-void
.end method


# virtual methods
.method hash()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 566
    iget-boolean v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    if-eqz v3, :cond_6

    .line 590
    :goto_5
    return-void

    .line 568
    :cond_6
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    # invokes: Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;
    invoke-static {v3}, Lcom/jcraft/jsch/KnownHosts;->access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;

    move-result-object v1

    .line 569
    .local v1, "macsha1":Lcom/jcraft/jsch/MAC;
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    if-nez v3, :cond_25

    .line 570
    sget-object v2, Lcom/jcraft/jsch/Session;->random:Lcom/jcraft/jsch/Random;

    .line 571
    .local v2, "random":Lcom/jcraft/jsch/Random;
    monitor-enter v2

    .line 572
    :try_start_13
    invoke-interface {v1}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    .line 573
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v5, v5

    invoke-interface {v2, v3, v4, v5}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 574
    monitor-exit v2
    :try_end_25
    .catchall {:try_start_13 .. :try_end_25} :catchall_82

    .line 577
    .end local v2    # "random":Lcom/jcraft/jsch/Random;
    :cond_25
    :try_start_25
    monitor-enter v1
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_26} :catch_88

    .line 578
    :try_start_26
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    invoke-interface {v1, v3}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 579
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    invoke-static {v3}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 580
    .local v0, "foo":[B
    const/4 v3, 0x0

    array-length v4, v0

    invoke-interface {v1, v0, v3, v4}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 581
    invoke-interface {v1}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    .line 582
    iget-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 583
    monitor-exit v1
    :try_end_45
    .catchall {:try_start_26 .. :try_end_45} :catchall_85

    .line 587
    .end local v0    # "foo":[B
    :goto_45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "|1|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    array-length v5, v5

    invoke-static {v4, v6, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    array-length v5, v5

    invoke-static {v4, v6, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->host:Ljava/lang/String;

    .line 589
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    goto :goto_5

    .line 574
    .restart local v2    # "random":Lcom/jcraft/jsch/Random;
    :catchall_82
    move-exception v3

    :try_start_83
    monitor-exit v2
    :try_end_84
    .catchall {:try_start_83 .. :try_end_84} :catchall_82

    throw v3

    .line 583
    .end local v2    # "random":Lcom/jcraft/jsch/Random;
    :catchall_85
    move-exception v3

    :try_start_86
    monitor-exit v1
    :try_end_87
    .catchall {:try_start_86 .. :try_end_87} :catchall_85

    :try_start_87
    throw v3
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_87 .. :try_end_88} :catch_88

    .line 585
    :catch_88
    move-exception v3

    goto :goto_45
.end method

.method isHashed()Z
    .registers 2

    .prologue
    .line 562
    iget-boolean v0, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    return v0
.end method

.method isMatched(Ljava/lang/String;)Z
    .registers 9
    .param p1, "_host"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 541
    iget-boolean v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hashed:Z

    if-nez v4, :cond_a

    .line 542
    invoke-super {p0, p1}, Lcom/jcraft/jsch/HostKey;->isMatched(Ljava/lang/String;)Z

    move-result v4

    .line 558
    :goto_9
    return v4

    .line 544
    :cond_a
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->this$0:Lcom/jcraft/jsch/KnownHosts;

    # invokes: Lcom/jcraft/jsch/KnownHosts;->getHMACSHA1()Lcom/jcraft/jsch/MAC;
    invoke-static {v4}, Lcom/jcraft/jsch/KnownHosts;->access$000(Lcom/jcraft/jsch/KnownHosts;)Lcom/jcraft/jsch/MAC;

    move-result-object v3

    .line 546
    .local v3, "macsha1":Lcom/jcraft/jsch/MAC;
    :try_start_10
    monitor-enter v3
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_11} :catch_34

    .line 547
    :try_start_11
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->salt:[B

    invoke-interface {v3, v4}, Lcom/jcraft/jsch/MAC;->init([B)V

    .line 548
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    .line 549
    .local v2, "foo":[B
    const/4 v4, 0x0

    array-length v6, v2

    invoke-interface {v3, v2, v4, v6}, Lcom/jcraft/jsch/MAC;->update([BII)V

    .line 550
    invoke-interface {v3}, Lcom/jcraft/jsch/MAC;->getBlockSize()I

    move-result v4

    new-array v0, v4, [B

    .line 551
    .local v0, "bar":[B
    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Lcom/jcraft/jsch/MAC;->doFinal([BI)V

    .line 552
    iget-object v4, p0, Lcom/jcraft/jsch/KnownHosts$HashedHostKey;->hash:[B

    invoke-static {v4, v0}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v4

    monitor-exit v3

    goto :goto_9

    .line 553
    .end local v0    # "bar":[B
    .end local v2    # "foo":[B
    :catchall_31
    move-exception v4

    monitor-exit v3
    :try_end_33
    .catchall {:try_start_11 .. :try_end_33} :catchall_31

    :try_start_33
    throw v4
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_34} :catch_34

    .line 555
    :catch_34
    move-exception v1

    .line 556
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move v4, v5

    .line 558
    goto :goto_9
.end method
