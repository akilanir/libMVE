.class public abstract Lorg/springframework/util/ReflectionUtils;
.super Ljava/lang/Object;
.source "ReflectionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/springframework/util/ReflectionUtils$FieldFilter;,
        Lorg/springframework/util/ReflectionUtils$FieldCallback;,
        Lorg/springframework/util/ReflectionUtils$MethodFilter;,
        Lorg/springframework/util/ReflectionUtils$MethodCallback;
    }
.end annotation


# static fields
.field public static COPYABLE_FIELDS:Lorg/springframework/util/ReflectionUtils$FieldFilter;

.field public static NON_BRIDGED_METHODS:Lorg/springframework/util/ReflectionUtils$MethodFilter;

.field public static USER_DECLARED_METHODS:Lorg/springframework/util/ReflectionUtils$MethodFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 646
    new-instance v0, Lorg/springframework/util/ReflectionUtils$4;

    invoke-direct {v0}, Lorg/springframework/util/ReflectionUtils$4;-><init>()V

    sput-object v0, Lorg/springframework/util/ReflectionUtils;->COPYABLE_FIELDS:Lorg/springframework/util/ReflectionUtils$FieldFilter;

    .line 657
    new-instance v0, Lorg/springframework/util/ReflectionUtils$5;

    invoke-direct {v0}, Lorg/springframework/util/ReflectionUtils$5;-><init>()V

    sput-object v0, Lorg/springframework/util/ReflectionUtils;->NON_BRIDGED_METHODS:Lorg/springframework/util/ReflectionUtils$MethodFilter;

    .line 669
    new-instance v0, Lorg/springframework/util/ReflectionUtils$6;

    invoke-direct {v0}, Lorg/springframework/util/ReflectionUtils$6;-><init>()V

    sput-object v0, Lorg/springframework/util/ReflectionUtils;->USER_DECLARED_METHODS:Lorg/springframework/util/ReflectionUtils$MethodFilter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 633
    return-void
.end method

.method public static declaresException(Ljava/lang/reflect/Method;Ljava/lang/Class;)Z
    .registers 8
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 323
    .local p1, "exceptionType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v5, "Method must not be null"

    invoke-static {p0, v5}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 324
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 325
    .local v2, "declaredExceptions":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_c
    if-ge v3, v4, :cond_1b

    aget-object v1, v0, v3

    .line 326
    .local v1, "declaredException":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 327
    const/4 v5, 0x1

    .line 330
    .end local v1    # "declaredException":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_17
    return v5

    .line 325
    .restart local v1    # "declaredException":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 330
    .end local v1    # "declaredException":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1b
    const/4 v5, 0x0

    goto :goto_17
.end method

.method public static doWithFields(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$FieldCallback;)V
    .registers 3
    .param p1, "fc"    # Lorg/springframework/util/ReflectionUtils$FieldCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/util/ReflectionUtils$FieldCallback;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 529
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->doWithFields(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$FieldCallback;Lorg/springframework/util/ReflectionUtils$FieldFilter;)V

    .line 530
    return-void
.end method

.method public static doWithFields(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$FieldCallback;Lorg/springframework/util/ReflectionUtils$FieldFilter;)V
    .registers 13
    .param p1, "fc"    # Lorg/springframework/util/ReflectionUtils$FieldCallback;
    .param p2, "ff"    # Lorg/springframework/util/ReflectionUtils$FieldFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/util/ReflectionUtils$FieldCallback;",
            "Lorg/springframework/util/ReflectionUtils$FieldFilter;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 543
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v6, p0

    .line 545
    .local v6, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    invoke-virtual {v6}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 546
    .local v3, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_8
    if-ge v4, v5, :cond_43

    aget-object v2, v0, v4

    .line 548
    .local v2, "field":Ljava/lang/reflect/Field;
    if-eqz p2, :cond_17

    invoke-interface {p2, v2}, Lorg/springframework/util/ReflectionUtils$FieldFilter;->matches(Ljava/lang/reflect/Field;)Z

    move-result v7

    if-nez v7, :cond_17

    .line 546
    :goto_14
    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    .line 552
    :cond_17
    :try_start_17
    invoke-interface {p1, v2}, Lorg/springframework/util/ReflectionUtils$FieldCallback;->doWith(Ljava/lang/reflect/Field;)V
    :try_end_1a
    .catch Ljava/lang/IllegalAccessException; {:try_start_17 .. :try_end_1a} :catch_1b

    goto :goto_14

    .line 554
    :catch_1b
    move-exception v1

    .line 555
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Shouldn\'t be illegal to access field \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\': "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 559
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :cond_43
    invoke-virtual {v6}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 561
    if-eqz v6, :cond_4d

    const-class v7, Ljava/lang/Object;

    if-ne v6, v7, :cond_1

    .line 562
    :cond_4d
    return-void
.end method

.method public static doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;)V
    .registers 3
    .param p1, "mc"    # Lorg/springframework/util/ReflectionUtils$MethodCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/util/ReflectionUtils$MethodCallback;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 439
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;Lorg/springframework/util/ReflectionUtils$MethodFilter;)V

    .line 440
    return-void
.end method

.method public static doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;Lorg/springframework/util/ReflectionUtils$MethodFilter;)V
    .registers 13
    .param p1, "mc"    # Lorg/springframework/util/ReflectionUtils$MethodCallback;
    .param p2, "mf"    # Lorg/springframework/util/ReflectionUtils$MethodFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/util/ReflectionUtils$MethodCallback;",
            "Lorg/springframework/util/ReflectionUtils$MethodFilter;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 455
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    .line 456
    .local v5, "methods":[Ljava/lang/reflect/Method;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_7
    if-ge v2, v3, :cond_42

    aget-object v4, v0, v2

    .line 457
    .local v4, "method":Ljava/lang/reflect/Method;
    if-eqz p2, :cond_16

    invoke-interface {p2, v4}, Lorg/springframework/util/ReflectionUtils$MethodFilter;->matches(Ljava/lang/reflect/Method;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 456
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 461
    :cond_16
    :try_start_16
    invoke-interface {p1, v4}, Lorg/springframework/util/ReflectionUtils$MethodCallback;->doWith(Ljava/lang/reflect/Method;)V
    :try_end_19
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_19} :catch_1a

    goto :goto_13

    .line 463
    :catch_1a
    move-exception v1

    .line 464
    .local v1, "ex":Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Shouldn\'t be illegal to access method \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\': "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 468
    .end local v1    # "ex":Ljava/lang/IllegalAccessException;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_42
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    if-eqz v7, :cond_50

    .line 469
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    invoke-static {v7, p1, p2}, Lorg/springframework/util/ReflectionUtils;->doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;Lorg/springframework/util/ReflectionUtils$MethodFilter;)V

    .line 476
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    :cond_4f
    return-void

    .line 471
    .restart local v0    # "arr$":[Ljava/lang/reflect/Method;
    :cond_50
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 472
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    const/4 v2, 0x0

    :goto_5c
    if-ge v2, v3, :cond_4f

    aget-object v6, v0, v2

    .line 473
    .local v6, "superIfc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v6, p1, p2}, Lorg/springframework/util/ReflectionUtils;->doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;Lorg/springframework/util/ReflectionUtils$MethodFilter;)V

    .line 472
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c
.end method

.method public static findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
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
    .line 55
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Field;

    move-result-object v0

    return-object v0
.end method

.method public static findField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Field;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "Class must not be null"

    invoke-static {p0, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    if-nez p1, :cond_9

    if-eqz p2, :cond_3e

    :cond_9
    const/4 v6, 0x1

    :goto_a
    const-string v7, "Either name or type of the field must be specified"

    invoke-static {v6, v7}, Lorg/springframework/util/Assert;->isTrue(ZLjava/lang/String;)V

    .line 70
    move-object v5, p0

    .line 71
    .local v5, "searchType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_10
    const-class v6, Ljava/lang/Object;

    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_48

    if-eqz v5, :cond_48

    .line 72
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 73
    .local v2, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_21
    if-ge v3, v4, :cond_43

    aget-object v1, v0, v3

    .line 74
    .local v1, "field":Ljava/lang/reflect/Field;
    if-eqz p1, :cond_31

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_40

    :cond_31
    if-eqz p2, :cond_3d

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_40

    .line 80
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fields":[Ljava/lang/reflect/Field;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_3d
    :goto_3d
    return-object v1

    .line 69
    .end local v5    # "searchType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3e
    const/4 v6, 0x0

    goto :goto_a

    .line 73
    .restart local v0    # "arr$":[Ljava/lang/reflect/Field;
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    .restart local v2    # "fields":[Ljava/lang/reflect/Field;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "searchType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_40
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 78
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_43
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 79
    goto :goto_10

    .line 80
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v2    # "fields":[Ljava/lang/reflect/Field;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_48
    const/4 v1, 0x0

    goto :goto_3d
.end method

.method public static findMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public static varargs findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v6, "Class must not be null"

    invoke-static {p0, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    const-string v6, "Method name must not be null"

    invoke-static {p1, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    move-object v5, p0

    .line 151
    .local v5, "searchType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_b
    if-eqz v5, :cond_42

    .line 152
    invoke-virtual {v5}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-virtual {v5}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 153
    .local v4, "methods":[Ljava/lang/reflect/Method;
    :goto_17
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1a
    if-ge v1, v2, :cond_3d

    aget-object v3, v0, v1

    .line 154
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    if-eqz p2, :cond_34

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    invoke-static {p2, v6}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    .line 161
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    :cond_34
    :goto_34
    return-object v3

    .line 152
    :cond_35
    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    goto :goto_17

    .line 153
    .restart local v0    # "arr$":[Ljava/lang/reflect/Method;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    .restart local v4    # "methods":[Ljava/lang/reflect/Method;
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 159
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_3d
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 160
    goto :goto_b

    .line 161
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    :cond_42
    const/4 v3, 0x0

    goto :goto_34
.end method

.method public static getAllDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 483
    .local p0, "leafClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 484
    .local v0, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    new-instance v1, Lorg/springframework/util/ReflectionUtils$1;

    invoke-direct {v1, v0}, Lorg/springframework/util/ReflectionUtils$1;-><init>(Ljava/util/List;)V

    invoke-static {p0, v1}, Lorg/springframework/util/ReflectionUtils;->doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;)V

    .line 489
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/reflect/Method;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Method;

    return-object v1
.end method

.method public static getField(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 118
    :catch_5
    move-exception v0

    .line 119
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleReflectionException(Ljava/lang/Exception;)V

    .line 120
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected reflection exception - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getUniqueDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 498
    .local p0, "leafClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 499
    .local v0, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    new-instance v1, Lorg/springframework/util/ReflectionUtils$2;

    invoke-direct {v1, v0}, Lorg/springframework/util/ReflectionUtils$2;-><init>(Ljava/util/List;)V

    invoke-static {p0, v1}, Lorg/springframework/util/ReflectionUtils;->doWithMethods(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$MethodCallback;)V

    .line 519
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/reflect/Method;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Method;

    return-object v1
.end method

.method public static handleInvocationTargetException(Ljava/lang/reflect/InvocationTargetException;)V
    .registers 2
    .param p0, "ex"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 268
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->rethrowRuntimeException(Ljava/lang/Throwable;)V

    .line 269
    return-void
.end method

.method public static handleReflectionException(Ljava/lang/Exception;)V
    .registers 4
    .param p0, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 245
    instance-of v0, p0, Ljava/lang/NoSuchMethodException;

    if-eqz v0, :cond_21

    .line 246
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method not found: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 248
    :cond_21
    instance-of v0, p0, Ljava/lang/IllegalAccessException;

    if-eqz v0, :cond_42

    .line 249
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not access method: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_42
    instance-of v0, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v0, :cond_4c

    move-object v0, p0

    .line 252
    check-cast v0, Ljava/lang/reflect/InvocationTargetException;

    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleInvocationTargetException(Ljava/lang/reflect/InvocationTargetException;)V

    .line 254
    :cond_4c
    instance-of v0, p0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_53

    .line 255
    check-cast p0, Ljava/lang/RuntimeException;

    .end local p0    # "ex":Ljava/lang/Exception;
    throw p0

    .line 257
    .restart local p0    # "ex":Ljava/lang/Exception;
    :cond_53
    new-instance v0, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v0, p0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static invokeJdbcMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->invokeJdbcMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs invokeJdbcMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 222
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_3} :catch_11

    move-result-object v1

    return-object v1

    .line 224
    :catch_5
    move-exception v0

    .line 225
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleReflectionException(Ljava/lang/Exception;)V

    .line 233
    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    :goto_9
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Should never get here"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 227
    :catch_11
    move-exception v0

    .line 228
    .local v0, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/sql/SQLException;

    if-eqz v1, :cond_21

    .line 229
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/sql/SQLException;

    throw v1

    .line 231
    :cond_21
    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleInvocationTargetException(Ljava/lang/reflect/InvocationTargetException;)V

    goto :goto_9
.end method

.method public static invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 174
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, p1, v0}, Lorg/springframework/util/ReflectionUtils;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static varargs invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 189
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 191
    :catch_5
    move-exception v0

    .line 192
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleReflectionException(Ljava/lang/Exception;)V

    .line 194
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Should never get here"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static isEqualsMethod(Ljava/lang/reflect/Method;)Z
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 347
    if-eqz p0, :cond_10

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "equals"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move v1, v2

    .line 351
    :cond_11
    :goto_11
    return v1

    .line 350
    :cond_12
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 351
    .local v0, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v3, v0

    if-ne v3, v1, :cond_1f

    aget-object v3, v0, v2

    const-class v4, Ljava/lang/Object;

    if-eq v3, v4, :cond_11

    :cond_1f
    move v1, v2

    goto :goto_11
.end method

.method public static isHashCodeMethod(Ljava/lang/reflect/Method;)Z
    .registers 3
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 359
    if-eqz p0, :cond_17

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static isObjectMethod(Ljava/lang/reflect/Method;)Z
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v1, 0x0

    .line 375
    :try_start_1
    const-class v2, Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_e
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_e} :catch_10
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_e} :catch_12

    .line 376
    const/4 v1, 0x1

    .line 380
    :goto_f
    return v1

    .line 377
    :catch_10
    move-exception v0

    .line 378
    .local v0, "ex":Ljava/lang/SecurityException;
    goto :goto_f

    .line 379
    .end local v0    # "ex":Ljava/lang/SecurityException;
    :catch_12
    move-exception v0

    .line 380
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    goto :goto_f
.end method

.method public static isPublicStaticFinal(Ljava/lang/reflect/Field;)Z
    .registers 3
    .param p0, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 338
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    .line 339
    .local v0, "modifiers":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v1

    if-eqz v1, :cond_18

    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public static isToStringMethod(Ljava/lang/reflect/Method;)Z
    .registers 3
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 367
    if-eqz p0, :cond_17

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "toString"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static makeAccessible(Ljava/lang/reflect/Constructor;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Constructor",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 423
    .local p0, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-nez v0, :cond_22

    :cond_18
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_22

    .line 425
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 427
    :cond_22
    return-void
.end method

.method public static makeAccessible(Ljava/lang/reflect/Field;)V
    .registers 2
    .param p0, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 393
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    if-eqz v0, :cond_2c

    :cond_22
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_2c

    .line 395
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 397
    :cond_2c
    return-void
.end method

.method public static makeAccessible(Ljava/lang/reflect/Method;)V
    .registers 2
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 408
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-nez v0, :cond_22

    :cond_18
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v0

    if-nez v0, :cond_22

    .line 410
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 412
    :cond_22
    return-void
.end method

.method public static rethrowException(Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 304
    instance-of v0, p0, Ljava/lang/Exception;

    if-eqz v0, :cond_7

    .line 305
    check-cast p0, Ljava/lang/Exception;

    .end local p0    # "ex":Ljava/lang/Throwable;
    throw p0

    .line 307
    .restart local p0    # "ex":Ljava/lang/Throwable;
    :cond_7
    instance-of v0, p0, Ljava/lang/Error;

    if-eqz v0, :cond_e

    .line 308
    check-cast p0, Ljava/lang/Error;

    .end local p0    # "ex":Ljava/lang/Throwable;
    throw p0

    .line 310
    .restart local p0    # "ex":Ljava/lang/Throwable;
    :cond_e
    new-instance v0, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v0, p0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static rethrowRuntimeException(Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 283
    instance-of v0, p0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_7

    .line 284
    check-cast p0, Ljava/lang/RuntimeException;

    .end local p0    # "ex":Ljava/lang/Throwable;
    throw p0

    .line 286
    .restart local p0    # "ex":Ljava/lang/Throwable;
    :cond_7
    instance-of v0, p0, Ljava/lang/Error;

    if-eqz v0, :cond_e

    .line 287
    check-cast p0, Ljava/lang/Error;

    .end local p0    # "ex":Ljava/lang/Throwable;
    throw p0

    .line 289
    .restart local p0    # "ex":Ljava/lang/Throwable;
    :cond_e
    new-instance v0, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v0, p0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static setField(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 95
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_3} :catch_4

    .line 102
    return-void

    .line 97
    :catch_4
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lorg/springframework/util/ReflectionUtils;->handleReflectionException(Ljava/lang/Exception;)V

    .line 99
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected reflection exception - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static shallowCopyFieldState(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p0, "src"    # Ljava/lang/Object;
    .param p1, "dest"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 571
    if-nez p0, :cond_a

    .line 572
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Source for field copy cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :cond_a
    if-nez p1, :cond_14

    .line 575
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Destination for field copy cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 577
    :cond_14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_5b

    .line 578
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Destination class ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] must be same or subclass as source class ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 581
    :cond_5b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Lorg/springframework/util/ReflectionUtils$3;

    invoke-direct {v1, p0, p1}, Lorg/springframework/util/ReflectionUtils$3;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v2, Lorg/springframework/util/ReflectionUtils;->COPYABLE_FIELDS:Lorg/springframework/util/ReflectionUtils$FieldFilter;

    invoke-static {v0, v1, v2}, Lorg/springframework/util/ReflectionUtils;->doWithFields(Ljava/lang/Class;Lorg/springframework/util/ReflectionUtils$FieldCallback;Lorg/springframework/util/ReflectionUtils$FieldFilter;)V

    .line 588
    return-void
.end method
