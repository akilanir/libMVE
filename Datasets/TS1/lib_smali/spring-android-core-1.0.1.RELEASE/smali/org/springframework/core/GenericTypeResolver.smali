.class public abstract Lorg/springframework/core/GenericTypeResolver;
.super Ljava/lang/Object;
.source "GenericTypeResolver.java"


# static fields
.field private static final typeVariableCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ref/Reference",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/springframework/core/GenericTypeResolver;->typeVariableCache:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "ownerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "classToIntrospect":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "genericIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz p1, :cond_2c

    .line 168
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 169
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 170
    .local v3, "ifcs":[Ljava/lang/reflect/Type;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_f
    if-ge v1, v4, :cond_27

    aget-object v2, v0, v1

    .line 171
    .local v2, "ifc":Ljava/lang/reflect/Type;
    invoke-static {p0, v2, p2}, Lorg/springframework/core/GenericTypeResolver;->doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v5

    .line 172
    .local v5, "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-eqz v5, :cond_1a

    .line 186
    .end local v0    # "arr$":[Ljava/lang/reflect/Type;
    .end local v1    # "i$":I
    .end local v2    # "ifc":Ljava/lang/reflect/Type;
    .end local v3    # "ifcs":[Ljava/lang/reflect/Type;
    .end local v4    # "len$":I
    .end local v5    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_19
    :goto_19
    return-object v5

    .line 170
    .restart local v0    # "arr$":[Ljava/lang/reflect/Type;
    .restart local v1    # "i$":I
    .restart local v2    # "ifc":Ljava/lang/reflect/Type;
    .restart local v3    # "ifcs":[Ljava/lang/reflect/Type;
    .restart local v4    # "len$":I
    .restart local v5    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 178
    .end local v0    # "arr$":[Ljava/lang/reflect/Type;
    .end local v1    # "i$":I
    .end local v2    # "ifc":Ljava/lang/reflect/Type;
    .end local v3    # "ifcs":[Ljava/lang/reflect/Type;
    .end local v4    # "len$":I
    .end local v5    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_1d
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-static {p0, v6, p2}, Lorg/springframework/core/GenericTypeResolver;->doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v5

    .line 180
    .restart local v5    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez v5, :cond_19

    .line 184
    .end local v5    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_27
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_0

    .line 186
    :cond_2c
    const/4 v5, 0x0

    goto :goto_19
.end method

.method private static doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 10
    .param p1, "ifc"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "ownerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "genericIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v6, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v6, :cond_37

    move-object v2, p1

    .line 191
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    .line 192
    .local v2, "paramIfc":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 193
    .local v3, "rawType":Ljava/lang/reflect/Type;
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    .line 194
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 195
    .local v5, "typeArgs":[Ljava/lang/reflect/Type;
    array-length v6, v5

    new-array v4, v6, [Ljava/lang/Class;

    .line 196
    .local v4, "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v6, v5

    if-ge v1, v6, :cond_36

    .line 197
    aget-object v0, v5, v1

    .line 198
    .local v0, "arg":Ljava/lang/reflect/Type;
    invoke-static {p0, v0}, Lorg/springframework/core/GenericTypeResolver;->extractClass(Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v4, v1

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .end local v0    # "arg":Ljava/lang/reflect/Type;
    .end local v1    # "i":I
    .end local v4    # "result":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v5    # "typeArgs":[Ljava/lang/reflect/Type;
    :cond_27
    move-object v6, v3

    .line 202
    check-cast v6, Ljava/lang/Class;

    invoke-virtual {p2, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 203
    check-cast v3, Ljava/lang/Class;

    .end local v3    # "rawType":Ljava/lang/reflect/Type;
    invoke-static {p0, v3, p2}, Lorg/springframework/core/GenericTypeResolver;->doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v4

    .line 209
    .end local v2    # "paramIfc":Ljava/lang/reflect/ParameterizedType;
    .end local p1    # "ifc":Ljava/lang/reflect/Type;
    :cond_36
    :goto_36
    return-object v4

    .line 206
    .restart local p1    # "ifc":Ljava/lang/reflect/Type;
    :cond_37
    if-eqz p1, :cond_49

    move-object v6, p1

    check-cast v6, Ljava/lang/Class;

    invoke-virtual {p2, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 207
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "ifc":Ljava/lang/reflect/Type;
    invoke-static {p0, p1, p2}, Lorg/springframework/core/GenericTypeResolver;->doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v4

    goto :goto_36

    .line 209
    .restart local p1    # "ifc":Ljava/lang/reflect/Type;
    :cond_49
    const/4 v4, 0x0

    goto :goto_36
.end method

.method static extractBoundForTypeVariable(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 322
    .local p0, "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 323
    .local v1, "bounds":[Ljava/lang/reflect/Type;
    array-length v2, v1

    if-nez v2, :cond_a

    .line 324
    const-class v0, Ljava/lang/Object;

    .line 330
    :cond_9
    :goto_9
    return-object v0

    .line 326
    :cond_a
    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 327
    .local v0, "bound":Ljava/lang/reflect/Type;
    instance-of v2, v0, Ljava/lang/reflect/TypeVariable;

    if-eqz v2, :cond_9

    .line 328
    check-cast v0, Ljava/lang/reflect/TypeVariable;

    .end local v0    # "bound":Ljava/lang/reflect/Type;
    invoke-static {v0}, Lorg/springframework/core/GenericTypeResolver;->extractBoundForTypeVariable(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v0

    .restart local v0    # "bound":Ljava/lang/reflect/Type;
    goto :goto_9
.end method

.method private static extractClass(Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 7
    .param p1, "arg"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "ownerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v4, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v4, :cond_10

    move-object v4, p1

    .line 217
    check-cast v4, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v4}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-static {p0, v4}, Lorg/springframework/core/GenericTypeResolver;->extractClass(Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v4

    .line 235
    :goto_f
    return-object v4

    .line 219
    :cond_10
    instance-of v4, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v4, :cond_29

    move-object v1, p1

    .line 220
    check-cast v1, Ljava/lang/reflect/GenericArrayType;

    .line 221
    .local v1, "gat":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 222
    .local v2, "gt":Ljava/lang/reflect/Type;
    invoke-static {p0, v2}, Lorg/springframework/core/GenericTypeResolver;->extractClass(Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    .line 223
    .local v0, "componentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    invoke-static {v0, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    goto :goto_f

    .line 225
    .end local v0    # "componentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "gat":Ljava/lang/reflect/GenericArrayType;
    .end local v2    # "gt":Ljava/lang/reflect/Type;
    :cond_29
    instance-of v4, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v4, :cond_40

    move-object v3, p1

    .line 226
    check-cast v3, Ljava/lang/reflect/TypeVariable;

    .line 227
    .local v3, "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-static {p0}, Lorg/springframework/core/GenericTypeResolver;->getTypeVariableMap(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "arg":Ljava/lang/reflect/Type;
    check-cast p1, Ljava/lang/reflect/Type;

    .line 228
    .restart local p1    # "arg":Ljava/lang/reflect/Type;
    if-nez p1, :cond_48

    .line 229
    invoke-static {v3}, Lorg/springframework/core/GenericTypeResolver;->extractBoundForTypeVariable(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object p1

    .line 235
    .end local v3    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_40
    :goto_40
    instance-of v4, p1, Ljava/lang/Class;

    if-eqz v4, :cond_4d

    move-object v4, p1

    check-cast v4, Ljava/lang/Class;

    goto :goto_f

    .line 232
    .restart local v3    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_48
    invoke-static {p0, p1}, Lorg/springframework/core/GenericTypeResolver;->extractClass(Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p1

    goto :goto_40

    .line 235
    .end local v3    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_4d
    const-class v4, Ljava/lang/Object;

    goto :goto_f
.end method

.method private static extractTypeVariablesFromGenericInterfaces([Ljava/lang/reflect/Type;Ljava/util/Map;)V
    .registers 8
    .param p0, "genericInterfaces"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p1, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_37

    aget-object v1, v0, v2

    .line 335
    .local v1, "genericInterface":Ljava/lang/reflect/Type;
    instance-of v5, v1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_29

    move-object v4, v1

    .line 336
    check-cast v4, Ljava/lang/reflect/ParameterizedType;

    .line 337
    .local v4, "pt":Ljava/lang/reflect/ParameterizedType;
    invoke-static {v4, p1}, Lorg/springframework/core/GenericTypeResolver;->populateTypeMapFromParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V

    .line 338
    invoke-interface {v4}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/Class;

    if-eqz v5, :cond_26

    .line 339
    invoke-interface {v4}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v5, p1}, Lorg/springframework/core/GenericTypeResolver;->extractTypeVariablesFromGenericInterfaces([Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 334
    .end local v1    # "genericInterface":Ljava/lang/reflect/Type;
    .end local v4    # "pt":Ljava/lang/reflect/ParameterizedType;
    :cond_26
    :goto_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 343
    .restart local v1    # "genericInterface":Ljava/lang/reflect/Type;
    :cond_29
    instance-of v5, v1, Ljava/lang/Class;

    if-eqz v5, :cond_26

    .line 344
    check-cast v1, Ljava/lang/Class;

    .end local v1    # "genericInterface":Ljava/lang/reflect/Type;
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v5, p1}, Lorg/springframework/core/GenericTypeResolver;->extractTypeVariablesFromGenericInterfaces([Ljava/lang/reflect/Type;Ljava/util/Map;)V

    goto :goto_26

    .line 348
    :cond_37
    return-void
.end method

.method static getRawType(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;
    .registers 5
    .param p0, "genericType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    move-object v0, p0

    .line 258
    .local v0, "resolvedType":Ljava/lang/reflect/Type;
    instance-of v2, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v2, :cond_14

    move-object v1, p0

    .line 259
    check-cast v1, Ljava/lang/reflect/TypeVariable;

    .line 260
    .local v1, "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "resolvedType":Ljava/lang/reflect/Type;
    check-cast v0, Ljava/lang/reflect/Type;

    .line 261
    .restart local v0    # "resolvedType":Ljava/lang/reflect/Type;
    if-nez v0, :cond_14

    .line 262
    invoke-static {v1}, Lorg/springframework/core/GenericTypeResolver;->extractBoundForTypeVariable(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 265
    .end local v1    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_14
    instance-of v2, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_1e

    .line 266
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .end local v0    # "resolvedType":Ljava/lang/reflect/Type;
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 269
    :cond_1e
    return-object v0
.end method

.method public static getTargetType(Lorg/springframework/core/MethodParameter;)Ljava/lang/reflect/Type;
    .registers 3
    .param p0, "methodParam"    # Lorg/springframework/core/MethodParameter;

    .prologue
    .line 60
    const-string v0, "MethodParameter must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 62
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getParameterIndex()I

    move-result v1

    aget-object v0, v0, v1

    .line 69
    :goto_19
    return-object v0

    .line 65
    :cond_1a
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getParameterIndex()I

    move-result v0

    if-ltz v0, :cond_2f

    .line 66
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getParameterIndex()I

    move-result v1

    aget-object v0, v0, v1

    goto :goto_19

    .line 69
    :cond_2f
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v0

    goto :goto_19
.end method

.method public static getTypeVariableMap(Ljava/lang/Class;)Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 279
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v5, Lorg/springframework/core/GenericTypeResolver;->typeVariableCache:Ljava/util/Map;

    invoke-interface {v5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    .line 280
    .local v2, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;>;"
    if-eqz v2, :cond_4b

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    move-object v4, v5

    .line 282
    .local v4, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :goto_11
    if-nez v4, :cond_71

    .line 283
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 286
    .restart local v4    # "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/springframework/core/GenericTypeResolver;->extractTypeVariablesFromGenericInterfaces([Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 289
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 290
    .local v0, "genericType":Ljava/lang/reflect/Type;
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    .line 291
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_27
    if-eqz v3, :cond_4d

    const-class v5, Ljava/lang/Object;

    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4d

    .line 292
    instance-of v5, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_3b

    move-object v1, v0

    .line 293
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 294
    .local v1, "pt":Ljava/lang/reflect/ParameterizedType;
    invoke-static {v1, v4}, Lorg/springframework/core/GenericTypeResolver;->populateTypeMapFromParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V

    .line 296
    .end local v1    # "pt":Ljava/lang/reflect/ParameterizedType;
    :cond_3b
    invoke-virtual {v3}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/springframework/core/GenericTypeResolver;->extractTypeVariablesFromGenericInterfaces([Ljava/lang/reflect/Type;Ljava/util/Map;)V

    .line 297
    invoke-virtual {v3}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 298
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_27

    .line 280
    .end local v0    # "genericType":Ljava/lang/reflect/Type;
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_4b
    const/4 v4, 0x0

    goto :goto_11

    .line 302
    .restart local v0    # "genericType":Ljava/lang/reflect/Type;
    .restart local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_4d
    move-object v3, p0

    .line 303
    :goto_4e
    invoke-virtual {v3}, Ljava/lang/Class;->isMemberClass()Z

    move-result v5

    if-eqz v5, :cond_67

    .line 304
    invoke-virtual {v3}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 305
    instance-of v5, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_62

    move-object v1, v0

    .line 306
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 307
    .restart local v1    # "pt":Ljava/lang/reflect/ParameterizedType;
    invoke-static {v1, v4}, Lorg/springframework/core/GenericTypeResolver;->populateTypeMapFromParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V

    .line 309
    .end local v1    # "pt":Ljava/lang/reflect/ParameterizedType;
    :cond_62
    invoke-virtual {v3}, Ljava/lang/Class;->getEnclosingClass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_4e

    .line 312
    :cond_67
    sget-object v5, Lorg/springframework/core/GenericTypeResolver;->typeVariableCache:Ljava/util/Map;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v5, p0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .end local v0    # "genericType":Ljava/lang/reflect/Type;
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_71
    return-object v4
.end method

.method private static populateTypeMapFromParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V
    .registers 10
    .param p0, "type"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 367
    .local p1, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    instance-of v7, v7, Ljava/lang/Class;

    if-eqz v7, :cond_4f

    .line 368
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 369
    .local v1, "actualTypeArguments":[Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v5

    .line 370
    .local v5, "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_17
    array-length v7, v1

    if-ge v2, v7, :cond_4f

    .line 371
    aget-object v0, v1, v2

    .line 372
    .local v0, "actualTypeArgument":Ljava/lang/reflect/Type;
    aget-object v6, v5, v2

    .line 373
    .local v6, "variable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    instance-of v7, v0, Ljava/lang/Class;

    if-eqz v7, :cond_28

    .line 374
    invoke-interface {p1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    :cond_25
    :goto_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 376
    :cond_28
    instance-of v7, v0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v7, :cond_30

    .line 377
    invoke-interface {p1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25

    .line 379
    :cond_30
    instance-of v7, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_38

    .line 380
    invoke-interface {p1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25

    .line 382
    :cond_38
    instance-of v7, v0, Ljava/lang/reflect/TypeVariable;

    if-eqz v7, :cond_25

    move-object v4, v0

    .line 385
    check-cast v4, Ljava/lang/reflect/TypeVariable;

    .line 386
    .local v4, "typeVariableArgument":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Type;

    .line 387
    .local v3, "resolvedType":Ljava/lang/reflect/Type;
    if-nez v3, :cond_4b

    .line 388
    invoke-static {v4}, Lorg/springframework/core/GenericTypeResolver;->extractBoundForTypeVariable(Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v3

    .line 390
    :cond_4b
    invoke-interface {p1, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25

    .line 394
    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    .end local v1    # "actualTypeArguments":[Ljava/lang/reflect/Type;
    .end local v2    # "i":I
    .end local v3    # "resolvedType":Ljava/lang/reflect/Type;
    .end local v4    # "typeVariableArgument":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v5    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    .end local v6    # "variable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_4f
    return-void
.end method

.method public static resolveParameterType(Lorg/springframework/core/MethodParameter;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 7
    .param p0, "methodParam"    # Lorg/springframework/core/MethodParameter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/springframework/core/MethodParameter;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/springframework/core/GenericTypeResolver;->getTargetType(Lorg/springframework/core/MethodParameter;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 82
    .local v0, "genericType":Ljava/lang/reflect/Type;
    const-string v4, "Class must not be null"

    invoke-static {p1, v4}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-static {p1}, Lorg/springframework/core/GenericTypeResolver;->getTypeVariableMap(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v3

    .line 84
    .local v3, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {v0, v3}, Lorg/springframework/core/GenericTypeResolver;->getRawType(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 85
    .local v1, "rawType":Ljava/lang/reflect/Type;
    instance-of v4, v1, Ljava/lang/Class;

    if-eqz v4, :cond_1e

    check-cast v1, Ljava/lang/Class;

    .end local v1    # "rawType":Ljava/lang/reflect/Type;
    move-object v2, v1

    .line 86
    .local v2, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_18
    invoke-virtual {p0, v2}, Lorg/springframework/core/MethodParameter;->setParameterType(Ljava/lang/Class;)V

    .line 87
    iput-object v3, p0, Lorg/springframework/core/MethodParameter;->typeVariableMap:Ljava/util/Map;

    .line 88
    return-object v2

    .line 85
    .end local v2    # "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "rawType":Ljava/lang/reflect/Type;
    :cond_1e
    invoke-virtual {p0}, Lorg/springframework/core/MethodParameter;->getParameterType()Ljava/lang/Class;

    move-result-object v2

    goto :goto_18
.end method

.method public static resolveReturnType(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "Method must not be null"

    invoke-static {p0, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 100
    .local v0, "genericType":Ljava/lang/reflect/Type;
    const-string v3, "Class must not be null"

    invoke-static {p1, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    invoke-static {p1}, Lorg/springframework/core/GenericTypeResolver;->getTypeVariableMap(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v2

    .line 102
    .local v2, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {v0, v2}, Lorg/springframework/core/GenericTypeResolver;->getRawType(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 103
    .local v1, "rawType":Ljava/lang/reflect/Type;
    instance-of v3, v1, Ljava/lang/Class;

    if-eqz v3, :cond_1d

    check-cast v1, Ljava/lang/Class;

    .end local v1    # "rawType":Ljava/lang/reflect/Type;
    :goto_1c
    return-object v1

    .restart local v1    # "rawType":Ljava/lang/reflect/Type;
    :cond_1d
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    goto :goto_1c
.end method

.method public static resolveReturnTypeArgument(Ljava/lang/reflect/Method;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 8
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "genericIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v5, "method must not be null"

    invoke-static {p0, v5}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    .line 117
    .local v2, "returnType":Ljava/lang/reflect/Type;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 118
    .local v1, "genericReturnType":Ljava/lang/reflect/Type;
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 119
    instance-of v5, v1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_28

    move-object v3, v1

    .line 120
    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    .line 121
    .local v3, "targetType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 122
    .local v0, "actualTypeArguments":[Ljava/lang/reflect/Type;
    const/4 v5, 0x0

    aget-object v4, v0, v5

    .line 123
    .local v4, "typeArg":Ljava/lang/reflect/Type;
    instance-of v5, v4, Ljava/lang/reflect/WildcardType;

    if-nez v5, :cond_2a

    .line 124
    check-cast v4, Ljava/lang/Class;

    .line 130
    .end local v0    # "actualTypeArguments":[Ljava/lang/reflect/Type;
    .end local v2    # "returnType":Ljava/lang/reflect/Type;
    .end local v3    # "targetType":Ljava/lang/reflect/ParameterizedType;
    .end local v4    # "typeArg":Ljava/lang/reflect/Type;
    :goto_27
    return-object v4

    .line 127
    .restart local v2    # "returnType":Ljava/lang/reflect/Type;
    :cond_28
    const/4 v4, 0x0

    goto :goto_27

    .line 130
    :cond_2a
    check-cast v2, Ljava/lang/Class;

    .end local v2    # "returnType":Ljava/lang/reflect/Type;
    invoke-static {v2, p1}, Lorg/springframework/core/GenericTypeResolver;->resolveTypeArgument(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    goto :goto_27
.end method

.method public static resolveType(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/Class;
    .registers 4
    .param p0, "genericType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 246
    .local p1, "typeVariableMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {p0, p1}, Lorg/springframework/core/GenericTypeResolver;->getRawType(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 247
    .local v0, "rawType":Ljava/lang/reflect/Type;
    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_b

    check-cast v0, Ljava/lang/Class;

    .end local v0    # "rawType":Ljava/lang/reflect/Type;
    :goto_a
    return-object v0

    .restart local v0    # "rawType":Ljava/lang/reflect/Type;
    :cond_b
    const-class v0, Ljava/lang/Object;

    goto :goto_a
.end method

.method public static resolveTypeArgument(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "genericIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/springframework/core/GenericTypeResolver;->resolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v0

    .line 143
    .local v0, "typeArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez v0, :cond_8

    .line 144
    const/4 v1, 0x0

    .line 150
    :goto_7
    return-object v1

    .line 146
    :cond_8
    array-length v1, v0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_34

    .line 147
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected 1 type argument on generic interface ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] but found "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 150
    :cond_34
    const/4 v1, 0x0

    aget-object v1, v0, v1

    goto :goto_7
.end method

.method public static resolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "genericIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p0, p1}, Lorg/springframework/core/GenericTypeResolver;->doResolveTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
