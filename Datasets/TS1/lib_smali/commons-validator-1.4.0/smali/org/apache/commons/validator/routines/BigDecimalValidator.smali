.class public Lorg/apache/commons/validator/routines/BigDecimalValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "BigDecimalValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/BigDecimalValidator;

.field private static final serialVersionUID:J = -0x94d755146e86014L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    new-instance v0, Lorg/apache/commons/validator/routines/BigDecimalValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/BigDecimalValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/BigDecimalValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/BigDecimalValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/BigDecimalValidator;-><init>(Z)V

    .line 88
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 4
    .param p1, "strict"    # Z

    .prologue
    .line 97
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/BigDecimalValidator;-><init>(ZIZ)V

    .line 98
    return-void
.end method

.method protected constructor <init>(ZIZ)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I
    .param p3, "allowFractions"    # Z

    .prologue
    .line 125
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;-><init>(ZIZ)V

    .line 126
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/BigDecimalValidator;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lorg/apache/commons/validator/routines/BigDecimalValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/BigDecimalValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(Ljava/math/BigDecimal;DD)Z
    .registers 8
    .param p1, "value"    # Ljava/math/BigDecimal;
    .param p2, "min"    # D
    .param p4, "max"    # D

    .prologue
    .line 189
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    cmpl-double v0, v0, p2

    if-ltz v0, :cond_12

    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    cmpg-double v0, v0, p4

    if-gtz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public maxValue(Ljava/math/BigDecimal;D)Z
    .registers 6
    .param p1, "value"    # Ljava/math/BigDecimal;
    .param p2, "max"    # D

    .prologue
    .line 213
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    cmpg-double v0, v0, p2

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public minValue(Ljava/math/BigDecimal;D)Z
    .registers 6
    .param p1, "value"    # Ljava/math/BigDecimal;
    .param p2, "min"    # D

    .prologue
    .line 201
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    cmpl-double v0, v0, p2

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 225
    const/4 v0, 0x0

    .line 226
    .local v0, "decimal":Ljava/math/BigDecimal;
    instance-of v2, p1, Ljava/lang/Long;

    if-eqz v2, :cond_1d

    .line 227
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v0

    .line 232
    :goto_f
    check-cast p2, Ljava/text/NumberFormat;

    .end local p2    # "formatter":Ljava/text/Format;
    invoke-virtual {p0, p2}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->determineScale(Ljava/text/NumberFormat;)I

    move-result v1

    .line 233
    .local v1, "scale":I
    if-ltz v1, :cond_1c

    .line 234
    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    .line 237
    :cond_1c
    return-object v0

    .line 229
    .end local v1    # "scale":I
    .restart local p1    # "value":Ljava/lang/Object;
    .restart local p2    # "formatter":Ljava/text/Format;
    :cond_1d
    new-instance v0, Ljava/math/BigDecimal;

    .end local v0    # "decimal":Ljava/math/BigDecimal;
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .restart local v0    # "decimal":Ljava/math/BigDecimal;
    goto :goto_f
.end method

.method public validate(Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 137
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigDecimal;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 150
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigDecimal;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/math/BigDecimal;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 176
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigDecimal;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 162
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/BigDecimalValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigDecimal;

    return-object v0
.end method
