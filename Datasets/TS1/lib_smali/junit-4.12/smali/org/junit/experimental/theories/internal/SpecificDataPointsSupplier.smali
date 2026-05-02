.class public Lorg/junit/experimental/theories/internal/SpecificDataPointsSupplier;
.super Lorg/junit/experimental/theories/internal/AllMembersSupplier;
.source "SpecificDataPointsSupplier.java"


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/TestClass;)V
    .registers 2
    .param p1, "testClass"    # Lorg/junit/runners/model/TestClass;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;-><init>(Lorg/junit/runners/model/TestClass;)V

    .line 20
    return-void
.end method


# virtual methods
.method protected getDataPointsFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 9
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
    .line 41
    invoke-super {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getDataPointsFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v2

    .line 42
    .local v2, "fields":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/reflect/Field;>;"
    const-class v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-virtual {p1, v6}, Lorg/junit/experimental/theories/ParameterSignature;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/FromDataPoints;->value()Ljava/lang/String;

    move-result-object v5

    .line 44
    .local v5, "requestedName":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v3, "fieldsWithMatchingNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 47
    .local v0, "field":Ljava/lang/reflect/Field;
    const-class v6, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/DataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/DataPoints;->value()[Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "fieldNames":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 49
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 53
    .end local v0    # "field":Ljava/lang/reflect/Field;
    .end local v1    # "fieldNames":[Ljava/lang/String;
    :cond_3f
    return-object v3
.end method

.method protected getDataPointsMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 9
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
    .line 75
    invoke-super {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getDataPointsMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v3

    .line 76
    .local v3, "methods":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/junit/runners/model/FrameworkMethod;>;"
    const-class v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-virtual {p1, v6}, Lorg/junit/experimental/theories/ParameterSignature;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/FromDataPoints;->value()Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "requestedName":Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v4, "methodsWithMatchingNames":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkMethod;

    .line 81
    .local v1, "method":Lorg/junit/runners/model/FrameworkMethod;
    const-class v6, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v1, v6}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/DataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/DataPoints;->value()[Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "methodNames":[Ljava/lang/String;
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 83
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 87
    .end local v1    # "method":Lorg/junit/runners/model/FrameworkMethod;
    .end local v2    # "methodNames":[Ljava/lang/String;
    :cond_3f
    return-object v4
.end method

.method protected getSingleDataPointFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 9
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
    .line 24
    invoke-super {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getSingleDataPointFields(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v2

    .line 25
    .local v2, "fields":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/reflect/Field;>;"
    const-class v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-virtual {p1, v6}, Lorg/junit/experimental/theories/ParameterSignature;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/FromDataPoints;->value()Ljava/lang/String;

    move-result-object v5

    .line 27
    .local v5, "requestedName":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .local v3, "fieldsWithMatchingNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 30
    .local v0, "field":Ljava/lang/reflect/Field;
    const-class v6, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/DataPoint;

    invoke-interface {v6}, Lorg/junit/experimental/theories/DataPoint;->value()[Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "fieldNames":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 32
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 36
    .end local v0    # "field":Ljava/lang/reflect/Field;
    .end local v1    # "fieldNames":[Ljava/lang/String;
    :cond_3f
    return-object v3
.end method

.method protected getSingleDataPointMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;
    .registers 9
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
    .line 58
    invoke-super {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->getSingleDataPointMethods(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/Collection;

    move-result-object v3

    .line 59
    .local v3, "methods":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/junit/runners/model/FrameworkMethod;>;"
    const-class v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-virtual {p1, v6}, Lorg/junit/experimental/theories/ParameterSignature;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/FromDataPoints;

    invoke-interface {v6}, Lorg/junit/experimental/theories/FromDataPoints;->value()Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "requestedName":Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v4, "methodsWithMatchingNames":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkMethod;

    .line 64
    .local v1, "method":Lorg/junit/runners/model/FrameworkMethod;
    const-class v6, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v1, v6}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/DataPoint;

    invoke-interface {v6}, Lorg/junit/experimental/theories/DataPoint;->value()[Ljava/lang/String;

    move-result-object v2

    .line 65
    .local v2, "methodNames":[Ljava/lang/String;
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 66
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 70
    .end local v1    # "method":Lorg/junit/runners/model/FrameworkMethod;
    .end local v2    # "methodNames":[Ljava/lang/String;
    :cond_3f
    return-object v4
.end method
