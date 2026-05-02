.class Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;
.super Lorg/apache/commons/collections/FastHashMap;
.source "LocaleConvertUtilsBean.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DelegateFastHashMap"
.end annotation


# instance fields
.field private final map:Ljava/util/Map;


# direct methods
.method private constructor <init>(Ljava/util/Map;)V
    .registers 2
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 514
    invoke-direct {p0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    .line 515
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    .line 516
    return-void
.end method

.method constructor <init>(Ljava/util/Map;Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/util/Map;
    .param p2, "x1"    # Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1;

    .prologue
    .line 510
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;-><init>(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 518
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 519
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 521
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 524
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 530
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 533
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getFast()Z
    .registers 2

    .prologue
    .line 560
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-static {v0}, Lorg/apache/commons/beanutils/BeanUtils;->getCacheFast(Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 536
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 539
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 542
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 545
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 548
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 549
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 551
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setFast(Z)V
    .registers 3
    .param p1, "fast"    # Z

    .prologue
    .line 563
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-static {v0, p1}, Lorg/apache/commons/beanutils/BeanUtils;->setCacheFast(Ljava/util/Map;Z)V

    .line 564
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 554
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 557
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
