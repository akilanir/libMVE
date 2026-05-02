.class public Lch/qos/logback/core/joran/util/Introspector;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decapitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/4 v2, 0x1

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_b

    :cond_9
    move-object v0, p0

    :cond_a
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public static getMethodDescriptors(Ljava/lang/Class;)[Lch/qos/logback/core/joran/util/MethodDescriptor;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lch/qos/logback/core/joran/util/MethodDescriptor;"
        }
    .end annotation

    const/4 v1, 0x0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    array-length v4, v3

    move v0, v1

    :goto_c
    if-ge v0, v4, :cond_1f

    aget-object v5, v3, v0

    new-instance v6, Lch/qos/logback/core/joran/util/MethodDescriptor;

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v5}, Lch/qos/logback/core/joran/util/MethodDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_1f
    new-array v0, v1, [Lch/qos/logback/core/joran/util/MethodDescriptor;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/joran/util/MethodDescriptor;

    return-object v0
.end method

.method public static getPropertyDescriptors(Ljava/lang/Class;)[Lch/qos/logback/core/joran/util/PropertyDescriptor;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lch/qos/logback/core/joran/util/PropertyDescriptor;"
        }
    .end annotation

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-string v0, "set"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    array-length v9, v8

    move v5, v3

    :goto_13
    if-ge v5, v9, :cond_84

    aget-object v10, v8, v5

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "get"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6a

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v6, :cond_6a

    move v1, v2

    :goto_2a
    const-string v4, "set"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v6, :cond_6c

    move v4, v2

    :goto_39
    if-nez v1, :cond_3d

    if-eqz v4, :cond_66

    :cond_3d
    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/joran/util/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/util/PropertyDescriptor;

    if-nez v0, :cond_55

    new-instance v0, Lch/qos/logback/core/joran/util/PropertyDescriptor;

    invoke-direct {v0, v11}, Lch/qos/logback/core/joran/util/PropertyDescriptor;-><init>(Ljava/lang/String;)V

    invoke-interface {v7, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_55
    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v11

    if-eqz v4, :cond_6e

    array-length v1, v11

    if-ne v1, v2, :cond_66

    invoke-virtual {v0, v10}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    aget-object v1, v11, v3

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->setPropertyType(Ljava/lang/Class;)V

    :cond_66
    :goto_66
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_13

    :cond_6a
    move v1, v3

    goto :goto_2a

    :cond_6c
    move v4, v3

    goto :goto_39

    :cond_6e
    if-eqz v1, :cond_66

    array-length v1, v11

    if-nez v1, :cond_66

    invoke-virtual {v0, v10}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    invoke-virtual {v0}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v1

    if-nez v1, :cond_66

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->setPropertyType(Ljava/lang/Class;)V

    goto :goto_66

    :cond_84
    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    new-array v1, v3, [Lch/qos/logback/core/joran/util/PropertyDescriptor;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/joran/util/PropertyDescriptor;

    return-object v0
.end method
