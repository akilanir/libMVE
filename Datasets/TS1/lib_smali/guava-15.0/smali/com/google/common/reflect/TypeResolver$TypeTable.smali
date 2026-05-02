.class Lcom/google/common/reflect/TypeResolver$TypeTable;
.super Ljava/lang/Object;
.source "TypeResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/TypeResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TypeTable"
.end annotation


# instance fields
.field private final map:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/reflect/TypeResolver$TypeTable;->map:Lcom/google/common/collect/ImmutableMap;

    .line 215
    return-void
.end method

.method private constructor <init>(Lcom/google/common/collect/ImmutableMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 217
    .local p1, "map":Lcom/google/common/collect/ImmutableMap;, "Lcom/google/common/collect/ImmutableMap<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    iput-object p1, p0, Lcom/google/common/reflect/TypeResolver$TypeTable;->map:Lcom/google/common/collect/ImmutableMap;

    .line 219
    return-void
.end method


# virtual methods
.method final resolve(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 235
    .local p1, "var":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    move-object v1, p0

    .line 236
    .local v1, "unguarded":Lcom/google/common/reflect/TypeResolver$TypeTable;
    new-instance v0, Lcom/google/common/reflect/TypeResolver$TypeTable$1;

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/reflect/TypeResolver$TypeTable$1;-><init>(Lcom/google/common/reflect/TypeResolver$TypeTable;Ljava/lang/reflect/TypeVariable;Lcom/google/common/reflect/TypeResolver$TypeTable;)V

    .line 245
    .local v0, "guarded":Lcom/google/common/reflect/TypeResolver$TypeTable;
    invoke-virtual {p0, p1, v0}, Lcom/google/common/reflect/TypeResolver$TypeTable;->resolveInternal(Ljava/lang/reflect/TypeVariable;Lcom/google/common/reflect/TypeResolver$TypeTable;)Ljava/lang/reflect/Type;

    move-result-object v2

    return-object v2
.end method

.method resolveInternal(Ljava/lang/reflect/TypeVariable;Lcom/google/common/reflect/TypeResolver$TypeTable;)Ljava/lang/reflect/Type;
    .registers 9
    .param p2, "forDependants"    # Lcom/google/common/reflect/TypeResolver$TypeTable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Lcom/google/common/reflect/TypeResolver$TypeTable;",
            ")",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .local p1, "var":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v5, 0x0

    .line 257
    iget-object v2, p0, Lcom/google/common/reflect/TypeResolver$TypeTable;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Type;

    .line 258
    .local v1, "type":Ljava/lang/reflect/Type;
    if-nez v1, :cond_29

    .line 259
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 260
    .local v0, "bounds":[Ljava/lang/reflect/Type;
    array-length v2, v0

    if-nez v2, :cond_13

    .line 269
    .end local v0    # "bounds":[Ljava/lang/reflect/Type;
    .end local p1    # "var":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :goto_12
    return-object p1

    .line 263
    .restart local v0    # "bounds":[Ljava/lang/reflect/Type;
    .restart local p1    # "var":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_13
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v4, p2, v5}, Lcom/google/common/reflect/TypeResolver;-><init>(Lcom/google/common/reflect/TypeResolver$TypeTable;Lcom/google/common/reflect/TypeResolver$1;)V

    # invokes: Lcom/google/common/reflect/TypeResolver;->resolveTypes([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    invoke-static {v4, v0}, Lcom/google/common/reflect/TypeResolver;->access$300(Lcom/google/common/reflect/TypeResolver;[Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/google/common/reflect/Types;->newTypeVariable(Ljava/lang/reflect/GenericDeclaration;Ljava/lang/String;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/TypeVariable;

    move-result-object p1

    goto :goto_12

    .line 269
    .end local v0    # "bounds":[Ljava/lang/reflect/Type;
    :cond_29
    new-instance v2, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v2, p2, v5}, Lcom/google/common/reflect/TypeResolver;-><init>(Lcom/google/common/reflect/TypeResolver$TypeTable;Lcom/google/common/reflect/TypeResolver$1;)V

    invoke-virtual {v2, v1}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object p1

    goto :goto_12
.end method

.method final where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver$TypeTable;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;+",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Lcom/google/common/reflect/TypeResolver$TypeTable;"
        }
    .end annotation

    .prologue
    .local p1, "mappings":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/reflect/TypeVariable<*>;+Ljava/lang/reflect/Type;>;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 223
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    .line 224
    .local v0, "builder":Lcom/google/common/collect/ImmutableMap$Builder;, "Lcom/google/common/collect/ImmutableMap$Builder<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    iget-object v5, p0, Lcom/google/common/reflect/TypeResolver$TypeTable;->map:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, v5}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap$Builder;

    .line 225
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 226
    .local v2, "mapping":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+Ljava/lang/reflect/TypeVariable<*>;+Ljava/lang/reflect/Type;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/TypeVariable;

    .line 227
    .local v4, "variable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Type;

    .line 228
    .local v3, "type":Ljava/lang/reflect/Type;
    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3f

    move v5, v6

    :goto_32
    const-string v8, "Type variable %s bound to itself"

    new-array v9, v6, [Ljava/lang/Object;

    aput-object v4, v9, v7

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 229
    invoke-virtual {v0, v4, v3}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_13

    :cond_3f
    move v5, v7

    .line 228
    goto :goto_32

    .line 231
    .end local v2    # "mapping":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+Ljava/lang/reflect/TypeVariable<*>;+Ljava/lang/reflect/Type;>;"
    .end local v3    # "type":Ljava/lang/reflect/Type;
    .end local v4    # "variable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_41
    new-instance v5, Lcom/google/common/reflect/TypeResolver$TypeTable;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/google/common/reflect/TypeResolver$TypeTable;-><init>(Lcom/google/common/collect/ImmutableMap;)V

    return-object v5
.end method
