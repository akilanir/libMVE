.class final Lorg/unbescape/xml/XmlEscapeSymbols;
.super Ljava/lang/Object;
.source "XmlEscapeSymbols.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/unbescape/xml/XmlEscapeSymbols$Reference;,
        Lorg/unbescape/xml/XmlEscapeSymbols$References;
    }
.end annotation


# static fields
.field static final LEVELS_LEN:C = '\u00a1'

.field static final XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

.field static final XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;


# instance fields
.field final CODEPOINT_VALIDATOR:Lorg/unbescape/xml/XmlCodepointValidator;

.field final ESCAPE_LEVELS:[B

.field final SORTED_CERS:[[C

.field final SORTED_CERS_BY_CODEPOINT:[[C

.field final SORTED_CODEPOINTS:[I

.field final SORTED_CODEPOINTS_BY_CER:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 100
    invoke-static {}, Lorg/unbescape/xml/Xml10EscapeSymbolsInitializer;->initializeXml10()Lorg/unbescape/xml/XmlEscapeSymbols;

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML10_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    .line 101
    invoke-static {}, Lorg/unbescape/xml/Xml11EscapeSymbolsInitializer;->initializeXml11()Lorg/unbescape/xml/XmlEscapeSymbols;

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeSymbols;->XML11_SYMBOLS:Lorg/unbescape/xml/XmlEscapeSymbols;

    .line 103
    return-void
.end method

.method constructor <init>(Lorg/unbescape/xml/XmlEscapeSymbols$References;[BLorg/unbescape/xml/XmlCodepointValidator;)V
    .registers 19
    .param p1, "references"    # Lorg/unbescape/xml/XmlEscapeSymbols$References;
    .param p2, "escapeLevels"    # [B
    .param p3, "codepointValidator"    # Lorg/unbescape/xml/XmlCodepointValidator;

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    const/16 v11, 0xa1

    new-array v11, v11, [B

    iput-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    .line 182
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->CODEPOINT_VALIDATOR:Lorg/unbescape/xml/XmlCodepointValidator;

    .line 185
    const/4 v11, 0x0

    iget-object v12, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    const/4 v13, 0x0

    const/16 v14, 0xa1

    move-object/from16 v0, p2

    invoke-static {v0, v11, v12, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    # getter for: Lorg/unbescape/xml/XmlEscapeSymbols$References;->references:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->access$000(Lorg/unbescape/xml/XmlEscapeSymbols$References;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v10

    .line 191
    .local v10, "structureLen":I
    new-instance v2, Ljava/util/ArrayList;

    add-int/lit8 v11, v10, 0x5

    invoke-direct {v2, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 192
    .local v2, "cers":Ljava/util/List;, "Ljava/util/List<[C>;"
    new-instance v5, Ljava/util/ArrayList;

    add-int/lit8 v11, v10, 0x5

    invoke-direct {v5, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 195
    .local v5, "codepoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    # getter for: Lorg/unbescape/xml/XmlEscapeSymbols$References;->references:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lorg/unbescape/xml/XmlEscapeSymbols$References;->access$000(Lorg/unbescape/xml/XmlEscapeSymbols$References;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_36
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_55

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/unbescape/xml/XmlEscapeSymbols$Reference;

    .line 196
    .local v9, "reference":Lorg/unbescape/xml/XmlEscapeSymbols$Reference;
    # getter for: Lorg/unbescape/xml/XmlEscapeSymbols$Reference;->cer:[C
    invoke-static {v9}, Lorg/unbescape/xml/XmlEscapeSymbols$Reference;->access$100(Lorg/unbescape/xml/XmlEscapeSymbols$Reference;)[C

    move-result-object v12

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    # getter for: Lorg/unbescape/xml/XmlEscapeSymbols$Reference;->codepoint:I
    invoke-static {v9}, Lorg/unbescape/xml/XmlEscapeSymbols$Reference;->access$200(Lorg/unbescape/xml/XmlEscapeSymbols$Reference;)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_36

    .line 201
    .end local v9    # "reference":Lorg/unbescape/xml/XmlEscapeSymbols$Reference;
    :cond_55
    new-array v11, v10, [I

    iput-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    .line 202
    new-array v11, v10, [[C

    iput-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS_BY_CODEPOINT:[[C

    .line 203
    new-array v11, v10, [[C

    iput-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS:[[C

    .line 204
    new-array v11, v10, [I

    iput-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS_BY_CER:[I

    .line 206
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 207
    .local v3, "cersOrdered":Ljava/util/List;, "Ljava/util/List<[C>;"
    new-instance v11, Lorg/unbescape/xml/XmlEscapeSymbols$1;

    invoke-direct {v11, p0}, Lorg/unbescape/xml/XmlEscapeSymbols$1;-><init>(Lorg/unbescape/xml/XmlEscapeSymbols;)V

    invoke-static {v3, v11}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 213
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 214
    .local v6, "codepointsOrdered":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 217
    const/4 v7, 0x0

    .local v7, "i":S
    :goto_7b
    if-ge v7, v10, :cond_ac

    .line 219
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 220
    .local v4, "codepoint":I
    iget-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    aput v4, v11, v7

    .line 221
    const/4 v8, 0x0

    .local v8, "j":S
    :goto_8c
    if-ge v8, v10, :cond_a4

    .line 222
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    if-ne v4, v11, :cond_a8

    .line 223
    iget-object v12, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS_BY_CODEPOINT:[[C

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [C

    aput-object v11, v12, v7

    .line 217
    :cond_a4
    add-int/lit8 v11, v7, 0x1

    int-to-short v7, v11

    goto :goto_7b

    .line 221
    :cond_a8
    add-int/lit8 v11, v8, 0x1

    int-to-short v8, v11

    goto :goto_8c

    .line 231
    .end local v4    # "codepoint":I
    .end local v8    # "j":S
    :cond_ac
    const/4 v7, 0x0

    :goto_ad
    if-ge v7, v10, :cond_de

    .line 233
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    .line 234
    .local v1, "cer":[C
    iget-object v11, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS:[[C

    aput-object v1, v11, v7

    .line 235
    const/4 v8, 0x0

    .restart local v8    # "j":S
    :goto_ba
    if-ge v8, v10, :cond_d6

    .line 236
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [C

    invoke-static {v1, v11}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v11

    if-eqz v11, :cond_da

    .line 237
    iget-object v12, p0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS_BY_CER:[I

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    aput v11, v12, v7

    .line 231
    :cond_d6
    add-int/lit8 v11, v7, 0x1

    int-to-short v7, v11

    goto :goto_ad

    .line 235
    :cond_da
    add-int/lit8 v11, v8, 0x1

    int-to-short v8, v11

    goto :goto_ba

    .line 244
    .end local v1    # "cer":[C
    .end local v8    # "j":S
    :cond_de
    return-void
.end method

.method static binarySearch([[CLjava/lang/String;II)I
    .registers 10
    .param p0, "values"    # [[C
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 309
    const/4 v2, 0x0

    .line 310
    .local v2, "low":I
    array-length v5, p0

    add-int/lit8 v1, v5, -0x1

    .line 312
    .local v1, "high":I
    :goto_4
    if-gt v2, v1, :cond_1c

    .line 314
    add-int v5, v2, v1

    ushr-int/lit8 v3, v5, 0x1

    .line 315
    .local v3, "mid":I
    aget-object v4, p0, v3

    .line 317
    .local v4, "midVal":[C
    invoke-static {v4, p1, p2, p3}, Lorg/unbescape/xml/XmlEscapeSymbols;->compare([CLjava/lang/String;II)I

    move-result v0

    .line 319
    .local v0, "cmp":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_16

    .line 320
    add-int/lit8 v2, v3, 0x1

    goto :goto_4

    .line 321
    :cond_16
    const/4 v5, 0x1

    if-ne v0, v5, :cond_1e

    .line 322
    add-int/lit8 v1, v3, -0x1

    goto :goto_4

    .line 330
    .end local v0    # "cmp":I
    .end local v3    # "mid":I
    .end local v4    # "midVal":[C
    :cond_1c
    const/high16 v3, -0x80000000

    :cond_1e
    return v3
.end method

.method static binarySearch([[C[CII)I
    .registers 10
    .param p0, "values"    # [[C
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 337
    const/4 v2, 0x0

    .line 338
    .local v2, "low":I
    array-length v5, p0

    add-int/lit8 v1, v5, -0x1

    .line 340
    .local v1, "high":I
    :goto_4
    if-gt v2, v1, :cond_1c

    .line 342
    add-int v5, v2, v1

    ushr-int/lit8 v3, v5, 0x1

    .line 343
    .local v3, "mid":I
    aget-object v4, p0, v3

    .line 345
    .local v4, "midVal":[C
    invoke-static {v4, p1, p2, p3}, Lorg/unbescape/xml/XmlEscapeSymbols;->compare([C[CII)I

    move-result v0

    .line 347
    .local v0, "cmp":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_16

    .line 348
    add-int/lit8 v2, v3, 0x1

    goto :goto_4

    .line 349
    :cond_16
    const/4 v5, 0x1

    if-ne v0, v5, :cond_1e

    .line 350
    add-int/lit8 v1, v3, -0x1

    goto :goto_4

    .line 358
    .end local v0    # "cmp":I
    .end local v3    # "mid":I
    .end local v4    # "midVal":[C
    :cond_1c
    const/high16 v3, -0x80000000

    :cond_1e
    return v3
.end method

.method private static compare([CLjava/lang/String;II)I
    .registers 11
    .param p0, "cer"    # [C
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 255
    sub-int v3, p3, p2

    .line 256
    .local v3, "textLen":I
    array-length v6, p0

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 259
    .local v1, "maxCommon":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_20

    .line 260
    add-int v6, p2, v0

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 261
    .local v2, "tc":C
    aget-char v6, p0, v0

    if-ge v6, v2, :cond_17

    .line 273
    .end local v2    # "tc":C
    :cond_16
    :goto_16
    return v4

    .line 263
    .restart local v2    # "tc":C
    :cond_17
    aget-char v6, p0, v0

    if-le v6, v2, :cond_1d

    move v4, v5

    .line 264
    goto :goto_16

    .line 259
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 267
    .end local v2    # "tc":C
    :cond_20
    array-length v6, p0

    if-le v6, v0, :cond_25

    move v4, v5

    .line 268
    goto :goto_16

    .line 270
    :cond_25
    if-gt v3, v0, :cond_16

    .line 273
    const/4 v4, 0x0

    goto :goto_16
.end method

.method private static compare([C[CII)I
    .registers 11
    .param p0, "cer"    # [C
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 277
    sub-int v3, p3, p2

    .line 278
    .local v3, "textLen":I
    array-length v6, p0

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 281
    .local v1, "maxCommon":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1e

    .line 282
    add-int v6, p2, v0

    aget-char v2, p1, v6

    .line 283
    .local v2, "tc":C
    aget-char v6, p0, v0

    if-ge v6, v2, :cond_15

    .line 295
    .end local v2    # "tc":C
    :cond_14
    :goto_14
    return v4

    .line 285
    .restart local v2    # "tc":C
    :cond_15
    aget-char v6, p0, v0

    if-le v6, v2, :cond_1b

    move v4, v5

    .line 286
    goto :goto_14

    .line 281
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 289
    .end local v2    # "tc":C
    :cond_1e
    array-length v6, p0

    if-le v6, v0, :cond_23

    move v4, v5

    .line 290
    goto :goto_14

    .line 292
    :cond_23
    if-gt v3, v0, :cond_14

    .line 295
    const/4 v4, 0x0

    goto :goto_14
.end method
