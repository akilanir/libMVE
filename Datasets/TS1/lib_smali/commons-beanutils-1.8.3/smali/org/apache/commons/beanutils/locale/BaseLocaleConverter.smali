.class public abstract Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;
.super Ljava/lang/Object;
.source "BaseLocaleConverter.java"

# interfaces
.implements Lorg/apache/commons/beanutils/locale/LocaleConverter;


# static fields
.field static class$org$apache$commons$beanutils$locale$BaseLocaleConverter:Ljava/lang/Class;


# instance fields
.field private defaultValue:Ljava/lang/Object;

.field protected locPattern:Z

.field protected locale:Ljava/util/Locale;

.field private log:Lorg/apache/commons/logging/Log;

.field protected pattern:Ljava/lang/String;

.field protected useDefault:Z


# direct methods
.method protected constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V

    .line 100
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 11
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "locPattern"    # Z

    .prologue
    .line 113
    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;ZZ)V

    .line 114
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;ZZ)V
    .registers 9
    .param p1, "defaultValue"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;
    .param p4, "useDefault"    # Z
    .param p5, "locPattern"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->class$org$apache$commons$beanutils$locale$BaseLocaleConverter:Ljava/lang/Class;

    if-nez v0, :cond_35

    const-string v0, "org.apache.commons.beanutils.locale.BaseLocaleConverter"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->class$org$apache$commons$beanutils$locale$BaseLocaleConverter:Ljava/lang/Class;

    :goto_11
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    .line 46
    iput-object v2, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->defaultValue:Ljava/lang/Object;

    .line 49
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->useDefault:Z

    .line 52
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->locale:Ljava/util/Locale;

    .line 55
    iput-object v2, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->pattern:Ljava/lang/String;

    .line 58
    iput-boolean v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->locPattern:Z

    .line 129
    if-eqz p4, :cond_2c

    .line 130
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->defaultValue:Ljava/lang/Object;

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->useDefault:Z

    .line 134
    :cond_2c
    if-eqz p2, :cond_30

    .line 135
    iput-object p2, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->locale:Ljava/util/Locale;

    .line 138
    :cond_30
    iput-object p3, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->pattern:Ljava/lang/String;

    .line 139
    iput-boolean p5, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->locPattern:Z

    .line 140
    return-void

    .line 43
    :cond_35
    sget-object v0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->class$org$apache$commons$beanutils$locale$BaseLocaleConverter:Ljava/lang/Class;

    goto :goto_11
.end method

.method protected constructor <init>(Ljava/util/Locale;Ljava/lang/String;)V
    .registers 9
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 72
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;ZZ)V

    .line 73
    return-void
.end method

.method protected constructor <init>(Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 10
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locPattern"    # Z

    .prologue
    .line 85
    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;-><init>(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;ZZ)V

    .line 86
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 43
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
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 217
    if-nez p2, :cond_12

    .line 218
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->useDefault:Z

    if-eqz v1, :cond_9

    .line 219
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->defaultValue:Ljava/lang/Object;

    .line 236
    :goto_8
    return-object v1

    .line 223
    :cond_9
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Null value specified for conversion, returing null"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 224
    const/4 v1, 0x0

    goto :goto_8

    .line 229
    :cond_12
    if-eqz p3, :cond_19

    .line 230
    :try_start_14
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_8

    .line 232
    :cond_19
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->pattern:Ljava/lang/String;

    invoke-virtual {p0, p2, v1}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_1e} :catch_20

    move-result-object v1

    goto :goto_8

    .line 234
    :catch_20
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/Exception;
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->useDefault:Z

    if-eqz v1, :cond_28

    .line 236
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_8

    .line 238
    :cond_28
    instance-of v1, v0, Lorg/apache/commons/beanutils/ConversionException;

    if-eqz v1, :cond_2f

    .line 239
    check-cast v0, Lorg/apache/commons/beanutils/ConversionException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 241
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2f
    new-instance v1, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public convert(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 170
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->convert(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 184
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/commons/beanutils/locale/BaseLocaleConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected abstract parse(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
