.class public abstract Lorg/junit/rules/TestWatcher;
.super Ljava/lang/Object;
.source "TestWatcher.java"

# interfaces
.implements Lorg/junit/rules/TestRule;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 3
    .param p0, "x0"    # Lorg/junit/rules/TestWatcher;
    .param p1, "x1"    # Lorg/junit/runner/Description;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->startingQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$100(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 3
    .param p0, "x0"    # Lorg/junit/rules/TestWatcher;
    .param p1, "x1"    # Lorg/junit/runner/Description;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->succeededQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$200(Lorg/junit/rules/TestWatcher;Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 4
    .param p0, "x0"    # Lorg/junit/rules/TestWatcher;
    .param p1, "x1"    # Lorg/junit/internal/AssumptionViolatedException;
    .param p2, "x2"    # Lorg/junit/runner/Description;
    .param p3, "x3"    # Ljava/util/List;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Lorg/junit/rules/TestWatcher;->skippedQuietly(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$300(Lorg/junit/rules/TestWatcher;Ljava/lang/Throwable;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 4
    .param p0, "x0"    # Lorg/junit/rules/TestWatcher;
    .param p1, "x1"    # Ljava/lang/Throwable;
    .param p2, "x2"    # Lorg/junit/runner/Description;
    .param p3, "x3"    # Ljava/util/List;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Lorg/junit/rules/TestWatcher;->failedQuietly(Ljava/lang/Throwable;Lorg/junit/runner/Description;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$400(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 3
    .param p0, "x0"    # Lorg/junit/rules/TestWatcher;
    .param p1, "x1"    # Lorg/junit/runner/Description;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V

    return-void
.end method

.method private failedQuietly(Ljava/lang/Throwable;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p3, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->failed(Ljava/lang/Throwable;Lorg/junit/runner/Description;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 88
    :goto_3
    return-void

    .line 85
    :catch_4
    move-exception v0

    .line 86
    .local v0, "e1":Ljava/lang/Throwable;
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method private finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/junit/rules/TestWatcher;->finished(Lorg/junit/runner/Description;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 121
    :goto_3
    return-void

    .line 118
    :catch_4
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Throwable;
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method private skippedQuietly(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 6
    .param p1, "e"    # Lorg/junit/internal/AssumptionViolatedException;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/internal/AssumptionViolatedException;",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p3, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :try_start_0
    instance-of v1, p1, Lorg/junit/AssumptionViolatedException;

    if-eqz v1, :cond_a

    .line 96
    check-cast p1, Lorg/junit/AssumptionViolatedException;

    .end local p1    # "e":Lorg/junit/internal/AssumptionViolatedException;
    invoke-virtual {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->skipped(Lorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V

    .line 103
    :goto_9
    return-void

    .line 98
    .restart local p1    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :cond_a
    invoke-virtual {p0, p1, p2}, Lorg/junit/rules/TestWatcher;->skipped(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_9

    .line 100
    .end local p1    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_e
    move-exception v0

    .line 101
    .local v0, "e1":Ljava/lang/Throwable;
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9
.end method

.method private startingQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/junit/rules/TestWatcher;->starting(Lorg/junit/runner/Description;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 112
    :goto_3
    return-void

    .line 109
    :catch_4
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Throwable;
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method private succeededQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    .registers 4
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/junit/rules/TestWatcher;->succeeded(Lorg/junit/runner/Description;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 79
    :goto_3
    return-void

    .line 76
    :catch_4
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Throwable;
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method


# virtual methods
.method public apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .registers 4
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 48
    new-instance v0, Lorg/junit/rules/TestWatcher$1;

    invoke-direct {v0, p0, p2, p1}, Lorg/junit/rules/TestWatcher$1;-><init>(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Lorg/junit/runners/model/Statement;)V

    return-object v0
.end method

.method protected failed(Ljava/lang/Throwable;Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 133
    return-void
.end method

.method protected finished(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 165
    return-void
.end method

.method protected skipped(Lorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    .registers 4
    .param p1, "e"    # Lorg/junit/AssumptionViolatedException;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 141
    move-object v0, p1

    .line 142
    .local v0, "asInternalException":Lorg/junit/internal/AssumptionViolatedException;
    invoke-virtual {p0, v0, p2}, Lorg/junit/rules/TestWatcher;->skipped(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;)V

    .line 143
    return-void
.end method

.method protected skipped(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "e"    # Lorg/junit/internal/AssumptionViolatedException;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 153
    return-void
.end method

.method protected starting(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 159
    return-void
.end method

.method protected succeeded(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 127
    return-void
.end method
