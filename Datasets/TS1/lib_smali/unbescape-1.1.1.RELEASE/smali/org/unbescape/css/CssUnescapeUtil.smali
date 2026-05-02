.class final Lorg/unbescape/css/CssUnescapeUtil;
.super Ljava/lang/Object;
.source "CssUnescapeUtil.java"


# static fields
.field private static final ESCAPE_PREFIX:C = '\\'

.field private static HEXA_CHARS_LOWER:[C

.field private static HEXA_CHARS_UPPER:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 108
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_UPPER:[C

    .line 109
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_LOWER:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 130
    const/4 v4, 0x0

    .line 131
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 132
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 133
    .local v0, "c":C
    const/4 v3, -0x1

    .line 134
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 135
    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 136
    :cond_1b
    move v3, v2

    .line 140
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 134
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 142
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_26
    return v4
.end method

.method static parseIntFromReference([CIII)I
    .registers 10
    .param p0, "text"    # [C
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 146
    const/4 v4, 0x0

    .line 147
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 148
    aget-char v0, p0, v1

    .line 149
    .local v0, "c":C
    const/4 v3, -0x1

    .line 150
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 151
    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/css/CssUnescapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 152
    :cond_19
    move v3, v2

    .line 156
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 150
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 158
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_24
    return v4
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 170
    if-nez p0, :cond_4

    .line 171
    const/4 p0, 0x0

    .line 337
    .end local p0    # "text":Ljava/lang/String;
    .local v5, "i":I
    .local v6, "max":I
    .local v7, "offset":I
    .local v8, "readOffset":I
    .local v9, "referenceOffset":I
    .local v10, "strBuilder":Ljava/lang/StringBuilder;
    :cond_3
    :goto_3
    return-object p0

    .line 174
    .end local v5    # "i":I
    .end local v6    # "max":I
    .end local v7    # "offset":I
    .end local v8    # "readOffset":I
    .end local v9    # "referenceOffset":I
    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    const/4 v10, 0x0

    .line 176
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 177
    .restart local v7    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 179
    .restart local v6    # "max":I
    const/4 v8, 0x0

    .line 180
    .restart local v8    # "readOffset":I
    const/4 v9, 0x0

    .line 182
    .restart local v9    # "referenceOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_d
    if-ge v5, v6, :cond_c3

    .line 184
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 190
    .local v0, "c":C
    const/16 v11, 0x5c

    if-ne v0, v11, :cond_1b

    add-int/lit8 v11, v5, 0x1

    if-lt v11, v6, :cond_1e

    .line 182
    :cond_1b
    :goto_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 194
    :cond_1e
    const/4 v3, -0x1

    .line 196
    .local v3, "codepoint":I
    const/16 v11, 0x5c

    if-ne v0, v11, :cond_81

    .line 198
    add-int/lit8 v11, v5, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 200
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_d2

    .line 239
    :goto_2c
    const/4 v11, -0x1

    if-ne v3, v11, :cond_81

    .line 241
    const/16 v11, 0x30

    if-lt v1, v11, :cond_37

    const/16 v11, 0x39

    if-le v1, v11, :cond_47

    :cond_37
    const/16 v11, 0x41

    if-lt v1, v11, :cond_3f

    const/16 v11, 0x46

    if-le v1, v11, :cond_47

    :cond_3f
    const/16 v11, 0x61

    if-lt v1, v11, :cond_a9

    const/16 v11, 0x66

    if-gt v1, v11, :cond_a9

    .line 244
    :cond_47
    add-int/lit8 v4, v5, 0x2

    .line 245
    .local v4, "f":I
    :goto_49
    add-int/lit8 v11, v5, 0x7

    if-ge v4, v11, :cond_6b

    if-ge v4, v6, :cond_6b

    .line 246
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 247
    .local v2, "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_5b

    const/16 v11, 0x39

    if-le v2, v11, :cond_a6

    :cond_5b
    const/16 v11, 0x41

    if-lt v2, v11, :cond_63

    const/16 v11, 0x46

    if-le v2, v11, :cond_a6

    :cond_63
    const/16 v11, 0x61

    if-lt v2, v11, :cond_6b

    const/16 v11, 0x66

    if-le v2, v11, :cond_a6

    .line 253
    .end local v2    # "cf":C
    :cond_6b
    add-int/lit8 v11, v5, 0x1

    const/16 v12, 0x10

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/css/CssUnescapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 256
    add-int/lit8 v9, v4, -0x1

    .line 259
    if-ge v4, v6, :cond_81

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x20

    if-ne v11, v12, :cond_81

    .line 260
    add-int/lit8 v9, v9, 0x1

    .line 294
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_81
    :goto_81
    if-nez v10, :cond_8a

    .line 295
    new-instance v10, Ljava/lang/StringBuilder;

    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v6, 0x5

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 298
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_8a
    sub-int v11, v5, v8

    if-lez v11, :cond_91

    .line 299
    invoke-virtual {v10, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 302
    :cond_91
    move v5, v9

    .line 303
    add-int/lit8 v8, v5, 0x1

    .line 313
    const v11, 0xffff

    if-le v3, v11, :cond_bd

    .line 314
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 236
    .restart local v1    # "c1":C
    :sswitch_a2
    move v3, v1

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 250
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_a6
    add-int/lit8 v4, v4, 0x1

    .line 251
    goto :goto_49

    .line 266
    .end local v2    # "cf":C
    .end local v4    # "f":I
    :cond_a9
    const/16 v11, 0xa

    if-eq v1, v11, :cond_b5

    const/16 v11, 0xd

    if-eq v1, v11, :cond_b5

    const/16 v11, 0xc

    if-ne v1, v11, :cond_b9

    .line 270
    :cond_b5
    add-int/lit8 v5, v5, 0x1

    .line 271
    goto/16 :goto_1b

    .line 278
    :cond_b9
    move v3, v1

    .line 279
    add-int/lit8 v9, v5, 0x1

    goto :goto_81

    .line 316
    .end local v1    # "c1":C
    :cond_bd
    int-to-char v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 329
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_c3
    if-eqz v10, :cond_3

    .line 333
    sub-int v11, v6, v8

    if-lez v11, :cond_cc

    .line 334
    invoke-virtual {v10, p0, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 337
    :cond_cc
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3

    .line 200
    :sswitch_data_d2
    .sparse-switch
        0x20 -> :sswitch_a2
        0x21 -> :sswitch_a2
        0x22 -> :sswitch_a2
        0x23 -> :sswitch_a2
        0x24 -> :sswitch_a2
        0x25 -> :sswitch_a2
        0x26 -> :sswitch_a2
        0x27 -> :sswitch_a2
        0x28 -> :sswitch_a2
        0x29 -> :sswitch_a2
        0x2a -> :sswitch_a2
        0x2b -> :sswitch_a2
        0x2c -> :sswitch_a2
        0x2d -> :sswitch_a2
        0x2e -> :sswitch_a2
        0x2f -> :sswitch_a2
        0x3a -> :sswitch_a2
        0x3b -> :sswitch_a2
        0x3c -> :sswitch_a2
        0x3d -> :sswitch_a2
        0x3e -> :sswitch_a2
        0x3f -> :sswitch_a2
        0x40 -> :sswitch_a2
        0x5b -> :sswitch_a2
        0x5c -> :sswitch_a2
        0x5d -> :sswitch_a2
        0x5e -> :sswitch_a2
        0x5f -> :sswitch_a2
        0x60 -> :sswitch_a2
        0x7b -> :sswitch_a2
        0x7c -> :sswitch_a2
        0x7d -> :sswitch_a2
        0x7e -> :sswitch_a2
    .end sparse-switch
.end method

.method static unescape([CIILjava/io/Writer;)V
    .registers 15
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
    .line 352
    if-nez p0, :cond_3

    .line 506
    :cond_2
    :goto_2
    return-void

    .line 356
    :cond_3
    add-int v6, p1, p2

    .line 358
    .local v6, "max":I
    move v7, p1

    .line 359
    .local v7, "readOffset":I
    move v8, p1

    .line 361
    .local v8, "referenceOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_8
    if-ge v5, v6, :cond_ae

    .line 363
    aget-char v0, p0, v5

    .line 369
    .local v0, "c":C
    const/16 v9, 0x5c

    if-ne v0, v9, :cond_14

    add-int/lit8 v9, v5, 0x1

    if-lt v9, v6, :cond_17

    .line 361
    :cond_14
    :goto_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 373
    :cond_17
    const/4 v3, -0x1

    .line 375
    .local v3, "codepoint":I
    const/16 v9, 0x5c

    if-ne v0, v9, :cond_74

    .line 377
    add-int/lit8 v9, v5, 0x1

    aget-char v1, p0, v9

    .line 379
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_ba

    .line 418
    :goto_23
    const/4 v9, -0x1

    if-ne v3, v9, :cond_74

    .line 420
    const/16 v9, 0x30

    if-lt v1, v9, :cond_2e

    const/16 v9, 0x39

    if-le v1, v9, :cond_3e

    :cond_2e
    const/16 v9, 0x41

    if-lt v1, v9, :cond_36

    const/16 v9, 0x46

    if-le v1, v9, :cond_3e

    :cond_36
    const/16 v9, 0x61

    if-lt v1, v9, :cond_94

    const/16 v9, 0x66

    if-gt v1, v9, :cond_94

    .line 423
    :cond_3e
    add-int/lit8 v4, v5, 0x2

    .line 424
    .local v4, "f":I
    :goto_40
    add-int/lit8 v9, v5, 0x7

    if-ge v4, v9, :cond_60

    if-ge v4, v6, :cond_60

    .line 425
    aget-char v2, p0, v4

    .line 426
    .local v2, "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_50

    const/16 v9, 0x39

    if-le v2, v9, :cond_91

    :cond_50
    const/16 v9, 0x41

    if-lt v2, v9, :cond_58

    const/16 v9, 0x46

    if-le v2, v9, :cond_91

    :cond_58
    const/16 v9, 0x61

    if-lt v2, v9, :cond_60

    const/16 v9, 0x66

    if-le v2, v9, :cond_91

    .line 432
    .end local v2    # "cf":C
    :cond_60
    add-int/lit8 v9, v5, 0x1

    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/css/CssUnescapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 435
    add-int/lit8 v8, v4, -0x1

    .line 438
    if-ge v4, v6, :cond_74

    aget-char v9, p0, v4

    const/16 v10, 0x20

    if-ne v9, v10, :cond_74

    .line 439
    add-int/lit8 v8, v8, 0x1

    .line 472
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_74
    :goto_74
    sub-int v9, v5, v7

    if-lez v9, :cond_7d

    .line 473
    sub-int v9, v5, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    .line 476
    :cond_7d
    move v5, v8

    .line 477
    add-int/lit8 v7, v5, 0x1

    .line 487
    const v9, 0xffff

    if-le v3, v9, :cond_a8

    .line 488
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_14

    .line 415
    .restart local v1    # "c1":C
    :sswitch_8d
    move v3, v1

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 429
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_91
    add-int/lit8 v4, v4, 0x1

    .line 430
    goto :goto_40

    .line 445
    .end local v2    # "cf":C
    .end local v4    # "f":I
    :cond_94
    const/16 v9, 0xa

    if-eq v1, v9, :cond_a0

    const/16 v9, 0xd

    if-eq v1, v9, :cond_a0

    const/16 v9, 0xc

    if-ne v1, v9, :cond_a4

    .line 449
    :cond_a0
    add-int/lit8 v5, v5, 0x1

    .line 450
    goto/16 :goto_14

    .line 457
    :cond_a4
    move v3, v1

    .line 458
    add-int/lit8 v8, v5, 0x1

    goto :goto_74

    .line 490
    .end local v1    # "c1":C
    :cond_a8
    int-to-char v9, v3

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_14

    .line 502
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_ae
    sub-int v9, v6, v7

    if-lez v9, :cond_2

    .line 503
    sub-int v9, v6, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2

    .line 379
    nop

    :sswitch_data_ba
    .sparse-switch
        0x20 -> :sswitch_8d
        0x21 -> :sswitch_8d
        0x22 -> :sswitch_8d
        0x23 -> :sswitch_8d
        0x24 -> :sswitch_8d
        0x25 -> :sswitch_8d
        0x26 -> :sswitch_8d
        0x27 -> :sswitch_8d
        0x28 -> :sswitch_8d
        0x29 -> :sswitch_8d
        0x2a -> :sswitch_8d
        0x2b -> :sswitch_8d
        0x2c -> :sswitch_8d
        0x2d -> :sswitch_8d
        0x2e -> :sswitch_8d
        0x2f -> :sswitch_8d
        0x3a -> :sswitch_8d
        0x3b -> :sswitch_8d
        0x3c -> :sswitch_8d
        0x3d -> :sswitch_8d
        0x3e -> :sswitch_8d
        0x3f -> :sswitch_8d
        0x40 -> :sswitch_8d
        0x5b -> :sswitch_8d
        0x5c -> :sswitch_8d
        0x5d -> :sswitch_8d
        0x5e -> :sswitch_8d
        0x5f -> :sswitch_8d
        0x60 -> :sswitch_8d
        0x7b -> :sswitch_8d
        0x7c -> :sswitch_8d
        0x7d -> :sswitch_8d
        0x7e -> :sswitch_8d
    .end sparse-switch
.end method
