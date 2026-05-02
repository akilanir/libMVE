.class public Lfreemarker/template/utility/OptimizerUtil;
.super Ljava/lang/Object;
.source "OptimizerUtil.java"


# static fields
.field private static final INTEGER_MAX:Ljava/math/BigInteger;

.field private static final INTEGER_MIN:Ljava/math/BigInteger;

.field private static final LONG_MAX:Ljava/math/BigInteger;

.field private static final LONG_MIN:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 66
    new-instance v0, Ljava/math/BigInteger;

    const/high16 v1, -0x80000000

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/template/utility/OptimizerUtil;->INTEGER_MIN:Ljava/math/BigInteger;

    .line 67
    new-instance v0, Ljava/math/BigInteger;

    const v1, 0x7fffffff

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/template/utility/OptimizerUtil;->INTEGER_MAX:Ljava/math/BigInteger;

    .line 68
    new-instance v0, Ljava/math/BigInteger;

    const-wide/high16 v1, -0x8000000000000000L

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/template/utility/OptimizerUtil;->LONG_MIN:Ljava/math/BigInteger;

    .line 69
    new-instance v0, Ljava/math/BigInteger;

    const-wide v1, 0x7fffffffffffffffL

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/template/utility/OptimizerUtil;->LONG_MAX:Ljava/math/BigInteger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    return-void
.end method

.method public static optimizeListStorage(Ljava/util/List;)Ljava/util/List;
    .registers 2
    .param p0, "list"    # Ljava/util/List;

    .prologue
    .line 77
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_20

    .line 89
    instance-of v0, p0, Ljava/util/ArrayList;

    if-eqz v0, :cond_11

    move-object v0, p0

    .line 91
    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    .line 93
    :cond_11
    :goto_11
    return-object p0

    .line 81
    :pswitch_12
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_11

    .line 85
    :pswitch_15
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_11

    .line 77
    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
        :pswitch_15
    .end packed-switch
.end method

.method public static optimizeNumberRepresentation(Ljava/lang/Number;)Ljava/lang/Number;
    .registers 7
    .param p0, "number"    # Ljava/lang/Number;

    .prologue
    .line 110
    instance-of v4, p0, Ljava/math/BigDecimal;

    if-eqz v4, :cond_11

    move-object v0, p0

    .line 112
    check-cast v0, Ljava/math/BigDecimal;

    .line 113
    .local v0, "bd":Ljava/math/BigDecimal;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->scale()I

    move-result v4

    if-nez v4, :cond_32

    .line 116
    invoke-virtual {v0}, Ljava/math/BigDecimal;->unscaledValue()Ljava/math/BigInteger;

    move-result-object p0

    .line 128
    .end local v0    # "bd":Ljava/math/BigDecimal;
    :cond_11
    instance-of v4, p0, Ljava/math/BigInteger;

    if-eqz v4, :cond_31

    move-object v1, p0

    .line 130
    check-cast v1, Ljava/math/BigInteger;

    .line 131
    .local v1, "bi":Ljava/math/BigInteger;
    sget-object v4, Lfreemarker/template/utility/OptimizerUtil;->INTEGER_MAX:Ljava/math/BigInteger;

    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-gtz v4, :cond_48

    sget-object v4, Lfreemarker/template/utility/OptimizerUtil;->INTEGER_MIN:Ljava/math/BigInteger;

    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-ltz v4, :cond_48

    .line 134
    new-instance p0, Ljava/lang/Integer;

    .end local p0    # "number":Ljava/lang/Number;
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Ljava/lang/Integer;-><init>(I)V

    .line 142
    :cond_31
    :goto_31
    return-object p0

    .line 120
    .end local v1    # "bi":Ljava/math/BigInteger;
    .restart local v0    # "bd":Ljava/math/BigDecimal;
    .restart local p0    # "number":Ljava/lang/Number;
    :cond_32
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    .line 121
    .local v2, "d":D
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, v2, v4

    if-eqz v4, :cond_11

    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, v2, v4

    if-eqz v4, :cond_11

    .line 124
    new-instance p0, Ljava/lang/Double;

    .end local p0    # "number":Ljava/lang/Number;
    invoke-direct {p0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    goto :goto_31

    .line 136
    .end local v0    # "bd":Ljava/math/BigDecimal;
    .end local v2    # "d":D
    .restart local v1    # "bi":Ljava/math/BigInteger;
    .restart local p0    # "number":Ljava/lang/Number;
    :cond_48
    sget-object v4, Lfreemarker/template/utility/OptimizerUtil;->LONG_MAX:Ljava/math/BigInteger;

    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-gtz v4, :cond_31

    sget-object v4, Lfreemarker/template/utility/OptimizerUtil;->LONG_MIN:Ljava/math/BigInteger;

    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-ltz v4, :cond_31

    .line 139
    new-instance p0, Ljava/lang/Long;

    .end local p0    # "number":Ljava/lang/Number;
    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Ljava/lang/Long;-><init>(J)V

    goto :goto_31
.end method
