.class final Lorg/acra/collector/ReflectionCollector;
.super Ljava/lang/Object;
.source "ReflectionCollector.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectConstants(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, ""

    invoke-static {p0, v0}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "prefix"    # Ljava/lang/String;
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
    .line 44
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .local v6, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 47
    .local v3, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_c
    if-ge v4, v5, :cond_68

    aget-object v2, v0, v4

    .line 48
    .local v2, "field":Ljava/lang/reflect/Field;
    if-eqz p1, :cond_21

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_21

    .line 49
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x2e

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    :cond_21
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const/4 v8, 0x0

    :try_start_2f
    invoke-virtual {v2, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 54
    .local v7, "value":Ljava/lang/Object;
    if-eqz v7, :cond_4a

    .line 55
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_52

    .line 56
    check-cast v7, [Ljava/lang/Object;

    .end local v7    # "value":Ljava/lang/Object;
    check-cast v7, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2f .. :try_end_4a} :catch_5a
    .catch Ljava/lang/IllegalAccessException; {:try_start_2f .. :try_end_4a} :catch_61

    .line 66
    :cond_4a
    :goto_4a
    const-string v8, "\n"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 58
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_52
    :try_start_52
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_59
    .catch Ljava/lang/IllegalArgumentException; {:try_start_52 .. :try_end_59} :catch_5a
    .catch Ljava/lang/IllegalAccessException; {:try_start_52 .. :try_end_59} :catch_61

    goto :goto_4a

    .line 61
    .end local v7    # "value":Ljava/lang/Object;
    :catch_5a
    move-exception v1

    .line 62
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string v8, "N/A"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4a

    .line 63
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_61
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v8, "N/A"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4a

    .line 69
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_68
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public static collectStaticGettersResults(Ljava/lang/Class;)Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "someClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v5, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 81
    .local v4, "methods":[Ljava/lang/reflect/Method;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_c
    if-ge v1, v2, :cond_5a

    aget-object v3, v0, v1

    .line 82
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    array-length v6, v6

    if-nez v6, :cond_57

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "get"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2f

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "is"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_57

    :cond_2f
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "getClass"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_57

    .line 86
    :try_start_3b
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    const/4 v7, 0x0

    const/4 v6, 0x0

    check-cast v6, [Ljava/lang/Object;

    invoke-virtual {v3, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_57
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3b .. :try_end_57} :catch_63
    .catch Ljava/lang/IllegalAccessException; {:try_start_3b .. :try_end_57} :catch_61
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3b .. :try_end_57} :catch_5f

    .line 81
    :cond_57
    :goto_57
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 100
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_5a
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 94
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    :catch_5f
    move-exception v6

    goto :goto_57

    .line 92
    :catch_61
    move-exception v6

    goto :goto_57

    .line 90
    :catch_63
    move-exception v6

    goto :goto_57
.end method
