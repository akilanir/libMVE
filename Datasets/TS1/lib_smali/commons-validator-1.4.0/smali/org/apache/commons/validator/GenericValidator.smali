.class public Lorg/apache/commons/validator/GenericValidator;
.super Ljava/lang/Object;
.source "GenericValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final CREDIT_CARD_VALIDATOR:Lorg/apache/commons/validator/routines/CreditCardValidator;

.field private static final URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

.field private static final serialVersionUID:J = -0x64168240846a7eb2L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    new-instance v0, Lorg/apache/commons/validator/routines/UrlValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/UrlValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/GenericValidator;->URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

    .line 45
    new-instance v0, Lorg/apache/commons/validator/routines/CreditCardValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/CreditCardValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/GenericValidator;->CREDIT_CARD_VALIDATOR:Lorg/apache/commons/validator/routines/CreditCardValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static adjustForLineEnding(Ljava/lang/String;I)I
    .registers 7
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "lineEndLength"    # I

    .prologue
    .line 332
    const/4 v1, 0x0

    .line 333
    .local v1, "nCount":I
    const/4 v2, 0x0

    .line 334
    .local v2, "rCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 335
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_13

    .line 336
    add-int/lit8 v1, v1, 0x1

    .line 338
    :cond_13
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_1d

    .line 339
    add-int/lit8 v2, v2, 0x1

    .line 334
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 342
    :cond_20
    mul-int v3, v1, p1

    add-int v4, v2, v1

    sub-int/2addr v3, v4

    return v3
.end method

.method public static isBlankOrNull(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 56
    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static isByte(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatByte(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isCreditCard(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 249
    sget-object v0, Lorg/apache/commons/validator/GenericValidator;->CREDIT_CARD_VALIDATOR:Lorg/apache/commons/validator/routines/CreditCardValidator;

    invoke-virtual {v0, p0}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isDate(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 4
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "datePattern"    # Ljava/lang/String;
    .param p2, "strict"    # Z

    .prologue
    .line 162
    invoke-static {}, Lorg/apache/commons/validator/DateValidator;->getInstance()Lorg/apache/commons/validator/DateValidator;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/validator/DateValidator;->isValid(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDate(Ljava/lang/String;Ljava/util/Locale;)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 145
    invoke-static {}, Lorg/apache/commons/validator/routines/DateValidator;->getInstance()Lorg/apache/commons/validator/routines/DateValidator;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/validator/routines/DateValidator;->isValid(Ljava/lang/String;Ljava/util/Locale;)Z

    move-result v0

    return v0
.end method

.method public static isDouble(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 131
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isEmail(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 259
    invoke-static {}, Lorg/apache/commons/validator/routines/EmailValidator;->getInstance()Lorg/apache/commons/validator/routines/EmailValidator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/validator/routines/EmailValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isFloat(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isInRange(BBB)Z
    .registers 4
    .param p0, "value"    # B
    .param p1, "min"    # B
    .param p2, "max"    # B

    .prologue
    .line 175
    if-lt p0, p1, :cond_6

    if-gt p0, p2, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isInRange(DDD)Z
    .registers 7
    .param p0, "value"    # D
    .param p2, "min"    # D
    .param p4, "max"    # D

    .prologue
    .line 240
    cmpl-double v0, p0, p2

    if-ltz v0, :cond_a

    cmpg-double v0, p0, p4

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isInRange(FFF)Z
    .registers 4
    .param p0, "value"    # F
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 201
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_a

    cmpg-float v0, p0, p2

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isInRange(III)Z
    .registers 4
    .param p0, "value"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 188
    if-lt p0, p1, :cond_6

    if-gt p0, p2, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isInRange(JJJ)Z
    .registers 7
    .param p0, "value"    # J
    .param p2, "min"    # J
    .param p4, "max"    # J

    .prologue
    .line 227
    cmp-long v0, p0, p2

    if-ltz v0, :cond_a

    cmp-long v0, p0, p4

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isInRange(SSS)Z
    .registers 4
    .param p0, "value"    # S
    .param p1, "min"    # S
    .param p2, "max"    # S

    .prologue
    .line 214
    if-lt p0, p1, :cond_6

    if-gt p0, p2, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isInt(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isLong(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isShort(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-static {p0}, Lorg/apache/commons/validator/GenericTypeValidator;->formatShort(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isUrl(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 271
    sget-object v0, Lorg/apache/commons/validator/GenericValidator;->URL_VALIDATOR:Lorg/apache/commons/validator/routines/UrlValidator;

    invoke-virtual {v0, p0}, Lorg/apache/commons/validator/routines/UrlValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static matchRegexp(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "regexp"    # Ljava/lang/String;

    .prologue
    .line 67
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_a

    .line 68
    :cond_8
    const/4 v0, 0x0

    .line 71
    :goto_9
    return v0

    :cond_a
    invoke-static {p1, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    goto :goto_9
.end method

.method public static maxLength(Ljava/lang/String;I)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "max"    # I

    .prologue
    .line 282
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static maxLength(Ljava/lang/String;II)Z
    .registers 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "max"    # I
    .param p2, "lineEndLength"    # I

    .prologue
    .line 294
    invoke-static {p0, p2}, Lorg/apache/commons/validator/GenericValidator;->adjustForLineEnding(Ljava/lang/String;I)I

    move-result v0

    .line 295
    .local v0, "adjustAmount":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    if-gt v1, p1, :cond_d

    const/4 v1, 0x1

    :goto_c
    return v1

    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public static maxValue(DD)Z
    .registers 5
    .param p0, "value"    # D
    .param p2, "max"    # D

    .prologue
    .line 421
    cmpg-double v0, p0, p2

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static maxValue(FF)Z
    .registers 3
    .param p0, "value"    # F
    .param p1, "max"    # F

    .prologue
    .line 432
    cmpg-float v0, p0, p1

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static maxValue(II)Z
    .registers 3
    .param p0, "value"    # I
    .param p1, "max"    # I

    .prologue
    .line 399
    if-gt p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static maxValue(JJ)Z
    .registers 5
    .param p0, "value"    # J
    .param p2, "max"    # J

    .prologue
    .line 410
    cmp-long v0, p0, p2

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static minLength(Ljava/lang/String;I)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "min"    # I

    .prologue
    .line 306
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, p1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static minLength(Ljava/lang/String;II)Z
    .registers 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "min"    # I
    .param p2, "lineEndLength"    # I

    .prologue
    .line 318
    invoke-static {p0, p2}, Lorg/apache/commons/validator/GenericValidator;->adjustForLineEnding(Ljava/lang/String;I)I

    move-result v0

    .line 319
    .local v0, "adjustAmount":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    if-lt v1, p1, :cond_d

    const/4 v1, 0x1

    :goto_c
    return v1

    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public static minValue(DD)Z
    .registers 5
    .param p0, "value"    # D
    .param p2, "min"    # D

    .prologue
    .line 377
    cmpl-double v0, p0, p2

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static minValue(FF)Z
    .registers 3
    .param p0, "value"    # F
    .param p1, "min"    # F

    .prologue
    .line 388
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static minValue(II)Z
    .registers 3
    .param p0, "value"    # I
    .param p1, "min"    # I

    .prologue
    .line 355
    if-lt p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static minValue(JJ)Z
    .registers 5
    .param p0, "value"    # J
    .param p2, "min"    # J

    .prologue
    .line 366
    cmp-long v0, p0, p2

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
