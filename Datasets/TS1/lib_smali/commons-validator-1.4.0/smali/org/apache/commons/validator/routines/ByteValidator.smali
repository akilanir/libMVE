.class public Lorg/apache/commons/validator/routines/ByteValidator;
.super Lorg/apache/commons/validator/routines/AbstractNumberValidator;
.source "ByteValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/ByteValidator;

.field private static final serialVersionUID:J = 0x612ad358101e32b9L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 69
    new-instance v0, Lorg/apache/commons/validator/routines/ByteValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/ByteValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/ByteValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/ByteValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/ByteValidator;-><init>(ZI)V

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

.method public static getInstance()Lorg/apache/commons/validator/routines/ByteValidator;
    .registers 1

    .prologue
    .line 76
    sget-object v0, Lorg/apache/commons/validator/routines/ByteValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/ByteValidator;

    return-object v0
.end method


# virtual methods
.method public isInRange(BBB)Z
    .registers 5
    .param p1, "value"    # B
    .param p2, "min"    # B
    .param p3, "max"    # B

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

.method public isInRange(Ljava/lang/Byte;BB)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Byte;
    .param p2, "min"    # B
    .param p3, "max"    # B

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/validator/routines/ByteValidator;->isInRange(BBB)Z

    move-result v0

    return v0
.end method

.method public maxValue(BB)Z
    .registers 4
    .param p1, "value"    # B
    .param p2, "max"    # B

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

.method public maxValue(Ljava/lang/Byte;B)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Byte;
    .param p2, "max"    # B

    .prologue
    .line 232
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/ByteValidator;->maxValue(BB)Z

    move-result v0

    return v0
.end method

.method public minValue(BB)Z
    .registers 4
    .param p1, "value"    # B
    .param p2, "min"    # B

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

.method public minValue(Ljava/lang/Byte;B)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Byte;
    .param p2, "min"    # B

    .prologue
    .line 208
    invoke-virtual {p1}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/validator/routines/ByteValidator;->minValue(BB)Z

    move-result v0

    return v0
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
    const-wide/16 v2, -0x80

    cmp-long v2, v0, v2

    if-ltz v2, :cond_12

    const-wide/16 v2, 0x7f

    cmp-long v2, v0, v2

    if-lez v2, :cond_14

    .line 250
    :cond_12
    const/4 v2, 0x0

    .line 252
    :goto_13
    return-object v2

    :cond_14
    new-instance v2, Ljava/lang/Byte;

    long-to-int v3, v0

    int-to-byte v3, v3

    invoke-direct {v2, v3}, Ljava/lang/Byte;-><init>(B)V

    goto :goto_13
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Byte;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 120
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/validator/routines/ByteValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Byte;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 132
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/ByteValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Byte;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/ByteValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Byte;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/ByteValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    return-object v0
.end method
