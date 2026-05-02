.class public Lorg/junit/runners/Parameterized;
.super Lorg/junit/runners/Suite;
.source "Parameterized.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runners/Parameterized$UseParametersRunnerFactory;,
        Lorg/junit/runners/Parameterized$Parameter;,
        Lorg/junit/runners/Parameterized$Parameters;
    }
.end annotation


# static fields
.field private static final DEFAULT_FACTORY:Lorg/junit/runners/parameterized/ParametersRunnerFactory;

.field private static final NO_RUNNERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final runners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 233
    new-instance v0, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParametersFactory;

    invoke-direct {v0}, Lorg/junit/runners/parameterized/BlockJUnit4ClassRunnerWithParametersFactory;-><init>()V

    sput-object v0, Lorg/junit/runners/Parameterized;->DEFAULT_FACTORY:Lorg/junit/runners/parameterized/ParametersRunnerFactory;

    .line 235
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/junit/runners/Parameterized;->NO_RUNNERS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 243
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Lorg/junit/runners/Parameterized;->NO_RUNNERS:Ljava/util/List;

    invoke-direct {p0, p1, v2}, Lorg/junit/runners/Suite;-><init>(Ljava/lang/Class;Ljava/util/List;)V

    .line 244
    invoke-direct {p0, p1}, Lorg/junit/runners/Parameterized;->getParametersRunnerFactory(Ljava/lang/Class;)Lorg/junit/runners/parameterized/ParametersRunnerFactory;

    move-result-object v1

    .line 246
    .local v1, "runnerFactory":Lorg/junit/runners/parameterized/ParametersRunnerFactory;
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->getParametersMethod()Lorg/junit/runners/model/FrameworkMethod;

    move-result-object v2

    const-class v3, Lorg/junit/runners/Parameterized$Parameters;

    invoke-virtual {v2, v3}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/Parameterized$Parameters;

    .line 248
    .local v0, "parameters":Lorg/junit/runners/Parameterized$Parameters;
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->allParameters()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v0}, Lorg/junit/runners/Parameterized$Parameters;->name()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3, v1}, Lorg/junit/runners/Parameterized;->createRunnersForParameters(Ljava/lang/Iterable;Ljava/lang/String;Lorg/junit/runners/parameterized/ParametersRunnerFactory;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lorg/junit/runners/Parameterized;->runners:Ljava/util/List;

    .line 250
    return-void
.end method

.method private allParameters()Ljava/lang/Iterable;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 280
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->getParametersMethod()Lorg/junit/runners/model/FrameworkMethod;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 281
    .local v0, "parameters":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/Iterable;

    if-eqz v1, :cond_13

    .line 282
    check-cast v0, Ljava/lang/Iterable;

    .line 284
    .end local v0    # "parameters":Ljava/lang/Object;
    :goto_12
    return-object v0

    .line 283
    .restart local v0    # "parameters":Ljava/lang/Object;
    :cond_13
    instance-of v1, v0, [Ljava/lang/Object;

    if-eqz v1, :cond_20

    .line 284
    check-cast v0, [Ljava/lang/Object;

    .end local v0    # "parameters":Ljava/lang/Object;
    check-cast v0, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_12

    .line 286
    .restart local v0    # "parameters":Ljava/lang/Object;
    :cond_20
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->parametersMethodReturnedWrongType()Ljava/lang/Exception;

    move-result-object v1

    throw v1
.end method

.method private createRunnersForParameters(Ljava/lang/Iterable;Ljava/lang/String;Lorg/junit/runners/parameterized/ParametersRunnerFactory;)Ljava/util/List;
    .registers 10
    .param p2, "namePattern"    # Ljava/lang/String;
    .param p3, "runnerFactory"    # Lorg/junit/runners/parameterized/ParametersRunnerFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/junit/runners/parameterized/ParametersRunnerFactory;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 309
    .local p1, "allParameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Object;>;"
    :try_start_0
    invoke-direct {p0, p1, p2}, Lorg/junit/runners/Parameterized;->createTestsForParameters(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 311
    .local v4, "tests":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/parameterized/TestWithParameters;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 312
    .local v2, "runners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Runner;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/junit/runners/parameterized/TestWithParameters;

    .line 313
    .local v3, "test":Lorg/junit/runners/parameterized/TestWithParameters;
    invoke-interface {p3, v3}, Lorg/junit/runners/parameterized/ParametersRunnerFactory;->createRunnerForTestWithParameters(Lorg/junit/runners/parameterized/TestWithParameters;)Lorg/junit/runner/Runner;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_20
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_20} :catch_21

    goto :goto_d

    .line 317
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "runners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Runner;>;"
    .end local v3    # "test":Lorg/junit/runners/parameterized/TestWithParameters;
    .end local v4    # "tests":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/parameterized/TestWithParameters;>;"
    :catch_21
    move-exception v0

    .line 318
    .local v0, "e":Ljava/lang/ClassCastException;
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->parametersMethodReturnedWrongType()Ljava/lang/Exception;

    move-result-object v5

    throw v5

    .line 316
    .end local v0    # "e":Ljava/lang/ClassCastException;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "runners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Runner;>;"
    .restart local v4    # "tests":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/parameterized/TestWithParameters;>;"
    :cond_27
    return-object v2
.end method

.method private createTestWithNotNormalizedParameters(Ljava/lang/String;ILjava/lang/Object;)Lorg/junit/runners/parameterized/TestWithParameters;
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "parametersOrSingleParameter"    # Ljava/lang/Object;

    .prologue
    .line 272
    instance-of v1, p3, [Ljava/lang/Object;

    if-eqz v1, :cond_12

    check-cast p3, [Ljava/lang/Object;

    .end local p3    # "parametersOrSingleParameter":Ljava/lang/Object;
    check-cast p3, [Ljava/lang/Object;

    move-object v0, p3

    .line 274
    .local v0, "parameters":[Ljava/lang/Object;
    :goto_9
    invoke-virtual {p0}, Lorg/junit/runners/Parameterized;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-static {v1, p1, p2, v0}, Lorg/junit/runners/Parameterized;->createTestWithParameters(Lorg/junit/runners/model/TestClass;Ljava/lang/String;I[Ljava/lang/Object;)Lorg/junit/runners/parameterized/TestWithParameters;

    move-result-object v1

    return-object v1

    .line 272
    .end local v0    # "parameters":[Ljava/lang/Object;
    .restart local p3    # "parametersOrSingleParameter":Ljava/lang/Object;
    :cond_12
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    goto :goto_9
.end method

.method private static createTestWithParameters(Lorg/junit/runners/model/TestClass;Ljava/lang/String;I[Ljava/lang/Object;)Lorg/junit/runners/parameterized/TestWithParameters;
    .registers 9
    .param p0, "testClass"    # Lorg/junit/runners/model/TestClass;
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 345
    const-string v2, "\\{index\\}"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 347
    .local v0, "finalPattern":Ljava/lang/String;
    invoke-static {v0, p3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 348
    .local v1, "name":Ljava/lang/String;
    new-instance v2, Lorg/junit/runners/parameterized/TestWithParameters;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v2, v3, p0, v4}, Lorg/junit/runners/parameterized/TestWithParameters;-><init>(Ljava/lang/String;Lorg/junit/runners/model/TestClass;Ljava/util/List;)V

    return-object v2
.end method

.method private createTestsForParameters(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p2, "namePattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/parameterized/TestWithParameters;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 325
    .local p1, "allParameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 326
    .local v1, "i":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 327
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/parameterized/TestWithParameters;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 328
    .local v4, "parametersOfSingleTest":Ljava/lang/Object;
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-direct {p0, p2, v1, v4}, Lorg/junit/runners/Parameterized;->createTestWithNotNormalizedParameters(Ljava/lang/String;ILjava/lang/Object;)Lorg/junit/runners/parameterized/TestWithParameters;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_a

    .line 331
    .end local v4    # "parametersOfSingleTest":Ljava/lang/Object;
    :cond_1f
    return-object v0
.end method

.method private getParametersMethod()Lorg/junit/runners/model/FrameworkMethod;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 291
    invoke-virtual {p0}, Lorg/junit/runners/Parameterized;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v3

    const-class v4, Lorg/junit/runners/Parameterized$Parameters;

    invoke-virtual {v3, v4}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 293
    .local v2, "methods":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/model/FrameworkMethod;

    .line 294
    .local v0, "each":Lorg/junit/runners/model/FrameworkMethod;
    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod;->isStatic()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod;->isPublic()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 295
    return-object v0

    .line 299
    .end local v0    # "each":Lorg/junit/runners/model/FrameworkMethod;
    :cond_27
    new-instance v3, Ljava/lang/Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No public static parameters method on class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/junit/runners/Parameterized;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v5

    invoke-virtual {v5}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private getParametersRunnerFactory(Ljava/lang/Class;)Lorg/junit/runners/parameterized/ParametersRunnerFactory;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runners/parameterized/ParametersRunnerFactory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 254
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/junit/runners/Parameterized$UseParametersRunnerFactory;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/Parameterized$UseParametersRunnerFactory;

    .line 256
    .local v0, "annotation":Lorg/junit/runners/Parameterized$UseParametersRunnerFactory;
    if-nez v0, :cond_d

    .line 257
    sget-object v2, Lorg/junit/runners/Parameterized;->DEFAULT_FACTORY:Lorg/junit/runners/parameterized/ParametersRunnerFactory;

    .line 261
    :goto_c
    return-object v2

    .line 259
    :cond_d
    invoke-interface {v0}, Lorg/junit/runners/Parameterized$UseParametersRunnerFactory;->value()Ljava/lang/Class;

    move-result-object v1

    .line 261
    .local v1, "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/runners/parameterized/ParametersRunnerFactory;>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/junit/runners/parameterized/ParametersRunnerFactory;

    goto :goto_c
.end method

.method private parametersMethodReturnedWrongType()Ljava/lang/Exception;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 335
    invoke-virtual {p0}, Lorg/junit/runners/Parameterized;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v3

    invoke-virtual {v3}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "className":Ljava/lang/String;
    invoke-direct {p0}, Lorg/junit/runners/Parameterized;->getParametersMethod()Lorg/junit/runners/model/FrameworkMethod;

    move-result-object v3

    invoke-virtual {v3}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v2

    .line 337
    .local v2, "methodName":Ljava/lang/String;
    const-string v3, "{0}.{1}() must return an Iterable of arrays."

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 340
    .local v1, "message":Ljava/lang/String;
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-object v3
.end method


# virtual methods
.method protected getChildren()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    iget-object v0, p0, Lorg/junit/runners/Parameterized;->runners:Ljava/util/List;

    return-object v0
.end method
