.class public Lorg/apache/commons/validator/GenericTypeValidator;
.super Ljava/lang/Object;
.source "GenericTypeValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = 0x4c26510d6ee20fc7L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 408
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static formatByte(Ljava/lang/String;)Ljava/lang/Byte;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 47
    if-nez p0, :cond_4

    .line 54
    :goto_3
    return-object v1

    .line 52
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Byte;

    invoke-direct {v2, p0}, Ljava/lang/Byte;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 53
    :catch_b
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatByte(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Byte;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 68
    const/4 v3, 0x0

    .line 70
    .local v3, "result":Ljava/lang/Byte;
    if-eqz p0, :cond_49

    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_4a

    .line 73
    invoke-static {p1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 77
    :goto_a
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 78
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 79
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 82
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_49

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_49

    .line 83
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, -0x3fa0000000000000L    # -128.0

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_49

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x405fc00000000000L    # 127.0

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_49

    .line 85
    new-instance v3, Ljava/lang/Byte;

    .end local v3    # "result":Ljava/lang/Byte;
    invoke-virtual {v1}, Ljava/lang/Number;->byteValue()B

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Byte;-><init>(B)V

    .line 90
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Byte;
    :cond_49
    return-object v3

    .line 75
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_4a
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method

.method public static formatCreditCard(Ljava/lang/String;)Ljava/lang/Long;
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 476
    invoke-static {p0}, Lorg/apache/commons/validator/GenericValidator;->isCreditCard(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p0}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    :goto_b
    return-object v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static formatDate(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Date;
    .registers 9
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "datePattern"    # Ljava/lang/String;
    .param p2, "strict"    # Z

    .prologue
    .line 433
    const/4 v0, 0x0

    .line 435
    .local v0, "date":Ljava/util/Date;
    if-eqz p0, :cond_b

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_d

    .line 438
    :cond_b
    const/4 v4, 0x0

    .line 462
    :goto_c
    return-object v4

    .line 442
    :cond_d
    :try_start_d
    new-instance v2, Ljava/text/SimpleDateFormat;

    invoke-direct {v2, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 443
    .local v2, "formatter":Ljava/text/SimpleDateFormat;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 445
    invoke-virtual {v2, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 447
    if-eqz p2, :cond_27

    .line 448
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    :try_end_23
    .catch Ljava/text/ParseException; {:try_start_d .. :try_end_23} :catch_29

    move-result v5

    if-eq v4, v5, :cond_27

    .line 449
    const/4 v0, 0x0

    .end local v2    # "formatter":Ljava/text/SimpleDateFormat;
    :cond_27
    :goto_27
    move-object v4, v0

    .line 462
    goto :goto_c

    .line 452
    :catch_29
    move-exception v1

    .line 454
    .local v1, "e":Ljava/text/ParseException;
    sget-object v4, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    if-nez v4, :cond_81

    const-string v4, "org.apache.commons.validator.GenericTypeValidator"

    invoke-static {v4}, Lorg/apache/commons/validator/GenericTypeValidator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    :goto_36
    invoke-static {v4}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v3

    .line 455
    .local v3, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_27

    .line 456
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Date parse failed value=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "], "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "pattern=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "], "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "strict=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_27

    .line 454
    .end local v3    # "log":Lorg/apache/commons/logging/Log;
    :cond_81
    sget-object v4, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    goto :goto_36
.end method

.method public static formatDate(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/Date;
    .registers 9
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 369
    const/4 v0, 0x0

    .line 371
    .local v0, "date":Ljava/util/Date;
    if-nez p0, :cond_5

    .line 372
    const/4 v5, 0x0

    .line 415
    :goto_4
    return-object v5

    .line 377
    :cond_5
    const/4 v3, 0x0

    .line 378
    .local v3, "formatterShort":Ljava/text/DateFormat;
    const/4 v2, 0x0

    .line 379
    .local v2, "formatterDefault":Ljava/text/DateFormat;
    if-eqz p1, :cond_21

    .line 380
    const/4 v5, 0x3

    :try_start_a
    invoke-static {v5, p1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v3

    .line 382
    const/4 v5, 0x2

    invoke-static {v5, p1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    .line 396
    :goto_13
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 397
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/text/DateFormat;->setLenient(Z)V
    :try_end_1b
    .catch Ljava/text/ParseException; {:try_start_a .. :try_end_1b} :catch_3a

    .line 401
    :try_start_1b
    invoke-virtual {v3, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_1e
    .catch Ljava/text/ParseException; {:try_start_1b .. :try_end_1e} :catch_34

    move-result-object v0

    :cond_1f
    :goto_1f
    move-object v5, v0

    .line 415
    goto :goto_4

    .line 385
    :cond_21
    const/4 v5, 0x3

    :try_start_22
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v3

    .line 389
    const/4 v5, 0x2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    goto :goto_13

    .line 402
    :catch_34
    move-exception v1

    .line 404
    .local v1, "e":Ljava/text/ParseException;
    invoke-virtual {v2, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_38
    .catch Ljava/text/ParseException; {:try_start_22 .. :try_end_38} :catch_3a

    move-result-object v0

    goto :goto_1f

    .line 406
    .end local v1    # "e":Ljava/text/ParseException;
    :catch_3a
    move-exception v1

    .line 408
    .restart local v1    # "e":Ljava/text/ParseException;
    sget-object v5, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    if-nez v5, :cond_82

    const-string v5, "org.apache.commons.validator.GenericTypeValidator"

    invoke-static {v5}, Lorg/apache/commons/validator/GenericTypeValidator;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    :goto_47
    invoke-static {v5}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v4

    .line 409
    .local v4, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 410
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Date parse failed value=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "], "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "locale=["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "] "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1f

    .line 408
    .end local v4    # "log":Lorg/apache/commons/logging/Log;
    :cond_82
    sget-object v5, Lorg/apache/commons/validator/GenericTypeValidator;->class$org$apache$commons$validator$GenericTypeValidator:Ljava/lang/Class;

    goto :goto_47
.end method

.method public static formatDouble(Ljava/lang/String;)Ljava/lang/Double;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 311
    if-nez p0, :cond_4

    .line 318
    :goto_3
    return-object v1

    .line 316
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Double;

    invoke-direct {v2, p0}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 317
    :catch_b
    move-exception v0

    .line 318
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatDouble(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Double;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 332
    const/4 v3, 0x0

    .line 334
    .local v3, "result":Ljava/lang/Double;
    if-eqz p0, :cond_48

    .line 335
    const/4 v0, 0x0

    .line 336
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_49

    .line 337
    invoke-static {p1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 341
    :goto_a
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 342
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 345
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_48

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_48

    .line 346
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, -0x10000000000001L

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_48

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_48

    .line 348
    new-instance v3, Ljava/lang/Double;

    .end local v3    # "result":Ljava/lang/Double;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Double;-><init>(D)V

    .line 353
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Double;
    :cond_48
    return-object v3

    .line 339
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method

.method public static formatFloat(Ljava/lang/String;)Ljava/lang/Float;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 259
    if-nez p0, :cond_4

    .line 266
    :goto_3
    return-object v1

    .line 264
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Float;

    invoke-direct {v2, p0}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 265
    :catch_b
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatFloat(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Float;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 280
    const/4 v3, 0x0

    .line 282
    .local v3, "result":Ljava/lang/Float;
    if-eqz p0, :cond_48

    .line 283
    const/4 v0, 0x0

    .line 284
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_49

    .line 285
    invoke-static {p1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 289
    :goto_a
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 290
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 293
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_48

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_48

    .line 294
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, -0x3810000020000000L    # -3.4028234663852886E38

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_48

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x47efffffe0000000L    # 3.4028234663852886E38

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_48

    .line 296
    new-instance v3, Ljava/lang/Float;

    .end local v3    # "result":Ljava/lang/Float;
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Float;-><init>(F)V

    .line 301
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Float;
    :cond_48
    return-object v3

    .line 287
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method

.method public static formatInt(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 153
    if-nez p0, :cond_4

    .line 160
    :goto_3
    return-object v1

    .line 158
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 159
    :catch_b
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatInt(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Integer;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 174
    const/4 v3, 0x0

    .line 176
    .local v3, "result":Ljava/lang/Integer;
    if-eqz p0, :cond_49

    .line 177
    const/4 v0, 0x0

    .line 178
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_4a

    .line 179
    invoke-static {p1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 183
    :goto_a
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 184
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 185
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 188
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_49

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_49

    .line 189
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, -0x3e20000000000000L    # -2.147483648E9

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_49

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x41dfffffffc00000L    # 2.147483647E9

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_49

    .line 191
    new-instance v3, Ljava/lang/Integer;

    .end local v3    # "result":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    .line 196
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Integer;
    :cond_49
    return-object v3

    .line 181
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_4a
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method

.method public static formatLong(Ljava/lang/String;)Ljava/lang/Long;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 206
    if-nez p0, :cond_4

    .line 213
    :goto_3
    return-object v1

    .line 211
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Long;

    invoke-direct {v2, p0}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 212
    :catch_b
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatLong(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Long;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 227
    const/4 v3, 0x0

    .line 229
    .local v3, "result":Ljava/lang/Long;
    if-eqz p0, :cond_46

    .line 230
    const/4 v0, 0x0

    .line 231
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_47

    .line 232
    invoke-static {p1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 236
    :goto_a
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 237
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 238
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 241
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_46

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_46

    .line 242
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, -0x3c20000000000000L    # -9.223372036854776E18

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_46

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, 0x43e0000000000000L    # 9.223372036854776E18

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_46

    .line 244
    new-instance v3, Ljava/lang/Long;

    .end local v3    # "result":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Long;-><init>(J)V

    .line 249
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Long;
    :cond_46
    return-object v3

    .line 234
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_47
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method

.method public static formatShort(Ljava/lang/String;)Ljava/lang/Short;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 100
    if-nez p0, :cond_4

    .line 107
    :goto_3
    return-object v1

    .line 105
    :cond_4
    :try_start_4
    new-instance v2, Ljava/lang/Short;

    invoke-direct {v2, p0}, Ljava/lang/Short;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_9} :catch_b

    move-object v1, v2

    goto :goto_3

    .line 106
    :catch_b
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_3
.end method

.method public static formatShort(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Short;
    .registers 10
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 121
    const/4 v3, 0x0

    .line 123
    .local v3, "result":Ljava/lang/Short;
    if-eqz p0, :cond_49

    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_4a

    .line 126
    invoke-static {p1}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 130
    :goto_a
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 131
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 132
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {v0, p0, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 135
    .local v1, "num":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_49

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_49

    .line 136
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide/high16 v6, -0x3f20000000000000L    # -32768.0

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_49

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    const-wide v6, 0x40dfffc000000000L    # 32767.0

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_49

    .line 138
    new-instance v3, Ljava/lang/Short;

    .end local v3    # "result":Ljava/lang/Short;
    invoke-virtual {v1}, Ljava/lang/Number;->shortValue()S

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Short;-><init>(S)V

    .line 143
    .end local v0    # "formatter":Ljava/text/NumberFormat;
    .end local v1    # "num":Ljava/lang/Number;
    .end local v2    # "pos":Ljava/text/ParsePosition;
    .restart local v3    # "result":Ljava/lang/Short;
    :cond_49
    return-object v3

    .line 128
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :cond_4a
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_a
.end method
