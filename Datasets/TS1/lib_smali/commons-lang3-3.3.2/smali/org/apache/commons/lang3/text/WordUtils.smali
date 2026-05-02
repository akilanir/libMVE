.class public Lorg/apache/commons/lang3/text/WordUtils;
.super Ljava/lang/Object;
.source "WordUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 252
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->capitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs capitalize(Ljava/lang/String;[C)Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # [C

    .prologue
    .line 285
    if-nez p1, :cond_c

    const/4 v3, -0x1

    .line 286
    .local v3, "delimLen":I
    :goto_3
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_b

    if-nez v3, :cond_e

    .line 300
    .end local p0    # "str":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object p0

    .line 285
    .end local v3    # "delimLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_c
    array-length v3, p1

    goto :goto_3

    .line 289
    .restart local v3    # "delimLen":I
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 290
    .local v0, "buffer":[C
    const/4 v1, 0x1

    .line 291
    .local v1, "capitalizeNext":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_14
    array-length v5, v0

    if-ge v4, v5, :cond_2d

    .line 292
    aget-char v2, v0, v4

    .line 293
    .local v2, "ch":C
    invoke-static {v2, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 294
    const/4 v1, 0x1

    .line 291
    :cond_20
    :goto_20
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 295
    :cond_23
    if-eqz v1, :cond_20

    .line 296
    invoke-static {v2}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v5

    aput-char v5, v0, v4

    .line 297
    const/4 v1, 0x0

    goto :goto_20

    .line 300
    .end local v2    # "ch":C
    :cond_2d
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_b
.end method

.method public static capitalizeFully(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 324
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->capitalizeFully(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs capitalizeFully(Ljava/lang/String;[C)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # [C

    .prologue
    .line 354
    if-nez p1, :cond_c

    const/4 v0, -0x1

    .line 355
    .local v0, "delimLen":I
    :goto_3
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    if-nez v0, :cond_e

    .line 359
    .end local p0    # "str":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object p0

    .line 354
    .end local v0    # "delimLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_c
    array-length v0, p1

    goto :goto_3

    .line 358
    .restart local v0    # "delimLen":I
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 359
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/text/WordUtils;->capitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    goto :goto_b
.end method

.method public static initials(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 505
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->initials(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs initials(Ljava/lang/String;[C)Ljava/lang/String;
    .registers 10
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # [C

    .prologue
    .line 536
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 558
    .end local p0    # "str":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 539
    .restart local p0    # "str":Ljava/lang/String;
    :cond_7
    if-eqz p1, :cond_f

    array-length v7, p1

    if-nez v7, :cond_f

    .line 540
    const-string p0, ""

    goto :goto_6

    .line 542
    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 543
    .local v6, "strLen":I
    div-int/lit8 v7, v6, 0x2

    add-int/lit8 v7, v7, 0x1

    new-array v0, v7, [C

    .line 544
    .local v0, "buf":[C
    const/4 v2, 0x0

    .line 545
    .local v2, "count":I
    const/4 v5, 0x1

    .line 546
    .local v5, "lastWasGap":Z
    const/4 v4, 0x0

    .local v4, "i":I
    move v3, v2

    .end local v2    # "count":I
    .local v3, "count":I
    :goto_1d
    if-ge v4, v6, :cond_37

    .line 547
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 549
    .local v1, "ch":C
    invoke-static {v1, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v7

    if-eqz v7, :cond_2f

    .line 550
    const/4 v5, 0x1

    move v2, v3

    .line 546
    .end local v3    # "count":I
    .restart local v2    # "count":I
    :goto_2b
    add-int/lit8 v4, v4, 0x1

    move v3, v2

    .end local v2    # "count":I
    .restart local v3    # "count":I
    goto :goto_1d

    .line 551
    :cond_2f
    if-eqz v5, :cond_3e

    .line 552
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "count":I
    .restart local v2    # "count":I
    aput-char v1, v0, v3

    .line 553
    const/4 v5, 0x0

    goto :goto_2b

    .line 558
    .end local v1    # "ch":C
    .end local v2    # "count":I
    .restart local v3    # "count":I
    :cond_37
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-direct {p0, v0, v7, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_6

    .restart local v1    # "ch":C
    .restart local p0    # "str":Ljava/lang/String;
    :cond_3e
    move v2, v3

    .end local v3    # "count":I
    .restart local v2    # "count":I
    goto :goto_2b
.end method

.method private static isDelimiter(C[C)Z
    .registers 7
    .param p0, "ch"    # C
    .param p1, "delimiters"    # [C

    .prologue
    .line 570
    if-nez p1, :cond_7

    .line 571
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    .line 578
    :goto_6
    return v4

    .line 573
    :cond_7
    move-object v0, p1

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_15

    aget-char v1, v0, v2

    .line 574
    .local v1, "delimiter":C
    if-ne p0, v1, :cond_12

    .line 575
    const/4 v4, 0x1

    goto :goto_6

    .line 573
    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 578
    .end local v1    # "delimiter":C
    :cond_15
    const/4 v4, 0x0

    goto :goto_6
.end method

.method public static swapCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 452
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 478
    .end local p0    # "str":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 455
    .restart local p0    # "str":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 457
    .local v0, "buffer":[C
    const/4 v3, 0x1

    .line 459
    .local v3, "whitespace":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    array-length v4, v0

    if-ge v2, v4, :cond_4c

    .line 460
    aget-char v1, v0, v2

    .line 461
    .local v1, "ch":C
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 462
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    aput-char v4, v0, v2

    .line 463
    const/4 v3, 0x0

    .line 459
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 464
    :cond_22
    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 465
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    aput-char v4, v0, v2

    .line 466
    const/4 v3, 0x0

    goto :goto_1f

    .line 467
    :cond_30
    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v4

    if-eqz v4, :cond_47

    .line 468
    if-eqz v3, :cond_40

    .line 469
    invoke-static {v1}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v4

    aput-char v4, v0, v2

    .line 470
    const/4 v3, 0x0

    goto :goto_1f

    .line 472
    :cond_40
    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    aput-char v4, v0, v2

    goto :goto_1f

    .line 475
    :cond_47
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    goto :goto_1f

    .line 478
    .end local v1    # "ch":C
    :cond_4c
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_6
.end method

.method public static uncapitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 381
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->uncapitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs uncapitalize(Ljava/lang/String;[C)Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiters"    # [C

    .prologue
    .line 410
    if-nez p1, :cond_c

    const/4 v2, -0x1

    .line 411
    .local v2, "delimLen":I
    :goto_3
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_b

    if-nez v2, :cond_e

    .line 425
    .end local p0    # "str":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object p0

    .line 410
    .end local v2    # "delimLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_c
    array-length v2, p1

    goto :goto_3

    .line 414
    .restart local v2    # "delimLen":I
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 415
    .local v0, "buffer":[C
    const/4 v4, 0x1

    .line 416
    .local v4, "uncapitalizeNext":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_14
    array-length v5, v0

    if-ge v3, v5, :cond_2d

    .line 417
    aget-char v1, v0, v3

    .line 418
    .local v1, "ch":C
    invoke-static {v1, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 419
    const/4 v4, 0x1

    .line 416
    :cond_20
    :goto_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 420
    :cond_23
    if-eqz v4, :cond_20

    .line 421
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v5

    aput-char v5, v0, v3

    .line 422
    const/4 v4, 0x0

    goto :goto_20

    .line 425
    .end local v1    # "ch":C
    :cond_2d
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_b
.end method

.method public static wrap(Ljava/lang/String;I)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "wrapLength"    # I

    .prologue
    .line 97
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/text/WordUtils;->wrap(Ljava/lang/String;ILjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static wrap(Ljava/lang/String;ILjava/lang/String;Z)Ljava/lang/String;
    .registers 10
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "wrapLength"    # I
    .param p2, "newLineStr"    # Ljava/lang/String;
    .param p3, "wrapLongWords"    # Z

    .prologue
    const/16 v5, 0x20

    .line 173
    if-nez p0, :cond_6

    .line 174
    const/4 v4, 0x0

    .line 224
    :goto_5
    return-object v4

    .line 176
    :cond_6
    if-nez p2, :cond_a

    .line 177
    sget-object p2, Lorg/apache/commons/lang3/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 179
    :cond_a
    const/4 v4, 0x1

    if-ge p1, v4, :cond_e

    .line 180
    const/4 p1, 0x1

    .line 182
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 183
    .local v0, "inputLineLength":I
    const/4 v1, 0x0

    .line 184
    .local v1, "offset":I
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v0, 0x20

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 186
    .local v3, "wrappedLine":Ljava/lang/StringBuilder;
    :goto_1a
    sub-int v4, v0, v1

    if-le v4, p1, :cond_6a

    .line 187
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_27

    .line 188
    add-int/lit8 v1, v1, 0x1

    .line 189
    goto :goto_1a

    .line 191
    :cond_27
    add-int v4, p1, v1

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v2

    .line 193
    .local v2, "spaceToWrapAt":I
    if-lt v2, v1, :cond_3c

    .line 195
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    add-int/lit8 v1, v2, 0x1

    goto :goto_1a

    .line 201
    :cond_3c
    if-eqz p3, :cond_4c

    .line 203
    add-int v4, p1, v1

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    add-int/2addr v1, p1

    goto :goto_1a

    .line 208
    :cond_4c
    add-int v4, p1, v1

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 209
    if-ltz v2, :cond_61

    .line 210
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    add-int/lit8 v1, v2, 0x1

    goto :goto_1a

    .line 214
    :cond_61
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    move v1, v0

    goto :goto_1a

    .line 222
    .end local v2    # "spaceToWrapAt":I
    :cond_6a
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5
.end method
