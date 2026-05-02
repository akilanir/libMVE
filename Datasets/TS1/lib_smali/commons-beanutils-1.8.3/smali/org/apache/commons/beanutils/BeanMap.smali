.class public Lorg/apache/commons/beanutils/BeanMap;
.super Ljava/util/AbstractMap;
.source "BeanMap.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/BeanMap$Entry;
    }
.end annotation


# static fields
.field public static final NULL_ARGUMENTS:[Ljava/lang/Object;

.field public static defaultTransformers:Ljava/util/HashMap;

.field private static final typeTransformers:Ljava/util/Map;


# instance fields
.field private transient bean:Ljava/lang/Object;

.field private transient readMethods:Ljava/util/HashMap;

.field private transient types:Ljava/util/HashMap;

.field private transient writeMethods:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 64
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/beanutils/BeanMap;->NULL_ARGUMENTS:[Ljava/lang/Object;

    .line 72
    invoke-static {}, Lorg/apache/commons/beanutils/BeanMap;->createTypeTransformers()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BeanMap;->typeTransformers:Ljava/util/Map;

    .line 81
    new-instance v0, Lorg/apache/commons/beanutils/BeanMap$1;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/BeanMap$1;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/BeanMap;->defaultTransformers:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->types:Ljava/util/HashMap;

    .line 197
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->types:Ljava/util/HashMap;

    .line 207
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    .line 208
    invoke-direct {p0}, Lorg/apache/commons/beanutils/BeanMap;->initialise()V

    .line 209
    return-void
.end method

.method static access$000()Ljava/util/Map;
    .registers 1

    .prologue
    .line 53
    sget-object v0, Lorg/apache/commons/beanutils/BeanMap;->typeTransformers:Ljava/util/Map;

    return-object v0
.end method

.method static access$100(Lorg/apache/commons/beanutils/BeanMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/BeanMap;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    return-object v0
.end method

.method private static createTypeTransformers()Ljava/util/Map;
    .registers 3

    .prologue
    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 122
    .local v0, "defaultTransformers":Ljava/util/Map;
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$2;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$2;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$3;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$3;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$4;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$4;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$5;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$5;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$6;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$6;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$7;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$7;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$8;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$8;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v2, Lorg/apache/commons/beanutils/BeanMap$9;

    invoke-direct {v2}, Lorg/apache/commons/beanutils/BeanMap$9;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    return-object v0
.end method

.method private initialise()V
    .registers 12

    .prologue
    .line 659
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->getBean()Ljava/lang/Object;

    move-result-object v10

    if-nez v10, :cond_7

    .line 691
    :cond_6
    :goto_6
    return-void

    .line 663
    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->getBean()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 666
    .local v1, "beanClass":Ljava/lang/Class;
    :try_start_f
    invoke-static {v1}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;

    move-result-object v2

    .line 667
    .local v2, "beanInfo":Ljava/beans/BeanInfo;
    invoke-interface {v2}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;

    move-result-object v7

    .line 668
    .local v7, "propertyDescriptors":[Ljava/beans/PropertyDescriptor;
    if-eqz v7, :cond_6

    .line 669
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1a
    array-length v10, v7

    if-ge v4, v10, :cond_6

    .line 670
    aget-object v6, v7, v4

    .line 671
    .local v6, "propertyDescriptor":Ljava/beans/PropertyDescriptor;
    if-eqz v6, :cond_44

    .line 672
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v5

    .line 673
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v8

    .line 674
    .local v8, "readMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    .line 675
    .local v9, "writeMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v0

    .line 677
    .local v0, "aType":Ljava/lang/Class;
    if-eqz v8, :cond_38

    .line 678
    iget-object v10, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v10, v5, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    :cond_38
    if-eqz v9, :cond_3f

    .line 681
    iget-object v10, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    invoke-virtual {v10, v5, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    :cond_3f
    iget-object v10, p0, Lorg/apache/commons/beanutils/BeanMap;->types:Ljava/util/HashMap;

    invoke-virtual {v10, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Ljava/beans/IntrospectionException; {:try_start_f .. :try_end_44} :catch_47

    .line 669
    .end local v0    # "aType":Ljava/lang/Class;
    .end local v5    # "name":Ljava/lang/String;
    .end local v8    # "readMethod":Ljava/lang/reflect/Method;
    .end local v9    # "writeMethod":Ljava/lang/reflect/Method;
    :cond_44
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    .line 688
    .end local v2    # "beanInfo":Ljava/beans/BeanInfo;
    .end local v4    # "i":I
    .end local v6    # "propertyDescriptor":Ljava/beans/PropertyDescriptor;
    .end local v7    # "propertyDescriptors":[Ljava/beans/PropertyDescriptor;
    :catch_47
    move-exception v3

    .line 689
    .local v3, "e":Ljava/beans/IntrospectionException;
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/BeanMap;->logWarn(Ljava/lang/Exception;)V

    goto :goto_6
.end method


# virtual methods
.method public clear()V
    .registers 6

    .prologue
    .line 323
    iget-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    if-nez v2, :cond_5

    .line 335
    :goto_4
    return-void

    .line 327
    :cond_5
    const/4 v0, 0x0

    .line 329
    .local v0, "beanClass":Ljava/lang/Class;
    :try_start_6
    iget-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 330
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_12} :catch_13

    goto :goto_4

    .line 332
    :catch_13
    move-exception v1

    .line 333
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Could not create new instance of class: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public clone()Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 250
    invoke-super {p0}, Ljava/util/AbstractMap;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/beanutils/BeanMap;

    .line 252
    .local v5, "newMap":Lorg/apache/commons/beanutils/BeanMap;
    iget-object v7, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    if-nez v7, :cond_b

    .line 294
    :cond_a
    return-object v5

    .line 258
    :cond_b
    const/4 v4, 0x0

    .line 259
    .local v4, "newBean":Ljava/lang/Object;
    iget-object v7, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 261
    .local v0, "beanClass":Ljava/lang/Class;
    :try_start_12
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_15} :catch_55

    move-result-object v4

    .line 270
    :try_start_16
    invoke-virtual {v5, v4}, Lorg/apache/commons/beanutils/BeanMap;->setBean(Ljava/lang/Object;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_19} :catch_7d

    .line 281
    :try_start_19
    iget-object v7, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 282
    .local v6, "readableKeys":Ljava/util/Iterator;
    :cond_23
    :goto_23
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 283
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 284
    .local v3, "key":Ljava/lang/Object;
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/BeanMap;->getWriteMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v7

    if-eqz v7, :cond_23

    .line 285
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Lorg/apache/commons/beanutils/BeanMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3a} :catch_3b

    goto :goto_23

    .line 288
    .end local v3    # "key":Ljava/lang/Object;
    .end local v6    # "readableKeys":Ljava/util/Iterator;
    :catch_3b
    move-exception v2

    .line 289
    .local v2, "exception":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/CloneNotSupportedException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unable to copy bean values to cloned bean map: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/CloneNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 262
    .end local v2    # "exception":Ljava/lang/Exception;
    :catch_55
    move-exception v1

    .line 264
    .local v1, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/CloneNotSupportedException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unable to instantiate the underlying bean \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/CloneNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 271
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_7d
    move-exception v2

    .line 272
    .restart local v2    # "exception":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/CloneNotSupportedException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unable to set bean in the cloned bean map: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/CloneNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    .line 353
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->getReadMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 354
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_8

    const/4 v1, 0x1

    :goto_7
    return v1

    :cond_8
    const/4 v1, 0x0

    goto :goto_7
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 367
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected convertType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "newType"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 818
    new-array v4, v5, [Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    aput-object v5, v4, v6

    .line 820
    .local v4, "types":[Ljava/lang/Class;
    :try_start_a
    invoke-virtual {p1, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 821
    .local v1, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v0, v5

    .line 822
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a .. :try_end_17} :catch_19

    move-result-object p2

    .line 830
    .end local v0    # "arguments":[Ljava/lang/Object;
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;
    .end local p2    # "value":Ljava/lang/Object;
    :cond_18
    :goto_18
    return-object p2

    .line 824
    .restart local p2    # "value":Ljava/lang/Object;
    :catch_19
    move-exception v2

    .line 826
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->getTypeTransformer(Ljava/lang/Class;)Lorg/apache/commons/collections/Transformer;

    move-result-object v3

    .line 827
    .local v3, "transformer":Lorg/apache/commons/collections/Transformer;
    if-eqz v3, :cond_18

    .line 828
    invoke-interface {v3, p2}, Lorg/apache/commons/collections/Transformer;->transform(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_18
.end method

.method protected createWriteMethodArguments(Ljava/lang/reflect/Method;Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 9
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .prologue
    .line 761
    if-eqz p2, :cond_1c

    .line 762
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    .line 763
    .local v3, "types":[Ljava/lang/Class;
    if-eqz v3, :cond_1c

    array-length v4, v3

    if-lez v4, :cond_1c

    .line 764
    const/4 v4, 0x0

    aget-object v2, v3, v4

    .line 765
    .local v2, "paramType":Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 766
    invoke-virtual {p0, v2, p2}, Lorg/apache/commons/beanutils/BeanMap;->convertType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 770
    .end local v2    # "paramType":Ljava/lang/Class;
    .end local v3    # "types":[Ljava/lang/Class;
    :cond_1c
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v0, v4
    :try_end_22
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_22} :catch_23
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_22} :catch_31

    .line 771
    .local v0, "answer":[Ljava/lang/Object;
    return-object v0

    .line 773
    .end local v0    # "answer":[Ljava/lang/Object;
    :catch_23
    move-exception v1

    .line 774
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/BeanMap;->logInfo(Ljava/lang/Exception;)V

    .line 775
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 777
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_31
    move-exception v1

    .line 778
    .local v1, "e":Ljava/lang/InstantiationException;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/BeanMap;->logInfo(Ljava/lang/Exception;)V

    .line 779
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public entryIterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 558
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->keyIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 559
    .local v0, "iter":Ljava/util/Iterator;
    new-instance v1, Lorg/apache/commons/beanutils/BeanMap$12;

    invoke-direct {v1, p0, v0}, Lorg/apache/commons/beanutils/BeanMap$12;-><init>(Lorg/apache/commons/beanutils/BeanMap;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 481
    new-instance v0, Lorg/apache/commons/beanutils/BeanMap$10;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/BeanMap$10;-><init>(Lorg/apache/commons/beanutils/BeanMap;)V

    invoke-static {v0}, Lorg/apache/commons/collections/set/UnmodifiableSet;->decorate(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected firePropertyChange(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "oldValue"    # Ljava/lang/Object;
    .param p3, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 703
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    .line 386
    iget-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    if-eqz v2, :cond_17

    .line 387
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->getReadMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 388
    .local v1, "method":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_17

    .line 390
    :try_start_a
    iget-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    sget-object v3, Lorg/apache/commons/beanutils/BeanMap;->NULL_ARGUMENTS:[Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_a .. :try_end_11} :catch_13
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_11} :catch_19
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_a .. :try_end_11} :catch_1e
    .catch Ljava/lang/NullPointerException; {:try_start_a .. :try_end_11} :catch_23

    move-result-object v2

    .line 406
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_12
    return-object v2

    .line 392
    .restart local v1    # "method":Ljava/lang/reflect/Method;
    :catch_13
    move-exception v0

    .line 393
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/BeanMap;->logWarn(Ljava/lang/Exception;)V

    .line 406
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_17
    :goto_17
    const/4 v2, 0x0

    goto :goto_12

    .line 395
    .restart local v1    # "method":Ljava/lang/reflect/Method;
    :catch_19
    move-exception v0

    .line 396
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/BeanMap;->logWarn(Ljava/lang/Exception;)V

    goto :goto_17

    .line 398
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1e
    move-exception v0

    .line 399
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/BeanMap;->logWarn(Ljava/lang/Exception;)V

    goto :goto_17

    .line 401
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_23
    move-exception v0

    .line 402
    .local v0, "e":Ljava/lang/NullPointerException;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/BeanMap;->logWarn(Ljava/lang/Exception;)V

    goto :goto_17
.end method

.method public getBean()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 585
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    return-object v0
.end method

.method protected getReadMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    .line 632
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getReadMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 606
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getType(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 517
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->types:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method protected getTypeTransformer(Ljava/lang/Class;)Lorg/apache/commons/collections/Transformer;
    .registers 3
    .param p1, "aType"    # Ljava/lang/Class;

    .prologue
    .line 842
    sget-object v0, Lorg/apache/commons/beanutils/BeanMap;->typeTransformers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/Transformer;

    return-object v0
.end method

.method protected getWriteMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    .line 644
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getWriteMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 616
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public keyIterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 528
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 470
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/collections/set/UnmodifiableSet;->decorate(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected logInfo(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 853
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "INFO: Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 854
    return-void
.end method

.method protected logWarn(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 864
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "WARN: Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 865
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 866
    return-void
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .prologue
    .line 422
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    if-eqz v5, :cond_68

    .line 423
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 424
    .local v4, "oldValue":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->getWriteMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 425
    .local v2, "method":Ljava/lang/reflect/Method;
    if-nez v2, :cond_3b

    .line 426
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "The bean of type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " has no property called: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 430
    :cond_3b
    :try_start_3b
    invoke-virtual {p0, v2, p2}, Lorg/apache/commons/beanutils/BeanMap;->createWriteMethodArguments(Ljava/lang/reflect/Method;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 431
    .local v0, "arguments":[Ljava/lang/Object;
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    invoke-virtual {v2, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 434
    .local v3, "newValue":Ljava/lang/Object;
    invoke-virtual {p0, p1, v4, v3}, Lorg/apache/commons/beanutils/BeanMap;->firePropertyChange(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3b .. :try_end_4b} :catch_4c
    .catch Ljava/lang/IllegalAccessException; {:try_start_3b .. :try_end_4b} :catch_5a

    .line 446
    .end local v0    # "arguments":[Ljava/lang/Object;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "newValue":Ljava/lang/Object;
    .end local v4    # "oldValue":Ljava/lang/Object;
    :goto_4b
    return-object v4

    .line 436
    .restart local v2    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "oldValue":Ljava/lang/Object;
    :catch_4c
    move-exception v1

    .line 437
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/BeanMap;->logInfo(Ljava/lang/Exception;)V

    .line 438
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 440
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_5a
    move-exception v1

    .line 441
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/BeanMap;->logInfo(Ljava/lang/Exception;)V

    .line 442
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 446
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "oldValue":Ljava/lang/Object;
    :cond_68
    const/4 v4, 0x0

    goto :goto_4b
.end method

.method public putAllWriteable(Lorg/apache/commons/beanutils/BeanMap;)V
    .registers 5
    .param p1, "map"    # Lorg/apache/commons/beanutils/BeanMap;

    .prologue
    .line 304
    iget-object v2, p1, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 305
    .local v1, "readableKeys":Ljava/util/Iterator;
    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 306
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 307
    .local v0, "key":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/BeanMap;->getWriteMethod(Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 308
    invoke-virtual {p1, v0}, Lorg/apache/commons/beanutils/BeanMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/beanutils/BeanMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .line 311
    .end local v0    # "key":Ljava/lang/Object;
    :cond_22
    return-void
.end method

.method protected reinitialise()V
    .registers 2

    .prologue
    .line 652
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 653
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->writeMethods:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 654
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->types:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 655
    invoke-direct {p0}, Lorg/apache/commons/beanutils/BeanMap;->initialise()V

    .line 656
    return-void
.end method

.method public setBean(Ljava/lang/Object;)V
    .registers 2
    .param p1, "newBean"    # Ljava/lang/Object;

    .prologue
    .line 595
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    .line 596
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->reinitialise()V

    .line 597
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 219
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "BeanMap<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanMap;->bean:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public valueIterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 537
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->keyIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 538
    .local v0, "iter":Ljava/util/Iterator;
    new-instance v1, Lorg/apache/commons/beanutils/BeanMap$11;

    invoke-direct {v1, p0, v0}, Lorg/apache/commons/beanutils/BeanMap$11;-><init>(Lorg/apache/commons/beanutils/BeanMap;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public values()Ljava/util/Collection;
    .registers 4

    .prologue
    .line 498
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/apache/commons/beanutils/BeanMap;->readMethods:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 499
    .local v0, "answer":Ljava/util/ArrayList;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanMap;->valueIterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 500
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 502
    :cond_1d
    invoke-static {v0}, Lorg/apache/commons/collections/list/UnmodifiableList;->decorate(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method
