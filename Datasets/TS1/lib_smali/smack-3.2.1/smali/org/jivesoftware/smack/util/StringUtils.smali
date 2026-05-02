.class public Lorg/jivesoftware/smack/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final AMP_ENCODE:[C

.field private static final APOS_ENCODE:[C

.field private static final GT_ENCODE:[C

.field private static final LT_ENCODE:[C

.field private static final QUOTE_ENCODE:[C

.field public static final XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

.field private static digest:Ljava/security/MessageDigest;

.field private static numbersAndLetters:[C

.field private static randGen:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 46
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    .line 49
    sget-object v0, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 52
    const-string v0, "&quot;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    .line 53
    const-string v0, "&apos;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->APOS_ENCODE:[C

    .line 54
    const-string v0, "&amp;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    .line 55
    const-string v0, "&lt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    .line 56
    const-string v0, "&gt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    .line 394
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    .line 517
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    .line 525
    const-string v0, "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 553
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 555
    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .registers 2
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 509
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 458
    const/4 v0, 0x0

    .line 460
    .local v0, "bytes":[B
    :try_start_1
    const-string v2, "ISO-8859-1"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_6} :catch_c

    move-result-object v0

    .line 465
    :goto_7
    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 462
    :catch_c
    move-exception v1

    .line 463
    .local v1, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_7
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .registers 2
    .param p0, "data"    # [B

    .prologue
    .line 475
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BIIZ)Ljava/lang/String;
    .registers 5
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "lineBreaks"    # Z

    .prologue
    .line 499
    if-eqz p3, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_8
    const/16 v0, 0x8

    goto :goto_3
.end method

.method public static encodeBase64([BZ)Ljava/lang/String;
    .registers 4
    .param p0, "data"    # [B
    .param p1, "lineBreaks"    # Z

    .prologue
    .line 486
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/jivesoftware/smack/util/StringUtils;->encodeBase64([BIIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeHex([B)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B

    .prologue
    const/16 v6, 0x10

    .line 439
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 441
    .local v2, "hex":Ljava/lang/StringBuilder;
    move-object v1, p0

    .local v1, "arr$":[B
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_d
    if-ge v3, v4, :cond_26

    aget-byte v0, v1, v3

    .line 442
    .local v0, "aByte":B
    and-int/lit16 v5, v0, 0xff

    if-ge v5, v6, :cond_1a

    .line 443
    const-string v5, "0"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    :cond_1a
    and-int/lit16 v5, v0, 0xff

    invoke-static {v5, v6}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 448
    .end local v0    # "aByte":B
    :cond_26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static escapeForXML(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3e

    .line 324
    if-nez p0, :cond_6

    .line 325
    const/4 p0, 0x0

    .line 388
    .end local p0    # "string":Ljava/lang/String;
    .local v1, "i":I
    .local v2, "input":[C
    .local v3, "last":I
    .local v4, "len":I
    .local v5, "out":Ljava/lang/StringBuilder;
    :cond_5
    :goto_5
    return-object p0

    .line 328
    .end local v1    # "i":I
    .end local v2    # "input":[C
    .end local v3    # "last":I
    .end local v4    # "len":I
    .end local v5    # "out":Ljava/lang/StringBuilder;
    .restart local p0    # "string":Ljava/lang/String;
    :cond_6
    const/4 v1, 0x0

    .line 329
    .restart local v1    # "i":I
    const/4 v3, 0x0

    .line 330
    .restart local v3    # "last":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 331
    .restart local v2    # "input":[C
    array-length v4, v2

    .line 332
    .restart local v4    # "len":I
    new-instance v5, Ljava/lang/StringBuilder;

    int-to-double v6, v4

    const-wide v8, 0x3ff4cccccccccccdL    # 1.3

    mul-double/2addr v6, v8

    double-to-int v6, v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 333
    .restart local v5    # "out":Ljava/lang/StringBuilder;
    :goto_1a
    if-ge v1, v4, :cond_b3

    .line 334
    aget-char v0, v2, v1

    .line 335
    .local v0, "ch":C
    if-le v0, v10, :cond_23

    .line 333
    :cond_20
    :goto_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 337
    :cond_23
    const/16 v6, 0x3c

    if-ne v0, v6, :cond_36

    .line 338
    if-le v1, v3, :cond_2e

    .line 339
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 341
    :cond_2e
    add-int/lit8 v3, v1, 0x1

    .line 342
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->LT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 344
    :cond_36
    if-ne v0, v10, :cond_47

    .line 345
    if-le v1, v3, :cond_3f

    .line 346
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 348
    :cond_3f
    add-int/lit8 v3, v1, 0x1

    .line 349
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->GT_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 352
    :cond_47
    const/16 v6, 0x26

    if-ne v0, v6, :cond_8c

    .line 353
    if-le v1, v3, :cond_52

    .line 354
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 357
    :cond_52
    add-int/lit8 v6, v1, 0x5

    if-le v4, v6, :cond_84

    add-int/lit8 v6, v1, 0x1

    aget-char v6, v2, v6

    const/16 v7, 0x23

    if-ne v6, v7, :cond_84

    add-int/lit8 v6, v1, 0x2

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_84

    add-int/lit8 v6, v1, 0x3

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_84

    add-int/lit8 v6, v1, 0x4

    aget-char v6, v2, v6

    invoke-static {v6}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_84

    add-int/lit8 v6, v1, 0x5

    aget-char v6, v2, v6

    const/16 v7, 0x3b

    if-eq v6, v7, :cond_20

    .line 363
    :cond_84
    add-int/lit8 v3, v1, 0x1

    .line 364
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->AMP_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 367
    :cond_8c
    const/16 v6, 0x22

    if-ne v0, v6, :cond_9f

    .line 368
    if-le v1, v3, :cond_97

    .line 369
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 371
    :cond_97
    add-int/lit8 v3, v1, 0x1

    .line 372
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->QUOTE_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 374
    :cond_9f
    const/16 v6, 0x27

    if-ne v0, v6, :cond_20

    .line 375
    if-le v1, v3, :cond_aa

    .line 376
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 378
    :cond_aa
    add-int/lit8 v3, v1, 0x1

    .line 379
    sget-object v6, Lorg/jivesoftware/smack/util/StringUtils;->APOS_ENCODE:[C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_20

    .line 382
    .end local v0    # "ch":C
    :cond_b3
    if-eqz v3, :cond_5

    .line 385
    if-le v1, v3, :cond_bc

    .line 386
    sub-int v6, v1, v3

    invoke-virtual {v5, v2, v3, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 388
    :cond_bc
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_5
.end method

.method public static escapeNode(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "node"    # Ljava/lang/String;

    .prologue
    .line 207
    if-nez p0, :cond_4

    .line 208
    const/4 v4, 0x0

    .line 233
    :goto_3
    return-object v4

    .line 210
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x8

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 211
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, "n":I
    :goto_14
    if-ge v2, v3, :cond_65

    .line 212
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 213
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_6a

    .line 224
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_61

    .line 225
    const-string v4, "\\20"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 214
    :sswitch_2b
    const-string v4, "\\22"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 215
    :sswitch_31
    const-string v4, "\\26"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 216
    :sswitch_37
    const-string v4, "\\27"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 217
    :sswitch_3d
    const-string v4, "\\2f"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 218
    :sswitch_43
    const-string v4, "\\3a"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 219
    :sswitch_49
    const-string v4, "\\3c"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 220
    :sswitch_4f
    const-string v4, "\\3e"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 221
    :sswitch_55
    const-string v4, "\\40"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 222
    :sswitch_5b
    const-string v4, "\\5c"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 228
    :cond_61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 233
    .end local v1    # "c":C
    :cond_65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 213
    :sswitch_data_6a
    .sparse-switch
        0x22 -> :sswitch_2b
        0x26 -> :sswitch_31
        0x27 -> :sswitch_37
        0x2f -> :sswitch_3d
        0x3a -> :sswitch_43
        0x3c -> :sswitch_49
        0x3e -> :sswitch_4f
        0x40 -> :sswitch_55
        0x5c -> :sswitch_5b
    .end sparse-switch
.end method

.method public static formatXEP0082Date(Ljava/util/Date;)Ljava/lang/String;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 78
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    monitor-enter v1

    .line 79
    :try_start_3
    sget-object v0, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 80
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public static declared-synchronized hash(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 413
    const-class v3, Lorg/jivesoftware/smack/util/StringUtils;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2f

    if-nez v2, :cond_f

    .line 415
    :try_start_7
    const-string v2, "SHA-1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    sput-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;
    :try_end_f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_f} :catch_26
    .catchall {:try_start_7 .. :try_end_f} :catchall_2f

    .line 424
    :cond_f
    :goto_f
    :try_start_f
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    const-string v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V
    :try_end_1a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_f .. :try_end_1a} :catch_32
    .catchall {:try_start_f .. :try_end_1a} :catchall_2f

    .line 429
    :goto_1a
    :try_start_1a
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->digest:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->encodeHex([B)Ljava/lang/String;
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_2f

    move-result-object v2

    monitor-exit v3

    return-object v2

    .line 417
    :catch_26
    move-exception v1

    .line 418
    .local v1, "nsae":Ljava/security/NoSuchAlgorithmException;
    :try_start_27
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v4, "Failed to load the SHA-1 MessageDigest. Jive will be unable to function normally."

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2e
    .catchall {:try_start_27 .. :try_end_2e} :catchall_2f

    goto :goto_f

    .line 413
    .end local v1    # "nsae":Ljava/security/NoSuchAlgorithmException;
    :catchall_2f
    move-exception v2

    monitor-exit v3

    throw v2

    .line 426
    :catch_32
    move-exception v0

    .line 427
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_33
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_38
    .catchall {:try_start_33 .. :try_end_38} :catchall_2f

    goto :goto_1a
.end method

.method public static parseBareAddress(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 160
    if-nez p0, :cond_4

    .line 161
    const/4 p0, 0x0

    .line 171
    .end local p0    # "XMPPAddress":Ljava/lang/String;
    .local v0, "slashIndex":I
    :cond_3
    :goto_3
    return-object p0

    .line 163
    .end local v0    # "slashIndex":I
    .restart local p0    # "XMPPAddress":Ljava/lang/String;
    :cond_4
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 164
    .restart local v0    # "slashIndex":I
    if-ltz v0, :cond_3

    .line 167
    if-nez v0, :cond_11

    .line 168
    const-string p0, ""

    goto :goto_3

    .line 171
    :cond_11
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method public static parseName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 92
    if-nez p0, :cond_4

    .line 93
    const/4 v1, 0x0

    .line 100
    :goto_3
    return-object v1

    .line 95
    :cond_4
    const-string v1, "@"

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 96
    .local v0, "atIndex":I
    if-gtz v0, :cond_f

    .line 97
    const-string v1, ""

    goto :goto_3

    .line 100
    :cond_f
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static parseResource(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 139
    if-nez p0, :cond_4

    .line 140
    const/4 v1, 0x0

    .line 147
    :goto_3
    return-object v1

    .line 142
    :cond_4
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 143
    .local v0, "slashIndex":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_14

    if-gez v0, :cond_17

    .line 144
    :cond_14
    const-string v1, ""

    goto :goto_3

    .line 147
    :cond_17
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static parseServer(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "XMPPAddress"    # Ljava/lang/String;

    .prologue
    .line 113
    if-nez p0, :cond_4

    .line 114
    const/4 v2, 0x0

    .line 126
    :goto_3
    return-object v2

    .line 116
    :cond_4
    const-string v2, "@"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 118
    .local v0, "atIndex":I
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_15

    .line 119
    const-string v2, ""

    goto :goto_3

    .line 121
    :cond_15
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 122
    .local v1, "slashIndex":I
    if-lez v1, :cond_26

    if-le v1, v0, :cond_26

    .line 123
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 126
    :cond_26
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public static parseXEP0082Date(Ljava/lang/String;)Ljava/util/Date;
    .registers 3
    .param p0, "dateString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 66
    sget-object v1, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    monitor-enter v1

    .line 67
    :try_start_3
    sget-object v0, Lorg/jivesoftware/smack/util/StringUtils;->XEP_0082_UTC_FORMAT:Ljava/text/DateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 68
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public static randomString(I)Ljava/lang/String;
    .registers 6
    .param p0, "length"    # I

    .prologue
    .line 542
    const/4 v2, 0x1

    if-ge p0, v2, :cond_5

    .line 543
    const/4 v2, 0x0

    .line 550
    :goto_4
    return-object v2

    .line 546
    :cond_5
    new-array v1, p0, [C

    .line 547
    .local v1, "randBuffer":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v2, v1

    if-ge v0, v2, :cond_1c

    .line 548
    sget-object v2, Lorg/jivesoftware/smack/util/StringUtils;->numbersAndLetters:[C

    sget-object v3, Lorg/jivesoftware/smack/util/StringUtils;->randGen:Ljava/util/Random;

    const/16 v4, 0x47

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 547
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 550
    :cond_1c
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_4
.end method

.method public static unescapeNode(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "node"    # Ljava/lang/String;

    .prologue
    .line 268
    if-nez p0, :cond_4

    .line 269
    const/4 v7, 0x0

    .line 313
    :goto_3
    return-object v7

    .line 271
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    .line 272
    .local v6, "nodeChars":[C
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v7, v6

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 273
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    array-length v5, v6

    .local v5, "n":I
    :goto_10
    if-ge v4, v5, :cond_9b

    .line 275
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 276
    .local v1, "c":C
    const/16 v7, 0x5c

    if-ne v1, v7, :cond_2d

    add-int/lit8 v7, v4, 0x2

    if-ge v7, v5, :cond_2d

    .line 277
    add-int/lit8 v7, v4, 0x1

    aget-char v2, v6, v7

    .line 278
    .local v2, "c2":C
    add-int/lit8 v7, v4, 0x2

    aget-char v3, v6, v7

    .line 279
    .local v3, "c3":C
    const/16 v7, 0x32

    if-ne v2, v7, :cond_5b

    .line 280
    sparse-switch v3, :sswitch_data_a2

    .line 310
    .end local v2    # "c2":C
    .end local v3    # "c3":C
    :cond_2d
    :goto_2d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    :goto_30
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 281
    .restart local v2    # "c2":C
    .restart local v3    # "c3":C
    :sswitch_33
    const/16 v7, 0x20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 282
    :sswitch_3b
    const/16 v7, 0x22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 283
    :sswitch_43
    const/16 v7, 0x26

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 284
    :sswitch_4b
    const/16 v7, 0x27

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 285
    :sswitch_53
    const/16 v7, 0x2f

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 288
    :cond_5b
    const/16 v7, 0x33

    if-ne v2, v7, :cond_7b

    .line 289
    packed-switch v3, :pswitch_data_b8

    :pswitch_62
    goto :goto_2d

    .line 290
    :pswitch_63
    const/16 v7, 0x3a

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 291
    :pswitch_6b
    const/16 v7, 0x3c

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 292
    :pswitch_73
    const/16 v7, 0x3e

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto :goto_30

    .line 295
    :cond_7b
    const/16 v7, 0x34

    if-ne v2, v7, :cond_8b

    .line 296
    const/16 v7, 0x30

    if-ne v3, v7, :cond_2d

    .line 297
    const-string v7, "@"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    add-int/lit8 v4, v4, 0x2

    .line 299
    goto :goto_30

    .line 302
    :cond_8b
    const/16 v7, 0x35

    if-ne v2, v7, :cond_2d

    .line 303
    const/16 v7, 0x63

    if-ne v3, v7, :cond_2d

    .line 304
    const-string v7, "\\"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    add-int/lit8 v4, v4, 0x2

    .line 306
    goto :goto_30

    .line 313
    .end local v1    # "c":C
    .end local v2    # "c2":C
    .end local v3    # "c3":C
    :cond_9b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_3

    .line 280
    nop

    :sswitch_data_a2
    .sparse-switch
        0x30 -> :sswitch_33
        0x32 -> :sswitch_3b
        0x36 -> :sswitch_43
        0x37 -> :sswitch_4b
        0x66 -> :sswitch_53
    .end sparse-switch

    .line 289
    :pswitch_data_b8
    .packed-switch 0x61
        :pswitch_63
        :pswitch_62
        :pswitch_6b
        :pswitch_62
        :pswitch_73
    .end packed-switch
.end method
