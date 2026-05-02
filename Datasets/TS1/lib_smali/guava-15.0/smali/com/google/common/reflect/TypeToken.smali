.class public abstract Lcom/google/common/reflect/TypeToken;
.super Lcom/google/common/reflect/TypeCapture;
.source "TypeToken.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/reflect/TypeToken$TypeCollector;,
        Lcom/google/common/reflect/TypeToken$SimpleTypeToken;,
        Lcom/google/common/reflect/TypeToken$TypeFilter;,
        Lcom/google/common/reflect/TypeToken$ClassSet;,
        Lcom/google/common/reflect/TypeToken$InterfaceSet;,
        Lcom/google/common/reflect/TypeToken$TypeSet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/reflect/TypeCapture",
        "<TT;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private final runtimeType:Ljava/lang/reflect/Type;

.field private transient typeResolver:Lcom/google/common/reflect/TypeResolver;


# direct methods
.method protected constructor <init>()V
    .registers 6

    .prologue
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 111
    invoke-direct {p0}, Lcom/google/common/reflect/TypeCapture;-><init>()V

    .line 112
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->capture()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    .line 113
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v0, v0, Ljava/lang/reflect/TypeVariable;

    if-nez v0, :cond_1e

    move v0, v1

    :goto_12
    const-string v3, "Cannot construct a TypeToken for a type variable.\nYou probably meant to call new TypeToken<%s>(getClass()) that can resolve the type variable for you.\nIf you do need to create a TypeToken of a type variable, please use TypeToken.of() instead."

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 119
    return-void

    :cond_1e
    move v0, v2

    .line 113
    goto :goto_12
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lcom/google/common/reflect/TypeCapture;-><init>()V

    .line 139
    invoke-super {p0}, Lcom/google/common/reflect/TypeCapture;->capture()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 140
    .local v0, "captured":Ljava/lang/reflect/Type;
    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_e

    .line 141
    iput-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    .line 145
    :goto_d
    return-void

    .line 143
    :cond_e
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/common/reflect/TypeToken;->resolveType(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    iget-object v1, v1, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    iput-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    goto :goto_d
.end method

.method private constructor <init>(Ljava/lang/reflect/Type;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 147
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-direct {p0}, Lcom/google/common/reflect/TypeCapture;-><init>()V

    .line 148
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Type;

    iput-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    .line 149
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/reflect/Type;Lcom/google/common/reflect/TypeToken$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/reflect/Type;
    .param p2, "x1"    # Lcom/google/common/reflect/TypeToken$1;

    .prologue
    .line 94
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeToken;-><init>(Ljava/lang/reflect/Type;)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/reflect/TypeToken;[Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    .registers 3
    .param p0, "x0"    # Lcom/google/common/reflect/TypeToken;
    .param p1, "x1"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeToken;->resolveInPlace([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/common/reflect/TypeToken;)Lcom/google/common/collect/ImmutableSet;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/reflect/TypeToken;

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/google/common/reflect/TypeToken;->getImmediateRawTypes()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/common/reflect/TypeToken;)Ljava/lang/reflect/Type;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/reflect/TypeToken;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method private boundAsSuperclass(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 5
    .param p1, "bound"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 302
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 303
    .local v1, "token":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    invoke-virtual {v1}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 304
    const/4 v0, 0x0

    .line 308
    :goto_f
    return-object v0

    .line 307
    :cond_10
    move-object v0, v1

    .line 308
    .local v0, "superclass":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    goto :goto_f
.end method

.method private boundsAsInterfaces([Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableList;
    .registers 9
    .param p1, "bounds"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;>;"
        }
    .end annotation

    .prologue
    .line 341
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    .line 342
    .local v3, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lcom/google/common/reflect/TypeToken<-TT;>;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_7
    if-ge v4, v5, :cond_1f

    aget-object v1, v0, v4

    .line 344
    .local v1, "bound":Ljava/lang/reflect/Type;
    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    .line 345
    .local v2, "boundType":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    invoke-virtual {v2}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 346
    invoke-virtual {v3, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 342
    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    .line 349
    .end local v1    # "bound":Ljava/lang/reflect/Type;
    .end local v2    # "boundType":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    :cond_1f
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    return-object v6
.end method

.method private getArraySubtype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<+TT;>;"
        }
    .end annotation

    .prologue
    .line 1005
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getComponentType()Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/reflect/TypeToken;->getSubtype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 1008
    .local v0, "componentSubtype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    iget-object v2, v0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v2}, Lcom/google/common/reflect/TypeToken;->newArrayClassOrGenericArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 1011
    .local v1, "result":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    return-object v1
.end method

.method private getArraySupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<-TT;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 991
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "supertype":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getComponentType()Lcom/google/common/reflect/TypeToken;

    move-result-object v3

    const-string v4, "%s isn\'t a super type of %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    invoke-static {v3, v4, v5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/reflect/TypeToken;

    .line 995
    .local v1, "componentType":Lcom/google/common/reflect/TypeToken;
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/common/reflect/TypeToken;->getSupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 997
    .local v0, "componentSupertype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    iget-object v3, v0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v3}, Lcom/google/common/reflect/TypeToken;->newArrayClassOrGenericArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v3}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    .line 1000
    .local v2, "result":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    return-object v2
.end method

.method private getImmediateRawTypes()Lcom/google/common/collect/ImmutableSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/lang/Class",
            "<-TT;>;>;"
        }
    .end annotation

    .prologue
    .line 189
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->getRawTypes(Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    .line 190
    .local v0, "result":Lcom/google/common/collect/ImmutableSet;, "Lcom/google/common/collect/ImmutableSet<Ljava/lang/Class<-TT;>;>;"
    return-object v0
.end method

.method static getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 2
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

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
    .line 909
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->getRawTypes(Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/UnmodifiableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method static getRawTypes(Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableSet;
    .registers 5
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 913
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    .line 915
    .local v0, "builder":Lcom/google/common/collect/ImmutableSet$Builder;, "Lcom/google/common/collect/ImmutableSet$Builder<Ljava/lang/Class<*>;>;"
    new-instance v1, Lcom/google/common/reflect/TypeToken$4;

    invoke-direct {v1, v0}, Lcom/google/common/reflect/TypeToken$4;-><init>(Lcom/google/common/collect/ImmutableSet$Builder;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/reflect/Type;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v1, v2}, Lcom/google/common/reflect/TypeToken$4;->visit([Ljava/lang/reflect/Type;)V

    .line 933
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    return-object v1
.end method

.method private getSubtypeFromLowerBounds(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 11
    .param p2, "lowerBounds"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<+TT;>;"
        }
    .end annotation

    .prologue
    .line 978
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    if-ge v2, v3, :cond_10

    aget-object v4, v0, v2

    .line 980
    .local v4, "lowerBound":Ljava/lang/reflect/Type;
    invoke-static {v4}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 982
    .local v1, "bound":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    invoke-virtual {v1, p1}, Lcom/google/common/reflect/TypeToken;->getSubtype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v5

    return-object v5

    .line 984
    .end local v1    # "bound":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    .end local v4    # "lowerBound":Ljava/lang/reflect/Type;
    :cond_10
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " isn\'t a subclass of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private getSupertypeFromUpperBounds(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 12
    .param p2, "upperBounds"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<-TT;>;[",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 965
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "supertype":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_1d

    aget-object v5, v0, v2

    .line 967
    .local v5, "upperBound":Ljava/lang/reflect/Type;
    invoke-static {v5}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 968
    .local v1, "bound":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/google/common/reflect/TypeToken;->isAssignableFrom(Lcom/google/common/reflect/TypeToken;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 970
    invoke-virtual {v1, p1}, Lcom/google/common/reflect/TypeToken;->getSupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v4

    .line 971
    .local v4, "result":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    return-object v4

    .line 965
    .end local v4    # "result":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 974
    .end local v1    # "bound":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    .end local v5    # "upperBound":Ljava/lang/reflect/Type;
    :cond_1d
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " isn\'t a super type of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .registers 3
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/Type;

    .prologue
    .line 738
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 739
    const/4 v0, 0x1

    .line 765
    .end local p1    # "to":Ljava/lang/reflect/Type;
    :goto_7
    return v0

    .line 741
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_8
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_13

    .line 742
    check-cast p1, Ljava/lang/reflect/WildcardType;

    .end local p1    # "to":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableToWildcardType(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;)Z

    move-result v0

    goto :goto_7

    .line 746
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_13
    instance-of v0, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_22

    .line 747
    check-cast p0, Ljava/lang/reflect/TypeVariable;

    .end local p0    # "from":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableFromAny([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    goto :goto_7

    .line 751
    .restart local p0    # "from":Ljava/lang/reflect/Type;
    :cond_22
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_31

    .line 752
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0    # "from":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableFromAny([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    goto :goto_7

    .line 754
    .restart local p0    # "from":Ljava/lang/reflect/Type;
    :cond_31
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_3c

    .line 755
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0    # "from":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableFromGenericArrayType(Ljava/lang/reflect/GenericArrayType;Ljava/lang/reflect/Type;)Z

    move-result v0

    goto :goto_7

    .line 758
    .restart local p0    # "from":Ljava/lang/reflect/Type;
    :cond_3c
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_47

    .line 759
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "to":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableToClass(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v0

    goto :goto_7

    .line 760
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_47
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_52

    .line 761
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "to":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableToParameterizedType(Ljava/lang/reflect/Type;Ljava/lang/reflect/ParameterizedType;)Z

    move-result v0

    goto :goto_7

    .line 762
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_52
    instance-of v0, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_5d

    .line 763
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1    # "to":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableToGenericArrayType(Ljava/lang/reflect/Type;Ljava/lang/reflect/GenericArrayType;)Z

    move-result v0

    goto :goto_7

    .line 765
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_5d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static isAssignableBySubtypeBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;)Z
    .registers 5
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/WildcardType;

    .prologue
    .line 793
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->subtypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 794
    .local v1, "toSubtypeBound":Ljava/lang/reflect/Type;
    if-nez v1, :cond_8

    .line 795
    const/4 v2, 0x1

    .line 801
    :goto_7
    return v2

    .line 797
    :cond_8
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->subtypeBound(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 798
    .local v0, "fromSubtypeBound":Ljava/lang/reflect/Type;
    if-nez v0, :cond_10

    .line 799
    const/4 v2, 0x0

    goto :goto_7

    .line 801
    :cond_10
    invoke-static {v1, v0}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    goto :goto_7
.end method

.method private static isAssignableFromAny([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .registers 7
    .param p0, "fromTypes"    # [Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/Type;

    .prologue
    .line 770
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_12

    aget-object v1, v0, v2

    .line 771
    .local v1, "from":Ljava/lang/reflect/Type;
    invoke-static {v1, p1}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 772
    const/4 v4, 0x1

    .line 775
    .end local v1    # "from":Ljava/lang/reflect/Type;
    :goto_e
    return v4

    .line 770
    .restart local v1    # "from":Ljava/lang/reflect/Type;
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 775
    .end local v1    # "from":Ljava/lang/reflect/Type;
    :cond_12
    const/4 v4, 0x0

    goto :goto_e
.end method

.method private static isAssignableFromGenericArrayType(Ljava/lang/reflect/GenericArrayType;Ljava/lang/reflect/Type;)Z
    .registers 6
    .param p0, "from"    # Ljava/lang/reflect/GenericArrayType;
    .param p1, "to"    # Ljava/lang/reflect/Type;

    .prologue
    const/4 v2, 0x0

    .line 844
    instance-of v3, p1, Ljava/lang/Class;

    if-eqz v3, :cond_21

    move-object v1, p1

    .line 845
    check-cast v1, Ljava/lang/Class;

    .line 846
    .local v1, "toClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-nez v3, :cond_14

    .line 847
    const-class v3, Ljava/lang/Object;

    if-ne v1, v3, :cond_13

    const/4 v2, 0x1

    .line 854
    .end local v1    # "toClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    :goto_13
    return v2

    .line 849
    .restart local v1    # "toClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_14
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    goto :goto_13

    .line 850
    .end local v1    # "toClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_21
    instance-of v3, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v3, :cond_13

    move-object v0, p1

    .line 851
    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    .line 852
    .local v0, "toArrayType":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    goto :goto_13
.end method

.method private static isAssignableToClass(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z
    .registers 3
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 779
    .local p1, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method private static isAssignableToGenericArrayType(Ljava/lang/reflect/Type;Ljava/lang/reflect/GenericArrayType;)Z
    .registers 6
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/GenericArrayType;

    .prologue
    const/4 v2, 0x0

    .line 829
    instance-of v3, p0, Ljava/lang/Class;

    if-eqz v3, :cond_1c

    move-object v1, p0

    .line 830
    check-cast v1, Ljava/lang/Class;

    .line 831
    .local v1, "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-nez v3, :cond_f

    .line 839
    .end local v1    # "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_e
    :goto_e
    return v2

    .line 834
    .restart local v1    # "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_f
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    goto :goto_e

    .line 835
    .end local v1    # "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1c
    instance-of v3, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v3, :cond_e

    move-object v0, p0

    .line 836
    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    .line 837
    .local v0, "fromArrayType":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    goto :goto_e
.end method

.method private static isAssignableToParameterizedType(Ljava/lang/reflect/Type;Ljava/lang/reflect/ParameterizedType;)Z
    .registers 10
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    const/4 v6, 0x0

    .line 805
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v3

    .line 806
    .local v3, "matchedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_10

    .line 825
    :cond_f
    :goto_f
    return v6

    .line 809
    :cond_10
    invoke-virtual {v3}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v5

    .line 810
    .local v5, "typeParams":[Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 811
    .local v4, "toTypeArgs":[Ljava/lang/reflect/Type;
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 812
    .local v1, "fromTypeToken":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1d
    array-length v7, v5

    if-ge v2, v7, :cond_33

    .line 820
    aget-object v7, v5, v2

    invoke-virtual {v1, v7}, Lcom/google/common/reflect/TypeToken;->resolveType(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v7

    iget-object v0, v7, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    .line 821
    .local v0, "fromTypeArg":Ljava/lang/reflect/Type;
    aget-object v7, v4, v2

    invoke-static {v0, v7}, Lcom/google/common/reflect/TypeToken;->matchTypeArgument(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 812
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 825
    .end local v0    # "fromTypeArg":Ljava/lang/reflect/Type;
    :cond_33
    const/4 v6, 0x1

    goto :goto_f
.end method

.method private static isAssignableToWildcardType(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;)Z
    .registers 3
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/WildcardType;

    .prologue
    .line 789
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->supertypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableBySubtypeBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private isWrapper()Z
    .registers 3

    .prologue
    .line 456
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-static {}, Lcom/google/common/primitives/Primitives;->allWrapperTypes()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static matchTypeArgument(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .registers 3
    .param p0, "from"    # Ljava/lang/reflect/Type;
    .param p1, "to"    # Ljava/lang/reflect/Type;

    .prologue
    .line 859
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 860
    const/4 v0, 0x1

    .line 865
    .end local p1    # "to":Ljava/lang/reflect/Type;
    :goto_7
    return v0

    .line 862
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_8
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_13

    .line 863
    check-cast p1, Ljava/lang/reflect/WildcardType;

    .end local p1    # "to":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lcom/google/common/reflect/TypeToken;->isAssignableToWildcardType(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;)Z

    move-result v0

    goto :goto_7

    .line 865
    .restart local p1    # "to":Ljava/lang/reflect/Type;
    :cond_13
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static newArrayClassOrGenericArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 2
    .param p0, "componentType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 1041
    sget-object v0, Lcom/google/common/reflect/Types$JavaVersion;->JAVA7:Lcom/google/common/reflect/Types$JavaVersion;

    invoke-virtual {v0, p0}, Lcom/google/common/reflect/Types$JavaVersion;->newArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method public static of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method public static of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 2
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 158
    new-instance v0, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method private resolveInPlace([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    .registers 4
    .param p1, "types"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 256
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_13

    .line 257
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/google/common/reflect/TypeToken;->resolveType(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    aput-object v1, p1, v0

    .line 256
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 259
    :cond_13
    return-object p1
.end method

.method private resolveSupertype(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 263
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-virtual {p0, p1}, Lcom/google/common/reflect/TypeToken;->resolveType(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 265
    .local v0, "supertype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->typeResolver:Lcom/google/common/reflect/TypeResolver;

    iput-object v1, v0, Lcom/google/common/reflect/TypeToken;->typeResolver:Lcom/google/common/reflect/TypeResolver;

    .line 266
    return-object v0
.end method

.method private resolveTypeArgsForSubclass(Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 1015
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v2, v2, Ljava/lang/Class;

    if-eqz v2, :cond_7

    .line 1031
    .end local p1    # "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_6
    return-object p1

    .line 1026
    .restart local p1    # "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_7
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->toGenericType(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 1028
    .local v0, "genericSubtype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/common/reflect/TypeToken;->getSupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    iget-object v1, v2, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    .line 1031
    .local v1, "supertypeWithArgsFromSubtype":Ljava/lang/reflect/Type;
    new-instance v2, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v2}, Lcom/google/common/reflect/TypeResolver;-><init>()V

    iget-object v3, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v2, v1, v3}, Lcom/google/common/reflect/TypeResolver;->where(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeResolver;

    move-result-object v2

    iget-object v3, v0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v2, v3}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object p1

    goto :goto_6
.end method

.method private static subtypeBound(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 2
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 888
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_a

    .line 889
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->subtypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;

    move-result-object p0

    .line 891
    :cond_a
    return-object p0
.end method

.method private static subtypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;
    .registers 5
    .param p0, "type"    # Ljava/lang/reflect/WildcardType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 896
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 897
    .local v0, "lowerBounds":[Ljava/lang/reflect/Type;
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_10

    .line 898
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->subtypeBound(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 900
    :goto_f
    return-object v1

    .line 899
    :cond_10
    array-length v1, v0

    if-nez v1, :cond_15

    .line 900
    const/4 v1, 0x0

    goto :goto_f

    .line 902
    :cond_15
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wildcard should have at most one lower bound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method private static supertypeBound(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 2
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 869
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_a

    .line 870
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->supertypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;

    move-result-object p0

    .line 872
    :cond_a
    return-object p0
.end method

.method private static supertypeBound(Ljava/lang/reflect/WildcardType;)Ljava/lang/reflect/Type;
    .registers 5
    .param p0, "type"    # Ljava/lang/reflect/WildcardType;

    .prologue
    .line 876
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 877
    .local v0, "upperBounds":[Ljava/lang/reflect/Type;
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_10

    .line 878
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->supertypeBound(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 880
    :goto_f
    return-object v1

    .line 879
    :cond_10
    array-length v1, v0

    if-nez v1, :cond_16

    .line 880
    const-class v1, Ljava/lang/Object;

    goto :goto_f

    .line 882
    :cond_16
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "There should be at most one upper bound for wildcard type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method static toGenericType(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 6
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<+TT;>;"
        }
    .end annotation

    .prologue
    .line 944
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_19

    .line 945
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/reflect/TypeToken;->toGenericType(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v4

    iget-object v4, v4, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v4}, Lcom/google/common/reflect/Types;->newArrayType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 949
    .local v0, "arrayOfGenericType":Ljava/lang/reflect/Type;
    invoke-static {v0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    .line 959
    .end local v0    # "arrayOfGenericType":Ljava/lang/reflect/Type;
    :goto_18
    return-object v1

    .line 952
    :cond_19
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v3

    .line 953
    .local v3, "typeParams":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<Ljava/lang/Class<TT;>;>;"
    array-length v4, v3

    if-lez v4, :cond_2a

    .line 955
    invoke-static {p0, v3}, Lcom/google/common/reflect/Types;->newParameterizedType(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/ParameterizedType;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    .local v2, "type":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    move-object v1, v2

    .line 957
    goto :goto_18

    .line 959
    .end local v2    # "type":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    :cond_2a
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    goto :goto_18
.end method


# virtual methods
.method public final constructor(Ljava/lang/reflect/Constructor;)Lcom/google/common/reflect/Invokable;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor",
            "<*>;)",
            "Lcom/google/common/reflect/Invokable",
            "<TT;TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 516
    invoke-virtual {p1}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v3

    if-ne v0, v3, :cond_23

    move v0, v1

    :goto_d
    const-string v3, "%s not declared by %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v2

    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v4, v1

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 518
    new-instance v0, Lcom/google/common/reflect/TypeToken$2;

    invoke-direct {v0, p0, p1}, Lcom/google/common/reflect/TypeToken$2;-><init>(Lcom/google/common/reflect/TypeToken;Ljava/lang/reflect/Constructor;)V

    return-object v0

    :cond_23
    move v0, v2

    .line 516
    goto :goto_d
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 690
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    instance-of v1, p1, Lcom/google/common/reflect/TypeToken;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 691
    check-cast v0, Lcom/google/common/reflect/TypeToken;

    .line 692
    .local v0, "that":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    iget-object v2, v0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 694
    .end local v0    # "that":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public final getComponentType()Lcom/google/common/reflect/TypeToken;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<*>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 479
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/common/reflect/Types;->getComponentType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 480
    .local v0, "componentType":Ljava/lang/reflect/Type;
    if-nez v0, :cond_a

    .line 481
    const/4 v1, 0x0

    .line 483
    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    goto :goto_9
.end method

.method final getGenericInterfaces()Lcom/google/common/collect/ImmutableList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;>;"
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v6, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v6, v6, Ljava/lang/reflect/TypeVariable;

    if-eqz v6, :cond_13

    .line 325
    iget-object v6, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v6, Ljava/lang/reflect/TypeVariable;

    invoke-interface {v6}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/common/reflect/TypeToken;->boundsAsInterfaces([Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    .line 337
    :goto_12
    return-object v6

    .line 327
    :cond_13
    iget-object v6, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v6, v6, Ljava/lang/reflect/WildcardType;

    if-eqz v6, :cond_26

    .line 328
    iget-object v6, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v6, Ljava/lang/reflect/WildcardType;

    invoke-interface {v6}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/common/reflect/TypeToken;->boundsAsInterfaces([Ljava/lang/reflect/Type;)Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    goto :goto_12

    .line 330
    :cond_26
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v1

    .line 331
    .local v1, "builder":Lcom/google/common/collect/ImmutableList$Builder;, "Lcom/google/common/collect/ImmutableList$Builder<Lcom/google/common/reflect/TypeToken<-TT;>;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_34
    if-ge v2, v4, :cond_42

    aget-object v3, v0, v2

    .line 333
    .local v3, "interfaceType":Ljava/lang/reflect/Type;
    invoke-direct {p0, v3}, Lcom/google/common/reflect/TypeToken;->resolveSupertype(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v5

    .line 335
    .local v5, "resolvedInterface":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    invoke-virtual {v1, v5}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 331
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 337
    .end local v3    # "interfaceType":Ljava/lang/reflect/Type;
    .end local v5    # "resolvedInterface":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    :cond_42
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    goto :goto_12
.end method

.method final getGenericSuperclass()Lcom/google/common/reflect/TypeToken;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    const/4 v3, 0x0

    .line 284
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v2, v2, Ljava/lang/reflect/TypeVariable;

    if-eqz v2, :cond_16

    .line 286
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v2, Ljava/lang/reflect/TypeVariable;

    invoke-interface {v2}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v2

    aget-object v2, v2, v3

    invoke-direct {p0, v2}, Lcom/google/common/reflect/TypeToken;->boundAsSuperclass(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 298
    :goto_15
    return-object v0

    .line 288
    :cond_16
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v2, v2, Ljava/lang/reflect/WildcardType;

    if-eqz v2, :cond_2b

    .line 290
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v2, Ljava/lang/reflect/WildcardType;

    invoke-interface {v2}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v2

    aget-object v2, v2, v3

    invoke-direct {p0, v2}, Lcom/google/common/reflect/TypeToken;->boundAsSuperclass(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    goto :goto_15

    .line 292
    :cond_2b
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 293
    .local v1, "superclass":Ljava/lang/reflect/Type;
    if-nez v1, :cond_37

    .line 294
    const/4 v0, 0x0

    goto :goto_15

    .line 297
    :cond_37
    invoke-direct {p0, v1}, Lcom/google/common/reflect/TypeToken;->resolveSupertype(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 298
    .local v0, "superToken":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    goto :goto_15
.end method

.method public final getRawType()Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v2}, Lcom/google/common/reflect/TypeToken;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    .line 178
    .local v0, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v1, v0

    .line 179
    .local v1, "result":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    return-object v1
.end method

.method public final getSubtype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<+TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "subclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 396
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v1, v1, Ljava/lang/reflect/TypeVariable;

    if-nez v1, :cond_25

    move v1, v2

    :goto_9
    const-string v4, "Cannot get subtype of type variable <%s>"

    new-array v5, v2, [Ljava/lang/Object;

    aput-object p0, v5, v3

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 398
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v1, v1, Ljava/lang/reflect/WildcardType;

    if-eqz v1, :cond_27

    .line 399
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v1, Ljava/lang/reflect/WildcardType;

    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/google/common/reflect/TypeToken;->getSubtypeFromLowerBounds(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 410
    :goto_24
    return-object v0

    :cond_25
    move v1, v3

    .line 396
    goto :goto_9

    .line 401
    :cond_27
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    const-string v4, "%s isn\'t a subclass of %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p0, v5, v2

    invoke-static {v1, v4, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 404
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->isArray()Z

    move-result v1

    if-eqz v1, :cond_46

    .line 405
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeToken;->getArraySubtype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    goto :goto_24

    .line 408
    :cond_46
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeToken;->resolveTypeArgsForSubclass(Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 410
    .local v0, "subtype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<+TT;>;"
    goto :goto_24
.end method

.method public final getSupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<-TT;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 373
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "superclass":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    const-string v2, "%s is not a super class of %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p0, v3, v4

    invoke-static {v1, v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 375
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v1, v1, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_29

    .line 376
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v1, Ljava/lang/reflect/TypeVariable;

    invoke-interface {v1}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/google/common/reflect/TypeToken;->getSupertypeFromUpperBounds(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 387
    :goto_28
    return-object v0

    .line 378
    :cond_29
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v1, v1, Ljava/lang/reflect/WildcardType;

    if-eqz v1, :cond_3c

    .line 379
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v1, Ljava/lang/reflect/WildcardType;

    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/google/common/reflect/TypeToken;->getSupertypeFromUpperBounds(Ljava/lang/Class;[Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    goto :goto_28

    .line 381
    :cond_3c
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_47

    .line 382
    invoke-direct {p0, p1}, Lcom/google/common/reflect/TypeToken;->getArraySupertype(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    goto :goto_28

    .line 385
    :cond_47
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->toGenericType(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    iget-object v1, v1, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-direct {p0, v1}, Lcom/google/common/reflect/TypeToken;->resolveSupertype(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    .line 387
    .local v0, "supertype":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<-TT;>;"
    goto :goto_28
.end method

.method public final getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 195
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public final getTypes()Lcom/google/common/reflect/TypeToken$TypeSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>.TypeSet;"
        }
    .end annotation

    .prologue
    .line 364
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/google/common/reflect/TypeToken$TypeSet;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/TypeToken$TypeSet;-><init>(Lcom/google/common/reflect/TypeToken;)V

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 698
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final isArray()Z
    .registers 2

    .prologue
    .line 428
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->getComponentType()Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final isAssignableFrom(Lcom/google/common/reflect/TypeToken;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/reflect/TypeToken",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 415
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "type":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<*>;"
    iget-object v0, p1, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {p0, v0}, Lcom/google/common/reflect/TypeToken;->isAssignableFrom(Ljava/lang/reflect/Type;)Z

    move-result v0

    return v0
.end method

.method public final isAssignableFrom(Ljava/lang/reflect/Type;)Z
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 420
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Type;

    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v0, v1}, Lcom/google/common/reflect/TypeToken;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    return v0
.end method

.method public final isPrimitive()Z
    .registers 2

    .prologue
    .line 437
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    instance-of v0, v0, Ljava/lang/Class;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public final method(Ljava/lang/reflect/Method;)Lcom/google/common/reflect/Invokable;
    .registers 6
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            ")",
            "Lcom/google/common/reflect/Invokable",
            "<TT;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 492
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/common/reflect/TypeToken;->isAssignableFrom(Lcom/google/common/reflect/TypeToken;)Z

    move-result v0

    const-string v1, "%s not declared by %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 494
    new-instance v0, Lcom/google/common/reflect/TypeToken$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/reflect/TypeToken$1;-><init>(Lcom/google/common/reflect/TypeToken;Ljava/lang/reflect/Method;)V

    return-object v0
.end method

.method final rejectTypeVariables()Lcom/google/common/reflect/TypeToken;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 717
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/google/common/reflect/TypeToken$3;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/TypeToken$3;-><init>(Lcom/google/common/reflect/TypeToken;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/reflect/Type;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/google/common/reflect/TypeToken$3;->visit([Ljava/lang/reflect/Type;)V

    .line 734
    return-object p0
.end method

.method public final resolveType(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/google/common/reflect/TypeToken",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->typeResolver:Lcom/google/common/reflect/TypeResolver;

    .line 249
    .local v0, "resolver":Lcom/google/common/reflect/TypeResolver;
    if-nez v0, :cond_f

    .line 250
    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/common/reflect/TypeResolver;->accordingTo(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeResolver;

    move-result-object v0

    .end local v0    # "resolver":Lcom/google/common/reflect/TypeResolver;
    iput-object v0, p0, Lcom/google/common/reflect/TypeToken;->typeResolver:Lcom/google/common/reflect/TypeResolver;

    .line 252
    .restart local v0    # "resolver":Lcom/google/common/reflect/TypeResolver;
    :cond_f
    invoke-virtual {v0, p1}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 702
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v0}, Lcom/google/common/reflect/Types;->toString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final unwrap()Lcom/google/common/reflect/TypeToken;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 466
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-direct {p0}, Lcom/google/common/reflect/TypeToken;->isWrapper()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 468
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v0, Ljava/lang/Class;

    .line 469
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {v0}, Lcom/google/common/primitives/Primitives;->unwrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object p0

    .line 471
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .end local p0    # "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    :cond_12
    return-object p0
.end method

.method public final where(Lcom/google/common/reflect/TypeParameter;Lcom/google/common/reflect/TypeToken;)Lcom/google/common/reflect/TypeToken;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/reflect/TypeParameter",
            "<TX;>;",
            "Lcom/google/common/reflect/TypeToken",
            "<TX;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "typeParam":Lcom/google/common/reflect/TypeParameter;, "Lcom/google/common/reflect/TypeParameter<TX;>;"
    .local p2, "typeArg":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TX;>;"
    new-instance v1, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v1}, Lcom/google/common/reflect/TypeResolver;-><init>()V

    iget-object v2, p1, Lcom/google/common/reflect/TypeParameter;->typeVariable:Ljava/lang/reflect/TypeVariable;

    iget-object v3, p2, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-static {v2, v3}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/reflect/TypeResolver;->where(Ljava/util/Map;)Lcom/google/common/reflect/TypeResolver;

    move-result-object v0

    .line 217
    .local v0, "resolver":Lcom/google/common/reflect/TypeResolver;
    new-instance v1, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;

    iget-object v2, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v0, v2}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/common/reflect/TypeToken$SimpleTypeToken;-><init>(Ljava/lang/reflect/Type;)V

    return-object v1
.end method

.method public final where(Lcom/google/common/reflect/TypeParameter;Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/reflect/TypeParameter",
            "<TX;>;",
            "Ljava/lang/Class",
            "<TX;>;)",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 236
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    .local p1, "typeParam":Lcom/google/common/reflect/TypeParameter;, "Lcom/google/common/reflect/TypeParameter<TX;>;"
    .local p2, "typeArg":Ljava/lang/Class;, "Ljava/lang/Class<TX;>;"
    invoke-static {p2}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/reflect/TypeToken;->where(Lcom/google/common/reflect/TypeParameter;Lcom/google/common/reflect/TypeToken;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    return-object v0
.end method

.method public final wrap()Lcom/google/common/reflect/TypeToken;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 447
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/reflect/TypeToken;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 449
    iget-object v0, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    check-cast v0, Ljava/lang/Class;

    .line 450
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {v0}, Lcom/google/common/primitives/Primitives;->wrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object p0

    .line 452
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .end local p0    # "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    :cond_12
    return-object p0
.end method

.method protected writeReplace()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 709
    .local p0, "this":Lcom/google/common/reflect/TypeToken;, "Lcom/google/common/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/google/common/reflect/TypeResolver;

    invoke-direct {v0}, Lcom/google/common/reflect/TypeResolver;-><init>()V

    iget-object v1, p0, Lcom/google/common/reflect/TypeToken;->runtimeType:Ljava/lang/reflect/Type;

    invoke-virtual {v0, v1}, Lcom/google/common/reflect/TypeResolver;->resolveType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    return-object v0
.end method
