.class public Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;
.super Lcom/jcraft/jsch/UserAuth;
.source "UserAuthGSSAPIWithMIC.java"


# static fields
.field private static final SSH_MSG_USERAUTH_GSSAPI_ERROR:I = 0x40

.field private static final SSH_MSG_USERAUTH_GSSAPI_ERRTOK:I = 0x41

.field private static final SSH_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE:I = 0x3f

.field private static final SSH_MSG_USERAUTH_GSSAPI_MIC:I = 0x42

.field private static final SSH_MSG_USERAUTH_GSSAPI_RESPONSE:I = 0x3c

.field private static final SSH_MSG_USERAUTH_GSSAPI_TOKEN:I = 0x3d

.field private static final supported_method:[Ljava/lang/String;

.field private static final supported_oid:[[B


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-array v0, v3, [[B

    const/16 v1, 0xb

    new-array v1, v1, [B

    fill-array-data v1, :array_18

    aput-object v1, v0, v2

    sput-object v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    .line 47
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "gssapi-with-mic.krb5"

    aput-object v1, v0, v2

    sput-object v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_method:[Ljava/lang/String;

    return-void

    .line 40
    :array_18
    .array-data 1
        0x6t
        0x9t
        0x2at
        -0x7at
        0x48t
        -0x7at
        -0x9t
        0x12t
        0x1t
        0x2t
        0x2t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/UserAuth;-><init>()V

    return-void
.end method


# virtual methods
.method public start(Lcom/jcraft/jsch/Session;)Z
    .registers 23
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 52
    invoke-super/range {p0 .. p1}, Lcom/jcraft/jsch/UserAuth;->start(Lcom/jcraft/jsch/Session;)Z

    .line 54
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->username:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    .line 56
    .local v4, "_username":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 64
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const/16 v19, 0x32

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 65
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const-string v19, "ssh-connection"

    invoke-static/range {v19 .. v19}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const-string v19, "gssapi-with-mic"

    invoke-static/range {v19 .. v19}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    sget-object v19, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 69
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5b
    sget-object v18, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v10, v0, :cond_76

    .line 70
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    sget-object v19, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    aget-object v19, v19, v10

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 69
    add-int/lit8 v10, v10, 0x1

    goto :goto_5b

    .line 72
    :cond_76
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 74
    const/4 v14, 0x0

    .line 77
    .local v14, "method":Ljava/lang/String;
    :cond_84
    :goto_84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v6, v0, 0xff

    .line 80
    .local v6, "command":I
    const/16 v18, 0x33

    move/from16 v0, v18

    if-ne v6, v0, :cond_af

    .line 81
    const/16 v18, 0x0

    .line 223
    :goto_ae
    return v18

    .line 84
    :cond_af
    const/16 v18, 0x3c

    move/from16 v0, v18

    if-ne v6, v0, :cond_fe

    .line 85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v13

    .line 88
    .local v13, "message":[B
    const/4 v10, 0x0

    :goto_db
    sget-object v18, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v10, v0, :cond_f6

    .line 89
    sget-object v18, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_oid:[[B

    aget-object v18, v18, v10

    move-object/from16 v0, v18

    invoke-static {v13, v0}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v18

    if-eqz v18, :cond_fb

    .line 90
    sget-object v18, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->supported_method:[Ljava/lang/String;

    aget-object v14, v18, v10

    .line 95
    :cond_f6
    if-nez v14, :cond_150

    .line 96
    const/16 v18, 0x0

    goto :goto_ae

    .line 88
    :cond_fb
    add-int/lit8 v10, v10, 0x1

    goto :goto_db

    .line 102
    .end local v13    # "message":[B
    :cond_fe
    const/16 v18, 0x35

    move/from16 v0, v18

    if-ne v6, v0, :cond_14c

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v3

    .line 105
    .local v3, "_message":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v11

    .line 106
    .local v11, "lang":[B
    invoke-static {v3}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v13

    .line 107
    .local v13, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    if-eqz v18, :cond_84

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->userinfo:Lcom/jcraft/jsch/UserInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v13}, Lcom/jcraft/jsch/UserInfo;->showMessage(Ljava/lang/String;)V

    goto/16 :goto_84

    .line 112
    .end local v3    # "_message":[B
    .end local v11    # "lang":[B
    .end local v13    # "message":Ljava/lang/String;
    :cond_14c
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 115
    .local v13, "message":[B
    :cond_150
    const/4 v7, 0x0

    .line 117
    .local v7, "context":Lcom/jcraft/jsch/GSSContext;
    :try_start_151
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 118
    .local v5, "c":Ljava/lang/Class;
    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/jcraft/jsch/GSSContext;

    move-object/from16 v0, v18

    check-cast v0, Lcom/jcraft/jsch/GSSContext;

    move-object v7, v0
    :try_end_166
    .catch Ljava/lang/Exception; {:try_start_151 .. :try_end_166} :catch_222

    .line 125
    :try_start_166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->username:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v7, v0, v1}, Lcom/jcraft/jsch/GSSContext;->create(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_179
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_166 .. :try_end_179} :catch_227

    .line 131
    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v17, v0

    .line 133
    .local v17, "token":[B
    :cond_181
    :goto_181
    invoke-interface {v7}, Lcom/jcraft/jsch/GSSContext;->isEstablished()Z

    move-result v18

    if-nez v18, :cond_281

    .line 135
    const/16 v18, 0x0

    :try_start_189
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v7, v0, v1, v2}, Lcom/jcraft/jsch/GSSContext;->init([BII)[B
    :try_end_197
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_189 .. :try_end_197} :catch_22c

    move-result-object v17

    .line 145
    if-eqz v17, :cond_1c8

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const/16 v19, 0x3d

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 152
    :cond_1c8
    invoke-interface {v7}, Lcom/jcraft/jsch/GSSContext;->isEstablished()Z

    move-result v18

    if-nez v18, :cond_181

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v6, v0, 0xff

    .line 155
    const/16 v18, 0x40

    move/from16 v0, v18

    if-ne v6, v0, :cond_231

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v6, v0, 0xff

    .line 173
    :cond_218
    :goto_218
    const/16 v18, 0x33

    move/from16 v0, v18

    if-ne v6, v0, :cond_25a

    .line 174
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 120
    .end local v5    # "c":Ljava/lang/Class;
    .end local v17    # "token":[B
    :catch_222
    move-exception v8

    .line 121
    .local v8, "e":Ljava/lang/Exception;
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 127
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v5    # "c":Ljava/lang/Class;
    :catch_227
    move-exception v8

    .line 128
    .local v8, "e":Lcom/jcraft/jsch/JSchException;
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 137
    .end local v8    # "e":Lcom/jcraft/jsch/JSchException;
    .restart local v17    # "token":[B
    :catch_22c
    move-exception v8

    .line 142
    .restart local v8    # "e":Lcom/jcraft/jsch/JSchException;
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 165
    .end local v8    # "e":Lcom/jcraft/jsch/JSchException;
    :cond_231
    const/16 v18, 0x41

    move/from16 v0, v18

    if-ne v6, v0, :cond_218

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v6, v0, 0xff

    goto :goto_218

    .line 177
    :cond_25a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v17

    goto/16 :goto_181

    .line 182
    :cond_281
    new-instance v12, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v12}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 188
    .local v12, "mbuf":Lcom/jcraft/jsch/Buffer;
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Session;->getSessionId()[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 189
    const/16 v18, 0x32

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 190
    invoke-virtual {v12, v4}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 191
    const-string v18, "ssh-connection"

    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 192
    const-string v18, "gssapi-with-mic"

    invoke-static/range {v18 .. v18}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 194
    iget-object v0, v12, Lcom/jcraft/jsch/Buffer;->buffer:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual {v12}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v20

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v7, v0, v1, v2}, Lcom/jcraft/jsch/GSSContext;->getMIC([BII)[B

    move-result-object v15

    .line 196
    .local v15, "mic":[B
    if-nez v15, :cond_2c9

    .line 197
    const/16 v18, 0x0

    goto/16 :goto_ae

    .line 200
    :cond_2c9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    const/16 v19, 0x42

    invoke-virtual/range {v18 .. v19}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->packet:Lcom/jcraft/jsch/Packet;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 205
    invoke-interface {v7}, Lcom/jcraft/jsch/GSSContext;->dispose()V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->read(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/Buffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getCommand()B

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v6, v0, 0xff

    .line 210
    const/16 v18, 0x34

    move/from16 v0, v18

    if-ne v6, v0, :cond_324

    .line 211
    const/16 v18, 0x1

    goto/16 :goto_ae

    .line 213
    :cond_324
    const/16 v18, 0x33

    move/from16 v0, v18

    if-ne v6, v0, :cond_365

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v9

    .line 216
    .local v9, "foo":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/UserAuthGSSAPIWithMIC;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v16

    .line 219
    .local v16, "partial_success":I
    if-eqz v16, :cond_365

    .line 220
    new-instance v18, Lcom/jcraft/jsch/JSchPartialAuthException;

    invoke-static {v9}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/jcraft/jsch/JSchPartialAuthException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 223
    .end local v9    # "foo":[B
    .end local v16    # "partial_success":I
    :cond_365
    const/16 v18, 0x0

    goto/16 :goto_ae
.end method
