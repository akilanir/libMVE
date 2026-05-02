.class public Lorg/apache/commons/beanutils/BeanUtils;
.super Ljava/lang/Object;
.source "BeanUtils.java"


# static fields
.field private static debug:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/4 v0, 0x0

    sput v0, Lorg/apache/commons/beanutils/BeanUtils;->debug:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cloneBean(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->cloneBean(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static copyProperties(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "dest"    # Ljava/lang/Object;
    .param p1, "orig"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->copyProperties(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    return-void
.end method

.method public static copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    return-void
.end method

.method public static createCache()Ljava/util/Map;
    .registers 1

    .prologue
    .line 477
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>()V

    return-object v0
.end method

.method public static describe(Ljava/lang/Object;)Ljava/util/Map;
    .registers 2
    .param p0, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 185
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->describe(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static getArrayProperty(Ljava/lang/Object;Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 211
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getArrayProperty(Ljava/lang/Object;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCacheFast(Ljava/util/Map;)Z
    .registers 2
    .param p0, "map"    # Ljava/util/Map;

    .prologue
    .line 487
    instance-of v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    if-eqz v0, :cond_b

    .line 488
    check-cast p0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    .end local p0    # "map":Ljava/util/Map;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->getFast()Z

    move-result v0

    .line 490
    :goto_a
    return v0

    .restart local p0    # "map":Ljava/util/Map;
    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static getDebug()I
    .registers 1

    .prologue
    .line 70
    sget v0, Lorg/apache/commons/beanutils/BeanUtils;->debug:I

    return v0
.end method

.method public static getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/String;
    .registers 4
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 268
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 296
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 382
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 409
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z
    .registers 3
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 468
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v0

    return v0
.end method

.method public static populate(Ljava/lang/Object;Ljava/util/Map;)V
    .registers 3
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "properties"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 433
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/BeanUtilsBean;->populate(Ljava/lang/Object;Ljava/util/Map;)V

    .line 434
    return-void
.end method

.method public static setCacheFast(Ljava/util/Map;Z)V
    .registers 3
    .param p0, "map"    # Ljava/util/Map;
    .param p1, "fast"    # Z

    .prologue
    .line 501
    instance-of v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    if-eqz v0, :cond_9

    .line 502
    check-cast p0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    .end local p0    # "map":Ljava/util/Map;
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 504
    :cond_9
    return-void
.end method

.method public static setDebug(I)V
    .registers 1
    .param p0, "newDebug"    # I

    .prologue
    .line 81
    sput p0, Lorg/apache/commons/beanutils/BeanUtils;->debug:I

    .line 82
    return-void
.end method

.method public static setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 456
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 457
    return-void
.end method
