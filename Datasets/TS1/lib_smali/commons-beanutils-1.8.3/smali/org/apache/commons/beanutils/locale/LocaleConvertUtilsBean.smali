.class public Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;
.super Ljava/lang/Object;
.source "LocaleConvertUtilsBean.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1;,
        Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;
    }
.end annotation


# static fields
.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;

.field static class$java$math$BigInteger:Ljava/lang/Class;

.field static class$java$sql$Date:Ljava/lang/Class;

.field static class$java$sql$Time:Ljava/lang/Class;

.field static class$java$sql$Timestamp:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$locale$LocaleConvertUtils:Ljava/lang/Class;


# instance fields
.field private applyLocalized:Z

.field private defaultLocale:Ljava/util/Locale;

.field private log:Lorg/apache/commons/logging/Log;

.field private mapConverters:Lorg/apache/commons/collections/FastHashMap;


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    .line 103
    iput-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    .line 106
    sget-object v0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$org$apache$commons$beanutils$locale$LocaleConvertUtils:Ljava/lang/Class;

    if-nez v0, :cond_39

    const-string v0, "org.apache.commons.beanutils.locale.LocaleConvertUtils"

    invoke-static {v0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$org$apache$commons$beanutils$locale$LocaleConvertUtils:Ljava/lang/Class;

    :goto_18
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    .line 112
    new-instance v0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;

    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtils;->createCache()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;-><init>(Ljava/util/Map;Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    .line 121
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, v3}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 122
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->deregister()V

    .line 123
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 124
    return-void

    .line 106
    :cond_39
    sget-object v0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$org$apache$commons$beanutils$locale$LocaleConvertUtils:Ljava/lang/Class;

    goto :goto_18
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 106
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

.method public static getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;
    .registers 1

    .prologue
    .line 94
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;->getLocaleBeanUtilsInstance()Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;->getLocaleConvertUtils()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "pattern"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 271
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Convert string "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " to class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " using "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " locale and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " pattern"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 276
    :cond_48
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;

    move-result-object v0

    .line 278
    .local v0, "converter":Lorg/apache/commons/beanutils/locale/LocaleConverter;
    if-nez v0, :cond_5e

    .line 279
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_83

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_5a
    invoke-virtual {p0, v1, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;

    move-result-object v0

    .line 281
    :cond_5e
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_7e

    .line 282
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "  Using converter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 285
    :cond_7e
    invoke-interface {v0, p2, p1, p4}, Lorg/apache/commons/beanutils/locale/LocaleConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 279
    :cond_83
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_5a
.end method

.method public convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 318
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getDefaultLocale()Ljava/util/Locale;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert([Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getDefaultLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public convert([Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "pattern"    # Ljava/lang/String;

    .prologue
    .line 336
    move-object v2, p2

    .line 337
    .local v2, "type":Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 338
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 340
    :cond_b
    iget-object v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 341
    iget-object v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Convert String["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    array-length v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "] to class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "[] using "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " locale and "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " pattern"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 346
    :cond_54
    array-length v3, p1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 347
    .local v0, "array":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5a
    array-length v3, p1

    if-ge v1, v3, :cond_69

    .line 348
    aget-object v3, p1, v1

    invoke-virtual {p0, v3, v2, p3, p4}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v3}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 347
    add-int/lit8 v1, v1, 0x1

    goto :goto_5a

    .line 351
    :cond_69
    return-object v0
.end method

.method public convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 183
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public convert(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 215
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_23

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p0, v1, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;

    move-result-object v0

    .line 217
    .local v0, "converter":Lorg/apache/commons/beanutils/locale/LocaleConverter;
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_26

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_1c
    invoke-interface {v0, v1, p1, p3}, Lorg/apache/commons/beanutils/locale/LocaleConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 215
    .end local v0    # "converter":Lorg/apache/commons/beanutils/locale/LocaleConverter;
    :cond_23
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_c

    .line 217
    .restart local v0    # "converter":Lorg/apache/commons/beanutils/locale/LocaleConverter;
    :cond_26
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1c
.end method

.method protected create(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 463
    new-instance v0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;

    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtils;->createCache()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;-><init>(Ljava/util/Map;Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1;)V

    .line 464
    .local v0, "converter":Lorg/apache/commons/collections/FastHashMap;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 466
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v1, :cond_163

    const-string v1, "java.math.BigDecimal"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_1a
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/BigDecimalLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/BigDecimalLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v1, :cond_167

    const-string v1, "java.math.BigInteger"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_30
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/BigIntegerLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v1, :cond_16b

    const-string v1, "java.lang.Byte"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_46
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/ByteLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/ByteLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/ByteLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/ByteLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v1, :cond_16f

    const-string v1, "java.lang.Double"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    :goto_68
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/DoubleLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v1, :cond_173

    const-string v1, "java.lang.Float"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    :goto_8a
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/FloatLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v1, :cond_177

    const-string v1, "java.lang.Integer"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_ac
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/IntegerLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/IntegerLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/IntegerLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/IntegerLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v1, :cond_17b

    const-string v1, "java.lang.Long"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    :goto_ce
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/LongLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/LongLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/LongLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/LongLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v1, :cond_17f

    const-string v1, "java.lang.Short"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    :goto_f0
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/ShortLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/ShortLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/ShortLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/ShortLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_183

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_112
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;

    iget-boolean v3, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/StringLocaleConverter;-><init>(Ljava/util/Locale;Z)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v1, :cond_186

    const-string v1, "java.sql.Date"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    :goto_128
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/SqlDateLocaleConverter;

    const-string v3, "yyyy-MM-dd"

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/SqlDateLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v1, :cond_189

    const-string v1, "java.sql.Time"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    :goto_13e
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/SqlTimeLocaleConverter;

    const-string v3, "HH:mm:ss"

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/SqlTimeLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v1, :cond_18c

    const-string v1, "java.sql.Timestamp"

    invoke-static {v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_154
    new-instance v2, Lorg/apache/commons/beanutils/locale/converters/SqlTimestampLocaleConverter;

    const-string v3, "yyyy-MM-dd HH:mm:ss.S"

    invoke-direct {v2, p1, v3}, Lorg/apache/commons/beanutils/locale/converters/SqlTimestampLocaleConverter;-><init>(Ljava/util/Locale;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 499
    return-object v0

    .line 466
    :cond_163
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto/16 :goto_1a

    .line 467
    :cond_167
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    goto/16 :goto_30

    .line 469
    :cond_16b
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_46

    .line 472
    :cond_16f
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    goto/16 :goto_68

    .line 475
    :cond_173
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    goto/16 :goto_8a

    .line 478
    :cond_177
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_ac

    .line 481
    :cond_17b
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    goto/16 :goto_ce

    .line 484
    :cond_17f
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_f0

    .line 487
    :cond_183
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_112

    .line 491
    :cond_186
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    goto :goto_128

    .line 492
    :cond_189
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    goto :goto_13e

    .line 493
    :cond_18c
    sget-object v1, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_154
.end method

.method public deregister()V
    .registers 4

    .prologue
    .line 373
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    .line 375
    .local v0, "defaultConverter":Lorg/apache/commons/collections/FastHashMap;
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 377
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v1}, Lorg/apache/commons/collections/FastHashMap;->clear()V

    .line 378
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    invoke-virtual {v1, v2, v0}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 381
    return-void
.end method

.method public deregister(Ljava/lang/Class;Ljava/util/Locale;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 403
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    return-void
.end method

.method public deregister(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 391
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    return-void
.end method

.method public getApplyLocalized()Z
    .registers 2

    .prologue
    .line 158
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    return v0
.end method

.method public getDefaultLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;
    .registers 7
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 417
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/locale/LocaleConverter;

    .line 419
    .local v0, "converter":Lorg/apache/commons/beanutils/locale/LocaleConverter;
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 420
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "LocaleConverter:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 423
    :cond_2a
    return-object v0
.end method

.method protected lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 438
    if-nez p1, :cond_d

    .line 439
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/FastHashMap;

    .line 450
    .local v0, "localeConverters":Lorg/apache/commons/collections/FastHashMap;
    :cond_c
    :goto_c
    return-object v0

    .line 442
    .end local v0    # "localeConverters":Lorg/apache/commons/collections/FastHashMap;
    :cond_d
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v1, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/FastHashMap;

    .line 444
    .restart local v0    # "localeConverters":Lorg/apache/commons/collections/FastHashMap;
    if-nez v0, :cond_c

    .line 445
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->create(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    .line 446
    iget-object v1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->mapConverters:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v1, p1, v0}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c
.end method

.method public register(Lorg/apache/commons/beanutils/locale/LocaleConverter;Ljava/lang/Class;Ljava/util/Locale;)V
    .registers 5
    .param p1, "converter"    # Lorg/apache/commons/beanutils/locale/LocaleConverter;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 365
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    return-void
.end method

.method public setApplyLocalized(Z)V
    .registers 2
    .param p1, "newApplyLocalized"    # Z

    .prologue
    .line 168
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->applyLocalized:Z

    .line 169
    return-void
.end method

.method public setDefaultLocale(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 143
    if-nez p1, :cond_9

    .line 144
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    .line 149
    :goto_8
    return-void

    .line 147
    :cond_9
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->defaultLocale:Ljava/util/Locale;

    goto :goto_8
.end method
