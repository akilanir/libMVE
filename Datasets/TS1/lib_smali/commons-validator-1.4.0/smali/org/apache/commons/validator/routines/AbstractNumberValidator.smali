.class public abstract Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.super Lorg/apache/commons/validator/routines/AbstractFormatValidator;
.source "AbstractNumberValidator.java"


# static fields
.field public static final CURRENCY_FORMAT:I = 0x1

.field public static final PERCENT_FORMAT:I = 0x2

.field public static final STANDARD_FORMAT:I = 0x0

.field private static final serialVersionUID:J = -0x2addaf7e2d4ca297L


# instance fields
.field private final allowFractions:Z

.field private final formatType:I


# direct methods
.method public constructor <init>(ZIZ)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I
    .param p3, "allowFractions"    # Z

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;-><init>(Z)V

    .line 63
    iput-boolean p3, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->allowFractions:Z

    .line 64
    iput p2, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->formatType:I

    .line 65
    return-void
.end method


# virtual methods
.method protected determineScale(Ljava/text/NumberFormat;)I
    .registers 8
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    const/4 v3, -0x1

    .line 214
    invoke-virtual {p0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->isStrict()Z

    move-result v4

    if-nez v4, :cond_8

    .line 236
    .end local p1    # "format":Ljava/text/NumberFormat;
    :cond_7
    :goto_7
    return v3

    .line 217
    .restart local p1    # "format":Ljava/text/NumberFormat;
    :cond_8
    invoke-virtual {p0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->isAllowFractions()Z

    move-result v4

    if-eqz v4, :cond_14

    invoke-virtual {p1}, Ljava/text/NumberFormat;->isParseIntegerOnly()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 218
    :cond_14
    const/4 v3, 0x0

    goto :goto_7

    .line 220
    :cond_16
    invoke-virtual {p1}, Ljava/text/NumberFormat;->getMinimumFractionDigits()I

    move-result v1

    .line 221
    .local v1, "minimumFraction":I
    invoke-virtual {p1}, Ljava/text/NumberFormat;->getMaximumFractionDigits()I

    move-result v0

    .line 222
    .local v0, "maximumFraction":I
    if-ne v1, v0, :cond_7

    .line 225
    move v3, v1

    .line 226
    .local v3, "scale":I
    instance-of v4, p1, Ljava/text/DecimalFormat;

    if-eqz v4, :cond_39

    .line 227
    check-cast p1, Ljava/text/DecimalFormat;

    .end local p1    # "format":Ljava/text/NumberFormat;
    invoke-virtual {p1}, Ljava/text/DecimalFormat;->getMultiplier()I

    move-result v2

    .line 228
    .local v2, "multiplier":I
    const/16 v4, 0x64

    if-ne v2, v4, :cond_32

    .line 229
    add-int/lit8 v3, v3, 0x2

    goto :goto_7

    .line 230
    :cond_32
    const/16 v4, 0x3e8

    if-ne v2, v4, :cond_7

    .line 231
    add-int/lit8 v3, v3, 0x3

    goto :goto_7

    .line 233
    .end local v2    # "multiplier":I
    .restart local p1    # "format":Ljava/text/NumberFormat;
    :cond_39
    iget v4, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->formatType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_7

    .line 234
    add-int/lit8 v3, v3, 0x2

    goto :goto_7
.end method

.method protected getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;
    .registers 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v3, 0x1

    .line 189
    const/4 v0, 0x0

    .line 190
    .local v0, "formatter":Ljava/text/NumberFormat;
    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1d

    move v2, v3

    .line 191
    .local v2, "usePattern":Z
    :goto_b
    if-nez v2, :cond_1f

    .line 192
    invoke-virtual {p0, p2}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->getFormat(Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    .end local v0    # "formatter":Ljava/text/NumberFormat;
    check-cast v0, Ljava/text/NumberFormat;

    .line 200
    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    :goto_13
    invoke-virtual {p0, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->determineScale(Ljava/text/NumberFormat;)I

    move-result v4

    if-nez v4, :cond_1c

    .line 201
    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 203
    :cond_1c
    return-object v0

    .line 190
    .end local v2    # "usePattern":Z
    :cond_1d
    const/4 v2, 0x0

    goto :goto_b

    .line 193
    .restart local v2    # "usePattern":Z
    :cond_1f
    if-nez p2, :cond_27

    .line 194
    new-instance v0, Ljava/text/DecimalFormat;

    .end local v0    # "formatter":Ljava/text/NumberFormat;
    invoke-direct {v0, p1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    goto :goto_13

    .line 196
    :cond_27
    new-instance v1, Ljava/text/DecimalFormatSymbols;

    invoke-direct {v1, p2}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 197
    .local v1, "symbols":Ljava/text/DecimalFormatSymbols;
    new-instance v0, Ljava/text/DecimalFormat;

    .end local v0    # "formatter":Ljava/text/NumberFormat;
    invoke-direct {v0, p1, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .restart local v0    # "formatter":Ljava/text/NumberFormat;
    goto :goto_13
.end method

.method protected getFormat(Ljava/util/Locale;)Ljava/text/Format;
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 247
    const/4 v0, 0x0

    .line 248
    .local v0, "formatter":Ljava/text/NumberFormat;
    iget v1, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->formatType:I

    packed-switch v1, :pswitch_data_2a

    .line 264
    if-nez p1, :cond_25

    .line 265
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    .line 271
    :goto_c
    return-object v0

    .line 250
    :pswitch_d
    if-nez p1, :cond_14

    .line 251
    invoke-static {}, Ljava/text/NumberFormat;->getCurrencyInstance()Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_c

    .line 253
    :cond_14
    invoke-static {p1}, Ljava/text/NumberFormat;->getCurrencyInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 255
    goto :goto_c

    .line 257
    :pswitch_19
    if-nez p1, :cond_20

    .line 258
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_c

    .line 260
    :cond_20
    invoke-static {p1}, Ljava/text/NumberFormat;->getPercentInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 262
    goto :goto_c

    .line 267
    :cond_25
    invoke-static {p1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_c

    .line 248
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_19
    .end packed-switch
.end method

.method public getFormatType()I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->formatType:I

    return v0
.end method

.method public isAllowFractions()Z
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->allowFractions:Z

    return v0
.end method

.method public isInRange(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Number;
    .param p2, "min"    # Ljava/lang/Number;
    .param p3, "max"    # Ljava/lang/Number;

    .prologue
    .line 112
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->minValue(Ljava/lang/Number;Ljava/lang/Number;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1, p3}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->maxValue(Ljava/lang/Number;Ljava/lang/Number;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 98
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    .line 99
    .local v0, "parsedValue":Ljava/lang/Object;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return v1

    :cond_8
    const/4 v1, 0x1

    goto :goto_7
.end method

.method public maxValue(Ljava/lang/Number;Ljava/lang/Number;)Z
    .registers 9
    .param p1, "value"    # Ljava/lang/Number;
    .param p2, "max"    # Ljava/lang/Number;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 140
    invoke-virtual {p0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->isAllowFractions()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 141
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    cmpg-double v2, v2, v4

    if-gtz v2, :cond_15

    .line 143
    :cond_14
    :goto_14
    return v0

    :cond_15
    move v0, v1

    .line 141
    goto :goto_14

    .line 143
    :cond_17
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_14

    move v0, v1

    goto :goto_14
.end method

.method public minValue(Ljava/lang/Number;Ljava/lang/Number;)Z
    .registers 9
    .param p1, "value"    # Ljava/lang/Number;
    .param p2, "min"    # Ljava/lang/Number;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 124
    invoke-virtual {p0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->isAllowFractions()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 125
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_15

    .line 127
    :cond_14
    :goto_14
    return v0

    :cond_15
    move v0, v1

    .line 125
    goto :goto_14

    .line 127
    :cond_17
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_14

    move v0, v1

    goto :goto_14
.end method

.method protected parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v1, 0x0

    .line 158
    if-nez p1, :cond_d

    move-object p1, v1

    .line 159
    :goto_4
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_12

    .line 163
    :cond_c
    :goto_c
    return-object v1

    .line 158
    :cond_d
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_4

    .line 162
    :cond_12
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    .line 163
    .local v0, "formatter":Ljava/text/Format;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c
.end method

.method protected abstract processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
.end method
