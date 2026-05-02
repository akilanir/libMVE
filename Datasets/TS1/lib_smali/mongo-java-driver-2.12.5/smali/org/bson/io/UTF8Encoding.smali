.class Lorg/bson/io/UTF8Encoding;
.super Ljava/lang/Object;
.source "UTF8Encoding.java"


# static fields
.field private static final MAX_CODE_POINT:I = 0x10ffff

.field private static final MIN_2_BYTES:I = 0x80

.field private static final MIN_3_BYTES:I = 0x800

.field private static final MIN_4_BYTES:I = 0x10000


# instance fields
.field private decoderArray:[C


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/16 v0, 0x400

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/bson/io/UTF8Encoding;->decoderArray:[C

    return-void
.end method

.method private static final checkByte(III)V
    .registers 8
    .param p0, "ch"    # I
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    and-int/lit16 v0, p0, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_2d

    .line 65
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Illegal UTF-8 sequence: byte {0} of {1} byte sequence is not 10xxxxxx: {2}"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v2, v3

    const/4 v3, 0x2

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p0}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_2d
    return-void
.end method

.method private static final checkMinimal(II)V
    .registers 9
    .param p0, "ch"    # I
    .param p1, "minValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    if-lt p0, p1, :cond_3

    .line 71
    return-void

    .line 74
    :cond_3
    sparse-switch p1, :sswitch_data_76

    .line 85
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unexpected minValue passed to checkMinimal: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 76
    :sswitch_1f
    const/4 v0, 0x2

    .line 89
    .local v0, "actualLen":I
    :goto_20
    const/16 v2, 0x80

    if-ge p0, v2, :cond_50

    .line 90
    const/4 v1, 0x1

    .line 98
    .local v1, "expectedLen":I
    :goto_25
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Illegal UTF-8 sequence: {0} bytes used to encode a {1} byte value: {2}"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v4, v5

    const/4 v5, 0x2

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, p0}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 79
    .end local v0    # "actualLen":I
    .end local v1    # "expectedLen":I
    :sswitch_4c
    const/4 v0, 0x3

    .line 80
    .restart local v0    # "actualLen":I
    goto :goto_20

    .line 82
    .end local v0    # "actualLen":I
    :sswitch_4e
    const/4 v0, 0x4

    .line 83
    .restart local v0    # "actualLen":I
    goto :goto_20

    .line 91
    :cond_50
    const/16 v2, 0x800

    if-ge p0, v2, :cond_56

    .line 92
    const/4 v1, 0x2

    .restart local v1    # "expectedLen":I
    goto :goto_25

    .line 93
    .end local v1    # "expectedLen":I
    :cond_56
    const/high16 v2, 0x10000

    if-ge p0, v2, :cond_5c

    .line 94
    const/4 v1, 0x3

    .restart local v1    # "expectedLen":I
    goto :goto_25

    .line 96
    .end local v1    # "expectedLen":I
    :cond_5c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unexpected ch passed to checkMinimal: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 74
    nop

    :sswitch_data_76
    .sparse-switch
        0x80 -> :sswitch_1f
        0x800 -> :sswitch_4c
        0x10000 -> :sswitch_4e
    .end sparse-switch
.end method


# virtual methods
.method public declared-synchronized decode([BII)Ljava/lang/String;
    .registers 18
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lorg/bson/io/UTF8Encoding;->decoderArray:[C

    .line 117
    .local v2, "cdata":[C
    array-length v9, v2

    move/from16 v0, p3

    if-ge v9, v0, :cond_e

    .line 118
    move/from16 v0, p3

    new-array v2, v0, [C

    .end local v2    # "cdata":[C
    iput-object v2, p0, Lorg/bson/io/UTF8Encoding;->decoderArray:[C
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_47

    .line 120
    .restart local v2    # "cdata":[C
    :cond_e
    move/from16 v5, p2

    .line 121
    .local v5, "in":I
    const/4 v7, 0x0

    .line 122
    .local v7, "out":I
    add-int v4, p3, p2

    .local v4, "end":I
    move v8, v7

    .end local v7    # "out":I
    .local v8, "out":I
    move v6, v5

    .line 126
    .end local v5    # "in":I
    .local v6, "in":I
    :goto_15
    if-ge v6, v4, :cond_15b

    .line 128
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "in":I
    .restart local v5    # "in":I
    :try_start_19
    aget-byte v9, p1, v6

    and-int/lit16 v3, v9, 0xff

    .line 131
    .local v3, "ch":I
    const/16 v9, 0x80

    if-ge v3, v9, :cond_4a

    .line 166
    :goto_21
    const v9, 0x10ffff

    if-le v3, v9, :cond_10e

    .line 167
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: final value is out of range: {0}"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/Integer;

    invoke-direct {v13, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_3d
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_19 .. :try_end_3d} :catch_3d
    .catchall {:try_start_19 .. :try_end_3d} :catchall_47

    .line 190
    .end local v3    # "ch":I
    :catch_3d
    move-exception v1

    move v7, v8

    .line 192
    .end local v8    # "out":I
    .local v1, "a":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v7    # "out":I
    :goto_3f
    :try_start_3f
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: multibyte sequence was truncated"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_47
    .catchall {:try_start_3f .. :try_end_47} :catchall_47

    .line 116
    .end local v1    # "a":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v2    # "cdata":[C
    .end local v4    # "end":I
    .end local v5    # "in":I
    .end local v7    # "out":I
    :catchall_47
    move-exception v9

    monitor-exit p0

    throw v9

    .line 133
    .restart local v2    # "cdata":[C
    .restart local v3    # "ch":I
    .restart local v4    # "end":I
    .restart local v5    # "in":I
    .restart local v8    # "out":I
    :cond_4a
    const/16 v9, 0xc0

    if-ge v3, v9, :cond_6a

    .line 135
    :try_start_4e
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: initial byte is {0}: {1}"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "10xxxxxx"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    new-instance v13, Ljava/lang/Integer;

    invoke-direct {v13, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 137
    :cond_6a
    const/16 v9, 0xe0

    if-ge v3, v9, :cond_87

    .line 139
    and-int/lit8 v9, v3, 0x1f

    shl-int/lit8 v3, v9, 0x6

    .line 140
    aget-byte v9, p1, v5

    const/4 v10, 0x2

    const/4 v11, 0x2

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_79
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4e .. :try_end_79} :catch_3d
    .catchall {:try_start_4e .. :try_end_79} :catchall_47

    .line 141
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "in":I
    .restart local v6    # "in":I
    :try_start_7b
    aget-byte v9, p1, v5

    and-int/lit8 v9, v9, 0x3f

    or-int/2addr v3, v9

    .line 142
    const/16 v9, 0x80

    invoke-static {v3, v9}, Lorg/bson/io/UTF8Encoding;->checkMinimal(II)V
    :try_end_85
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7b .. :try_end_85} :catch_16d
    .catchall {:try_start_7b .. :try_end_85} :catchall_47

    move v5, v6

    .end local v6    # "in":I
    .restart local v5    # "in":I
    goto :goto_21

    .line 143
    :cond_87
    const/16 v9, 0xf0

    if-ge v3, v9, :cond_b4

    .line 145
    and-int/lit8 v9, v3, 0xf

    shl-int/lit8 v3, v9, 0xc

    .line 146
    :try_start_8f
    aget-byte v9, p1, v5

    const/4 v10, 0x2

    const/4 v11, 0x3

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_96
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_8f .. :try_end_96} :catch_3d
    .catchall {:try_start_8f .. :try_end_96} :catchall_47

    .line 147
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "in":I
    .restart local v6    # "in":I
    :try_start_98
    aget-byte v9, p1, v5

    and-int/lit8 v9, v9, 0x3f

    shl-int/lit8 v9, v9, 0x6

    or-int/2addr v3, v9

    .line 148
    aget-byte v9, p1, v6

    const/4 v10, 0x3

    const/4 v11, 0x3

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_a6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_98 .. :try_end_a6} :catch_16d
    .catchall {:try_start_98 .. :try_end_a6} :catchall_47

    .line 149
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "in":I
    .restart local v5    # "in":I
    :try_start_a8
    aget-byte v9, p1, v6

    and-int/lit8 v9, v9, 0x3f

    or-int/2addr v3, v9

    .line 150
    const/16 v9, 0x800

    invoke-static {v3, v9}, Lorg/bson/io/UTF8Encoding;->checkMinimal(II)V

    goto/16 :goto_21

    .line 151
    :cond_b4
    const/16 v9, 0xf8

    if-ge v3, v9, :cond_f2

    .line 153
    and-int/lit8 v9, v3, 0x7

    shl-int/lit8 v3, v9, 0x12

    .line 154
    aget-byte v9, p1, v5

    const/4 v10, 0x2

    const/4 v11, 0x4

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_c3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_a8 .. :try_end_c3} :catch_3d
    .catchall {:try_start_a8 .. :try_end_c3} :catchall_47

    .line 155
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "in":I
    .restart local v6    # "in":I
    :try_start_c5
    aget-byte v9, p1, v5

    and-int/lit8 v9, v9, 0x3f

    shl-int/lit8 v9, v9, 0xc

    or-int/2addr v3, v9

    .line 156
    aget-byte v9, p1, v6

    const/4 v10, 0x3

    const/4 v11, 0x4

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_d3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_c5 .. :try_end_d3} :catch_16d
    .catchall {:try_start_c5 .. :try_end_d3} :catchall_47

    .line 157
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "in":I
    .restart local v5    # "in":I
    :try_start_d5
    aget-byte v9, p1, v6

    and-int/lit8 v9, v9, 0x3f

    shl-int/lit8 v9, v9, 0x6

    or-int/2addr v3, v9

    .line 158
    aget-byte v9, p1, v5

    const/4 v10, 0x4

    const/4 v11, 0x4

    invoke-static {v9, v10, v11}, Lorg/bson/io/UTF8Encoding;->checkByte(III)V
    :try_end_e3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_d5 .. :try_end_e3} :catch_3d
    .catchall {:try_start_d5 .. :try_end_e3} :catchall_47

    .line 159
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "in":I
    .restart local v6    # "in":I
    :try_start_e5
    aget-byte v9, p1, v5

    and-int/lit8 v9, v9, 0x3f

    or-int/2addr v3, v9

    .line 160
    const/high16 v9, 0x10000

    invoke-static {v3, v9}, Lorg/bson/io/UTF8Encoding;->checkMinimal(II)V
    :try_end_ef
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_e5 .. :try_end_ef} :catch_16d
    .catchall {:try_start_e5 .. :try_end_ef} :catchall_47

    move v5, v6

    .end local v6    # "in":I
    .restart local v5    # "in":I
    goto/16 :goto_21

    .line 162
    :cond_f2
    :try_start_f2
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: initial byte is {0}: {1}"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "11111xxx"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    new-instance v13, Ljava/lang/Integer;

    invoke-direct {v13, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_10e
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_f2 .. :try_end_10e} :catch_3d
    .catchall {:try_start_f2 .. :try_end_10e} :catchall_47

    .line 175
    :cond_10e
    const v9, 0xffff

    if-le v3, v9, :cond_131

    .line 177
    const/high16 v9, 0x10000

    sub-int/2addr v3, v9

    .line 178
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "out":I
    .restart local v7    # "out":I
    const v9, 0xd800

    shr-int/lit8 v10, v3, 0xa

    add-int/2addr v9, v10

    int-to-char v9, v9

    :try_start_11f
    aput-char v9, v2, v8
    :try_end_121
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_11f .. :try_end_121} :catch_158
    .catchall {:try_start_11f .. :try_end_121} :catchall_47

    .line 179
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "out":I
    .restart local v8    # "out":I
    const v9, 0xdc00

    and-int/lit16 v10, v3, 0x3ff

    add-int/2addr v9, v10

    int-to-char v9, v9

    :try_start_12a
    aput-char v9, v2, v7

    move v7, v8

    .end local v8    # "out":I
    .restart local v7    # "out":I
    :goto_12d
    move v8, v7

    .end local v7    # "out":I
    .restart local v8    # "out":I
    move v6, v5

    .line 188
    .end local v5    # "in":I
    .restart local v6    # "in":I
    goto/16 :goto_15

    .line 180
    .end local v6    # "in":I
    .restart local v5    # "in":I
    :cond_131
    const v9, 0xd800

    if-lt v3, v9, :cond_152

    const v9, 0xe000

    if-ge v3, v9, :cond_152

    .line 182
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: final value is a surrogate value: {0}"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/Integer;

    invoke-direct {v13, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_152
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_12a .. :try_end_152} :catch_3d
    .catchall {:try_start_12a .. :try_end_152} :catchall_47

    .line 186
    :cond_152
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "out":I
    .restart local v7    # "out":I
    int-to-char v9, v3

    :try_start_155
    aput-char v9, v2, v8
    :try_end_157
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_155 .. :try_end_157} :catch_158
    .catchall {:try_start_155 .. :try_end_157} :catchall_47

    goto :goto_12d

    .line 190
    :catch_158
    move-exception v1

    goto/16 :goto_3f

    .line 196
    .end local v3    # "ch":I
    .end local v5    # "in":I
    .end local v7    # "out":I
    .restart local v6    # "in":I
    .restart local v8    # "out":I
    :cond_15b
    if-le v6, v4, :cond_165

    .line 197
    :try_start_15d
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Illegal UTF-8 sequence: multibyte sequence was truncated"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 199
    :cond_165
    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v9, v2, v10, v8}, Ljava/lang/String;-><init>([CII)V
    :try_end_16b
    .catchall {:try_start_15d .. :try_end_16b} :catchall_47

    monitor-exit p0

    return-object v9

    .line 190
    .restart local v3    # "ch":I
    :catch_16d
    move-exception v1

    move v7, v8

    .end local v8    # "out":I
    .restart local v7    # "out":I
    move v5, v6

    .end local v6    # "in":I
    .restart local v5    # "in":I
    goto/16 :goto_3f
.end method
