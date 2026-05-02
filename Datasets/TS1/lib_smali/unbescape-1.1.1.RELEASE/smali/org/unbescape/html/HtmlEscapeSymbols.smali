.class final Lorg/unbescape/html/HtmlEscapeSymbols;
.super Ljava/lang/Object;
.source "HtmlEscapeSymbols.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/unbescape/html/HtmlEscapeSymbols$Reference;,
        Lorg/unbescape/html/HtmlEscapeSymbols$References;
    }
.end annotation


# static fields
.field static final HTML4_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

.field static final HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

.field static final MAX_ASCII_CHAR:C = '\u007f'

.field static final NCRS_BY_CODEPOINT_LEN:I = 0x2fff

.field static final NO_NCR:S


# instance fields
.field final DOUBLE_CODEPOINTS:[[I

.field final ESCAPE_LEVELS:[B

.field final NCRS_BY_CODEPOINT:[S

.field final NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation
.end field

.field final SORTED_CODEPOINTS:[I

.field final SORTED_NCRS:[[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 182
    invoke-static {}, Lorg/unbescape/html/Html4EscapeSymbolsInitializer;->initializeHtml4()Lorg/unbescape/html/HtmlEscapeSymbols;

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML4_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 183
    invoke-static {}, Lorg/unbescape/html/Html5EscapeSymbolsInitializer;->initializeHtml5()Lorg/unbescape/html/HtmlEscapeSymbols;

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 185
    return-void
.end method

.method constructor <init>(Lorg/unbescape/html/HtmlEscapeSymbols$References;[B)V
    .registers 27
    .param p1, "references"    # Lorg/unbescape/html/HtmlEscapeSymbols$References;
    .param p2, "escapeLevels"    # [B

    .prologue
    .line 197
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const/16 v20, 0x2fff

    move/from16 v0, v20

    new-array v0, v0, [S

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    .line 123
    const/16 v20, 0x81

    move/from16 v0, v20

    new-array v0, v0, [B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    .line 200
    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x81

    move-object/from16 v0, p2

    move/from16 v1, v20

    move-object/from16 v2, v21

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    new-instance v11, Ljava/util/ArrayList;

    # getter for: Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->access$000(Lorg/unbescape/html/HtmlEscapeSymbols$References;)Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    add-int/lit8 v20, v20, 0x5

    move/from16 v0, v20

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 205
    .local v11, "ncrs":Ljava/util/List;, "Ljava/util/List<[C>;"
    new-instance v5, Ljava/util/ArrayList;

    # getter for: Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->access$000(Lorg/unbescape/html/HtmlEscapeSymbols$References;)Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    add-int/lit8 v20, v20, 0x5

    move/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 206
    .local v5, "codepoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v7, Ljava/util/ArrayList;

    const/16 v20, 0x64

    move/from16 v0, v20

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 207
    .local v7, "doubleCodepoints":Ljava/util/List;, "Ljava/util/List<[I>;"
    new-instance v12, Ljava/util/HashMap;

    const/16 v20, 0x14

    move/from16 v0, v20

    invoke-direct {v12, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 210
    .local v12, "ncrsByCodepointOverflow":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Short;>;"
    # getter for: Lorg/unbescape/html/HtmlEscapeSymbols$References;->references:Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeSymbols$References;->access$000(Lorg/unbescape/html/HtmlEscapeSymbols$References;)Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_74
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_fb

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;

    .line 212
    .local v16, "reference":Lorg/unbescape/html/HtmlEscapeSymbols$Reference;
    # getter for: Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->ncr:[C
    invoke-static/range {v16 .. v16}, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->access$100(Lorg/unbescape/html/HtmlEscapeSymbols$Reference;)[C

    move-result-object v19

    .line 213
    .local v19, "referenceNcr":[C
    # getter for: Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->codepoints:[I
    invoke-static/range {v16 .. v16}, Lorg/unbescape/html/HtmlEscapeSymbols$Reference;->access$200(Lorg/unbescape/html/HtmlEscapeSymbols$Reference;)[I

    move-result-object v18

    .line 215
    .local v18, "referenceCodepoints":[I
    move-object/from16 v0, v19

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_a8

    .line 220
    const/16 v21, 0x0

    aget v17, v18, v21

    .line 221
    .local v17, "referenceCodepoint":I
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_74

    .line 223
    .end local v17    # "referenceCodepoint":I
    :cond_a8
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    const/16 v22, 0x2

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_ca

    .line 227
    move-object/from16 v0, v18

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v21

    mul-int/lit8 v21, v21, -0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_74

    .line 233
    :cond_ca
    new-instance v20, Ljava/lang/RuntimeException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unsupported codepoints #: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " for "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    new-instance v22, Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 242
    .end local v16    # "reference":Lorg/unbescape/html/HtmlEscapeSymbols$Reference;
    .end local v18    # "referenceCodepoints":[I
    .end local v19    # "referenceNcr":[C
    :cond_fb
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Ljava/util/Arrays;->fill([SS)V

    .line 248
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    .line 249
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    .line 251
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 252
    .local v13, "ncrsOrdered":Ljava/util/List;, "Ljava/util/List<[C>;"
    new-instance v20, Lorg/unbescape/html/HtmlEscapeSymbols$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/unbescape/html/HtmlEscapeSymbols$1;-><init>(Lorg/unbescape/html/HtmlEscapeSymbols;)V

    move-object/from16 v0, v20

    invoke-static {v13, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 258
    const/4 v8, 0x0

    .local v8, "i":S
    :goto_13a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_1e3

    .line 260
    invoke-interface {v13, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [C

    .line 261
    .local v10, "ncr":[C
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    aput-object v10, v20, v8

    .line 263
    const/4 v9, 0x0

    .local v9, "j":S
    :goto_158
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v9, v0, :cond_1a1

    .line 265
    invoke-interface {v11, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [C

    move-object/from16 v0, v20

    invoke-static {v10, v0}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v20

    if-eqz v20, :cond_1dc

    .line 267
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 268
    .local v6, "cp":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    move-object/from16 v20, v0

    aput v6, v20, v8

    .line 270
    if-lez v6, :cond_1a1

    .line 272
    const/16 v20, 0x2fff

    move/from16 v0, v20

    if-ge v6, v0, :cond_1cc

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    move-object/from16 v20, v0

    aget-short v20, v20, v6

    if-nez v20, :cond_1a7

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    move-object/from16 v20, v0

    aput-short v8, v20, v6

    .line 258
    .end local v6    # "cp":I
    :cond_1a1
    :goto_1a1
    add-int/lit8 v20, v8, 0x1

    move/from16 v0, v20

    int-to-short v8, v0

    goto :goto_13a

    .line 278
    .restart local v6    # "cp":I
    :cond_1a7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    move-object/from16 v21, v0

    aget-short v21, v21, v6

    aget-object v20, v20, v21

    move-object/from16 v0, v20

    invoke-static {v11, v0}, Lorg/unbescape/html/HtmlEscapeSymbols;->positionInList(Ljava/util/List;[C)I

    move-result v14

    .line 279
    .local v14, "positionOfCurrent":I
    invoke-static {v11, v10}, Lorg/unbescape/html/HtmlEscapeSymbols;->positionInList(Ljava/util/List;[C)I

    move-result v15

    .line 280
    .local v15, "positionOfNew":I
    if-ge v15, v14, :cond_1a1

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    move-object/from16 v20, v0

    aput-short v8, v20, v6

    goto :goto_1a1

    .line 289
    .end local v14    # "positionOfCurrent":I
    .end local v15    # "positionOfNew":I
    :cond_1cc
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a1

    .line 263
    .end local v6    # "cp":I
    :cond_1dc
    add-int/lit8 v20, v9, 0x1

    move/from16 v0, v20

    int-to-short v9, v0

    goto/16 :goto_158

    .line 303
    .end local v9    # "j":S
    .end local v10    # "ncr":[C
    :cond_1e3
    invoke-interface {v12}, Ljava/util/Map;->size()I

    move-result v20

    if-lez v20, :cond_224

    .line 304
    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    .line 311
    :goto_1ed
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v20

    if-lez v20, :cond_22d

    .line 312
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v0, v0, [[I

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    .line 313
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_204
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_237

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    move-object/from16 v21, v0

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [I

    aput-object v20, v21, v8

    .line 313
    add-int/lit8 v8, v8, 0x1

    goto :goto_204

    .line 306
    .local v8, "i":S
    :cond_224
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    goto :goto_1ed

    .line 317
    :cond_22d
    const/16 v20, 0x0

    check-cast v20, [[I

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    .line 320
    .end local v8    # "i":S
    :cond_237
    return-void
.end method

.method static binarySearch([[CLjava/lang/String;II)I
    .registers 13
    .param p0, "values"    # [[C
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/high16 v7, -0x80000000

    .line 416
    const/4 v2, 0x0

    .line 417
    .local v2, "low":I
    array-length v8, p0

    add-int/lit8 v1, v8, -0x1

    .line 419
    .local v1, "high":I
    const/high16 v5, -0x80000000

    .line 420
    .local v5, "partialIndex":I
    const/high16 v6, -0x80000000

    .line 422
    .local v6, "partialValue":I
    :cond_a
    :goto_a
    if-gt v2, v1, :cond_2f

    .line 424
    add-int v8, v2, v1

    ushr-int/lit8 v3, v8, 0x1

    .line 425
    .local v3, "mid":I
    aget-object v4, p0, v3

    .line 427
    .local v4, "midVal":[C
    invoke-static {v4, p1, p2, p3}, Lorg/unbescape/html/HtmlEscapeSymbols;->compare([CLjava/lang/String;II)I

    move-result v0

    .line 429
    .local v0, "cmp":I
    const/4 v8, -0x1

    if-ne v0, v8, :cond_1c

    .line 430
    add-int/lit8 v2, v3, 0x1

    goto :goto_a

    .line 431
    :cond_1c
    const/4 v8, 0x1

    if-ne v0, v8, :cond_22

    .line 432
    add-int/lit8 v1, v3, -0x1

    goto :goto_a

    .line 433
    :cond_22
    const/16 v8, -0xa

    if-ge v0, v8, :cond_35

    .line 435
    add-int/lit8 v2, v3, 0x1

    .line 436
    if-eq v5, v7, :cond_2c

    if-ge v6, v0, :cond_a

    .line 437
    :cond_2c
    move v5, v3

    .line 438
    move v6, v0

    goto :goto_a

    .line 447
    .end local v0    # "cmp":I
    .end local v3    # "mid":I
    .end local v4    # "midVal":[C
    :cond_2f
    if-eq v5, v7, :cond_36

    .line 449
    add-int/lit8 v7, v5, 0xa

    mul-int/lit8 v3, v7, -0x1

    .line 452
    :cond_35
    :goto_35
    return v3

    :cond_36
    move v3, v7

    goto :goto_35
.end method

.method static binarySearch([[C[CII)I
    .registers 13
    .param p0, "values"    # [[C
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/high16 v7, -0x80000000

    .line 459
    const/4 v2, 0x0

    .line 460
    .local v2, "low":I
    array-length v8, p0

    add-int/lit8 v1, v8, -0x1

    .line 462
    .local v1, "high":I
    const/high16 v5, -0x80000000

    .line 463
    .local v5, "partialIndex":I
    const/high16 v6, -0x80000000

    .line 465
    .local v6, "partialValue":I
    :cond_a
    :goto_a
    if-gt v2, v1, :cond_2f

    .line 467
    add-int v8, v2, v1

    ushr-int/lit8 v3, v8, 0x1

    .line 468
    .local v3, "mid":I
    aget-object v4, p0, v3

    .line 470
    .local v4, "midVal":[C
    invoke-static {v4, p1, p2, p3}, Lorg/unbescape/html/HtmlEscapeSymbols;->compare([C[CII)I

    move-result v0

    .line 472
    .local v0, "cmp":I
    const/4 v8, -0x1

    if-ne v0, v8, :cond_1c

    .line 473
    add-int/lit8 v2, v3, 0x1

    goto :goto_a

    .line 474
    :cond_1c
    const/4 v8, 0x1

    if-ne v0, v8, :cond_22

    .line 475
    add-int/lit8 v1, v3, -0x1

    goto :goto_a

    .line 476
    :cond_22
    const/16 v8, -0xa

    if-ge v0, v8, :cond_35

    .line 478
    add-int/lit8 v2, v3, 0x1

    .line 479
    if-eq v5, v7, :cond_2c

    if-ge v6, v0, :cond_a

    .line 480
    :cond_2c
    move v5, v3

    .line 481
    move v6, v0

    goto :goto_a

    .line 490
    .end local v0    # "cmp":I
    .end local v3    # "mid":I
    .end local v4    # "midVal":[C
    :cond_2f
    if-eq v5, v7, :cond_36

    .line 492
    add-int/lit8 v7, v5, 0xa

    mul-int/lit8 v3, v7, -0x1

    .line 495
    :cond_35
    :goto_35
    return v3

    :cond_36
    move v3, v7

    goto :goto_35
.end method

.method private static compare([CLjava/lang/String;II)I
    .registers 10
    .param p0, "ncr"    # [C
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v4, 0x1

    .line 357
    sub-int v3, p3, p2

    .line 358
    .local v3, "textLen":I
    array-length v5, p0

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 361
    .local v1, "maxCommon":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_1e

    .line 362
    add-int v5, p2, v0

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 363
    .local v2, "tc":C
    aget-char v5, p0, v0

    if-ge v5, v2, :cond_17

    .line 364
    const/4 v4, -0x1

    .line 376
    .end local v2    # "tc":C
    :cond_16
    :goto_16
    return v4

    .line 365
    .restart local v2    # "tc":C
    :cond_17
    aget-char v5, p0, v0

    if-gt v5, v2, :cond_16

    .line 361
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 369
    .end local v2    # "tc":C
    :cond_1e
    array-length v5, p0

    if-gt v5, v0, :cond_16

    .line 372
    if-le v3, v0, :cond_29

    .line 374
    sub-int v4, v3, v0

    add-int/lit8 v4, v4, 0xa

    neg-int v4, v4

    goto :goto_16

    .line 376
    :cond_29
    const/4 v4, 0x0

    goto :goto_16
.end method

.method private static compare([C[CII)I
    .registers 10
    .param p0, "ncr"    # [C
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v4, 0x1

    .line 380
    sub-int v3, p3, p2

    .line 381
    .local v3, "textLen":I
    array-length v5, p0

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 384
    .local v1, "maxCommon":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_1c

    .line 385
    add-int v5, p2, v0

    aget-char v2, p1, v5

    .line 386
    .local v2, "tc":C
    aget-char v5, p0, v0

    if-ge v5, v2, :cond_15

    .line 387
    const/4 v4, -0x1

    .line 399
    .end local v2    # "tc":C
    :cond_14
    :goto_14
    return v4

    .line 388
    .restart local v2    # "tc":C
    :cond_15
    aget-char v5, p0, v0

    if-gt v5, v2, :cond_14

    .line 384
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 392
    .end local v2    # "tc":C
    :cond_1c
    array-length v5, p0

    if-gt v5, v0, :cond_14

    .line 395
    if-le v3, v0, :cond_27

    .line 397
    sub-int v4, v3, v0

    add-int/lit8 v4, v4, 0xa

    neg-int v4, v4

    goto :goto_14

    .line 399
    :cond_27
    const/4 v4, 0x0

    goto :goto_14
.end method

.method private static positionInList(Ljava/util/List;[C)I
    .registers 6
    .param p1, "element"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[C>;[C)I"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<[C>;"
    const/4 v1, 0x0

    .line 331
    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    .line 332
    .local v0, "e":[C
    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 337
    .end local v0    # "e":[C
    .end local v1    # "i":I
    :goto_17
    return v1

    .line 335
    .restart local v0    # "e":[C
    .restart local v1    # "i":I
    :cond_18
    add-int/lit8 v1, v1, 0x1

    .line 336
    goto :goto_5

    .line 337
    .end local v0    # "e":[C
    :cond_1b
    const/4 v1, -0x1

    goto :goto_17
.end method
