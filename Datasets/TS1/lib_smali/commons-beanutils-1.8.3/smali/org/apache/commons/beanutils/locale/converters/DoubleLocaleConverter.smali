.class public Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;
.super Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;
.source "DoubleLocaleConverter.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Z)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/lang/Object;Z)V

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

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

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

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

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

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

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

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Z)V

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

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

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

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

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

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 65
    return-void
.end method


# virtual methods
.method protected parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-super {p0, p1, p2}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    .line 217
    .local v0, "result":Ljava/lang/Number;
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_14

    .line 218
    new-instance v1, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    move-object v0, v1

    .line 220
    .end local v0    # "result":Ljava/lang/Number;
    :cond_14
    return-object v0
.end method
