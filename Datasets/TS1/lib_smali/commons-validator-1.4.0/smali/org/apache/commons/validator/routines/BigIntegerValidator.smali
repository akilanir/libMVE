.class public Lorg/apache/commons/validator/routines/BigIntegerValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "BigIntegerValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/BigIntegerValidator;

.field private static final serialVersionUID:J = 0x5d29e1396dfd5794L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 70
    new-instance v0, Lorg/apache/commons/validator/routines/BigIntegerValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/BigIntegerValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/BigIntegerValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/BigIntegerValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 84
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/BigIntegerValidator;-><init>(ZI)V

    .line 85
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;-><init>(ZIZ)V

    .line 110
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/BigIntegerValidator;
    .registers 1

    .prologue
    .line 77
    sget-object v0, Lorg/apache/commons/validator/routines/BigIntegerValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/BigIntegerValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(Ljava/math/BigInteger;JJ)Z
    .registers 8
    .param p1, "value"    # Ljava/math/BigInteger;
    .param p2, "min"    # J
    .param p4, "max"    # J

    .prologue
    .line 172
    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, p2

    if-ltz v0, :cond_12

    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, p4

    if-gtz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public maxValue(Ljava/math/BigInteger;J)Z
    .registers 6
    .param p1, "value"    # Ljava/math/BigInteger;
    .param p2, "max"    # J

    .prologue
    .line 196
    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, p2

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public minValue(Ljava/math/BigInteger;J)Z
    .registers 6
    .param p1, "value"    # Ljava/math/BigInteger;
    .param p2, "min"    # J

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, p2

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 208
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public validate(Ljava/lang/String;)Ljava/math/BigInteger;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 121
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/BigIntegerValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/math/BigInteger;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 133
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/BigIntegerValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/math/BigInteger;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 159
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/BigIntegerValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/math/BigInteger;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 145
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/BigIntegerValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    return-object v0
.end method
