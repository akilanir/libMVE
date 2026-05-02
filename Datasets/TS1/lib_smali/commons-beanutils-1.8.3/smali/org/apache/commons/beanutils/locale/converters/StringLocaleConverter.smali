.class public Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;
.super Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;
.source "StringLocaleConverter.java"


# static fields
.field static class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;


# instance fields
.field private log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Z)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/lang/Object;Z)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 171
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 172
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 200
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "locPattern"    # Z

    .prologue
    .line 214
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 50
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.apache.commons.beanutils.locale.converters.StringLocaleConverter"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    .line 215
    return-void

    .line 50
    :cond_16
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    goto :goto_f
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "locPattern"    # Z

    .prologue
    .line 185
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 186
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locPattern"    # Z

    .prologue
    .line 158
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 159
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locPattern"    # Z

    .prologue
    .line 130
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 50
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.apache.commons.beanutils.locale.converters.StringLocaleConverter"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    .line 131
    return-void

    .line 50
    :cond_16
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter:Ljava/lang/Class;

    goto :goto_f
.end method

.method public constructor <init>(Ljava/util/Locale;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locPattern"    # Z

    .prologue
    .line 103
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 104
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "locPattern"    # Z

    .prologue
    .line 78
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 79
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 50
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getDecimalFormat(Ljava/util/Locale;Ljava/lang/String;)Ljava/text/DecimalFormat;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-static {p1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    check-cast v0, Ljava/text/DecimalFormat;

    .line 279
    .local v0, "numberFormat":Ljava/text/DecimalFormat;
    if-eqz p2, :cond_14

    .line 280
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->locPattern:Z

    if-eqz v1, :cond_10

    .line 281
    invoke-virtual {v0, p2}, Ljava/text/DecimalFormat;->applyLocalizedPattern(Ljava/lang/String;)V

    .line 289
    :goto_f
    return-object v0

    .line 283
    :cond_10
    invoke-virtual {v0, p2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    goto :goto_f

    .line 286
    :cond_14
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "No pattern provided, using default."

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_f
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
    .line 233
    const/4 v1, 0x0

    .line 235
    .local v1, "result":Ljava/lang/String;
    instance-of v2, p1, Ljava/lang/Integer;

    if-nez v2, :cond_15

    instance-of v2, p1, Ljava/lang/Long;

    if-nez v2, :cond_15

    instance-of v2, p1, Ljava/math/BigInteger;

    if-nez v2, :cond_15

    instance-of v2, p1, Ljava/lang/Byte;

    if-nez v2, :cond_15

    instance-of v2, p1, Ljava/lang/Short;

    if-eqz v2, :cond_26

    .line 241
    :cond_15
    iget-object v2, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->locale:Ljava/util/Locale;

    invoke-direct {p0, v2, p2}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->getDecimalFormat(Ljava/util/Locale;Ljava/lang/String;)Ljava/text/DecimalFormat;

    move-result-object v2

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    .line 260
    :goto_25
    return-object v1

    .line 243
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_26
    instance-of v2, p1, Ljava/lang/Double;

    if-nez v2, :cond_32

    instance-of v2, p1, Ljava/math/BigDecimal;

    if-nez v2, :cond_32

    instance-of v2, p1, Ljava/lang/Float;

    if-eqz v2, :cond_43

    .line 247
    :cond_32
    iget-object v2, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->locale:Ljava/util/Locale;

    invoke-direct {p0, v2, p2}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->getDecimalFormat(Ljava/util/Locale;Ljava/lang/String;)Ljava/text/DecimalFormat;

    move-result-object v2

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_25

    .line 249
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_43
    instance-of v2, p1, Ljava/util/Date;

    if-eqz v2, :cond_53

    .line 251
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;->locale:Ljava/util/Locale;

    invoke-direct {v0, p2, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 254
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 255
    goto :goto_25

    .line 257
    .end local v0    # "dateFormat":Ljava/text/SimpleDateFormat;
    :cond_53
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_25
.end method
