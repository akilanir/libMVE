.class public Lorg/junit/runners/BlockJUnit4ClassRunner;
.super Lorg/junit/runners/ParentRunner;
.source "BlockJUnit4ClassRunner.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/runners/ParentRunner",
        "<",
        "Lorg/junit/runners/model/FrameworkMethod;",
        ">;"
    }
.end annotation


# instance fields
.field private final methodDescriptions:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
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
    .line 65
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;-><init>(Ljava/lang/Class;)V

    .line 58
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/junit/runners/BlockJUnit4ClassRunner;->methodDescriptions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 66
    return-void
.end method

.method private expectsException(Lorg/junit/Test;)Z
    .registers 3
    .param p1, "annotation"    # Lorg/junit/Test;

    .prologue
    .line 428
    invoke-direct {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getExpectedException(Lorg/junit/Test;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private getExpectedException(Lorg/junit/Test;)Ljava/lang/Class;
    .registers 4
    .param p1, "annotation"    # Lorg/junit/Test;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/Test;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 420
    if-eqz p1, :cond_a

    invoke-interface {p1}, Lorg/junit/Test;->expected()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/junit/Test$None;

    if-ne v0, v1, :cond_c

    .line 421
    :cond_a
    const/4 v0, 0x0

    .line 423
    :goto_b
    return-object v0

    :cond_c
    invoke-interface {p1}, Lorg/junit/Test;->expected()Ljava/lang/Class;

    move-result-object v0

    goto :goto_b
.end method

.method private getMethodRules(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/MethodRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 372
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->rules(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private getTimeout(Lorg/junit/Test;)J
    .registers 4
    .param p1, "annotation"    # Lorg/junit/Test;

    .prologue
    .line 432
    if-nez p1, :cond_5

    .line 433
    const-wide/16 v0, 0x0

    .line 435
    :goto_4
    return-wide v0

    :cond_5
    invoke-interface {p1}, Lorg/junit/Test;->timeout()J

    move-result-wide v0

    goto :goto_4
.end method

.method private hasOneConstructor()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 176
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    array-length v1, v1

    if-ne v1, v0, :cond_11

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private validateMethods(Ljava/util/List;)V
    .registers 4
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
    .line 200
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    sget-object v0, Lorg/junit/internal/runners/rules/RuleMemberValidator;->RULE_METHOD_VALIDATOR:Lorg/junit/internal/runners/rules/RuleMemberValidator;

    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/junit/internal/runners/rules/RuleMemberValidator;->validate(Lorg/junit/runners/model/TestClass;Ljava/util/List;)V

    .line 201
    return-void
.end method

.method private withMethodRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/util/List;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 8
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p3, "target"    # Ljava/lang/Object;
    .param p4, "result"    # Lorg/junit/runners/model/Statement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMethod;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;",
            "Ljava/lang/Object;",
            "Lorg/junit/runners/model/Statement;",
            ")",
            "Lorg/junit/runners/model/Statement;"
        }
    .end annotation

    .prologue
    .line 363
    .local p2, "testRules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-direct {p0, p3}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getMethodRules(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/rules/MethodRule;

    .line 364
    .local v0, "each":Lorg/junit/rules/MethodRule;
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 365
    invoke-interface {v0, p4, p1, p3}, Lorg/junit/rules/MethodRule;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;

    move-result-object p4

    goto :goto_8

    .line 368
    .end local v0    # "each":Lorg/junit/rules/MethodRule;
    :cond_1f
    return-object p4
.end method

.method private withRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 6
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 353
    invoke-virtual {p0, p2}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestRules(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 354
    .local v1, "testRules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    move-object v0, p3

    .line 355
    .local v0, "result":Lorg/junit/runners/model/Statement;
    invoke-direct {p0, p1, v1, p2, v0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withMethodRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/util/List;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 356
    invoke-direct {p0, p1, v1, v0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withTestRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/util/List;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 358
    return-object v0
.end method

.method private withTestRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/util/List;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 6
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p3, "statement"    # Lorg/junit/runners/model/Statement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMethod;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;",
            "Lorg/junit/runners/model/Statement;",
            ")",
            "Lorg/junit/runners/model/Statement;"
        }
    .end annotation

    .prologue
    .line 400
    .local p2, "testRules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    .end local p3    # "statement":Lorg/junit/runners/model/Statement;
    :goto_6
    return-object p3

    .restart local p3    # "statement":Lorg/junit/runners/model/Statement;
    :cond_7
    new-instance v0, Lorg/junit/rules/RunRules;

    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->describeChild(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runner/Description;

    move-result-object v1

    invoke-direct {v0, p3, p2, v1}, Lorg/junit/rules/RunRules;-><init>(Lorg/junit/runners/model/Statement;Ljava/lang/Iterable;Lorg/junit/runner/Description;)V

    move-object p3, v0

    goto :goto_6
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
    .line 124
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-super {p0, p1}, Lorg/junit/runners/ParentRunner;->collectInitializationErrors(Ljava/util/List;)V

    .line 126
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateNoNonStaticInnerClass(Ljava/util/List;)V

    .line 127
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateConstructor(Ljava/util/List;)V

    .line 128
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateInstanceMethods(Ljava/util/List;)V

    .line 129
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateFields(Ljava/util/List;)V

    .line 130
    invoke-direct {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateMethods(Ljava/util/List;)V

    .line 131
    return-void
.end method

.method protected computeTestMethods()Ljava/util/List;
    .registers 3
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
    .line 119
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v0

    const-class v1, Lorg/junit/Test;

    invoke-virtual {v0, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected createTest()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/runners/model/TestClass;->getOnlyConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic describeChild(Ljava/lang/Object;)Lorg/junit/runner/Description;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->describeChild(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

.method protected describeChild(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runner/Description;
    .registers 6
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 93
    iget-object v1, p0, Lorg/junit/runners/BlockJUnit4ClassRunner;->methodDescriptions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 95
    .local v0, "description":Lorg/junit/runner/Description;
    if-nez v0, :cond_23

    .line 96
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->testName(Lorg/junit/runners/model/FrameworkMethod;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 98
    iget-object v1, p0, Lorg/junit/runners/BlockJUnit4ClassRunner;->methodDescriptions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    :cond_23
    return-object v0
.end method

.method protected getChildren()Ljava/util/List;
    .registers 2
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
    .line 106
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->computeTestMethods()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getTestRules(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 410
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/Rule;

    const-class v3, Lorg/junit/rules/TestRule;

    invoke-virtual {v1, p1, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethodValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 413
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/Rule;

    const-class v3, Lorg/junit/rules/TestRule;

    invoke-virtual {v1, p1, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedFieldValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 416
    return-object v0
.end method

.method protected bridge synthetic isIgnored(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->isIgnored(Lorg/junit/runners/model/FrameworkMethod;)Z

    move-result v0

    return v0
.end method

.method protected isIgnored(Lorg/junit/runners/model/FrameworkMethod;)Z
    .registers 3
    .param p1, "child"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 88
    const-class v0, Lorg/junit/Ignore;

    invoke-virtual {p1, v0}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;
    .registers 6
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 263
    :try_start_0
    new-instance v3, Lorg/junit/runners/BlockJUnit4ClassRunner$1;

    invoke-direct {v3, p0}, Lorg/junit/runners/BlockJUnit4ClassRunner$1;-><init>(Lorg/junit/runners/BlockJUnit4ClassRunner;)V

    invoke-virtual {v3}, Lorg/junit/runners/BlockJUnit4ClassRunner$1;->run()Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_8} :catch_22

    move-result-object v2

    .line 273
    .local v2, "test":Ljava/lang/Object;
    invoke-virtual {p0, p1, v2}, Lorg/junit/runners/BlockJUnit4ClassRunner;->methodInvoker(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 274
    .local v1, "statement":Lorg/junit/runners/model/Statement;
    invoke-virtual {p0, p1, v2, v1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->possiblyExpectingExceptions(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 275
    invoke-virtual {p0, p1, v2, v1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withPotentialTimeout(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 276
    invoke-virtual {p0, p1, v2, v1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withBefores(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 277
    invoke-virtual {p0, p1, v2, v1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withAfters(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 278
    invoke-direct {p0, p1, v2, v1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->withRules(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 279
    .end local v1    # "statement":Lorg/junit/runners/model/Statement;
    .end local v2    # "test":Ljava/lang/Object;
    :goto_21
    return-object v1

    .line 269
    :catch_22
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lorg/junit/internal/runners/statements/Fail;

    invoke-direct {v1, v0}, Lorg/junit/internal/runners/statements/Fail;-><init>(Ljava/lang/Throwable;)V

    goto :goto_21
.end method

.method protected methodInvoker(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;
    .registers 4
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "test"    # Ljava/lang/Object;

    .prologue
    .line 290
    new-instance v0, Lorg/junit/internal/runners/statements/InvokeMethod;

    invoke-direct {v0, p1, p2}, Lorg/junit/internal/runners/statements/InvokeMethod;-><init>(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected possiblyExpectingExceptions(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 7
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "test"    # Ljava/lang/Object;
    .param p3, "next"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 301
    const-class v1, Lorg/junit/Test;

    invoke-virtual {p1, v1}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/Test;

    .line 302
    .local v0, "annotation":Lorg/junit/Test;
    invoke-direct {p0, v0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->expectsException(Lorg/junit/Test;)Z

    move-result v1

    if-eqz v1, :cond_18

    new-instance v1, Lorg/junit/internal/runners/statements/ExpectException;

    invoke-direct {p0, v0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getExpectedException(Lorg/junit/Test;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p3, v2}, Lorg/junit/internal/runners/statements/ExpectException;-><init>(Lorg/junit/runners/model/Statement;Ljava/lang/Class;)V

    move-object p3, v1

    .end local p3    # "next":Lorg/junit/runners/model/Statement;
    :cond_18
    return-object p3
.end method

.method protected rules(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/MethodRule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 381
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/Rule;

    const-class v3, Lorg/junit/rules/MethodRule;

    invoke-virtual {v1, p1, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethodValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 384
    .local v0, "rules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/MethodRule;>;"
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/Rule;

    const-class v3, Lorg/junit/rules/MethodRule;

    invoke-virtual {v1, p1, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedFieldValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 387
    return-object v0
.end method

.method protected bridge synthetic runChild(Ljava/lang/Object;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 57
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runners/BlockJUnit4ClassRunner;->runChild(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runner/notification/RunNotifier;)V

    return-void
.end method

.method protected runChild(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 5
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->describeChild(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 75
    .local v0, "description":Lorg/junit/runner/Description;
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->isIgnored(Lorg/junit/runners/model/FrameworkMethod;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 76
    invoke-virtual {p2, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V

    .line 80
    :goto_d
    return-void

    .line 78
    :cond_e
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    invoke-virtual {p0, v1, v0, p2}, Lorg/junit/runners/BlockJUnit4ClassRunner;->runLeaf(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;Lorg/junit/runner/notification/RunNotifier;)V

    goto :goto_d
.end method

.method protected testName(Lorg/junit/runners/model/FrameworkMethod;)Ljava/lang/String;
    .registers 3
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 225
    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v0

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
    .line 147
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateOnlyOneConstructor(Ljava/util/List;)V

    .line 148
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateZeroArgConstructor(Ljava/util/List;)V

    .line 149
    return-void
.end method

.method protected validateFields(Ljava/util/List;)V
    .registers 4
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
    .line 196
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    sget-object v0, Lorg/junit/internal/runners/rules/RuleMemberValidator;->RULE_VALIDATOR:Lorg/junit/internal/runners/rules/RuleMemberValidator;

    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/junit/internal/runners/rules/RuleMemberValidator;->validate(Lorg/junit/runners/model/TestClass;Ljava/util/List;)V

    .line 197
    return-void
.end method

.method protected validateInstanceMethods(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    const/4 v1, 0x0

    .line 186
    const-class v0, Lorg/junit/After;

    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V

    .line 187
    const-class v0, Lorg/junit/Before;

    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V

    .line 188
    invoke-virtual {p0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validateTestMethods(Ljava/util/List;)V

    .line 190
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->computeTestMethods()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_22

    .line 191
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "No runnable methods"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    :cond_22
    return-void
.end method

.method protected validateNoNonStaticInnerClass(Ljava/util/List;)V
    .registers 5
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
    .line 134
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->isANonStaticInnerClass()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The inner class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not static."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "gripe":Ljava/lang/String;
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .end local v0    # "gripe":Ljava/lang/String;
    :cond_33
    return-void
.end method

.method protected validateOnlyOneConstructor(Ljava/util/List;)V
    .registers 4
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
    .line 156
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->hasOneConstructor()Z

    move-result v1

    if-nez v1, :cond_10

    .line 157
    const-string v0, "Test class should have exactly one public constructor"

    .line 158
    .local v0, "gripe":Ljava/lang/String;
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .end local v0    # "gripe":Ljava/lang/String;
    :cond_10
    return-void
.end method

.method protected validateTestMethods(Ljava/util/List;)V
    .registers 4
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
    .line 208
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    const-class v0, Lorg/junit/Test;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;->validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V

    .line 209
    return-void
.end method

.method protected validateZeroArgConstructor(Ljava/util/List;)V
    .registers 4
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
    .line 167
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->isANonStaticInnerClass()Z

    move-result v1

    if-nez v1, :cond_29

    invoke-direct {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->hasOneConstructor()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->getOnlyConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v1, v1

    if-eqz v1, :cond_29

    .line 170
    const-string v0, "Test class should have exactly one public zero-argument constructor"

    .line 171
    .local v0, "gripe":Ljava/lang/String;
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    .end local v0    # "gripe":Ljava/lang/String;
    :cond_29
    return-void
.end method

.method protected withAfters(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 7
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 345
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/After;

    invoke-virtual {v1, v2}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 347
    .local v0, "afters":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    .end local p3    # "statement":Lorg/junit/runners/model/Statement;
    :goto_10
    return-object p3

    .restart local p3    # "statement":Lorg/junit/runners/model/Statement;
    :cond_11
    new-instance v1, Lorg/junit/internal/runners/statements/RunAfters;

    invoke-direct {v1, p3, v0, p2}, Lorg/junit/internal/runners/statements/RunAfters;-><init>(Lorg/junit/runners/model/Statement;Ljava/util/List;Ljava/lang/Object;)V

    move-object p3, v1

    goto :goto_10
.end method

.method protected withBefores(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 7
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 330
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    const-class v2, Lorg/junit/Before;

    invoke-virtual {v1, v2}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 332
    .local v0, "befores":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    .end local p3    # "statement":Lorg/junit/runners/model/Statement;
    :goto_10
    return-object p3

    .restart local p3    # "statement":Lorg/junit/runners/model/Statement;
    :cond_11
    new-instance v1, Lorg/junit/internal/runners/statements/RunBefores;

    invoke-direct {v1, p3, v0, p2}, Lorg/junit/internal/runners/statements/RunBefores;-><init>(Lorg/junit/runners/model/Statement;Ljava/util/List;Ljava/lang/Object;)V

    move-object p3, v1

    goto :goto_10
.end method

.method protected withPotentialTimeout(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 8
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "test"    # Ljava/lang/Object;
    .param p3, "next"    # Lorg/junit/runners/model/Statement;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 314
    const-class v2, Lorg/junit/Test;

    invoke-virtual {p1, v2}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lorg/junit/Test;

    invoke-direct {p0, v2}, Lorg/junit/runners/BlockJUnit4ClassRunner;->getTimeout(Lorg/junit/Test;)J

    move-result-wide v0

    .line 315
    .local v0, "timeout":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_13

    .line 318
    .end local p3    # "next":Lorg/junit/runners/model/Statement;
    :goto_12
    return-object p3

    .restart local p3    # "next":Lorg/junit/runners/model/Statement;
    :cond_13
    invoke-static {}, Lorg/junit/internal/runners/statements/FailOnTimeout;->builder()Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1, v3}, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->withTimeout(JLjava/util/concurrent/TimeUnit;)Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;

    move-result-object v2

    invoke-virtual {v2, p3}, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->build(Lorg/junit/runners/model/Statement;)Lorg/junit/internal/runners/statements/FailOnTimeout;

    move-result-object p3

    goto :goto_12
.end method
