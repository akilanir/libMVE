.class final Lorg/unbescape/properties/PropertiesUnescapeUtil;
.super Ljava/lang/Object;
.source "PropertiesUnescapeUtil.java"


# static fields
.field private static final ESCAPE_PREFIX:C = '\\'

.field private static final ESCAPE_UHEXA_PREFIX2:C = 'u'

.field private static HEXA_CHARS_LOWER:[C

.field private static HEXA_CHARS_UPPER:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 92
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_UPPER:[C

    .line 93
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_LOWER:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    return-void
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 114
    const/4 v4, 0x0

    .line 115
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 116
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 117
    .local v0, "c":C
    const/4 v3, -0x1

    .line 118
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 119
    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 120
    :cond_1b
    move v3, v2

    .line 124
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 118
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 126
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
    .line 130
    const/4 v4, 0x0

    .line 131
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 132
    aget-char v0, p0, v1

    .line 133
    .local v0, "c":C
    const/4 v3, -0x1

    .line 134
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 135
    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/properties/PropertiesUnescapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 136
    :cond_19
    move v3, v2

    .line 140
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 134
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 142
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_24
    return v4
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x5c

    .line 154
    if-nez p0, :cond_6

    .line 155
    const/4 p0, 0x0

    .line 285
    .end local p0    # "text":Ljava/lang/String;
    .local v5, "i":I
    .local v6, "max":I
    .local v7, "offset":I
    .local v8, "readOffset":I
    .local v9, "referenceOffset":I
    .local v10, "strBuilder":Ljava/lang/StringBuilder;
    :cond_5
    :goto_5
    return-object p0

    .line 158
    .end local v5    # "i":I
    .end local v6    # "max":I
    .end local v7    # "offset":I
    .end local v8    # "readOffset":I
    .end local v9    # "referenceOffset":I
    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_6
    const/4 v10, 0x0

    .line 160
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 161
    .restart local v7    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 163
    .restart local v6    # "max":I
    const/4 v8, 0x0

    .line 164
    .restart local v8    # "readOffset":I
    const/4 v9, 0x0

    .line 166
    .restart local v9    # "referenceOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_f
    if-ge v5, v6, :cond_b0

    .line 168
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 174
    .local v0, "c":C
    if-ne v0, v13, :cond_1b

    add-int/lit8 v11, v5, 0x1

    if-lt v11, v6, :cond_1e

    .line 166
    :cond_1b
    :goto_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 178
    :cond_1e
    const/4 v3, -0x1

    .line 180
    .local v3, "codepoint":I
    if-ne v0, v13, :cond_85

    .line 182
    add-int/lit8 v11, v5, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 184
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_c0

    .line 192
    :goto_2a
    const/4 v11, -0x1

    if-ne v3, v11, :cond_85

    .line 194
    const/16 v11, 0x75

    if-ne v1, v11, :cond_a6

    .line 197
    add-int/lit8 v4, v5, 0x2

    .line 198
    .local v4, "f":I
    :goto_33
    add-int/lit8 v11, v5, 0x6

    if-ge v4, v11, :cond_55

    if-ge v4, v6, :cond_55

    .line 199
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 200
    .local v2, "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_45

    const/16 v11, 0x39

    if-le v2, v11, :cond_78

    :cond_45
    const/16 v11, 0x41

    if-lt v2, v11, :cond_4d

    const/16 v11, 0x46

    if-le v2, v11, :cond_78

    :cond_4d
    const/16 v11, 0x61

    if-lt v2, v11, :cond_55

    const/16 v11, 0x66

    if-le v2, v11, :cond_78

    .line 206
    .end local v2    # "cf":C
    :cond_55
    add-int/lit8 v11, v5, 0x2

    sub-int v11, v4, v11

    const/4 v12, 0x4

    if-ge v11, v12, :cond_7b

    .line 209
    add-int/lit8 v5, v5, 0x1

    .line 210
    goto :goto_1b

    .line 185
    .end local v4    # "f":I
    :sswitch_5f
    const/16 v3, 0x9

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 186
    :sswitch_64
    const/16 v3, 0xa

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 187
    :sswitch_69
    const/16 v3, 0xc

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 188
    :sswitch_6e
    const/16 v3, 0xd

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 189
    :sswitch_73
    const/16 v3, 0x5c

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 203
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_78
    add-int/lit8 v4, v4, 0x1

    .line 204
    goto :goto_33

    .line 213
    .end local v2    # "cf":C
    :cond_7b
    add-int/lit8 v11, v5, 0x2

    const/16 v12, 0x10

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/properties/PropertiesUnescapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 216
    add-int/lit8 v9, v4, -0x1

    .line 242
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_85
    :goto_85
    if-nez v10, :cond_8e

    .line 243
    new-instance v10, Ljava/lang/StringBuilder;

    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v6, 0x5

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 246
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_8e
    sub-int v11, v5, v8

    if-lez v11, :cond_95

    .line 247
    invoke-virtual {v10, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 250
    :cond_95
    move v5, v9

    .line 251
    add-int/lit8 v8, v5, 0x1

    .line 261
    const v11, 0xffff

    if-le v3, v11, :cond_aa

    .line 262
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 226
    .restart local v1    # "c1":C
    :cond_a6
    move v3, v1

    .line 227
    add-int/lit8 v9, v5, 0x1

    goto :goto_85

    .line 264
    .end local v1    # "c1":C
    :cond_aa
    int-to-char v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 277
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_b0
    if-eqz v10, :cond_5

    .line 281
    sub-int v11, v6, v8

    if-lez v11, :cond_b9

    .line 282
    invoke-virtual {v10, p0, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 285
    :cond_b9
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_5

    .line 184
    nop

    :sswitch_data_c0
    .sparse-switch
        0x5c -> :sswitch_73
        0x66 -> :sswitch_69
        0x6e -> :sswitch_64
        0x72 -> :sswitch_6e
        0x74 -> :sswitch_5f
    .end sparse-switch
.end method

.method static unescape([CIILjava/io/Writer;)V
    .registers 16
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
    const/16 v11, 0x5c

    .line 300
    if-nez p0, :cond_5

    .line 418
    :cond_4
    :goto_4
    return-void

    .line 304
    :cond_5
    add-int v6, p1, p2

    .line 306
    .local v6, "max":I
    move v7, p1

    .line 307
    .local v7, "readOffset":I
    move v8, p1

    .line 309
    .local v8, "referenceOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_a
    if-ge v5, v6, :cond_9d

    .line 311
    aget-char v0, p0, v5

    .line 317
    .local v0, "c":C
    if-ne v0, v11, :cond_14

    add-int/lit8 v9, v5, 0x1

    if-lt v9, v6, :cond_17

    .line 309
    :cond_14
    :goto_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 321
    :cond_17
    const/4 v3, -0x1

    .line 323
    .local v3, "codepoint":I
    if-ne v0, v11, :cond_7a

    .line 325
    add-int/lit8 v9, v5, 0x1

    aget-char v1, p0, v9

    .line 327
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_a8

    .line 335
    :goto_21
    const/4 v9, -0x1

    if-ne v3, v9, :cond_7a

    .line 337
    const/16 v9, 0x75

    if-ne v1, v9, :cond_93

    .line 340
    add-int/lit8 v4, v5, 0x2

    .line 341
    .local v4, "f":I
    :goto_2a
    add-int/lit8 v9, v5, 0x6

    if-ge v4, v9, :cond_4a

    if-ge v4, v6, :cond_4a

    .line 342
    aget-char v2, p0, v4

    .line 343
    .local v2, "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_3a

    const/16 v9, 0x39

    if-le v2, v9, :cond_6d

    :cond_3a
    const/16 v9, 0x41

    if-lt v2, v9, :cond_42

    const/16 v9, 0x46

    if-le v2, v9, :cond_6d

    :cond_42
    const/16 v9, 0x61

    if-lt v2, v9, :cond_4a

    const/16 v9, 0x66

    if-le v2, v9, :cond_6d

    .line 349
    .end local v2    # "cf":C
    :cond_4a
    add-int/lit8 v9, v5, 0x2

    sub-int v9, v4, v9

    const/4 v10, 0x4

    if-ge v9, v10, :cond_70

    .line 352
    add-int/lit8 v5, v5, 0x1

    .line 353
    goto :goto_14

    .line 328
    .end local v4    # "f":I
    :sswitch_54
    const/16 v3, 0x9

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 329
    :sswitch_59
    const/16 v3, 0xa

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 330
    :sswitch_5e
    const/16 v3, 0xc

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 331
    :sswitch_63
    const/16 v3, 0xd

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 332
    :sswitch_68
    const/16 v3, 0x5c

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 346
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_6d
    add-int/lit8 v4, v4, 0x1

    .line 347
    goto :goto_2a

    .line 356
    .end local v2    # "cf":C
    :cond_70
    add-int/lit8 v9, v5, 0x2

    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/properties/PropertiesUnescapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 359
    add-int/lit8 v8, v4, -0x1

    .line 384
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_7a
    :goto_7a
    sub-int v9, v5, v7

    if-lez v9, :cond_83

    .line 385
    sub-int v9, v5, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    .line 388
    :cond_83
    move v5, v8

    .line 389
    add-int/lit8 v7, v5, 0x1

    .line 399
    const v9, 0xffff

    if-le v3, v9, :cond_97

    .line 400
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_14

    .line 369
    .restart local v1    # "c1":C
    :cond_93
    move v3, v1

    .line 370
    add-int/lit8 v8, v5, 0x1

    goto :goto_7a

    .line 402
    .end local v1    # "c1":C
    :cond_97
    int-to-char v9, v3

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_14

    .line 414
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_9d
    sub-int v9, v6, v7

    if-lez v9, :cond_4

    .line 415
    sub-int v9, v6, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_4

    .line 327
    :sswitch_data_a8
    .sparse-switch
        0x5c -> :sswitch_68
        0x66 -> :sswitch_5e
        0x6e -> :sswitch_59
        0x72 -> :sswitch_63
        0x74 -> :sswitch_54
    .end sparse-switch
.end method
