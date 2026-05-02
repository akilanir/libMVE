.class public Lorg/apache/commons/validator/routines/ShortValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "ShortValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/ShortValidator;

.field private static final serialVersionUID:J = -0x488bd948ee05413aL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 69
    new-instance v0, Lorg/apache/commons/validator/routines/ShortValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/ShortValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/ShortValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/ShortValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/ShortValidator;-><init>(ZI)V

    .line 84
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "formatType"    # I

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractNumberValidator;-><init>(ZIZ)V

    .line 109
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/ShortValidator;
    .registers 1

    .prologue
    .line 76
    sget-object v0, Lorg/apache/commons/validator/routines/ShortValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/ShortValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(Ljava/lang/Short;SS)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Short;
    .param p2, "min"    # S
    .param p3, "max"    # S

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/validator/routines/ShortValidator;->isInRange(SSS)Z

    move-result v0

    return v0
.end method

.method public isInRange(SSS)Z
    .registers 5
    .param p1, "value"    # S
    .param p2, "min"    # S
    .param p3, "max"    # S

    .prologue
    .line 171
    if-lt p1, p2, :cond_6

    if-gt p1, p3, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public maxValue(Ljava/lang/Short;S)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Short;
    .param p2, "max"    # S

    .prologue
    .line 232
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/ShortValidator;->maxValue(SS)Z

    move-result v0

    return v0
.end method

.method public maxValue(SS)Z
    .registers 4
    .param p1, "value"    # S
    .param p2, "max"    # S

    .prologue
    .line 220
    if-gt p1, p2, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public minValue(Ljava/lang/Short;S)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Short;
    .param p2, "min"    # S

    .prologue
    .line 208
    invoke-virtual {p1}, Ljava/lang/Short;->shortValue()S

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/ShortValidator;->minValue(SS)Z

    move-result v0

    return v0
.end method

.method public minValue(SS)Z
    .registers 4
    .param p1, "value"    # S
    .param p2, "min"    # S

    .prologue
    .line 196
    if-lt p1, p2, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 246
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 248
    .local v0, "longValue":J
    const-wide/16 v2, -0x8000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_12

    const-wide/16 v2, 0x7fff

    cmp-long v2, v0, v2

    if-lez v2, :cond_14

    .line 250
    :cond_12
    const/4 v2, 0x0

    .line 252
    :goto_13
    return-object v2

    :cond_14
    new-instance v2, Ljava/lang/Short;

    long-to-int v3, v0

    int-to-short v3, v3

    invoke-direct {v2, v3}, Ljava/lang/Short;-><init>(S)V

    goto :goto_13
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Short;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 120
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/ShortValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Short;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Short;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/ShortValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Short;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Short;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/ShortValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Short;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Short;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/ShortValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Short;

    return-object v0
.end method
