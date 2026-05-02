.class public Lorg/apache/commons/beanutils/locale/LocaleConvertUtils;
.super Ljava/lang/Object;
.source "LocaleConvertUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 152
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 170
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 222
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert([Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert([Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "pattern"    # Ljava/lang/String;

    .prologue
    .line 240
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 104
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static create(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;
    .registers 2
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 346
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->create(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    return-object v0
.end method

.method public static deregister()V
    .registers 1

    .prologue
    .line 269
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->deregister()V

    .line 270
    return-void
.end method

.method public static deregister(Ljava/lang/Class;Ljava/util/Locale;)V
    .registers 3
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 298
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->deregister(Ljava/lang/Class;Ljava/util/Locale;)V

    .line 299
    return-void
.end method

.method public static deregister(Ljava/util/Locale;)V
    .registers 2
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 283
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->deregister(Ljava/util/Locale;)V

    .line 284
    return-void
.end method

.method public static getApplyLocalized()Z
    .registers 1

    .prologue
    .line 76
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getApplyLocalized()Z

    move-result v0

    return v0
.end method

.method public static getDefaultLocale()Ljava/util/Locale;
    .registers 1

    .prologue
    .line 49
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getDefaultLocale()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public static lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;
    .registers 3
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 315
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/util/Locale;)Lorg/apache/commons/beanutils/locale/LocaleConverter;

    move-result-object v0

    return-object v0
.end method

.method protected static lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;
    .registers 2
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 330
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->lookup(Ljava/util/Locale;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    return-object v0
.end method

.method public static register(Lorg/apache/commons/beanutils/locale/LocaleConverter;Ljava/lang/Class;Ljava/util/Locale;)V
    .registers 4
    .param p0, "converter"    # Lorg/apache/commons/beanutils/locale/LocaleConverter;
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 257
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->register(Lorg/apache/commons/beanutils/locale/LocaleConverter;Ljava/lang/Class;Ljava/util/Locale;)V

    .line 258
    return-void
.end method

.method public static setApplyLocalized(Z)V
    .registers 2
    .param p0, "newApplyLocalized"    # Z

    .prologue
    .line 89
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->setApplyLocalized(Z)V

    .line 90
    return-void
.end method

.method public static setDefaultLocale(Ljava/util/Locale;)V
    .registers 2
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 63
    invoke-static {}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;->setDefaultLocale(Ljava/util/Locale;)V

    .line 64
    return-void
.end method
