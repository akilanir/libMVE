.class public abstract Lorg/junit/runners/ParentRunner;
.super Lorg/junit/runner/Runner;
.source "ParentRunner.java"

# interfaces
.implements Lorg/junit/runner/manipulation/Filterable;
.implements Lorg/junit/runner/manipulation/Sortable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/junit/runner/Runner;",
        "Lorg/junit/runner/manipulation/Filterable;",
        "Lorg/junit/runner/manipulation/Sortable;"
    }
.end annotation


# static fields
.field private static final VALIDATORS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/validator/TestClassValidator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final childrenLock:Ljava/lang/Object;

.field private volatile filteredChildren:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile scheduler:Lorg/junit/runners/model/RunnerScheduler;

.field private final testClass:Lorg/junit/runners/model/TestClass;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/junit/validator/TestClassValidator;

    const/4 v1, 0x0

    new-instance v2, Lorg/junit/validator/AnnotationsValidator;

    invoke-direct {v2}, Lorg/junit/validator/AnnotationsValidator;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lorg/junit/validator/PublicClassValidator;

    invoke-direct {v2}, Lorg/junit/validator/PublicClassValidator;-><init>()V

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/junit/runners/ParentRunner;->VALIDATORS:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
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
    .line 82
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/junit/runners/ParentRunner;->childrenLock:Ljava/lang/Object;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    .line 69
    new-instance v0, Lorg/junit/runners/ParentRunner$1;

    invoke-direct {v0, p0}, Lorg/junit/runners/ParentRunner$1;-><init>(Lorg/junit/runners/ParentRunner;)V

    iput-object v0, p0, Lorg/junit/runners/ParentRunner;->scheduler:Lorg/junit/runners/model/RunnerScheduler;

    .line 83
    invoke-virtual {p0, p1}, Lorg/junit/runners/ParentRunner;->createTestClass(Ljava/lang/Class;)Lorg/junit/runners/model/TestClass;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    .line 84
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->validate()V

    .line 85
    return-void
.end method

.method static synthetic access$000(Lorg/junit/runners/ParentRunner;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 2
    .param p0, "x0"    # Lorg/junit/runners/ParentRunner;
    .param p1, "x1"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;->runChildren(Lorg/junit/runner/notification/RunNotifier;)V

    return-void
.end method

.method private applyValidators(Ljava/util/List;)V
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
    .line 132
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_28

    .line 133
    sget-object v2, Lorg/junit/runners/ParentRunner;->VALIDATORS:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/validator/TestClassValidator;

    .line 134
    .local v0, "each":Lorg/junit/validator/TestClassValidator;
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/junit/validator/TestClassValidator;->validateTestClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_10

    .line 137
    .end local v0    # "each":Lorg/junit/validator/TestClassValidator;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_28
    return-void
.end method

.method private areAllChildrenIgnored()Z
    .registers 4

    .prologue
    .line 200
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 201
    .local v0, "child":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lorg/junit/runners/ParentRunner;->isIgnored(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 202
    const/4 v2, 0x0

    .line 205
    .end local v0    # "child":Ljava/lang/Object;, "TT;"
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x1

    goto :goto_19
.end method

.method private comparator(Lorg/junit/runner/manipulation/Sorter;)Ljava/util/Comparator;
    .registers 3
    .param p1, "sorter"    # Lorg/junit/runner/manipulation/Sorter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/manipulation/Sorter;",
            ")",
            "Ljava/util/Comparator",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 438
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    new-instance v0, Lorg/junit/runners/ParentRunner$4;

    invoke-direct {v0, p0, p1}, Lorg/junit/runners/ParentRunner$4;-><init>(Lorg/junit/runners/ParentRunner;Lorg/junit/runner/manipulation/Sorter;)V

    return-object v0
.end method

.method private getFilteredChildren()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 423
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    if-nez v0, :cond_16

    .line 424
    iget-object v1, p0, Lorg/junit/runners/ParentRunner;->childrenLock:Ljava/lang/Object;

    monitor-enter v1

    .line 425
    :try_start_7
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    if-nez v0, :cond_15

    .line 426
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    .line 428
    :cond_15
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_19

    .line 430
    :cond_16
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    return-object v0

    .line 428
    :catchall_19
    move-exception v0

    :try_start_1a
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v0
.end method

.method private runChildren(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 6
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 285
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->scheduler:Lorg/junit/runners/model/RunnerScheduler;

    .line 287
    .local v0, "currentScheduler":Lorg/junit/runners/model/RunnerScheduler;
    :try_start_2
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 288
    .local v1, "each":Ljava/lang/Object;, "TT;"
    new-instance v3, Lorg/junit/runners/ParentRunner$3;

    invoke-direct {v3, p0, v1, p1}, Lorg/junit/runners/ParentRunner$3;-><init>(Lorg/junit/runners/ParentRunner;Ljava/lang/Object;Lorg/junit/runner/notification/RunNotifier;)V

    invoke-interface {v0, v3}, Lorg/junit/runners/model/RunnerScheduler;->schedule(Ljava/lang/Runnable;)V
    :try_end_1c
    .catchall {:try_start_2 .. :try_end_1c} :catchall_1d

    goto :goto_a

    .line 295
    .end local v1    # "each":Ljava/lang/Object;, "TT;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_1d
    move-exception v3

    invoke-interface {v0}, Lorg/junit/runners/model/RunnerScheduler;->finished()V

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_22
    invoke-interface {v0}, Lorg/junit/runners/model/RunnerScheduler;->finished()V

    .line 297
    return-void
.end method

.method private shouldRun(Lorg/junit/runner/manipulation/Filter;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "filter"    # Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/manipulation/Filter;",
            "TT;)Z"
        }
    .end annotation

    .prologue
    .line 434
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p2, "each":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p2}, Lorg/junit/runners/ParentRunner;->describeChild(Ljava/lang/Object;)Lorg/junit/runner/Description;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/junit/runner/manipulation/Filter;->shouldRun(Lorg/junit/runner/Description;)Z

    move-result v0

    return v0
.end method

.method private validate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 415
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 416
    .local v0, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, v0}, Lorg/junit/runners/ParentRunner;->collectInitializationErrors(Ljava/util/List;)V

    .line 417
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    .line 418
    new-instance v1, Lorg/junit/runners/model/InitializationError;

    invoke-direct {v1, v0}, Lorg/junit/runners/model/InitializationError;-><init>(Ljava/util/List;)V

    throw v1

    .line 420
    :cond_14
    return-void
.end method

.method private validateClassRules(Ljava/util/List;)V
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
    .line 160
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    sget-object v0, Lorg/junit/internal/runners/rules/RuleMemberValidator;->CLASS_RULE_VALIDATOR:Lorg/junit/internal/runners/rules/RuleMemberValidator;

    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/junit/internal/runners/rules/RuleMemberValidator;->validate(Lorg/junit/runners/model/TestClass;Ljava/util/List;)V

    .line 161
    sget-object v0, Lorg/junit/internal/runners/rules/RuleMemberValidator;->CLASS_RULE_METHOD_VALIDATOR:Lorg/junit/internal/runners/rules/RuleMemberValidator;

    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/junit/internal/runners/rules/RuleMemberValidator;->validate(Lorg/junit/runners/model/TestClass;Ljava/util/List;)V

    .line 162
    return-void
.end method

.method private withClassRules(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 5
    .param p1, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 244
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->classRules()Ljava/util/List;

    move-result-object v0

    .line 245
    .local v0, "classRules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    .end local p1    # "statement":Lorg/junit/runners/model/Statement;
    :goto_a
    return-object p1

    .restart local p1    # "statement":Lorg/junit/runners/model/Statement;
    :cond_b
    new-instance v1, Lorg/junit/rules/RunRules;

    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v2

    invoke-direct {v1, p1, v0, v2}, Lorg/junit/rules/RunRules;-><init>(Lorg/junit/runners/model/Statement;Ljava/lang/Iterable;Lorg/junit/runner/Description;)V

    move-object p1, v1

    goto :goto_a
.end method


# virtual methods
.method protected childrenInvoker(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;
    .registers 3
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 265
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    new-instance v0, Lorg/junit/runners/ParentRunner$2;

    invoke-direct {v0, p0, p1}, Lorg/junit/runners/ParentRunner$2;-><init>(Lorg/junit/runners/ParentRunner;Lorg/junit/runner/notification/RunNotifier;)V

    return-object v0
.end method

.method protected classBlock(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;
    .registers 4
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 190
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    invoke-virtual {p0, p1}, Lorg/junit/runners/ParentRunner;->childrenInvoker(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 191
    .local v0, "statement":Lorg/junit/runners/model/Statement;
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->areAllChildrenIgnored()Z

    move-result v1

    if-nez v1, :cond_16

    .line 192
    invoke-virtual {p0, v0}, Lorg/junit/runners/ParentRunner;->withBeforeClasses(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 193
    invoke-virtual {p0, v0}, Lorg/junit/runners/ParentRunner;->withAfterClasses(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 194
    invoke-direct {p0, v0}, Lorg/junit/runners/ParentRunner;->withClassRules(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    .line 196
    :cond_16
    return-object v0
.end method

.method protected classRules()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    const/4 v4, 0x0

    .line 254
    iget-object v1, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    const-class v2, Lorg/junit/ClassRule;

    const-class v3, Lorg/junit/rules/TestRule;

    invoke-virtual {v1, v4, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethodValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 255
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    iget-object v1, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    const-class v2, Lorg/junit/ClassRule;

    const-class v3, Lorg/junit/rules/TestRule;

    invoke-virtual {v1, v4, v2, v3}, Lorg/junit/runners/model/TestClass;->getAnnotatedFieldValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 256
    return-object v0
.end method

.method protected collectInitializationErrors(Ljava/util/List;)V
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
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    const/4 v1, 0x1

    .line 125
    const-class v0, Lorg/junit/BeforeClass;

    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/runners/ParentRunner;->validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V

    .line 126
    const-class v0, Lorg/junit/AfterClass;

    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/runners/ParentRunner;->validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V

    .line 127
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;->validateClassRules(Ljava/util/List;)V

    .line 128
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;->applyValidators(Ljava/util/List;)V

    .line 129
    return-void
.end method

.method protected createTestClass(Ljava/lang/Class;)Lorg/junit/runners/model/TestClass;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runners/model/TestClass;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runners/model/TestClass;

    invoke-direct {v0, p1}, Lorg/junit/runners/model/TestClass;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method protected abstract describeChild(Ljava/lang/Object;)Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/junit/runner/Description;"
        }
    .end annotation
.end method

.method public filter(Lorg/junit/runner/manipulation/Filter;)V
    .registers 8
    .param p1, "filter"    # Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 378
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v5, p0, Lorg/junit/runners/ParentRunner;->childrenLock:Ljava/lang/Object;

    monitor-enter v5

    .line 379
    :try_start_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 380
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 381
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 382
    .local v2, "each":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, v2}, Lorg/junit/runners/ParentRunner;->shouldRun(Lorg/junit/runner/manipulation/Filter;Ljava/lang/Object;)Z
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_29

    move-result v4

    if-eqz v4, :cond_2c

    .line 384
    :try_start_20
    invoke-virtual {p1, v2}, Lorg/junit/runner/manipulation/Filter;->apply(Ljava/lang/Object;)V
    :try_end_23
    .catch Lorg/junit/runner/manipulation/NoTestsRemainException; {:try_start_20 .. :try_end_23} :catch_24
    .catchall {:try_start_20 .. :try_end_23} :catchall_29

    goto :goto_10

    .line 385
    :catch_24
    move-exception v1

    .line 386
    .local v1, "e":Lorg/junit/runner/manipulation/NoTestsRemainException;
    :try_start_25
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_10

    .line 396
    .end local v0    # "children":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .end local v1    # "e":Lorg/junit/runner/manipulation/NoTestsRemainException;
    .end local v2    # "each":Ljava/lang/Object;, "TT;"
    .end local v3    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :catchall_29
    move-exception v4

    monitor-exit v5
    :try_end_2b
    .catchall {:try_start_25 .. :try_end_2b} :catchall_29

    throw v4

    .line 389
    .restart local v0    # "children":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .restart local v2    # "each":Ljava/lang/Object;, "TT;"
    .restart local v3    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    :cond_2c
    :try_start_2c
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_10

    .line 392
    .end local v2    # "each":Ljava/lang/Object;, "TT;"
    :cond_30
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v4

    iput-object v4, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    .line 393
    iget-object v4, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_44

    .line 394
    new-instance v4, Lorg/junit/runner/manipulation/NoTestsRemainException;

    invoke-direct {v4}, Lorg/junit/runner/manipulation/NoTestsRemainException;-><init>()V

    throw v4

    .line 396
    :cond_44
    monitor-exit v5
    :try_end_45
    .catchall {:try_start_2c .. :try_end_45} :catchall_29

    .line 397
    return-void
.end method

.method protected abstract getChildren()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .registers 6

    .prologue
    .line 349
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getRunnerAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v1

    .line 351
    .local v1, "description":Lorg/junit/runner/Description;
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 352
    .local v0, "child":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lorg/junit/runners/ParentRunner;->describeChild(Ljava/lang/Object;)Lorg/junit/runner/Description;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    goto :goto_14

    .line 354
    .end local v0    # "child":Ljava/lang/Object;, "TT;"
    :cond_26
    return-object v1
.end method

.method protected getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 303
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    invoke-virtual {v0}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getRunnerAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 340
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    invoke-virtual {v0}, Lorg/junit/runners/model/TestClass;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public final getTestClass()Lorg/junit/runners/model/TestClass;
    .registers 2

    .prologue
    .line 314
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    return-object v0
.end method

.method protected isIgnored(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 281
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "child":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    return v0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 6
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 359
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    new-instance v2, Lorg/junit/internal/runners/model/EachTestNotifier;

    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lorg/junit/internal/runners/model/EachTestNotifier;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 362
    .local v2, "testNotifier":Lorg/junit/internal/runners/model/EachTestNotifier;
    :try_start_9
    invoke-virtual {p0, p1}, Lorg/junit/runners/ParentRunner;->classBlock(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    .line 363
    .local v1, "statement":Lorg/junit/runners/model/Statement;
    invoke-virtual {v1}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_10
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_9 .. :try_end_10} :catch_11
    .catch Lorg/junit/runner/notification/StoppedByUserException; {:try_start_9 .. :try_end_10} :catch_16
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_10} :catch_18

    .line 371
    .end local v1    # "statement":Lorg/junit/runners/model/Statement;
    :goto_10
    return-void

    .line 364
    :catch_11
    move-exception v0

    .line 365
    .local v0, "e":Lorg/junit/internal/AssumptionViolatedException;
    invoke-virtual {v2, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailedAssumption(Lorg/junit/internal/AssumptionViolatedException;)V

    goto :goto_10

    .line 366
    .end local v0    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_16
    move-exception v0

    .line 367
    .local v0, "e":Lorg/junit/runner/notification/StoppedByUserException;
    throw v0

    .line 368
    .end local v0    # "e":Lorg/junit/runner/notification/StoppedByUserException;
    :catch_18
    move-exception v0

    .line 369
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v2, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_10
.end method

.method protected abstract runChild(Ljava/lang/Object;Lorg/junit/runner/notification/RunNotifier;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/junit/runner/notification/RunNotifier;",
            ")V"
        }
    .end annotation
.end method

.method protected final runLeaf(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 7
    .param p1, "statement"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .param p3, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 322
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    new-instance v1, Lorg/junit/internal/runners/model/EachTestNotifier;

    invoke-direct {v1, p3, p2}, Lorg/junit/internal/runners/model/EachTestNotifier;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 323
    .local v1, "eachNotifier":Lorg/junit/internal/runners/model/EachTestNotifier;
    invoke-virtual {v1}, Lorg/junit/internal/runners/model/EachTestNotifier;->fireTestStarted()V

    .line 325
    :try_start_8
    invoke-virtual {p1}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_b
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_8 .. :try_end_b} :catch_f
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_b} :catch_17
    .catchall {:try_start_8 .. :try_end_b} :catchall_1f

    .line 331
    invoke-virtual {v1}, Lorg/junit/internal/runners/model/EachTestNotifier;->fireTestFinished()V

    .line 333
    :goto_e
    return-void

    .line 326
    :catch_f
    move-exception v0

    .line 327
    .local v0, "e":Lorg/junit/internal/AssumptionViolatedException;
    :try_start_10
    invoke-virtual {v1, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailedAssumption(Lorg/junit/internal/AssumptionViolatedException;)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_1f

    .line 331
    invoke-virtual {v1}, Lorg/junit/internal/runners/model/EachTestNotifier;->fireTestFinished()V

    goto :goto_e

    .line 328
    .end local v0    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_17
    move-exception v0

    .line 329
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_18
    invoke-virtual {v1, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailure(Ljava/lang/Throwable;)V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_1f

    .line 331
    invoke-virtual {v1}, Lorg/junit/internal/runners/model/EachTestNotifier;->fireTestFinished()V

    goto :goto_e

    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_1f
    move-exception v2

    invoke-virtual {v1}, Lorg/junit/internal/runners/model/EachTestNotifier;->fireTestFinished()V

    throw v2
.end method

.method public setScheduler(Lorg/junit/runners/model/RunnerScheduler;)V
    .registers 2
    .param p1, "scheduler"    # Lorg/junit/runners/model/RunnerScheduler;

    .prologue
    .line 450
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iput-object p1, p0, Lorg/junit/runners/ParentRunner;->scheduler:Lorg/junit/runners/model/RunnerScheduler;

    .line 451
    return-void
.end method

.method public sort(Lorg/junit/runner/manipulation/Sorter;)V
    .registers 7
    .param p1, "sorter"    # Lorg/junit/runner/manipulation/Sorter;

    .prologue
    .line 400
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v4, p0, Lorg/junit/runners/ParentRunner;->childrenLock:Ljava/lang/Object;

    monitor-enter v4

    .line 401
    :try_start_3
    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 402
    .local v0, "each":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1, v0}, Lorg/junit/runner/manipulation/Sorter;->apply(Ljava/lang/Object;)V

    goto :goto_b

    .line 407
    .end local v0    # "each":Ljava/lang/Object;, "TT;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_19
    move-exception v3

    monitor-exit v4
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v3

    .line 404
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1c
    :try_start_1c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {p0}, Lorg/junit/runners/ParentRunner;->getFilteredChildren()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 405
    .local v2, "sortedChildren":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;->comparator(Lorg/junit/runner/manipulation/Sorter;)Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 406
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v3

    iput-object v3, p0, Lorg/junit/runners/ParentRunner;->filteredChildren:Ljava/util/Collection;

    .line 407
    monitor-exit v4
    :try_end_33
    .catchall {:try_start_1c .. :try_end_33} :catchall_19

    .line 408
    return-void
.end method

.method protected validatePublicVoidNoArgMethods(Ljava/lang/Class;ZLjava/util/List;)V
    .registers 8
    .param p2, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/runners/ParentRunner;->getTestClass()Lorg/junit/runners/model/TestClass;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 154
    .local v2, "methods":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/model/FrameworkMethod;

    .line 155
    .local v0, "eachTestMethod":Lorg/junit/runners/model/FrameworkMethod;
    invoke-virtual {v0, p2, p3}, Lorg/junit/runners/model/FrameworkMethod;->validatePublicVoidNoArg(ZLjava/util/List;)V

    goto :goto_c

    .line 157
    .end local v0    # "eachTestMethod":Lorg/junit/runners/model/FrameworkMethod;
    :cond_1c
    return-void
.end method

.method protected withAfterClasses(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 5
    .param p1, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 228
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v1, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    const-class v2, Lorg/junit/AfterClass;

    invoke-virtual {v1, v2}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 230
    .local v0, "afters":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    .end local p1    # "statement":Lorg/junit/runners/model/Statement;
    :goto_e
    return-object p1

    .restart local p1    # "statement":Lorg/junit/runners/model/Statement;
    :cond_f
    new-instance v1, Lorg/junit/internal/runners/statements/RunAfters;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v0, v2}, Lorg/junit/internal/runners/statements/RunAfters;-><init>(Lorg/junit/runners/model/Statement;Ljava/util/List;Ljava/lang/Object;)V

    move-object p1, v1

    goto :goto_e
.end method

.method protected withBeforeClasses(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
    .registers 5
    .param p1, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 214
    .local p0, "this":Lorg/junit/runners/ParentRunner;, "Lorg/junit/runners/ParentRunner<TT;>;"
    iget-object v1, p0, Lorg/junit/runners/ParentRunner;->testClass:Lorg/junit/runners/model/TestClass;

    const-class v2, Lorg/junit/BeforeClass;

    invoke-virtual {v1, v2}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 216
    .local v0, "befores":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    .end local p1    # "statement":Lorg/junit/runners/model/Statement;
    :goto_e
    return-object p1

    .restart local p1    # "statement":Lorg/junit/runners/model/Statement;
    :cond_f
    new-instance v1, Lorg/junit/internal/runners/statements/RunBefores;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v0, v2}, Lorg/junit/internal/runners/statements/RunBefores;-><init>(Lorg/junit/runners/model/Statement;Ljava/util/List;Ljava/lang/Object;)V

    move-object p1, v1

    goto :goto_e
.end method
