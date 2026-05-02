.class final Lorg/acra/collector/ReflectionCollector;
.super Ljava/lang/Object;
.source "ReflectionCollector.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectConstants(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, ""

    invoke-static {p0, v0}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "prefix"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 52
    .local v2, "fields":[Ljava/lang/reflect/Field;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_b
    if-ge v5, v6, :cond_67

    aget-object v1, v2, v5

    .line 53
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz p1, :cond_20

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_20

    .line 54
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2e

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    :cond_20
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x3d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    const/4 v7, 0x0

    :try_start_2e
    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 59
    .local v4, "value":Ljava/lang/Object;
    if-eqz v4, :cond_49

    .line 60
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_51

    .line 61
    check-cast v4, [Ljava/lang/Object;

    .end local v4    # "value":Ljava/lang/Object;
    check-cast v4, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_49
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2e .. :try_end_49} :catch_59
    .catch Ljava/lang/IllegalAccessException; {:try_start_2e .. :try_end_49} :catch_60

    .line 71
    :cond_49
    :goto_49
    const/16 v7, 0xa

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 63
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_51
    :try_start_51
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_58
    .catch Ljava/lang/IllegalArgumentException; {:try_start_51 .. :try_end_58} :catch_59
    .catch Ljava/lang/IllegalAccessException; {:try_start_51 .. :try_end_58} :catch_60

    goto :goto_49

    .line 66
    .end local v4    # "value":Ljava/lang/Object;
    :catch_59
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v7, "N/A"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_49

    .line 68
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_60
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v7, "N/A"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_49

    .line 74
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static collectStaticGettersResults(Ljava/lang/Class;)Ljava/lang/String;
    .registers 8
    .param p0    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 87
    .local v1, "methods":[Ljava/lang/reflect/Method;
    array-length v5, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_c
    if-ge v4, v5, :cond_5b

    aget-object v0, v1, v4

    .line 88
    .local v0, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    array-length v3, v3

    if-nez v3, :cond_57

    .line 89
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "get"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2f

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "is"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    :cond_2f
    const-string v3, "getClass"

    .line 90
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_57

    .line 92
    :try_start_3b
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    const/4 v6, 0x0

    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v0, v6, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_57
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3b .. :try_end_57} :catch_64
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3b .. :try_end_57} :catch_62
    .catch Ljava/lang/IllegalAccessException; {:try_start_3b .. :try_end_57} :catch_60

    .line 87
    :cond_57
    :goto_57
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_c

    .line 106
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :cond_5b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 100
    .restart local v0    # "method":Ljava/lang/reflect/Method;
    :catch_60
    move-exception v3

    goto :goto_57

    .line 98
    :catch_62
    move-exception v3

    goto :goto_57

    .line 96
    :catch_64
    move-exception v3

    goto :goto_57
.end method
