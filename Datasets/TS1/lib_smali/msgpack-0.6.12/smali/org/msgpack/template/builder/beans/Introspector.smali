.class public Lorg/msgpack/template/builder/beans/Introspector;
.super Ljava/lang/Object;
.source "Introspector.java"


# static fields
.field private static final DEFAULT_BEANINFO_SEARCHPATH:Ljava/lang/String; = "sun.beans.infos"

.field private static final DEFAULT_CAPACITY:I = 0x80

.field public static final IGNORE_ALL_BEANINFO:I = 0x3

.field public static final IGNORE_IMMEDIATE_BEANINFO:I = 0x2

.field public static final USE_ALL_BEANINFO:I = 0x1

.field private static searchPath:[Ljava/lang/String;

.field private static theCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/msgpack/template/builder/beans/StandardBeanInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 81
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "sun.beans.infos"

    aput-object v2, v0, v1

    sput-object v0, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    .line 86
    new-instance v0, Ljava/util/WeakHashMap;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/beans/Introspector;->theCache:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    return-void
.end method

.method public static decapitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 105
    if-nez p0, :cond_6

    .line 106
    const/4 p0, 0x0

    .line 117
    .end local p0    # "name":Ljava/lang/String;
    :cond_5
    :goto_5
    return-object p0

    .line 111
    .restart local p0    # "name":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_1c

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_5

    .line 115
    :cond_1c
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 116
    .local v0, "chars":[C
    aget-char v1, v0, v2

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    aput-char v1, v0, v2

    .line 117
    new-instance p0, Ljava/lang/String;

    .end local p0    # "name":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_5
.end method

.method public static flushCaches()V
    .registers 1

    .prologue
    .line 127
    sget-object v0, Lorg/msgpack/template/builder/beans/Introspector;->theCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 128
    return-void
.end method

.method public static flushFromCaches(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p0, :cond_8

    .line 138
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 140
    :cond_8
    sget-object v0, Lorg/msgpack/template/builder/beans/Introspector;->theCache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    return-void
.end method

.method public static getBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/builder/beans/BeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Lorg/msgpack/template/builder/beans/Introspector;->theCache:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    .line 161
    .local v0, "beanInfo":Lorg/msgpack/template/builder/beans/StandardBeanInfo;
    if-nez v0, :cond_15

    .line 162
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfoImplAndInit(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    move-result-object v0

    .line 163
    sget-object v1, Lorg/msgpack/template/builder/beans/Introspector;->theCache:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_15
    return-object v0
.end method

.method public static getBeanInfo(Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 3
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;I)",
            "Lorg/msgpack/template/builder/beans/BeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    if-ne p1, v0, :cond_8

    .line 228
    invoke-static {p0}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;

    move-result-object v0

    .line 230
    :goto_7
    return-object v0

    :cond_8
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfoImplAndInit(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    move-result-object v0

    goto :goto_7
.end method

.method public static getBeanInfo(Ljava/lang/Class;Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/builder/beans/BeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "stopClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_7

    .line 191
    invoke-static {p0}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;

    move-result-object v0

    .line 193
    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfoImplAndInit(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    move-result-object v0

    goto :goto_6
.end method

.method private static getBeanInfoImpl(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;
    .registers 12
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;I)",
            "Lorg/msgpack/template/builder/beans/StandardBeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "stopClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x1

    .line 258
    const/4 v2, 0x0

    .line 259
    .local v2, "explicitInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    if-ne p2, v6, :cond_8

    .line 260
    invoke-static {p0}, Lorg/msgpack/template/builder/beans/Introspector;->getExplicitBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;

    move-result-object v2

    .line 262
    :cond_8
    new-instance v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    invoke-direct {v0, p0, v2, p1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;-><init>(Ljava/lang/Class;Lorg/msgpack/template/builder/beans/BeanInfo;Ljava/lang/Class;)V

    .line 264
    .local v0, "beanInfo":Lorg/msgpack/template/builder/beans/StandardBeanInfo;
    iget-object v7, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

    if-eqz v7, :cond_22

    .line 265
    iget-object v7, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

    array-length v7, v7

    add-int/lit8 v3, v7, -0x1

    .local v3, "i":I
    :goto_16
    if-ltz v3, :cond_22

    .line 266
    iget-object v7, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

    aget-object v4, v7, v3

    .line 267
    .local v4, "info":Lorg/msgpack/template/builder/beans/BeanInfo;
    invoke-virtual {v0, v4, v6}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeBeanInfo(Lorg/msgpack/template/builder/beans/BeanInfo;Z)V

    .line 265
    add-int/lit8 v3, v3, -0x1

    goto :goto_16

    .line 272
    .end local v3    # "i":I
    .end local v4    # "info":Lorg/msgpack/template/builder/beans/BeanInfo;
    :cond_22
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 273
    .local v1, "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v1, p1, :cond_3f

    .line 274
    if-nez v1, :cond_32

    .line 275
    new-instance v7, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v8, "Stop class is not super class of bean class"

    invoke-direct {v7, v8}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 277
    :cond_32
    const/4 v7, 0x2

    if-ne p2, v7, :cond_40

    .line 279
    .local v6, "superflags":I
    :goto_35
    invoke-static {v1, p1, v6}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfoImpl(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    move-result-object v5

    .line 281
    .local v5, "superBeanInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    if-eqz v5, :cond_3f

    .line 282
    const/4 v7, 0x0

    invoke-virtual {v0, v5, v7}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeBeanInfo(Lorg/msgpack/template/builder/beans/BeanInfo;Z)V

    .line 285
    .end local v5    # "superBeanInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    .end local v6    # "superflags":I
    :cond_3f
    return-object v0

    :cond_40
    move v6, p2

    .line 277
    goto :goto_35
.end method

.method private static getBeanInfoImplAndInit(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;
    .registers 4
    .param p2, "flag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;I)",
            "Lorg/msgpack/template/builder/beans/StandardBeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 360
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "stopClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfoImpl(Ljava/lang/Class;Ljava/lang/Class;I)Lorg/msgpack/template/builder/beans/StandardBeanInfo;

    move-result-object v0

    .line 362
    .local v0, "standardBeanInfo":Lorg/msgpack/template/builder/beans/StandardBeanInfo;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->init()V

    .line 363
    return-object v0
.end method

.method public static getBeanInfoSearchPath()[Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 239
    sget-object v1, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    array-length v1, v1

    new-array v0, v1, [Ljava/lang/String;

    .line 240
    .local v0, "path":[Ljava/lang/String;
    sget-object v1, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    sget-object v2, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 241
    return-object v0
.end method

.method private static getExplicitBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/builder/beans/BeanInfo;"
        }
    .end annotation

    .prologue
    .line 289
    .local p0, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "BeanInfo"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 291
    .local v1, "beanInfoClassName":Ljava/lang/String;
    :try_start_17
    invoke-static {v1, p0}, Lorg/msgpack/template/builder/beans/Introspector;->loadBeanInfo(Ljava/lang/String;Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_1c

    move-result-object v6

    .line 322
    :cond_1b
    :goto_1b
    return-object v6

    .line 292
    :catch_1c
    move-exception v7

    .line 296
    const/16 v7, 0x2e

    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 297
    .local v5, "index":I
    if-ltz v5, :cond_61

    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 299
    .local v2, "beanInfoName":Ljava/lang/String;
    :goto_2b
    const/4 v6, 0x0

    .line 300
    .local v6, "theBeanInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    const/4 v0, 0x0

    .line 301
    .local v0, "beanDescriptor":Lorg/msgpack/template/builder/beans/BeanDescriptor;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2e
    sget-object v7, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    array-length v7, v7

    if-ge v4, v7, :cond_65

    .line 302
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    aget-object v8, v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 304
    :try_start_4e
    invoke-static {v1, p0}, Lorg/msgpack/template/builder/beans/Introspector;->loadBeanInfo(Ljava/lang/String;Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_51} :catch_63

    move-result-object v6

    .line 309
    invoke-interface {v6}, Lorg/msgpack/template/builder/beans/BeanInfo;->getBeanDescriptor()Lorg/msgpack/template/builder/beans/BeanDescriptor;

    move-result-object v0

    .line 310
    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/BeanDescriptor;->getBeanClass()Ljava/lang/Class;

    move-result-object v7

    if-eq p0, v7, :cond_1b

    .line 301
    :cond_5e
    :goto_5e
    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    .end local v0    # "beanDescriptor":Lorg/msgpack/template/builder/beans/BeanDescriptor;
    .end local v2    # "beanInfoName":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v6    # "theBeanInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    :cond_61
    move-object v2, v1

    .line 297
    goto :goto_2b

    .line 305
    .restart local v0    # "beanDescriptor":Lorg/msgpack/template/builder/beans/BeanDescriptor;
    .restart local v2    # "beanInfoName":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v6    # "theBeanInfo":Lorg/msgpack/template/builder/beans/BeanInfo;
    :catch_63
    move-exception v3

    .line 307
    .local v3, "e":Ljava/lang/Exception;
    goto :goto_5e

    .line 315
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_65
    const-class v7, Lorg/msgpack/template/builder/beans/BeanInfo;

    invoke-virtual {v7, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_77

    .line 317
    :try_start_6d
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p0}, Lorg/msgpack/template/builder/beans/Introspector;->loadBeanInfo(Ljava/lang/String;Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_74} :catch_76

    move-result-object v6

    goto :goto_1b

    .line 318
    :catch_76
    move-exception v7

    .line 322
    :cond_77
    const/4 v6, 0x0

    goto :goto_1b
.end method

.method private static loadBeanInfo(Ljava/lang/String;Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 6
    .param p0, "beanInfoClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/builder/beans/BeanInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    .line 340
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 341
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_18

    .line 342
    const/4 v1, 0x1

    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {p0, v1, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_16} :catch_17

    .line 354
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    :goto_16
    return-object v1

    .line 345
    :catch_17
    move-exception v1

    .line 349
    :cond_18
    const/4 v1, 0x1

    :try_start_19
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-static {p0, v1, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_27} :catch_28

    goto :goto_16

    .line 351
    :catch_28
    move-exception v1

    .line 354
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p0, v3, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/builder/beans/BeanInfo;

    goto :goto_16
.end method

.method public static setBeanInfoSearchPath([Ljava/lang/String;)V
    .registers 2
    .param p0, "path"    # [Ljava/lang/String;

    .prologue
    .line 250
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 251
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/SecurityManager;->checkPropertiesAccess()V

    .line 253
    :cond_d
    sput-object p0, Lorg/msgpack/template/builder/beans/Introspector;->searchPath:[Ljava/lang/String;

    .line 254
    return-void
.end method
