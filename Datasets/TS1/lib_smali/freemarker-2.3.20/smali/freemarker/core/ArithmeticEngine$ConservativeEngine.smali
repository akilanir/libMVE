.class public Lfreemarker/core/ArithmeticEngine$ConservativeEngine;
.super Lfreemarker/core/ArithmeticEngine;
.source "ArithmeticEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ArithmeticEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConservativeEngine"
.end annotation


# static fields
.field private static final BIGDECIMAL:I = 0x5

.field private static final BIGINTEGER:I = 0x4

.field private static final DOUBLE:I = 0x3

.field private static final FLOAT:I = 0x2

.field private static final INTEGER:I = 0x0

.field private static final LONG:I = 0x1

.field private static final classCodes:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 234
    invoke-static {}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->createClassCodesMap()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->classCodes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 226
    invoke-direct {p0}, Lfreemarker/core/ArithmeticEngine;-><init>()V

    return-void
.end method

.method private static createClassCodesMap()Ljava/util/Map;
    .registers 5

    .prologue
    .line 486
    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 487
    .local v1, "map":Ljava/util/Map;
    new-instance v0, Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    .line 488
    .local v0, "intcode":Ljava/lang/Integer;
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_a4

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_19
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_a8

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Short:Ljava/lang/Class;

    :goto_28
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v2, :cond_ac

    const-string v2, "java.lang.Integer"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_37
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v2, :cond_af

    const-string v2, "java.lang.Long"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Long:Ljava/lang/Class;

    :goto_46
    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v2, :cond_b2

    const-string v2, "java.lang.Float"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Float:Ljava/lang/Class;

    :goto_5b
    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v2, :cond_b5

    const-string v2, "java.lang.Double"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Double:Ljava/lang/Class;

    :goto_70
    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v2, :cond_b8

    const-string v2, "java.math.BigInteger"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_85
    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v2, :cond_bb

    const-string v2, "java.math.BigDecimal"

    invoke-static {v2}, Lfreemarker/core/ArithmeticEngine;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_9a
    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    return-object v1

    .line 488
    :cond_a4
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_19

    .line 489
    :cond_a8
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_28

    .line 490
    :cond_ac
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_37

    .line 491
    :cond_af
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_46

    .line 492
    :cond_b2
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_5b

    .line 493
    :cond_b5
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_70

    .line 494
    :cond_b8
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigInteger:Ljava/lang/Class;

    goto :goto_85

    .line 495
    :cond_bb
    sget-object v2, Lfreemarker/core/ArithmeticEngine;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_9a
.end method

.method private static getClassCode(Ljava/lang/Number;)I
    .registers 6
    .param p0, "num"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 501
    :try_start_0
    sget-object v1, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->classCodes:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_f
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_f} :catch_11

    move-result v1

    return v1

    .line 503
    :catch_11
    move-exception v0

    .line 504
    .local v0, "e":Ljava/lang/NullPointerException;
    if-nez p0, :cond_1c

    .line 505
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    const-string v2, "The Number object was null."

    invoke-direct {v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 507
    :cond_1c
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Unknown number type "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>([Ljava/lang/Object;)V

    throw v1
.end method

.method private static getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I
    .registers 8
    .param p0, "num1"    # Ljava/lang/Number;
    .param p1, "num2"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 514
    invoke-static {p0}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getClassCode(Ljava/lang/Number;)I

    move-result v1

    .line 515
    .local v1, "c1":I
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getClassCode(Ljava/lang/Number;)I

    move-result v2

    .line 516
    .local v2, "c2":I
    if-le v1, v2, :cond_10

    move v0, v1

    .line 521
    .local v0, "c":I
    :goto_c
    packed-switch v0, :pswitch_data_28

    .line 536
    .end local v0    # "c":I
    .end local v1    # "c1":I
    :cond_f
    :goto_f
    :pswitch_f
    return v0

    .restart local v1    # "c1":I
    :cond_10
    move v0, v2

    .line 516
    goto :goto_c

    .line 523
    .restart local v0    # "c":I
    :pswitch_12
    if-ge v1, v2, :cond_19

    .end local v1    # "c1":I
    :goto_14
    const/4 v5, 0x1

    if-ne v1, v5, :cond_f

    move v0, v4

    .line 524
    goto :goto_f

    .restart local v1    # "c1":I
    :cond_19
    move v1, v2

    .line 523
    goto :goto_14

    .line 529
    :pswitch_1b
    if-ge v1, v2, :cond_25

    move v3, v1

    .line 530
    .local v3, "min":I
    :goto_1e
    if-eq v3, v4, :cond_23

    const/4 v4, 0x2

    if-ne v3, v4, :cond_f

    .line 531
    :cond_23
    const/4 v0, 0x5

    goto :goto_f

    .end local v3    # "min":I
    :cond_25
    move v3, v2

    .line 529
    goto :goto_1e

    .line 521
    nop

    :pswitch_data_28
    .packed-switch 0x2
        :pswitch_12
        :pswitch_f
        :pswitch_1b
    .end packed-switch
.end method

.method private static toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;
    .registers 3
    .param p0, "num"    # Ljava/lang/Number;

    .prologue
    .line 540
    instance-of v0, p0, Ljava/math/BigInteger;

    if-eqz v0, :cond_7

    check-cast p0, Ljava/math/BigInteger;

    .end local p0    # "num":Ljava/lang/Number;
    :goto_6
    return-object p0

    .restart local p0    # "num":Ljava/lang/Number;
    :cond_7
    new-instance v0, Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_6
.end method


# virtual methods
.method public add(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 14
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 275
    invoke-static {p1, p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v6

    packed-switch v6, :pswitch_data_92

    .line 313
    new-instance v6, Ljava/lang/Error;

    invoke-direct {v6}, Ljava/lang/Error;-><init>()V

    throw v6

    .line 277
    :pswitch_f
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 278
    .local v2, "n1":I
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 279
    .local v4, "n2":I
    add-int v0, v2, v4

    .line 280
    .local v0, "n":I
    xor-int v6, v0, v2

    if-gez v6, :cond_2a

    xor-int v6, v0, v4

    if-gez v6, :cond_2a

    new-instance v6, Ljava/lang/Long;

    int-to-long v7, v2

    int-to-long v9, v4

    add-long/2addr v7, v9

    invoke-direct {v6, v7, v8}, Ljava/lang/Long;-><init>(J)V

    .line 308
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :goto_29
    return-object v6

    .line 280
    .restart local v0    # "n":I
    .restart local v2    # "n1":I
    .restart local v4    # "n2":I
    :cond_2a
    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_29

    .line 286
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :pswitch_30
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 287
    .local v2, "n1":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 288
    .local v4, "n2":J
    add-long v0, v2, v4

    .line 289
    .local v0, "n":J
    xor-long v6, v0, v2

    cmp-long v6, v6, v8

    if-gez v6, :cond_53

    xor-long v6, v0, v4

    cmp-long v6, v6, v8

    if-gez v6, :cond_53

    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto :goto_29

    :cond_53
    new-instance v6, Ljava/lang/Long;

    invoke-direct {v6, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_29

    .line 295
    .end local v0    # "n":J
    .end local v2    # "n1":J
    .end local v4    # "n2":J
    :pswitch_59
    new-instance v6, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v7

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-direct {v6, v7}, Ljava/lang/Float;-><init>(F)V

    goto :goto_29

    .line 298
    :pswitch_68
    new-instance v6, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v7

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v9

    add-double/2addr v7, v9

    invoke-direct {v6, v7, v8}, Ljava/lang/Double;-><init>(D)V

    goto :goto_29

    .line 301
    :pswitch_77
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v2

    .line 302
    .local v2, "n1":Ljava/math/BigInteger;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v4

    .line 303
    .local v4, "n2":Ljava/math/BigInteger;
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto :goto_29

    .line 306
    .end local v2    # "n1":Ljava/math/BigInteger;
    .end local v4    # "n2":Ljava/math/BigInteger;
    :pswitch_84
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 307
    .local v2, "n1":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 308
    .local v4, "n2":Ljava/math/BigDecimal;
    invoke-virtual {v2, v4}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    goto :goto_29

    .line 275
    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_f
        :pswitch_30
        :pswitch_59
        :pswitch_68
        :pswitch_77
        :pswitch_84
    .end packed-switch
.end method

.method public compareNumbers(Ljava/lang/Number;Ljava/lang/Number;)I
    .registers 11
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 237
    invoke-static {p1, p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v7

    packed-switch v7, :pswitch_data_78

    .line 271
    new-instance v4, Ljava/lang/Error;

    invoke-direct {v4}, Ljava/lang/Error;-><init>()V

    throw v4

    .line 239
    :pswitch_10
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 240
    .local v0, "n1":I
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 241
    .local v2, "n2":I
    if-ge v0, v2, :cond_1b

    .line 266
    .end local v0    # "n1":I
    .end local v2    # "n2":I
    :cond_1a
    :goto_1a
    return v4

    .line 241
    .restart local v0    # "n1":I
    .restart local v2    # "n2":I
    :cond_1b
    if-ne v0, v2, :cond_1f

    move v4, v5

    goto :goto_1a

    :cond_1f
    move v4, v6

    goto :goto_1a

    .line 244
    .end local v0    # "n1":I
    .end local v2    # "n2":I
    :pswitch_21
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 245
    .local v0, "n1":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 246
    .local v2, "n2":J
    cmp-long v7, v0, v2

    if-ltz v7, :cond_1a

    cmp-long v4, v0, v2

    if-nez v4, :cond_33

    move v4, v5

    goto :goto_1a

    :cond_33
    move v4, v6

    goto :goto_1a

    .line 249
    .end local v0    # "n1":J
    .end local v2    # "n2":J
    :pswitch_35
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 250
    .local v0, "n1":F
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    .line 251
    .local v2, "n2":F
    cmpg-float v7, v0, v2

    if-ltz v7, :cond_1a

    cmpl-float v4, v0, v2

    if-nez v4, :cond_47

    move v4, v5

    goto :goto_1a

    :cond_47
    move v4, v6

    goto :goto_1a

    .line 254
    .end local v0    # "n1":F
    .end local v2    # "n2":F
    :pswitch_49
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 255
    .local v0, "n1":D
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 256
    .local v2, "n2":D
    cmpg-double v7, v0, v2

    if-ltz v7, :cond_1a

    cmpl-double v4, v0, v2

    if-nez v4, :cond_5b

    move v4, v5

    goto :goto_1a

    :cond_5b
    move v4, v6

    goto :goto_1a

    .line 259
    .end local v0    # "n1":D
    .end local v2    # "n2":D
    :pswitch_5d
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v0

    .line 260
    .local v0, "n1":Ljava/math/BigInteger;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v2

    .line 261
    .local v2, "n2":Ljava/math/BigInteger;
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    goto :goto_1a

    .line 264
    .end local v0    # "n1":Ljava/math/BigInteger;
    .end local v2    # "n2":Ljava/math/BigInteger;
    :pswitch_6a
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 265
    .local v0, "n1":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 266
    .local v2, "n2":Ljava/math/BigDecimal;
    invoke-virtual {v0, v2}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    goto :goto_1a

    .line 237
    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_10
        :pswitch_21
        :pswitch_35
        :pswitch_49
        :pswitch_5d
        :pswitch_6a
    .end packed-switch
.end method

.method public divide(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 18
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 402
    invoke-static/range {p1 .. p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v10

    packed-switch v10, :pswitch_data_ba

    .line 450
    new-instance v10, Ljava/lang/Error;

    invoke-direct {v10}, Ljava/lang/Error;-><init>()V

    throw v10

    .line 404
    :pswitch_d
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 405
    .local v3, "n1":I
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 406
    .local v5, "n2":I
    rem-int v10, v3, v5

    if-nez v10, :cond_21

    .line 407
    new-instance v10, Ljava/lang/Integer;

    div-int v11, v3, v5

    invoke-direct {v10, v11}, Ljava/lang/Integer;-><init>(I)V

    .line 445
    .end local v3    # "n1":I
    .end local v5    # "n2":I
    :goto_20
    return-object v10

    .line 409
    .restart local v3    # "n1":I
    .restart local v5    # "n2":I
    :cond_21
    new-instance v10, Ljava/lang/Double;

    int-to-double v11, v3

    int-to-double v13, v5

    div-double/2addr v11, v13

    invoke-direct {v10, v11, v12}, Ljava/lang/Double;-><init>(D)V

    goto :goto_20

    .line 412
    .end local v3    # "n1":I
    .end local v5    # "n2":I
    :pswitch_2a
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    .line 413
    .local v3, "n1":J
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    .line 414
    .local v5, "n2":J
    rem-long v10, v3, v5

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_42

    .line 415
    new-instance v10, Ljava/lang/Long;

    div-long v11, v3, v5

    invoke-direct {v10, v11, v12}, Ljava/lang/Long;-><init>(J)V

    goto :goto_20

    .line 417
    :cond_42
    new-instance v10, Ljava/lang/Double;

    long-to-double v11, v3

    long-to-double v13, v5

    div-double/2addr v11, v13

    invoke-direct {v10, v11, v12}, Ljava/lang/Double;-><init>(D)V

    goto :goto_20

    .line 420
    .end local v3    # "n1":J
    .end local v5    # "n2":J
    :pswitch_4b
    new-instance v10, Ljava/lang/Float;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Number;->floatValue()F

    move-result v11

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Number;->floatValue()F

    move-result v12

    div-float/2addr v11, v12

    invoke-direct {v10, v11}, Ljava/lang/Float;-><init>(F)V

    goto :goto_20

    .line 423
    :pswitch_5a
    new-instance v10, Ljava/lang/Double;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v11

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v13

    div-double/2addr v11, v13

    invoke-direct {v10, v11, v12}, Ljava/lang/Double;-><init>(D)V

    goto :goto_20

    .line 426
    :pswitch_69
    invoke-static/range {p1 .. p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v3

    .line 427
    .local v3, "n1":Ljava/math/BigInteger;
    invoke-static/range {p2 .. p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v5

    .line 428
    .local v5, "n2":Ljava/math/BigInteger;
    invoke-virtual {v3, v5}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v2

    .line 429
    .local v2, "divmod":[Ljava/math/BigInteger;
    const/4 v10, 0x1

    aget-object v10, v2, v10

    sget-object v11, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v10, v11}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_84

    .line 430
    const/4 v10, 0x0

    aget-object v10, v2, v10

    goto :goto_20

    .line 433
    :cond_84
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, v3}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    .line 434
    .local v0, "bd1":Ljava/math/BigDecimal;
    new-instance v1, Ljava/math/BigDecimal;

    invoke-direct {v1, v5}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    .line 435
    .local v1, "bd2":Ljava/math/BigDecimal;
    iget v10, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->minScale:I

    iget v11, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->roundingPolicy:I

    invoke-virtual {v0, v1, v10, v11}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;II)Ljava/math/BigDecimal;

    move-result-object v10

    goto :goto_20

    .line 439
    .end local v0    # "bd1":Ljava/math/BigDecimal;
    .end local v1    # "bd2":Ljava/math/BigDecimal;
    .end local v2    # "divmod":[Ljava/math/BigInteger;
    .end local v3    # "n1":Ljava/math/BigInteger;
    .end local v5    # "n2":Ljava/math/BigInteger;
    :pswitch_97
    invoke-static/range {p1 .. p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v3

    .line 440
    .local v3, "n1":Ljava/math/BigDecimal;
    invoke-static/range {p2 .. p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v5

    .line 441
    .local v5, "n2":Ljava/math/BigDecimal;
    invoke-virtual {v3}, Ljava/math/BigDecimal;->scale()I

    move-result v8

    .line 442
    .local v8, "scale1":I
    invoke-virtual {v5}, Ljava/math/BigDecimal;->scale()I

    move-result v9

    .line 443
    .local v9, "scale2":I
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 444
    .local v7, "scale":I
    iget v10, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->minScale:I

    invoke-static {v10, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 445
    iget v10, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->roundingPolicy:I

    invoke-virtual {v3, v5, v7, v10}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;II)Ljava/math/BigDecimal;

    move-result-object v10

    goto/16 :goto_20

    .line 402
    nop

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_d
        :pswitch_2a
        :pswitch_4b
        :pswitch_5a
        :pswitch_69
        :pswitch_97
    .end packed-switch
.end method

.method public modulus(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 10
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-static {p1, p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v2

    packed-switch v2, :pswitch_data_5e

    .line 478
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2}, Ljava/lang/Error;-><init>()V

    throw v2

    .line 456
    :pswitch_d
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v4

    rem-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    .line 470
    :goto_1b
    return-object v2

    .line 459
    :pswitch_1c
    new-instance v2, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    rem-long/2addr v3, v5

    invoke-direct {v2, v3, v4}, Ljava/lang/Long;-><init>(J)V

    goto :goto_1b

    .line 462
    :pswitch_2b
    new-instance v2, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v4

    rem-float/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(F)V

    goto :goto_1b

    .line 465
    :pswitch_3a
    new-instance v2, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    rem-double/2addr v3, v5

    invoke-direct {v2, v3, v4}, Ljava/lang/Double;-><init>(D)V

    goto :goto_1b

    .line 468
    :pswitch_49
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v0

    .line 469
    .local v0, "n1":Ljava/math/BigInteger;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v1

    .line 470
    .local v1, "n2":Ljava/math/BigInteger;
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    goto :goto_1b

    .line 473
    .end local v0    # "n1":Ljava/math/BigInteger;
    .end local v1    # "n2":Ljava/math/BigInteger;
    :pswitch_56
    new-instance v2, Lfreemarker/core/_MiscTemplateException;

    const-string v3, "Can\'t calculate remainder on BigDecimals"

    invoke-direct {v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 454
    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_1c
        :pswitch_2b
        :pswitch_3a
        :pswitch_49
        :pswitch_56
    .end packed-switch
.end method

.method public multiply(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 15
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 359
    invoke-static {p1, p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v7

    packed-switch v7, :pswitch_data_9e

    .line 398
    new-instance v7, Ljava/lang/Error;

    invoke-direct {v7}, Ljava/lang/Error;-><init>()V

    throw v7

    .line 361
    :pswitch_d
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 362
    .local v2, "n1":I
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 363
    .local v4, "n2":I
    mul-int v0, v2, v4

    .line 364
    .local v0, "n":I
    if-eqz v2, :cond_1d

    div-int v7, v0, v2

    if-ne v7, v4, :cond_23

    :cond_1d
    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v0}, Ljava/lang/Integer;-><init>(I)V

    .line 393
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :goto_22
    return-object v7

    .line 364
    .restart local v0    # "n":I
    .restart local v2    # "n1":I
    .restart local v4    # "n2":I
    :cond_23
    new-instance v7, Ljava/lang/Long;

    int-to-long v8, v2

    int-to-long v10, v4

    mul-long/2addr v8, v10

    invoke-direct {v7, v8, v9}, Ljava/lang/Long;-><init>(J)V

    goto :goto_22

    .line 370
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :pswitch_2c
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 371
    .local v2, "n1":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 372
    .local v4, "n2":J
    mul-long v0, v2, v4

    .line 373
    .local v0, "n":J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-eqz v7, :cond_42

    div-long v7, v0, v2

    cmp-long v7, v7, v4

    if-nez v7, :cond_48

    :cond_42
    new-instance v7, Ljava/lang/Long;

    invoke-direct {v7, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_22

    :cond_48
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_22

    .line 379
    .end local v0    # "n":J
    .end local v2    # "n1":J
    .end local v4    # "n2":J
    :pswitch_55
    new-instance v7, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v8

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v9

    mul-float/2addr v8, v9

    invoke-direct {v7, v8}, Ljava/lang/Float;-><init>(F)V

    goto :goto_22

    .line 382
    :pswitch_64
    new-instance v7, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v10

    mul-double/2addr v8, v10

    invoke-direct {v7, v8, v9}, Ljava/lang/Double;-><init>(D)V

    goto :goto_22

    .line 385
    :pswitch_73
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v2

    .line 386
    .local v2, "n1":Ljava/math/BigInteger;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v4

    .line 387
    .local v4, "n2":Ljava/math/BigInteger;
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_22

    .line 390
    .end local v2    # "n1":Ljava/math/BigInteger;
    .end local v4    # "n2":Ljava/math/BigInteger;
    :pswitch_80
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 391
    .local v2, "n1":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 392
    .local v4, "n2":Ljava/math/BigDecimal;
    invoke-virtual {v2, v4}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    .line 393
    .local v6, "r":Ljava/math/BigDecimal;
    invoke-virtual {v6}, Ljava/math/BigDecimal;->scale()I

    move-result v7

    iget v8, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->maxScale:I

    if-le v7, v8, :cond_9c

    iget v7, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->maxScale:I

    iget v8, p0, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->roundingPolicy:I

    invoke-virtual {v6, v7, v8}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v6

    .end local v6    # "r":Ljava/math/BigDecimal;
    :cond_9c
    move-object v7, v6

    goto :goto_22

    .line 359
    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_2c
        :pswitch_55
        :pswitch_64
        :pswitch_73
        :pswitch_80
    .end packed-switch
.end method

.method public subtract(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 14
    .param p1, "first"    # Ljava/lang/Number;
    .param p2, "second"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 317
    invoke-static {p1, p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->getCommonClassCode(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v6

    packed-switch v6, :pswitch_data_94

    .line 355
    new-instance v6, Ljava/lang/Error;

    invoke-direct {v6}, Ljava/lang/Error;-><init>()V

    throw v6

    .line 319
    :pswitch_f
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 320
    .local v2, "n1":I
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 321
    .local v4, "n2":I
    sub-int v0, v2, v4

    .line 322
    .local v0, "n":I
    xor-int v6, v0, v2

    if-gez v6, :cond_2b

    xor-int/lit8 v6, v4, -0x1

    xor-int/2addr v6, v0

    if-gez v6, :cond_2b

    new-instance v6, Ljava/lang/Long;

    int-to-long v7, v2

    int-to-long v9, v4

    sub-long/2addr v7, v9

    invoke-direct {v6, v7, v8}, Ljava/lang/Long;-><init>(J)V

    .line 350
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :goto_2a
    return-object v6

    .line 322
    .restart local v0    # "n":I
    .restart local v2    # "n1":I
    .restart local v4    # "n2":I
    :cond_2b
    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_2a

    .line 328
    .end local v0    # "n":I
    .end local v2    # "n1":I
    .end local v4    # "n2":I
    :pswitch_31
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 329
    .local v2, "n1":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 330
    .local v4, "n2":J
    sub-long v0, v2, v4

    .line 331
    .local v0, "n":J
    xor-long v6, v0, v2

    cmp-long v6, v6, v8

    if-gez v6, :cond_56

    const-wide/16 v6, -0x1

    xor-long/2addr v6, v4

    xor-long/2addr v6, v0

    cmp-long v6, v6, v8

    if-gez v6, :cond_56

    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto :goto_2a

    :cond_56
    new-instance v6, Ljava/lang/Long;

    invoke-direct {v6, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_2a

    .line 337
    .end local v0    # "n":J
    .end local v2    # "n1":J
    .end local v4    # "n2":J
    :pswitch_5c
    new-instance v6, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v7

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v8

    sub-float/2addr v7, v8

    invoke-direct {v6, v7}, Ljava/lang/Float;-><init>(F)V

    goto :goto_2a

    .line 340
    :pswitch_6b
    new-instance v6, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v7

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v9

    sub-double/2addr v7, v9

    invoke-direct {v6, v7, v8}, Ljava/lang/Double;-><init>(D)V

    goto :goto_2a

    .line 343
    :pswitch_7a
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v2

    .line 344
    .local v2, "n1":Ljava/math/BigInteger;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->toBigInteger(Ljava/lang/Number;)Ljava/math/BigInteger;

    move-result-object v4

    .line 345
    .local v4, "n2":Ljava/math/BigInteger;
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto :goto_2a

    .line 348
    .end local v2    # "n1":Ljava/math/BigInteger;
    .end local v4    # "n2":Ljava/math/BigInteger;
    :pswitch_87
    invoke-static {p1}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 349
    .local v2, "n1":Ljava/math/BigDecimal;
    invoke-static {p2}, Lfreemarker/core/ArithmeticEngine;->access$000(Ljava/lang/Number;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 350
    .local v4, "n2":Ljava/math/BigDecimal;
    invoke-virtual {v2, v4}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    goto :goto_2a

    .line 317
    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_f
        :pswitch_31
        :pswitch_5c
        :pswitch_6b
        :pswitch_7a
        :pswitch_87
    .end packed-switch
.end method

.method public toNumber(Ljava/lang/String;)Ljava/lang/Number;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 482
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lfreemarker/template/utility/OptimizerUtil;->optimizeNumberRepresentation(Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v0

    return-object v0
.end method
