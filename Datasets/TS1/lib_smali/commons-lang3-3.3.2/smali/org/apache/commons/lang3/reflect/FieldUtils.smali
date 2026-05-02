.class public Lorg/apache/commons/lang3/reflect/FieldUtils;
.super Ljava/lang/Object;
.source "FieldUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static getAllFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getAllFieldsList(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 198
    .local v0, "allFieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/reflect/Field;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Field;

    return-object v1
.end method

.method public static getAllFieldsList(Ljava/lang/Class;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    .line 212
    if-eqz p0, :cond_24

    const/4 v7, 0x1

    :goto_4
    const-string v9, "The class must not be null"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v7, v9, v8}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 213
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 214
    .local v0, "allFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    move-object v2, p0

    .line 215
    .local v2, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_11
    if-eqz v2, :cond_2b

    .line 216
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 217
    .local v3, "declaredFields":[Ljava/lang/reflect/Field;
    move-object v1, v3

    .local v1, "arr$":[Ljava/lang/reflect/Field;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1a
    if-ge v5, v6, :cond_26

    aget-object v4, v1, v5

    .line 218
    .local v4, "field":Ljava/lang/reflect/Field;
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    .end local v0    # "allFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v1    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "declaredFields":[Ljava/lang/reflect/Field;
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_24
    move v7, v8

    .line 212
    goto :goto_4

    .line 220
    .restart local v0    # "allFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v1    # "arr$":[Ljava/lang/reflect/Field;
    .restart local v2    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "declaredFields":[Ljava/lang/reflect/Field;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    :cond_26
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 221
    goto :goto_11

    .line 222
    .end local v1    # "arr$":[Ljava/lang/reflect/Field;
    .end local v3    # "declaredFields":[Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_2b
    return-object v0
.end method

.method public static getDeclaredField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    return-object v0
.end method

.method public static getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;
    .registers 9
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 167
    if-eqz p0, :cond_28

    :goto_5
    const-string v4, "The class must not be null"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v1, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 168
    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isNotBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v4, "The field name must not be blank/empty"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v4, v2}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 171
    :try_start_17
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 172
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-static {v0}, Lorg/apache/commons/lang3/reflect/MemberUtils;->isAccessible(Ljava/lang/reflect/Member;)Z

    move-result v1

    if-nez v1, :cond_27

    .line 173
    if-eqz p2, :cond_2a

    .line 174
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_27
    .catch Ljava/lang/NoSuchFieldException; {:try_start_17 .. :try_end_27} :catch_2c

    .line 183
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_27
    :goto_27
    return-object v0

    :cond_28
    move v1, v2

    .line 167
    goto :goto_5

    .restart local v0    # "field":Ljava/lang/reflect/Field;
    :cond_2a
    move-object v0, v3

    .line 176
    goto :goto_27

    .line 180
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :catch_2c
    move-exception v1

    move-object v0, v3

    .line 183
    goto :goto_27
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 63
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-static {v0}, Lorg/apache/commons/lang3/reflect/MemberUtils;->setAccessibleWorkaround(Ljava/lang/reflect/AccessibleObject;)Z

    .line 64
    return-object v0
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;
    .registers 15
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 85
    if-eqz p0, :cond_2f

    move v6, v7

    :goto_5
    const-string v9, "The class must not be null"

    new-array v10, v8, [Ljava/lang/Object;

    invoke-static {v6, v9, v10}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 86
    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isNotBlank(Ljava/lang/CharSequence;)Z

    move-result v6

    const-string v9, "The field name must not be blank/empty"

    new-array v10, v8, [Ljava/lang/Object;

    invoke-static {v6, v9, v10}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 101
    move-object v0, p0

    .local v0, "acls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_18
    if-eqz v0, :cond_37

    .line 103
    :try_start_1a
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 106
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-nez v6, :cond_2e

    .line 107
    if-eqz p2, :cond_32

    .line 108
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1a .. :try_end_2e} :catch_31

    .line 132
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_2e
    :goto_2e
    return-object v2

    .end local v0    # "acls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2f
    move v6, v8

    .line 85
    goto :goto_5

    .line 114
    .restart local v0    # "acls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_31
    move-exception v6

    .line 101
    :cond_32
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_18

    .line 121
    :cond_37
    const/4 v4, 0x0

    .line 122
    .local v4, "match":Ljava/lang/reflect/Field;
    invoke-static {p0}, Lorg/apache/commons/lang3/ClassUtils;->getAllInterfaces(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_40
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_65

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 124
    .local v1, "class1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_4c
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 125
    .local v5, "test":Ljava/lang/reflect/Field;
    if-nez v4, :cond_63

    move v6, v7

    :goto_53
    const-string v9, "Reference to field %s is ambiguous relative to %s; a matching field exists on two or more implemented interfaces."

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p1, v10, v11

    const/4 v11, 0x1

    aput-object p0, v10, v11

    invoke-static {v6, v9, v10}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V
    :try_end_61
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4c .. :try_end_61} :catch_67

    .line 127
    move-object v4, v5

    goto :goto_40

    :cond_63
    move v6, v8

    .line 125
    goto :goto_53

    .end local v1    # "class1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "test":Ljava/lang/reflect/Field;
    :cond_65
    move-object v2, v4

    .line 132
    goto :goto_2e

    .line 128
    .restart local v1    # "class1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_67
    move-exception v6

    goto :goto_40
.end method

.method public static readDeclaredField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 447
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readDeclaredField(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readDeclaredField(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 10
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 468
    if-eqz p0, :cond_28

    move v2, v3

    :goto_5
    const-string v5, "target object must not be null"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 469
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 470
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 471
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz v1, :cond_2a

    move v2, v3

    :goto_17
    const-string v5, "Cannot locate declared field %s.%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v0, v6, v4

    aput-object p1, v6, v3

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 473
    invoke-static {v1, p0, v4}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_28
    move v2, v4

    .line 468
    goto :goto_5

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2a
    move v2, v4

    .line 471
    goto :goto_17
.end method

.method public static readDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 319
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 10
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 341
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 342
    .local v0, "field":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_1e

    move v1, v2

    :goto_9
    const-string v4, "Cannot locate declared field %s.%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object p1, v5, v2

    invoke-static {v1, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 344
    invoke-static {v0, v3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readStaticField(Ljava/lang/reflect/Field;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    :cond_1e
    move v1, v3

    .line 342
    goto :goto_9
.end method

.method public static readField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 404
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readField(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readField(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 10
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 425
    if-eqz p0, :cond_28

    move v2, v3

    :goto_5
    const-string v5, "target object must not be null"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 426
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 427
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 428
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz v1, :cond_2a

    move v2, v3

    :goto_17
    const-string v5, "Cannot locate field %s on %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v4

    aput-object v0, v6, v3

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 430
    invoke-static {v1, p0, v4}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_28
    move v2, v4

    .line 425
    goto :goto_5

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2a
    move v2, v4

    .line 428
    goto :goto_17
.end method

.method public static readField(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 361
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 7
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 381
    if-eqz p0, :cond_1c

    move v0, v1

    :goto_5
    const-string v3, "The field must not be null"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v2}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 382
    if-eqz p2, :cond_1e

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 383
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 387
    :goto_17
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1c
    move v0, v2

    .line 381
    goto :goto_5

    .line 385
    :cond_1e
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/MemberUtils;->setAccessibleWorkaround(Ljava/lang/reflect/AccessibleObject;)Z

    goto :goto_17
.end method

.method public static readStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 275
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readStaticField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readStaticField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 9
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 297
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 298
    .local v0, "field":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_1a

    move v1, v2

    :goto_9
    const-string v4, "Cannot locate field \'%s\' on %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p0, v5, v2

    invoke-static {v1, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 300
    invoke-static {v0, v3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readStaticField(Ljava/lang/reflect/Field;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    :cond_1a
    move v1, v3

    .line 298
    goto :goto_9
.end method

.method public static readStaticField(Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .registers 2
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 237
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readStaticField(Ljava/lang/reflect/Field;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static readStaticField(Ljava/lang/reflect/Field;Z)Ljava/lang/Object;
    .registers 7
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 255
    if-eqz p0, :cond_29

    move v0, v1

    :goto_5
    const-string v3, "The field must not be null"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 256
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    const-string v3, "The field \'%s\' is not static"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 257
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Object;

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/reflect/FieldUtils;->readField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_29
    move v0, v2

    .line 255
    goto :goto_5
.end method

.method public static removeFinalModifier(Ljava/lang/reflect/Field;)V
    .registers 2
    .param p0, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 662
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->removeFinalModifier(Ljava/lang/reflect/Field;Z)V

    .line 663
    return-void
.end method

.method public static removeFinalModifier(Ljava/lang/reflect/Field;Z)V
    .registers 9
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "forceAccess"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 679
    if-eqz p0, :cond_3d

    move v2, v3

    :goto_5
    const-string v5, "The field must not be null"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 682
    :try_start_c
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 684
    const-class v2, Ljava/lang/reflect/Field;

    const-string v5, "modifiers"

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 685
    .local v1, "modifiersField":Ljava/lang/reflect/Field;
    if-eqz p1, :cond_3f

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v2

    if-nez v2, :cond_3f

    move v0, v3

    .line 686
    .local v0, "doForceAccess":Z
    :goto_27
    if-eqz v0, :cond_2d

    .line 687
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2d
    .catch Ljava/lang/NoSuchFieldException; {:try_start_c .. :try_end_2d} :catch_49
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_2d} :catch_4b

    .line 690
    :cond_2d
    :try_start_2d
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v2

    and-int/lit8 v2, v2, -0x11

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_36
    .catchall {:try_start_2d .. :try_end_36} :catchall_41

    .line 692
    if-eqz v0, :cond_3c

    .line 693
    const/4 v2, 0x0

    :try_start_39
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 702
    .end local v0    # "doForceAccess":Z
    .end local v1    # "modifiersField":Ljava/lang/reflect/Field;
    :cond_3c
    :goto_3c
    return-void

    :cond_3d
    move v2, v4

    .line 679
    goto :goto_5

    .restart local v1    # "modifiersField":Ljava/lang/reflect/Field;
    :cond_3f
    move v0, v4

    .line 685
    goto :goto_27

    .line 692
    .restart local v0    # "doForceAccess":Z
    :catchall_41
    move-exception v2

    if-eqz v0, :cond_48

    .line 693
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_48
    throw v2
    :try_end_49
    .catch Ljava/lang/NoSuchFieldException; {:try_start_39 .. :try_end_49} :catch_49
    .catch Ljava/lang/IllegalAccessException; {:try_start_39 .. :try_end_49} :catch_4b

    .line 697
    .end local v0    # "doForceAccess":Z
    .end local v1    # "modifiersField":Ljava/lang/reflect/Field;
    :catch_49
    move-exception v2

    goto :goto_3c

    .line 699
    :catch_4b
    move-exception v2

    goto :goto_3c
.end method

.method public static writeDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 768
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 769
    return-void
.end method

.method public static writeDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 12
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 792
    if-eqz p0, :cond_2b

    move v2, v3

    :goto_5
    const-string v5, "target object must not be null"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 793
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 794
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0, p1, p3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 795
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz v1, :cond_2d

    move v2, v3

    :goto_17
    const-string v5, "Cannot locate declared field %s.%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    aput-object p1, v6, v3

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 797
    invoke-static {v1, p0, p2, v4}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 798
    return-void

    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2b
    move v2, v4

    .line 792
    goto :goto_5

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2d
    move v2, v4

    .line 795
    goto :goto_17
.end method

.method public static writeDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 577
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 578
    return-void
.end method

.method public static writeDeclaredStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 11
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 600
    invoke-static {p0, p1, p3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getDeclaredField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 601
    .local v0, "field":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_20

    move v1, v2

    :goto_9
    const-string v4, "Cannot locate declared field %s.%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    aput-object p1, v5, v2

    invoke-static {v1, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 603
    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Object;

    invoke-static {v0, v1, p2, v3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 604
    return-void

    :cond_20
    move v1, v3

    .line 601
    goto :goto_9
.end method

.method public static writeField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 720
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 721
    return-void
.end method

.method public static writeField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 12
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 744
    if-eqz p0, :cond_2b

    move v2, v3

    :goto_5
    const-string v5, "target object must not be null"

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 745
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 746
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0, p1, p3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 747
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz v1, :cond_2d

    move v2, v3

    :goto_17
    const-string v5, "Cannot locate declared field %s.%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    aput-object p1, v6, v3

    invoke-static {v2, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 749
    invoke-static {v1, p0, p2, v4}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 750
    return-void

    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2b
    move v2, v4

    .line 744
    goto :goto_5

    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2d
    move v2, v4

    .line 747
    goto :goto_17
.end method

.method public static writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 620
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 621
    return-void
.end method

.method public static writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 8
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 643
    if-eqz p0, :cond_1b

    move v0, v1

    :goto_5
    const-string v3, "The field must not be null"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v2}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 644
    if-eqz p3, :cond_1d

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 645
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 649
    :goto_17
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 650
    return-void

    :cond_1b
    move v0, v2

    .line 643
    goto :goto_5

    .line 647
    :cond_1d
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/MemberUtils;->setAccessibleWorkaround(Ljava/lang/reflect/AccessibleObject;)Z

    goto :goto_17
.end method

.method public static writeStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 531
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 532
    return-void
.end method

.method public static writeStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 10
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 555
    invoke-static {p0, p1, p3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->getField(Ljava/lang/Class;Ljava/lang/String;Z)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 556
    .local v0, "field":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_19

    move v1, v2

    :goto_9
    const-string v4, "Cannot locate field %s on %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p0, v5, v2

    invoke-static {v1, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 558
    invoke-static {v0, p2, v3}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeStaticField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)V

    .line 559
    return-void

    :cond_19
    move v1, v3

    .line 556
    goto :goto_9
.end method

.method public static writeStaticField(Ljava/lang/reflect/Field;Ljava/lang/Object;)V
    .registers 3
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 489
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeStaticField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)V

    .line 490
    return-void
.end method

.method public static writeStaticField(Ljava/lang/reflect/Field;Ljava/lang/Object;Z)V
    .registers 9
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "forceAccess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 509
    if-eqz p0, :cond_33

    move v0, v1

    :goto_5
    const-string v3, "The field must not be null"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 510
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    const-string v3, "The field %s.%s is not static"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    invoke-static {v0, v3, v4}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 512
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Object;

    invoke-static {p0, v0, p1, p2}, Lorg/apache/commons/lang3/reflect/FieldUtils;->writeField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 513
    return-void

    :cond_33
    move v0, v2

    .line 509
    goto :goto_5
.end method
