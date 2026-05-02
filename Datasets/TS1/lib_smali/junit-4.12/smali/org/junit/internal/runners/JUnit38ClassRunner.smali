.class public Lorg/junit/internal/runners/JUnit38ClassRunner;
.super Lorg/junit/runner/Runner;
.source "JUnit38ClassRunner.java"

# interfaces
.implements Lorg/junit/runner/manipulation/Filterable;
.implements Lorg/junit/runner/manipulation/Sortable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/internal/runners/JUnit38ClassRunner$1;,
        Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;
    }
.end annotation


# instance fields
.field private volatile test:Ljunit/framework/Test;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljunit/framework/TestSuite;

    const-class v1, Ljunit/framework/TestCase;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/Class;)V

    invoke-direct {p0, v0}, Lorg/junit/internal/runners/JUnit38ClassRunner;-><init>(Ljunit/framework/Test;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljunit/framework/Test;)V
    .registers 2
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 79
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner;->setTest(Ljunit/framework/Test;)V

    .line 80
    return-void
.end method

.method private static createSuiteDescription(Ljunit/framework/TestSuite;)Ljava/lang/String;
    .registers 8
    .param p0, "ts"    # Ljunit/framework/TestSuite;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 140
    invoke-virtual {p0}, Ljunit/framework/TestSuite;->countTestCases()I

    move-result v0

    .line 141
    .local v0, "count":I
    if-nez v0, :cond_1c

    const-string v1, ""

    .line 142
    .local v1, "example":Ljava/lang/String;
    :goto_a
    const-string v2, "TestSuite with %s tests%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    aput-object v1, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 141
    .end local v1    # "example":Ljava/lang/String;
    :cond_1c
    const-string v2, " [example: %s]"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {p0, v5}, Ljunit/framework/TestSuite;->testAt(I)Ljunit/framework/Test;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method private static getAnnotations(Ljunit/framework/TestCase;)[Ljava/lang/annotation/Annotation;
    .registers 6
    .param p0, "test"    # Ljunit/framework/TestCase;

    .prologue
    const/4 v4, 0x0

    .line 131
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljunit/framework/TestCase;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 132
    .local v0, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;
    :try_end_13
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_13} :catch_19
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_13} :catch_15

    move-result-object v1

    .line 136
    .end local v0    # "m":Ljava/lang/reflect/Method;
    :goto_14
    return-object v1

    .line 134
    :catch_15
    move-exception v1

    .line 136
    :goto_16
    new-array v1, v4, [Ljava/lang/annotation/Annotation;

    goto :goto_14

    .line 133
    :catch_19
    move-exception v1

    goto :goto_16
.end method

.method private getTest()Ljunit/framework/Test;
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit38ClassRunner;->test:Ljunit/framework/Test;

    return-object v0
.end method

.method private static makeDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;
    .registers 13
    .param p0, "test"    # Ljunit/framework/Test;

    .prologue
    .line 99
    instance-of v9, p0, Ljunit/framework/TestCase;

    if-eqz v9, :cond_18

    move-object v7, p0

    .line 100
    check-cast v7, Ljunit/framework/TestCase;

    .line 101
    .local v7, "tc":Ljunit/framework/TestCase;
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v7}, Ljunit/framework/TestCase;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getAnnotations(Ljunit/framework/TestCase;)[Ljava/lang/annotation/Annotation;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v2

    .line 121
    .end local v7    # "tc":Ljunit/framework/TestCase;
    :cond_17
    :goto_17
    return-object v2

    .line 103
    :cond_18
    instance-of v9, p0, Ljunit/framework/TestSuite;

    if-eqz v9, :cond_4a

    move-object v8, p0

    .line 104
    check-cast v8, Ljunit/framework/TestSuite;

    .line 105
    .local v8, "ts":Ljunit/framework/TestSuite;
    invoke-virtual {v8}, Ljunit/framework/TestSuite;->getName()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_45

    invoke-static {v8}, Lorg/junit/internal/runners/JUnit38ClassRunner;->createSuiteDescription(Ljunit/framework/TestSuite;)Ljava/lang/String;

    move-result-object v6

    .line 106
    .local v6, "name":Ljava/lang/String;
    :goto_29
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/annotation/Annotation;

    invoke-static {v6, v9}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v2

    .line 107
    .local v2, "description":Lorg/junit/runner/Description;
    invoke-virtual {v8}, Ljunit/framework/TestSuite;->testCount()I

    move-result v5

    .line 108
    .local v5, "n":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_35
    if-ge v3, v5, :cond_17

    .line 109
    invoke-virtual {v8, v3}, Ljunit/framework/TestSuite;->testAt(I)Ljunit/framework/Test;

    move-result-object v9

    invoke-static {v9}, Lorg/junit/internal/runners/JUnit38ClassRunner;->makeDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v4

    .line 110
    .local v4, "made":Lorg/junit/runner/Description;
    invoke-virtual {v2, v4}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    .line 108
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    .line 105
    .end local v2    # "description":Lorg/junit/runner/Description;
    .end local v3    # "i":I
    .end local v4    # "made":Lorg/junit/runner/Description;
    .end local v5    # "n":I
    .end local v6    # "name":Ljava/lang/String;
    :cond_45
    invoke-virtual {v8}, Ljunit/framework/TestSuite;->getName()Ljava/lang/String;

    move-result-object v6

    goto :goto_29

    .line 113
    .end local v8    # "ts":Ljunit/framework/TestSuite;
    :cond_4a
    instance-of v9, p0, Lorg/junit/runner/Describable;

    if-eqz v9, :cond_56

    move-object v0, p0

    .line 114
    check-cast v0, Lorg/junit/runner/Describable;

    .line 115
    .local v0, "adapter":Lorg/junit/runner/Describable;
    invoke-interface {v0}, Lorg/junit/runner/Describable;->getDescription()Lorg/junit/runner/Description;

    move-result-object v2

    goto :goto_17

    .line 116
    .end local v0    # "adapter":Lorg/junit/runner/Describable;
    :cond_56
    instance-of v9, p0, Ljunit/extensions/TestDecorator;

    if-eqz v9, :cond_66

    move-object v1, p0

    .line 117
    check-cast v1, Ljunit/extensions/TestDecorator;

    .line 118
    .local v1, "decorator":Ljunit/extensions/TestDecorator;
    invoke-virtual {v1}, Ljunit/extensions/TestDecorator;->getTest()Ljunit/framework/Test;

    move-result-object v9

    invoke-static {v9}, Lorg/junit/internal/runners/JUnit38ClassRunner;->makeDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v2

    goto :goto_17

    .line 121
    .end local v1    # "decorator":Ljunit/extensions/TestDecorator;
    :cond_66
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/Class;)Lorg/junit/runner/Description;

    move-result-object v2

    goto :goto_17
.end method

.method private setTest(Ljunit/framework/Test;)V
    .registers 2
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/junit/internal/runners/JUnit38ClassRunner;->test:Ljunit/framework/Test;

    .line 175
    return-void
.end method


# virtual methods
.method public createAdaptingListener(Lorg/junit/runner/notification/RunNotifier;)Ljunit/framework/TestListener;
    .registers 4
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 90
    new-instance v0, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/internal/runners/JUnit38ClassRunner$1;)V

    return-object v0
.end method

.method public filter(Lorg/junit/runner/manipulation/Filter;)V
    .registers 9
    .param p1, "filter"    # Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 146
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v6

    instance-of v6, v6, Lorg/junit/runner/manipulation/Filterable;

    if-eqz v6, :cond_12

    .line 147
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/manipulation/Filterable;

    .line 148
    .local v0, "adapter":Lorg/junit/runner/manipulation/Filterable;
    invoke-interface {v0, p1}, Lorg/junit/runner/manipulation/Filterable;->filter(Lorg/junit/runner/manipulation/Filter;)V

    .line 164
    .end local v0    # "adapter":Lorg/junit/runner/manipulation/Filterable;
    :cond_11
    return-void

    .line 149
    :cond_12
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v6

    instance-of v6, v6, Ljunit/framework/TestSuite;

    if-eqz v6, :cond_11

    .line 150
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v4

    check-cast v4, Ljunit/framework/TestSuite;

    .line 151
    .local v4, "suite":Ljunit/framework/TestSuite;
    new-instance v1, Ljunit/framework/TestSuite;

    invoke-virtual {v4}, Ljunit/framework/TestSuite;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/String;)V

    .line 152
    .local v1, "filtered":Ljunit/framework/TestSuite;
    invoke-virtual {v4}, Ljunit/framework/TestSuite;->testCount()I

    move-result v3

    .line 153
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2e
    if-ge v2, v3, :cond_44

    .line 154
    invoke-virtual {v4, v2}, Ljunit/framework/TestSuite;->testAt(I)Ljunit/framework/Test;

    move-result-object v5

    .line 155
    .local v5, "test":Ljunit/framework/Test;
    invoke-static {v5}, Lorg/junit/internal/runners/JUnit38ClassRunner;->makeDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/junit/runner/manipulation/Filter;->shouldRun(Lorg/junit/runner/Description;)Z

    move-result v6

    if-eqz v6, :cond_41

    .line 156
    invoke-virtual {v1, v5}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    .line 153
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 159
    .end local v5    # "test":Ljunit/framework/Test;
    :cond_44
    invoke-direct {p0, v1}, Lorg/junit/internal/runners/JUnit38ClassRunner;->setTest(Ljunit/framework/Test;)V

    .line 160
    invoke-virtual {v1}, Ljunit/framework/TestSuite;->testCount()I

    move-result v6

    if-nez v6, :cond_11

    .line 161
    new-instance v6, Lorg/junit/runner/manipulation/NoTestsRemainException;

    invoke-direct {v6}, Lorg/junit/runner/manipulation/NoTestsRemainException;-><init>()V

    throw v6
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .registers 2

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v0

    invoke-static {v0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->makeDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 4
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 84
    new-instance v0, Ljunit/framework/TestResult;

    invoke-direct {v0}, Ljunit/framework/TestResult;-><init>()V

    .line 85
    .local v0, "result":Ljunit/framework/TestResult;
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner;->createAdaptingListener(Lorg/junit/runner/notification/RunNotifier;)Ljunit/framework/TestListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljunit/framework/TestResult;->addListener(Ljunit/framework/TestListener;)V

    .line 86
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v1

    invoke-interface {v1, v0}, Ljunit/framework/Test;->run(Ljunit/framework/TestResult;)V

    .line 87
    return-void
.end method

.method public sort(Lorg/junit/runner/manipulation/Sorter;)V
    .registers 4
    .param p1, "sorter"    # Lorg/junit/runner/manipulation/Sorter;

    .prologue
    .line 167
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v1

    instance-of v1, v1, Lorg/junit/runner/manipulation/Sortable;

    if-eqz v1, :cond_11

    .line 168
    invoke-direct {p0}, Lorg/junit/internal/runners/JUnit38ClassRunner;->getTest()Ljunit/framework/Test;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/manipulation/Sortable;

    .line 169
    .local v0, "adapter":Lorg/junit/runner/manipulation/Sortable;
    invoke-interface {v0, p1}, Lorg/junit/runner/manipulation/Sortable;->sort(Lorg/junit/runner/manipulation/Sorter;)V

    .line 171
    .end local v0    # "adapter":Lorg/junit/runner/manipulation/Sortable;
    :cond_11
    return-void
.end method
