.class public Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;
.super Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;
.source "FloatLocaleConverter.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Z)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/lang/Object;Z)V

    .line 132
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 159
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 186
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "locPattern"    # Z

    .prologue
    .line 201
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 202
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "locPattern"    # Z

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 173
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locPattern"    # Z

    .prologue
    .line 145
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locPattern"    # Z

    .prologue
    .line 117
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locPattern"    # Z

    .prologue
    .line 90
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 91
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "locPattern"    # Z

    .prologue
    .line 65
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 66
    return-void
.end method


# virtual methods
.method protected parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 12
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 218
    invoke-super {p0, p1, p2}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    .line 219
    .local v2, "parsed":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 220
    .local v0, "doubleValue":D
    cmpl-double v5, v0, v7

    if-ltz v5, :cond_3d

    move-wide v3, v0

    .line 221
    .local v3, "posDouble":D
    :goto_11
    cmpl-double v5, v3, v7

    if-eqz v5, :cond_42

    const-wide/high16 v5, 0x36a0000000000000L    # 1.401298464324817E-45

    cmpg-double v5, v3, v5

    if-ltz v5, :cond_24

    const-wide v5, 0x47efffffe0000000L    # 3.4028234663852886E38

    cmpl-double v5, v3, v5

    if-lez v5, :cond_42

    .line 222
    :cond_24
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Supplied number is not of type Float: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 220
    .end local v3    # "posDouble":D
    :cond_3d
    const-wide/high16 v5, -0x4010000000000000L    # -1.0

    mul-double v3, v0, v5

    goto :goto_11

    .line 224
    .restart local v3    # "posDouble":D
    :cond_42
    new-instance v5, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v6

    invoke-direct {v5, v6}, Ljava/lang/Float;-><init>(F)V

    return-object v5
.end method
