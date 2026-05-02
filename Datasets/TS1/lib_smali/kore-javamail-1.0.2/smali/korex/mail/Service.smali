.class public abstract Lkorex/mail/Service;
.super Ljava/lang/Object;
.source "Service.java"


# instance fields
.field private connected:Z

.field private final connectionListeners:Ljava/util/Vector;

.field protected debug:Z

.field private final q:Lkorex/mail/EventQueue;

.field protected session:Lkorex/mail/Session;

.field protected url:Lkorex/mail/URLName;


# direct methods
.method protected constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 14
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;

    .prologue
    const/4 v9, 0x0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    .line 79
    iput-boolean v9, p0, Lkorex/mail/Service;->debug:Z

    .line 81
    iput-boolean v9, p0, Lkorex/mail/Service;->connected:Z

    .line 90
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Service;->connectionListeners:Ljava/util/Vector;

    .line 104
    iput-object p1, p0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    .line 105
    invoke-virtual {p1}, Lkorex/mail/Session;->getDebug()Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/Service;->debug:Z

    .line 106
    iput-object p2, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    .line 112
    const/4 v1, 0x0

    .line 113
    .local v1, "protocol":Ljava/lang/String;
    const/4 v2, 0x0

    .line 114
    .local v2, "host":Ljava/lang/String;
    const/4 v3, -0x1

    .line 115
    .local v3, "port":I
    const/4 v5, 0x0

    .line 116
    .local v5, "user":Ljava/lang/String;
    const/4 v6, 0x0

    .line 117
    .local v6, "password":Ljava/lang/String;
    const/4 v4, 0x0

    .line 122
    .local v4, "file":Ljava/lang/String;
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    if-eqz v0, :cond_4a

    .line 123
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v1

    .line 124
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 125
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getPort()I

    move-result v3

    .line 126
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getUsername()Ljava/lang/String;

    move-result-object v5

    .line 127
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getPassword()Ljava/lang/String;

    move-result-object v6

    .line 128
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getFile()Ljava/lang/String;

    move-result-object v4

    .line 132
    :cond_4a
    if-eqz v1, :cond_8a

    .line 133
    if-nez v2, :cond_6b

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mail."

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, ".host"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 135
    :cond_6b
    if-nez v5, :cond_8a

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mail."

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, ".user"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 140
    :cond_8a
    if-nez v2, :cond_92

    .line 141
    const-string v0, "mail.host"

    invoke-virtual {p1, v0}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 143
    :cond_92
    if-nez v5, :cond_9a

    .line 144
    const-string v0, "mail.user"

    invoke-virtual {p1, v0}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 147
    :cond_9a
    if-nez v5, :cond_a2

    .line 149
    :try_start_9c
    const-string v0, "user.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a1
    .catch Ljava/lang/SecurityException; {:try_start_9c .. :try_end_a1} :catch_e7

    move-result-object v5

    .line 156
    :cond_a2
    :goto_a2
    new-instance v0, Lkorex/mail/URLName;

    invoke-direct/range {v0 .. v6}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    .line 160
    invoke-virtual {p1}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string v9, "mail.event.scope"

    const-string v10, "folder"

    invoke-virtual {v0, v9, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 162
    .local v8, "scope":Ljava/lang/String;
    invoke-virtual {p1}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string v9, "mail.event.executor"

    invoke-virtual {v0, v9}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/concurrent/Executor;

    .line 163
    .local v7, "executor":Ljava/util/concurrent/Executor;
    const-string v0, "application"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d0

    .line 164
    invoke-static {v7}, Lkorex/mail/EventQueue;->getApplicationEventQueue(Ljava/util/concurrent/Executor;)Lkorex/mail/EventQueue;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    .line 170
    :goto_cf
    return-void

    .line 165
    :cond_d0
    const-string v0, "session"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_df

    .line 166
    invoke-virtual {p1}, Lkorex/mail/Session;->getEventQueue()Lkorex/mail/EventQueue;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    goto :goto_cf

    .line 169
    :cond_df
    new-instance v0, Lkorex/mail/EventQueue;

    invoke-direct {v0, v7}, Lkorex/mail/EventQueue;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    goto :goto_cf

    .line 150
    .end local v7    # "executor":Ljava/util/concurrent/Executor;
    .end local v8    # "scope":Ljava/lang/String;
    :catch_e7
    move-exception v0

    goto :goto_a2
.end method


# virtual methods
.method public addConnectionListener(Lkorex/mail/event/ConnectionListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/ConnectionListener;

    .prologue
    .line 567
    iget-object v0, p0, Lkorex/mail/Service;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 568
    return-void
.end method

.method public declared-synchronized close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 508
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, v0}, Lkorex/mail/Service;->setConnected(Z)V

    .line 509
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lkorex/mail/Service;->notifyConnectionListeners(I)V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_b

    .line 510
    monitor-exit p0

    return-void

    .line 508
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public connect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 195
    invoke-virtual {p0, v0, v0, v0}, Lkorex/mail/Service;->connect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    return-void
.end method

.method public declared-synchronized connect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 27
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 287
    monitor-enter p0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lkorex/mail/Service;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 288
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "already connected"

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 287
    :catchall_f
    move-exception v2

    monitor-exit p0

    throw v2

    .line 291
    :cond_12
    const/16 v17, 0x0

    .line 292
    .local v17, "connected":Z
    const/16 v21, 0x0

    .line 293
    .local v21, "save":Z
    const/4 v3, 0x0

    .line 294
    .local v3, "protocol":Ljava/lang/String;
    const/4 v6, 0x0

    .line 299
    .local v6, "file":Ljava/lang/String;
    :try_start_18
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    if-eqz v2, :cond_59

    .line 300
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v3

    .line 301
    if-nez p1, :cond_30

    .line 302
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getHost()Ljava/lang/String;

    move-result-object p1

    .line 303
    :cond_30
    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_3d

    .line 304
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getPort()I

    move-result p2

    .line 306
    :cond_3d
    if-nez p3, :cond_11f

    .line 307
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getUsername()Ljava/lang/String;

    move-result-object p3

    .line 308
    if-nez p4, :cond_51

    .line 309
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getPassword()Ljava/lang/String;

    move-result-object p4

    .line 316
    :cond_51
    :goto_51
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getFile()Ljava/lang/String;

    move-result-object v6

    .line 320
    :cond_59
    if-eqz v3, :cond_a1

    .line 321
    if-nez p1, :cond_7e

    .line 322
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".host"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 323
    :cond_7e
    if-nez p3, :cond_a1

    .line 324
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".user"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 328
    :cond_a1
    if-nez p1, :cond_ad

    .line 329
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    const-string v4, "mail.host"

    invoke-virtual {v2, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 331
    :cond_ad
    if-nez p3, :cond_b9

    .line 332
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    const-string v4, "mail.user"

    invoke-virtual {v2, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b8
    .catchall {:try_start_18 .. :try_end_b8} :catchall_f

    move-result-object p3

    .line 335
    :cond_b9
    if-nez p3, :cond_c1

    .line 337
    :try_start_bb
    const-string v2, "user.name"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_c0
    .catch Ljava/lang/SecurityException; {:try_start_bb .. :try_end_c0} :catch_1aa
    .catchall {:try_start_bb .. :try_end_c0} :catchall_f

    move-result-object p3

    .line 345
    :cond_c1
    :goto_c1
    if-nez p4, :cond_f2

    :try_start_c3
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    if-eqz v2, :cond_f2

    .line 347
    new-instance v2, Lkorex/mail/URLName;

    const/4 v8, 0x0

    move-object/from16 v4, p1

    move/from16 v5, p2

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v8}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lkorex/mail/Service;->setURLName(Lkorex/mail/URLName;)V

    .line 348
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    invoke-virtual/range {p0 .. p0}, Lkorex/mail/Service;->getURLName()Lkorex/mail/URLName;

    move-result-object v4

    invoke-virtual {v2, v4}, Lkorex/mail/Session;->getPasswordAuthentication(Lkorex/mail/URLName;)Lkorex/mail/PasswordAuthentication;

    move-result-object v20

    .line 349
    .local v20, "pw":Lkorex/mail/PasswordAuthentication;
    if-eqz v20, :cond_14c

    .line 350
    if-nez p3, :cond_13b

    .line 351
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object p3

    .line 352
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getPassword()Ljava/lang/String;
    :try_end_f1
    .catchall {:try_start_c3 .. :try_end_f1} :catchall_f

    move-result-object p4

    .line 363
    .end local v20    # "pw":Lkorex/mail/PasswordAuthentication;
    :cond_f2
    :goto_f2
    const/16 v16, 0x0

    .line 365
    .local v16, "authEx":Lkorex/mail/AuthenticationFailedException;
    :try_start_f4
    invoke-virtual/range {p0 .. p4}, Lkorex/mail/Service;->protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z
    :try_end_f7
    .catch Lkorex/mail/AuthenticationFailedException; {:try_start_f4 .. :try_end_f7} :catch_14f
    .catchall {:try_start_f4 .. :try_end_f7} :catchall_f

    move-result v17

    .line 371
    :goto_f8
    if-nez v17, :cond_11a

    .line 374
    :try_start_fa
    invoke-static/range {p1 .. p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_fd
    .catch Ljava/net/UnknownHostException; {:try_start_fa .. :try_end_fd} :catch_153
    .catchall {:try_start_fa .. :try_end_fd} :catchall_f

    move-result-object v8

    .line 378
    .local v8, "addr":Ljava/net/InetAddress;
    :goto_fe
    :try_start_fe
    move-object/from16 v0, p0

    iget-object v7, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    const/4 v11, 0x0

    move/from16 v9, p2

    move-object v10, v3

    move-object/from16 v12, p3

    invoke-virtual/range {v7 .. v12}, Lkorex/mail/Session;->requestPasswordAuthentication(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/PasswordAuthentication;

    move-result-object v20

    .line 382
    .restart local v20    # "pw":Lkorex/mail/PasswordAuthentication;
    if-eqz v20, :cond_11a

    .line 383
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object p3

    .line 384
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getPassword()Ljava/lang/String;

    move-result-object p4

    .line 387
    invoke-virtual/range {p0 .. p4}, Lkorex/mail/Service;->protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z

    move-result v17

    .line 392
    .end local v8    # "addr":Ljava/net/InetAddress;
    .end local v20    # "pw":Lkorex/mail/PasswordAuthentication;
    :cond_11a
    if-nez v17, :cond_172

    .line 393
    if-eqz v16, :cond_156

    .line 394
    throw v16

    .line 311
    .end local v16    # "authEx":Lkorex/mail/AuthenticationFailedException;
    :cond_11f
    if-nez p4, :cond_51

    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getUsername()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 313
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getPassword()Ljava/lang/String;

    move-result-object p4

    goto/16 :goto_51

    .line 353
    .restart local v20    # "pw":Lkorex/mail/PasswordAuthentication;
    :cond_13b
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f2

    .line 354
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/PasswordAuthentication;->getPassword()Ljava/lang/String;

    move-result-object p4

    goto :goto_f2

    .line 357
    :cond_14c
    const/16 v21, 0x1

    goto :goto_f2

    .line 366
    .end local v20    # "pw":Lkorex/mail/PasswordAuthentication;
    .restart local v16    # "authEx":Lkorex/mail/AuthenticationFailedException;
    :catch_14f
    move-exception v19

    .line 367
    .local v19, "ex":Lkorex/mail/AuthenticationFailedException;
    move-object/from16 v16, v19

    goto :goto_f8

    .line 375
    .end local v19    # "ex":Lkorex/mail/AuthenticationFailedException;
    :catch_153
    move-exception v18

    .line 376
    .local v18, "e":Ljava/net/UnknownHostException;
    const/4 v8, 0x0

    .restart local v8    # "addr":Ljava/net/InetAddress;
    goto :goto_fe

    .line 395
    .end local v8    # "addr":Ljava/net/InetAddress;
    .end local v18    # "e":Ljava/net/UnknownHostException;
    :cond_156
    if-nez p3, :cond_160

    .line 396
    new-instance v2, Lkorex/mail/AuthenticationFailedException;

    const-string v4, "failed to connect, no user name specified?"

    invoke-direct {v2, v4}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 398
    :cond_160
    if-nez p4, :cond_16a

    .line 399
    new-instance v2, Lkorex/mail/AuthenticationFailedException;

    const-string v4, "failed to connect, no password specified?"

    invoke-direct {v2, v4}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 402
    :cond_16a
    new-instance v2, Lkorex/mail/AuthenticationFailedException;

    const-string v4, "failed to connect"

    invoke-direct {v2, v4}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 405
    :cond_172
    new-instance v9, Lkorex/mail/URLName;

    move-object v10, v3

    move-object/from16 v11, p1

    move/from16 v12, p2

    move-object v13, v6

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    invoke-direct/range {v9 .. v15}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lkorex/mail/Service;->setURLName(Lkorex/mail/URLName;)V

    .line 407
    if-eqz v21, :cond_19c

    .line 408
    move-object/from16 v0, p0

    iget-object v2, v0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    invoke-virtual/range {p0 .. p0}, Lkorex/mail/Service;->getURLName()Lkorex/mail/URLName;

    move-result-object v4

    new-instance v5, Lkorex/mail/PasswordAuthentication;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {v5, v0, v1}, Lkorex/mail/PasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4, v5}, Lkorex/mail/Session;->setPasswordAuthentication(Lkorex/mail/URLName;Lkorex/mail/PasswordAuthentication;)V

    .line 412
    :cond_19c
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lkorex/mail/Service;->setConnected(Z)V

    .line 415
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lkorex/mail/Service;->notifyConnectionListeners(I)V
    :try_end_1a8
    .catchall {:try_start_fe .. :try_end_1a8} :catchall_f

    .line 416
    monitor-exit p0

    return-void

    .line 338
    .end local v16    # "authEx":Lkorex/mail/AuthenticationFailedException;
    :catch_1aa
    move-exception v2

    goto/16 :goto_c1
.end method

.method public connect(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 266
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lkorex/mail/Service;->connect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method public connect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 246
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0, p2, p3}, Lkorex/mail/Service;->connect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 247
    return-void
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 655
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 656
    iget-object v0, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v0}, Lkorex/mail/EventQueue;->terminateQueue()V

    .line 657
    return-void
.end method

.method getEventQueue()Lkorex/mail/EventQueue;
    .registers 2

    .prologue
    .line 670
    iget-object v0, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    return-object v0
.end method

.method getSession()Lkorex/mail/Session;
    .registers 2

    .prologue
    .line 663
    iget-object v0, p0, Lkorex/mail/Service;->session:Lkorex/mail/Session;

    return-object v0
.end method

.method public declared-synchronized getURLName()Lkorex/mail/URLName;
    .registers 8

    .prologue
    .line 527
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    if-eqz v0, :cond_36

    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getPassword()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v0}, Lkorex/mail/URLName;->getFile()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_36

    .line 528
    :cond_15
    new-instance v0, Lkorex/mail/URLName;

    iget-object v1, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v1}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    invoke-virtual {v2}, Lkorex/mail/URLName;->getHost()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    .line 529
    invoke-virtual {v3}, Lkorex/mail/URLName;->getPort()I

    move-result v3

    const/4 v4, 0x0

    iget-object v5, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;

    .line 530
    invoke-virtual {v5}, Lkorex/mail/URLName;->getUsername()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_39

    .line 532
    :goto_34
    monitor-exit p0

    return-object v0

    :cond_36
    :try_start_36
    iget-object v0, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;
    :try_end_38
    .catchall {:try_start_36 .. :try_end_38} :catchall_39

    goto :goto_34

    .line 527
    :catchall_39
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isConnected()Z
    .registers 2

    .prologue
    .line 468
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lkorex/mail/Service;->connected:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected notifyConnectionListeners(I)V
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 601
    iget-object v1, p0, Lkorex/mail/Service;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lez v1, :cond_12

    .line 602
    new-instance v0, Lkorex/mail/event/ConnectionEvent;

    invoke-direct {v0, p0, p1}, Lkorex/mail/event/ConnectionEvent;-><init>(Ljava/lang/Object;I)V

    .line 603
    .local v0, "e":Lkorex/mail/event/ConnectionEvent;
    iget-object v1, p0, Lkorex/mail/Service;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lkorex/mail/Service;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 616
    .end local v0    # "e":Lkorex/mail/event/ConnectionEvent;
    :cond_12
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1a

    .line 617
    iget-object v1, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v1}, Lkorex/mail/EventQueue;->terminateQueue()V

    .line 618
    :cond_1a
    return-void
.end method

.method protected protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 452
    const/4 v0, 0x0

    return v0
.end method

.method protected queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V
    .registers 5
    .param p1, "event"    # Lkorex/mail/event/MailEvent;
    .param p2, "vector"    # Ljava/util/Vector;

    .prologue
    .line 647
    invoke-virtual {p2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    .line 648
    .local v0, "v":Ljava/util/Vector;
    iget-object v1, p0, Lkorex/mail/Service;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v1, p1, v0}, Lkorex/mail/EventQueue;->enqueue(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 649
    return-void
.end method

.method public removeConnectionListener(Lkorex/mail/event/ConnectionListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/ConnectionListener;

    .prologue
    .line 580
    iget-object v0, p0, Lkorex/mail/Service;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 581
    return-void
.end method

.method protected declared-synchronized setConnected(Z)V
    .registers 3
    .param p1, "connected"    # Z

    .prologue
    .line 485
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lkorex/mail/Service;->connected:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 486
    monitor-exit p0

    return-void

    .line 485
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setURLName(Lkorex/mail/URLName;)V
    .registers 3
    .param p1, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 554
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lkorex/mail/Service;->url:Lkorex/mail/URLName;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 555
    monitor-exit p0

    return-void

    .line 554
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 625
    invoke-virtual {p0}, Lkorex/mail/Service;->getURLName()Lkorex/mail/URLName;

    move-result-object v0

    .line 626
    .local v0, "url":Lkorex/mail/URLName;
    if-eqz v0, :cond_b

    .line 627
    invoke-virtual {v0}, Lkorex/mail/URLName;->toString()Ljava/lang/String;

    move-result-object v1

    .line 629
    :goto_a
    return-object v1

    :cond_b
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method
