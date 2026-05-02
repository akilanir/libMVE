.class public Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;
.super Lorg/junit/runners/BlockJUnit4ClassRunner;
.source "BlockJUnit4ClassRunnerWithParameters.java"


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameters:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/junit/runners/parameterized/TestWithParameters;)V
    .registers 4
    .param p1, "test"    # Lorg/junit/runners/parameterized/TestWithParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 27
    invoke-virtual {p1}, Lorg/junit/runners/parameterized/TestWithParameters;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/runners/BlockJUnit4ClassRunner;-><init>(Ljava/lang/Class;)V

    .line 28
    invoke-virtual {p1}, Lorg/junit/runners/parameterized/TestWithParameters;->getParameters()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lorg/junit/runners/parameterized/TestWithParameters;->getParameters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    .line 30
    invoke-virtual {p1}, Lorg/junit/runners/parameterized/TestWithParameters;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->name:Ljava/lang/String;

    .line 31
    return-void
.end method

.method private createTestUsingConstructorInjection()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/runners/model/TestClass;->getOnlyConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private createTestUsingFieldInjection()Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getAnnotatedFieldsByParameter()Ljava/util/List;

    move-result-object v0

    .line 48
    .local v0, "annotatedFieldsByParameter":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    iget-object v9, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    array-length v9, v9

    if-eq v8, v9, :cond_3d

    .line 49
    new-instance v8, Ljava/lang/Exception;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Wrong number of parameters and @Parameter fields. @Parameter fields counted: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", available parameters: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    array-length v10, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v8

    .line 56
    :cond_3d
    invoke-virtual {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v8

    invoke-virtual {v8}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    .line 57
    .local v7, "testClassInstance":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_4d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/junit/runners/model/FrameworkField;

    .line 58
    .local v2, "each":Lorg/junit/runners/model/FrameworkField;
    invoke-virtual {v2}, Lorg/junit/runners/model/FrameworkField;->getField()Ljava/lang/reflect/Field;

    move-result-object v3

    .line 59
    .local v3, "field":Ljava/lang/reflect/Field;
    const-class v8, Lorg/junit/runners/Parameterized$Parameter;

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/Parameterized$Parameter;

    .line 60
    .local v1, "annotation":Lorg/junit/runners/Parameterized$Parameter;
    invoke-interface {v1}, Lorg/junit/runners/Parameterized$Parameter;->value()I

    move-result v6

    .line 62
    .local v6, "index":I
    :try_start_69
    iget-object v8, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    aget-object v8, v8, v6

    invoke-virtual {v3, v7, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_70
    .catch Ljava/lang/IllegalArgumentException; {:try_start_69 .. :try_end_70} :catch_71

    goto :goto_4d

    .line 63
    :catch_71
    move-exception v5

    .line 64
    .local v5, "iare":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/lang/Exception;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v10

    invoke-virtual {v10}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": Trying to set "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " with the value "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    aget-object v10, v10, v6

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " that is not the right type ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->parameters:[Ljava/lang/Object;

    aget-object v10, v10, v6

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " instead of "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 73
    .end local v1    # "annotation":Lorg/junit/runners/Parameterized$Parameter;
    .end local v2    # "each":Lorg/junit/runners/model/FrameworkField;
    .end local v3    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "iare":Ljava/lang/IllegalArgumentException;
    .end local v6    # "index":I
    :cond_d7
    return-object v7
.end method

.method private fieldsAreAnnotated()Z
    .registers 2

    .prologue
    .line 141
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getAnnotatedFieldsByParameter()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private getAnnotatedFieldsByParameter()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v0

    const-class v1, Lorg/junit/runners/Parameterized$Parameter;

    invoke-virtual {v0, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected classBlock(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;
    .registers 3
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->childrenInvoker(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    return-object v0
.end method

.method public createTest()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->fieldsAreAnnotated()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 36
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->createTestUsingFieldInjection()Ljava/lang/Object;

    move-result-object v0

    .line 38
    :goto_a
    return-object v0

    :cond_b
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->createTestUsingConstructorInjection()Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method protected getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected getRunnerAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 133
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/annotation/Annotation;

    return-object v0
.end method

.method protected testName(Lorg/junit/runners/model/FrameworkMethod;)Ljava/lang/String;
    .registers 4
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected validateConstructor(Ljava/util/List;)V
    .registers 3
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
    .line 88
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->validateOnlyOneConstructor(Ljava/util/List;)V

    .line 89
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->fieldsAreAnnotated()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 90
    invoke-virtual {p0, p1}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->validateZeroArgConstructor(Ljava/util/List;)V

    .line 92
    :cond_c
    return-void
.end method

.method protected validateFields(Ljava/util/List;)V
    .registers 11
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
    .line 96
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-super {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateFields(Ljava/util/List;)V

    .line 97
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->fieldsAreAnnotated()Z

    move-result v6

    if-eqz v6, :cond_df

    .line 98
    invoke-direct {p0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParameters;->getAnnotatedFieldsByParameter()Ljava/util/List;

    move-result-object v0

    .line 99
    .local v0, "annotatedFieldsByParameter":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [I

    .line 100
    .local v5, "usedIndices":[I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_84

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkField;

    .line 101
    .local v1, "each":Lorg/junit/runners/model/FrameworkField;
    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkField;->getField()Ljava/lang/reflect/Field;

    move-result-object v6

    const-class v7, Lorg/junit/runners/Parameterized$Parameter;

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/runners/Parameterized$Parameter;

    invoke-interface {v6}, Lorg/junit/runners/Parameterized$Parameter;->value()I

    move-result v3

    .line 103
    .local v3, "index":I
    if-ltz v3, :cond_3d

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-le v3, v6, :cond_7d

    .line 104
    :cond_3d
    new-instance v6, Ljava/lang/Exception;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid @Parameter value: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ". @Parameter fields counted: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ". Please use an index between 0 and "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 110
    :cond_7d
    aget v6, v5, v3

    add-int/lit8 v6, v6, 0x1

    aput v6, v5, v3

    goto :goto_17

    .line 113
    .end local v1    # "each":Lorg/junit/runners/model/FrameworkField;
    .end local v3    # "index":I
    :cond_84
    const/4 v3, 0x0

    .restart local v3    # "index":I
    :goto_85
    array-length v6, v5

    if-ge v3, v6, :cond_df

    .line 114
    aget v4, v5, v3

    .line 115
    .local v4, "numberOfUse":I
    if-nez v4, :cond_b0

    .line 116
    new-instance v6, Ljava/lang/Exception;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "@Parameter("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ") is never used."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    :cond_ad
    :goto_ad
    add-int/lit8 v3, v3, 0x1

    goto :goto_85

    .line 118
    :cond_b0
    const/4 v6, 0x1

    if-le v4, v6, :cond_ad

    .line 119
    new-instance v6, Ljava/lang/Exception;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "@Parameter("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ") is used more than once ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_ad

    .line 124
    .end local v0    # "annotatedFieldsByParameter":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "index":I
    .end local v4    # "numberOfUse":I
    .end local v5    # "usedIndices":[I
    :cond_df
    return-void
.end method
