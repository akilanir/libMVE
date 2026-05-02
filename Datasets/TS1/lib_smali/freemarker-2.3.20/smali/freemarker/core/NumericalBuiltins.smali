.class Lfreemarker/core/NumericalBuiltins;
.super Ljava/lang/Object;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/NumericalBuiltins$1;,
        Lfreemarker/core/NumericalBuiltins$number_to_dateBI;,
        Lfreemarker/core/NumericalBuiltins$is_infiniteBI;,
        Lfreemarker/core/NumericalBuiltins$is_nanBI;,
        Lfreemarker/core/NumericalBuiltins$absBI;,
        Lfreemarker/core/NumericalBuiltins$roundBI;,
        Lfreemarker/core/NumericalBuiltins$ceilingBI;,
        Lfreemarker/core/NumericalBuiltins$floorBI;,
        Lfreemarker/core/NumericalBuiltins$doubleBI;,
        Lfreemarker/core/NumericalBuiltins$floatBI;,
        Lfreemarker/core/NumericalBuiltins$longBI;,
        Lfreemarker/core/NumericalBuiltins$intBI;,
        Lfreemarker/core/NumericalBuiltins$shortBI;,
        Lfreemarker/core/NumericalBuiltins$byteBI;,
        Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
    }
.end annotation


# static fields
.field private static final BIG_DECIMAL_LONG_MAX:Ljava/math/BigDecimal;

.field private static final BIG_DECIMAL_LONG_MIN:Ljava/math/BigDecimal;

.field private static final BIG_DECIMAL_ONE:Ljava/math/BigDecimal;

.field private static final BIG_INTEGER_LONG_MAX:Ljava/math/BigInteger;

.field private static final BIG_INTEGER_LONG_MIN:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const-wide v4, 0x7fffffffffffffffL

    const-wide/high16 v2, -0x8000000000000000L

    .line 155
    new-instance v0, Ljava/math/BigDecimal;

    const-string v1, "1"

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_ONE:Ljava/math/BigDecimal;

    .line 253
    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v0

    sput-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_LONG_MIN:Ljava/math/BigDecimal;

    .line 254
    invoke-static {v4, v5}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v0

    sput-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_LONG_MAX:Ljava/math/BigDecimal;

    .line 255
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_INTEGER_LONG_MIN:Ljava/math/BigInteger;

    .line 256
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_INTEGER_LONG_MAX:Ljava/math/BigInteger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$100()Ljava/math/BigDecimal;
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_ONE:Ljava/math/BigDecimal;

    return-object v0
.end method

.method static access$200(Ljava/lang/Number;)J
    .registers 3
    .param p0, "x0"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-static {p0}, Lfreemarker/core/NumericalBuiltins;->safeToLong(Ljava/lang/Number;)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final safeToLong(Ljava/lang/Number;)J
    .registers 11
    .param p0, "num"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 259
    instance-of v5, p0, Ljava/lang/Double;

    if-eqz v5, :cond_33

    .line 260
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v5

    long-to-double v2, v5

    .line 261
    .local v2, "d":D
    const-wide/high16 v5, 0x43e0000000000000L    # 9.223372036854776E18

    cmpl-double v5, v2, v5

    if-gtz v5, :cond_1e

    const-wide/high16 v5, -0x3c20000000000000L    # -9.223372036854776E18

    cmpg-double v5, v2, v5

    if-gez v5, :cond_31

    .line 262
    :cond_1e
    new-instance v5, Lfreemarker/core/_TemplateModelException;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "Number doesn\'t fit into a 64 bit signed integer (long): "

    aput-object v7, v6, v8

    new-instance v7, Ljava/lang/Double;

    invoke-direct {v7, v2, v3}, Ljava/lang/Double;-><init>(D)V

    aput-object v7, v6, v9

    invoke-direct {v5, v6}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v5

    .line 265
    :cond_31
    double-to-long v5, v2

    .line 292
    .end local v2    # "d":D
    .restart local p0    # "num":Ljava/lang/Number;
    :goto_32
    return-wide v5

    .line 267
    :cond_33
    instance-of v5, p0, Ljava/lang/Float;

    if-eqz v5, :cond_63

    .line 268
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v4, v5

    .line 269
    .local v4, "f":F
    const/high16 v5, 0x5f000000

    cmpl-float v5, v4, v5

    if-gtz v5, :cond_4e

    const/high16 v5, -0x21000000

    cmpg-float v5, v4, v5

    if-gez v5, :cond_61

    .line 270
    :cond_4e
    new-instance v5, Lfreemarker/core/_TemplateModelException;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "Number doesn\'t fit into a 64 bit signed integer (long): "

    aput-object v7, v6, v8

    new-instance v7, Ljava/lang/Float;

    invoke-direct {v7, v4}, Ljava/lang/Float;-><init>(F)V

    aput-object v7, v6, v9

    invoke-direct {v5, v6}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v5

    .line 273
    :cond_61
    float-to-long v5, v4

    goto :goto_32

    .line 275
    .end local v4    # "f":F
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_63
    instance-of v5, p0, Ljava/math/BigDecimal;

    if-eqz v5, :cond_91

    .line 276
    check-cast p0, Ljava/math/BigDecimal;

    .end local p0    # "num":Ljava/lang/Number;
    const/4 v5, 0x4

    invoke-virtual {p0, v8, v5}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    .line 277
    .local v0, "bd":Ljava/math/BigDecimal;
    sget-object v5, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_LONG_MAX:Ljava/math/BigDecimal;

    invoke-virtual {v0, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    if-gtz v5, :cond_7e

    sget-object v5, Lfreemarker/core/NumericalBuiltins;->BIG_DECIMAL_LONG_MIN:Ljava/math/BigDecimal;

    invoke-virtual {v0, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    if-gez v5, :cond_8c

    .line 278
    :cond_7e
    new-instance v5, Lfreemarker/core/_TemplateModelException;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "Number doesn\'t fit into a 64 bit signed integer (long): "

    aput-object v7, v6, v8

    aput-object v0, v6, v9

    invoke-direct {v5, v6}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v5

    .line 281
    :cond_8c
    invoke-virtual {v0}, Ljava/math/BigDecimal;->longValue()J

    move-result-wide v5

    goto :goto_32

    .line 283
    .end local v0    # "bd":Ljava/math/BigDecimal;
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_91
    instance-of v5, p0, Ljava/math/BigInteger;

    if-eqz v5, :cond_bc

    move-object v1, p0

    .line 284
    check-cast v1, Ljava/math/BigInteger;

    .line 285
    .local v1, "bi":Ljava/math/BigInteger;
    sget-object v5, Lfreemarker/core/NumericalBuiltins;->BIG_INTEGER_LONG_MAX:Ljava/math/BigInteger;

    invoke-virtual {v1, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v5

    if-gtz v5, :cond_a8

    sget-object v5, Lfreemarker/core/NumericalBuiltins;->BIG_INTEGER_LONG_MIN:Ljava/math/BigInteger;

    invoke-virtual {v1, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v5

    if-gez v5, :cond_b6

    .line 286
    :cond_a8
    new-instance v5, Lfreemarker/core/_TemplateModelException;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "Number doesn\'t fit into a 64 bit signed integer (long): "

    aput-object v7, v6, v8

    aput-object v1, v6, v9

    invoke-direct {v5, v6}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v5

    .line 289
    :cond_b6
    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v5

    goto/16 :goto_32

    .line 291
    .end local v1    # "bi":Ljava/math/BigInteger;
    :cond_bc
    instance-of v5, p0, Ljava/lang/Long;

    if-nez v5, :cond_cc

    instance-of v5, p0, Ljava/lang/Integer;

    if-nez v5, :cond_cc

    instance-of v5, p0, Ljava/lang/Byte;

    if-nez v5, :cond_cc

    instance-of v5, p0, Ljava/lang/Short;

    if-eqz v5, :cond_d2

    .line 292
    :cond_cc
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    goto/16 :goto_32

    .line 295
    :cond_d2
    new-instance v5, Lfreemarker/core/_TemplateModelException;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "Unsupported number type: "

    aput-object v7, v6, v8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-direct {v5, v6}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v5
.end method
