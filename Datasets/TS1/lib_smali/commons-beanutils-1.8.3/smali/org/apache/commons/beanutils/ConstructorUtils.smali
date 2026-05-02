.class public Lorg/apache/commons/beanutils/ConstructorUtils;
.super Ljava/lang/Object;
.source "ConstructorUtils.java"


# static fields
.field private static final EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

.field private static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 53
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 55
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAccessibleConstructor(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 4
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "parameterType"    # Ljava/lang/Class;

    .prologue
    .line 293
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Class;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 294
    .local v0, "parameterTypes":[Ljava/lang/Class;
    invoke-static {p0, v0}, Lorg/apache/commons/beanutils/ConstructorUtils;->getAccessibleConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    return-object v1
.end method

.method public static getAccessibleConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 4
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    .line 311
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConstructorUtils;->getAccessibleConstructor(Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;
    :try_end_7
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 314
    :goto_8
    return-object v1

    .line 313
    :catch_9
    move-exception v0

    .line 314
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public static getAccessibleConstructor(Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;
    .registers 4
    .param p0, "ctor"    # Ljava/lang/reflect/Constructor;

    .prologue
    const/4 v1, 0x0

    .line 328
    if-nez p0, :cond_5

    move-object p0, v1

    .line 344
    .end local p0    # "ctor":Ljava/lang/reflect/Constructor;
    .local v0, "clazz":Ljava/lang/Class;
    :cond_4
    :goto_4
    return-object p0

    .line 333
    .end local v0    # "clazz":Ljava/lang/Class;
    .restart local p0    # "ctor":Ljava/lang/reflect/Constructor;
    :cond_5
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_11

    move-object p0, v1

    .line 334
    goto :goto_4

    .line 338
    :cond_11
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 339
    .restart local v0    # "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_4

    move-object p0, v1

    .line 344
    goto :goto_4
.end method

.method private static getMatchingAccessibleConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 13
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "parameterTypes"    # [Ljava/lang/Class;

    .prologue
    .line 370
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v0

    .line 388
    .local v0, "ctor":Ljava/lang/reflect/Constructor;
    const/4 v9, 0x1

    :try_start_5
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V
    :try_end_8
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_8} :catch_44
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_8} :catch_9

    .line 433
    .end local v0    # "ctor":Ljava/lang/reflect/Constructor;
    :goto_8
    return-object v0

    .line 394
    :catch_9
    move-exception v9

    .line 398
    array-length v7, p1

    .line 399
    .local v7, "paramSize":I
    invoke-virtual {p0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 400
    .local v3, "ctors":[Ljava/lang/reflect/Constructor;
    const/4 v4, 0x0

    .local v4, "i":I
    array-length v8, v3

    .local v8, "size":I
    :goto_11
    if-ge v4, v8, :cond_42

    .line 402
    aget-object v9, v3, v4

    invoke-virtual {v9}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 403
    .local v2, "ctorParams":[Ljava/lang/Class;
    array-length v1, v2

    .line 404
    .local v1, "ctorParamSize":I
    if-ne v1, v7, :cond_3f

    .line 405
    const/4 v5, 0x1

    .line 406
    .local v5, "match":Z
    const/4 v6, 0x0

    .local v6, "n":I
    :goto_1e
    if-ge v6, v1, :cond_2b

    .line 407
    aget-object v9, v2, v6

    aget-object v10, p1, v6

    invoke-static {v9, v10}, Lorg/apache/commons/beanutils/MethodUtils;->isAssignmentCompatible(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_3c

    .line 411
    const/4 v5, 0x0

    .line 416
    :cond_2b
    if-eqz v5, :cond_3f

    .line 418
    aget-object v9, v3, v4

    invoke-static {v9}, Lorg/apache/commons/beanutils/ConstructorUtils;->getAccessibleConstructor(Ljava/lang/reflect/Constructor;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 419
    .restart local v0    # "ctor":Ljava/lang/reflect/Constructor;
    if-eqz v0, :cond_3f

    .line 421
    const/4 v9, 0x1

    :try_start_36
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V
    :try_end_39
    .catch Ljava/lang/SecurityException; {:try_start_36 .. :try_end_39} :catch_3a

    goto :goto_8

    .line 422
    :catch_3a
    move-exception v9

    goto :goto_8

    .line 406
    .end local v0    # "ctor":Ljava/lang/reflect/Constructor;
    :cond_3c
    add-int/lit8 v6, v6, 0x1

    goto :goto_1e

    .line 400
    .end local v5    # "match":Z
    .end local v6    # "n":I
    :cond_3f
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 433
    .end local v1    # "ctorParamSize":I
    .end local v2    # "ctorParams":[Ljava/lang/Class;
    :cond_42
    const/4 v0, 0x0

    goto :goto_8

    .line 389
    .end local v3    # "ctors":[Ljava/lang/reflect/Constructor;
    .end local v4    # "i":I
    .end local v7    # "paramSize":I
    .end local v8    # "size":I
    .restart local v0    # "ctor":Ljava/lang/reflect/Constructor;
    :catch_44
    move-exception v9

    goto :goto_8
.end method

.method public static invokeConstructor(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 85
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/apache/commons/beanutils/ConstructorUtils;->invokeConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 114
    if-nez p1, :cond_4

    .line 115
    sget-object p1, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 117
    :cond_4
    array-length v0, p1

    .line 118
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 119
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 120
    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 122
    :cond_15
    invoke-static {p0, p1, v2}, Lorg/apache/commons/beanutils/ConstructorUtils;->invokeConstructor(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeConstructor(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 153
    if-nez p2, :cond_4

    .line 154
    sget-object p2, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 156
    :cond_4
    if-nez p1, :cond_8

    .line 157
    sget-object p1, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 160
    :cond_8
    invoke-static {p0, p2}, Lorg/apache/commons/beanutils/ConstructorUtils;->getMatchingAccessibleConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 162
    .local v0, "ctor":Ljava/lang/reflect/Constructor;
    if-nez v0, :cond_2b

    .line 163
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible constructor on object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 166
    :cond_2b
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeExactConstructor(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "arg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 195
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 196
    .local v0, "args":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lorg/apache/commons/beanutils/ConstructorUtils;->invokeExactConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static invokeExactConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 224
    if-nez p1, :cond_4

    .line 225
    sget-object p1, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 227
    :cond_4
    array-length v0, p1

    .line 228
    .local v0, "arguments":I
    new-array v2, v0, [Ljava/lang/Class;

    .line 229
    .local v2, "parameterTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_15

    .line 230
    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    aput-object v3, v2, v1

    .line 229
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 232
    :cond_15
    invoke-static {p0, p1, v2}, Lorg/apache/commons/beanutils/ConstructorUtils;->invokeExactConstructor(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static invokeExactConstructor(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p0, "klass"    # Ljava/lang/Class;
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 264
    if-nez p1, :cond_4

    .line 265
    sget-object p1, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 268
    :cond_4
    if-nez p2, :cond_8

    .line 269
    sget-object p2, Lorg/apache/commons/beanutils/ConstructorUtils;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 272
    :cond_8
    invoke-static {p0, p2}, Lorg/apache/commons/beanutils/ConstructorUtils;->getAccessibleConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 273
    .local v0, "ctor":Ljava/lang/reflect/Constructor;
    if-nez v0, :cond_2b

    .line 274
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such accessible constructor on object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :cond_2b
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
