.class final Lorg/unbescape/uri/UriEscapeUtil;
.super Ljava/lang/Object;
.source "UriEscapeUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    }
.end annotation


# static fields
.field private static final ESCAPE_PREFIX:C = '%'

.field private static HEXA_CHARS_LOWER:[C

.field private static HEXA_CHARS_UPPER:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 197
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 198
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_LOWER:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 252
    if-nez p0, :cond_4

    .line 253
    const/4 p0, 0x0

    .line 343
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 256
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    const/4 v8, 0x0

    .line 258
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 259
    .local v6, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 261
    .local v5, "max":I
    const/4 v7, 0x0

    .line 263
    .local v7, "readOffset":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_c
    if-ge v4, v5, :cond_7e

    .line 265
    invoke-static {p0, v4}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v2

    .line 271
    .local v2, "codepoint":I
    invoke-static {v2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isAlpha(I)Z

    move-result v9

    if-eqz v9, :cond_1b

    .line 263
    :cond_18
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 278
    :cond_1b
    invoke-virtual {p1, v2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isAllowed(I)Z

    move-result v9

    if-nez v9, :cond_18

    .line 289
    if-nez v8, :cond_2a

    .line 290
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v9, v5, 0x14

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 293
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_2a
    sub-int v9, v4, v7

    if-lez v9, :cond_31

    .line 294
    invoke-virtual {v8, p0, v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 297
    :cond_31
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_3a

    .line 299
    add-int/lit8 v4, v4, 0x1

    .line 302
    :cond_3a
    add-int/lit8 v7, v4, 0x1

    .line 315
    :try_start_3c
    new-instance v9, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v9, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_48
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3c .. :try_end_48} :catch_5e

    move-result-object v1

    .line 319
    .local v1, "charAsBytes":[B
    array-length v10, v1

    const/4 v9, 0x0

    :goto_4b
    if-ge v9, v10, :cond_18

    aget-byte v0, v1, v9

    .line 320
    .local v0, "b":B
    const/16 v11, 0x25

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 321
    invoke-static {v0}, Lorg/unbescape/uri/UriEscapeUtil;->printHexa(B)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 319
    add-int/lit8 v9, v9, 0x1

    goto :goto_4b

    .line 316
    .end local v0    # "b":B
    .end local v1    # "charAsBytes":[B
    :catch_5e
    move-exception v3

    .line 317
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Exception while escaping URI: Bad encoding \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 335
    .end local v2    # "codepoint":I
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_7e
    if-eqz v8, :cond_3

    .line 339
    sub-int v9, v5, v7

    if-lez v9, :cond_87

    .line 340
    invoke-virtual {v8, p0, v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 343
    :cond_87
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V
    .registers 16
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .param p5, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    if-eqz p0, :cond_5

    array-length v7, p0

    if-nez v7, :cond_6

    .line 439
    :cond_5
    :goto_5
    return-void

    .line 363
    :cond_6
    add-int v5, p1, p2

    .line 365
    .local v5, "max":I
    move v6, p1

    .line 367
    .local v6, "readOffset":I
    move v4, p1

    .local v4, "i":I
    :goto_a
    if-ge v4, v5, :cond_75

    .line 369
    invoke-static {p0, v4}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v2

    .line 375
    .local v2, "codepoint":I
    invoke-static {v2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isAlpha(I)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 367
    :cond_16
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 382
    :cond_19
    invoke-virtual {p4, v2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isAllowed(I)Z

    move-result v7

    if-nez v7, :cond_16

    .line 393
    sub-int v7, v4, v6

    if-lez v7, :cond_28

    .line 394
    sub-int v7, v4, v6

    invoke-virtual {p3, p0, v6, v7}, Ljava/io/Writer;->write([CII)V

    .line 397
    :cond_28
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_31

    .line 399
    add-int/lit8 v4, v4, 0x1

    .line 402
    :cond_31
    add-int/lit8 v6, v4, 0x1

    .line 415
    :try_start_33
    new-instance v7, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v7, p5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_3f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_33 .. :try_end_3f} :catch_55

    move-result-object v1

    .line 419
    .local v1, "charAsBytes":[B
    array-length v8, v1

    const/4 v7, 0x0

    :goto_42
    if-ge v7, v8, :cond_16

    aget-byte v0, v1, v7

    .line 420
    .local v0, "b":B
    const/16 v9, 0x25

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 421
    invoke-static {v0}, Lorg/unbescape/uri/UriEscapeUtil;->printHexa(B)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 419
    add-int/lit8 v7, v7, 0x1

    goto :goto_42

    .line 416
    .end local v0    # "b":B
    .end local v1    # "charAsBytes":[B
    :catch_55
    move-exception v3

    .line 417
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception while escaping URI: Bad encoding \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 435
    .end local v2    # "codepoint":I
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_75
    sub-int v7, v5, v6

    if-lez v7, :cond_5

    .line 436
    sub-int v7, v5, v6

    invoke-virtual {p3, p0, v6, v7}, Ljava/io/Writer;->write([CII)V

    goto :goto_5
.end method

.method static parseHexa(CC)B
    .registers 5
    .param p0, "c1"    # C
    .param p1, "c2"    # C

    .prologue
    .line 222
    const/4 v1, 0x0

    .line 223
    .local v1, "result":B
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_2
    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v2, v2

    if-ge v0, v2, :cond_17

    .line 224
    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v2, v2, v0

    if-eq p0, v2, :cond_13

    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v2, v2, v0

    if-ne p0, v2, :cond_2d

    .line 225
    :cond_13
    shl-int/lit8 v2, v0, 0x4

    add-int/2addr v2, v1

    int-to-byte v1, v2

    .line 229
    :cond_17
    const/4 v0, 0x0

    :goto_18
    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v2, v2

    if-ge v0, v2, :cond_2c

    .line 230
    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v2, v2, v0

    if-eq p1, v2, :cond_29

    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v2, v2, v0

    if-ne p1, v2, :cond_30

    .line 231
    :cond_29
    add-int v2, v1, v0

    int-to-byte v1, v2

    .line 235
    :cond_2c
    return v1

    .line 223
    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 229
    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_18
.end method

.method static printHexa(B)[C
    .registers 5
    .param p0, "b"    # B

    .prologue
    .line 213
    const/4 v1, 0x2

    new-array v0, v1, [C

    .line 214
    .local v0, "result":[C
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    shr-int/lit8 v3, p0, 0x4

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 215
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/uri/UriEscapeUtil;->HEXA_CHARS_UPPER:[C

    and-int/lit8 v3, p0, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 216
    return-object v0
.end method

.method static unescape(Ljava/lang/String;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)Ljava/lang/String;
    .registers 18
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 457
    if-nez p0, :cond_4

    .line 458
    const/4 p0, 0x0

    .line 561
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 461
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    const/4 v11, 0x0

    .line 463
    .local v11, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 464
    .local v7, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 466
    .local v6, "max":I
    const/4 v10, 0x0

    .line 468
    .local v10, "readOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_c
    if-ge v5, v6, :cond_ab

    .line 470
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 476
    .local v3, "c":C
    const/16 v12, 0x25

    if-eq v3, v12, :cond_23

    const/16 v12, 0x2b

    if-ne v3, v12, :cond_20

    invoke-virtual/range {p1 .. p1}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->canPlusEscapeWhitespace()Z

    move-result v12

    if-nez v12, :cond_23

    .line 468
    :cond_20
    :goto_20
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 487
    :cond_23
    if-nez v11, :cond_2c

    .line 488
    new-instance v11, Ljava/lang/StringBuilder;

    .end local v11    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v12, v6, 0x5

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 491
    .restart local v11    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_2c
    sub-int v12, v5, v10

    if-lez v12, :cond_33

    .line 492
    invoke-virtual {v11, p0, v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 499
    :cond_33
    const/16 v12, 0x2b

    if-ne v3, v12, :cond_3f

    .line 501
    const/16 v12, 0x20

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 502
    add-int/lit8 v10, v5, 0x1

    .line 503
    goto :goto_20

    .line 517
    :cond_3f
    sub-int v12, v6, v5

    div-int/lit8 v12, v12, 0x3

    new-array v2, v12, [B

    .line 518
    .local v2, "bytes":[B
    move v1, v3

    .line 519
    .local v1, "aheadC":C
    const/4 v8, 0x0

    .local v8, "pos":I
    move v9, v8

    .line 521
    .end local v8    # "pos":I
    .local v9, "pos":I
    :goto_48
    add-int/lit8 v12, v5, 0x2

    if-ge v12, v6, :cond_6e

    const/16 v12, 0x25

    if-ne v1, v12, :cond_6e

    .line 522
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    add-int/lit8 v12, v5, 0x1

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    add-int/lit8 v13, v5, 0x2

    invoke-virtual {p0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    invoke-static {v12, v13}, Lorg/unbescape/uri/UriEscapeUtil;->parseHexa(CC)B

    move-result v12

    aput-byte v12, v2, v9

    .line 523
    add-int/lit8 v5, v5, 0x3

    .line 524
    if-ge v5, v6, :cond_ba

    .line 525
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move v9, v8

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    goto :goto_48

    .line 529
    :cond_6e
    if-ge v5, v6, :cond_7c

    const/16 v12, 0x25

    if-ne v1, v12, :cond_7c

    .line 531
    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "Incomplete escaping sequence in input"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 535
    :cond_7c
    :try_start_7c
    new-instance v12, Ljava/lang/String;

    const/4 v13, 0x0

    move-object/from16 v0, p2

    invoke-direct {v12, v2, v13, v9, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_87
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7c .. :try_end_87} :catch_89

    .line 541
    move v10, v5

    goto :goto_20

    .line 536
    :catch_89
    move-exception v4

    .line 537
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Exception while escaping URI: Bad encoding \'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 553
    .end local v1    # "aheadC":C
    .end local v2    # "bytes":[B
    .end local v3    # "c":C
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v9    # "pos":I
    :cond_ab
    if-eqz v11, :cond_3

    .line 557
    sub-int v12, v6, v10

    if-lez v12, :cond_b4

    .line 558
    invoke-virtual {v11, p0, v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 561
    :cond_b4
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3

    .restart local v1    # "aheadC":C
    .restart local v2    # "bytes":[B
    .restart local v3    # "c":C
    .restart local v8    # "pos":I
    :cond_ba
    move v9, v8

    .end local v8    # "pos":I
    .restart local v9    # "pos":I
    goto :goto_48
.end method

.method static unescape([CIILjava/io/Writer;Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;Ljava/lang/String;)V
    .registers 19
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .param p5, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    if-nez p0, :cond_3

    .line 668
    :cond_2
    :goto_2
    return-void

    .line 581
    :cond_3
    add-int v6, p1, p2

    .line 583
    .local v6, "max":I
    move v9, p1

    .line 585
    .local v9, "readOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_7
    if-ge v5, v6, :cond_9d

    .line 587
    aget-char v3, p0, v5

    .line 593
    .local v3, "c":C
    const/16 v10, 0x25

    if-eq v3, v10, :cond_1c

    const/16 v10, 0x2b

    if-ne v3, v10, :cond_19

    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->canPlusEscapeWhitespace()Z

    move-result v10

    if-nez v10, :cond_1c

    .line 585
    :cond_19
    :goto_19
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 603
    :cond_1c
    sub-int v10, v5, v9

    if-lez v10, :cond_27

    .line 604
    sub-int v10, v5, v9

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v9, v10}, Ljava/io/Writer;->write([CII)V

    .line 611
    :cond_27
    const/16 v10, 0x2b

    if-ne v3, v10, :cond_35

    .line 613
    const/16 v10, 0x20

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/io/Writer;->write(I)V

    .line 614
    add-int/lit8 v9, v5, 0x1

    .line 615
    goto :goto_19

    .line 628
    :cond_35
    sub-int v10, v6, v5

    div-int/lit8 v10, v10, 0x3

    new-array v2, v10, [B

    .line 629
    .local v2, "bytes":[B
    move v1, v3

    .line 630
    .local v1, "aheadC":C
    const/4 v7, 0x0

    .local v7, "pos":I
    move v8, v7

    .line 632
    .end local v7    # "pos":I
    .local v8, "pos":I
    :goto_3e
    add-int/lit8 v10, v5, 0x2

    if-ge v10, v6, :cond_5e

    const/16 v10, 0x25

    if-ne v1, v10, :cond_5e

    .line 633
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "pos":I
    .restart local v7    # "pos":I
    add-int/lit8 v10, v5, 0x1

    aget-char v10, p0, v10

    add-int/lit8 v11, v5, 0x2

    aget-char v11, p0, v11

    invoke-static {v10, v11}, Lorg/unbescape/uri/UriEscapeUtil;->parseHexa(CC)B

    move-result v10

    aput-byte v10, v2, v8

    .line 634
    add-int/lit8 v5, v5, 0x3

    .line 635
    if-ge v5, v6, :cond_aa

    .line 636
    aget-char v1, p0, v5

    move v8, v7

    .end local v7    # "pos":I
    .restart local v8    # "pos":I
    goto :goto_3e

    .line 640
    :cond_5e
    if-ge v5, v6, :cond_6c

    const/16 v10, 0x25

    if-ne v1, v10, :cond_6c

    .line 642
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "Incomplete escaping sequence in input"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 646
    :cond_6c
    :try_start_6c
    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    move-object/from16 v0, p5

    invoke-direct {v10, v2, v11, v8, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_79
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_6c .. :try_end_79} :catch_7b

    .line 652
    move v9, v5

    goto :goto_19

    .line 647
    :catch_7b
    move-exception v4

    .line 648
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Exception while escaping URI: Bad encoding \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p5

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 664
    .end local v1    # "aheadC":C
    .end local v2    # "bytes":[B
    .end local v3    # "c":C
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v8    # "pos":I
    :cond_9d
    sub-int v10, v6, v9

    if-lez v10, :cond_2

    .line 665
    sub-int v10, v6, v9

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v9, v10}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2

    .restart local v1    # "aheadC":C
    .restart local v2    # "bytes":[B
    .restart local v3    # "c":C
    .restart local v7    # "pos":I
    :cond_aa
    move v8, v7

    .end local v7    # "pos":I
    .restart local v8    # "pos":I
    goto :goto_3e
.end method
