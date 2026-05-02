.class Lfreemarker/core/NumericalBuiltins$absBI;
.super Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "absBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 176
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;-><init>(Lfreemarker/core/NumericalBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "num"    # Ljava/lang/Number;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 178
    instance-of v2, p1, Ljava/lang/Integer;

    if-eqz v2, :cond_13

    .line 179
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 180
    .local v0, "n":I
    if-gez v0, :cond_12

    .line 181
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-int v2, v0

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    .line 232
    .end local v0    # "n":I
    :cond_12
    :goto_12
    return-object p2

    .line 185
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_13
    instance-of v2, p1, Ljava/math/BigDecimal;

    if-eqz v2, :cond_2a

    move-object v0, p1

    .line 186
    check-cast v0, Ljava/math/BigDecimal;

    .line 187
    .local v0, "n":Ljava/math/BigDecimal;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->signum()I

    move-result v2

    if-gez v2, :cond_12

    .line 188
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->negate()Ljava/math/BigDecimal;

    move-result-object v2

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_12

    .line 192
    .end local v0    # "n":Ljava/math/BigDecimal;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_2a
    instance-of v2, p1, Ljava/lang/Double;

    if-eqz v2, :cond_41

    .line 193
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 194
    .local v0, "n":D
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gez v2, :cond_12

    .line 195
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-double v2, v0

    invoke-direct {p2, v2, v3}, Lfreemarker/template/SimpleNumber;-><init>(D)V

    goto :goto_12

    .line 199
    .end local v0    # "n":D
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_41
    instance-of v2, p1, Ljava/lang/Float;

    if-eqz v2, :cond_57

    .line 200
    check-cast p1, Ljava/lang/Float;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 201
    .local v0, "n":F
    const/4 v2, 0x0

    cmpg-float v2, v0, v2

    if-gez v2, :cond_12

    .line 202
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-float v2, v0

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(F)V

    goto :goto_12

    .line 206
    .end local v0    # "n":F
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_57
    instance-of v2, p1, Ljava/lang/Long;

    if-eqz v2, :cond_6e

    .line 207
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 208
    .local v0, "n":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_12

    .line 209
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-long v2, v0

    invoke-direct {p2, v2, v3}, Lfreemarker/template/SimpleNumber;-><init>(J)V

    goto :goto_12

    .line 213
    .end local v0    # "n":J
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_6e
    instance-of v2, p1, Ljava/lang/Short;

    if-eqz v2, :cond_81

    .line 214
    check-cast p1, Ljava/lang/Short;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    .line 215
    .local v0, "n":S
    if-gez v0, :cond_12

    .line 216
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-int v2, v0

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    goto :goto_12

    .line 220
    .end local v0    # "n":S
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_81
    instance-of v2, p1, Ljava/lang/Byte;

    if-eqz v2, :cond_95

    .line 221
    check-cast p1, Ljava/lang/Byte;

    .end local p1    # "num":Ljava/lang/Number;
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    .line 222
    .local v0, "n":B
    if-gez v0, :cond_12

    .line 223
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    neg-int v2, v0

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    goto/16 :goto_12

    .line 227
    .end local v0    # "n":B
    .restart local p1    # "num":Ljava/lang/Number;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_95
    instance-of v2, p1, Ljava/math/BigInteger;

    if-eqz v2, :cond_ad

    move-object v0, p1

    .line 228
    check-cast v0, Ljava/math/BigInteger;

    .line 229
    .local v0, "n":Ljava/math/BigInteger;
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v2

    if-gez v2, :cond_12

    .line 230
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v2

    invoke-direct {p2, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto/16 :goto_12

    .line 235
    .end local v0    # "n":Ljava/math/BigInteger;
    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_ad
    new-instance v2, Lfreemarker/core/_TemplateModelException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Unsupported number class: "

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-direct {v2, v3}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v2
.end method
