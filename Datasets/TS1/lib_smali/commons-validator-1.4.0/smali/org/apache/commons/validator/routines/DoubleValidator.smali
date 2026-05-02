.class public Lorg/apache/commons/validator/routines/DoubleValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "DoubleValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/DoubleValidator;

.field private static final serialVersionUID:J = 0x516f225374709702L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 69
    new-instance v0, Lorg/apache/commons/validator/routines/DoubleValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/DoubleValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/DoubleValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/DoubleValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/DoubleValidator;-><init>(ZI)V

    .line 84
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I

    .prologue
    .line 108
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;-><init>(ZIZ)V

    .line 109
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/DoubleValidator;
    .registers 1

    .prologue
    .line 76
    sget-object v0, Lorg/apache/commons/validator/routines/DoubleValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/DoubleValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(DDD)Z
    .registers 8
    .param p1, "value"    # D
    .param p3, "min"    # D
    .param p5, "max"    # D

    .prologue
    .line 171
    cmpl-double v0, p1, p3

    if-ltz v0, :cond_a

    cmpg-double v0, p1, p5

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInRange(Ljava/lang/Double;DD)Z
    .registers 13
    .param p1, "value"    # Ljava/lang/Double;
    .param p2, "min"    # D
    .param p4, "max"    # D

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    move-object v0, p0

    move-wide v3, p2

    move-wide v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/apache/commons/validator/routines/DoubleValidator;->isInRange(DDD)Z

    move-result v0

    return v0
.end method

.method public maxValue(DD)Z
    .registers 6
    .param p1, "value"    # D
    .param p3, "max"    # D

    .prologue
    .line 220
    cmpg-double v0, p1, p3

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public maxValue(Ljava/lang/Double;D)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/Double;
    .param p2, "max"    # D

    .prologue
    .line 232
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2, p3}, Lorg/apache/commons/validator/routines/DoubleValidator;->maxValue(DD)Z

    move-result v0

    return v0
.end method

.method public minValue(DD)Z
    .registers 6
    .param p1, "value"    # D
    .param p3, "min"    # D

    .prologue
    .line 196
    cmpl-double v0, p1, p3

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public minValue(Ljava/lang/Double;D)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/Double;
    .param p2, "min"    # D

    .prologue
    .line 208
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2, p3}, Lorg/apache/commons/validator/routines/DoubleValidator;->minValue(DD)Z

    move-result v0

    return v0
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 245
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_5

    .line 248
    .end local p1    # "value":Ljava/lang/Object;
    :goto_4
    return-object p1

    .restart local p1    # "value":Ljava/lang/Object;
    :cond_5
    new-instance v0, Ljava/lang/Double;

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    move-object p1, v0

    goto :goto_4
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Double;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 120
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/DoubleValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/DoubleValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Double;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/DoubleValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Double;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/DoubleValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method
