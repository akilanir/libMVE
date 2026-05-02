.class public final Lcom/fasterxml/jackson/databind/type/TypeFactory;
.super Ljava/lang/Object;
.source "TypeFactory.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field protected static final CORE_TYPE_BOOL:Lcom/fasterxml/jackson/databind/type/SimpleType;

.field protected static final CORE_TYPE_INT:Lcom/fasterxml/jackson/databind/type/SimpleType;

.field protected static final CORE_TYPE_LONG:Lcom/fasterxml/jackson/databind/type/SimpleType;

.field protected static final CORE_TYPE_STRING:Lcom/fasterxml/jackson/databind/type/SimpleType;

.field private static final NO_TYPES:[Lcom/fasterxml/jackson/databind/JavaType;

.field protected static final instance:Lcom/fasterxml/jackson/databind/type/TypeFactory;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected transient _cachedArrayListType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

.field protected transient _cachedHashMapType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

.field protected final _classLoader:Ljava/lang/ClassLoader;

.field protected final _modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

.field protected final _parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

.field protected final _typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/util/LRUMap",
            "<",
            "Lcom/fasterxml/jackson/databind/type/ClassKey;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/fasterxml/jackson/databind/JavaType;

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->NO_TYPES:[Lcom/fasterxml/jackson/databind/JavaType;

    .line 46
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->instance:Lcom/fasterxml/jackson/databind/type/TypeFactory;

    .line 58
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    const-class v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_STRING:Lcom/fasterxml/jackson/databind/type/SimpleType;

    .line 59
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_BOOL:Lcom/fasterxml/jackson/databind/type/SimpleType;

    .line 60
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_INT:Lcom/fasterxml/jackson/databind/type/SimpleType;

    .line 61
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_LONG:Lcom/fasterxml/jackson/databind/type/SimpleType;

    return-void
.end method

.method private constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcom/fasterxml/jackson/databind/util/LRUMap;

    const/16 v1, 0x10

    const/16 v2, 0x64

    invoke-direct {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/LRUMap;-><init>(II)V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;

    .line 114
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeParser;

    invoke-direct {v0, p0}, Lcom/fasterxml/jackson/databind/type/TypeParser;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;)V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    .line 115
    iput-object v3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    .line 116
    iput-object v3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    .line 117
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;)V
    .registers 4
    .param p1, "p"    # Lcom/fasterxml/jackson/databind/type/TypeParser;
    .param p2, "mods"    # [Lcom/fasterxml/jackson/databind/type/TypeModifier;

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V

    .line 121
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V
    .registers 7
    .param p1, "p"    # Lcom/fasterxml/jackson/databind/type/TypeParser;
    .param p2, "mods"    # [Lcom/fasterxml/jackson/databind/type/TypeModifier;
    .param p3, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcom/fasterxml/jackson/databind/util/LRUMap;

    const/16 v1, 0x10

    const/16 v2, 0x64

    invoke-direct {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/LRUMap;-><init>(II)V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;

    .line 124
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    .line 125
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    .line 126
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    .line 127
    return-void
.end method

.method private _collectionType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 1130
    .local p1, "rawClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/util/Collection;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 1132
    .local v0, "typeParams":[Lcom/fasterxml/jackson/databind/JavaType;
    if-nez v0, :cond_11

    .line 1133
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v1

    .line 1139
    :goto_10
    return-object v1

    .line 1136
    :cond_11
    array-length v1, v0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_38

    .line 1137
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Strange Collection type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": can not determine type parameters"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1139
    :cond_38
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {p1, v1}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v1

    goto :goto_10
.end method

.method private _mapType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 1113
    .local p1, "rawClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/util/Properties;

    if-ne p1, v1, :cond_d

    .line 1114
    sget-object v1, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_STRING:Lcom/fasterxml/jackson/databind/type/SimpleType;

    sget-object v2, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_STRING:Lcom/fasterxml/jackson/databind/type/SimpleType;

    invoke-static {p1, v1, v2}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v1

    .line 1125
    :goto_c
    return-object v1

    .line 1116
    :cond_d
    const-class v1, Ljava/util/Map;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 1118
    .local v0, "typeParams":[Lcom/fasterxml/jackson/databind/JavaType;
    if-nez v0, :cond_22

    .line 1119
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v1

    goto :goto_c

    .line 1122
    :cond_22
    array-length v1, v0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_49

    .line 1123
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Strange Map type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": can not determine type parameters"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1125
    :cond_49
    const/4 v1, 0x0

    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {p1, v1, v2}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v1

    goto :goto_c
.end method

.method public static defaultInstance()Lcom/fasterxml/jackson/databind/type/TypeFactory;
    .registers 1

    .prologue
    .line 149
    sget-object v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->instance:Lcom/fasterxml/jackson/databind/type/TypeFactory;

    return-object v0
.end method

.method public static rawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 2
    .param p0, "t"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 194
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 195
    check-cast p0, Ljava/lang/Class;

    .line 198
    .end local p0    # "t":Ljava/lang/reflect/Type;
    :goto_6
    return-object p0

    .restart local p0    # "t":Ljava/lang/reflect/Type;
    :cond_7
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->defaultInstance()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_6
.end method

.method public static unknownType()Lcom/fasterxml/jackson/databind/JavaType;
    .registers 1

    .prologue
    .line 184
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->defaultInstance()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected declared-synchronized _arrayListSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 5
    .param p1, "current"    # Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .prologue
    .line 1276
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedArrayListType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    if-nez v2, :cond_14

    .line 1277
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->deepCloneWithoutSubtype()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v0

    .line 1278
    .local v0, "base":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    const-class v2, Ljava/util/List;

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_doFindSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .line 1279
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getSuperType()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedArrayListType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .line 1281
    .end local v0    # "base":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_14
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedArrayListType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->deepCloneWithoutSubtype()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v1

    .line 1282
    .local v1, "t":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSuperType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1283
    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSubType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 1284
    monitor-exit p0

    return-object p1

    .line 1276
    .end local v1    # "t":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :catchall_22
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected _constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 11
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    .line 478
    instance-of v5, p1, Ljava/lang/Class;

    if-eqz v5, :cond_24

    move-object v5, p1

    .line 479
    check-cast v5, Ljava/lang/Class;

    invoke-virtual {p0, v5, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromClass(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 504
    .local v4, "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_b
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    if-eqz v5, :cond_7d

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v5

    if-nez v5, :cond_7d

    .line 505
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    .local v0, "arr$":[Lcom/fasterxml/jackson/databind/type/TypeModifier;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_19
    if-ge v1, v2, :cond_7d

    aget-object v3, v0, v1

    .line 506
    .local v3, "mod":Lcom/fasterxml/jackson/databind/type/TypeModifier;
    invoke-virtual {v3, v4, p1, p2, p0}, Lcom/fasterxml/jackson/databind/type/TypeModifier;->modifyType(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;Lcom/fasterxml/jackson/databind/type/TypeFactory;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 505
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 482
    .end local v0    # "arr$":[Lcom/fasterxml/jackson/databind/type/TypeModifier;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "mod":Lcom/fasterxml/jackson/databind/type/TypeModifier;
    .end local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_24
    instance-of v5, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_30

    move-object v5, p1

    .line 483
    check-cast v5, Ljava/lang/reflect/ParameterizedType;

    invoke-virtual {p0, v5, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromParamType(Ljava/lang/reflect/ParameterizedType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .restart local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_b

    .line 485
    .end local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_30
    instance-of v5, p1, Lcom/fasterxml/jackson/databind/JavaType;

    if-eqz v5, :cond_37

    .line 486
    check-cast p1, Lcom/fasterxml/jackson/databind/JavaType;

    .line 509
    .end local p1    # "type":Ljava/lang/reflect/Type;
    :goto_36
    return-object p1

    .line 488
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_37
    instance-of v5, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v5, :cond_43

    move-object v5, p1

    .line 489
    check-cast v5, Ljava/lang/reflect/GenericArrayType;

    invoke-virtual {p0, v5, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromArrayType(Ljava/lang/reflect/GenericArrayType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .restart local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_b

    .line 491
    .end local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_43
    instance-of v5, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v5, :cond_4f

    move-object v5, p1

    .line 492
    check-cast v5, Ljava/lang/reflect/TypeVariable;

    invoke-virtual {p0, v5, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromVariable(Ljava/lang/reflect/TypeVariable;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .restart local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_b

    .line 494
    .end local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_4f
    instance-of v5, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v5, :cond_5b

    move-object v5, p1

    .line 495
    check-cast v5, Ljava/lang/reflect/WildcardType;

    invoke-virtual {p0, v5, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromWildcard(Ljava/lang/reflect/WildcardType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .restart local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_b

    .line 498
    .end local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_5b
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unrecognized Type: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez p1, :cond_78

    const-string v5, "[null]"

    :goto_6c
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_78
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_6c

    .restart local v4    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_7d
    move-object p1, v4

    .line 509
    goto :goto_36
.end method

.method protected _doFindSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 10
    .param p1, "current"    # Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/type/HierarchicType;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/HierarchicType;"
        }
    .end annotation

    .prologue
    .line 1234
    .local p2, "target":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    .line 1235
    .local v5, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 1238
    .local v4, "parents":[Ljava/lang/reflect/Type;
    if-eqz v4, :cond_21

    .line 1239
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_d
    if-ge v1, v2, :cond_21

    aget-object v3, v0, v1

    .line 1240
    .local v3, "parent":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v3, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperInterfaceChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v6

    .line 1241
    .local v6, "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    if-eqz v6, :cond_1e

    .line 1242
    invoke-virtual {v6, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSubType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1243
    invoke-virtual {p1, v6}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSuperType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1258
    .end local v0    # "arr$":[Ljava/lang/reflect/Type;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v6    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .end local p1    # "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :goto_1d
    return-object p1

    .line 1239
    .restart local v0    # "arr$":[Ljava/lang/reflect/Type;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v6    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .restart local p1    # "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 1249
    .end local v0    # "arr$":[Ljava/lang/reflect/Type;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "parent":Ljava/lang/reflect/Type;
    .end local v6    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_21
    invoke-virtual {v5}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 1250
    .restart local v3    # "parent":Ljava/lang/reflect/Type;
    if-eqz v3, :cond_34

    .line 1251
    invoke-virtual {p0, v3, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperInterfaceChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v6

    .line 1252
    .restart local v6    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    if-eqz v6, :cond_34

    .line 1253
    invoke-virtual {v6, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSubType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1254
    invoke-virtual {p1, v6}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSuperType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    goto :goto_1d

    .line 1258
    .end local v6    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_34
    const/4 p1, 0x0

    goto :goto_1d
.end method

.method protected _findPrimitive(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 258
    const-string v0, "int"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 267
    :goto_a
    return-object v0

    .line 259
    :cond_b
    const-string v0, "long"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 260
    :cond_16
    const-string v0, "float"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 261
    :cond_21
    const-string v0, "double"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 262
    :cond_2c
    const-string v0, "boolean"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 263
    :cond_37
    const-string v0, "byte"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 264
    :cond_42
    const-string v0, "char"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 265
    :cond_4d
    const-string v0, "short"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 266
    :cond_58
    const-string v0, "void"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    goto :goto_a

    .line 267
    :cond_63
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected _findSuperClassChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 7
    .param p1, "currentType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/HierarchicType;"
        }
    .end annotation

    .prologue
    .line 1190
    .local p2, "target":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/type/HierarchicType;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;-><init>(Ljava/lang/reflect/Type;)V

    .line 1191
    .local v0, "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getRawClass()Ljava/lang/Class;

    move-result-object v2

    .line 1192
    .local v2, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne v2, p2, :cond_c

    .line 1205
    .end local v0    # "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :goto_b
    return-object v0

    .line 1196
    .restart local v0    # "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_c
    invoke-virtual {v2}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 1197
    .local v1, "parent":Ljava/lang/reflect/Type;
    if-eqz v1, :cond_1f

    .line 1198
    invoke-virtual {p0, v1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperClassChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v3

    .line 1199
    .local v3, "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    if-eqz v3, :cond_1f

    .line 1200
    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSubType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1201
    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSuperType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    goto :goto_b

    .line 1205
    .end local v3    # "sup":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_1f
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected _findSuperInterfaceChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 6
    .param p1, "currentType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/HierarchicType;"
        }
    .end annotation

    .prologue
    .line 1210
    .local p2, "target":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/type/HierarchicType;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;-><init>(Ljava/lang/reflect/Type;)V

    .line 1211
    .local v0, "current":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    .line 1212
    .local v1, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne v1, p2, :cond_11

    .line 1213
    new-instance v2, Lcom/fasterxml/jackson/databind/type/HierarchicType;

    invoke-direct {v2, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;-><init>(Ljava/lang/reflect/Type;)V

    .line 1229
    :goto_10
    return-object v2

    .line 1219
    :cond_11
    const-class v2, Ljava/util/HashMap;

    if-ne v1, v2, :cond_1e

    .line 1220
    const-class v2, Ljava/util/Map;

    if-ne p2, v2, :cond_1e

    .line 1221
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_hashMapSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v2

    goto :goto_10

    .line 1224
    :cond_1e
    const-class v2, Ljava/util/ArrayList;

    if-ne v1, v2, :cond_2b

    .line 1225
    const-class v2, Ljava/util/List;

    if-ne p2, v2, :cond_2b

    .line 1226
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_arrayListSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v2

    goto :goto_10

    .line 1229
    :cond_2b
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_doFindSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v2

    goto :goto_10
.end method

.method protected _findSuperTypeChain(Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/HierarchicType;"
        }
    .end annotation

    .prologue
    .line 1182
    .local p1, "subtype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "supertype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1183
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperInterfaceChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v0

    .line 1185
    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperClassChain(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v0

    goto :goto_a
.end method

.method protected _fromArrayType(Ljava/lang/reflect/GenericArrayType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 6
    .param p1, "type"    # Ljava/lang/reflect/GenericArrayType;
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    const/4 v2, 0x0

    .line 1050
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 1051
    .local v0, "compType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-static {v0, v2, v2}, Lcom/fasterxml/jackson/databind/type/ArrayType;->construct(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v1

    return-object v1
.end method

.method protected _fromClass(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 14
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/type/TypeBindings;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x2

    const/4 v7, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 862
    const-class v6, Ljava/lang/String;

    if-ne p1, v6, :cond_b

    sget-object v3, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_STRING:Lcom/fasterxml/jackson/databind/type/SimpleType;

    .line 920
    :cond_a
    :goto_a
    return-object v3

    .line 863
    :cond_b
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v6, :cond_12

    sget-object v3, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_BOOL:Lcom/fasterxml/jackson/databind/type/SimpleType;

    goto :goto_a

    .line 864
    :cond_12
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v6, :cond_19

    sget-object v3, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_INT:Lcom/fasterxml/jackson/databind/type/SimpleType;

    goto :goto_a

    .line 865
    :cond_19
    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v6, :cond_20

    sget-object v3, Lcom/fasterxml/jackson/databind/type/TypeFactory;->CORE_TYPE_LONG:Lcom/fasterxml/jackson/databind/type/SimpleType;

    goto :goto_a

    .line 868
    :cond_20
    new-instance v0, Lcom/fasterxml/jackson/databind/type/ClassKey;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/type/ClassKey;-><init>(Ljava/lang/Class;)V

    .line 869
    .local v0, "key":Lcom/fasterxml/jackson/databind/type/ClassKey;
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;

    invoke-virtual {v6, v0}, Lcom/fasterxml/jackson/databind/util/LRUMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/JavaType;

    .line 870
    .local v3, "result":Lcom/fasterxml/jackson/databind/JavaType;
    if-nez v3, :cond_a

    .line 882
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_47

    .line 883
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p0, v6, v7}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    invoke-static {v6, v7, v7}, Lcom/fasterxml/jackson/databind/type/ArrayType;->construct(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v3

    .line 919
    :goto_41
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;

    invoke-virtual {v6, v0, v3}, Lcom/fasterxml/jackson/databind/util/LRUMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .line 887
    :cond_47
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v6

    if-eqz v6, :cond_53

    .line 888
    new-instance v3, Lcom/fasterxml/jackson/databind/type/SimpleType;

    .end local v3    # "result":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-direct {v3, p1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    .restart local v3    # "result":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_41

    .line 893
    :cond_53
    const-class v6, Ljava/util/Map;

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_60

    .line 894
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_mapType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_41

    .line 895
    :cond_60
    const-class v6, Ljava/util/Collection;

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6d

    .line 896
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_collectionType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_41

    .line 899
    :cond_6d
    const-class v6, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_8c

    .line 901
    const-class v6, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0, p1, v6}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    .line 902
    .local v2, "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v2, :cond_80

    array-length v6, v2

    if-eq v6, v9, :cond_89

    :cond_80
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 903
    .local v4, "rt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_84
    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructReferenceType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    .line 905
    goto :goto_41

    .line 902
    .end local v4    # "rt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_89
    aget-object v4, v2, v8

    goto :goto_84

    .line 905
    .end local v2    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_8c
    const-class v6, Ljava/util/Map$Entry;

    invoke-virtual {v6, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_b6

    .line 906
    const-class v6, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, v6}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    .line 908
    .restart local v2    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v2, :cond_9f

    array-length v6, v2

    if-eq v6, v10, :cond_b1

    .line 909
    :cond_9f
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .local v5, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    move-object v1, v5

    .line 914
    .local v1, "kt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_a4
    const-class v6, Ljava/util/Map$Entry;

    new-array v7, v10, [Lcom/fasterxml/jackson/databind/JavaType;

    aput-object v1, v7, v8

    aput-object v5, v7, v9

    invoke-virtual {p0, p1, v6, v7}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    .line 915
    goto :goto_41

    .line 911
    .end local v1    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_b1
    aget-object v1, v2, v8

    .line 912
    .restart local v1    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    aget-object v5, v2, v9

    .restart local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_a4

    .line 916
    .end local v1    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v2    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_b6
    new-instance v3, Lcom/fasterxml/jackson/databind/type/SimpleType;

    .end local v3    # "result":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-direct {v3, p1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    .restart local v3    # "result":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_41
.end method

.method protected _fromParamType(Ljava/lang/reflect/ParameterizedType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 20
    .param p1, "type"    # Ljava/lang/reflect/ParameterizedType;
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    .line 972
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v10

    check-cast v10, Ljava/lang/Class;

    .line 973
    .local v10, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 974
    .local v2, "args":[Ljava/lang/reflect/Type;
    if-nez v2, :cond_5b

    const/4 v7, 0x0

    .line 978
    .local v7, "paramCount":I
    :goto_d
    if-nez v7, :cond_5d

    .line 979
    sget-object v8, Lcom/fasterxml/jackson/databind/type/TypeFactory;->NO_TYPES:[Lcom/fasterxml/jackson/databind/JavaType;

    .line 988
    .local v8, "pt":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_11
    const-class v14, Ljava/util/Map;

    invoke-virtual {v14, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_7c

    .line 990
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v10, v8}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v12

    .line 991
    .local v12, "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    const-class v14, Ljava/util/Map;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 992
    .local v6, "mapParams":[Lcom/fasterxml/jackson/databind/JavaType;
    array-length v14, v6

    const/4 v15, 0x2

    if-eq v14, v15, :cond_71

    .line 993
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Could not find 2 type parameters for Map class "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " (found "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    array-length v0, v6

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ")"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 974
    .end local v6    # "mapParams":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v7    # "paramCount":I
    .end local v8    # "pt":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v12    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_5b
    array-length v7, v2

    goto :goto_d

    .line 981
    .restart local v7    # "paramCount":I
    :cond_5d
    new-array v8, v7, [Lcom/fasterxml/jackson/databind/JavaType;

    .line 982
    .restart local v8    # "pt":[Lcom/fasterxml/jackson/databind/JavaType;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_60
    if-ge v4, v7, :cond_11

    .line 983
    aget-object v14, v2, v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v14, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    aput-object v14, v8, v4

    .line 982
    add-int/lit8 v4, v4, 0x1

    goto :goto_60

    .line 995
    .end local v4    # "i":I
    .restart local v6    # "mapParams":[Lcom/fasterxml/jackson/databind/JavaType;
    .restart local v12    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_71
    const/4 v14, 0x0

    aget-object v14, v6, v14

    const/4 v15, 0x1

    aget-object v15, v6, v15

    invoke-static {v10, v14, v15}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v14

    .line 1045
    .end local v6    # "mapParams":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v12    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_7b
    return-object v14

    .line 997
    :cond_7c
    const-class v14, Ljava/util/Collection;

    invoke-virtual {v14, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_ce

    .line 999
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v10, v8}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v12

    .line 1000
    .restart local v12    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    const-class v14, Ljava/util/Collection;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    .line 1001
    .local v3, "collectionParams":[Lcom/fasterxml/jackson/databind/JavaType;
    array-length v14, v3

    const/4 v15, 0x1

    if-eq v14, v15, :cond_c6

    .line 1002
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Could not find 1 type parameter for Collection class "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " (found "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    array-length v0, v3

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ")"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1004
    :cond_c6
    const/4 v14, 0x0

    aget-object v14, v3, v14

    invoke-static {v10, v14}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v14

    goto :goto_7b

    .line 1007
    .end local v3    # "collectionParams":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v12    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_ce
    const-class v14, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v14, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_100

    .line 1008
    const/4 v11, 0x0

    .line 1010
    .local v11, "rt":Lcom/fasterxml/jackson/databind/JavaType;
    const-class v14, Ljava/util/concurrent/atomic/AtomicReference;

    if-ne v10, v14, :cond_ee

    .line 1011
    const/4 v14, 0x1

    if-ne v7, v14, :cond_e1

    .line 1012
    const/4 v14, 0x0

    aget-object v11, v8, v14

    .line 1020
    :cond_e1
    :goto_e1
    if-nez v11, :cond_e7

    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v11

    .end local v11    # "rt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_e7
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructReferenceType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    goto :goto_7b

    .line 1015
    .restart local v11    # "rt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_ee
    const-class v14, Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v14}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v9

    .line 1016
    .local v9, "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v9, :cond_e1

    array-length v14, v9

    const/4 v15, 0x1

    if-eq v14, v15, :cond_e1

    .line 1017
    const/4 v14, 0x0

    aget-object v11, v9, v14

    goto :goto_e1

    .line 1022
    .end local v9    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v11    # "rt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_100
    const-class v14, Ljava/util/Map$Entry;

    invoke-virtual {v14, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_14d

    .line 1023
    const/4 v5, 0x0

    .local v5, "kt":Lcom/fasterxml/jackson/databind/JavaType;
    const/4 v13, 0x0

    .line 1025
    .local v13, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    const-class v14, Ljava/util/Map$Entry;

    if-ne v10, v14, :cond_138

    .line 1026
    const/4 v14, 0x2

    if-ne v7, v14, :cond_117

    .line 1027
    const/4 v14, 0x0

    aget-object v5, v8, v14

    .line 1028
    const/4 v14, 0x1

    aget-object v13, v8, v14

    .line 1037
    :cond_117
    :goto_117
    const-class v14, Ljava/util/Map$Entry;

    const/4 v15, 0x2

    new-array v15, v15, [Lcom/fasterxml/jackson/databind/JavaType;

    const/16 v16, 0x0

    if-nez v5, :cond_124

    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .end local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_124
    aput-object v5, v15, v16

    const/16 v16, 0x1

    if-nez v13, :cond_12e

    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v13

    .end local v13    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_12e
    aput-object v13, v15, v16

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v14, v15}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    goto/16 :goto_7b

    .line 1031
    .restart local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .restart local v13    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_138
    const-class v14, Ljava/util/Map$Entry;

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v14}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v9

    .line 1032
    .restart local v9    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v9, :cond_117

    array-length v14, v9

    const/4 v15, 0x2

    if-eq v14, v15, :cond_117

    .line 1033
    const/4 v14, 0x0

    aget-object v5, v9, v14

    .line 1034
    const/4 v14, 0x1

    aget-object v13, v9, v14

    goto :goto_117

    .line 1042
    .end local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v9    # "pts":[Lcom/fasterxml/jackson/databind/JavaType;
    .end local v13    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_14d
    if-nez v7, :cond_156

    .line 1043
    new-instance v14, Lcom/fasterxml/jackson/databind/type/SimpleType;

    invoke-direct {v14, v10}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    goto/16 :goto_7b

    .line 1045
    :cond_156
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v8}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v14

    goto/16 :goto_7b
.end method

.method protected _fromParameterizedClass(Ljava/lang/Class;Ljava/util/List;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "paramTypes":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/JavaType;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 929
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_16

    .line 930
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    invoke-static {v3, v4, v4}, Lcom/fasterxml/jackson/databind/type/ArrayType;->construct(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v3

    .line 957
    :goto_15
    return-object v3

    .line 932
    :cond_16
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 933
    new-instance v3, Lcom/fasterxml/jackson/databind/type/SimpleType;

    invoke-direct {v3, p1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    goto :goto_15

    .line 935
    :cond_22
    const-class v3, Ljava/util/Map;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_53

    .line 938
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_4e

    .line 939
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/databind/JavaType;

    .line 940
    .local v1, "keyType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_49

    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/JavaType;

    move-object v0, v3

    .line 942
    .local v0, "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_44
    invoke-static {p1, v1, v0}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v3

    goto :goto_15

    .line 940
    .end local v0    # "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_49
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    goto :goto_44

    .line 944
    .end local v1    # "keyType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_4e
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_mapType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_15

    .line 946
    :cond_53
    const-class v3, Ljava/util/Collection;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_71

    .line 947
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-lt v3, v6, :cond_6c

    .line 948
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/JavaType;

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v3

    goto :goto_15

    .line 950
    :cond_6c
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_collectionType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_15

    .line 952
    :cond_71
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_7d

    .line 953
    new-instance v3, Lcom/fasterxml/jackson/databind/type/SimpleType;

    invoke-direct {v3, p1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    goto :goto_15

    .line 956
    :cond_7d
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/fasterxml/jackson/databind/JavaType;

    invoke-interface {p2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/fasterxml/jackson/databind/JavaType;

    .line 957
    .local v2, "pt":[Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p0, p1, p1, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_15
.end method

.method protected _fromVariable(Ljava/lang/reflect/TypeVariable;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 8
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/type/TypeBindings;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "type":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v4, 0x0

    .line 1056
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1058
    .local v2, "name":Ljava/lang/String;
    if-nez p2, :cond_1d

    .line 1060
    new-instance p2, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .end local p2    # "context":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    const/4 v3, 0x0

    check-cast v3, Ljava/lang/Class;

    invoke-direct {p2, p0, v3}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Ljava/lang/Class;)V

    .line 1078
    .restart local p2    # "context":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    :cond_f
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 1093
    .local v1, "bounds":[Ljava/lang/reflect/Type;
    invoke-virtual {p2, v2}, Lcom/fasterxml/jackson/databind/type/TypeBindings;->_addPlaceholder(Ljava/lang/String;)V

    .line 1094
    aget-object v3, v1, v4

    invoke-virtual {p0, v3, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .end local v1    # "bounds":[Ljava/lang/reflect/Type;
    :goto_1c
    return-object v0

    .line 1067
    :cond_1d
    invoke-virtual {p2, v2, v4}, Lcom/fasterxml/jackson/databind/type/TypeBindings;->findType(Ljava/lang/String;Z)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 1068
    .local v0, "actualType":Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v0, :cond_f

    goto :goto_1c
.end method

.method protected _fromWildcard(Ljava/lang/reflect/WildcardType;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 5
    .param p1, "type"    # Ljava/lang/reflect/WildcardType;
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    .line 1107
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized _hashMapSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;)Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .registers 5
    .param p1, "current"    # Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .prologue
    .line 1263
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedHashMapType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    if-nez v2, :cond_14

    .line 1264
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->deepCloneWithoutSubtype()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v0

    .line 1265
    .local v0, "base":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    const-class v2, Ljava/util/Map;

    invoke-virtual {p0, v0, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_doFindSuperInterfaceChain(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .line 1266
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getSuperType()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedHashMapType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    .line 1268
    .end local v0    # "base":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :cond_14
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_cachedHashMapType:Lcom/fasterxml/jackson/databind/type/HierarchicType;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->deepCloneWithoutSubtype()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v1

    .line 1269
    .local v1, "t":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSuperType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V

    .line 1270
    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->setSubType(Lcom/fasterxml/jackson/databind/type/HierarchicType;)V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 1271
    monitor-exit p0

    return-object p1

    .line 1263
    .end local v1    # "t":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :catchall_22
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected _resolveVariableViaSubTypes(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/String;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 11
    .param p1, "leafType"    # Lcom/fasterxml/jackson/databind/type/HierarchicType;
    .param p2, "variableName"    # Ljava/lang/String;
    .param p3, "bindings"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    .line 1145
    if-eqz p1, :cond_45

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->isGeneric()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 1146
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v4

    .line 1147
    .local v4, "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, v4

    .local v1, "len":I
    :goto_12
    if-ge v0, v1, :cond_45

    .line 1148
    aget-object v2, v4, v0

    .line 1149
    .local v2, "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v2}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_42

    .line 1151
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->asGeneric()Ljava/lang/reflect/ParameterizedType;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    aget-object v3, v5, v0

    .line 1152
    .local v3, "type":Ljava/lang/reflect/Type;
    instance-of v5, v3, Ljava/lang/reflect/TypeVariable;

    if-eqz v5, :cond_3d

    .line 1153
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getSubType()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v5

    check-cast v3, Ljava/lang/reflect/TypeVariable;

    .end local v3    # "type":Ljava/lang/reflect/Type;
    invoke-interface {v3}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6, p3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_resolveVariableViaSubTypes(Lcom/fasterxml/jackson/databind/type/HierarchicType;Ljava/lang/String;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .line 1160
    .end local v0    # "i":I
    .end local v1    # "len":I
    .end local v2    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v4    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :goto_3c
    return-object v5

    .line 1156
    .restart local v0    # "i":I
    .restart local v1    # "len":I
    .restart local v2    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .restart local v3    # "type":Ljava/lang/reflect/Type;
    .restart local v4    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :cond_3d
    invoke-virtual {p0, v3, p3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    goto :goto_3c

    .line 1147
    .end local v3    # "type":Ljava/lang/reflect/Type;
    :cond_42
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1160
    .end local v0    # "i":I
    .end local v1    # "len":I
    .end local v2    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v4    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :cond_45
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    goto :goto_3c
.end method

.method protected _unknownType()Lcom/fasterxml/jackson/databind/JavaType;
    .registers 3

    .prologue
    .line 1164
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    const-class v1, Ljava/lang/Object;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method protected classForName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 253
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method protected classForName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "initialize"    # Z
    .param p3, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 249
    const/4 v0, 0x1

    invoke-static {p1, v0, p3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public clearCache()V
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_typeCache:Lcom/fasterxml/jackson/databind/util/LRUMap;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/util/LRUMap;->clear()V

    .line 163
    return-void
.end method

.method public constructArrayType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/ArrayType;
    .registers 3
    .param p1, "elementType"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    const/4 v0, 0x0

    .line 535
    invoke-static {p1, v0, v0}, Lcom/fasterxml/jackson/databind/type/ArrayType;->construct(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v0

    return-object v0
.end method

.method public constructArrayType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/ArrayType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/ArrayType;"
        }
    .end annotation

    .prologue
    .local p1, "elementType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 525
    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lcom/fasterxml/jackson/databind/type/ArrayType;->construct(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v0

    return-object v0
.end method

.method public constructCollectionLikeType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .registers 4
    .param p2, "elementType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/type/CollectionLikeType;"
        }
    .end annotation

    .prologue
    .line 575
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    move-result-object v0

    return-object v0
.end method

.method public constructCollectionLikeType(Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/CollectionLikeType;"
        }
    .end annotation

    .prologue
    .line 565
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    move-result-object v0

    return-object v0
.end method

.method public constructCollectionType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;
    .registers 4
    .param p2, "elementType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Collection;",
            ">;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/type/CollectionType;"
        }
    .end annotation

    .prologue
    .line 555
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Collection;>;"
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v0

    return-object v0
.end method

.method public constructCollectionType(Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/CollectionType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Collection;",
            ">;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/CollectionType;"
        }
    .end annotation

    .prologue
    .line 545
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Collection;>;"
    .local p2, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v0

    return-object v0
.end method

.method public constructFromCanonical(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 3
    .param p1, "canonical"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 329
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/type/TypeParser;->parse(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public constructMapLikeType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapLikeType;
    .registers 5
    .param p2, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/type/MapLikeType;"
        }
    .end annotation

    .prologue
    .line 605
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapLikeType;

    move-result-object v0

    return-object v0
.end method

.method public constructMapLikeType(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/MapLikeType;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/MapLikeType;"
        }
    .end annotation

    .prologue
    .line 615
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v0

    return-object v0
.end method

.method public constructMapType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;
    .registers 5
    .param p2, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Map;",
            ">;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/type/MapType;"
        }
    .end annotation

    .prologue
    .line 585
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Map;>;"
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v0

    return-object v0
.end method

.method public constructMapType(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/MapType;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Map;",
            ">;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/MapType;"
        }
    .end annotation

    .prologue
    .line 595
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Map;>;"
    .local p2, "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v0

    return-object v0
.end method

.method public varargs constructParametricType(Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .param p2, "parameterTypes"    # [Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 779
    .local p1, "parametrized":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructParametrizedType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public varargs constructParametricType(Ljava/lang/Class;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 712
    .local p1, "parametrized":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructParametrizedType(Ljava/lang/Class;Ljava/lang/Class;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public varargs constructParametrizedType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 9
    .param p3, "parameterTypes"    # [Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;[",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "parametrized":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parametersFor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 750
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_35

    .line 752
    array-length v1, p3

    if-eq v1, v4, :cond_2e

    .line 753
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Need exactly 1 parameter type for arrays ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 755
    :cond_2e
    aget-object v1, p3, v3

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructArrayType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-result-object v0

    .line 771
    .local v0, "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_34
    return-object v0

    .line 757
    .end local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_35
    const-class v1, Ljava/util/Map;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_6d

    .line 758
    array-length v1, p3

    const/4 v2, 0x2

    if-eq v1, v2, :cond_64

    .line 759
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Need exactly 2 parameter types for Map types ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 761
    :cond_64
    aget-object v1, p3, v3

    aget-object v2, p3, v4

    invoke-virtual {p0, p1, v1, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructMapType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v0

    .restart local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_34

    .line 763
    .end local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_6d
    const-class v1, Ljava/util/Collection;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_a2

    .line 764
    array-length v1, p3

    if-eq v1, v4, :cond_9b

    .line 765
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Need exactly 1 parameter type for Collection types ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 767
    :cond_9b
    aget-object v1, p3, v3

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructCollectionType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v0

    .restart local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_34

    .line 769
    .end local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_a2
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .restart local v0    # "resultType":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_34
.end method

.method public varargs constructParametrizedType(Ljava/lang/Class;Ljava/lang/Class;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 699
    .local p1, "parametrized":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parametersFor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "parameterClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v1, p3

    .line 700
    .local v1, "len":I
    new-array v2, v1, [Lcom/fasterxml/jackson/databind/JavaType;

    .line 701
    .local v2, "pt":[Lcom/fasterxml/jackson/databind/JavaType;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_12

    .line 702
    aget-object v3, p3, v0

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromClass(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    aput-object v3, v2, v0

    .line 701
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 704
    :cond_12
    invoke-virtual {p0, p1, p2, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructParametrizedType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    return-object v3
.end method

.method public constructRawCollectionLikeType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/CollectionLikeType;"
        }
    .end annotation

    .prologue
    .line 816
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    move-result-object v0

    return-object v0
.end method

.method public constructRawCollectionType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/CollectionType;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Collection;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/type/CollectionType;"
        }
    .end annotation

    .prologue
    .line 801
    .local p1, "collectionClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Collection;>;"
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/fasterxml/jackson/databind/type/CollectionType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-result-object v0

    return-object v0
.end method

.method public constructRawMapLikeType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/MapLikeType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/type/MapLikeType;"
        }
    .end annotation

    .prologue
    .line 846
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapLikeType;

    move-result-object v0

    return-object v0
.end method

.method public constructRawMapType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/MapType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/util/Map;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/type/MapType;"
        }
    .end annotation

    .prologue
    .line 831
    .local p1, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/util/Map;>;"
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/databind/type/MapType;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/type/MapType;

    move-result-object v0

    return-object v0
.end method

.method public constructReferenceType(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 9
    .param p2, "refType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 653
    new-instance v0, Lcom/fasterxml/jackson/databind/type/ReferenceType;

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/type/ReferenceType;-><init>(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;Z)V

    return-object v0
.end method

.method public constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 15
    .param p3, "parameterTypes"    # [Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;[",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "parameterTarget":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 635
    invoke-virtual {p2}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v10

    .line 636
    .local v10, "typeVars":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    array-length v0, v10

    array-length v1, p3

    if-eq v0, v1, :cond_4a

    .line 637
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parameter type mismatch for "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " (and target "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "): expected "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v3, v10

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " parameters, was given "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v3, p3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 641
    :cond_4a
    array-length v0, v10

    new-array v2, v0, [Ljava/lang/String;

    .line 642
    .local v2, "names":[Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "i":I
    array-length v9, v10

    .local v9, "len":I
    :goto_4f
    if-ge v8, v9, :cond_5c

    .line 643
    aget-object v0, v10, v8

    invoke-interface {v0}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v8

    .line 642
    add-int/lit8 v8, v8, 0x1

    goto :goto_4f

    .line 645
    :cond_5c
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    const/4 v6, 0x0

    move-object v1, p1

    move-object v3, p3

    move-object v5, v4

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;)V

    return-object v0
.end method

.method public constructSimpleType(Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .param p2, "parameterTypes"    # [Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 625
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructSimpleType(Ljava/lang/Class;Ljava/lang/Class;[Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public constructSpecializedType(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 8
    .param p1, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 286
    .local p2, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v2, p2, :cond_7

    .line 314
    .end local p1    # "baseType":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_6
    return-object p1

    .line 290
    .restart local p1    # "baseType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_7
    instance-of v2, p1, Lcom/fasterxml/jackson/databind/type/SimpleType;

    if-eqz v2, :cond_79

    .line 292
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_21

    const-class v2, Ljava/util/Map;

    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_21

    const-class v2, Ljava/util/Collection;

    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_79

    .line 296
    :cond_21
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_56

    .line 297
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not subtype of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 300
    :cond_56
    new-instance v2, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Ljava/lang/Class;)V

    invoke-virtual {p0, p2, v2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_fromClass(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    .line 302
    .local v1, "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getValueHandler()Ljava/lang/Object;

    move-result-object v0

    .line 303
    .local v0, "h":Ljava/lang/Object;
    if-eqz v0, :cond_6d

    .line 304
    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/databind/JavaType;->withValueHandler(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    .line 306
    :cond_6d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getTypeHandler()Ljava/lang/Object;

    move-result-object v0

    .line 307
    if-eqz v0, :cond_77

    .line 308
    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/databind/JavaType;->withTypeHandler(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    :cond_77
    move-object p1, v1

    .line 310
    goto :goto_6

    .line 314
    .end local v0    # "h":Ljava/lang/Object;
    .end local v1    # "subtype":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_79
    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/databind/JavaType;->narrowBy(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p1

    goto :goto_6
.end method

.method public constructType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/type/TypeReference",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 455
    .local p1, "typeRef":Lcom/fasterxml/jackson/core/type/TypeReference;, "Lcom/fasterxml/jackson/core/type/TypeReference<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/type/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 447
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 5
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "context"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    .line 464
    if-nez p2, :cond_8

    const/4 v0, 0x0

    .line 465
    .local v0, "b":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    :goto_3
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    return-object v1

    .line 464
    .end local v0    # "b":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    :cond_8
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-direct {v0, p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Lcom/fasterxml/jackson/databind/JavaType;)V

    goto :goto_3
.end method

.method public constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "bindings"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;

    .prologue
    .line 451
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public constructType(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 5
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 459
    .local p2, "context":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p2, :cond_8

    const/4 v0, 0x0

    .line 460
    .local v0, "b":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    :goto_3
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    return-object v1

    .line 459
    .end local v0    # "b":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    :cond_8
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-direct {v0, p0, p2}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Ljava/lang/Class;)V

    goto :goto_3
.end method

.method public findClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 8
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 215
    const/16 v4, 0x2e

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_f

    .line 216
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findPrimitive(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 217
    .local v2, "prim":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v2, :cond_f

    .line 235
    .end local v2    # "prim":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_e
    return-object v2

    .line 222
    :cond_f
    const/4 v3, 0x0

    .line 223
    .local v3, "prob":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 224
    .local v1, "loader":Ljava/lang/ClassLoader;
    if-nez v1, :cond_1e

    .line 225
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 227
    :cond_1e
    if-eqz v1, :cond_2b

    .line 229
    const/4 v4, 0x1

    :try_start_21
    invoke-virtual {p0, p1, v4, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->classForName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_26

    move-result-object v2

    goto :goto_e

    .line 230
    :catch_26
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    .line 235
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2b
    :try_start_2b
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->classForName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2e} :catch_30

    move-result-object v2

    goto :goto_e

    .line 236
    :catch_30
    move-exception v0

    .line 237
    .restart local v0    # "e":Ljava/lang/Exception;
    if-nez v3, :cond_37

    .line 238
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    .line 241
    :cond_37
    instance-of v4, v3, Ljava/lang/RuntimeException;

    if-eqz v4, :cond_3e

    .line 242
    check-cast v3, Ljava/lang/RuntimeException;

    .end local v3    # "prob":Ljava/lang/Throwable;
    throw v3

    .line 244
    .restart local v3    # "prob":Ljava/lang/Throwable;
    :cond_3e
    new-instance v4, Ljava/lang/ClassNotFoundException;

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;
    .registers 8
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 351
    .local p2, "expType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getParameterSource()Ljava/lang/Class;

    move-result-object v4

    if-ne p2, v4, :cond_1c

    .line 353
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->containedTypeCount()I

    move-result v0

    .line 354
    .local v0, "count":I
    if-nez v0, :cond_e

    const/4 v3, 0x0

    .line 368
    .end local v0    # "count":I
    :cond_d
    :goto_d
    return-object v3

    .line 355
    .restart local v0    # "count":I
    :cond_e
    new-array v3, v0, [Lcom/fasterxml/jackson/databind/JavaType;

    .line 356
    .local v3, "result":[Lcom/fasterxml/jackson/databind/JavaType;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    if-ge v1, v0, :cond_d

    .line 357
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/databind/JavaType;->containedType(I)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    aput-object v4, v3, v1

    .line 356
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 367
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "result":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_1c
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v2

    .line 368
    .local v2, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-direct {v4, p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Lcom/fasterxml/jackson/databind/JavaType;)V

    invoke-virtual {p0, v2, p2, v4}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    goto :goto_d
.end method

.method public findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 372
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "expType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Ljava/lang/Class;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method public findTypeParameters(Ljava/lang/Class;Ljava/lang/Class;Lcom/fasterxml/jackson/databind/type/TypeBindings;)[Lcom/fasterxml/jackson/databind/JavaType;
    .registers 19
    .param p3, "bindings"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/type/TypeBindings;",
            ")[",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 378
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "expType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p2}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_findSuperTypeChain(Ljava/lang/Class;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v8

    .line 380
    .local v8, "subType":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    if-nez v8, :cond_31

    .line 381
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Class "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " is not a subtype of "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 384
    :cond_31
    move-object v9, v8

    .line 385
    .local v9, "superType":Lcom/fasterxml/jackson/databind/type/HierarchicType;
    :goto_32
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getSuperType()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v12

    if-eqz v12, :cond_72

    .line 386
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getSuperType()Lcom/fasterxml/jackson/databind/type/HierarchicType;

    move-result-object v9

    .line 387
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->getRawClass()Ljava/lang/Class;

    move-result-object v7

    .line 388
    .local v7, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Lcom/fasterxml/jackson/databind/type/TypeBindings;

    invoke-direct {v5, p0, v7}, Lcom/fasterxml/jackson/databind/type/TypeBindings;-><init>(Lcom/fasterxml/jackson/databind/type/TypeFactory;Ljava/lang/Class;)V

    .line 389
    .local v5, "newBindings":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->isGeneric()Z

    move-result v12

    if-eqz v12, :cond_6f

    .line 390
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->asGeneric()Ljava/lang/reflect/ParameterizedType;

    move-result-object v6

    .line 391
    .local v6, "pt":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v6}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 392
    .local v1, "actualTypes":[Ljava/lang/reflect/Type;
    invoke-virtual {v7}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v11

    .line 393
    .local v11, "vars":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    array-length v3, v1

    .line 394
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_59
    if-ge v2, v3, :cond_6f

    .line 395
    aget-object v12, v11, v2

    invoke-interface {v12}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v4

    .line 396
    .local v4, "name":Ljava/lang/String;
    aget-object v12, v1, v2

    move-object/from16 v0, p3

    invoke-virtual {p0, v12, v0}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_constructType(Ljava/lang/reflect/Type;Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v10

    .line 397
    .local v10, "type":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {v5, v4, v10}, Lcom/fasterxml/jackson/databind/type/TypeBindings;->addBinding(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;)V

    .line 394
    add-int/lit8 v2, v2, 0x1

    goto :goto_59

    .line 400
    .end local v1    # "actualTypes":[Ljava/lang/reflect/Type;
    .end local v2    # "i":I
    .end local v3    # "len":I
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "pt":Ljava/lang/reflect/ParameterizedType;
    .end local v10    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v11    # "vars":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :cond_6f
    move-object/from16 p3, v5

    .line 401
    goto :goto_32

    .line 404
    .end local v5    # "newBindings":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    .end local v7    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_72
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/type/HierarchicType;->isGeneric()Z

    move-result v12

    if-nez v12, :cond_7a

    .line 405
    const/4 v12, 0x0

    .line 407
    :goto_79
    return-object v12

    :cond_7a
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/type/TypeBindings;->typesAsArray()[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v12

    goto :goto_79
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public moreSpecificType(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 6
    .param p1, "type1"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "type2"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    .line 422
    if-nez p1, :cond_4

    move-object p1, p2

    .line 437
    .end local p1    # "type1":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_3
    :goto_3
    return-object p1

    .line 425
    .restart local p1    # "type1":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_4
    if-eqz p2, :cond_3

    .line 428
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v0

    .line 429
    .local v0, "raw1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    .line 430
    .local v1, "raw2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v0, v1, :cond_3

    .line 434
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object p1, p2

    .line 435
    goto :goto_3
.end method

.method public uncheckedSimpleType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JavaType;"
        }
    .end annotation

    .prologue
    .line 664
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/type/SimpleType;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/type/SimpleType;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public withClassLoader(Ljava/lang/ClassLoader;)Lcom/fasterxml/jackson/databind/type/TypeFactory;
    .registers 5
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 141
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    invoke-direct {v0, v1, v2, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V

    return-object v0
.end method

.method public withModifier(Lcom/fasterxml/jackson/databind/type/TypeModifier;)Lcom/fasterxml/jackson/databind/type/TypeFactory;
    .registers 6
    .param p1, "mod"    # Lcom/fasterxml/jackson/databind/type/TypeModifier;

    .prologue
    .line 131
    if-nez p1, :cond_e

    .line 132
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    invoke-direct {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V

    .line 137
    :goto_d
    return-object v0

    .line 134
    :cond_e
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    if-nez v0, :cond_22

    .line 135
    new-instance v0, Lcom/fasterxml/jackson/databind/type/TypeFactory;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/fasterxml/jackson/databind/type/TypeModifier;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    invoke-direct {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V

    goto :goto_d

    .line 137
    :cond_22
    new-instance v1, Lcom/fasterxml/jackson/databind/type/TypeFactory;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_parser:Lcom/fasterxml/jackson/databind/type/TypeParser;

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_modifiers:[Lcom/fasterxml/jackson/databind/type/TypeModifier;

    invoke-static {v0, p1}, Lcom/fasterxml/jackson/databind/util/ArrayBuilders;->insertInListNoDup([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/fasterxml/jackson/databind/type/TypeModifier;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/type/TypeFactory;->_classLoader:Ljava/lang/ClassLoader;

    invoke-direct {v1, v2, v0, v3}, Lcom/fasterxml/jackson/databind/type/TypeFactory;-><init>(Lcom/fasterxml/jackson/databind/type/TypeParser;[Lcom/fasterxml/jackson/databind/type/TypeModifier;Ljava/lang/ClassLoader;)V

    move-object v0, v1

    goto :goto_d
.end method
