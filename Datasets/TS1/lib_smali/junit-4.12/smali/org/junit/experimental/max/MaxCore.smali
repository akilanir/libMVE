.class public Lorg/junit/experimental/max/MaxCore;
.super Ljava/lang/Object;
.source "MaxCore.java"


# static fields
.field private static final MALFORMED_JUNIT_3_TEST_CLASS_PREFIX:Ljava/lang/String; = "malformed JUnit 3 test class: "


# instance fields
.field private final history:Lorg/junit/experimental/max/MaxHistory;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "storedResults"    # Ljava/io/File;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-static {p1}, Lorg/junit/experimental/max/MaxHistory;->forFolder(Ljava/io/File;)Lorg/junit/experimental/max/MaxHistory;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/experimental/max/MaxCore;->history:Lorg/junit/experimental/max/MaxHistory;

    .line 56
    return-void
.end method

.method private buildRunner(Lorg/junit/runner/Description;)Lorg/junit/runner/Runner;
    .registers 7
    .param p1, "each"    # Lorg/junit/runner/Description;

    .prologue
    .line 124
    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TestSuite with 0 tests"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 125
    invoke-static {}, Lorg/junit/runners/Suite;->emptySuite()Lorg/junit/runner/Runner;

    move-result-object v2

    .line 142
    :goto_10
    return-object v2

    .line 127
    :cond_11
    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "malformed JUnit 3 test class: "

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 132
    new-instance v2, Lorg/junit/internal/runners/JUnit38ClassRunner;

    new-instance v3, Ljunit/framework/TestSuite;

    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxCore;->getMalformedTestClass(Lorg/junit/runner/Description;)Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v3, v4}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/Class;)V

    invoke-direct {v2, v3}, Lorg/junit/internal/runners/JUnit38ClassRunner;-><init>(Ljunit/framework/Test;)V

    goto :goto_10

    .line 134
    :cond_2c
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getTestClass()Ljava/lang/Class;

    move-result-object v1

    .line 135
    .local v1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v1, :cond_51

    .line 136
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t build a runner from description ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 138
    :cond_51
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "methodName":Ljava/lang/String;
    if-nez v0, :cond_60

    .line 140
    invoke-static {v1}, Lorg/junit/runner/Request;->aClass(Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v2

    goto :goto_10

    .line 142
    :cond_60
    invoke-static {v1, v0}, Lorg/junit/runner/Request;->method(Ljava/lang/Class;Ljava/lang/String;)Lorg/junit/runner/Request;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v2

    goto :goto_10
.end method

.method private constructLeafRequest(Ljava/util/List;)Lorg/junit/runner/Request;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Description;",
            ">;)",
            "Lorg/junit/runner/Request;"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "leaves":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Description;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v2, "runners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Runner;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 108
    .local v0, "each":Lorg/junit/runner/Description;
    invoke-direct {p0, v0}, Lorg/junit/experimental/max/MaxCore;->buildRunner(Lorg/junit/runner/Description;)Lorg/junit/runner/Runner;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 110
    .end local v0    # "each":Lorg/junit/runner/Description;
    :cond_1d
    new-instance v3, Lorg/junit/experimental/max/MaxCore$1;

    invoke-direct {v3, p0, v2}, Lorg/junit/experimental/max/MaxCore$1;-><init>(Lorg/junit/experimental/max/MaxCore;Ljava/util/List;)V

    return-object v3
.end method

.method private findLeaves(Lorg/junit/runner/Request;)Ljava/util/List;
    .registers 5
    .param p1, "request"    # Lorg/junit/runner/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Request;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .local v0, "results":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Description;>;"
    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v2

    invoke-direct {p0, v1, v2, v0}, Lorg/junit/experimental/max/MaxCore;->findLeaves(Lorg/junit/runner/Description;Lorg/junit/runner/Description;Ljava/util/List;)V

    .line 165
    return-object v0
.end method

.method private findLeaves(Lorg/junit/runner/Description;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 8
    .param p1, "parent"    # Lorg/junit/runner/Description;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Description;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p3, "results":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Description;>;"
    invoke-virtual {p2}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 170
    invoke-virtual {p2}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "warning(junit.framework.TestSuite$1)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "malformed JUnit 3 test class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/annotation/Annotation;

    invoke-static {v2, v3}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    :cond_33
    :goto_33
    return-void

    .line 173
    :cond_34
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_33

    .line 176
    :cond_38
    invoke-virtual {p2}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_40
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 177
    .local v0, "each":Lorg/junit/runner/Description;
    invoke-direct {p0, p2, v0, p3}, Lorg/junit/experimental/max/MaxCore;->findLeaves(Lorg/junit/runner/Description;Lorg/junit/runner/Description;Ljava/util/List;)V

    goto :goto_40
.end method

.method public static forFolder(Ljava/lang/String;)Lorg/junit/experimental/max/MaxCore;
    .registers 2
    .param p0, "folderName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 42
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/junit/experimental/max/MaxCore;->storedLocally(Ljava/io/File;)Lorg/junit/experimental/max/MaxCore;

    move-result-object v0

    return-object v0
.end method

.method private getMalformedTestClass(Lorg/junit/runner/Description;)Ljava/lang/Class;
    .registers 6
    .param p1, "each"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 147
    :try_start_0
    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "malformed JUnit 3 test class: "

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v1

    .line 149
    :goto_10
    return-object v1

    .line 148
    :catch_11
    move-exception v0

    .line 149
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const/4 v1, 0x0

    goto :goto_10
.end method

.method public static storedLocally(Ljava/io/File;)Lorg/junit/experimental/max/MaxCore;
    .registers 2
    .param p0, "storedResults"    # Ljava/io/File;

    .prologue
    .line 49
    new-instance v0, Lorg/junit/experimental/max/MaxCore;

    invoke-direct {v0, p0}, Lorg/junit/experimental/max/MaxCore;-><init>(Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public run(Ljava/lang/Class;)Lorg/junit/runner/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runner/Result;"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/junit/runner/Request;->aClass(Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/junit/experimental/max/MaxCore;->run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;

    move-result-object v0

    return-object v0
.end method

.method public run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;
    .registers 3
    .param p1, "request"    # Lorg/junit/runner/Request;

    .prologue
    .line 74
    new-instance v0, Lorg/junit/runner/JUnitCore;

    invoke-direct {v0}, Lorg/junit/runner/JUnitCore;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/junit/experimental/max/MaxCore;->run(Lorg/junit/runner/Request;Lorg/junit/runner/JUnitCore;)Lorg/junit/runner/Result;

    move-result-object v0

    return-object v0
.end method

.method public run(Lorg/junit/runner/Request;Lorg/junit/runner/JUnitCore;)Lorg/junit/runner/Result;
    .registers 4
    .param p1, "request"    # Lorg/junit/runner/Request;
    .param p2, "core"    # Lorg/junit/runner/JUnitCore;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/junit/experimental/max/MaxCore;->history:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v0}, Lorg/junit/experimental/max/MaxHistory;->listener()Lorg/junit/runner/notification/RunListener;

    move-result-object v0

    invoke-virtual {p2, v0}, Lorg/junit/runner/JUnitCore;->addListener(Lorg/junit/runner/notification/RunListener;)V

    .line 89
    invoke-virtual {p0, p1}, Lorg/junit/experimental/max/MaxCore;->sortRequest(Lorg/junit/runner/Request;)Lorg/junit/runner/Request;

    move-result-object v0

    invoke-virtual {v0}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v0

    invoke-virtual {p2, v0}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Runner;)Lorg/junit/runner/Result;

    move-result-object v0

    return-object v0
.end method

.method public sortRequest(Lorg/junit/runner/Request;)Lorg/junit/runner/Request;
    .registers 4
    .param p1, "request"    # Lorg/junit/runner/Request;

    .prologue
    .line 96
    instance-of v1, p1, Lorg/junit/internal/requests/SortingRequest;

    if-eqz v1, :cond_5

    .line 102
    .end local p1    # "request":Lorg/junit/runner/Request;
    :goto_4
    return-object p1

    .line 100
    .restart local p1    # "request":Lorg/junit/runner/Request;
    :cond_5
    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxCore;->findLeaves(Lorg/junit/runner/Request;)Ljava/util/List;

    move-result-object v0

    .line 101
    .local v0, "leaves":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/Description;>;"
    iget-object v1, p0, Lorg/junit/experimental/max/MaxCore;->history:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v1}, Lorg/junit/experimental/max/MaxHistory;->testComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 102
    invoke-direct {p0, v0}, Lorg/junit/experimental/max/MaxCore;->constructLeafRequest(Ljava/util/List;)Lorg/junit/runner/Request;

    move-result-object p1

    goto :goto_4
.end method

.method public sortedLeavesForTest(Lorg/junit/runner/Request;)Ljava/util/List;
    .registers 3
    .param p1, "request"    # Lorg/junit/runner/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Request;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    invoke-virtual {p0, p1}, Lorg/junit/experimental/max/MaxCore;->sortRequest(Lorg/junit/runner/Request;)Lorg/junit/runner/Request;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/experimental/max/MaxCore;->findLeaves(Lorg/junit/runner/Request;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
