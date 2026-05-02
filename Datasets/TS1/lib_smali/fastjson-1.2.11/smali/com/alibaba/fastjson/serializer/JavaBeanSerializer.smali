.class public Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
.super Lcom/alibaba/fastjson/serializer/SerializeFilterable;
.source "JavaBeanSerializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# instance fields
.field protected final beanType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected features:I

.field protected final getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

.field protected final jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

.field protected final sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

.field protected typeName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "beanType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;Ljava/util/Map;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "beanType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "aliasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getSerializeFeatures(Ljava/lang/Class;)I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;Ljava/util/Map;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/util/Map;I)V
    .registers 14
    .param p3, "features"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "beanType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "aliasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v9, 0x0

    .line 72
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;-><init>()V

    .line 43
    iput v9, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->features:I

    .line 73
    iput p3, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->features:I

    .line 74
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->beanType:Ljava/lang/Class;

    .line 76
    const-class v7, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p1, v7}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    check-cast v7, Lcom/alibaba/fastjson/annotation/JSONType;

    iput-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    .line 78
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    if-eqz v7, :cond_22

    .line 79
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-interface {v7}, Lcom/alibaba/fastjson/annotation/JSONType;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    invoke-static {v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result p3

    .line 83
    :cond_22
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v3, "getterList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/FieldSerializer;>;"
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-static {p1, v7, p2, v9}, Lcom/alibaba/fastjson/util/TypeUtils;->computeGetters(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/Map;Z)Ljava/util/List;

    move-result-object v2

    .line 86
    .local v2, "fieldInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_31
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_46

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 87
    .local v1, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    new-instance v8, Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-direct {v8, p1, v1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 90
    .end local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_46
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-interface {v3, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/alibaba/fastjson/serializer/FieldSerializer;

    iput-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    .line 93
    const/4 v4, 0x0

    .line 95
    .local v4, "orders":[Ljava/lang/String;
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    if-eqz v7, :cond_6d

    .line 96
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-interface {v7}, Lcom/alibaba/fastjson/annotation/JSONType;->orders()[Ljava/lang/String;

    move-result-object v4

    .line 97
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-interface {v7}, Lcom/alibaba/fastjson/annotation/JSONType;->typeName()Ljava/lang/String;

    move-result-object v6

    .line 98
    .local v6, "typeName":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_6d

    .line 99
    iput-object v6, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->typeName:Ljava/lang/String;

    .line 103
    .end local v6    # "typeName":Ljava/lang/String;
    :cond_6d
    if-eqz v4, :cond_a6

    array-length v7, v4

    if-eqz v7, :cond_a6

    .line 104
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    const/4 v8, 0x1

    invoke-static {p1, v7, p2, v8}, Lcom/alibaba/fastjson/util/TypeUtils;->computeGetters(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/Map;Z)Ljava/util/List;

    move-result-object v2

    .line 105
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "getterList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/FieldSerializer;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .restart local v3    # "getterList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/FieldSerializer;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_82
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_97

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 108
    .restart local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    new-instance v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-direct {v0, p1, v1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 109
    .local v0, "fieldDeser":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_82

    .line 112
    .end local v0    # "fieldDeser":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v1    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_97
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-interface {v3, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/alibaba/fastjson/serializer/FieldSerializer;

    iput-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    .line 124
    :goto_a5
    return-void

    .line 114
    :cond_a6
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v7, v7

    new-array v5, v7, [Lcom/alibaba/fastjson/serializer/FieldSerializer;

    .line 115
    .local v5, "sortedGetters":[Lcom/alibaba/fastjson/serializer/FieldSerializer;
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v8, v8

    invoke-static {v7, v9, v5, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    invoke-static {v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 118
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-static {v5, v7}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c3

    .line 119
    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    iput-object v7, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    goto :goto_a5

    .line 121
    :cond_c3
    iput-object v5, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    goto :goto_a5
.end method

.method public varargs constructor <init>(Ljava/lang/Class;[Ljava/lang/String;)V
    .registers 4
    .param p2, "aliasList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "beanType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->createAliasMap([Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;Ljava/util/Map;)V

    .line 57
    return-void
.end method

.method static varargs createAliasMap([Ljava/lang/String;)Ljava/util/Map;
    .registers 5
    .param p0, "aliasList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 61
    .local v1, "aliasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    array-length v3, p0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_11

    aget-object v0, p0, v2

    .line 62
    .local v0, "alias":Ljava/lang/String;
    invoke-interface {v1, v0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 65
    .end local v0    # "alias":Ljava/lang/String;
    :cond_11
    return-object v1
.end method


# virtual methods
.method protected getBeanContext(I)Lcom/alibaba/fastjson/serializer/BeanContext;
    .registers 3
    .param p1, "orinal"    # I

    .prologue
    .line 448
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldContext:Lcom/alibaba/fastjson/serializer/BeanContext;

    return-object v0
.end method

.method public getFieldSerializer(Ljava/lang/String;)Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .registers 9
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 391
    if-nez p1, :cond_4

    .line 414
    :cond_3
    :goto_3
    return-object v5

    .line 395
    :cond_4
    const/4 v3, 0x0

    .line 396
    .local v3, "low":I
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v6, v6

    add-int/lit8 v2, v6, -0x1

    .line 398
    .local v2, "high":I
    :goto_a
    if-gt v3, v2, :cond_3

    .line 399
    add-int v6, v3, v2

    ushr-int/lit8 v4, v6, 0x1

    .line 401
    .local v4, "mid":I
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    aget-object v6, v6, v4

    iget-object v6, v6, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v1, v6, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 403
    .local v1, "fieldName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 405
    .local v0, "cmp":I
    if-gez v0, :cond_21

    .line 406
    add-int/lit8 v3, v4, 0x1

    goto :goto_a

    .line 407
    :cond_21
    if-lez v0, :cond_26

    .line 408
    add-int/lit8 v2, v4, -0x1

    goto :goto_a

    .line 410
    :cond_26
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    aget-object v5, v5, v4

    goto :goto_3
.end method

.method protected getFieldType(I)Ljava/lang/reflect/Type;
    .registers 3
    .param p1, "ordinal"    # I

    .prologue
    .line 452
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getFieldValues(Ljava/lang/Object;)Ljava/util/List;
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 418
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v2, v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 419
    .local v0, "fieldValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v4, :cond_1a

    aget-object v1, v3, v2

    .line 420
    .local v1, "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 423
    .end local v1    # "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    :cond_1a
    return-object v0
.end method

.method public getFieldValuesMap(Ljava/lang/Object;)Ljava/util/Map;
    .registers 9
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 438
    new-instance v1, Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v2, v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 440
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v4, :cond_1e

    aget-object v0, v3, v2

    .line 441
    .local v0, "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v5, v5, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 444
    .end local v0    # "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    :cond_1e
    return-object v1
.end method

.method public getSize(Ljava/lang/Object;)I
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 427
    const/4 v1, 0x0

    .line 428
    .local v1, "size":I
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    array-length v5, v4

    const/4 v3, 0x0

    :goto_5
    if-ge v3, v5, :cond_14

    aget-object v0, v4, v3

    .line 429
    .local v0, "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 430
    .local v2, "value":Ljava/lang/Object;
    if-eqz v2, :cond_11

    .line 431
    add-int/lit8 v1, v1, 0x1

    .line 428
    :cond_11
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 434
    .end local v0    # "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_14
    return v1
.end method

.method public isWriteAsArray(Lcom/alibaba/fastjson/serializer/JSONSerializer;)Z
    .registers 4
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;

    .prologue
    .line 387
    iget v0, p0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->features:I

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v1

    if-nez v0, :cond_f

    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->beanToArray:Z

    if-eqz v0, :cond_11

    :cond_f
    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 42
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-object/from16 v29, v0

    .line 149
    .local v29, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_c

    .line 150
    invoke-virtual/range {v29 .. v29}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 369
    :cond_b
    :goto_b
    return-void

    .line 154
    :cond_c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->writeReference(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;I)Z

    move-result v4

    if-nez v4, :cond_b

    .line 160
    move-object/from16 v0, v29

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sortField:Z

    if-eqz v4, :cond_10b

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->sortedGetters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    move-object/from16 v23, v0

    .line 166
    .local v23, "getters":[Lcom/alibaba/fastjson/serializer/FieldSerializer;
    :goto_26
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 167
    .local v5, "parent":Lcom/alibaba/fastjson/serializer/SerialContext;
    move-object/from16 v0, p0

    iget v8, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->features:I

    move-object/from16 v4, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v9, p5

    invoke-virtual/range {v4 .. v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 169
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->isWriteAsArray(Lcom/alibaba/fastjson/serializer/JSONSerializer;)Z

    move-result v35

    .line 172
    .local v35, "writeAsArray":Z
    if-eqz v35, :cond_113

    const/16 v34, 0x5b

    .line 173
    .local v34, "startSeperator":C
    :goto_41
    if-eqz v35, :cond_117

    const/16 v15, 0x5d

    .line 174
    .local v15, "endSeperator":C
    :goto_45
    :try_start_45
    move-object/from16 v0, v29

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 176
    move-object/from16 v0, v23

    array-length v4, v0

    if-lez v4, :cond_61

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_61

    .line 177
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->incrementIndent()V

    .line 178
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 181
    :cond_61
    const/4 v12, 0x0

    .line 183
    .local v12, "commaFlag":Z
    move-object/from16 v0, p0

    iget v4, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->features:I

    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v4, v6

    if-nez v4, :cond_79

    .line 184
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->isWriteClassName(Ljava/lang/reflect/Type;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a7

    .line 185
    :cond_79
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    .line 186
    .local v28, "objClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v28

    move-object/from16 v1, p4

    if-eq v0, v1, :cond_a7

    .line 187
    sget-object v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    const/4 v6, 0x0

    move-object/from16 v0, v29

    invoke-virtual {v0, v4, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    .line 188
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->typeName:Ljava/lang/String;

    if-nez v4, :cond_9d

    .line 189
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->typeName:Ljava/lang/String;

    .line 191
    :cond_9d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->typeName:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 192
    const/4 v12, 0x1

    .line 196
    .end local v28    # "objClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_a7
    if-eqz v12, :cond_11b

    const/16 v32, 0x2c

    .line 198
    .local v32, "seperator":C
    :goto_ab
    move-object/from16 v0, v29

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v4, :cond_11e

    move-object/from16 v0, v29

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-nez v4, :cond_11e

    const/4 v13, 0x1

    .line 199
    .local v13, "directWritePrefix":Z
    :goto_b8
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move/from16 v3, v32

    invoke-virtual {v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeBefore(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;C)C

    move-result v27

    .line 200
    .local v27, "newSeperator":C
    const/16 v4, 0x2c

    move/from16 v0, v27

    if-ne v0, v4, :cond_120

    const/4 v12, 0x1

    .line 202
    :goto_cb
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SkipTransientField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v33

    .line 203
    .local v33, "skipTransient":Z
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreNonFieldGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v25

    .line 205
    .local v25, "ignoreNonFieldGetter":Z
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_dd
    move-object/from16 v0, v23

    array-length v4, v0

    move/from16 v0, v24

    if-ge v0, v4, :cond_38c

    .line 206
    aget-object v22, v23, v24

    .line 208
    .local v22, "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    move-object/from16 v0, v22

    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v0, v4, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    move-object/from16 v18, v0

    .line 209
    .local v18, "field":Ljava/lang/reflect/Field;
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v21, v0

    .line 210
    .local v21, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v21

    iget-object v10, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 211
    .local v10, "fieldInfoName":Ljava/lang/String;
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v20, v0

    .line 213
    .local v20, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v33, :cond_122

    .line 214
    if-eqz v18, :cond_122

    .line 215
    move-object/from16 v0, v21

    iget-boolean v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldTransient:Z
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_106} :catch_284
    .catchall {:try_start_45 .. :try_end_106} :catchall_2f2

    if-eqz v4, :cond_122

    .line 205
    :cond_108
    :goto_108
    add-int/lit8 v24, v24, 0x1

    goto :goto_dd

    .line 163
    .end local v5    # "parent":Lcom/alibaba/fastjson/serializer/SerialContext;
    .end local v10    # "fieldInfoName":Ljava/lang/String;
    .end local v12    # "commaFlag":Z
    .end local v13    # "directWritePrefix":Z
    .end local v15    # "endSeperator":C
    .end local v18    # "field":Ljava/lang/reflect/Field;
    .end local v20    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v22    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v23    # "getters":[Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v24    # "i":I
    .end local v25    # "ignoreNonFieldGetter":Z
    .end local v27    # "newSeperator":C
    .end local v32    # "seperator":C
    .end local v33    # "skipTransient":Z
    .end local v34    # "startSeperator":C
    .end local v35    # "writeAsArray":Z
    :cond_10b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getters:[Lcom/alibaba/fastjson/serializer/FieldSerializer;

    move-object/from16 v23, v0

    .restart local v23    # "getters":[Lcom/alibaba/fastjson/serializer/FieldSerializer;
    goto/16 :goto_26

    .line 172
    .restart local v5    # "parent":Lcom/alibaba/fastjson/serializer/SerialContext;
    .restart local v35    # "writeAsArray":Z
    :cond_113
    const/16 v34, 0x7b

    goto/16 :goto_41

    .line 173
    .restart local v34    # "startSeperator":C
    :cond_117
    const/16 v15, 0x7d

    goto/16 :goto_45

    .line 196
    .restart local v12    # "commaFlag":Z
    .restart local v15    # "endSeperator":C
    :cond_11b
    const/16 v32, 0x0

    goto :goto_ab

    .line 198
    .restart local v32    # "seperator":C
    :cond_11e
    const/4 v13, 0x0

    goto :goto_b8

    .line 200
    .restart local v13    # "directWritePrefix":Z
    .restart local v27    # "newSeperator":C
    :cond_120
    const/4 v12, 0x0

    goto :goto_cb

    .line 221
    .restart local v10    # "fieldInfoName":Ljava/lang/String;
    .restart local v18    # "field":Ljava/lang/reflect/Field;
    .restart local v20    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v21    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v22    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .restart local v24    # "i":I
    .restart local v25    # "ignoreNonFieldGetter":Z
    .restart local v33    # "skipTransient":Z
    :cond_122
    if-eqz v25, :cond_126

    .line 222
    if-eqz v18, :cond_108

    .line 227
    :cond_126
    :try_start_126
    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->applyName(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_108

    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->label:Ljava/lang/String;

    .line 228
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->applyLabel(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/String;)Z
    :try_end_141
    .catch Ljava/lang/Exception; {:try_start_126 .. :try_end_141} :catch_284
    .catchall {:try_start_126 .. :try_end_141} :catchall_2f2

    move-result v4

    if-eqz v4, :cond_108

    .line 236
    :try_start_144
    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_144 .. :try_end_14b} :catch_272
    .catch Ljava/lang/Exception; {:try_start_144 .. :try_end_14b} :catch_284
    .catchall {:try_start_144 .. :try_end_14b} :catchall_2f2

    move-result-object v30

    .local v30, "propertyValue":Ljava/lang/Object;
    move-object/from16 v11, v30

    .line 245
    .end local v30    # "propertyValue":Ljava/lang/Object;
    .local v11, "propertyValue":Ljava/lang/Object;
    :goto_14e
    :try_start_14e
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v10, v11}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->apply(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_108

    .line 249
    move-object/from16 v26, v10

    .line 250
    .local v26, "key":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3, v11}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processKey(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    .line 253
    .local v11, "originalValue":Ljava/lang/Object;
    move-object/from16 v0, v22

    iget-object v8, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldContext:Lcom/alibaba/fastjson/serializer/BeanContext;

    move-object/from16 v6, p1

    move-object/from16 v7, p0

    move-object/from16 v9, p2

    invoke-virtual/range {v6 .. v11}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processValue(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    .line 256
    .restart local v30    # "propertyValue":Ljava/lang/Object;
    if-nez v30, :cond_18a

    if-nez v35, :cond_18a

    .line 257
    move-object/from16 v0, v22

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeNull:Z

    if-nez v4, :cond_18a

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_108

    .line 262
    :cond_18a
    if-eqz v30, :cond_244

    move-object/from16 v0, v29

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->notWriteDefaultValue:Z

    if-eqz v4, :cond_244

    .line 263
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v19, v0

    .line 264
    .local v19, "fieldCLass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1af

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Byte;

    if-eqz v4, :cond_1af

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Byte;

    move-object v4, v0

    .line 265
    invoke-virtual {v4}, Ljava/lang/Byte;->byteValue()B

    move-result v4

    if-eqz v4, :cond_108

    .line 267
    :cond_1af
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1c6

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Short;

    if-eqz v4, :cond_1c6

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Short;

    move-object v4, v0

    .line 268
    invoke-virtual {v4}, Ljava/lang/Short;->shortValue()S

    move-result v4

    if-eqz v4, :cond_108

    .line 270
    :cond_1c6
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1dd

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Integer;

    if-eqz v4, :cond_1dd

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Integer;

    move-object v4, v0

    .line 271
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_108

    .line 273
    :cond_1dd
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_1f8

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Long;

    if-eqz v4, :cond_1f8

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Long;

    move-object v4, v0

    .line 274
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-eqz v4, :cond_108

    .line 276
    :cond_1f8
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_212

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Float;

    if-eqz v4, :cond_212

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Float;

    move-object v4, v0

    .line 277
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v6, 0x0

    cmpl-float v4, v4, v6

    if-eqz v4, :cond_108

    .line 279
    :cond_212
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_22d

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Double;

    if-eqz v4, :cond_22d

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Double;

    move-object v4, v0

    .line 280
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpl-double v4, v6, v8

    if-eqz v4, :cond_108

    .line 282
    :cond_22d
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-ne v0, v4, :cond_244

    move-object/from16 v0, v30

    instance-of v4, v0, Ljava/lang/Boolean;

    if-eqz v4, :cond_244

    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/Boolean;

    move-object v4, v0

    .line 283
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_108

    .line 288
    .end local v19    # "fieldCLass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_244
    if-eqz v12, :cond_25a

    .line 289
    const/16 v4, 0x2c

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 290
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_25a

    .line 291
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 295
    :cond_25a
    move-object/from16 v0, v26

    if-eq v0, v10, :cond_2f8

    .line 296
    if-nez v35, :cond_268

    .line 297
    const/4 v4, 0x1

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    .line 300
    :cond_268
    move-object/from16 v0, p1

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 342
    :goto_26f
    const/4 v12, 0x1

    goto/16 :goto_108

    .line 237
    .end local v11    # "originalValue":Ljava/lang/Object;
    .end local v26    # "key":Ljava/lang/String;
    .end local v30    # "propertyValue":Ljava/lang/Object;
    :catch_272
    move-exception v17

    .line 238
    .local v17, "ex":Ljava/lang/reflect/InvocationTargetException;
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_283

    .line 239
    const/16 v30, 0x0

    .restart local v30    # "propertyValue":Ljava/lang/Object;
    move-object/from16 v11, v30

    .end local v30    # "propertyValue":Ljava/lang/Object;
    .local v11, "propertyValue":Ljava/lang/Object;
    goto/16 :goto_14e

    .line 241
    .end local v11    # "propertyValue":Ljava/lang/Object;
    :cond_283
    throw v17
    :try_end_284
    .catch Ljava/lang/Exception; {:try_start_14e .. :try_end_284} :catch_284
    .catchall {:try_start_14e .. :try_end_284} :catchall_2f2

    .line 353
    .end local v10    # "fieldInfoName":Ljava/lang/String;
    .end local v12    # "commaFlag":Z
    .end local v13    # "directWritePrefix":Z
    .end local v17    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v18    # "field":Ljava/lang/reflect/Field;
    .end local v20    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v22    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v24    # "i":I
    .end local v25    # "ignoreNonFieldGetter":Z
    .end local v27    # "newSeperator":C
    .end local v32    # "seperator":C
    .end local v33    # "skipTransient":Z
    :catch_284
    move-exception v14

    .line 354
    .local v14, "e":Ljava/lang/Exception;
    :try_start_285
    const-string v16, "write javaBean error"

    .line 355
    .local v16, "errorMessage":Ljava/lang/String;
    if-eqz p2, :cond_2aa

    .line 356
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", class "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 358
    :cond_2aa
    if-eqz p3, :cond_2c7

    .line 359
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", fieldName : "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 361
    :cond_2c7
    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2ea

    .line 362
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 365
    :cond_2ea
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    move-object/from16 v0, v16

    invoke-direct {v4, v0, v14}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_2f2
    .catchall {:try_start_285 .. :try_end_2f2} :catchall_2f2

    .line 367
    .end local v14    # "e":Ljava/lang/Exception;
    .end local v16    # "errorMessage":Ljava/lang/String;
    :catchall_2f2
    move-exception v4

    move-object/from16 v0, p1

    iput-object v5, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    throw v4

    .line 301
    .restart local v10    # "fieldInfoName":Ljava/lang/String;
    .local v11, "originalValue":Ljava/lang/Object;
    .restart local v12    # "commaFlag":Z
    .restart local v13    # "directWritePrefix":Z
    .restart local v18    # "field":Ljava/lang/reflect/Field;
    .restart local v20    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v21    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v22    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .restart local v24    # "i":I
    .restart local v25    # "ignoreNonFieldGetter":Z
    .restart local v26    # "key":Ljava/lang/String;
    .restart local v27    # "newSeperator":C
    .restart local v30    # "propertyValue":Ljava/lang/Object;
    .restart local v32    # "seperator":C
    .restart local v33    # "skipTransient":Z
    :cond_2f8
    move-object/from16 v0, v30

    if-eq v11, v0, :cond_30e

    .line 302
    if-nez v35, :cond_305

    .line 303
    :try_start_2fe
    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writePrefix(Lcom/alibaba/fastjson/serializer/JSONSerializer;)V

    .line 305
    :cond_305
    move-object/from16 v0, p1

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    goto/16 :goto_26f

    .line 307
    :cond_30e
    if-nez v35, :cond_321

    .line 308
    if-eqz v13, :cond_34a

    .line 309
    move-object/from16 v0, v21

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    const/4 v6, 0x0

    move-object/from16 v0, v21

    iget-object v7, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    array-length v7, v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v4, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    .line 315
    :cond_321
    :goto_321
    if-nez v35, :cond_381

    .line 316
    const-class v4, Ljava/lang/String;

    move-object/from16 v0, v20

    if-ne v0, v4, :cond_376

    .line 317
    if-nez v30, :cond_357

    .line 318
    move-object/from16 v0, v29

    iget v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v4, v6

    if-nez v4, :cond_341

    move-object/from16 v0, v22

    iget v4, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v6, v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v4, v6

    if-eqz v4, :cond_352

    .line 321
    :cond_341
    const-string v4, ""

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto/16 :goto_26f

    .line 311
    :cond_34a
    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writePrefix(Lcom/alibaba/fastjson/serializer/JSONSerializer;)V

    goto :goto_321

    .line 323
    :cond_352
    invoke-virtual/range {v29 .. v29}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    goto/16 :goto_26f

    .line 326
    :cond_357
    move-object/from16 v0, v30

    check-cast v0, Ljava/lang/String;

    move-object/from16 v31, v0

    .line 328
    .local v31, "propertyValueString":Ljava/lang/String;
    move-object/from16 v0, v29

    iget-boolean v4, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v4, :cond_36c

    .line 329
    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    goto/16 :goto_26f

    .line 331
    :cond_36c
    const/4 v4, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto/16 :goto_26f

    .line 335
    .end local v31    # "propertyValueString":Ljava/lang/String;
    :cond_376
    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeValue(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;)V

    goto/16 :goto_26f

    .line 338
    :cond_381
    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeValue(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;)V

    goto/16 :goto_26f

    .line 345
    .end local v10    # "fieldInfoName":Ljava/lang/String;
    .end local v11    # "originalValue":Ljava/lang/Object;
    .end local v18    # "field":Ljava/lang/reflect/Field;
    .end local v20    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v22    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    .end local v26    # "key":Ljava/lang/String;
    .end local v30    # "propertyValue":Ljava/lang/Object;
    :cond_38c
    if-eqz v12, :cond_3b9

    const/16 v4, 0x2c

    :goto_390
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeAfter(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;C)C

    .line 347
    move-object/from16 v0, v23

    array-length v4, v0

    if-lez v4, :cond_3ae

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_3ae

    .line 348
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->decrementIdent()V

    .line 349
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 352
    :cond_3ae
    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_3b3
    .catch Ljava/lang/Exception; {:try_start_2fe .. :try_end_3b3} :catch_284
    .catchall {:try_start_2fe .. :try_end_3b3} :catchall_2f2

    .line 367
    move-object/from16 v0, p1

    iput-object v5, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    goto/16 :goto_b

    .line 345
    :cond_3b9
    const/4 v4, 0x0

    goto :goto_390
.end method

.method public writeAsArrayNonContext(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 6
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual/range {p0 .. p5}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 140
    return-void
.end method

.method public writeDirectNonContext(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 6
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-virtual/range {p0 .. p5}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 132
    return-void
.end method

.method public writeReference(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;I)Z
    .registers 8
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldFeatures"    # I

    .prologue
    const/4 v2, 0x0

    .line 372
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 373
    .local v0, "context":Lcom/alibaba/fastjson/serializer/SerialContext;
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 374
    .local v1, "mask":I
    if-eqz v0, :cond_12

    iget v3, v0, Lcom/alibaba/fastjson/serializer/SerialContext;->features:I

    and-int/2addr v3, v1

    if-nez v3, :cond_12

    and-int v3, p3, v1

    if-eqz v3, :cond_13

    .line 382
    :cond_12
    :goto_12
    return v2

    .line 378
    :cond_13
    iget-object v3, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    if-eqz v3, :cond_12

    iget-object v3, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    invoke-virtual {v3, p2}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 379
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    .line 380
    const/4 v2, 0x1

    goto :goto_12
.end method
