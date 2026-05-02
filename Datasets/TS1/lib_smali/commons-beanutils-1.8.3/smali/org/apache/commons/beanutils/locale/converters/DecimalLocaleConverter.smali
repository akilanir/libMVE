.class public Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;
.super Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;
.source "DecimalLocaleConverter.java"


# static fields
.field static class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;


# instance fields
.field private log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Z)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Z)V

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 196
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 197
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "locPattern"    # Z

    .prologue
    .line 211
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 48
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    .line 213
    return-void

    .line 48
    :cond_16
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    goto :goto_f
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Z)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "locPattern"    # Z

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 183
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locPattern"    # Z

    .prologue
    .line 155
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Z)V

    .line 156
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 114
    return-void
.end method

.method public constructor <init>(Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locPattern"    # Z

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 48
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    .line 128
    return-void

    .line 48
    :cond_16
    sget-object v0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter:Ljava/lang/Class;

    goto :goto_f
.end method

.method public constructor <init>(Ljava/util/Locale;Z)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "locPattern"    # Z

    .prologue
    .line 100
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 101
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "locPattern"    # Z

    .prologue
    .line 75
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    .line 76
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 48
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


# virtual methods
.method protected parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 231
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_5

    .line 253
    .end local p1    # "value":Ljava/lang/Object;
    :goto_4
    return-object p1

    .line 239
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_5
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->locale:Ljava/util/Locale;

    invoke-static {v1}, Ljava/text/DecimalFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    check-cast v0, Ljava/text/DecimalFormat;

    .line 243
    .local v0, "formatter":Ljava/text/DecimalFormat;
    if-eqz p2, :cond_21

    .line 244
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->locPattern:Z

    if-eqz v1, :cond_1d

    .line 245
    invoke-virtual {v0, p2}, Ljava/text/DecimalFormat;->applyLocalizedPattern(Ljava/lang/String;)V

    .line 253
    :goto_16
    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {v0, p1}, Ljava/text/DecimalFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object p1

    goto :goto_4

    .line 247
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_1d
    invoke-virtual {v0, p2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    goto :goto_16

    .line 250
    :cond_21
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/converters/DecimalLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "No pattern provided, using default."

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_16
.end method
