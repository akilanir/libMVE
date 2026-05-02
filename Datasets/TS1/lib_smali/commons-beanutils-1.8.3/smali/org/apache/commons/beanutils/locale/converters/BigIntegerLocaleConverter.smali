.class public Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;
.super Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;
.source "BigIntegerLocaleConverter.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Z)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/lang/Object;Z)V

    .line 131
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 158
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 185
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 186
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "locPattern"    # Z

    .prologue
    .line 200
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 201
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "locPattern"    # Z

    .prologue
    .line 171
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 172
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locPattern"    # Z

    .prologue
    .line 144
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 103
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locPattern"    # Z

    .prologue
    .line 116
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locPattern"    # Z

    .prologue
    .line 89
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 90
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "locPattern"    # Z

    .prologue
    .line 64
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 65
    return-void
.end method


# virtual methods
.method protected parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-super {p0, p1, p2}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 220
    .local v1, "result":Ljava/lang/Object;
    if-eqz v1, :cond_a

    instance-of v2, v1, Ljava/math/BigInteger;

    if-eqz v2, :cond_b

    .line 229
    .end local v1    # "result":Ljava/lang/Object;
    :cond_a
    :goto_a
    return-object v1

    .line 224
    .restart local v1    # "result":Ljava/lang/Object;
    :cond_b
    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_1a

    .line 225
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "result":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_a

    .line 229
    .restart local v1    # "result":Ljava/lang/Object;
    :cond_1a
    :try_start_1a
    new-instance v2, Ljava/math/BigInteger;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V
    :try_end_23
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_23} :catch_25

    move-object v1, v2

    goto :goto_a

    .line 231
    :catch_25
    move-exception v0

    .line 232
    .local v0, "ex":Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Suplied number is not of type BigInteger: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
