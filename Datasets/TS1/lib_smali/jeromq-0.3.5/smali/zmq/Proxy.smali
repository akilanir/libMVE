.class public Lzmq/Proxy;
.super Ljava/lang/Object;
.source "Proxy.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z
    .registers 15
    .param p0, "frontend"    # Lzmq/SocketBase;
    .param p1, "backend"    # Lzmq/SocketBase;
    .param p2, "capture"    # Lzmq/SocketBase;

    .prologue
    .line 40
    const/4 v8, 0x1

    .line 44
    .local v8, "success":Z
    const/4 v9, 0x2

    new-array v2, v9, [Lzmq/PollItem;

    .line 46
    .local v2, "items":[Lzmq/PollItem;
    const/4 v9, 0x0

    new-instance v10, Lzmq/PollItem;

    const/4 v11, 0x1

    invoke-direct {v10, p0, v11}, Lzmq/PollItem;-><init>(Lzmq/SocketBase;I)V

    aput-object v10, v2, v9

    .line 47
    const/4 v9, 0x1

    new-instance v10, Lzmq/PollItem;

    const/4 v11, 0x1

    invoke-direct {v10, p1, v11}, Lzmq/PollItem;-><init>(Lzmq/SocketBase;I)V

    aput-object v10, v2, v9

    .line 51
    :try_start_16
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_19} :catch_31

    move-result-object v7

    .line 58
    .local v7, "selector":Ljava/nio/channels/Selector;
    :cond_1a
    :goto_1a
    :try_start_1a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v9

    if-nez v9, :cond_109

    .line 60
    const-wide/16 v9, -0x1

    invoke-static {v7, v2, v9, v10}, Lzmq/ZMQ;->poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;J)I
    :try_end_29
    .catchall {:try_start_1a .. :try_end_29} :catchall_10f

    move-result v6

    .line 61
    .local v6, "rc":I
    if-gez v6, :cond_38

    .line 62
    const/4 v9, 0x0

    .line 133
    :try_start_2d
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_30} :catch_114

    .line 139
    .end local v6    # "rc":I
    :goto_30
    return v9

    .line 53
    .end local v7    # "selector":Ljava/nio/channels/Selector;
    :catch_31
    move-exception v1

    .line 54
    .local v1, "e":Ljava/io/IOException;
    new-instance v9, Lzmq/ZError$IOException;

    invoke-direct {v9, v1}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v9

    .line 66
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v6    # "rc":I
    .restart local v7    # "selector":Ljava/nio/channels/Selector;
    :cond_38
    const/4 v9, 0x0

    :try_start_39
    aget-object v9, v2, v9

    invoke-virtual {v9}, Lzmq/PollItem;->isReadable()Z

    move-result v9

    if-eqz v9, :cond_9c

    .line 68
    :cond_41
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lzmq/SocketBase;->recv(I)Lzmq/Msg;
    :try_end_45
    .catchall {:try_start_39 .. :try_end_45} :catchall_10f

    move-result-object v5

    .line 69
    .local v5, "msg":Lzmq/Msg;
    if-nez v5, :cond_4f

    .line 70
    const/4 v9, 0x0

    .line 133
    :try_start_49
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_4c} :catch_4d

    goto :goto_30

    .line 135
    :catch_4d
    move-exception v10

    goto :goto_30

    .line 73
    :cond_4f
    const/16 v9, 0xd

    :try_start_51
    invoke-virtual {p0, v9}, Lzmq/SocketBase;->getSocketOpt(I)I
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_10f

    move-result v9

    int-to-long v3, v9

    .line 75
    .local v3, "more":J
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-gez v9, :cond_63

    .line 76
    const/4 v9, 0x0

    .line 133
    :try_start_5d
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_60} :catch_61

    goto :goto_30

    .line 135
    :catch_61
    move-exception v10

    goto :goto_30

    .line 80
    :cond_63
    if-eqz p2, :cond_80

    .line 81
    :try_start_65
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0, v5}, Lzmq/Msg;-><init>(Lzmq/Msg;)V

    .line 82
    .local v0, "ctrl":Lzmq/Msg;
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-lez v9, :cond_7e

    const/4 v9, 0x2

    :goto_71
    invoke-virtual {p2, v0, v9}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z
    :try_end_74
    .catchall {:try_start_65 .. :try_end_74} :catchall_10f

    move-result v8

    .line 83
    if-nez v8, :cond_80

    .line 84
    const/4 v9, 0x0

    .line 133
    :try_start_78
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7b} :catch_7c

    goto :goto_30

    .line 135
    :catch_7c
    move-exception v10

    goto :goto_30

    .line 82
    :cond_7e
    const/4 v9, 0x0

    goto :goto_71

    .line 88
    .end local v0    # "ctrl":Lzmq/Msg;
    :cond_80
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-lez v9, :cond_94

    const/4 v9, 0x2

    :goto_87
    :try_start_87
    invoke-virtual {p1, v5, v9}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z
    :try_end_8a
    .catchall {:try_start_87 .. :try_end_8a} :catchall_10f

    move-result v8

    .line 89
    if-nez v8, :cond_96

    .line 90
    const/4 v9, 0x0

    .line 133
    :try_start_8e
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_91} :catch_92

    goto :goto_30

    .line 135
    :catch_92
    move-exception v10

    goto :goto_30

    .line 88
    :cond_94
    const/4 v9, 0x0

    goto :goto_87

    .line 92
    :cond_96
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-nez v9, :cond_41

    .line 98
    .end local v3    # "more":J
    .end local v5    # "msg":Lzmq/Msg;
    :cond_9c
    const/4 v9, 0x1

    :try_start_9d
    aget-object v9, v2, v9

    invoke-virtual {v9}, Lzmq/PollItem;->isReadable()Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 100
    :cond_a5
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Lzmq/SocketBase;->recv(I)Lzmq/Msg;
    :try_end_a9
    .catchall {:try_start_9d .. :try_end_a9} :catchall_10f

    move-result-object v5

    .line 101
    .restart local v5    # "msg":Lzmq/Msg;
    if-nez v5, :cond_b4

    .line 102
    const/4 v9, 0x0

    .line 133
    :try_start_ad
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_b0} :catch_b1

    goto :goto_30

    .line 135
    :catch_b1
    move-exception v10

    goto/16 :goto_30

    .line 105
    :cond_b4
    const/16 v9, 0xd

    :try_start_b6
    invoke-virtual {p1, v9}, Lzmq/SocketBase;->getSocketOpt(I)I
    :try_end_b9
    .catchall {:try_start_b6 .. :try_end_b9} :catchall_10f

    move-result v9

    int-to-long v3, v9

    .line 107
    .restart local v3    # "more":J
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-gez v9, :cond_ca

    .line 108
    const/4 v9, 0x0

    .line 133
    :try_start_c2
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_c2 .. :try_end_c5} :catch_c7

    goto/16 :goto_30

    .line 135
    :catch_c7
    move-exception v10

    goto/16 :goto_30

    .line 112
    :cond_ca
    if-eqz p2, :cond_e9

    .line 113
    :try_start_cc
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0, v5}, Lzmq/Msg;-><init>(Lzmq/Msg;)V

    .line 114
    .restart local v0    # "ctrl":Lzmq/Msg;
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-lez v9, :cond_e7

    const/4 v9, 0x2

    :goto_d8
    invoke-virtual {p2, v0, v9}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z
    :try_end_db
    .catchall {:try_start_cc .. :try_end_db} :catchall_10f

    move-result v8

    .line 115
    if-nez v8, :cond_e9

    .line 116
    const/4 v9, 0x0

    .line 133
    :try_start_df
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_e2
    .catch Ljava/lang/Exception; {:try_start_df .. :try_end_e2} :catch_e4

    goto/16 :goto_30

    .line 135
    :catch_e4
    move-exception v10

    goto/16 :goto_30

    .line 114
    :cond_e7
    const/4 v9, 0x0

    goto :goto_d8

    .line 120
    .end local v0    # "ctrl":Lzmq/Msg;
    :cond_e9
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-lez v9, :cond_ff

    const/4 v9, 0x2

    :goto_f0
    :try_start_f0
    invoke-virtual {p0, v5, v9}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z
    :try_end_f3
    .catchall {:try_start_f0 .. :try_end_f3} :catchall_10f

    move-result v8

    .line 121
    if-nez v8, :cond_101

    .line 122
    const/4 v9, 0x0

    .line 133
    :try_start_f7
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_fa
    .catch Ljava/lang/Exception; {:try_start_f7 .. :try_end_fa} :catch_fc

    goto/16 :goto_30

    .line 135
    :catch_fc
    move-exception v10

    goto/16 :goto_30

    .line 120
    :cond_ff
    const/4 v9, 0x0

    goto :goto_f0

    .line 124
    :cond_101
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-nez v9, :cond_a5

    goto/16 :goto_1a

    .line 133
    .end local v3    # "more":J
    .end local v5    # "msg":Lzmq/Msg;
    .end local v6    # "rc":I
    :cond_109
    :try_start_109
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_10c
    .catch Ljava/lang/Exception; {:try_start_109 .. :try_end_10c} :catch_117

    .line 139
    :goto_10c
    const/4 v9, 0x1

    goto/16 :goto_30

    .line 132
    :catchall_10f
    move-exception v9

    .line 133
    :try_start_110
    invoke-virtual {v7}, Ljava/nio/channels/Selector;->close()V
    :try_end_113
    .catch Ljava/lang/Exception; {:try_start_110 .. :try_end_113} :catch_119

    .line 136
    :goto_113
    throw v9

    .line 135
    .restart local v6    # "rc":I
    :catch_114
    move-exception v10

    goto/16 :goto_30

    .end local v6    # "rc":I
    :catch_117
    move-exception v9

    goto :goto_10c

    :catch_119
    move-exception v10

    goto :goto_113
.end method
