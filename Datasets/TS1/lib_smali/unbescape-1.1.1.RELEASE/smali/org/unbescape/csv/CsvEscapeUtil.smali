.class final Lorg/unbescape/csv/CsvEscapeUtil;
.super Ljava/lang/Object;
.source "CsvEscapeUtil.java"


# static fields
.field private static final DOUBLE_QUOTE:C = '\"'

.field private static final TWO_DOUBLE_QUOTES:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 75
    const-string v0, "\"\""

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/csv/CsvEscapeUtil;->TWO_DOUBLE_QUOTES:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method static escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x22

    .line 92
    if-nez p0, :cond_6

    .line 93
    const/4 p0, 0x0

    .line 169
    .end local p0    # "text":Ljava/lang/String;
    .local v1, "i":I
    .local v2, "max":I
    .local v3, "offset":I
    .local v4, "readOffset":I
    .local v5, "strBuilder":Ljava/lang/StringBuilder;
    :cond_5
    :goto_5
    return-object p0

    .line 96
    .end local v1    # "i":I
    .end local v2    # "max":I
    .end local v3    # "offset":I
    .end local v4    # "readOffset":I
    .end local v5    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_6
    const/4 v5, 0x0

    .line 98
    .restart local v5    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 99
    .restart local v3    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 101
    .restart local v2    # "max":I
    const/4 v4, 0x0

    .line 103
    .restart local v4    # "readOffset":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_e
    if-ge v1, v2, :cond_50

    .line 105
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 112
    .local v0, "c":C
    const/16 v6, 0x61

    if-lt v0, v6, :cond_1c

    const/16 v6, 0x7a

    if-le v0, v6, :cond_2c

    :cond_1c
    const/16 v6, 0x41

    if-lt v0, v6, :cond_24

    const/16 v6, 0x5a

    if-le v0, v6, :cond_2c

    :cond_24
    const/16 v6, 0x30

    if-lt v0, v6, :cond_2f

    const/16 v6, 0x39

    if-gt v0, v6, :cond_2f

    .line 103
    :cond_2c
    :goto_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 121
    :cond_2f
    if-nez v5, :cond_3b

    .line 122
    new-instance v5, Ljava/lang/StringBuilder;

    .end local v5    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v6, v2, 0x14

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 125
    .restart local v5    # "strBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    :cond_3b
    sub-int v6, v1, v4

    if-lez v6, :cond_42

    .line 132
    invoke-virtual {v5, p0, v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 135
    :cond_42
    add-int/lit8 v4, v1, 0x1

    .line 140
    if-ne v0, v7, :cond_4c

    .line 141
    sget-object v6, Lorg/unbescape/csv/CsvEscapeUtil;->TWO_DOUBLE_QUOTES:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 145
    :cond_4c
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 157
    .end local v0    # "c":C
    :cond_50
    if-eqz v5, :cond_5

    .line 161
    sub-int v6, v2, v4

    if-lez v6, :cond_59

    .line 162
    invoke-virtual {v5, p0, v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 167
    :cond_59
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 169
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_5
.end method

.method static escape([CIILjava/io/Writer;)V
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x22

    .line 183
    if-eqz p0, :cond_7

    array-length v4, p0

    if-nez v4, :cond_8

    .line 253
    :cond_7
    :goto_7
    return-void

    .line 187
    :cond_8
    add-int v2, p1, p2

    .line 189
    .local v2, "max":I
    move v3, p1

    .line 191
    .local v3, "readOffset":I
    move v1, p1

    .local v1, "i":I
    :goto_c
    if-ge v1, v2, :cond_47

    .line 193
    aget-char v0, p0, v1

    .line 200
    .local v0, "c":C
    const/16 v4, 0x61

    if-lt v0, v4, :cond_18

    const/16 v4, 0x7a

    if-le v0, v4, :cond_28

    :cond_18
    const/16 v4, 0x41

    if-lt v0, v4, :cond_20

    const/16 v4, 0x5a

    if-le v0, v4, :cond_28

    :cond_20
    const/16 v4, 0x30

    if-lt v0, v4, :cond_2b

    const/16 v4, 0x39

    if-gt v0, v4, :cond_2b

    .line 191
    :cond_28
    :goto_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 209
    :cond_2b
    if-ne v3, p1, :cond_30

    .line 212
    invoke-virtual {p3, v5}, Ljava/io/Writer;->write(I)V

    .line 218
    :cond_30
    sub-int v4, v1, v3

    if-lez v4, :cond_39

    .line 219
    sub-int v4, v1, v3

    invoke-virtual {p3, p0, v3, v4}, Ljava/io/Writer;->write([CII)V

    .line 222
    :cond_39
    add-int/lit8 v3, v1, 0x1

    .line 227
    if-ne v0, v5, :cond_43

    .line 228
    sget-object v4, Lorg/unbescape/csv/CsvEscapeUtil;->TWO_DOUBLE_QUOTES:[C

    invoke-virtual {p3, v4}, Ljava/io/Writer;->write([C)V

    goto :goto_28

    .line 232
    :cond_43
    invoke-virtual {p3, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_28

    .line 243
    .end local v0    # "c":C
    :cond_47
    sub-int v4, v2, v3

    if-lez v4, :cond_50

    .line 244
    sub-int v4, v2, v3

    invoke-virtual {p3, p0, v3, v4}, Ljava/io/Writer;->write([CII)V

    .line 247
    :cond_50
    if-le v3, p1, :cond_7

    .line 250
    invoke-virtual {p3, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_7
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x22

    .line 269
    if-nez p0, :cond_6

    .line 270
    const/4 p0, 0x0

    .line 397
    .end local p0    # "text":Ljava/lang/String;
    .local v2, "i":I
    .local v3, "isQuoted":Z
    .local v4, "max":I
    .local v5, "offset":I
    .local v6, "readOffset":I
    .local v7, "referenceOffset":I
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    :cond_5
    :goto_5
    return-object p0

    .line 273
    .end local v2    # "i":I
    .end local v3    # "isQuoted":Z
    .end local v4    # "max":I
    .end local v5    # "offset":I
    .end local v6    # "readOffset":I
    .end local v7    # "referenceOffset":I
    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_6
    const/4 v8, 0x0

    .line 275
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 276
    .restart local v5    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 278
    .restart local v4    # "max":I
    const/4 v6, 0x0

    .line 279
    .restart local v6    # "readOffset":I
    const/4 v7, 0x0

    .line 281
    .restart local v7    # "referenceOffset":I
    const/4 v3, 0x0

    .line 283
    .restart local v3    # "isQuoted":Z
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_10
    if-ge v2, v4, :cond_65

    .line 285
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 290
    .local v0, "c":C
    if-lez v2, :cond_1d

    if-eq v0, v10, :cond_1d

    .line 283
    :cond_1a
    :goto_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 298
    :cond_1d
    if-ne v0, v10, :cond_1a

    .line 300
    if-nez v2, :cond_33

    .line 304
    add-int/lit8 v9, v2, 0x1

    if-ge v9, v4, :cond_1a

    .line 309
    add-int/lit8 v9, v4, -0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v10, :cond_1a

    .line 311
    const/4 v3, 0x1

    .line 313
    add-int/lit8 v7, v2, 0x1

    .line 314
    add-int/lit8 v6, v2, 0x1

    .line 315
    goto :goto_1a

    .line 323
    :cond_33
    if-eqz v3, :cond_5c

    add-int/lit8 v9, v2, 0x2

    if-ge v9, v4, :cond_5c

    .line 326
    add-int/lit8 v9, v2, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 327
    .local v1, "c1":C
    if-ne v1, v10, :cond_43

    .line 329
    add-int/lit8 v7, v2, 0x1

    .line 358
    .end local v1    # "c1":C
    :cond_43
    :goto_43
    if-nez v8, :cond_4c

    .line 359
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v9, v4, 0x5

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 362
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_4c
    sub-int v9, v2, v6

    if-lez v9, :cond_53

    .line 363
    invoke-virtual {v8, p0, v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 366
    :cond_53
    move v2, v7

    .line 367
    add-int/lit8 v6, v2, 0x1

    .line 375
    if-ge v7, v4, :cond_1a

    .line 376
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 332
    :cond_5c
    if-eqz v3, :cond_1a

    add-int/lit8 v9, v2, 0x1

    if-lt v9, v4, :cond_1a

    .line 335
    add-int/lit8 v7, v2, 0x1

    goto :goto_43

    .line 389
    .end local v0    # "c":C
    :cond_65
    if-eqz v8, :cond_5

    .line 393
    sub-int v9, v4, v6

    if-lez v9, :cond_6e

    .line 394
    invoke-virtual {v8, p0, v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 397
    :cond_6e
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_5
.end method

.method static unescape([CIILjava/io/Writer;)V
    .registers 13
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x22

    .line 412
    if-nez p0, :cond_5

    .line 528
    :cond_4
    :goto_4
    return-void

    .line 417
    :cond_5
    add-int v4, p1, p2

    .line 419
    .local v4, "max":I
    move v5, p1

    .line 420
    .local v5, "readOffset":I
    move v6, p1

    .line 422
    .local v6, "referenceOffset":I
    const/4 v3, 0x0

    .line 424
    .local v3, "isQuoted":Z
    move v2, p1

    .local v2, "i":I
    :goto_b
    if-ge v2, v4, :cond_53

    .line 426
    aget-char v0, p0, v2

    .line 431
    .local v0, "c":C
    if-le v2, p1, :cond_16

    if-eq v0, v8, :cond_16

    .line 424
    :cond_13
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 439
    :cond_16
    if-ne v0, v8, :cond_13

    .line 441
    if-ne v2, p1, :cond_2a

    .line 445
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_13

    .line 450
    add-int/lit8 v7, v4, -0x1

    aget-char v7, p0, v7

    if-ne v7, v8, :cond_13

    .line 452
    const/4 v3, 0x1

    .line 454
    add-int/lit8 v6, v2, 0x1

    .line 455
    add-int/lit8 v5, v2, 0x1

    .line 456
    goto :goto_13

    .line 464
    :cond_2a
    if-eqz v3, :cond_4a

    add-int/lit8 v7, v2, 0x2

    if-ge v7, v4, :cond_4a

    .line 467
    add-int/lit8 v7, v2, 0x1

    aget-char v1, p0, v7

    .line 468
    .local v1, "c1":C
    if-ne v1, v8, :cond_38

    .line 470
    add-int/lit8 v6, v2, 0x1

    .line 498
    .end local v1    # "c1":C
    :cond_38
    :goto_38
    sub-int v7, v2, v5

    if-lez v7, :cond_41

    .line 499
    sub-int v7, v2, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    .line 502
    :cond_41
    move v2, v6

    .line 503
    add-int/lit8 v5, v2, 0x1

    .line 511
    if-ge v6, v4, :cond_13

    .line 512
    invoke-virtual {p3, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_13

    .line 473
    :cond_4a
    if-eqz v3, :cond_13

    add-int/lit8 v7, v2, 0x1

    if-lt v7, v4, :cond_13

    .line 476
    add-int/lit8 v6, v2, 0x1

    goto :goto_38

    .line 524
    .end local v0    # "c":C
    :cond_53
    sub-int v7, v4, v5

    if-lez v7, :cond_4

    .line 525
    sub-int v7, v4, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    goto :goto_4
.end method
