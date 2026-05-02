.class public Lorg/junit/experimental/theories/Theories;
.super Lorg/junit/runners/BlockJUnit4ClassRunner;
.source "Theories.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/experimental/theories/Theories$TheoryAnchor;
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;-><init>(Ljava/lang/Class;)V

    .line 74
    return-void
.end method

.method private validateDataPointFields(Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/experimental/theories/Theories;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v5

    invoke-virtual {v5}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 86
    .local v2, "fields":[Ljava/lang/reflect/Field;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v4, :cond_85

    aget-object v1, v0, v3

    .line 87
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v5, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    if-nez v5, :cond_26

    const-class v5, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    if-nez v5, :cond_26

    .line 86
    :cond_23
    :goto_23
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 90
    :cond_26
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-nez v5, :cond_55

    .line 91
    new-instance v5, Ljava/lang/Error;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DataPoint field "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " must be static"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_55
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v5

    if-nez v5, :cond_23

    .line 94
    new-instance v5, Ljava/lang/Error;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DataPoint field "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " must be public"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 97
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_85
    return-void
.end method

.method private validateDataPointMethods(Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/experimental/theories/Theories;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v5

    invoke-virtual {v5}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 102
    .local v4, "methods":[Ljava/lang/reflect/Method;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_f
    if-ge v1, v2, :cond_85

    aget-object v3, v0, v1

    .line 103
    .local v3, "method":Ljava/lang/reflect/Method;
    const-class v5, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    if-nez v5, :cond_26

    const-class v5, Lorg/junit/experimental/theories/DataPoints;

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    if-nez v5, :cond_26

    .line 102
    :cond_23
    :goto_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 106
    :cond_26
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-nez v5, :cond_55

    .line 107
    new-instance v5, Ljava/lang/Error;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DataPoint method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " must be static"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    :cond_55
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v5

    if-nez v5, :cond_23

    .line 110
    new-instance v5, Ljava/lang/Error;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DataPoint method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " must be public"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 113
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_85
    return-void
.end method

.method private validateParameterSupplier(Ljava/lang/Class;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/junit/experimental/theories/ParameterSupplier;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "supplierClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/experimental/theories/ParameterSupplier;>;"
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    const/4 v4, 0x0

    .line 140
    invoke-virtual {p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 142
    .local v0, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v2, v0

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2f

    .line 143
    new-instance v2, Ljava/lang/Error;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ParameterSupplier "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " must have only one constructor (either empty or taking only a TestClass)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_2e
    :goto_2e
    return-void

    .line 146
    :cond_2f
    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 147
    .local v1, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v2, v1

    if-eqz v2, :cond_2e

    aget-object v2, v1, v4

    const-class v3, Lorg/junit/runners/model/TestClass;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2e

    .line 148
    new-instance v2, Ljava/lang/Error;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ParameterSupplier "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " constructor must take either nothing or a single TestClass instance"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e
.end method


# virtual methods
.method protected collectInitializationErrors(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-super {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->collectInitializationErrors(Ljava/util/List;)V

    .line 79
    invoke-direct {p0, p1}, Lorg/junit/experimental/theories/Theories;->validateDataPointFields(Ljava/util/List;)V

    .line 80
    invoke-direct {p0, p1}, Lorg/junit/experimental/theories/Theories;->validateDataPointMethods(Ljava/util/List;)V

    .line 81
    return-void
.end method

.method protected computeTestMethods()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-super {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->computeTestMethods()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 157
    .local v0, "testMethods":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-virtual {p0}, Lorg/junit/experimental/theories/Theories;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v2

    const-class v3, Lorg/junit/experimental/theories/Theory;

    invoke-virtual {v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    .line 158
    .local v1, "theoryMethods":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 159
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 160
    return-object v0
.end method

.method public methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;
    .registers 4
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 165
    new-instance v0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;

    invoke-virtual {p0}, Lorg/junit/experimental/theories/Theories;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;-><init>(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runners/model/TestClass;)V

    return-object v0
.end method

.method protected validateConstructor(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/Theories;->validateOnlyOneConstructor(Ljava/util/List;)V

    .line 118
    return-void
.end method

.method protected validateTestMethods(Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    const/4 v6, 0x0

    .line 122
    invoke-virtual {p0}, Lorg/junit/experimental/theories/Theories;->computeTestMethods()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkMethod;

    .line 123
    .local v1, "each":Lorg/junit/runners/model/FrameworkMethod;
    const-class v5, Lorg/junit/experimental/theories/Theory;

    invoke-virtual {v1, v5}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    if-eqz v5, :cond_4d

    .line 124
    invoke-virtual {v1, v6, p1}, Lorg/junit/runners/model/FrameworkMethod;->validatePublicVoid(ZLjava/util/List;)V

    .line 125
    invoke-virtual {v1, p1}, Lorg/junit/runners/model/FrameworkMethod;->validateNoTypeParametersOnArgs(Ljava/util/List;)V

    .line 130
    :goto_23
    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkMethod;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-static {v5}, Lorg/junit/experimental/theories/ParameterSignature;->signatures(Ljava/lang/reflect/Method;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_2f
    :goto_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/junit/experimental/theories/ParameterSignature;

    .line 131
    .local v4, "signature":Lorg/junit/experimental/theories/ParameterSignature;
    const-class v5, Lorg/junit/experimental/theories/ParametersSuppliedBy;

    invoke-virtual {v4, v5}, Lorg/junit/experimental/theories/ParameterSignature;->findDeepAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/experimental/theories/ParametersSuppliedBy;

    .line 132
    .local v0, "annotation":Lorg/junit/experimental/theories/ParametersSuppliedBy;
    if-eqz v0, :cond_2f

    .line 133
    invoke-interface {v0}, Lorg/junit/experimental/theories/ParametersSuppliedBy;->value()Ljava/lang/Class;

    move-result-object v5

    invoke-direct {p0, v5, p1}, Lorg/junit/experimental/theories/Theories;->validateParameterSupplier(Ljava/lang/Class;Ljava/util/List;)V

    goto :goto_2f

    .line 127
    .end local v0    # "annotation":Lorg/junit/experimental/theories/ParametersSuppliedBy;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "signature":Lorg/junit/experimental/theories/ParameterSignature;
    :cond_4d
    invoke-virtual {v1, v6, p1}, Lorg/junit/runners/model/FrameworkMethod;->validatePublicVoidNoArg(ZLjava/util/List;)V

    goto :goto_23

    .line 137
    .end local v1    # "each":Lorg/junit/runners/model/FrameworkMethod;
    :cond_51
    return-void
.end method
