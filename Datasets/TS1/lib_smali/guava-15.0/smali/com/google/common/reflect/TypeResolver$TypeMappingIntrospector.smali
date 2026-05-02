.class final Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;
.super Lcom/google/common/reflect/TypeVisitor;
.source "TypeResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/TypeResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TypeMappingIntrospector"
.end annotation


# static fields
.field private static final wildcardCapturer:Lcom/google/common/reflect/TypeResolver$WildcardCapturer;


# instance fields
.field private final mappings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 275
    new-instance v0, Lcom/google/common/reflect/TypeResolver$WildcardCapturer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/reflect/TypeResolver$WildcardCapturer;-><init>(Lcom/google/common/reflect/TypeResolver$1;)V

    sput-object v0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->wildcardCapturer:Lcom/google/common/reflect/TypeResolver$WildcardCapturer;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 273
    invoke-direct {p0}, Lcom/google/common/reflect/TypeVisitor;-><init>()V

    .line 277
    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    return-void
.end method

.method static getTypeMappings(Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableMap;
    .registers 5
    .param p0, "contextType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 285
    new-instance v0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;-><init>()V

    .line 286
    .local v0, "introspector":Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/reflect/Type;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->wildcardCapturer:Lcom/google/common/reflect/TypeResolver$WildcardCapturer;

    invoke-virtual {v3, p0}, Lcom/google/common/reflect/TypeResolver$WildcardCapturer;->capture(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 287
    iget-object v1, v0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    invoke-static {v1}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    return-object v1
.end method

.method private map(Ljava/lang/reflect/TypeVariable;Ljava/lang/reflect/Type;)V
    .registers 6
    .param p2, "arg"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 316
    .local p1, "var":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    iget-object v2, p0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 336
    :cond_8
    :goto_8
    return-void

    .line 325
    :cond_9
    move-object v0, p2

    .local v0, "t":Ljava/lang/reflect/Type;
    :goto_a
    if-eqz v0, :cond_27

    .line 326
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 331
    move-object v1, p2

    .local v1, "x":Ljava/lang/reflect/Type;
    :goto_13
    if-eqz v1, :cond_8

    iget-object v2, p0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "x":Ljava/lang/reflect/Type;
    check-cast v1, Ljava/lang/reflect/Type;

    .restart local v1    # "x":Ljava/lang/reflect/Type;
    goto :goto_13

    .line 325
    .end local v1    # "x":Ljava/lang/reflect/Type;
    :cond_1e
    iget-object v2, p0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "t":Ljava/lang/reflect/Type;
    check-cast v0, Ljava/lang/reflect/Type;

    .restart local v0    # "t":Ljava/lang/reflect/Type;
    goto :goto_a

    .line 335
    :cond_27
    iget-object v2, p0, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->mappings:Ljava/util/Map;

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8
.end method


# virtual methods
.method visitClass(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 291
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/reflect/Type;

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 292
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 293
    return-void
.end method

.method visitParameterizedType(Ljava/lang/reflect/ParameterizedType;)V
    .registers 10
    .param p1, "parameterizedType"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 296
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 297
    .local v1, "rawClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v3

    .line 298
    .local v3, "vars":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 299
    .local v2, "typeArgs":[Ljava/lang/reflect/Type;
    array-length v4, v3

    array-length v7, v2

    if-ne v4, v7, :cond_26

    move v4, v5

    :goto_15
    invoke-static {v4}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 300
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    array-length v4, v3

    if-ge v0, v4, :cond_28

    .line 301
    aget-object v4, v3, v0

    aget-object v7, v2, v0

    invoke-direct {p0, v4, v7}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->map(Ljava/lang/reflect/TypeVariable;Ljava/lang/reflect/Type;)V

    .line 300
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .end local v0    # "i":I
    :cond_26
    move v4, v6

    .line 299
    goto :goto_15

    .line 303
    .restart local v0    # "i":I
    :cond_28
    new-array v4, v5, [Ljava/lang/reflect/Type;

    aput-object v1, v4, v6

    invoke-virtual {p0, v4}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 304
    new-array v4, v5, [Ljava/lang/reflect/Type;

    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v4}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 305
    return-void
.end method

.method visitTypeVariable(Ljava/lang/reflect/TypeVariable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 308
    .local p1, "t":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 309
    return-void
.end method

.method visitWildcardType(Ljava/lang/reflect/WildcardType;)V
    .registers 3
    .param p1, "t"    # Ljava/lang/reflect/WildcardType;

    .prologue
    .line 312
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeResolver$TypeMappingIntrospector;->visit([Ljava/lang/reflect/Type;)V

    .line 313
    return-void
.end method
