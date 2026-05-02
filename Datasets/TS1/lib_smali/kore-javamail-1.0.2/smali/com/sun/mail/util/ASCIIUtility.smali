.class public Lcom/sun/mail/util/ASCIIUtility;
.super Ljava/lang/Object;
.source "ASCIIUtility.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBytes(Ljava/io/InputStream;)[B
    .registers 7
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 257
    const/16 v3, 0x400

    .line 261
    .local v3, "size":I
    instance-of v4, p0, Ljava/io/ByteArrayInputStream;

    if-eqz v4, :cond_12

    .line 262
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 263
    new-array v1, v3, [B

    .line 264
    .local v1, "buf":[B
    invoke-virtual {p0, v1, v5, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 273
    .local v2, "len":I
    :goto_11
    return-object v1

    .line 267
    .end local v1    # "buf":[B
    .end local v2    # "len":I
    :cond_12
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 268
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    new-array v1, v3, [B

    .line 269
    .restart local v1    # "buf":[B
    :goto_19
    invoke-virtual {p0, v1, v5, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .restart local v2    # "len":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_24

    .line 270
    invoke-virtual {v0, v1, v5, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_19

    .line 271
    :cond_24
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    goto :goto_11
.end method

.method public static getBytes(Ljava/lang/String;)[B
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 245
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 246
    .local v1, "chars":[C
    array-length v4, v1

    .line 247
    .local v4, "size":I
    new-array v0, v4, [B

    .line 249
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_9
    if-ge v3, v4, :cond_14

    .line 250
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-char v5, v1, v3

    int-to-byte v5, v5

    aput-byte v5, v0, v3

    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_9

    .line 251
    :cond_14
    return-object v0
.end method

.method public static parseInt([BII)I
    .registers 4
    .param p0, "b"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 127
    const/16 v0, 0xa

    invoke-static {p0, p1, p2, v0}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BIII)I

    move-result v0

    return v0
.end method

.method public static parseInt([BIII)I
    .registers 14
    .param p0, "b"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 62
    if-nez p0, :cond_a

    .line 63
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "null"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 65
    :cond_a
    const/4 v6, 0x0

    .line 66
    .local v6, "result":I
    const/4 v5, 0x0

    .line 67
    .local v5, "negative":Z
    move v1, p1

    .line 72
    .local v1, "i":I
    if-le p2, p1, :cond_7a

    .line 73
    aget-byte v7, p0, v1

    const/16 v8, 0x2d

    if-ne v7, v8, :cond_46

    .line 74
    const/4 v5, 0x1

    .line 75
    const/high16 v3, -0x80000000

    .line 76
    .local v3, "limit":I
    add-int/lit8 v1, v1, 0x1

    .line 80
    :goto_1a
    div-int v4, v3, p3

    .line 81
    .local v4, "multmin":I
    if-ge v1, p2, :cond_93

    .line 82
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-byte v7, p0, v1

    int-to-char v7, v7

    invoke-static {v7, p3}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 83
    .local v0, "digit":I
    if-gez v0, :cond_4a

    .line 84
    new-instance v7, Ljava/lang/NumberFormatException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "illegal number: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 85
    invoke-static {p0, p1, p2}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 78
    .end local v0    # "digit":I
    .end local v2    # "i":I
    .end local v3    # "limit":I
    .end local v4    # "multmin":I
    .restart local v1    # "i":I
    :cond_46
    const v3, -0x7fffffff

    .restart local v3    # "limit":I
    goto :goto_1a

    .line 88
    .end local v1    # "i":I
    .restart local v0    # "digit":I
    .restart local v2    # "i":I
    .restart local v4    # "multmin":I
    :cond_4a
    neg-int v6, v0

    .line 91
    .end local v0    # "digit":I
    :goto_4b
    if-ge v2, p2, :cond_82

    .line 93
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-byte v7, p0, v2

    int-to-char v7, v7

    invoke-static {v7, p3}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 94
    .restart local v0    # "digit":I
    if-gez v0, :cond_60

    .line 95
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "illegal number"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 97
    :cond_60
    if-ge v6, v4, :cond_6a

    .line 98
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "illegal number"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 100
    :cond_6a
    mul-int/2addr v6, p3

    .line 101
    add-int v7, v3, v0

    if-ge v6, v7, :cond_77

    .line 102
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "illegal number"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 104
    :cond_77
    sub-int/2addr v6, v0

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_4b

    .line 107
    .end local v0    # "digit":I
    .end local v2    # "i":I
    .end local v3    # "limit":I
    .end local v4    # "multmin":I
    .restart local v1    # "i":I
    :cond_7a
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "illegal number"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 109
    .end local v1    # "i":I
    .restart local v2    # "i":I
    .restart local v3    # "limit":I
    .restart local v4    # "multmin":I
    :cond_82
    if-eqz v5, :cond_91

    .line 110
    add-int/lit8 v7, p1, 0x1

    if-le v2, v7, :cond_89

    .line 116
    .end local v6    # "result":I
    :goto_88
    return v6

    .line 113
    .restart local v6    # "result":I
    :cond_89
    new-instance v7, Ljava/lang/NumberFormatException;

    const-string v8, "illegal number"

    invoke-direct {v7, v8}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 116
    :cond_91
    neg-int v6, v6

    goto :goto_88

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_93
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_4b
.end method

.method public static parseLong([BII)J
    .registers 5
    .param p0, "b"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 204
    const/16 v0, 0xa

    invoke-static {p0, p1, p2, v0}, Lcom/sun/mail/util/ASCIIUtility;->parseLong([BIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public static parseLong([BIII)J
    .registers 18
    .param p0, "b"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 139
    if-nez p0, :cond_a

    .line 140
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "null"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 142
    :cond_a
    const-wide/16 v9, 0x0

    .line 143
    .local v9, "result":J
    const/4 v8, 0x0

    .line 144
    .local v8, "negative":Z
    move v2, p1

    .line 149
    .local v2, "i":I
    move/from16 v0, p2

    if-le v0, p1, :cond_93

    .line 150
    aget-byte v11, p0, v2

    const/16 v12, 0x2d

    if-ne v11, v12, :cond_50

    .line 151
    const/4 v8, 0x1

    .line 152
    const-wide/high16 v4, -0x8000000000000000L

    .line 153
    .local v4, "limit":J
    add-int/lit8 v2, v2, 0x1

    .line 157
    :goto_1d
    move/from16 v0, p3

    int-to-long v11, v0

    div-long v6, v4, v11

    .line 158
    .local v6, "multmin":J
    move/from16 v0, p2

    if-ge v2, v0, :cond_ac

    .line 159
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-byte v11, p0, v2

    int-to-char v11, v11

    move/from16 v0, p3

    invoke-static {v11, v0}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    .line 160
    .local v1, "digit":I
    if-gez v1, :cond_56

    .line 161
    new-instance v11, Ljava/lang/NumberFormatException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "illegal number: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 162
    invoke-static/range {p0 .. p2}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 155
    .end local v1    # "digit":I
    .end local v3    # "i":I
    .end local v4    # "limit":J
    .end local v6    # "multmin":J
    .restart local v2    # "i":I
    :cond_50
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .restart local v4    # "limit":J
    goto :goto_1d

    .line 165
    .end local v2    # "i":I
    .restart local v1    # "digit":I
    .restart local v3    # "i":I
    .restart local v6    # "multmin":J
    :cond_56
    neg-int v11, v1

    int-to-long v9, v11

    .line 168
    .end local v1    # "digit":I
    :goto_58
    move/from16 v0, p2

    if-ge v3, v0, :cond_9b

    .line 170
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aget-byte v11, p0, v3

    int-to-char v11, v11

    move/from16 v0, p3

    invoke-static {v11, v0}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    .line 171
    .restart local v1    # "digit":I
    if-gez v1, :cond_71

    .line 172
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "illegal number"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 174
    :cond_71
    cmp-long v11, v9, v6

    if-gez v11, :cond_7d

    .line 175
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "illegal number"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 177
    :cond_7d
    move/from16 v0, p3

    int-to-long v11, v0

    mul-long/2addr v9, v11

    .line 178
    int-to-long v11, v1

    add-long/2addr v11, v4

    cmp-long v11, v9, v11

    if-gez v11, :cond_8f

    .line 179
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "illegal number"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 181
    :cond_8f
    int-to-long v11, v1

    sub-long/2addr v9, v11

    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_58

    .line 184
    .end local v1    # "digit":I
    .end local v3    # "i":I
    .end local v4    # "limit":J
    .end local v6    # "multmin":J
    .restart local v2    # "i":I
    :cond_93
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "illegal number"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 186
    .end local v2    # "i":I
    .restart local v3    # "i":I
    .restart local v4    # "limit":J
    .restart local v6    # "multmin":J
    :cond_9b
    if-eqz v8, :cond_aa

    .line 187
    add-int/lit8 v11, p1, 0x1

    if-le v3, v11, :cond_a2

    .line 193
    .end local v9    # "result":J
    :goto_a1
    return-wide v9

    .line 190
    .restart local v9    # "result":J
    :cond_a2
    new-instance v11, Ljava/lang/NumberFormatException;

    const-string v12, "illegal number"

    invoke-direct {v11, v12}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 193
    :cond_aa
    neg-long v9, v9

    goto :goto_a1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_ac
    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_58
.end method

.method public static toString(Ljava/io/ByteArrayInputStream;)Ljava/lang/String;
    .registers 7
    .param p0, "is"    # Ljava/io/ByteArrayInputStream;

    .prologue
    .line 232
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v3

    .line 233
    .local v3, "size":I
    new-array v4, v3, [C

    .line 234
    .local v4, "theChars":[C
    new-array v0, v3, [B

    .line 236
    .local v0, "bytes":[B
    const/4 v5, 0x0

    invoke-virtual {p0, v0, v5, v3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 237
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    :goto_e
    if-ge v2, v3, :cond_1b

    .line 238
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-byte v5, v0, v2

    and-int/lit16 v5, v5, 0xff

    int-to-char v5, v5

    aput-char v5, v4, v2

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_e

    .line 240
    :cond_1b
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method

.method public static toString([B)Ljava/lang/String;
    .registers 3
    .param p0, "b"    # [B

    .prologue
    .line 228
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString([BII)Ljava/lang/String;
    .registers 10
    .param p0, "b"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 213
    sub-int v4, p2, p1

    .line 214
    .local v4, "size":I
    new-array v5, v4, [C

    .line 216
    .local v5, "theChars":[C
    const/4 v0, 0x0

    .local v0, "i":I
    move v2, p1

    .local v2, "j":I
    move v3, v2

    .end local v2    # "j":I
    .local v3, "j":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_8
    if-ge v1, v4, :cond_18

    .line 217
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "j":I
    .restart local v2    # "j":I
    aget-byte v6, p0, v3

    and-int/lit16 v6, v6, 0xff

    int-to-char v6, v6

    aput-char v6, v5, v1

    move v3, v2

    .end local v2    # "j":I
    .restart local v3    # "j":I
    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_8

    .line 219
    :cond_18
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>([C)V

    return-object v6
.end method
