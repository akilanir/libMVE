.class public Lcom/jcraft/jsch/DHG14;
.super Lcom/jcraft/jsch/KeyExchange;
.source "DHG14.java"


# static fields
.field static final DSS:I = 0x1

.field static final RSA:I = 0x0

.field private static final SSH_MSG_KEXDH_INIT:I = 0x1e

.field private static final SSH_MSG_KEXDH_REPLY:I = 0x1f

.field static final g:[B

.field static final p:[B


# instance fields
.field I_C:[B

.field I_S:[B

.field V_C:[B

.field V_S:[B

.field private buf:Lcom/jcraft/jsch/Buffer;

.field dh:Lcom/jcraft/jsch/DH;

.field e:[B

.field private packet:Lcom/jcraft/jsch/Packet;

.field private state:I

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 34
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput-byte v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/DHG14;->g:[B

    .line 35
    const/16 v0, 0x101

    new-array v0, v0, [B

    fill-array-data v0, :array_14

    sput-object v0, Lcom/jcraft/jsch/DHG14;->p:[B

    return-void

    nop

    :array_14
    .array-data 1
        0x0t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x37t
        0xft
        -0x26t
        -0x5et
        0x21t
        0x68t
        -0x3et
        0x34t
        -0x3ct
        -0x3at
        0x62t
        -0x75t
        -0x80t
        -0x24t
        0x1ct
        -0x2ft
        0x29t
        0x2t
        0x4et
        0x8t
        -0x76t
        0x67t
        -0x34t
        0x74t
        0x2t
        0xbt
        -0x42t
        -0x5at
        0x3bt
        0x13t
        -0x65t
        0x22t
        0x51t
        0x4at
        0x8t
        0x79t
        -0x72t
        0x34t
        0x4t
        -0x23t
        -0x11t
        -0x6bt
        0x19t
        -0x4dt
        -0x33t
        0x3at
        0x43t
        0x1bt
        0x30t
        0x2bt
        0xat
        0x6dt
        -0xet
        0x5ft
        0x14t
        0x37t
        0x4ft
        -0x1ft
        0x35t
        0x6dt
        0x6dt
        0x51t
        -0x3et
        0x45t
        -0x1ct
        -0x7bt
        -0x4bt
        0x76t
        0x62t
        0x5et
        0x7et
        -0x3at
        -0xct
        0x4ct
        0x42t
        -0x17t
        -0x5at
        0x37t
        -0x13t
        0x6bt
        0xbt
        -0x1t
        0x5ct
        -0x4at
        -0xct
        0x6t
        -0x49t
        -0x13t
        -0x12t
        0x38t
        0x6bt
        -0x5t
        0x5at
        -0x77t
        -0x61t
        -0x5bt
        -0x52t
        -0x61t
        0x24t
        0x11t
        0x7ct
        0x4bt
        0x1ft
        -0x1at
        0x49t
        0x28t
        0x66t
        0x51t
        -0x14t
        -0x1ct
        0x5bt
        0x3dt
        -0x3et
        0x0t
        0x7ct
        -0x48t
        -0x5ft
        0x63t
        -0x41t
        0x5t
        -0x68t
        -0x26t
        0x48t
        0x36t
        0x1ct
        0x55t
        -0x2dt
        -0x66t
        0x69t
        0x16t
        0x3ft
        -0x58t
        -0x3t
        0x24t
        -0x31t
        0x5ft
        -0x7dt
        0x65t
        0x5dt
        0x23t
        -0x24t
        -0x5dt
        -0x53t
        -0x6at
        0x1ct
        0x62t
        -0xdt
        0x56t
        0x20t
        -0x7bt
        0x52t
        -0x45t
        -0x62t
        -0x2bt
        0x29t
        0x7t
        0x70t
        -0x6at
        -0x6at
        0x6dt
        0x67t
        0xct
        0x35t
        0x4et
        0x4at
        -0x44t
        -0x68t
        0x4t
        -0xft
        0x74t
        0x6ct
        0x8t
        -0x36t
        0x18t
        0x21t
        0x7ct
        0x32t
        -0x70t
        0x5et
        0x46t
        0x2et
        0x36t
        -0x32t
        0x3bt
        -0x1dt
        -0x62t
        0x77t
        0x2ct
        0x18t
        0xet
        -0x7at
        0x3t
        -0x65t
        0x27t
        -0x7dt
        -0x5et
        -0x14t
        0x7t
        -0x5et
        -0x71t
        -0x4bt
        -0x3bt
        0x5dt
        -0x10t
        0x6ft
        0x4ct
        0x52t
        -0x37t
        -0x22t
        0x2bt
        -0x35t
        -0xat
        -0x6bt
        0x58t
        0x17t
        0x18t
        0x39t
        -0x6bt
        0x49t
        0x7ct
        -0x16t
        -0x6bt
        0x6at
        -0x1bt
        0x15t
        -0x2et
        0x26t
        0x18t
        -0x68t
        -0x6t
        0x5t
        0x10t
        0x15t
        0x72t
        -0x72t
        0x5at
        -0x76t
        -0x54t
        -0x56t
        0x68t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyExchange;-><init>()V

    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/DHG14;->type:I

    return-void
.end method


# virtual methods
.method public getKeyType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 305
    iget v0, p0, Lcom/jcraft/jsch/DHG14;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    const-string v0, "DSA"

    .line 306
    :goto_7
    return-object v0

    :cond_8
    const-string v0, "RSA"

    goto :goto_7
.end method

.method public getState()I
    .registers 2

    .prologue
    .line 309
    iget v0, p0, Lcom/jcraft/jsch/DHG14;->state:I

    return v0
.end method

.method public init(Lcom/jcraft/jsch/Session;[B[B[B[B)V
    .registers 11
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .param p2, "V_S"    # [B
    .param p3, "V_C"    # [B
    .param p4, "I_S"    # [B
    .param p5, "I_C"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 94
    iput-object p1, p0, Lcom/jcraft/jsch/DHG14;->session:Lcom/jcraft/jsch/Session;

    .line 95
    iput-object p2, p0, Lcom/jcraft/jsch/DHG14;->V_S:[B

    .line 96
    iput-object p3, p0, Lcom/jcraft/jsch/DHG14;->V_C:[B

    .line 97
    iput-object p4, p0, Lcom/jcraft/jsch/DHG14;->I_S:[B

    .line 98
    iput-object p5, p0, Lcom/jcraft/jsch/DHG14;->I_C:[B

    .line 101
    :try_start_b
    const-string v2, "sha-1"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 102
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/HASH;

    check-cast v2, Lcom/jcraft/jsch/HASH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHG14;->sha:Lcom/jcraft/jsch/HASH;

    .line 103
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->sha:Lcom/jcraft/jsch/HASH;

    invoke-interface {v2}, Lcom/jcraft/jsch/HASH;->init()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_24} :catch_79

    .line 109
    .end local v0    # "c":Ljava/lang/Class;
    :goto_24
    new-instance v2, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2}, Lcom/jcraft/jsch/Buffer;-><init>()V

    iput-object v2, p0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    .line 110
    new-instance v2, Lcom/jcraft/jsch/Packet;

    iget-object v3, p0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v2, p0, Lcom/jcraft/jsch/DHG14;->packet:Lcom/jcraft/jsch/Packet;

    .line 113
    :try_start_34
    const-string v2, "dh"

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 114
    .restart local v0    # "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/DH;

    check-cast v2, Lcom/jcraft/jsch/DH;

    iput-object v2, p0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    .line 115
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    invoke-interface {v2}, Lcom/jcraft/jsch/DH;->init()V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_4d} :catch_80

    .line 122
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    sget-object v3, Lcom/jcraft/jsch/DHG14;->p:[B

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/DH;->setP([B)V

    .line 123
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    sget-object v3, Lcom/jcraft/jsch/DHG14;->g:[B

    invoke-interface {v2, v3}, Lcom/jcraft/jsch/DH;->setG([B)V

    .line 129
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    invoke-interface {v2}, Lcom/jcraft/jsch/DH;->getE()[B

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/DHG14;->e:[B

    .line 130
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 131
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x1e

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 132
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/DHG14;->e:[B

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 134
    if-nez p2, :cond_82

    .line 148
    :goto_78
    return-void

    .line 105
    .end local v0    # "c":Ljava/lang/Class;
    :catch_79
    move-exception v1

    .line 106
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_24

    .line 117
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_80
    move-exception v1

    .line 119
    .restart local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 138
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "c":Ljava/lang/Class;
    :cond_82
    iget-object v2, p0, Lcom/jcraft/jsch/DHG14;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {p1, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 140
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    invoke-interface {v2, v4}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 141
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const-string v3, "SSH_MSG_KEXDH_INIT sent"

    invoke-interface {v2, v4, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 143
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v2

    const-string v3, "expecting SSH_MSG_KEXDH_REPLY"

    invoke-interface {v2, v4, v3}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 147
    :cond_a3
    const/16 v2, 0x1f

    iput v2, p0, Lcom/jcraft/jsch/DHG14;->state:I

    goto :goto_78
.end method

.method public next(Lcom/jcraft/jsch/Buffer;)Z
    .registers 26
    .param p1, "_buf"    # Lcom/jcraft/jsch/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 153
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jcraft/jsch/DHG14;->state:I

    move/from16 v20, v0

    packed-switch v20, :pswitch_data_4d0

    .line 301
    const/16 v16, 0x0

    :goto_b
    return v16

    .line 160
    :pswitch_c
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v12

    .line 161
    .local v12, "j":I
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v12

    .line 162
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getByte()I

    move-result v12

    .line 163
    const/16 v20, 0x1f

    move/from16 v0, v20

    if-eq v12, v0, :cond_3b

    .line 164
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "type: must be 31 "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 165
    const/16 v16, 0x0

    goto :goto_b

    .line 168
    :cond_3b
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG14;->K_S:[B

    .line 176
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getMPInt()[B

    move-result-object v7

    .line 177
    .local v7, "f":[B
    invoke-virtual/range {p1 .. p1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v18

    .line 179
    .local v18, "sig_of_H":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v7}, Lcom/jcraft/jsch/DH;->setF([B)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->dh:Lcom/jcraft/jsch/DH;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/jcraft/jsch/DH;->getK()[B

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/DHG14;->normalize([B)[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG14;->K:[B

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/jcraft/jsch/Buffer;->reset()V

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->V_C:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->V_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->I_C:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->I_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->e:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K:[B

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Buffer;->putMPInt([B)V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v20

    move/from16 v0, v20

    new-array v8, v0, [B

    .line 201
    .local v8, "foo":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->buf:Lcom/jcraft/jsch/Buffer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    array-length v0, v8

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-interface {v0, v8, v1, v2}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->sha:Lcom/jcraft/jsch/HASH;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jcraft/jsch/DHG14;->H:[B

    .line 206
    const/4 v10, 0x0

    .line 207
    .local v10, "i":I
    const/4 v12, 0x0

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .local v11, "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-static {v0, v10, v12}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v3

    .line 211
    .local v3, "alg":Ljava/lang/String;
    add-int/lit8 v10, v12, 0x4

    .line 213
    const/16 v16, 0x0

    .line 215
    .local v16, "result":Z
    const-string v20, "ssh-rsa"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2c9

    .line 220
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG14;->type:I

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 224
    new-array v0, v12, [B

    move-object/from16 v19, v0

    .local v19, "tmp":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 225
    move-object/from16 v6, v19

    .line 226
    .local v6, "ee":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 228
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 229
    move-object/from16 v13, v19

    .line 231
    .local v13, "n":[B
    const/16 v17, 0x0

    .line 233
    .local v17, "sig":Lcom/jcraft/jsch/SignatureRSA;
    :try_start_255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v20, v0

    const-string v21, "signature.rsa"

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 234
    .local v4, "c":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/jcraft/jsch/SignatureRSA;

    move-object/from16 v0, v20

    check-cast v0, Lcom/jcraft/jsch/SignatureRSA;

    move-object/from16 v17, v0

    .line 235
    invoke-interface/range {v17 .. v17}, Lcom/jcraft/jsch/SignatureRSA;->init()V
    :try_end_274
    .catch Ljava/lang/Exception; {:try_start_255 .. :try_end_274} :catch_2c0

    .line 241
    .end local v4    # "c":Ljava/lang/Class;
    :goto_274
    move-object/from16 v0, v17

    invoke-interface {v0, v6, v13}, Lcom/jcraft/jsch/SignatureRSA;->setPubKey([B[B)V

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->H:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/SignatureRSA;->update([B)V

    .line 243
    invoke-interface/range {v17 .. v18}, Lcom/jcraft/jsch/SignatureRSA;->verify([B)Z

    move-result v16

    .line 245
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    invoke-interface/range {v20 .. v21}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v20

    if-eqz v20, :cond_2b6

    .line 246
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ssh_rsa_verify: signature "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    .line 298
    .end local v6    # "ee":[B
    .end local v13    # "n":[B
    .end local v17    # "sig":Lcom/jcraft/jsch/SignatureRSA;
    .end local v19    # "tmp":[B
    :cond_2b6
    :goto_2b6
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG14;->state:I

    goto/16 :goto_b

    .line 237
    .restart local v6    # "ee":[B
    .restart local v13    # "n":[B
    .restart local v17    # "sig":Lcom/jcraft/jsch/SignatureRSA;
    .restart local v19    # "tmp":[B
    :catch_2c0
    move-exception v5

    .line 238
    .local v5, "e":Ljava/lang/Exception;
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_274

    .line 251
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "ee":[B
    .end local v13    # "n":[B
    .end local v17    # "sig":Lcom/jcraft/jsch/SignatureRSA;
    .end local v19    # "tmp":[B
    :cond_2c9
    const-string v20, "ssh-dss"

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_4c6

    .line 252
    const/4 v15, 0x0

    .line 257
    .local v15, "q":[B
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/jcraft/jsch/DHG14;->type:I

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 261
    new-array v0, v12, [B

    move-object/from16 v19, v0

    .restart local v19    # "tmp":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 262
    move-object/from16 v14, v19

    .line 263
    .local v14, "p":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 265
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 266
    move-object/from16 v15, v19

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 269
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 270
    move-object/from16 v9, v19

    .line 271
    .local v9, "g":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v20, v20, v10

    shl-int/lit8 v20, v20, 0x18

    const/high16 v21, -0x1000000

    and-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    shl-int/lit8 v21, v21, 0x10

    const/high16 v22, 0xff0000

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v11, v10, 0x1

    .end local v10    # "i":I
    .restart local v11    # "i":I
    aget-byte v21, v21, v10

    shl-int/lit8 v21, v21, 0x8

    const v22, 0xff00

    and-int v21, v21, v22

    or-int v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v21, v0

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "i":I
    .restart local v10    # "i":I
    aget-byte v21, v21, v11

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xff

    move/from16 v21, v0

    or-int v12, v20, v21

    .line 273
    new-array v0, v12, [B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->K_S:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v10, v1, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v10, v12

    .line 274
    move-object/from16 v7, v19

    .line 276
    const/16 v17, 0x0

    .line 278
    .local v17, "sig":Lcom/jcraft/jsch/SignatureDSA;
    :try_start_45a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->session:Lcom/jcraft/jsch/Session;

    move-object/from16 v20, v0

    const-string v21, "signature.dss"

    invoke-virtual/range {v20 .. v21}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 279
    .restart local v4    # "c":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/jcraft/jsch/SignatureDSA;

    move-object/from16 v0, v20

    check-cast v0, Lcom/jcraft/jsch/SignatureDSA;

    move-object/from16 v17, v0

    .line 280
    invoke-interface/range {v17 .. v17}, Lcom/jcraft/jsch/SignatureDSA;->init()V
    :try_end_479
    .catch Ljava/lang/Exception; {:try_start_45a .. :try_end_479} :catch_4bd

    .line 285
    .end local v4    # "c":Ljava/lang/Class;
    :goto_479
    move-object/from16 v0, v17

    invoke-interface {v0, v7, v14, v15, v9}, Lcom/jcraft/jsch/SignatureDSA;->setPubKey([B[B[B[B)V

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jcraft/jsch/DHG14;->H:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/SignatureDSA;->update([B)V

    .line 287
    invoke-interface/range {v17 .. v18}, Lcom/jcraft/jsch/SignatureDSA;->verify([B)Z

    move-result v16

    .line 289
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    invoke-interface/range {v20 .. v21}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v20

    if-eqz v20, :cond_2b6

    .line 290
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v20

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ssh_dss_verify: signature "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto/16 :goto_2b6

    .line 282
    :catch_4bd
    move-exception v5

    .line 283
    .restart local v5    # "e":Ljava/lang/Exception;
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_479

    .line 296
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v9    # "g":[B
    .end local v14    # "p":[B
    .end local v15    # "q":[B
    .end local v17    # "sig":Lcom/jcraft/jsch/SignatureDSA;
    .end local v19    # "tmp":[B
    :cond_4c6
    sget-object v20, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v21, "unknown alg"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2b6

    .line 153
    nop

    :pswitch_data_4d0
    .packed-switch 0x1f
        :pswitch_c
    .end packed-switch
.end method
