.class public Lorg/junit/runners/Suite;
.super Lorg/junit/runners/ParentRunner;
.source "Suite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runners/Suite$SuiteClasses;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/runners/ParentRunner",
        "<",
        "Lorg/junit/runner/Runner;",
        ">;"
    }
.end annotation


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
.method protected constructor <init>(Ljava/lang/Class;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "runners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Runner;>;"
    invoke-direct {p0, p1}, Lorg/junit/runners/ParentRunner;-><init>(Ljava/lang/Class;)V

    .line 113
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/Suite;->runners:Ljava/util/List;

    .line 114
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lorg/junit/runners/model/RunnerBuilder;)V
    .registers 4
    .param p2, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/junit/runners/model/RunnerBuilder;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/junit/runners/Suite;->getAnnotatedClasses(Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, p2, p1, v0}, Lorg/junit/runners/Suite;-><init>(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 71
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;[Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
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
    .line 91
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "suiteClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;-><init>(Z)V

    invoke-direct {p0, v0, p1, p2}, Lorg/junit/runners/Suite;-><init>(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 92
    return-void
.end method

.method protected constructor <init>(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;[Ljava/lang/Class;)V
    .registers 5
    .param p1, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "Ljava/lang/Class",
            "<*>;[",
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
    .line 102
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "suiteClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p1, p2, p3}, Lorg/junit/runners/model/RunnerBuilder;->runners(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lorg/junit/runners/Suite;-><init>(Ljava/lang/Class;Ljava/util/List;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)V
    .registers 5
    .param p1, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "[",
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
    .local p2, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 81
    invoke-virtual {p1, v1, p2}, Lorg/junit/runners/model/RunnerBuilder;->runners(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lorg/junit/runners/Suite;-><init>(Ljava/lang/Class;Ljava/util/List;)V

    .line 82
    return-void
.end method

.method public static emptySuite()Lorg/junit/runner/Runner;
    .registers 4

    .prologue
    .line 33
    :try_start_0
    new-instance v2, Lorg/junit/runners/Suite;

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Class;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-direct {v2, v1, v3}, Lorg/junit/runners/Suite;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V
    :try_end_b
    .catch Lorg/junit/runners/model/InitializationError; {:try_start_0 .. :try_end_b} :catch_c

    return-object v2

    .line 34
    :catch_c
    move-exception v0

    .line 35
    .local v0, "e":Lorg/junit/runners/model/InitializationError;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "This shouldn\'t be possible"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getAnnotatedClasses(Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lorg/junit/runners/Suite$SuiteClasses;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/Suite$SuiteClasses;

    .line 55
    .local v0, "annotation":Lorg/junit/runners/Suite$SuiteClasses;
    if-nez v0, :cond_20

    .line 56
    new-instance v1, Lorg/junit/runners/model/InitializationError;

    const-string v2, "class \'%s\' must have a SuiteClasses annotation"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/junit/runners/model/InitializationError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_20
    invoke-interface {v0}, Lorg/junit/runners/Suite$SuiteClasses;->value()[Ljava/lang/Class;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected bridge synthetic describeChild(Ljava/lang/Object;)Lorg/junit/runner/Description;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/junit/runner/Runner;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/runners/Suite;->describeChild(Lorg/junit/runner/Runner;)Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

.method protected describeChild(Lorg/junit/runner/Runner;)Lorg/junit/runner/Description;
    .registers 3
    .param p1, "child"    # Lorg/junit/runner/Runner;

    .prologue
    .line 123
    invoke-virtual {p1}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

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
    .line 118
    iget-object v0, p0, Lorg/junit/runners/Suite;->runners:Ljava/util/List;

    return-object v0
.end method

.method protected bridge synthetic runChild(Ljava/lang/Object;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 27
    check-cast p1, Lorg/junit/runner/Runner;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runners/Suite;->runChild(Lorg/junit/runner/Runner;Lorg/junit/runner/notification/RunNotifier;)V

    return-void
.end method

.method protected runChild(Lorg/junit/runner/Runner;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 3
    .param p1, "runner"    # Lorg/junit/runner/Runner;
    .param p2, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 128
    invoke-virtual {p1, p2}, Lorg/junit/runner/Runner;->run(Lorg/junit/runner/notification/RunNotifier;)V

    .line 129
    return-void
.end method
