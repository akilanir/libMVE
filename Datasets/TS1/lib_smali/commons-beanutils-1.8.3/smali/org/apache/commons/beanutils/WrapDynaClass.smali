.class public Lorg/apache/commons/beanutils/WrapDynaClass;
.super Ljava/lang/Object;
.source "WrapDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaClass;


# static fields
.field private static final CLASSLOADER_CACHE:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

.field static class$java$util$Map:Ljava/lang/Class;

.field protected static dynaClasses:Ljava/util/HashMap;


# instance fields
.field protected beanClass:Ljava/lang/Class;

.field private beanClassName:Ljava/lang/String;

.field private beanClassRef:Ljava/lang/ref/Reference;

.field protected descriptors:[Ljava/beans/PropertyDescriptor;

.field protected descriptorsMap:Ljava/util/HashMap;

.field protected properties:[Lorg/apache/commons/beanutils/DynaProperty;

.field protected propertiesMap:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 125
    new-instance v0, Lorg/apache/commons/beanutils/WrapDynaClass$1;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WrapDynaClass$1;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/WrapDynaClass;->CLASSLOADER_CACHE:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

    .line 175
    new-instance v0, Lorg/apache/commons/beanutils/WrapDynaClass$2;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WrapDynaClass$2;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/WrapDynaClass;->dynaClasses:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .param p1, "beanClass"    # Ljava/lang/Class;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object v1, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassName:Ljava/lang/String;

    .line 83
    iput-object v1, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassRef:Ljava/lang/ref/Reference;

    .line 91
    iput-object v1, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClass:Ljava/lang/Class;

    .line 97
    iput-object v1, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->descriptors:[Ljava/beans/PropertyDescriptor;

    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->descriptorsMap:Ljava/util/HashMap;

    .line 111
    iput-object v1, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->propertiesMap:Ljava/util/HashMap;

    .line 66
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassRef:Ljava/lang/ref/Reference;

    .line 67
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassName:Ljava/lang/String;

    .line 68
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WrapDynaClass;->introspect()V

    .line 70
    return-void
.end method

.method static access$000()Ljava/util/Map;
    .registers 1

    .prologue
    .line 51
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->getDynaClassesMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 410
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

.method public static clear()V
    .registers 1

    .prologue
    .line 345
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->getDynaClassesMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 347
    return-void
.end method

.method public static createDynaClass(Ljava/lang/Class;)Lorg/apache/commons/beanutils/WrapDynaClass;
    .registers 3
    .param p0, "beanClass"    # Ljava/lang/Class;

    .prologue
    .line 359
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->getDynaClassesMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/WrapDynaClass;

    .line 361
    .local v0, "dynaClass":Lorg/apache/commons/beanutils/WrapDynaClass;
    if-nez v0, :cond_18

    .line 362
    new-instance v0, Lorg/apache/commons/beanutils/WrapDynaClass;

    .end local v0    # "dynaClass":Lorg/apache/commons/beanutils/WrapDynaClass;
    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/WrapDynaClass;-><init>(Ljava/lang/Class;)V

    .line 363
    .restart local v0    # "dynaClass":Lorg/apache/commons/beanutils/WrapDynaClass;
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->getDynaClassesMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    :cond_18
    return-object v0
.end method

.method private static getDynaClassesMap()Ljava/util/Map;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/apache/commons/beanutils/WrapDynaClass;->CLASSLOADER_CACHE:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method protected getBeanClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassRef:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 260
    if-nez p1, :cond_a

    .line 261
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No property name specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 264
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 243
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->beanClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyDescriptor(Ljava/lang/String;)Ljava/beans/PropertyDescriptor;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 332
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->descriptorsMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/beans/PropertyDescriptor;

    return-object v0
.end method

.method protected introspect()V
    .registers 13

    .prologue
    .line 379
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WrapDynaClass;->getBeanClass()Ljava/lang/Class;

    move-result-object v0

    .line 380
    .local v0, "beanClass":Ljava/lang/Class;
    invoke-static {v0}, Lorg/apache/commons/beanutils/PropertyUtils;->getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;

    move-result-object v7

    .line 382
    .local v7, "regulars":[Ljava/beans/PropertyDescriptor;
    if-nez v7, :cond_d

    .line 383
    const/4 v8, 0x0

    new-array v7, v8, [Ljava/beans/PropertyDescriptor;

    .line 385
    :cond_d
    invoke-static {v0}, Lorg/apache/commons/beanutils/PropertyUtils;->getMappedPropertyDescriptors(Ljava/lang/Class;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v4

    .line 387
    .local v4, "mappeds":Ljava/util/Map;
    if-nez v4, :cond_18

    .line 388
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "mappeds":Ljava/util/Map;
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 392
    .restart local v4    # "mappeds":Ljava/util/Map;
    :cond_18
    array-length v8, v7

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v9

    add-int/2addr v8, v9

    new-array v8, v8, [Lorg/apache/commons/beanutils/DynaProperty;

    iput-object v8, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 393
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_23
    array-length v8, v7

    if-ge v2, v8, :cond_5c

    .line 394
    iget-object v8, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->descriptorsMap:Ljava/util/HashMap;

    aget-object v9, v7, v2

    invoke-virtual {v9}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v9

    aget-object v10, v7, v2

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    iget-object v8, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    new-instance v9, Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v10, v7, v2

    invoke-virtual {v10}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v10

    aget-object v11, v7, v2

    invoke-virtual {v11}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v9, v8, v2

    .line 399
    iget-object v8, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->propertiesMap:Ljava/util/HashMap;

    iget-object v9, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v9, v9, v2

    invoke-virtual {v9}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v10, v10, v2

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    .line 402
    :cond_5c
    array-length v3, v7

    .line 403
    .local v3, "j":I
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 404
    .local v6, "names":Ljava/util/Iterator;
    :goto_65
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a7

    .line 405
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 406
    .local v5, "name":Ljava/lang/String;
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/beans/PropertyDescriptor;

    .line 408
    .local v1, "descriptor":Ljava/beans/PropertyDescriptor;
    iget-object v9, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    new-instance v10, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-virtual {v1}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v11

    sget-object v8, Lorg/apache/commons/beanutils/WrapDynaClass;->class$java$util$Map:Ljava/lang/Class;

    if-nez v8, :cond_a4

    const-string v8, "java.util.Map"

    invoke-static {v8}, Lorg/apache/commons/beanutils/WrapDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/commons/beanutils/WrapDynaClass;->class$java$util$Map:Ljava/lang/Class;

    :goto_8b
    invoke-direct {v10, v11, v8}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v10, v9, v3

    .line 411
    iget-object v8, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->propertiesMap:Ljava/util/HashMap;

    iget-object v9, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v9, v9, v3

    invoke-virtual {v9}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/commons/beanutils/WrapDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    aget-object v10, v10, v3

    invoke-virtual {v8, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    add-int/lit8 v3, v3, 0x1

    .line 414
    goto :goto_65

    .line 408
    :cond_a4
    sget-object v8, Lorg/apache/commons/beanutils/WrapDynaClass;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_8b

    .line 416
    .end local v1    # "descriptor":Ljava/beans/PropertyDescriptor;
    .end local v5    # "name":Ljava/lang/String;
    :cond_a7
    return-void
.end method

.method public newInstance()Lorg/apache/commons/beanutils/DynaBean;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 315
    new-instance v0, Lorg/apache/commons/beanutils/WrapDynaBean;

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WrapDynaClass;->getBeanClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/WrapDynaBean;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method
