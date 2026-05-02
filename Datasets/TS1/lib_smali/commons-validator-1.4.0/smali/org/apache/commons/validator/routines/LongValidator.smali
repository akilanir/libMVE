.class public Lorg/apache/commons/validator/routines/LongValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "LongValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/LongValidator;

.field private static final serialVersionUID:J = -0x47040f25a945f1f2L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    new-instance v0, Lorg/apache/commons/validator/routines/LongValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/LongValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/LongValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/LongValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 82
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/LongValidator;-><init>(ZI)V

    .line 83
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;-><init>(ZIZ)V

    .line 108
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/LongValidator;
    .registers 1

    .prologue
    .line 75
    sget-object v0, Lorg/apache/commons/validator/routines/LongValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/LongValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(JJJ)Z
    .registers 8
    .param p1, "value"    # J
    .param p3, "min"    # J
    .param p5, "max"    # J

    .prologue
    .line 170
    cmp-long v0, p1, p3

    if-ltz v0, :cond_a

    cmp-long v0, p1, p5

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInRange(Ljava/lang/Long;JJ)Z
    .registers 13
    .param p1, "value"    # Ljava/lang/Long;
    .param p2, "min"    # J
    .param p4, "max"    # J

    .prologue
    .line 183
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    move-object v0, p0

    move-wide v3, p2

    move-wide v5, p4

    invoke-virtual/range {v0 .. v6}, Lorg/apache/commons/validator/routines/LongValidator;->isInRange(JJJ)Z

    move-result v0

    return v0
.end method

.method public maxValue(JJ)Z
    .registers 6
    .param p1, "value"    # J
    .param p3, "max"    # J

    .prologue
    .line 219
    cmp-long v0, p1, p3

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public maxValue(Ljava/lang/Long;J)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/Long;
    .param p2, "max"    # J

    .prologue
    .line 231
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2, p3}, Lorg/apache/commons/validator/routines/LongValidator;->maxValue(JJ)Z

    move-result v0

    return v0
.end method

.method public minValue(JJ)Z
    .registers 6
    .param p1, "value"    # J
    .param p3, "min"    # J

    .prologue
    .line 195
    cmp-long v0, p1, p3

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public minValue(Ljava/lang/Long;J)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/Long;
    .param p2, "min"    # J

    .prologue
    .line 207
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2, p3}, Lorg/apache/commons/validator/routines/LongValidator;->minValue(JJ)Z

    move-result v0

    return v0
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 244
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_5

    .line 247
    .end local p1    # "value":Ljava/lang/Object;
    :goto_4
    return-object p1

    .restart local p1    # "value":Ljava/lang/Object;
    :cond_5
    new-instance v0, Ljava/lang/Long;

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    move-object p1, v0

    goto :goto_4
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Long;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 119
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/LongValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 131
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/LongValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Long;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 157
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/LongValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Long;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 143
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/LongValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method
