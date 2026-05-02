.class public Lorg/apache/commons/io/FilenameUtils;
.super Ljava/lang/Object;
.source "FilenameUtils.java"


# static fields
.field private static final EXTENSION_SEPARATOR:C = '.'

.field private static final OTHER_SEPARATOR:C

.field private static final SYSTEM_SEPARATOR:C

.field private static final UNIX_SEPARATOR:C = '/'

.field private static final WINDOWS_SEPARATOR:C = '\\'


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 113
    sget-char v0, Ljava/io/File;->separatorChar:C

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    .line 120
    invoke-static {}, Lorg/apache/commons/io/FilenameUtils;->isSystemWindows()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 121
    const/16 v0, 0x2f

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    .line 125
    :goto_e
    return-void

    .line 123
    :cond_f
    const/16 v0, 0x5c

    sput-char v0, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    goto :goto_e
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    return-void
.end method

.method public static concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "basePath"    # Ljava/lang/String;
    .param p1, "fullFilenameToAdd"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 387
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v2

    .line 388
    .local v2, "prefix":I
    if-gez v2, :cond_8

    .line 405
    :cond_7
    :goto_7
    return-object v3

    .line 391
    :cond_8
    if-lez v2, :cond_f

    .line 392
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 394
    :cond_f
    if-eqz p0, :cond_7

    .line 397
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 398
    .local v1, "len":I
    if-nez v1, :cond_1c

    .line 399
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 401
    :cond_1c
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 402
    .local v0, "ch":C
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 403
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7

    .line 405
    :cond_3e
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7
.end method

.method private static doGetFullPath(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "includeSeparator"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 768
    if-nez p0, :cond_6

    move-object p0, v3

    .line 787
    .end local p0    # "filename":Ljava/lang/String;
    :cond_5
    :goto_5
    return-object p0

    .line 771
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_6
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v2

    .line 772
    .local v2, "prefix":I
    if-gez v2, :cond_e

    move-object p0, v3

    .line 773
    goto :goto_5

    .line 775
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_1b

    .line 776
    if-eqz p1, :cond_5

    .line 777
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_5

    .line 782
    :cond_1b
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfLastSeparator(Ljava/lang/String;)I

    move-result v1

    .line 783
    .local v1, "index":I
    if-gez v1, :cond_26

    .line 784
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_5

    .line 786
    :cond_26
    if-eqz p1, :cond_30

    const/4 v3, 0x1

    :goto_29
    add-int v0, v1, v3

    .line 787
    .local v0, "end":I
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_5

    .end local v0    # "end":I
    :cond_30
    move v3, v4

    .line 786
    goto :goto_29
.end method

.method private static doGetPath(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "separatorAdd"    # I

    .prologue
    const/4 v2, 0x0

    .line 687
    if-nez p0, :cond_4

    .line 698
    :cond_3
    :goto_3
    return-object v2

    .line 690
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v1

    .line 691
    .local v1, "prefix":I
    if-ltz v1, :cond_3

    .line 694
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfLastSeparator(Ljava/lang/String;)I

    move-result v0

    .line 695
    .local v0, "index":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_16

    if-gez v0, :cond_19

    .line 696
    :cond_16
    const-string v2, ""

    goto :goto_3

    .line 698
    :cond_19
    add-int v2, v0, p1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method private static doNormalize(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 15
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "keepSeparator"    # Z

    .prologue
    const/4 v7, 0x0

    const/16 v12, 0x2e

    const/4 v11, 0x0

    .line 254
    if-nez p0, :cond_8

    move-object p0, v7

    .line 342
    .end local p0    # "filename":Ljava/lang/String;
    :cond_7
    :goto_7
    return-object p0

    .line 257
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 258
    .local v5, "size":I
    if-eqz v5, :cond_7

    .line 261
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v4

    .line 262
    .local v4, "prefix":I
    if-gez v4, :cond_16

    move-object p0, v7

    .line 263
    goto :goto_7

    .line 266
    :cond_16
    add-int/lit8 v8, v5, 0x2

    new-array v0, v8, [C

    .line 267
    .local v0, "array":[C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p0, v11, v8, v0, v11}, Ljava/lang/String;->getChars(II[CI)V

    .line 270
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    array-length v8, v0

    if-ge v1, v8, :cond_32

    .line 271
    aget-char v8, v0, v1

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->OTHER_SEPARATOR:C

    if-ne v8, v9, :cond_2f

    .line 272
    sget-char v8, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    aput-char v8, v0, v1

    .line 270
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 277
    :cond_32
    const/4 v3, 0x1

    .line 278
    .local v3, "lastIsDirectory":Z
    add-int/lit8 v8, v5, -0x1

    aget-char v8, v0, v8

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-eq v8, v9, :cond_43

    .line 279
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "size":I
    .local v6, "size":I
    sget-char v8, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    aput-char v8, v0, v5

    .line 280
    const/4 v3, 0x0

    move v5, v6

    .line 284
    .end local v6    # "size":I
    .restart local v5    # "size":I
    :cond_43
    add-int/lit8 v1, v4, 0x1

    :goto_45
    if-ge v1, v5, :cond_63

    .line 285
    aget-char v8, v0, v1

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_60

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_60

    .line 286
    add-int/lit8 v8, v1, -0x1

    sub-int v9, v5, v1

    invoke-static {v0, v1, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 287
    add-int/lit8 v5, v5, -0x1

    .line 288
    add-int/lit8 v1, v1, -0x1

    .line 284
    :cond_60
    add-int/lit8 v1, v1, 0x1

    goto :goto_45

    .line 293
    :cond_63
    add-int/lit8 v1, v4, 0x1

    :goto_65
    if-ge v1, v5, :cond_94

    .line 294
    aget-char v8, v0, v1

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_91

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    if-ne v8, v12, :cond_91

    add-int/lit8 v8, v4, 0x1

    if-eq v1, v8, :cond_7f

    add-int/lit8 v8, v1, -0x2

    aget-char v8, v0, v8

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_91

    .line 296
    :cond_7f
    add-int/lit8 v8, v5, -0x1

    if-ne v1, v8, :cond_84

    .line 297
    const/4 v3, 0x1

    .line 299
    :cond_84
    add-int/lit8 v8, v1, 0x1

    add-int/lit8 v9, v1, -0x1

    sub-int v10, v5, v1

    invoke-static {v0, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    add-int/lit8 v5, v5, -0x2

    .line 301
    add-int/lit8 v1, v1, -0x1

    .line 293
    :cond_91
    add-int/lit8 v1, v1, 0x1

    goto :goto_65

    .line 307
    :cond_94
    add-int/lit8 v1, v4, 0x2

    :goto_96
    if-ge v1, v5, :cond_ee

    .line 308
    aget-char v8, v0, v1

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_da

    add-int/lit8 v8, v1, -0x1

    aget-char v8, v0, v8

    if-ne v8, v12, :cond_da

    add-int/lit8 v8, v1, -0x2

    aget-char v8, v0, v8

    if-ne v8, v12, :cond_da

    add-int/lit8 v8, v4, 0x2

    if-eq v1, v8, :cond_b6

    add-int/lit8 v8, v1, -0x3

    aget-char v8, v0, v8

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_da

    .line 310
    :cond_b6
    add-int/lit8 v8, v4, 0x2

    if-ne v1, v8, :cond_bd

    move-object p0, v7

    .line 311
    goto/16 :goto_7

    .line 313
    :cond_bd
    add-int/lit8 v8, v5, -0x1

    if-ne v1, v8, :cond_c2

    .line 314
    const/4 v3, 0x1

    .line 317
    :cond_c2
    add-int/lit8 v2, v1, -0x4

    .local v2, "j":I
    :goto_c4
    if-lt v2, v4, :cond_e0

    .line 318
    aget-char v8, v0, v2

    sget-char v9, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    if-ne v8, v9, :cond_dd

    .line 320
    add-int/lit8 v8, v1, 0x1

    add-int/lit8 v9, v2, 0x1

    sub-int v10, v5, v1

    invoke-static {v0, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 321
    sub-int v8, v1, v2

    sub-int/2addr v5, v8

    .line 322
    add-int/lit8 v1, v2, 0x1

    .line 307
    .end local v2    # "j":I
    :cond_da
    :goto_da
    add-int/lit8 v1, v1, 0x1

    goto :goto_96

    .line 317
    .restart local v2    # "j":I
    :cond_dd
    add-int/lit8 v2, v2, -0x1

    goto :goto_c4

    .line 327
    :cond_e0
    add-int/lit8 v8, v1, 0x1

    sub-int v9, v5, v1

    invoke-static {v0, v8, v0, v4, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 328
    add-int/lit8 v8, v1, 0x1

    sub-int/2addr v8, v4

    sub-int/2addr v5, v8

    .line 329
    add-int/lit8 v1, v4, 0x1

    goto :goto_da

    .line 333
    .end local v2    # "j":I
    :cond_ee
    if-gtz v5, :cond_f4

    .line 334
    const-string p0, ""

    goto/16 :goto_7

    .line 336
    :cond_f4
    if-gt v5, v4, :cond_fd

    .line 337
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    invoke-direct {p0, v0, v11, v5}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_7

    .line 339
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_fd
    if-eqz v3, :cond_108

    if-eqz p1, :cond_108

    .line 340
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    invoke-direct {p0, v0, v11, v5}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_7

    .line 342
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_108
    new-instance p0, Ljava/lang/String;

    .end local p0    # "filename":Ljava/lang/String;
    add-int/lit8 v7, v5, -0x1

    invoke-direct {p0, v0, v11, v7}, Ljava/lang/String;-><init>([CII)V

    goto/16 :goto_7
.end method

.method public static equals(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "filename1"    # Ljava/lang/String;
    .param p1, "filename2"    # Ljava/lang/String;

    .prologue
    .line 908
    const/4 v0, 0x0

    sget-object v1, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/io/FilenameUtils;->equals(Ljava/lang/String;Ljava/lang/String;ZLorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method

.method public static equals(Ljava/lang/String;Ljava/lang/String;ZLorg/apache/commons/io/IOCase;)Z
    .registers 5
    .param p0, "filename1"    # Ljava/lang/String;
    .param p1, "filename2"    # Ljava/lang/String;
    .param p2, "normalized"    # Z
    .param p3, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 974
    if-eqz p0, :cond_4

    if-nez p1, :cond_a

    .line 975
    :cond_4
    if-ne p0, p1, :cond_8

    const/4 v0, 0x1

    .line 984
    :goto_7
    return v0

    .line 975
    :cond_8
    const/4 v0, 0x0

    goto :goto_7

    .line 977
    :cond_a
    if-eqz p2, :cond_14

    .line 978
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 979
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 981
    :cond_14
    if-nez p3, :cond_18

    .line 982
    sget-object p3, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .line 984
    :cond_18
    invoke-virtual {p3, p0, p1}, Lorg/apache/commons/io/IOCase;->checkEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_7
.end method

.method public static equalsNormalized(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "filename1"    # Ljava/lang/String;
    .param p1, "filename2"    # Ljava/lang/String;

    .prologue
    .line 939
    const/4 v0, 0x1

    sget-object v1, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/io/FilenameUtils;->equals(Ljava/lang/String;Ljava/lang/String;ZLorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method

.method public static equalsNormalizedOnSystem(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "filename1"    # Ljava/lang/String;
    .param p1, "filename2"    # Ljava/lang/String;

    .prologue
    .line 956
    const/4 v0, 0x1

    sget-object v1, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/io/FilenameUtils;->equals(Ljava/lang/String;Ljava/lang/String;ZLorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method

.method public static equalsOnSystem(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p0, "filename1"    # Ljava/lang/String;
    .param p1, "filename2"    # Ljava/lang/String;

    .prologue
    .line 923
    const/4 v0, 0x0

    sget-object v1, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/io/FilenameUtils;->equals(Ljava/lang/String;Ljava/lang/String;ZLorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method

.method public static getBaseName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 833
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->removeExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 854
    if-nez p0, :cond_4

    .line 855
    const/4 v1, 0x0

    .line 861
    :goto_3
    return-object v1

    .line 857
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfExtension(Ljava/lang/String;)I

    move-result v0

    .line 858
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    .line 859
    const-string v1, ""

    goto :goto_3

    .line 861
    :cond_e
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static getFullPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 727
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doGetFullPath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFullPathNoEndSeparator(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 757
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doGetFullPath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 808
    if-nez p0, :cond_4

    .line 809
    const/4 v1, 0x0

    .line 812
    :goto_3
    return-object v1

    .line 811
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfLastSeparator(Ljava/lang/String;)I

    move-result v0

    .line 812
    .local v0, "index":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static getPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 649
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doGetPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPathNoEndSeparator(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 676
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doGetPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 613
    if-nez p0, :cond_4

    .line 623
    :cond_3
    :goto_3
    return-object v1

    .line 616
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getPrefixLength(Ljava/lang/String;)I

    move-result v0

    .line 617
    .local v0, "len":I
    if-ltz v0, :cond_3

    .line 620
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v0, v1, :cond_24

    .line 621
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 623
    :cond_24
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static getPrefixLength(Ljava/lang/String;)I
    .registers 12
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x2f

    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x2

    const/4 v7, -0x1

    .line 486
    if-nez p0, :cond_a

    move v5, v7

    .line 534
    :cond_9
    :goto_9
    return v5

    .line 489
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 490
    .local v2, "len":I
    if-nez v2, :cond_12

    move v5, v6

    .line 491
    goto :goto_9

    .line 493
    :cond_12
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 494
    .local v0, "ch0":C
    const/16 v9, 0x3a

    if-ne v0, v9, :cond_1c

    move v5, v7

    .line 495
    goto :goto_9

    .line 497
    :cond_1c
    if-ne v2, v5, :cond_2c

    .line 498
    const/16 v7, 0x7e

    if-ne v0, v7, :cond_24

    move v5, v8

    .line 499
    goto :goto_9

    .line 501
    :cond_24
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v7

    if-nez v7, :cond_9

    move v5, v6

    goto :goto_9

    .line 503
    :cond_2c
    const/16 v9, 0x7e

    if-ne v0, v9, :cond_4e

    .line 504
    invoke-virtual {p0, v10, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 505
    .local v3, "posUnix":I
    const/16 v6, 0x5c

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 506
    .local v4, "posWin":I
    if-ne v3, v7, :cond_41

    if-ne v4, v7, :cond_41

    .line 507
    add-int/lit8 v5, v2, 0x1

    goto :goto_9

    .line 509
    :cond_41
    if-ne v3, v7, :cond_44

    move v3, v4

    .line 510
    :cond_44
    if-ne v4, v7, :cond_47

    move v4, v3

    .line 511
    :cond_47
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 513
    .end local v3    # "posUnix":I
    .end local v4    # "posWin":I
    :cond_4e
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 514
    .local v1, "ch1":C
    const/16 v9, 0x3a

    if-ne v1, v9, :cond_74

    .line 515
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 516
    const/16 v5, 0x41

    if-lt v0, v5, :cond_72

    const/16 v5, 0x5a

    if-gt v0, v5, :cond_72

    .line 517
    if-eq v2, v8, :cond_6e

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v5

    if-nez v5, :cond_70

    :cond_6e
    move v5, v8

    .line 518
    goto :goto_9

    .line 520
    :cond_70
    const/4 v5, 0x3

    goto :goto_9

    :cond_72
    move v5, v7

    .line 522
    goto :goto_9

    .line 524
    :cond_74
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v9

    if-eqz v9, :cond_a3

    invoke-static {v1}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v9

    if-eqz v9, :cond_a3

    .line 525
    invoke-virtual {p0, v10, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 526
    .restart local v3    # "posUnix":I
    const/16 v5, 0x5c

    invoke-virtual {p0, v5, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 527
    .restart local v4    # "posWin":I
    if-ne v3, v7, :cond_8e

    if-eq v4, v7, :cond_92

    :cond_8e
    if-eq v3, v8, :cond_92

    if-ne v4, v8, :cond_95

    :cond_92
    move v5, v7

    .line 528
    goto/16 :goto_9

    .line 530
    :cond_95
    if-ne v3, v7, :cond_98

    move v3, v4

    .line 531
    :cond_98
    if-ne v4, v7, :cond_9b

    move v4, v3

    .line 532
    :cond_9b
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_9

    .line 534
    .end local v3    # "posUnix":I
    .end local v4    # "posWin":I
    :cond_a3
    invoke-static {v0}, Lorg/apache/commons/io/FilenameUtils;->isSeparator(C)Z

    move-result v7

    if-nez v7, :cond_9

    move v5, v6

    goto/16 :goto_9
.end method

.method public static indexOfExtension(Ljava/lang/String;)I
    .registers 5
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 574
    if-nez p0, :cond_4

    .line 579
    :goto_3
    return v2

    .line 577
    :cond_4
    const/16 v3, 0x2e

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 578
    .local v0, "extensionPos":I
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfLastSeparator(Ljava/lang/String;)I

    move-result v1

    .line 579
    .local v1, "lastSeparator":I
    if-le v1, v0, :cond_11

    move v0, v2

    .end local v0    # "extensionPos":I
    :cond_11
    move v2, v0

    goto :goto_3
.end method

.method public static indexOfLastSeparator(Ljava/lang/String;)I
    .registers 4
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 552
    if-nez p0, :cond_4

    .line 553
    const/4 v2, -0x1

    .line 557
    :goto_3
    return v2

    .line 555
    :cond_4
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 556
    .local v0, "lastUnixPos":I
    const/16 v2, 0x5c

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 557
    .local v1, "lastWindowsPos":I
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_3
.end method

.method public static isExtension(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "extension"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 1000
    if-nez p0, :cond_4

    .line 1007
    :cond_3
    :goto_3
    return v1

    .line 1003
    :cond_4
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_15

    .line 1004
    :cond_c
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfExtension(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    const/4 v1, 0x1

    goto :goto_3

    .line 1006
    :cond_15
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1007
    .local v0, "fileExt":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public static isExtension(Ljava/lang/String;Ljava/util/Collection;)Z
    .registers 8
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "extensions"    # Ljava/util/Collection;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1049
    if-nez p0, :cond_5

    .line 1061
    :cond_4
    :goto_4
    return v3

    .line 1052
    :cond_5
    if-eqz p1, :cond_d

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 1053
    :cond_d
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfExtension(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_16

    :goto_14
    move v3, v2

    goto :goto_4

    :cond_16
    move v2, v3

    goto :goto_14

    .line 1055
    :cond_18
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1056
    .local v0, "fileExt":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1057
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20

    move v3, v2

    .line 1058
    goto :goto_4
.end method

.method public static isExtension(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 8
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "extensions"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1022
    if-nez p0, :cond_5

    .line 1034
    :cond_4
    :goto_4
    return v3

    .line 1025
    :cond_5
    if-eqz p1, :cond_a

    array-length v4, p1

    if-nez v4, :cond_15

    .line 1026
    :cond_a
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfExtension(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_13

    :goto_11
    move v3, v2

    goto :goto_4

    :cond_13
    move v2, v3

    goto :goto_11

    .line 1028
    :cond_15
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1029
    .local v0, "fileExt":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    array-length v4, p1

    if-ge v1, v4, :cond_4

    .line 1030
    aget-object v4, p1, v1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    move v3, v2

    .line 1031
    goto :goto_4

    .line 1029
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a
.end method

.method private static isSeparator(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 152
    const/16 v0, 0x2f

    if-eq p0, v0, :cond_8

    const/16 v0, 0x5c

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static isSystemWindows()Z
    .registers 2

    .prologue
    .line 141
    sget-char v0, Lorg/apache/commons/io/FilenameUtils;->SYSTEM_SEPARATOR:C

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 197
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doNormalize(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static normalizeNoEndSeparator(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FilenameUtils;->doNormalize(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static removeExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 884
    if-nez p0, :cond_4

    .line 885
    const/4 p0, 0x0

    .line 891
    .end local p0    # "filename":Ljava/lang/String;
    .local v0, "index":I
    :cond_3
    :goto_3
    return-object p0

    .line 887
    .end local v0    # "index":I
    .restart local p0    # "filename":Ljava/lang/String;
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->indexOfExtension(Ljava/lang/String;)I

    move-result v0

    .line 888
    .restart local v0    # "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    .line 891
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method public static separatorsToSystem(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 443
    if-nez p0, :cond_4

    .line 444
    const/4 v0, 0x0

    .line 449
    :goto_3
    return-object v0

    .line 446
    :cond_4
    invoke-static {}, Lorg/apache/commons/io/FilenameUtils;->isSystemWindows()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 447
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->separatorsToWindows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 449
    :cond_f
    invoke-static {p0}, Lorg/apache/commons/io/FilenameUtils;->separatorsToUnix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static separatorsToUnix(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x5c

    .line 417
    if-eqz p0, :cond_b

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_c

    .line 420
    .end local p0    # "path":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object p0

    .restart local p0    # "path":Ljava/lang/String;
    :cond_c
    const/16 v0, 0x2f

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    goto :goto_b
.end method

.method public static separatorsToWindows(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x2f

    .line 430
    if-eqz p0, :cond_b

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_c

    .line 433
    .end local p0    # "path":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object p0

    .restart local p0    # "path":Ljava/lang/String;
    :cond_c
    const/16 v0, 0x5c

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    goto :goto_b
.end method

.method static splitOnTokens(Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x3f

    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 1219
    const-string v4, "?"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_1a

    const-string v4, "*"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_1a

    .line 1220
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    aput-object p0, v4, v6

    .line 1246
    :goto_19
    return-object v4

    .line 1223
    :cond_1a
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 1224
    .local v0, "array":[C
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1225
    .local v3, "list":Ljava/util/ArrayList;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 1226
    .local v1, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_29
    array-length v4, v0

    if-ge v2, v4, :cond_78

    .line 1227
    aget-char v4, v0, v2

    if-eq v4, v7, :cond_36

    aget-char v4, v0, v2

    const/16 v5, 0x2a

    if-ne v4, v5, :cond_72

    .line 1228
    :cond_36
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-eqz v4, :cond_46

    .line 1229
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1230
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 1232
    :cond_46
    aget-char v4, v0, v2

    if-ne v4, v7, :cond_52

    .line 1233
    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1226
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    .line 1234
    :cond_52
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_6c

    if-lez v2, :cond_4f

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4f

    .line 1236
    :cond_6c
    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    .line 1239
    :cond_72
    aget-char v4, v0, v2

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_4f

    .line 1242
    :cond_78
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-eqz v4, :cond_85

    .line 1243
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1246
    :cond_85
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;

    goto :goto_19
.end method

.method public static wildcardMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "wildcardMatcher"    # Ljava/lang/String;

    .prologue
    .line 1087
    sget-object v0, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FilenameUtils;->wildcardMatch(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method

.method public static wildcardMatch(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Z
    .registers 14
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "wildcardMatcher"    # Ljava/lang/String;
    .param p2, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1129
    if-nez p0, :cond_8

    if-nez p1, :cond_8

    move v7, v8

    .line 1206
    :goto_7
    return v7

    .line 1132
    :cond_8
    if-eqz p0, :cond_c

    if-nez p1, :cond_e

    :cond_c
    move v7, v9

    .line 1133
    goto :goto_7

    .line 1135
    :cond_e
    if-nez p2, :cond_12

    .line 1136
    sget-object p2, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .line 1138
    :cond_12
    invoke-virtual {p2, p0}, Lorg/apache/commons/io/IOCase;->convertCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1139
    invoke-virtual {p2, p1}, Lorg/apache/commons/io/IOCase;->convertCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1140
    invoke-static {p1}, Lorg/apache/commons/io/FilenameUtils;->splitOnTokens(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1141
    .local v5, "wcs":[Ljava/lang/String;
    const/4 v0, 0x0

    .line 1142
    .local v0, "anyChars":Z
    const/4 v4, 0x0

    .line 1143
    .local v4, "textIdx":I
    const/4 v6, 0x0

    .line 1144
    .local v6, "wcsIdx":I
    new-instance v2, Ljava/util/Stack;

    invoke-direct {v2}, Ljava/util/Stack;-><init>()V

    .line 1148
    .local v2, "backtrack":Ljava/util/Stack;
    :cond_26
    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v7

    if-lez v7, :cond_3a

    .line 1149
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    move-object v1, v7

    check-cast v1, [I

    .line 1150
    .local v1, "array":[I
    aget v6, v1, v9

    .line 1151
    aget v4, v1, v8

    .line 1152
    const/4 v0, 0x1

    .line 1156
    .end local v1    # "array":[I
    :cond_3a
    :goto_3a
    array-length v7, v5

    if-ge v6, v7, :cond_6d

    .line 1158
    aget-object v7, v5, v6

    const-string v10, "?"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 1160
    add-int/lit8 v4, v4, 0x1

    .line 1161
    const/4 v0, 0x0

    .line 1196
    :cond_4a
    :goto_4a
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a

    .line 1163
    :cond_4d
    aget-object v7, v5, v6

    const-string v10, "*"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_62

    .line 1165
    const/4 v0, 0x1

    .line 1166
    array-length v7, v5

    add-int/lit8 v7, v7, -0x1

    if-ne v6, v7, :cond_4a

    .line 1167
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    goto :goto_4a

    .line 1172
    :cond_62
    if-eqz v0, :cond_95

    .line 1174
    aget-object v7, v5, v6

    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 1175
    const/4 v7, -0x1

    if-ne v4, v7, :cond_78

    .line 1200
    :cond_6d
    :goto_6d
    array-length v7, v5

    if-ne v6, v7, :cond_9e

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v4, v7, :cond_9e

    move v7, v8

    .line 1201
    goto :goto_7

    .line 1179
    :cond_78
    aget-object v7, v5, v6

    add-int/lit8 v10, v4, 0x1

    invoke-virtual {p0, v7, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 1180
    .local v3, "repeat":I
    if-ltz v3, :cond_8c

    .line 1181
    const/4 v7, 0x2

    new-array v7, v7, [I

    aput v6, v7, v9

    aput v3, v7, v8

    invoke-virtual {v2, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1192
    .end local v3    # "repeat":I
    :cond_8c
    aget-object v7, v5, v6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v4, v7

    .line 1193
    const/4 v0, 0x0

    goto :goto_4a

    .line 1185
    :cond_95
    aget-object v7, v5, v6

    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v7

    if-nez v7, :cond_8c

    goto :goto_6d

    .line 1204
    :cond_9e
    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v7

    if-gtz v7, :cond_26

    move v7, v9

    .line 1206
    goto/16 :goto_7
.end method

.method public static wildcardMatchOnSystem(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "wildcardMatcher"    # Ljava/lang/String;

    .prologue
    .line 1112
    sget-object v0, Lorg/apache/commons/io/IOCase;->SYSTEM:Lorg/apache/commons/io/IOCase;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FilenameUtils;->wildcardMatch(Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/io/IOCase;)Z

    move-result v0

    return v0
.end method
