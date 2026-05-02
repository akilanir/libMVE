.class public Ljunit/framework/JUnit4TestAdapter;
.super Ljava/lang/Object;
.source "JUnit4TestAdapter.java"

# interfaces
.implements Ljunit/framework/Test;
.implements Lorg/junit/runner/manipulation/Filterable;
.implements Lorg/junit/runner/manipulation/Sortable;
.implements Lorg/junit/runner/Describable;


# instance fields
.field private final fCache:Ljunit/framework/JUnit4TestAdapterCache;

.field private final fNewTestClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final fRunner:Lorg/junit/runner/Runner;


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

    .prologue
    .line 24
    .local p1, "newTestClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Ljunit/framework/JUnit4TestAdapterCache;->getDefault()Ljunit/framework/JUnit4TestAdapterCache;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljunit/framework/JUnit4TestAdapter;-><init>(Ljava/lang/Class;Ljunit/framework/JUnit4TestAdapterCache;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljunit/framework/JUnit4TestAdapterCache;)V
    .registers 4
    .param p2, "cache"    # Ljunit/framework/JUnit4TestAdapterCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljunit/framework/JUnit4TestAdapterCache;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "newTestClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p2, p0, Ljunit/framework/JUnit4TestAdapter;->fCache:Ljunit/framework/JUnit4TestAdapterCache;

    .line 29
    iput-object p1, p0, Ljunit/framework/JUnit4TestAdapter;->fNewTestClass:Ljava/lang/Class;

    .line 30
    invoke-static {p1}, Lorg/junit/runner/Request;->classWithoutSuiteMethod(Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v0

    iput-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    .line 31
    return-void
.end method

.method private isIgnored(Lorg/junit/runner/Description;)Z
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 71
    const-class v0, Lorg/junit/Ignore;

    invoke-virtual {p1, v0}, Lorg/junit/runner/Description;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private removeIgnored(Lorg/junit/runner/Description;)Lorg/junit/runner/Description;
    .registers 7
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljunit/framework/JUnit4TestAdapter;->isIgnored(Lorg/junit/runner/Description;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 58
    sget-object v3, Lorg/junit/runner/Description;->EMPTY:Lorg/junit/runner/Description;

    .line 67
    :cond_8
    return-object v3

    .line 60
    :cond_9
    invoke-virtual {p1}, Lorg/junit/runner/Description;->childlessCopy()Lorg/junit/runner/Description;

    move-result-object v3

    .line 61
    .local v3, "result":Lorg/junit/runner/Description;
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_15
    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runner/Description;

    .line 62
    .local v1, "each":Lorg/junit/runner/Description;
    invoke-direct {p0, v1}, Ljunit/framework/JUnit4TestAdapter;->removeIgnored(Lorg/junit/runner/Description;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 63
    .local v0, "child":Lorg/junit/runner/Description;
    invoke-virtual {v0}, Lorg/junit/runner/Description;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_15

    .line 64
    invoke-virtual {v3, v0}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    goto :goto_15
.end method


# virtual methods
.method public countTestCases()I
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    invoke-virtual {v0}, Lorg/junit/runner/Runner;->testCount()I

    move-result v0

    return v0
.end method

.method public filter(Lorg/junit/runner/manipulation/Filter;)V
    .registers 3
    .param p1, "filter"    # Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    invoke-virtual {p1, v0}, Lorg/junit/runner/manipulation/Filter;->apply(Ljava/lang/Object;)V

    .line 81
    return-void
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .registers 3

    .prologue
    .line 52
    iget-object v1, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    invoke-virtual {v1}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v0

    .line 53
    .local v0, "description":Lorg/junit/runner/Description;
    invoke-direct {p0, v0}, Ljunit/framework/JUnit4TestAdapter;->removeIgnored(Lorg/junit/runner/Description;)Lorg/junit/runner/Description;

    move-result-object v1

    return-object v1
.end method

.method public getTestClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fNewTestClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getTests()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljunit/framework/Test;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fCache:Ljunit/framework/JUnit4TestAdapterCache;

    invoke-virtual {p0}, Ljunit/framework/JUnit4TestAdapter;->getDescription()Lorg/junit/runner/Description;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljunit/framework/JUnit4TestAdapterCache;->asTestList(Lorg/junit/runner/Description;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public run(Ljunit/framework/TestResult;)V
    .registers 4
    .param p1, "result"    # Ljunit/framework/TestResult;

    .prologue
    .line 38
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    iget-object v1, p0, Ljunit/framework/JUnit4TestAdapter;->fCache:Ljunit/framework/JUnit4TestAdapterCache;

    invoke-virtual {v1, p1, p0}, Ljunit/framework/JUnit4TestAdapterCache;->getNotifier(Ljunit/framework/TestResult;Ljunit/framework/JUnit4TestAdapter;)Lorg/junit/runner/notification/RunNotifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/junit/runner/Runner;->run(Lorg/junit/runner/notification/RunNotifier;)V

    .line 39
    return-void
.end method

.method public sort(Lorg/junit/runner/manipulation/Sorter;)V
    .registers 3
    .param p1, "sorter"    # Lorg/junit/runner/manipulation/Sorter;

    .prologue
    .line 84
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fRunner:Lorg/junit/runner/Runner;

    invoke-virtual {p1, v0}, Lorg/junit/runner/manipulation/Sorter;->apply(Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Ljunit/framework/JUnit4TestAdapter;->fNewTestClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
