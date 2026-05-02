.class public abstract Lfreemarker/core/ArithmeticEngine;
.super Ljava/lang/Object;
.source "ArithmeticEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/ArithmeticEngine$ConservativeEngine;,
        Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;
    }
.end annotation


# static fields
.field public static final BIGDECIMAL_ENGINE:Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

.field public static final CONSERVATIVE_ENGINE:Lfreemarker/core/ArithmeticEngine$ConservativeEngine;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;

.field static class$java$math$BigInteger:Ljava/lang/Class;


# instance fields
.field protected maxScale:I

.field protected minScale:I

.field protected roundingPolicy:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 77
    new-instance v0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

    invoke-direct {v0}, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;-><init>()V

    sput-object v0, Lfreemarker/core/ArithmeticEngine;->BIGDECIMAL_ENGINE:Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

    .line 83
    new-instance v0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;

    invoke-direct {v0}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;-><init>()V

    sput-object v0, Lfreemarker/core/ArithmeticEngine;->CONSERVATIVE_ENGINE:Lfreemarker/core/ArithmeticEngine$ConservativeEngine;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/16 v0, 0xc

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput v0, p0, Lfreemarker/core/ArithmeticEngine;->minScale:I

    .line 94
    iput v0, p0, Lfreemarker/core/ArithmeticEngine;->maxScale:I

    .line 95
    const/4 v0, 0x4

    iput v0, p0, Lfreemarker/core/ArithmeticEngine;->roundingPolicy:I

    .line 226
    return-void
.end method

.method static access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;
    .registers 2
    .param p0, "x0"    # Ljava/lang/Number;

    .prologue
    .line 71
    invoke-static {p0}, Lfreemarker/core/ArithmeticEngine;->toBigDecimal(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 488
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

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static toBigDecimal(Ljava/lang/Number;)Ljava/math/BigDecimal;
    .registers 5
    .param p0, "num"    # Ljava/lang/Number;

    .prologue
    .line 546
    :try_start_0
    instance-of v1, p0, Ljava/math/BigDecimal;

    if-eqz v1, :cond_7

    check-cast p0, Ljava/math/BigDecimal;

    .end local p0    # "num":Ljava/lang/Number;
    :goto_6
    return-object p0

    .restart local p0    # "num":Ljava/lang/Number;
    :cond_7
    new-instance v1, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_10} :catch_12

    move-object p0, v1

    goto :goto_6

    .line 547
    :catch_12
    move-exception v0

    .line 549
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Can\'t parse this as BigDecimal number: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p0}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public abstract add(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public abstract compareNumbers(Ljava/lang/Number;Ljava/lang/Number;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public abstract divide(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public abstract modulus(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public abstract multiply(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public setMaxScale(I)V
    .registers 4
    .param p1, "maxScale"    # I

    .prologue
    .line 113
    iget v0, p0, Lfreemarker/core/ArithmeticEngine;->minScale:I

    if-ge p1, v0, :cond_c

    .line 114
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxScale < minScale"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_c
    iput p1, p0, Lfreemarker/core/ArithmeticEngine;->maxScale:I

    .line 117
    return-void
.end method

.method public setMinScale(I)V
    .registers 4
    .param p1, "minScale"    # I

    .prologue
    .line 102
    if-gez p1, :cond_a

    .line 103
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "minScale < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_a
    iput p1, p0, Lfreemarker/core/ArithmeticEngine;->minScale:I

    .line 106
    return-void
.end method

.method public setRoundingPolicy(I)V
    .registers 4
    .param p1, "roundingPolicy"    # I

    .prologue
    .line 120
    const/4 v0, 0x2

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x7

    if-eq p1, v0, :cond_1f

    if-eqz p1, :cond_1f

    .line 129
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid rounding policy"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_1f
    iput p1, p0, Lfreemarker/core/ArithmeticEngine;->roundingPolicy:I

    .line 133
    return-void
.end method

.method public abstract subtract(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method

.method public abstract toNumber(Ljava/lang/String;)Ljava/lang/Number;
.end method
