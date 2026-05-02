.class public Lorg/mozilla/javascript/Decompiler;
.super Ljava/lang/Object;
.source "Decompiler.java"


# static fields
.field public static final CASE_GAP_PROP:I = 0x3

.field private static final FUNCTION_END:I = 0xa5

.field public static final INDENT_GAP_PROP:I = 0x2

.field public static final INITIAL_INDENT_PROP:I = 0x1

.field public static final ONLY_BODY_FLAG:I = 0x1

.field public static final TO_SOURCE_FLAG:I = 0x2

.field private static final printSource:Z


# instance fields
.field private sourceBuffer:[C

.field private sourceTop:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 885
    const/16 v0, 0x80

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    return-void
.end method

.method private append(C)V
    .registers 4
    .param p1, "c"    # C

    .prologue
    .line 214
    iget v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    iget-object v1, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    array-length v1, v1

    if-ne v0, v1, :cond_e

    .line 215
    iget v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->increaseSourceCapacity(I)V

    .line 217
    :cond_e
    iget-object v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v1, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    aput-char p1, v0, v1

    .line 218
    iget v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    .line 219
    return-void
.end method

.method private appendString(Ljava/lang/String;)V
    .registers 9
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const v6, 0x8000

    .line 191
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 192
    .local v0, "L":I
    const/4 v1, 0x1

    .line 193
    .local v1, "lengthEncodingSize":I
    if-lt v0, v6, :cond_b

    .line 194
    const/4 v1, 0x2

    .line 196
    :cond_b
    iget v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    add-int/2addr v3, v1

    add-int v2, v3, v0

    .line 197
    .local v2, "nextTop":I
    iget-object v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    array-length v3, v3

    if-le v2, v3, :cond_18

    .line 198
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->increaseSourceCapacity(I)V

    .line 200
    :cond_18
    if-lt v0, v6, :cond_2a

    .line 203
    iget-object v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v4, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    ushr-int/lit8 v5, v0, 0x10

    or-int/2addr v5, v6

    int-to-char v5, v5

    aput-char v5, v3, v4

    .line 204
    iget v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    .line 206
    :cond_2a
    iget-object v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v4, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    int-to-char v5, v0

    aput-char v5, v3, v4

    .line 207
    iget v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    .line 208
    const/4 v3, 0x0

    iget-object v4, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v5, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    invoke-virtual {p1, v3, v0, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 209
    iput v2, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    .line 210
    return-void
.end method

.method public static decompile(Ljava/lang/String;ILorg/mozilla/javascript/UintMap;)Ljava/lang/String;
    .registers 26
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "flags"    # I
    .param p2, "properties"    # Lorg/mozilla/javascript/UintMap;

    .prologue
    .line 259
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v13

    .line 260
    .local v13, "length":I
    if-nez v13, :cond_9

    const-string v20, ""

    .line 813
    :goto_8
    return-object v20

    .line 262
    :cond_9
    const/16 v20, 0x1

    const/16 v21, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v9

    .line 263
    .local v9, "indent":I
    if-gez v9, :cond_1f

    new-instance v20, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v20 .. v20}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v20

    .line 264
    :cond_1f
    const/16 v20, 0x2

    const/16 v21, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v10

    .line 265
    .local v10, "indentGap":I
    if-gez v10, :cond_35

    new-instance v20, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v20 .. v20}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v20

    .line 266
    :cond_35
    const/16 v20, 0x3

    const/16 v21, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/UintMap;->getInt(II)I

    move-result v7

    .line 267
    .local v7, "caseGap":I
    if-gez v7, :cond_4b

    new-instance v20, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v20 .. v20}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v20

    .line 269
    :cond_4b
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .local v17, "result":Ljava/lang/StringBuilder;
    and-int/lit8 v20, p1, 0x1

    if-eqz v20, :cond_8a

    const/4 v12, 0x1

    .line 271
    .local v12, "justFunctionBody":Z
    :goto_55
    and-int/lit8 v20, p1, 0x2

    if-eqz v20, :cond_8c

    const/16 v18, 0x1

    .line 300
    .local v18, "toSource":Z
    :goto_5b
    const/4 v6, 0x0

    .line 301
    .local v6, "braceNesting":I
    const/4 v4, 0x0

    .line 302
    .local v4, "afterFirstEOL":Z
    const/4 v8, 0x0

    .line 304
    .local v8, "i":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x88

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_8f

    .line 305
    add-int/lit8 v8, v8, 0x1

    .line 306
    const/16 v19, -0x1

    .line 311
    .local v19, "topFunctionType":I
    :goto_70
    if-nez v18, :cond_9a

    .line 313
    const/16 v20, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_7c
    if-ge v11, v9, :cond_ab

    .line 315
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    add-int/lit8 v11, v11, 0x1

    goto :goto_7c

    .line 270
    .end local v4    # "afterFirstEOL":Z
    .end local v6    # "braceNesting":I
    .end local v8    # "i":I
    .end local v11    # "j":I
    .end local v12    # "justFunctionBody":Z
    .end local v18    # "toSource":Z
    .end local v19    # "topFunctionType":I
    :cond_8a
    const/4 v12, 0x0

    goto :goto_55

    .line 271
    .restart local v12    # "justFunctionBody":Z
    :cond_8c
    const/16 v18, 0x0

    goto :goto_5b

    .line 308
    .restart local v4    # "afterFirstEOL":Z
    .restart local v6    # "braceNesting":I
    .restart local v8    # "i":I
    .restart local v18    # "toSource":Z
    :cond_8f
    const/16 v20, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v19

    .restart local v19    # "topFunctionType":I
    goto :goto_70

    .line 317
    :cond_9a
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_ab

    .line 318
    const/16 v20, 0x28

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 322
    :cond_ab
    :goto_ab
    if-ge v8, v13, :cond_641

    .line 323
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v20

    packed-switch v20, :pswitch_data_666

    .line 797
    :pswitch_b6
    new-instance v20, Ljava/lang/RuntimeException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Token: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v22

    invoke-static/range {v22 .. v22}, Lorg/mozilla/javascript/Token;->name(I)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 327
    :pswitch_d9
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x97

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_107

    .line 328
    const-string v20, "get "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    :cond_f0
    :goto_f0
    add-int/lit8 v8, v8, 0x1

    .line 333
    add-int/lit8 v20, v8, 0x1

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v8

    .line 335
    add-int/lit8 v8, v8, 0x1

    .line 800
    :cond_104
    :goto_104
    :pswitch_104
    add-int/lit8 v8, v8, 0x1

    goto :goto_ab

    .line 329
    :cond_107
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x98

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_f0

    .line 330
    const-string v20, "set "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f0

    .line 340
    :pswitch_11f
    add-int/lit8 v20, v8, 0x1

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v8

    .line 341
    goto/16 :goto_ab

    .line 344
    :pswitch_131
    add-int/lit8 v20, v8, 0x1

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v17

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v8

    .line 345
    goto/16 :goto_ab

    .line 348
    :pswitch_143
    add-int/lit8 v20, v8, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Decompiler;->printSourceNumber(Ljava/lang/String;ILjava/lang/StringBuilder;)I

    move-result v8

    .line 349
    goto/16 :goto_ab

    .line 352
    :pswitch_151
    const-string v20, "true"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_104

    .line 356
    :pswitch_15b
    const-string v20, "false"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_104

    .line 360
    :pswitch_165
    const-string v20, "null"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_104

    .line 364
    :pswitch_16f
    const-string v20, "this"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_104

    .line 368
    :pswitch_179
    add-int/lit8 v8, v8, 0x1

    .line 369
    const-string v20, "function "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_104

    .line 377
    :pswitch_185
    const-string v20, ", "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 381
    :pswitch_190
    add-int/lit8 v6, v6, 0x1

    .line 382
    const/16 v20, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1a1

    .line 383
    add-int/2addr v9, v10

    .line 384
    :cond_1a1
    const/16 v20, 0x7b

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 388
    :pswitch_1ac
    add-int/lit8 v6, v6, -0x1

    .line 393
    if-eqz v12, :cond_1b2

    if-eqz v6, :cond_104

    .line 396
    :cond_1b2
    const/16 v20, 0x7d

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 397
    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v20

    sparse-switch v20, :sswitch_data_7b4

    goto/16 :goto_104

    .line 400
    :sswitch_1c6
    sub-int/2addr v9, v10

    .line 401
    goto/16 :goto_104

    .line 404
    :sswitch_1c9
    sub-int/2addr v9, v10

    .line 405
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 411
    :pswitch_1d5
    const/16 v20, 0x28

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 415
    :pswitch_1e0
    const/16 v20, 0x29

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 416
    const/16 v20, 0x55

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_104

    .line 417
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 421
    :pswitch_202
    const/16 v20, 0x5b

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 425
    :pswitch_20d
    const/16 v20, 0x5d

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 429
    :pswitch_218
    if-nez v18, :cond_104

    .line 430
    const/4 v15, 0x1

    .line 431
    .local v15, "newLine":Z
    if-nez v4, :cond_22b

    .line 432
    const/4 v4, 0x1

    .line 433
    if-eqz v12, :cond_22b

    .line 437
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 438
    sub-int/2addr v9, v10

    .line 439
    const/4 v15, 0x0

    .line 442
    :cond_22b
    if-eqz v15, :cond_236

    .line 443
    const/16 v20, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 450
    :cond_236
    add-int/lit8 v20, v8, 0x1

    move/from16 v0, v20

    if-ge v0, v13, :cond_104

    .line 451
    const/4 v14, 0x0

    .line 452
    .local v14, "less":I
    add-int/lit8 v20, v8, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v16

    .line 453
    .local v16, "nextToken":I
    const/16 v20, 0x73

    move/from16 v0, v16

    move/from16 v1, v20

    if-eq v0, v1, :cond_257

    const/16 v20, 0x74

    move/from16 v0, v16

    move/from16 v1, v20

    if-ne v0, v1, :cond_267

    .line 456
    :cond_257
    sub-int v14, v10, v7

    .line 470
    :cond_259
    :goto_259
    if-ge v14, v9, :cond_104

    .line 471
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 470
    add-int/lit8 v14, v14, 0x1

    goto :goto_259

    .line 457
    :cond_267
    const/16 v20, 0x56

    move/from16 v0, v16

    move/from16 v1, v20

    if-ne v0, v1, :cond_271

    .line 458
    move v14, v10

    goto :goto_259

    .line 464
    :cond_271
    const/16 v20, 0x27

    move/from16 v0, v16

    move/from16 v1, v20

    if-ne v0, v1, :cond_259

    .line 465
    add-int/lit8 v20, v8, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Decompiler;->getSourceStringEnd(Ljava/lang/String;I)I

    move-result v5

    .line 466
    .local v5, "afterName":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x67

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_259

    .line 467
    move v14, v10

    goto :goto_259

    .line 476
    .end local v5    # "afterName":I
    .end local v14    # "less":I
    .end local v15    # "newLine":Z
    .end local v16    # "nextToken":I
    :pswitch_293
    const/16 v20, 0x2e

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 480
    :pswitch_29e
    const-string v20, "new "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 484
    :pswitch_2a9
    const-string v20, "delete "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 488
    :pswitch_2b4
    const-string v20, "if "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 492
    :pswitch_2bf
    const-string v20, "else "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 496
    :pswitch_2ca
    const-string v20, "for "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 500
    :pswitch_2d5
    const-string v20, " in "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 504
    :pswitch_2e0
    const-string v20, "with "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 508
    :pswitch_2eb
    const-string v20, "while "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 512
    :pswitch_2f6
    const-string v20, "do "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 516
    :pswitch_301
    const-string v20, "try "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 520
    :pswitch_30c
    const-string v20, "catch "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 524
    :pswitch_317
    const-string v20, "finally "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 528
    :pswitch_322
    const-string v20, "throw "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 532
    :pswitch_32d
    const-string v20, "switch "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 536
    :pswitch_338
    const-string v20, "break"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    const/16 v20, 0x27

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_104

    .line 538
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 542
    :pswitch_35a
    const-string v20, "continue"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 543
    const/16 v20, 0x27

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_104

    .line 544
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 548
    :pswitch_37c
    const-string v20, "case "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 552
    :pswitch_387
    const-string v20, "default"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 556
    :pswitch_392
    const-string v20, "return"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    const/16 v20, 0x52

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_104

    .line 558
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 562
    :pswitch_3b4
    const-string v20, "var "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 566
    :pswitch_3bf
    const-string v20, "let "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 570
    :pswitch_3ca
    const/16 v20, 0x3b

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 571
    const/16 v20, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_104

    .line 573
    const/16 v20, 0x20

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 578
    :pswitch_3ec
    const-string v20, " = "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 582
    :pswitch_3f7
    const-string v20, " += "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 586
    :pswitch_402
    const-string v20, " -= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 590
    :pswitch_40d
    const-string v20, " *= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 594
    :pswitch_418
    const-string v20, " /= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 598
    :pswitch_423
    const-string v20, " %= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 602
    :pswitch_42e
    const-string v20, " |= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 606
    :pswitch_439
    const-string v20, " ^= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 610
    :pswitch_444
    const-string v20, " &= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 614
    :pswitch_44f
    const-string v20, " <<= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 618
    :pswitch_45a
    const-string v20, " >>= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 622
    :pswitch_465
    const-string v20, " >>>= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 626
    :pswitch_470
    const-string v20, " ? "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 635
    :pswitch_47b
    const-string v20, ": "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 639
    :pswitch_486
    const/16 v20, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13, v8}, Lorg/mozilla/javascript/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_49f

    .line 641
    const/16 v20, 0x3a

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 644
    :cond_49f
    const-string v20, " : "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 648
    :pswitch_4aa
    const-string v20, " || "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 652
    :pswitch_4b5
    const-string v20, " && "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 656
    :pswitch_4c0
    const-string v20, " | "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 660
    :pswitch_4cb
    const-string v20, " ^ "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 664
    :pswitch_4d6
    const-string v20, " & "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 668
    :pswitch_4e1
    const-string v20, " === "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 672
    :pswitch_4ec
    const-string v20, " !== "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 676
    :pswitch_4f7
    const-string v20, " == "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 680
    :pswitch_502
    const-string v20, " != "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 684
    :pswitch_50d
    const-string v20, " <= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 688
    :pswitch_518
    const-string v20, " < "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 692
    :pswitch_523
    const-string v20, " >= "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 696
    :pswitch_52e
    const-string v20, " > "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 700
    :pswitch_539
    const-string v20, " instanceof "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 704
    :pswitch_544
    const-string v20, " << "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 708
    :pswitch_54f
    const-string v20, " >> "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 712
    :pswitch_55a
    const-string v20, " >>> "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 716
    :pswitch_565
    const-string v20, "typeof "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 720
    :pswitch_570
    const-string v20, "void "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 724
    :pswitch_57b
    const-string v20, "const "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 728
    :pswitch_586
    const-string v20, "yield "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 732
    :pswitch_591
    const/16 v20, 0x21

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 736
    :pswitch_59c
    const/16 v20, 0x7e

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 740
    :pswitch_5a7
    const/16 v20, 0x2b

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 744
    :pswitch_5b2
    const/16 v20, 0x2d

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 748
    :pswitch_5bd
    const-string v20, "++"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 752
    :pswitch_5c8
    const-string v20, "--"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 756
    :pswitch_5d3
    const-string v20, " + "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 760
    :pswitch_5de
    const-string v20, " - "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 764
    :pswitch_5e9
    const-string v20, " * "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 768
    :pswitch_5f4
    const-string v20, " / "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 772
    :pswitch_5ff
    const-string v20, " % "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 776
    :pswitch_60a
    const-string v20, "::"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 780
    :pswitch_615
    const-string v20, ".."

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 784
    :pswitch_620
    const-string v20, ".("

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 788
    :pswitch_62b
    const/16 v20, 0x40

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 792
    :pswitch_636
    const-string v20, "debugger;\n"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_104

    .line 803
    :cond_641
    if-nez v18, :cond_654

    .line 805
    if-nez v12, :cond_64e

    .line 806
    const/16 v20, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 813
    :cond_64e
    :goto_64e
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    goto/16 :goto_8

    .line 808
    :cond_654
    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_64e

    .line 809
    const/16 v20, 0x29

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_64e

    .line 323
    :pswitch_data_666
    .packed-switch 0x1
        :pswitch_218
        :pswitch_b6
        :pswitch_b6
        :pswitch_392
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_4c0
        :pswitch_4cb
        :pswitch_4d6
        :pswitch_4f7
        :pswitch_502
        :pswitch_518
        :pswitch_50d
        :pswitch_52e
        :pswitch_523
        :pswitch_544
        :pswitch_54f
        :pswitch_55a
        :pswitch_5d3
        :pswitch_5de
        :pswitch_5e9
        :pswitch_5f4
        :pswitch_5ff
        :pswitch_591
        :pswitch_59c
        :pswitch_5a7
        :pswitch_5b2
        :pswitch_29e
        :pswitch_2a9
        :pswitch_565
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_11f
        :pswitch_143
        :pswitch_131
        :pswitch_165
        :pswitch_16f
        :pswitch_15b
        :pswitch_151
        :pswitch_4e1
        :pswitch_4ec
        :pswitch_11f
        :pswitch_b6
        :pswitch_322
        :pswitch_b6
        :pswitch_2d5
        :pswitch_539
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_47b
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_586
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_301
        :pswitch_3ca
        :pswitch_202
        :pswitch_20d
        :pswitch_190
        :pswitch_1ac
        :pswitch_1d5
        :pswitch_1e0
        :pswitch_185
        :pswitch_3ec
        :pswitch_42e
        :pswitch_439
        :pswitch_444
        :pswitch_44f
        :pswitch_45a
        :pswitch_465
        :pswitch_3f7
        :pswitch_402
        :pswitch_40d
        :pswitch_418
        :pswitch_423
        :pswitch_470
        :pswitch_486
        :pswitch_4aa
        :pswitch_4b5
        :pswitch_5bd
        :pswitch_5c8
        :pswitch_293
        :pswitch_179
        :pswitch_b6
        :pswitch_b6
        :pswitch_2b4
        :pswitch_2bf
        :pswitch_32d
        :pswitch_37c
        :pswitch_387
        :pswitch_2eb
        :pswitch_2f6
        :pswitch_2ca
        :pswitch_338
        :pswitch_35a
        :pswitch_3b4
        :pswitch_2e0
        :pswitch_30c
        :pswitch_317
        :pswitch_570
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_615
        :pswitch_60a
        :pswitch_b6
        :pswitch_620
        :pswitch_62b
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_d9
        :pswitch_d9
        :pswitch_3bf
        :pswitch_57b
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_b6
        :pswitch_636
        :pswitch_b6
        :pswitch_b6
        :pswitch_d9
        :pswitch_b6
        :pswitch_104
    .end packed-switch

    .line 397
    :sswitch_data_7b4
    .sparse-switch
        0x1 -> :sswitch_1c6
        0x71 -> :sswitch_1c9
        0x75 -> :sswitch_1c9
        0xa5 -> :sswitch_1c6
    .end sparse-switch
.end method

.method private static getNext(Ljava/lang/String;II)I
    .registers 4
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "length"    # I
    .param p2, "i"    # I

    .prologue
    .line 818
    add-int/lit8 v0, p2, 0x1

    if-ge v0, p1, :cond_b

    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static getSourceStringEnd(Ljava/lang/String;I)I
    .registers 4
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 823
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v0

    return v0
.end method

.method private increaseSourceCapacity(I)V
    .registers 7
    .param p1, "minimalCapacity"    # I

    .prologue
    const/4 v4, 0x0

    .line 224
    iget-object v2, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    array-length v2, v2

    if-gt p1, v2, :cond_9

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 225
    :cond_9
    iget-object v2, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    array-length v2, v2

    mul-int/lit8 v0, v2, 0x2

    .line 226
    .local v0, "newCapacity":I
    if-ge v0, p1, :cond_11

    .line 227
    move v0, p1

    .line 229
    :cond_11
    new-array v1, v0, [C

    .line 230
    .local v1, "tmp":[C
    iget-object v2, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v3, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    iput-object v1, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    .line 232
    return-void
.end method

.method private static printSourceNumber(Ljava/lang/String;ILjava/lang/StringBuilder;)I
    .registers 13
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v9, 0x4a

    .line 852
    const-wide/16 v3, 0x0

    .line 853
    .local v3, "number":D
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 854
    .local v5, "type":C
    add-int/lit8 p1, p1, 0x1

    .line 855
    const/16 v6, 0x53

    if-ne v5, v6, :cond_23

    .line 856
    if-eqz p2, :cond_15

    .line 857
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 858
    .local v0, "ival":I
    int-to-double v3, v0

    .line 860
    .end local v0    # "ival":I
    :cond_15
    add-int/lit8 p1, p1, 0x1

    .line 879
    :goto_17
    if-eqz p2, :cond_22

    .line 880
    const/16 v6, 0xa

    invoke-static {v3, v4, v6}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 882
    :cond_22
    return p1

    .line 861
    :cond_23
    if-eq v5, v9, :cond_29

    const/16 v6, 0x44

    if-ne v5, v6, :cond_5d

    .line 862
    :cond_29
    if-eqz p2, :cond_55

    .line 864
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    const/16 v8, 0x30

    shl-long v1, v6, v8

    .line 865
    .local v1, "lbits":J
    add-int/lit8 v6, p1, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    const/16 v8, 0x20

    shl-long/2addr v6, v8

    or-long/2addr v1, v6

    .line 866
    add-int/lit8 v6, p1, 0x2

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    const/16 v8, 0x10

    shl-long/2addr v6, v8

    or-long/2addr v1, v6

    .line 867
    add-int/lit8 v6, p1, 0x3

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    or-long/2addr v1, v6

    .line 868
    if-ne v5, v9, :cond_58

    .line 869
    long-to-double v3, v1

    .line 874
    .end local v1    # "lbits":J
    :cond_55
    :goto_55
    add-int/lit8 p1, p1, 0x4

    goto :goto_17

    .line 871
    .restart local v1    # "lbits":J
    :cond_58
    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v3

    goto :goto_55

    .line 877
    .end local v1    # "lbits":J
    :cond_5d
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6}, Ljava/lang/RuntimeException;-><init>()V

    throw v6
.end method

.method private static printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I
    .registers 9
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "asQuotedString"    # Z
    .param p3, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v4, 0x22

    .line 830
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 831
    .local v0, "length":I
    add-int/lit8 p1, p1, 0x1

    .line 832
    const v2, 0x8000

    and-int/2addr v2, v0

    if-eqz v2, :cond_1a

    .line 833
    and-int/lit16 v2, v0, 0x7fff

    shl-int/lit8 v2, v2, 0x10

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    or-int v0, v2, v3

    .line 834
    add-int/lit8 p1, p1, 0x1

    .line 836
    :cond_1a
    if-eqz p3, :cond_27

    .line 837
    add-int v2, p1, v0

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 838
    .local v1, "str":Ljava/lang/String;
    if-nez p2, :cond_2a

    .line 839
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 846
    .end local v1    # "str":Ljava/lang/String;
    :cond_27
    :goto_27
    add-int v2, p1, v0

    return v2

    .line 841
    .restart local v1    # "str":Ljava/lang/String;
    :cond_2a
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 842
    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 843
    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_27
.end method

.method private sourceToString(I)Ljava/lang/String;
    .registers 5
    .param p1, "offset"    # I

    .prologue
    .line 236
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    if-ge v0, p1, :cond_9

    :cond_6
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 237
    :cond_9
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/mozilla/javascript/Decompiler;->sourceBuffer:[C

    iget v2, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method


# virtual methods
.method addEOL(I)V
    .registers 3
    .param p1, "token"    # I

    .prologue
    .line 111
    if-ltz p1, :cond_6

    const/16 v0, 0xa4

    if-le p1, v0, :cond_c

    .line 112
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 114
    :cond_c
    int-to-char v0, p1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 115
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 116
    return-void
.end method

.method addName(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 120
    const/16 v0, 0x27

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Decompiler;->addToken(I)V

    .line 121
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Decompiler;->appendString(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method addNumber(D)V
    .registers 10
    .param p1, "n"    # D

    .prologue
    const/16 v6, 0x30

    const/16 v5, 0x20

    const/16 v4, 0x10

    .line 138
    const/16 v2, 0x28

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Decompiler;->addToken(I)V

    .line 157
    double-to-long v0, p1

    .line 158
    .local v0, "lbits":J
    long-to-double v2, v0

    cmpl-double v2, v2, p1

    if-eqz v2, :cond_35

    .line 161
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 162
    const/16 v2, 0x44

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 163
    shr-long v2, v0, v6

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 164
    shr-long v2, v0, v5

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 165
    shr-long v2, v0, v4

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 166
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 187
    :goto_34
    return-void

    .line 171
    :cond_35
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_3e

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 175
    :cond_3e
    const-wide/32 v2, 0xffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_50

    .line 176
    const/16 v2, 0x53

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 177
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    goto :goto_34

    .line 180
    :cond_50
    const/16 v2, 0x4a

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 181
    shr-long v2, v0, v6

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 182
    shr-long v2, v0, v5

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 183
    shr-long v2, v0, v4

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 184
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    goto :goto_34
.end method

.method addRegexp(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "regexp"    # Ljava/lang/String;
    .param p2, "flags"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x2f

    .line 132
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Decompiler;->addToken(I)V

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->appendString(Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method addString(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 126
    const/16 v0, 0x29

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Decompiler;->addToken(I)V

    .line 127
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Decompiler;->appendString(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method addToken(I)V
    .registers 3
    .param p1, "token"    # I

    .prologue
    .line 103
    if-ltz p1, :cond_6

    const/16 v0, 0xa4

    if-le p1, v0, :cond_c

    .line 104
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 106
    :cond_c
    int-to-char v0, p1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 107
    return-void
.end method

.method getCurrentOffset()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lorg/mozilla/javascript/Decompiler;->sourceTop:I

    return v0
.end method

.method getEncodedSource()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/Decompiler;->sourceToString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method markFunctionEnd(I)I
    .registers 4
    .param p1, "functionStart"    # I

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/mozilla/javascript/Decompiler;->getCurrentOffset()I

    move-result v0

    .line 97
    .local v0, "offset":I
    const/16 v1, 0xa5

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 98
    return v0
.end method

.method markFunctionStart(I)I
    .registers 4
    .param p1, "functionType"    # I

    .prologue
    .line 88
    invoke-virtual {p0}, Lorg/mozilla/javascript/Decompiler;->getCurrentOffset()I

    move-result v0

    .line 89
    .local v0, "savedOffset":I
    const/16 v1, 0x6d

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/Decompiler;->addToken(I)V

    .line 90
    int-to-char v1, p1

    invoke-direct {p0, v1}, Lorg/mozilla/javascript/Decompiler;->append(C)V

    .line 91
    return v0
.end method
