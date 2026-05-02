.class public Ljunit/framework/JUnit4TestAdapterCache;
.super Ljava/util/HashMap;
.source "JUnit4TestAdapterCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Lorg/junit/runner/Description;",
        "Ljunit/framework/Test;",
        ">;"
    }
.end annotation


# static fields
.field private static final fInstance:Ljunit/framework/JUnit4TestAdapterCache;

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    new-instance v0, Ljunit/framework/JUnit4TestAdapterCache;

    invoke-direct {v0}, Ljunit/framework/JUnit4TestAdapterCache;-><init>()V

    sput-object v0, Ljunit/framework/JUnit4TestAdapterCache;->fInstance:Ljunit/framework/JUnit4TestAdapterCache;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method public static getDefault()Ljunit/framework/JUnit4TestAdapterCache;
    .registers 1

    .prologue
    .line 18
    sget-object v0, Ljunit/framework/JUnit4TestAdapterCache;->fInstance:Ljunit/framework/JUnit4TestAdapterCache;

    return-object v0
.end method


# virtual methods
.method public asTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 22
    invoke-virtual {p1}, Lorg/junit/runner/Description;->isSuite()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 23
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->createTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;

    move-result-object v0

    .line 28
    :goto_a
    return-object v0

    .line 25
    :cond_b
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 26
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->createTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljunit/framework/JUnit4TestAdapterCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    :cond_18
    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljunit/framework/Test;

    goto :goto_a
.end method

.method public asTestList(Lorg/junit/runner/Description;)Ljava/util/List;
    .registers 8
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljunit/framework/Test;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p1}, Lorg/junit/runner/Description;->isTest()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 67
    const/4 v3, 0x1

    new-array v3, v3, [Ljunit/framework/Test;

    const/4 v4, 0x0

    invoke-virtual {p0, p1}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 73
    :cond_14
    return-object v2

    .line 69
    :cond_15
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v2, "returnThis":Ljava/util/List;, "Ljava/util/List<Ljunit/framework/Test;>;"
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_22
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 71
    .local v0, "child":Lorg/junit/runner/Description;
    invoke-virtual {p0, v0}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_22
.end method

.method createTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;
    .registers 6
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 33
    invoke-virtual {p1}, Lorg/junit/runner/Description;->isTest()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 34
    new-instance v2, Ljunit/framework/JUnit4TestCaseFacade;

    invoke-direct {v2, p1}, Ljunit/framework/JUnit4TestCaseFacade;-><init>(Lorg/junit/runner/Description;)V

    .line 40
    :cond_b
    return-object v2

    .line 36
    :cond_c
    new-instance v2, Ljunit/framework/TestSuite;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljunit/framework/TestSuite;-><init>(Ljava/lang/String;)V

    .line 37
    .local v2, "suite":Ljunit/framework/TestSuite;
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 38
    .local v0, "child":Lorg/junit/runner/Description;
    invoke-virtual {p0, v0}, Ljunit/framework/JUnit4TestAdapterCache;->asTest(Lorg/junit/runner/Description;)Ljunit/framework/Test;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljunit/framework/TestSuite;->addTest(Ljunit/framework/Test;)V

    goto :goto_1d
.end method

.method public getNotifier(Ljunit/framework/TestResult;Ljunit/framework/JUnit4TestAdapter;)Lorg/junit/runner/notification/RunNotifier;
    .registers 5
    .param p1, "result"    # Ljunit/framework/TestResult;
    .param p2, "adapter"    # Ljunit/framework/JUnit4TestAdapter;

    .prologue
    .line 45
    new-instance v0, Lorg/junit/runner/notification/RunNotifier;

    invoke-direct {v0}, Lorg/junit/runner/notification/RunNotifier;-><init>()V

    .line 46
    .local v0, "notifier":Lorg/junit/runner/notification/RunNotifier;
    new-instance v1, Ljunit/framework/JUnit4TestAdapterCache$1;

    invoke-direct {v1, p0, p1}, Ljunit/framework/JUnit4TestAdapterCache$1;-><init>(Ljunit/framework/JUnit4TestAdapterCache;Ljunit/framework/TestResult;)V

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->addListener(Lorg/junit/runner/notification/RunListener;)V

    .line 62
    return-object v0
.end method
