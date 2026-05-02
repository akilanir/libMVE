.class public final Lcom/google/common/reflect/TypeResolver;
.super Ljava/lang/Object;
.source "TypeResolver.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/reflect/TypeResolver$WildcardCapturer;,
        Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;,
        Lcom/google/common/reflect/TypeResolver$TypeTable;
    }
.end annotation


# instance fields
.field private final typeTable:Lcom/google/common/reflect/TypeResolver$TypeTable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lcom/google/common/reflect/TypeResolver$TypeTable;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeResolver$TypeTable;-><init>()V

    iput-object v0, p0, Lcom/google/common/reflect/TypeResolver;->typeTable:Lcom/google/common/reflect/TypeResolver$TypeTable;

    .line 59
    return-void
.end method

.method private constructor <init>(Lcom/google/common/reflect/TypeResolver$TypeTable;)V
    .registers 2
    .param p1, "typeTable"    # Lcom/google/common/reflect/TypeResolver$TypeTable;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/google/common/reflect/TypeResolver;->typeTable:Lcom/google/common/reflect/TypeResolver$TypeTable;

    .line 63
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/reflect/TypeResolver$TypeTable;Lcom/google/common/reflect/TypeResolver$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/google/common/reflect/TypeResolver$TypeTable;
    .param p2, "x1"    # Lcom/google/common/reflect/TypeResolver$1;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeResolver;-><init>(Lcom/google/common/reflect/TypeResolver$TypeTable;)V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "x0"    # Ljava/lang/Class;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 53
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeResolver;->expectArgument(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V
    .registers 3
    .param p0, "x0"    # Ljava/util/Map;
    .param p1, "x1"    # Ljava/lang/reflect/Type;
    .param p2, "x2"    # Ljava/lang/reflect/Type;

    .prologue
    .line 53
    invoke-static {p0, p1, p2}, Lcom/google/common/reflect/TypeResolver;->populateTypeMappings(Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    return-void
.end method

.method static synthetic access$300(Lcom/google/common/reflect/TypeResolver;[Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    .registers 3
    .param p0, "x0"    # Lcom/google/common/reflect/TypeResolver;
    .param p1, "x1"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeResolver;->resolveTypes([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method static accordingTo(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeResolver;
    .registers 3
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 66
    new-instance v0, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeResolver;-><init>()V

    invoke-static {p0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->getTypeMappings(Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/reflect/TypeResolver;->where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver;

    move-result-object v0

    return-object v0
.end method

.method private static expectArgument(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 204
    :catch_5
    move-exception v0

    .line 205
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static populateTypeMappings(Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V
    .registers 6
    .param p1, "from"    # Ljava/lang/reflect/Type;
    .param p2, "to"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "mappings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 149
    :goto_6
    return-void

    .line 104
    :cond_7
    new-instance v0, Lcom/google/common/reflect/TypeResolver$1;

    invoke-direct {v0, p0, p2}, Lcom/google/common/reflect/TypeResolver$1;-><init>(Ljava/util/Map;Ljava/lang/reflect/Type;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/reflect/Type;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/google/common/reflect/TypeResolver$1;->visit([Ljava/lang/reflect/Type;)V

    goto :goto_6
.end method

.method private resolveGenericArrayType(Ljava/lang/reflect/GenericArrayType;)Ljava/lang/reflect/Type;
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/GenericArrayType;

    .prologue
    .line 183
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 184
    .local v0, "componentType":Ljava/lang/reflect/Type;
    invoke-static {v0}, Lcom/google/common/reflect/Types;->newArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1

    return-object v1
.end method

.method private resolveParameterizedType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/reflect/ParameterizedType;
    .registers 9
    .param p1, "type"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    .line 188
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 189
    .local v1, "owner":Ljava/lang/reflect/Type;
    if-nez v1, :cond_25

    const/4 v3, 0x0

    .line 190
    .local v3, "resolvedOwner":Ljava/lang/reflect/Type;
    :goto_7
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 192
    .local v4, "resolvedRawType":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 193
    .local v5, "vars":[Ljava/lang/reflect/Type;
    array-length v6, v5

    new-array v2, v6, [Ljava/lang/reflect/Type;

    .line 194
    .local v2, "resolvedArgs":[Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v6, v5

    if-ge v0, v6, :cond_2a

    .line 195
    aget-object v6, v5, v0

    invoke-virtual {p0, v6}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v6

    aput-object v6, v2, v0

    .line 194
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 189
    .end local v0    # "i":I
    .end local v2    # "resolvedArgs":[Ljava/lang/reflect/Type;
    .end local v3    # "resolvedOwner":Ljava/lang/reflect/Type;
    .end local v4    # "resolvedRawType":Ljava/lang/reflect/Type;
    .end local v5    # "vars":[Ljava/lang/reflect/Type;
    :cond_25
    invoke-virtual {p0, v1}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v3

    goto :goto_7

    .line 197
    .restart local v0    # "i":I
    .restart local v2    # "resolvedArgs":[Ljava/lang/reflect/Type;
    .restart local v3    # "resolvedOwner":Ljava/lang/reflect/Type;
    .restart local v4    # "resolvedRawType":Ljava/lang/reflect/Type;
    .restart local v5    # "vars":[Ljava/lang/reflect/Type;
    :cond_2a
    check-cast v4, Ljava/lang/Class;

    .end local v4    # "resolvedRawType":Ljava/lang/reflect/Type;
    invoke-static {v3, v4, v2}, Lcom/google/common/reflect/Types;->newParameterizedTypeWithOwner(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/ParameterizedType;

    move-result-object v6

    return-object v6
.end method

.method private resolveTypes([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    .registers 5
    .param p1, "types"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 175
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/reflect/Type;

    .line 176
    .local v1, "result":[Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p1

    if-ge v0, v2, :cond_12

    .line 177
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v2

    aput-object v2, v1, v0

    .line 176
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 179
    :cond_12
    return-object v1
.end method


# virtual methods
.method public resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 5
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 156
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    instance-of v1, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_10

    .line 158
    iget-object v1, p0, Lcom/google/common/reflect/TypeResolver;->typeTable:Lcom/google/common/reflect/TypeResolver$TypeTable;

    check-cast p1, Ljava/lang/reflect/TypeVariable;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-virtual {v1, p1}, Lcom/google/common/reflect/TypeResolver$TypeTable;->resolve(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object p1

    .line 170
    :cond_f
    :goto_f
    return-object p1

    .line 159
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_10
    instance-of v1, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v1, :cond_1b

    .line 160
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeResolver;->resolveParameterizedType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/reflect/ParameterizedType;

    move-result-object p1

    goto :goto_f

    .line 161
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_1b
    instance-of v1, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v1, :cond_26

    .line 162
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeResolver;->resolveGenericArrayType(Ljava/lang/reflect/GenericArrayType;)Ljava/lang/reflect/Type;

    move-result-object p1

    goto :goto_f

    .line 163
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_26
    instance-of v1, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v1, :cond_f

    move-object v0, p1

    .line 164
    check-cast v0, Ljava/lang/reflect/WildcardType;

    .line 165
    .local v0, "wildcardType":Ljava/lang/reflect/WildcardType;
    new-instance p1, Lcom/google/common/reflect/Types$WildcardTypeImpl;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/common/reflect/TypeResolver;->resolveTypes([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/common/reflect/TypeResolver;->resolveTypes([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-direct {p1, v1, v2}, Lcom/google/common/reflect/Types$WildcardTypeImpl;-><init>([Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)V

    goto :goto_f
.end method

.method public where(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeResolver;
    .registers 6
    .param p1, "formal"    # Ljava/lang/reflect/Type;
    .param p2, "actual"    # Ljava/lang/reflect/Type;

    .prologue
    .line 89
    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    .line 90
    .local v0, "mappings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Type;

    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Type;

    invoke-static {v0, v1, v2}, Lcom/google/common/reflect/TypeResolver;->populateTypeMappings(Ljava/util/Map;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    .line 91
    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeResolver;->where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver;

    move-result-object v1

    return-object v1
.end method

.method where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;+",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Lcom/google/common/reflect/TypeResolver;"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "mappings":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/reflect/TypeVariable<*>;+Ljava/lang/reflect/Type;>;"
    new-instance v0, Lcom/google/common/reflect/TypeResolver;

    iget-object v1, p0, Lcom/google/common/reflect/TypeResolver;->typeTable:Lcom/google/common/reflect/TypeResolver$TypeTable;

    invoke-virtual {v1, p1}, Lcom/google/common/reflect/TypeResolver$TypeTable;->where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver$TypeTable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/reflect/TypeResolver;-><init>(Lcom/google/common/reflect/TypeResolver$TypeTable;)V

    return-object v0
.end method
