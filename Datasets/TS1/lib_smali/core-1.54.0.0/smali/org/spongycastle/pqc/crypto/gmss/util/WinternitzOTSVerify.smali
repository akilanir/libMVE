.class public Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;
.super Ljava/lang/Object;
.source "WinternitzOTSVerify.java"


# instance fields
.field private messDigestOTS:Lorg/spongycastle/crypto/Digest;

.field private w:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;I)V
    .registers 3
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p2, "w"    # I

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 32
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 33
    return-void
.end method


# virtual methods
.method public Verify([B[B)[B
    .registers 35
    .param p1, "message"    # [B
    .param p2, "signature"    # [B

    .prologue
    .line 60
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v19

    .line 61
    .local v19, "mdsize":I
    move/from16 v0, v19

    new-array v11, v0, [B

    .line 64
    .local v11, "hash":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v31, v0

    move-object/from16 v0, v29

    move-object/from16 v1, p1

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 65
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v11, v0, [B

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v11, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 68
    shl-int/lit8 v29, v19, 0x3

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    add-int/lit8 v30, v30, -0x1

    add-int v29, v29, v30

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    div-int v23, v29, v30

    .line 69
    .local v23, "size":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    shl-int v29, v23, v29

    add-int/lit8 v29, v29, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    move-result v18

    .line 70
    .local v18, "logs":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v29, v29, v18

    add-int/lit8 v29, v29, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    div-int v29, v29, v30

    add-int v17, v23, v29

    .line 72
    .local v17, "keysize":I
    mul-int v28, v19, v17

    .line 74
    .local v28, "testKeySize":I
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v29, v0

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_8c

    .line 76
    const/4 v4, 0x0

    .line 320
    :goto_8b
    return-object v4

    .line 79
    :cond_8c
    move/from16 v0, v28

    new-array v0, v0, [B

    move-object/from16 v27, v0

    .line 81
    .local v27, "testKey":[B
    const/4 v7, 0x0

    .line 82
    .local v7, "c":I
    const/4 v8, 0x0

    .line 85
    .local v8, "counter":I
    const/16 v29, 0x8

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    rem-int v29, v29, v30

    if-nez v29, :cond_1b8

    .line 87
    const/16 v29, 0x8

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    div-int v9, v29, v30

    .line 88
    .local v9, "d":I
    const/16 v29, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    shl-int v29, v29, v30

    add-int/lit8 v16, v29, -0x1

    .line 89
    .local v16, "k":I
    move/from16 v0, v19

    new-array v12, v0, [B

    .line 92
    .local v12, "hlp":[B
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_bb
    array-length v0, v11

    move/from16 v29, v0

    move/from16 v0, v29

    if-ge v13, v0, :cond_13c

    .line 94
    const/4 v15, 0x0

    .local v15, "j":I
    :goto_c3
    if-ge v15, v9, :cond_139

    .line 96
    aget-byte v29, v11, v13

    and-int v24, v29, v16

    .line 97
    .local v24, "test":I
    add-int v7, v7, v24

    .line 99
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    :goto_da
    move/from16 v0, v24

    move/from16 v1, v16

    if-ge v0, v1, :cond_114

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 106
    add-int/lit8 v24, v24, 0x1

    goto :goto_da

    .line 109
    :cond_114
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    aget-byte v29, v11, v13

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    ushr-int v29, v29, v30

    move/from16 v0, v29

    int-to-byte v0, v0

    move/from16 v29, v0

    aput-byte v29, v11, v13

    .line 111
    add-int/lit8 v8, v8, 0x1

    .line 94
    add-int/lit8 v15, v15, 0x1

    goto :goto_c3

    .line 92
    .end local v24    # "test":I
    :cond_139
    add-int/lit8 v13, v13, 0x1

    goto :goto_bb

    .line 115
    .end local v15    # "j":I
    :cond_13c
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    shl-int v29, v23, v29

    sub-int v7, v29, v7

    .line 116
    const/4 v13, 0x0

    :goto_147
    move/from16 v0, v18

    if-ge v13, v0, :cond_594

    .line 118
    and-int v24, v7, v16

    .line 120
    .restart local v24    # "test":I
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 122
    :goto_15c
    move/from16 v0, v24

    move/from16 v1, v16

    if-ge v0, v1, :cond_196

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 127
    add-int/lit8 v24, v24, 0x1

    goto :goto_15c

    .line 129
    :cond_196
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    ushr-int v7, v7, v29

    .line 131
    add-int/lit8 v8, v8, 0x1

    .line 116
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v13, v13, v29

    goto :goto_147

    .line 134
    .end local v9    # "d":I
    .end local v12    # "hlp":[B
    .end local v13    # "i":I
    .end local v16    # "k":I
    .end local v24    # "test":I
    :cond_1b8
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    const/16 v30, 0x8

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_3a4

    .line 136
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    div-int v9, v19, v29

    .line 137
    .restart local v9    # "d":I
    const/16 v29, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    shl-int v29, v29, v30

    add-int/lit8 v16, v29, -0x1

    .line 138
    .restart local v16    # "k":I
    move/from16 v0, v19

    new-array v12, v0, [B

    .line 140
    .restart local v12    # "hlp":[B
    const/4 v14, 0x0

    .line 143
    .local v14, "ii":I
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_1e0
    if-ge v13, v9, :cond_285

    .line 145
    const-wide/16 v5, 0x0

    .line 146
    .local v5, "big8":J
    const/4 v15, 0x0

    .restart local v15    # "j":I
    :goto_1e5
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    move/from16 v0, v29

    if-ge v15, v0, :cond_207

    .line 148
    aget-byte v29, v11, v14

    move/from16 v0, v29

    and-int/lit16 v0, v0, 0xff

    move/from16 v29, v0

    shl-int/lit8 v30, v15, 0x3

    shl-int v29, v29, v30

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v29, v0

    xor-long v5, v5, v29

    .line 149
    add-int/lit8 v14, v14, 0x1

    .line 146
    add-int/lit8 v15, v15, 0x1

    goto :goto_1e5

    .line 151
    :cond_207
    const/4 v15, 0x0

    :goto_208
    const/16 v29, 0x8

    move/from16 v0, v29

    if-ge v15, v0, :cond_281

    .line 153
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    and-long v29, v29, v5

    move-wide/from16 v0, v29

    long-to-int v0, v0

    move/from16 v24, v0

    .line 154
    .restart local v24    # "test":I
    add-int v7, v7, v24

    .line 156
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 158
    :goto_22b
    move/from16 v0, v24

    move/from16 v1, v16

    if-ge v0, v1, :cond_265

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 163
    add-int/lit8 v24, v24, 0x1

    goto :goto_22b

    .line 166
    :cond_265
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    ushr-long v5, v5, v29

    .line 168
    add-int/lit8 v8, v8, 0x1

    .line 151
    add-int/lit8 v15, v15, 0x1

    goto :goto_208

    .line 143
    .end local v24    # "test":I
    :cond_281
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1e0

    .line 172
    .end local v5    # "big8":J
    .end local v15    # "j":I
    :cond_285
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    rem-int v9, v19, v29

    .line 173
    const-wide/16 v5, 0x0

    .line 174
    .restart local v5    # "big8":J
    const/4 v15, 0x0

    .restart local v15    # "j":I
    :goto_290
    if-ge v15, v9, :cond_2aa

    .line 176
    aget-byte v29, v11, v14

    move/from16 v0, v29

    and-int/lit16 v0, v0, 0xff

    move/from16 v29, v0

    shl-int/lit8 v30, v15, 0x3

    shl-int v29, v29, v30

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v29, v0

    xor-long v5, v5, v29

    .line 177
    add-int/lit8 v14, v14, 0x1

    .line 174
    add-int/lit8 v15, v15, 0x1

    goto :goto_290

    .line 179
    :cond_2aa
    shl-int/lit8 v9, v9, 0x3

    .line 180
    const/4 v15, 0x0

    :goto_2ad
    if-ge v15, v9, :cond_328

    .line 182
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    and-long v29, v29, v5

    move-wide/from16 v0, v29

    long-to-int v0, v0

    move/from16 v24, v0

    .line 183
    .restart local v24    # "test":I
    add-int v7, v7, v24

    .line 185
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    :goto_2cc
    move/from16 v0, v24

    move/from16 v1, v16

    if-ge v0, v1, :cond_306

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 192
    add-int/lit8 v24, v24, 0x1

    goto :goto_2cc

    .line 195
    :cond_306
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    ushr-long v5, v5, v29

    .line 197
    add-int/lit8 v8, v8, 0x1

    .line 180
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v15, v15, v29

    goto :goto_2ad

    .line 201
    .end local v24    # "test":I
    :cond_328
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    shl-int v29, v23, v29

    sub-int v7, v29, v7

    .line 202
    const/4 v13, 0x0

    :goto_333
    move/from16 v0, v18

    if-ge v13, v0, :cond_594

    .line 204
    and-int v24, v7, v16

    .line 206
    .restart local v24    # "test":I
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    :goto_348
    move/from16 v0, v24

    move/from16 v1, v16

    if-ge v0, v1, :cond_382

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 213
    add-int/lit8 v24, v24, 0x1

    goto :goto_348

    .line 216
    :cond_382
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    ushr-int v7, v7, v29

    .line 218
    add-int/lit8 v8, v8, 0x1

    .line 202
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v13, v13, v29

    goto :goto_333

    .line 221
    .end local v5    # "big8":J
    .end local v9    # "d":I
    .end local v12    # "hlp":[B
    .end local v13    # "i":I
    .end local v14    # "ii":I
    .end local v15    # "j":I
    .end local v16    # "k":I
    .end local v24    # "test":I
    :cond_3a4
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    const/16 v30, 0x39

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_594

    .line 223
    shl-int/lit8 v29, v19, 0x3

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    sub-int v9, v29, v30

    .line 224
    .restart local v9    # "d":I
    const/16 v29, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v30, v0

    shl-int v29, v29, v30

    add-int/lit8 v16, v29, -0x1

    .line 225
    .restart local v16    # "k":I
    move/from16 v0, v19

    new-array v12, v0, [B

    .line 227
    .restart local v12    # "hlp":[B
    const/16 v20, 0x0

    .line 231
    .local v20, "r":I
    :goto_3ce
    move/from16 v0, v20

    if-gt v0, v9, :cond_473

    .line 233
    ushr-int/lit8 v22, v20, 0x3

    .line 234
    .local v22, "s":I
    rem-int/lit8 v21, v20, 0x8

    .line 235
    .local v21, "rest":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v20, v20, v29

    .line 236
    add-int/lit8 v29, v20, 0x7

    ushr-int/lit8 v10, v29, 0x3

    .line 237
    .local v10, "f":I
    const-wide/16 v5, 0x0

    .line 238
    .restart local v5    # "big8":J
    const/4 v14, 0x0

    .line 239
    .restart local v14    # "ii":I
    move/from16 v15, v22

    .restart local v15    # "j":I
    :goto_3e7
    if-ge v15, v10, :cond_401

    .line 241
    aget-byte v29, v11, v15

    move/from16 v0, v29

    and-int/lit16 v0, v0, 0xff

    move/from16 v29, v0

    shl-int/lit8 v30, v14, 0x3

    shl-int v29, v29, v30

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v29, v0

    xor-long v5, v5, v29

    .line 242
    add-int/lit8 v14, v14, 0x1

    .line 239
    add-int/lit8 v15, v15, 0x1

    goto :goto_3e7

    .line 245
    :cond_401
    ushr-long v5, v5, v21

    .line 246
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    and-long v25, v5, v29

    .line 247
    .local v25, "test8":J
    int-to-long v0, v7

    move-wide/from16 v29, v0

    add-long v29, v29, v25

    move-wide/from16 v0, v29

    long-to-int v7, v0

    .line 249
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    :goto_421
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    cmp-long v29, v25, v29

    if-gez v29, :cond_460

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 256
    const-wide/16 v29, 0x1

    add-long v25, v25, v29

    goto :goto_421

    .line 259
    :cond_460
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 260
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_3ce

    .line 264
    .end local v5    # "big8":J
    .end local v10    # "f":I
    .end local v14    # "ii":I
    .end local v15    # "j":I
    .end local v21    # "rest":I
    .end local v22    # "s":I
    .end local v25    # "test8":J
    :cond_473
    ushr-int/lit8 v22, v20, 0x3

    .line 265
    .restart local v22    # "s":I
    move/from16 v0, v22

    move/from16 v1, v19

    if-ge v0, v1, :cond_50e

    .line 267
    rem-int/lit8 v21, v20, 0x8

    .line 268
    .restart local v21    # "rest":I
    const-wide/16 v5, 0x0

    .line 269
    .restart local v5    # "big8":J
    const/4 v14, 0x0

    .line 270
    .restart local v14    # "ii":I
    move/from16 v15, v22

    .restart local v15    # "j":I
    :goto_482
    move/from16 v0, v19

    if-ge v15, v0, :cond_49e

    .line 272
    aget-byte v29, v11, v15

    move/from16 v0, v29

    and-int/lit16 v0, v0, 0xff

    move/from16 v29, v0

    shl-int/lit8 v30, v14, 0x3

    shl-int v29, v29, v30

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v29, v0

    xor-long v5, v5, v29

    .line 273
    add-int/lit8 v14, v14, 0x1

    .line 270
    add-int/lit8 v15, v15, 0x1

    goto :goto_482

    .line 276
    :cond_49e
    ushr-long v5, v5, v21

    .line 277
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    and-long v25, v5, v29

    .line 278
    .restart local v25    # "test8":J
    int-to-long v0, v7

    move-wide/from16 v29, v0

    add-long v29, v29, v25

    move-wide/from16 v0, v29

    long-to-int v7, v0

    .line 280
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 282
    :goto_4be
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    cmp-long v29, v25, v29

    if-gez v29, :cond_4fd

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 287
    const-wide/16 v29, 0x1

    add-long v25, v25, v29

    goto :goto_4be

    .line 290
    :cond_4fd
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 291
    add-int/lit8 v8, v8, 0x1

    .line 294
    .end local v5    # "big8":J
    .end local v14    # "ii":I
    .end local v15    # "j":I
    .end local v21    # "rest":I
    .end local v25    # "test8":J
    :cond_50e
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    shl-int v29, v23, v29

    sub-int v7, v29, v7

    .line 295
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_519
    move/from16 v0, v18

    if-ge v13, v0, :cond_594

    .line 297
    and-int v29, v7, v16

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v25, v0

    .line 299
    .restart local v25    # "test8":J
    mul-int v29, v8, v19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 301
    :goto_533
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v29, v0

    cmp-long v29, v25, v29

    if-gez v29, :cond_572

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    array-length v0, v12

    move/from16 v31, v0

    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-interface {v0, v12, v1, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v12, v0, [B

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v12, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 306
    const-wide/16 v29, 0x1

    add-long v25, v25, v29

    goto :goto_533

    .line 309
    :cond_572
    const/16 v29, 0x0

    mul-int v30, v8, v19

    move/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v19

    invoke-static {v12, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 310
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    ushr-int v7, v7, v29

    .line 311
    add-int/lit8 v8, v8, 0x1

    .line 295
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    move/from16 v29, v0

    add-int v13, v13, v29

    goto :goto_519

    .line 315
    .end local v9    # "d":I
    .end local v12    # "hlp":[B
    .end local v13    # "i":I
    .end local v16    # "k":I
    .end local v20    # "r":I
    .end local v22    # "s":I
    .end local v25    # "test8":J
    :cond_594
    move/from16 v0, v19

    new-array v4, v0, [B

    .line 316
    .local v4, "TKey":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-interface {v0, v1, v2, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v29

    move/from16 v0, v29

    new-array v4, v0, [B

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-interface {v0, v4, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    goto/16 :goto_8b
.end method

.method public getLog(I)I
    .registers 4
    .param p1, "intValue"    # I

    .prologue
    .line 334
    const/4 v1, 0x1

    .line 335
    .local v1, "log":I
    const/4 v0, 0x2

    .line 336
    .local v0, "i":I
    :goto_2
    if-ge v0, p1, :cond_9

    .line 338
    shl-int/lit8 v0, v0, 0x1

    .line 339
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 341
    :cond_9
    return v1
.end method

.method public getSignatureLength()I
    .registers 6

    .prologue
    .line 40
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    .line 41
    .local v1, "mdsize":I
    shl-int/lit8 v3, v1, 0x3

    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/lit8 v4, v4, -0x1

    add-int/2addr v3, v4

    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    div-int v2, v3, v4

    .line 42
    .local v2, "size":I
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    shl-int v3, v2, v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    move-result v0

    .line 43
    .local v0, "logs":I
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    iget v4, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    div-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 45
    mul-int v3, v1, v2

    return v3
.end method
