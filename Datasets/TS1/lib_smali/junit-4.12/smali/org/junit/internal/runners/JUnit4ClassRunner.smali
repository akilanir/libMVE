.class public Lorg/junit/internal/runners/JUnit4ClassRunner;
.super Lorg/junit/runner/Runner;
.source "JUnit4ClassRunner.java"

# interfaces
.implements Lorg/junit/runner/manipulation/Filterable;
.implements Lorg/junit/runner/manipulation/Sortable;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private testClass:Lorg/junit/internal/runners/TestClass;

.field private final testMethods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
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
            Lorg/junit/internal/runners/InitializationError;
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 33
    new-instance v0, Lorg/junit/internal/runners/TestClass;

    invoke-direct {v0, p1}, Lorg/junit/internal/runners/TestClass;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 34
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestMethods()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 35
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->validate()V

    .line 36
    return-void
.end method

.method private testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .param p3, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 103
    invoke-virtual {p1, p2}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 104
    new-instance v0, Lorg/junit/runner/notification/Failure;

    invoke-direct {v0, p2, p3}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {p1, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 105
    invoke-virtual {p1, p2}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 106
    return-void
.end method


# virtual methods
.method protected classAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

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
    .line 82
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public filter(Lorg/junit/runner/manipulation/Filter;)V
    .registers 5
    .param p1, "filter"    # Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v2, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/reflect/Method;>;"
    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 126
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    .line 127
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {p0, v1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/junit/runner/manipulation/Filter;->shouldRun(Lorg/junit/runner/Description;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 128
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6

    .line 131
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_20
    iget-object v2, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 132
    new-instance v2, Lorg/junit/runner/manipulation/NoTestsRemainException;

    invoke-direct {v2}, Lorg/junit/runner/manipulation/NoTestsRemainException;-><init>()V

    throw v2

    .line 134
    :cond_2e
    return-void
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .registers 7

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->classAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v2

    .line 66
    .local v2, "spec":Lorg/junit/runner/Description;
    iget-object v3, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 67
    .local v3, "testMethods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    .line 68
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {p0, v1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    goto :goto_12

    .line 70
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_26
    return-object v2
.end method

.method protected getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTestClass()Lorg/junit/internal/runners/TestClass;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    return-object v0
.end method

.method protected getTestMethods()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getTestMethods()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected invokeTestMethod(Ljava/lang/reflect/Method;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 8
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 86
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 89
    .local v0, "description":Lorg/junit/runner/Description;
    :try_start_4
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->createTest()Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_7} :catch_15
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_1e

    move-result-object v2

    .line 97
    .local v2, "test":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->wrapMethod(Ljava/lang/reflect/Method;)Lorg/junit/internal/runners/TestMethod;

    move-result-object v3

    .line 98
    .local v3, "testMethod":Lorg/junit/internal/runners/TestMethod;
    new-instance v4, Lorg/junit/internal/runners/MethodRoadie;

    invoke-direct {v4, v2, v3, p2, v0}, Lorg/junit/internal/runners/MethodRoadie;-><init>(Ljava/lang/Object;Lorg/junit/internal/runners/TestMethod;Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    invoke-virtual {v4}, Lorg/junit/internal/runners/MethodRoadie;->run()V

    .line 99
    .end local v2    # "test":Ljava/lang/Object;
    .end local v3    # "testMethod":Lorg/junit/internal/runners/TestMethod;
    :goto_14
    return-void

    .line 90
    :catch_15
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-direct {p0, p2, v0, v4}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    goto :goto_14

    .line 93
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1e
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/Exception;
    invoke-direct {p0, p2, v0, v1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    goto :goto_14
.end method

.method protected methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;
    .registers 5
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testName(Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAnnotations(Ljava/lang/reflect/Method;)[Ljava/lang/annotation/Annotation;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 6
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 50
    new-instance v0, Lorg/junit/internal/runners/ClassRoadie;

    iget-object v1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v2

    new-instance v3, Lorg/junit/internal/runners/JUnit4ClassRunner$1;

    invoke-direct {v3, p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner$1;-><init>(Lorg/junit/internal/runners/JUnit4ClassRunner;Lorg/junit/runner/notification/RunNotifier;)V

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/junit/internal/runners/ClassRoadie;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/internal/runners/TestClass;Lorg/junit/runner/Description;Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lorg/junit/internal/runners/ClassRoadie;->runProtected()V

    .line 55
    return-void
.end method

.method protected runMethods(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 5
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 58
    iget-object v2, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    .line 59
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {p0, v1, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->invokeTestMethod(Ljava/lang/reflect/Method;Lorg/junit/runner/notification/RunNotifier;)V

    goto :goto_6

    .line 61
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_16
    return-void
.end method

.method public sort(Lorg/junit/runner/manipulation/Sorter;)V
    .registers 4
    .param p1, "sorter"    # Lorg/junit/runner/manipulation/Sorter;

    .prologue
    .line 137
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    new-instance v1, Lorg/junit/internal/runners/JUnit4ClassRunner$2;

    invoke-direct {v1, p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner$2;-><init>(Lorg/junit/internal/runners/JUnit4ClassRunner;Lorg/junit/runner/manipulation/Sorter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 142
    return-void
.end method

.method protected testAnnotations(Ljava/lang/reflect/Method;)[Ljava/lang/annotation/Annotation;
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 121
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method protected testName(Ljava/lang/reflect/Method;)Ljava/lang/String;
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 113
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected validate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/runners/InitializationError;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Lorg/junit/internal/runners/MethodValidator;

    iget-object v1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-direct {v0, v1}, Lorg/junit/internal/runners/MethodValidator;-><init>(Lorg/junit/internal/runners/TestClass;)V

    .line 44
    .local v0, "methodValidator":Lorg/junit/internal/runners/MethodValidator;
    invoke-virtual {v0}, Lorg/junit/internal/runners/MethodValidator;->validateMethodsForDefaultRunner()Ljava/util/List;

    .line 45
    invoke-virtual {v0}, Lorg/junit/internal/runners/MethodValidator;->assertValid()V

    .line 46
    return-void
.end method

.method protected wrapMethod(Ljava/lang/reflect/Method;)Lorg/junit/internal/runners/TestMethod;
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 109
    new-instance v0, Lorg/junit/internal/runners/TestMethod;

    iget-object v1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-direct {v0, p1, v1}, Lorg/junit/internal/runners/TestMethod;-><init>(Ljava/lang/reflect/Method;Lorg/junit/internal/runners/TestClass;)V

    return-object v0
.end method
