.class Lcom/jcraft/jsch/UserAuthPublicKey;
.super Lcom/jcraft/jsch/UserAuth;
.source "UserAuthPublicKey.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/jcraft/jsch/UserAuth;-><init>()V

    return-void
.end method


# virtual methods
.method public start(Lcom/jcraft/jsch/Session;)Z
    .registers 29
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-super/range {p0 .. p1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    .line 39
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Session;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lcom/jcraft/jsch/IdentityRepository;->getIdentities()Ljava/util/Vector;

    move-result-object v12

    .line 41
    .local v12, "identities":Ljava/util/Vector;
    const/16 v17, 0x0

    .line 42
    .local v17, "passphrase":[B
    const/4 v7, 0x0

    .line 46
    .local v7, "_username":[B
    monitor-enter v12

    .line 47
    :try_start_f
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v23

    if-gtz v23, :cond_19

    .line 48
    const/16 v23, 0x0

    monitor-exit v12

    .line 232
    :goto_18
    return v23

    .line 51
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->username:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v7

    .line 53
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_24
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v23

    move/from16 v0, v23

    if-ge v11, v0, :cond_2d8

    .line 55
    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v23, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_45

    .line 56
    const/16 v23, 0x0

    monitor-exit v12

    goto :goto_18

    .line 231
    .end local v11    # "i":I
    :catchall_42
    move-exception v23

    monitor-exit v12
    :try_end_44
    .catchall {:try_start_f .. :try_end_44} :catchall_42

    throw v23

    .line 59
    .restart local v11    # "i":I
    :cond_45
    :try_start_45
    invoke-virtual {v12, v11}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/jcraft/jsch/Identity;

    move-object/from16 v0, v23

    check-cast v0, Lcom/jcraft/jsch/Identity;

    move-object v13, v0

    .line 60
    .local v13, "identity":Lcom/jcraft/jsch/Identity;
    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->getPublicKeyBlob()[B

    move-result-object v18

    .line 62
    .local v18, "pubkeyblob":[B
    if-eqz v18, :cond_14f

    .line 71
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x32

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 74
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "ssh-connection"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 75
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "publickey"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 76
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 77
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->getAlgName()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 83
    :cond_c9
    :goto_c9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v8, v0, 0xff

    .line 86
    .local v8, "command":I
    const/16 v23, 0x3c

    move/from16 v0, v23

    if-ne v8, v0, :cond_fb

    .line 109
    :cond_f1
    const/16 v23, 0x3c

    move/from16 v0, v23

    if-eq v8, v0, :cond_14f

    .line 53
    .end local v8    # "command":I
    :cond_f7
    :goto_f7
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_24

    .line 89
    .restart local v8    # "command":I
    :cond_fb
    const/16 v23, 0x33

    move/from16 v0, v23

    if-eq v8, v0, :cond_f1

    .line 92
    const/16 v23, 0x35

    move/from16 v0, v23

    if-ne v8, v0, :cond_f1

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    .line 95
    .local v5, "_message":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 96
    .local v14, "lang":[B
    invoke-static {v5}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v15

    .line 97
    .local v15, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-eqz v23, :cond_c9

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v15}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto/16 :goto_c9

    .line 116
    .end local v5    # "_message":[B
    .end local v8    # "command":I
    .end local v14    # "lang":[B
    .end local v15    # "message":Ljava/lang/String;
    :cond_14f
    const/4 v9, 0x5

    .line 118
    .local v9, "count":I
    :cond_150
    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v23

    if-eqz v23, :cond_1a9

    if-nez v17, :cond_1a9

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-nez v23, :cond_168

    new-instance v23, Lcom/jcraft/jsch/JSchException;

    const-string v24, "USERAUTH fail"

    invoke-direct/range {v23 .. v24}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 120
    :cond_168
    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v23

    if-eqz v23, :cond_199

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Passphrase for "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->getName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Lcom/jcraft/jsch/UserInfo;->promptPassphrase(Ljava/lang/String;)Z

    move-result v23

    if-nez v23, :cond_199

    .line 122
    new-instance v23, Lcom/jcraft/jsch/JSchAuthCancelException;

    const-string v24, "publickey"

    invoke-direct/range {v23 .. v24}, Lcom/jcraft/jsch/JSchAuthCancelException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 126
    :cond_199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Lcom/jcraft/jsch/UserInfo;->getPassphrase()Ljava/lang/String;

    move-result-object v6

    .line 127
    .local v6, "_passphrase":Ljava/lang/String;
    if-eqz v6, :cond_1a9

    .line 128
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v17

    .line 132
    .end local v6    # "_passphrase":Ljava/lang/String;
    :cond_1a9
    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v23

    if-eqz v23, :cond_1b1

    if-eqz v17, :cond_2dd

    .line 133
    :cond_1b1
    move-object/from16 v0, v17

    invoke-interface {v13, v0}, Lcom/jcraft/jsch/Identity;->setPassphrase([B)Z

    move-result v23

    if-eqz v23, :cond_2dd

    .line 134
    if-eqz v17, :cond_1d0

    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Session;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v23

    move-object/from16 v0, v23

    instance-of v0, v0, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    move/from16 v23, v0

    if-eqz v23, :cond_1d0

    .line 136
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Session;->getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;

    move-result-object v23

    check-cast v23, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->check()V

    .line 147
    :cond_1d0
    :goto_1d0
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 148
    const/16 v17, 0x0

    .line 151
    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v23

    if-nez v23, :cond_f7

    .line 152
    if-nez v18, :cond_1e1

    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->getPublicKeyBlob()[B

    move-result-object v18

    .line 156
    :cond_1e1
    if-eqz v18, :cond_f7

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x32

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "ssh-connection"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "publickey"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-interface {v13}, Lcom/jcraft/jsch/Identity;->getAlgName()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 180
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Session;->getSessionId()[B

    move-result-object v19

    .line 181
    .local v19, "sid":[B
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v20, v0

    .line 182
    .local v20, "sidlen":I
    add-int/lit8 v23, v20, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v24, v0

    add-int v23, v23, v24

    add-int/lit8 v23, v23, -0x5

    move/from16 v0, v23

    new-array v0, v0, [B

    move-object/from16 v22, v0

    .line 183
    .local v22, "tmp":[B
    const/16 v23, 0x0

    ushr-int/lit8 v24, v20, 0x18

    move/from16 v0, v24

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v22, v23

    .line 184
    const/16 v23, 0x1

    ushr-int/lit8 v24, v20, 0x10

    move/from16 v0, v24

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v22, v23

    .line 185
    const/16 v23, 0x2

    ushr-int/lit8 v24, v20, 0x8

    move/from16 v0, v24

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v22, v23

    .line 186
    const/16 v23, 0x3

    move/from16 v0, v20

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v22, v23

    .line 187
    const/16 v23, 0x0

    const/16 v24, 0x4

    move-object/from16 v0, v19

    move/from16 v1, v23

    move-object/from16 v2, v22

    move/from16 v3, v24

    move/from16 v4, v20

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v23, v0

    const/16 v24, 0x5

    add-int/lit8 v25, v20, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/jcraft/jsch/Buffer;->index:I

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x5

    move-object/from16 v0, v23

    move/from16 v1, v24

    move-object/from16 v2, v22

    move/from16 v3, v25

    move/from16 v4, v26

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    move-object/from16 v0, v22

    invoke-interface {v13, v0}, Lcom/jcraft/jsch/Identity;->getSignature([B)[B

    move-result-object v21

    .line 190
    .local v21, "signature":[B
    if-nez v21, :cond_2e8

    .line 231
    .end local v9    # "count":I
    .end local v13    # "identity":Lcom/jcraft/jsch/Identity;
    .end local v18    # "pubkeyblob":[B
    .end local v19    # "sid":[B
    .end local v20    # "sidlen":I
    .end local v21    # "signature":[B
    .end local v22    # "tmp":[B
    :cond_2d8
    monitor-exit v12

    .line 232
    const/16 v23, 0x0

    goto/16 :goto_18

    .line 141
    .restart local v9    # "count":I
    .restart local v13    # "identity":Lcom/jcraft/jsch/Identity;
    .restart local v18    # "pubkeyblob":[B
    :cond_2dd
    invoke-static/range {v17 .. v17}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 142
    const/16 v17, 0x0

    .line 143
    add-int/lit8 v9, v9, -0x1

    .line 144
    if-nez v9, :cond_150

    goto/16 :goto_1d0

    .line 193
    .restart local v19    # "sid":[B
    .restart local v20    # "sidlen":I
    .restart local v21    # "signature":[B
    .restart local v22    # "tmp":[B
    :cond_2e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 198
    :cond_302
    :goto_302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v8, v0, 0xff

    .line 201
    .restart local v8    # "command":I
    const/16 v23, 0x34

    move/from16 v0, v23

    if-ne v8, v0, :cond_32f

    .line 202
    const/16 v23, 0x1

    monitor-exit v12

    goto/16 :goto_18

    .line 204
    :cond_32f
    const/16 v23, 0x35

    move/from16 v0, v23

    if-ne v8, v0, :cond_37c

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v5

    .line 207
    .restart local v5    # "_message":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 208
    .restart local v14    # "lang":[B
    invoke-static {v5}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v15

    .line 209
    .restart local v15    # "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-eqz v23, :cond_302

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v15}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_302

    .line 214
    .end local v5    # "_message":[B
    .end local v14    # "lang":[B
    .end local v15    # "message":Ljava/lang/String;
    :cond_37c
    const/16 v23, 0x33

    move/from16 v0, v23

    if-ne v8, v0, :cond_f7

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v10

    .line 217
    .local v10, "foo":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthPublicKey;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v16

    .line 220
    .local v16, "partial_success":I
    if-eqz v16, :cond_3bd

    .line 221
    new-instance v23, Lcom/jcraft/jsch/JSchPartialAuthException;

    invoke-static {v10}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Lcom/jcraft/jsch/JSchPartialAuthException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 223
    :cond_3bd
    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p1

    iput v0, v1, Lcom/jcraft/jsch/Session;->auth_failures:I
    :try_end_3cb
    .catchall {:try_start_45 .. :try_end_3cb} :catchall_42

    goto/16 :goto_f7
.end method
