.class public Lorg/apache/commons/validator/routines/FloatValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "FloatValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/FloatValidator;

.field private static final serialVersionUID:J = -0x3ea244cf169497bbL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 69
    new-instance v0, Lorg/apache/commons/validator/routines/FloatValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/FloatValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/FloatValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/FloatValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/FloatValidator;-><init>(ZI)V

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

.method public static getInstance()Lorg/apache/commons/validator/routines/FloatValidator;
    .registers 1

    .prologue
    .line 76
    sget-object v0, Lorg/apache/commons/validator/routines/FloatValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/FloatValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(FFF)Z
    .registers 5
    .param p1, "value"    # F
    .param p2, "min"    # F
    .param p3, "max"    # F

    .prologue
    .line 171
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_a

    cmpg-float v0, p1, p3

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInRange(Ljava/lang/Float;FF)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Float;
    .param p2, "min"    # F
    .param p3, "max"    # F

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/validator/routines/FloatValidator;->isInRange(FFF)Z

    move-result v0

    return v0
.end method

.method public maxValue(FF)Z
    .registers 4
    .param p1, "value"    # F
    .param p2, "max"    # F

    .prologue
    .line 220
    cmpg-float v0, p1, p2

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public maxValue(Ljava/lang/Float;F)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Float;
    .param p2, "max"    # F

    .prologue
    .line 232
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/FloatValidator;->maxValue(FF)Z

    move-result v0

    return v0
.end method

.method public minValue(FF)Z
    .registers 4
    .param p1, "value"    # F
    .param p2, "min"    # F

    .prologue
    .line 196
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public minValue(Ljava/lang/Float;F)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Float;
    .param p2, "min"    # F

    .prologue
    .line 208
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/FloatValidator;->minValue(FF)Z

    move-result v0

    return v0
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 15
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    const-wide v10, 0x47efffffe0000000L    # 3.4028234663852886E38

    const-wide/high16 v8, 0x36a0000000000000L    # 1.401298464324817E-45

    const-wide/16 v6, 0x0

    const/4 v4, 0x0

    .line 246
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 248
    .local v0, "doubleValue":D
    cmpl-double v5, v0, v6

    if-lez v5, :cond_24

    .line 249
    cmpg-double v5, v0, v8

    if-gez v5, :cond_19

    .line 265
    :cond_18
    :goto_18
    return-object v4

    .line 252
    :cond_19
    cmpl-double v5, v0, v10

    if-gtz v5, :cond_18

    .line 265
    :cond_1d
    new-instance v4, Ljava/lang/Float;

    double-to-float v5, v0

    invoke-direct {v4, v5}, Ljava/lang/Float;-><init>(F)V

    goto :goto_18

    .line 255
    :cond_24
    cmpg-double v5, v0, v6

    if-gez v5, :cond_1d

    .line 256
    const-wide/high16 v5, -0x4010000000000000L    # -1.0

    mul-double v2, v0, v5

    .line 257
    .local v2, "posDouble":D
    cmpg-double v5, v2, v8

    if-ltz v5, :cond_18

    .line 260
    cmpl-double v5, v2, v10

    if-lez v5, :cond_1d

    goto :goto_18
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Float;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 120
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/FloatValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Float;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/FloatValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Float;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/FloatValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Float;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/FloatValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method
