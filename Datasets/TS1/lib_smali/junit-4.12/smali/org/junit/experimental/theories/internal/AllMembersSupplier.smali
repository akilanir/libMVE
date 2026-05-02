.class public Lorg/junit/experimental/theories/internal/AllMembersSupplier;
.super Lorg/junit/experimental/theories/ParameterSupplier;
.source "AllMembersSupplier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/experimental/theories/internal/AllMembersSupplier$1;,
        Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;
    }
.end annotation


# instance fields
.field private final clazz:Lorg/junit/runners/model/TestClass;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/TestClass;)V
    .registers 2
    .param p1, "type"    # Lorg/junit/runners/model/TestClass;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/junit/experimental/theories/ParameterSupplier;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->clazz:Lorg/junit/runners/model/TestClass;

    .line 62
    return-void
.end method

.method static synthetic access$000([Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "x0"    # [Ljava/lang/Class;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 23
    invoke-static {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->isAssignableToAnyOf([Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private addArrayValues(Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V
    .registers 9
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .param p2, "name"    # Ljava/lang/String;
    .param p4, "array"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 133
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-static {p4}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    if-ge v0, v2, :cond_38

    .line 134
    invoke-static {p4, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 135
    .local v1, "value":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Lorg/junit/experimental/theories/ParameterSignature;->canAcceptValue(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    :cond_35
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 139
    .end local v1    # "value":Ljava/lang/Object;
    :cond_38
    return-void
.end method

.method private addDataPointsValues(Ljava/lang/Class;Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V
    .registers 7
    .param p2, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .param p3, "name"    # Ljava/lang/String;
    .param p5, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p4, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 125
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addArrayValues(Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V

    .line 130
    .end local p5    # "value":Ljava/lang/Object;
    :cond_9
    :goto_9
    return-void

    .line 127
    .restart local p5    # "value":Ljava/lang/Object;
    :cond_a
    const-class v0, Ljava/lang/Iterable;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 128
    check-cast p5, Ljava/lang/Iterable;

    .end local p5    # "value":Ljava/lang/Object;
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addIterableValues(Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Iterable;)V

    goto :goto_9
.end method

.method private addIterableValues(Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Iterable;)V
    .registers 10
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;",
            "Ljava/lang/Iterable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    .local p4, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 143
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/4 v0, 0x0

    .line 144
    .local v0, "i":I
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 145
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 146
    .local v2, "value":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Lorg/junit/experimental/theories/ParameterSignature;->canAcceptValue(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 147
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    :cond_39
    add-int/lit8 v0, v0, 0x1

    .line 150
    goto :goto_5

    .line 151
    .end local v2    # "value":Ljava/lang/Object;
    :cond_3c
    return-void
.end method

.method private addMultiPointFields(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V
    .registers 11
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getDataPointsFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Field;

    .line 107
    .local v6, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 108
    .local v1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v6}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getStaticFieldValue(Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addDataPointsValues(Ljava/lang/Class;Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V

    goto :goto_8

    .line 110
    .end local v1    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "field":Ljava/lang/reflect/Field;
    :cond_27
    return-void
.end method

.method private addMultiPointMethods(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V
    .registers 13
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 77
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getDataPointsMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_58

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/junit/runners/model/FrameworkMethod;

    .line 78
    .local v7, "dataPointsMethod":Lorg/junit/runners/model/FrameworkMethod;
    invoke-virtual {v7}, Lorg/junit/runners/model/FrameworkMethod;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 80
    .local v1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/junit/experimental/theories/ParameterSignature;->canPotentiallyAcceptType(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_30

    :cond_28
    const-class v0, Ljava/lang/Iterable;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 83
    :cond_30
    :try_start_30
    invoke-virtual {v7}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v7, v0, v2}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addDataPointsValues(Ljava/lang/Class;Lorg/junit/experimental/theories/ParameterSignature;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_42} :catch_43

    goto :goto_8

    .line 85
    :catch_43
    move-exception v9

    .line 86
    .local v9, "throwable":Ljava/lang/Throwable;
    const-class v0, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v7, v0}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/DataPoints;

    .line 87
    .local v6, "annotation":Lorg/junit/experimental/theories/DataPoints;
    if-eqz v6, :cond_59

    invoke-interface {v6}, Lorg/junit/experimental/theories/DataPoints;->ignoredExceptions()[Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, v9}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->isAssignableToAnyOf([Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 95
    .end local v1    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "annotation":Lorg/junit/experimental/theories/DataPoints;
    .end local v7    # "dataPointsMethod":Lorg/junit/runners/model/FrameworkMethod;
    .end local v9    # "throwable":Ljava/lang/Throwable;
    :cond_58
    return-void

    .line 90
    .restart local v1    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v6    # "annotation":Lorg/junit/experimental/theories/DataPoints;
    .restart local v7    # "dataPointsMethod":Lorg/junit/runners/model/FrameworkMethod;
    .restart local v9    # "throwable":Ljava/lang/Throwable;
    :cond_59
    throw v9
.end method

.method private addSinglePointFields(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V
    .registers 7
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getSingleDataPointFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 114
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-direct {p0, v0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getStaticFieldValue(Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v2

    .line 116
    .local v2, "value":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Lorg/junit/experimental/theories/ParameterSignature;->canAcceptValue(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 117
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 120
    .end local v0    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2a
    return-void
.end method

.method private addSinglePointMethods(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V
    .registers 7
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getSingleDataPointMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/model/FrameworkMethod;

    .line 99
    .local v0, "dataPointMethod":Lorg/junit/runners/model/FrameworkMethod;
    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/junit/experimental/theories/ParameterSignature;->canAcceptType(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 100
    new-instance v2, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;-><init>(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/AllMembersSupplier$1;)V

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 103
    .end local v0    # "dataPointMethod":Lorg/junit/runners/model/FrameworkMethod;
    :cond_28
    return-void
.end method

.method private getStaticFieldValue(Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 155
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_4} :catch_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_4} :catch_f

    move-result-object v1

    return-object v1

    .line 156
    :catch_6
    move-exception v0

    .line 157
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "unexpected: field from getClass doesn\'t exist on object"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 159
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_f
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "unexpected: getFields returned an inaccessible field"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static isAssignableToAnyOf([Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 7
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "typeArray":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_16

    aget-object v3, v0, v1

    .line 167
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 168
    const/4 v4, 0x1

    .line 171
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_12
    return v4

    .line 166
    .restart local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 171
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_16
    const/4 v4, 0x0

    goto :goto_12
.end method


# virtual methods
.method protected getDataPointsFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 8
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    iget-object v4, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->clazz:Lorg/junit/runners/model/TestClass;

    const-class v5, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v4, v5}, Lorg/junit/runners/model/TestClass;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 191
    .local v0, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .local v3, "validFields":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/reflect/Field;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkField;

    .line 194
    .local v1, "frameworkField":Lorg/junit/runners/model/FrameworkField;
    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkField;->getField()Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 197
    .end local v1    # "frameworkField":Lorg/junit/runners/model/FrameworkField;
    :cond_25
    return-object v3
.end method

.method protected getDataPointsMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 4
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->clazz:Lorg/junit/runners/model/TestClass;

    const-class v1, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v0, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getSingleDataPointFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 8
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    iget-object v4, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->clazz:Lorg/junit/runners/model/TestClass;

    const-class v5, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v4, v5}, Lorg/junit/runners/model/TestClass;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 180
    .local v0, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 182
    .local v3, "validFields":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/reflect/Field;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkField;

    .line 183
    .local v1, "frameworkField":Lorg/junit/runners/model/FrameworkField;
    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkField;->getField()Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 186
    .end local v1    # "frameworkField":Lorg/junit/runners/model/FrameworkField;
    :cond_25
    return-object v3
.end method

.method protected getSingleDataPointMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 4
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->clazz:Lorg/junit/runners/model/TestClass;

    const-class v1, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v0, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;
    .registers 3
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    invoke-direct {p0, p1, v0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addSinglePointFields(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V

    .line 69
    invoke-direct {p0, p1, v0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addMultiPointFields(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V

    .line 70
    invoke-direct {p0, p1, v0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addSinglePointMethods(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V

    .line 71
    invoke-direct {p0, p1, v0}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->addMultiPointMethods(Lorg/junit/experimental/theories/ParameterSignature;Ljava/util/List;)V

    .line 73
    return-object v0
.end method
