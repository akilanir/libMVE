.class public Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;
.super Lfreemarker/core/ArithmeticEngine;
.source "ArithmeticEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ArithmeticEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BigDecimalEngine"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 140
    invoke-direct {p0}, Lfreemarker/core/ArithmeticEngine;-><init>()V

    return-void
.end method

.method private divide(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 7
    .param p1, "left"    # Ljava/math/BigDecimal;
    .param p2, "right"    # Ljava/math/BigDecimal;

    .prologue
    .line 200
    invoke-virtual {p1}, Ljava/math/BigDecimal;->scale()I

    move-result v1

    .line 201
    .local v1, "scale1":I
    invoke-virtual {p2}, Ljava/math/BigDecimal;->scale()I

    move-result v2

    .line 202
    .local v2, "scale2":I
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 203
    .local v0, "scale":I
    iget v3, p0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->minScale:I

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 204
    iget v3, p0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->roundingPolicy:I

    invoke-virtual {p1, p2, v0, v3}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;II)Ljava/math/BigDecimal;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public add(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 6
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    .line 162
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 163
    .local v0, "left":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 164
    .local v1, "right":Ljava/math/BigDecimal;
    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method public compareNumbers(Ljava/lang/Number;Ljava/lang/Number;)I
    .registers 8
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    const/4 v4, 0x0

    .line 148
    invoke-static {p1}, Lfreemarker/template/utility/NumberUtil;->getSignum(Ljava/lang/Number;)I

    move-result v0

    .line 149
    .local v0, "firstSignum":I
    invoke-static {p2}, Lfreemarker/template/utility/NumberUtil;->getSignum(Ljava/lang/Number;)I

    move-result v3

    .line 150
    .local v3, "secondSignum":I
    if-eq v0, v3, :cond_13

    .line 151
    if-ge v0, v3, :cond_f

    const/4 v4, -0x1

    .line 157
    :cond_e
    :goto_e
    return v4

    .line 151
    :cond_f
    if-le v0, v3, :cond_e

    const/4 v4, 0x1

    goto :goto_e

    .line 152
    :cond_13
    if-nez v0, :cond_17

    if-eqz v3, :cond_e

    .line 155
    :cond_17
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 156
    .local v1, "left":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 157
    .local v2, "right":Ljava/math/BigDecimal;
    invoke-virtual {v1, v2}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    goto :goto_e
.end method

.method public divide(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 6
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    .line 184
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 185
    .local v0, "left":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 186
    .local v1, "right":Ljava/math/BigDecimal;
    invoke-direct {p0, v0, v1}, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->divide(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method public modulus(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 10
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    .line 190
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 191
    .local v0, "left":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 192
    .local v2, "right":J
    new-instance v4, Ljava/lang/Long;

    rem-long v5, v0, v2

    invoke-direct {v4, v5, v6}, Ljava/lang/Long;-><init>(J)V

    return-object v4
.end method

.method public multiply(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 8
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    .line 174
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 175
    .local v0, "left":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 176
    .local v2, "right":Ljava/math/BigDecimal;
    invoke-virtual {v0, v2}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 177
    .local v1, "result":Ljava/math/BigDecimal;
    invoke-virtual {v1}, Ljava/math/BigDecimal;->scale()I

    move-result v3

    iget v4, p0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->maxScale:I

    if-le v3, v4, :cond_1c

    .line 178
    iget v3, p0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->maxScale:I

    iget v4, p0, Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;->roundingPolicy:I

    invoke-virtual {v1, v3, v4}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v1

    .line 180
    :cond_1c
    return-object v1
.end method

.method public subtract(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 6
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;

    .prologue
    .line 168
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 169
    .local v0, "left":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 170
    .local v1, "right":Ljava/math/BigDecimal;
    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method public toNumber(Ljava/lang/String;)Ljava/lang/Number;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 196
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
