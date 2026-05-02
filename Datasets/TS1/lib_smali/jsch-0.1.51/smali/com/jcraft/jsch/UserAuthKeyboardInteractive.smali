.class Lcom/jcraft/jsch/UserAuthKeyboardInteractive;
.super Lcom/jcraft/jsch/UserAuth;
.source "UserAuthKeyboardInteractive.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/UserAuth;-><init>()V

    return-void
.end method


# virtual methods
.method public start(Lcom/jcraft/jsch/Session;)Z
    .registers 27
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    invoke-super/range {p0 .. p1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    .line 36
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-eqz v23, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    instance-of v0, v0, Lcom/jcraft/jsch/UIKeyboardInteractive;

    move/from16 v23, v0

    if-nez v23, :cond_1c

    .line 37
    const/16 v23, 0x0

    .line 194
    :goto_1b
    return v23

    .line 40
    :cond_1c
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->username:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "@"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 41
    .local v3, "dest":Ljava/lang/String;
    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v23, v0

    const/16 v24, 0x16

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_6c

    .line 42
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->port:I

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 44
    :cond_6c
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->password:[B

    move-object/from16 v21, v0

    .line 46
    .local v21, "password":[B
    const/4 v11, 0x0

    .line 48
    .local v11, "cancel":Z
    const/4 v10, 0x0

    .line 49
    .local v10, "_username":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->username:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v10

    .line 53
    :cond_7e
    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v23, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->max_auth_tries:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_93

    .line 54
    const/16 v23, 0x0

    goto :goto_1b

    .line 64
    :cond_93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 65
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x32

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "ssh-connection"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 69
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const-string v24, "keyboard-interactive"

    invoke-static/range {v24 .. v24}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 70
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    sget-object v24, Lcom/jcraft/jsch/Util;->empty:[B

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 71
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    sget-object v24, Lcom/jcraft/jsch/Util;->empty:[B

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 74
    const/4 v13, 0x1

    .line 77
    .local v13, "firsttime":Z
    :cond_f4
    :goto_f4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v12, v0, 0xff

    .line 80
    .local v12, "command":I
    const/16 v23, 0x34

    move/from16 v0, v23

    if-ne v12, v0, :cond_120

    .line 81
    const/16 v23, 0x1

    goto/16 :goto_1b

    .line 83
    :cond_120
    const/16 v23, 0x35

    move/from16 v0, v23

    if-ne v12, v0, :cond_16f

    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v8

    .line 86
    .local v8, "_message":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v16

    .line 87
    .local v16, "lang":[B
    invoke-static {v8}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v18

    .line 88
    .local v18, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-eqz v23, :cond_f4

    .line 89
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto :goto_f4

    .line 93
    .end local v8    # "_message":[B
    .end local v16    # "lang":[B
    .end local v18    # "message":Ljava/lang/String;
    :cond_16f
    const/16 v23, 0x33

    move/from16 v0, v23

    if-ne v12, v0, :cond_1ce

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v14

    .line 96
    .local v14, "foo":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v20

    .line 100
    .local v20, "partial_success":I
    if-eqz v20, :cond_1b0

    .line 101
    new-instance v23, Lcom/jcraft/jsch/JSchPartialAuthException;

    invoke-static {v14}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Lcom/jcraft/jsch/JSchPartialAuthException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 104
    :cond_1b0
    if-eqz v13, :cond_1b6

    .line 105
    const/16 v23, 0x0

    goto/16 :goto_1b

    .line 109
    :cond_1b6
    move-object/from16 v0, p1

    iget v0, v0, Lcom/jcraft/jsch/Session;->auth_failures:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p1

    iput v0, v1, Lcom/jcraft/jsch/Session;->auth_failures:I

    .line 196
    if-eqz v11, :cond_7e

    .line 197
    new-instance v23, Lcom/jcraft/jsch/JSchAuthCancelException;

    const-string v24, "keyboard-interactive"

    invoke-direct/range {v23 .. v24}, Lcom/jcraft/jsch/JSchAuthCancelException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 112
    .end local v14    # "foo":[B
    .end local v20    # "partial_success":I
    :cond_1ce
    const/16 v23, 0x3c

    move/from16 v0, v23

    if-ne v12, v0, :cond_34c

    .line 113
    const/4 v13, 0x0

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v4

    .line 116
    .local v4, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 117
    .local v5, "instruction":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v17

    .line 118
    .local v17, "languate_tag":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v19

    .line 119
    .local v19, "num":I
    move/from16 v0, v19

    new-array v6, v0, [Ljava/lang/String;

    .line 120
    .local v6, "prompt":[Ljava/lang/String;
    move/from16 v0, v19

    new-array v7, v0, [Z

    .line 121
    .local v7, "echo":[Z
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_22d
    move/from16 v0, v19

    if-ge v15, v0, :cond_257

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v23

    aput-object v23, v6, v15

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v23

    if-eqz v23, :cond_254

    const/16 v23, 0x1

    :goto_24f
    aput-boolean v23, v7, v15

    .line 121
    add-int/lit8 v15, v15, 0x1

    goto :goto_22d

    .line 123
    :cond_254
    const/16 v23, 0x0

    goto :goto_24f

    .line 126
    :cond_257
    const/16 v22, 0x0

    check-cast v22, [[B

    .line 128
    .local v22, "response":[[B
    if-eqz v21, :cond_2d1

    array-length v0, v6

    move/from16 v23, v0

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_2d1

    const/16 v23, 0x0

    aget-boolean v23, v7, v23

    if-nez v23, :cond_2d1

    const/16 v23, 0x0

    aget-object v23, v6, v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v23

    const-string v24, "password:"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v23

    if-ltz v23, :cond_2d1

    .line 132
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [[B

    move-object/from16 v22, v0

    .line 133
    const/16 v23, 0x0

    aput-object v21, v22, v23

    .line 134
    const/16 v21, 0x0

    .line 160
    :cond_28c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x3d

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 162
    if-lez v19, :cond_32c

    if-eqz v22, :cond_2af

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v19

    move/from16 v1, v23

    if-eq v0, v1, :cond_32c

    .line 166
    :cond_2af
    if-nez v22, :cond_30f

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 169
    const/4 v15, 0x0

    :goto_2bf
    move/from16 v0, v19

    if-ge v15, v0, :cond_31a

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    sget-object v24, Lcom/jcraft/jsch/Util;->empty:[B

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 169
    add-int/lit8 v15, v15, 0x1

    goto :goto_2bf

    .line 136
    :cond_2d1
    if-gtz v19, :cond_2df

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v23

    if-gtz v23, :cond_2df

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v23

    if-lez v23, :cond_28c

    .line 139
    :cond_2df
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v23, v0

    if-eqz v23, :cond_28c

    .line 140
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->userinfo:Lcom/jcraft/jsch/UserInfo;

    check-cast v2, Lcom/jcraft/jsch/UIKeyboardInteractive;

    .line 141
    .local v2, "kbi":Lcom/jcraft/jsch/UIKeyboardInteractive;
    invoke-interface/range {v2 .. v7}, Lcom/jcraft/jsch/UIKeyboardInteractive;->promptKeyboardInteractive(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Z)[Ljava/lang/String;

    move-result-object v9

    .line 146
    .local v9, "_response":[Ljava/lang/String;
    if-eqz v9, :cond_28c

    .line 147
    array-length v0, v9

    move/from16 v23, v0

    move/from16 v0, v23

    new-array v0, v0, [[B

    move-object/from16 v22, v0

    .line 148
    const/4 v15, 0x0

    :goto_2fd
    array-length v0, v9

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v15, v0, :cond_28c

    .line 149
    aget-object v23, v9, v15

    invoke-static/range {v23 .. v23}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v23

    aput-object v23, v22, v15

    .line 148
    add-int/lit8 v15, v15, 0x1

    goto :goto_2fd

    .line 174
    .end local v2    # "kbi":Lcom/jcraft/jsch/UIKeyboardInteractive;
    .end local v9    # "_response":[Ljava/lang/String;
    :cond_30f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 177
    :cond_31a
    if-nez v22, :cond_31d

    .line 178
    const/4 v11, 0x1

    .line 186
    :cond_31d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    goto/16 :goto_f4

    .line 181
    :cond_32c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 182
    const/4 v15, 0x0

    :goto_33a
    move/from16 v0, v19

    if-ge v15, v0, :cond_31d

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthKeyboardInteractive;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v23, v0

    aget-object v24, v22, v15

    invoke-virtual/range {v23 .. v24}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 182
    add-int/lit8 v15, v15, 0x1

    goto :goto_33a

    .line 194
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "instruction":Ljava/lang/String;
    .end local v6    # "prompt":[Ljava/lang/String;
    .end local v7    # "echo":[Z
    .end local v15    # "i":I
    .end local v17    # "languate_tag":Ljava/lang/String;
    .end local v19    # "num":I
    .end local v22    # "response":[[B
    :cond_34c
    const/16 v23, 0x0

    goto/16 :goto_1b
.end method
