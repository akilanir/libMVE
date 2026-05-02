.class public abstract Lkorex/mail/Transport;
.super Lkorex/mail/Service;
.source "Transport.java"


# instance fields
.field private volatile transportListeners:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 4
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;

    .prologue
    .line 77
    invoke-direct {p0, p1, p2}, Lkorex/mail/Service;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V

    .line 369
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    .line 78
    return-void
.end method

.method public static send(Lkorex/mail/Message;)V
    .registers 3
    .param p0, "msg"    # Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 124
    invoke-virtual {p0}, Lkorex/mail/Message;->saveChanges()V

    .line 125
    invoke-virtual {p0}, Lkorex/mail/Message;->getAllRecipients()[Lkorex/mail/Address;

    move-result-object v0

    invoke-static {p0, v0, v1, v1}, Lkorex/mail/Transport;->send0(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public static send(Lkorex/mail/Message;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "msg"    # Lkorex/mail/Message;
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 174
    invoke-virtual {p0}, Lkorex/mail/Message;->saveChanges()V

    .line 175
    invoke-virtual {p0}, Lkorex/mail/Message;->getAllRecipients()[Lkorex/mail/Address;

    move-result-object v0

    invoke-static {p0, v0, p1, p2}, Lkorex/mail/Transport;->send0(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public static send(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    .registers 3
    .param p0, "msg"    # Lkorex/mail/Message;
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 146
    invoke-virtual {p0}, Lkorex/mail/Message;->saveChanges()V

    .line 147
    invoke-static {p0, p1, v0, v0}, Lkorex/mail/Transport;->send0(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public static send(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "msg"    # Lkorex/mail/Message;
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p0}, Lkorex/mail/Message;->saveChanges()V

    .line 203
    invoke-static {p0, p1, p2, p3}, Lkorex/mail/Transport;->send0(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    return-void
.end method

.method private static send0(Lkorex/mail/Message;[Lkorex/mail/Address;Ljava/lang/String;Ljava/lang/String;)V
    .registers 31
    .param p0, "msg"    # Lkorex/mail/Message;
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 210
    if-eqz p1, :cond_7

    move-object/from16 v0, p1

    array-length v3, v0

    if-nez v3, :cond_f

    .line 211
    :cond_7
    new-instance v3, Lkorex/mail/SendFailedException;

    const-string v4, "No recipient addresses"

    invoke-direct {v3, v4}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 217
    :cond_f
    new-instance v18, Ljava/util/Hashtable;

    invoke-direct/range {v18 .. v18}, Ljava/util/Hashtable;-><init>()V

    .line 220
    .local v18, "protocols":Ljava/util/Hashtable;
    new-instance v12, Ljava/util/Vector;

    invoke-direct {v12}, Ljava/util/Vector;-><init>()V

    .line 221
    .local v12, "invalid":Ljava/util/Vector;
    new-instance v24, Ljava/util/Vector;

    invoke-direct/range {v24 .. v24}, Ljava/util/Vector;-><init>()V

    .line 222
    .local v24, "validSent":Ljava/util/Vector;
    new-instance v25, Ljava/util/Vector;

    invoke-direct/range {v25 .. v25}, Ljava/util/Vector;-><init>()V

    .line 224
    .local v25, "validUnsent":Ljava/util/Vector;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_24
    move-object/from16 v0, p1

    array-length v3, v0

    if-ge v11, v3, :cond_69

    .line 226
    aget-object v3, p1, v11

    invoke-virtual {v3}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 227
    aget-object v3, p1, v11

    invoke-virtual {v3}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Vector;

    .line 228
    .local v23, "v":Ljava/util/Vector;
    aget-object v3, p1, v11

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 224
    .end local v23    # "v":Ljava/util/Vector;
    :goto_4c
    add-int/lit8 v11, v11, 0x1

    goto :goto_24

    .line 231
    :cond_4f
    new-instance v26, Ljava/util/Vector;

    invoke-direct/range {v26 .. v26}, Ljava/util/Vector;-><init>()V

    .line 232
    .local v26, "w":Ljava/util/Vector;
    aget-object v3, p1, v11

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 233
    aget-object v3, p1, v11

    invoke-virtual {v3}, Lkorex/mail/Address;->getType()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v3, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4c

    .line 237
    .end local v26    # "w":Ljava/util/Vector;
    :cond_69
    invoke-virtual/range {v18 .. v18}, Ljava/util/Hashtable;->size()I

    move-result v9

    .line 238
    .local v9, "dsize":I
    if-nez v9, :cond_77

    .line 239
    new-instance v3, Lkorex/mail/SendFailedException;

    const-string v4, "No recipient addresses"

    invoke-direct {v3, v4}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 241
    :cond_77
    move-object/from16 v0, p0

    iget-object v3, v0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    if-eqz v3, :cond_a7

    move-object/from16 v0, p0

    iget-object v0, v0, Lkorex/mail/Message;->session:Lkorex/mail/Session;

    move-object/from16 v19, v0

    .line 248
    .local v19, "s":Lkorex/mail/Session;
    :goto_83
    const/4 v3, 0x1

    if-ne v9, v3, :cond_ba

    .line 249
    const/4 v3, 0x0

    aget-object v3, p1, v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lkorex/mail/Session;->getTransport(Lkorex/mail/Address;)Lkorex/mail/Transport;

    move-result-object v22

    .line 251
    .local v22, "transport":Lkorex/mail/Transport;
    if-eqz p2, :cond_b1

    .line 252
    :try_start_91
    move-object/from16 v0, v22

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lkorex/mail/Transport;->connect(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    :goto_9a
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lkorex/mail/Transport;->sendMessage(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    :try_end_a3
    .catchall {:try_start_91 .. :try_end_a3} :catchall_b5

    .line 257
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    .line 343
    .end local v22    # "transport":Lkorex/mail/Transport;
    :cond_a6
    return-void

    .line 242
    .end local v19    # "s":Lkorex/mail/Session;
    :cond_a7
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lkorex/mail/Session;->getDefaultInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;

    move-result-object v19

    goto :goto_83

    .line 254
    .restart local v19    # "s":Lkorex/mail/Session;
    .restart local v22    # "transport":Lkorex/mail/Transport;
    :cond_b1
    :try_start_b1
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->connect()V
    :try_end_b4
    .catchall {:try_start_b1 .. :try_end_b4} :catchall_b5

    goto :goto_9a

    .line 257
    :catchall_b5
    move-exception v3

    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    throw v3

    .line 266
    .end local v22    # "transport":Lkorex/mail/Transport;
    :cond_ba
    const/4 v5, 0x0

    .line 267
    .local v5, "chainedEx":Lkorex/mail/MessagingException;
    const/16 v20, 0x0

    .line 269
    .local v20, "sendFailed":Z
    invoke-virtual/range {v18 .. v18}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v10

    .line 270
    .local v10, "e":Ljava/util/Enumeration;
    :cond_c1
    :goto_c1
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_168

    .line 271
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Vector;

    .line 272
    .restart local v23    # "v":Ljava/util/Vector;
    invoke-virtual/range {v23 .. v23}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v0, v3, [Lkorex/mail/Address;

    move-object/from16 v17, v0

    .line 273
    .local v17, "protaddresses":[Lkorex/mail/Address;
    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 276
    const/4 v3, 0x0

    aget-object v3, v17, v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Lkorex/mail/Session;->getTransport(Lkorex/mail/Address;)Lkorex/mail/Transport;

    move-result-object v22

    .restart local v22    # "transport":Lkorex/mail/Transport;
    if-nez v22, :cond_f5

    .line 279
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_e8
    move-object/from16 v0, v17

    array-length v3, v0

    if-ge v13, v3, :cond_c1

    .line 280
    aget-object v3, v17, v13

    invoke-virtual {v12, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 279
    add-int/lit8 v13, v13, 0x1

    goto :goto_e8

    .line 284
    .end local v13    # "j":I
    :cond_f5
    :try_start_f5
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->connect()V

    .line 285
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lkorex/mail/Transport;->sendMessage(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    :try_end_101
    .catch Lkorex/mail/SendFailedException; {:try_start_f5 .. :try_end_101} :catch_105
    .catch Lkorex/mail/MessagingException; {:try_start_f5 .. :try_end_101} :catch_156
    .catchall {:try_start_f5 .. :try_end_101} :catchall_124

    .line 319
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    goto :goto_c1

    .line 286
    :catch_105
    move-exception v21

    .line 287
    .local v21, "sex":Lkorex/mail/SendFailedException;
    const/16 v20, 0x1

    .line 289
    if-nez v5, :cond_11e

    .line 290
    move-object/from16 v5, v21

    .line 295
    :goto_10c
    :try_start_10c
    invoke-virtual/range {v21 .. v21}, Lkorex/mail/SendFailedException;->getInvalidAddresses()[Lkorex/mail/Address;

    move-result-object v6

    .line 296
    .local v6, "a":[Lkorex/mail/Address;
    if-eqz v6, :cond_129

    .line 297
    const/4 v13, 0x0

    .restart local v13    # "j":I
    :goto_113
    array-length v3, v6

    if-ge v13, v3, :cond_129

    .line 298
    aget-object v3, v6, v13

    invoke-virtual {v12, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 297
    add-int/lit8 v13, v13, 0x1

    goto :goto_113

    .line 292
    .end local v6    # "a":[Lkorex/mail/Address;
    .end local v13    # "j":I
    :cond_11e
    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z
    :try_end_123
    .catchall {:try_start_10c .. :try_end_123} :catchall_124

    goto :goto_10c

    .line 319
    .end local v21    # "sex":Lkorex/mail/SendFailedException;
    :catchall_124
    move-exception v3

    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    throw v3

    .line 301
    .restart local v6    # "a":[Lkorex/mail/Address;
    .restart local v21    # "sex":Lkorex/mail/SendFailedException;
    :cond_129
    :try_start_129
    invoke-virtual/range {v21 .. v21}, Lkorex/mail/SendFailedException;->getValidSentAddresses()[Lkorex/mail/Address;

    move-result-object v6

    .line 302
    if-eqz v6, :cond_13d

    .line 303
    const/4 v14, 0x0

    .local v14, "k":I
    :goto_130
    array-length v3, v6

    if-ge v14, v3, :cond_13d

    .line 304
    aget-object v3, v6, v14

    move-object/from16 v0, v24

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 303
    add-int/lit8 v14, v14, 0x1

    goto :goto_130

    .line 307
    .end local v14    # "k":I
    :cond_13d
    invoke-virtual/range {v21 .. v21}, Lkorex/mail/SendFailedException;->getValidUnsentAddresses()[Lkorex/mail/Address;

    move-result-object v8

    .line 308
    .local v8, "c":[Lkorex/mail/Address;
    if-eqz v8, :cond_151

    .line 309
    const/4 v15, 0x0

    .local v15, "l":I
    :goto_144
    array-length v3, v8

    if-ge v15, v3, :cond_151

    .line 310
    aget-object v3, v8, v15

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_14e
    .catchall {:try_start_129 .. :try_end_14e} :catchall_124

    .line 309
    add-int/lit8 v15, v15, 0x1

    goto :goto_144

    .line 319
    .end local v15    # "l":I
    :cond_151
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    goto/16 :goto_c1

    .line 311
    .end local v6    # "a":[Lkorex/mail/Address;
    .end local v8    # "c":[Lkorex/mail/Address;
    .end local v21    # "sex":Lkorex/mail/SendFailedException;
    :catch_156
    move-exception v16

    .line 312
    .local v16, "mex":Lkorex/mail/MessagingException;
    const/16 v20, 0x1

    .line 314
    if-nez v5, :cond_162

    .line 315
    move-object/from16 v5, v16

    .line 319
    :goto_15d
    invoke-virtual/range {v22 .. v22}, Lkorex/mail/Transport;->close()V

    goto/16 :goto_c1

    .line 317
    :cond_162
    :try_start_162
    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z
    :try_end_167
    .catchall {:try_start_162 .. :try_end_167} :catchall_124

    goto :goto_15d

    .line 324
    .end local v16    # "mex":Lkorex/mail/MessagingException;
    .end local v17    # "protaddresses":[Lkorex/mail/Address;
    .end local v22    # "transport":Lkorex/mail/Transport;
    .end local v23    # "v":Ljava/util/Vector;
    :cond_168
    if-nez v20, :cond_176

    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_176

    invoke-virtual/range {v25 .. v25}, Ljava/util/Vector;->size()I

    move-result v3

    if-eqz v3, :cond_a6

    .line 325
    :cond_176
    const/4 v6, 0x0

    .restart local v6    # "a":[Lkorex/mail/Address;
    const/4 v7, 0x0

    .local v7, "b":[Lkorex/mail/Address;
    const/4 v8, 0x0

    .line 328
    .restart local v8    # "c":[Lkorex/mail/Address;
    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_18a

    .line 329
    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v6, v3, [Lkorex/mail/Address;

    .line 330
    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 332
    :cond_18a
    invoke-virtual/range {v25 .. v25}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_19b

    .line 333
    invoke-virtual/range {v25 .. v25}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v7, v3, [Lkorex/mail/Address;

    .line 334
    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 336
    :cond_19b
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_1aa

    .line 337
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v8, v3, [Lkorex/mail/Address;

    .line 338
    invoke-virtual {v12, v8}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 340
    :cond_1aa
    new-instance v3, Lkorex/mail/SendFailedException;

    const-string v4, "Sending failed"

    invoke-direct/range {v3 .. v8}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V

    throw v3
.end method


# virtual methods
.method public declared-synchronized addTransportListener(Lkorex/mail/event/TransportListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/TransportListener;

    .prologue
    .line 381
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 382
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    .line 383
    :cond_c
    iget-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 384
    monitor-exit p0

    return-void

    .line 381
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V
    .registers 13
    .param p1, "type"    # I
    .param p2, "validSent"    # [Lkorex/mail/Address;
    .param p3, "validUnsent"    # [Lkorex/mail/Address;
    .param p4, "invalid"    # [Lkorex/mail/Address;
    .param p5, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 419
    iget-object v1, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 425
    :goto_4
    return-void

    .line 422
    :cond_5
    new-instance v0, Lkorex/mail/event/TransportEvent;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lkorex/mail/event/TransportEvent;-><init>(Lkorex/mail/Transport;I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 424
    .local v0, "e":Lkorex/mail/event/TransportEvent;
    iget-object v1, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lkorex/mail/Transport;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method public declared-synchronized removeTransportListener(Lkorex/mail/event/TransportListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/TransportListener;

    .prologue
    .line 396
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 397
    iget-object v0, p0, Lkorex/mail/Transport;->transportListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 398
    :cond_a
    monitor-exit p0

    return-void

    .line 396
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract sendMessage(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method
