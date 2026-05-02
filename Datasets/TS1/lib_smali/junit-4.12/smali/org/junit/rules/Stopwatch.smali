.class public abstract Lorg/junit/rules/Stopwatch;
.super Ljava/lang/Object;
.source "Stopwatch.java"

# interfaces
.implements Lorg/junit/rules/TestRule;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/rules/Stopwatch$1;,
        Lorg/junit/rules/Stopwatch$Clock;,
        Lorg/junit/rules/Stopwatch$InternalWatcher;
    }
.end annotation


# instance fields
.field private final clock:Lorg/junit/rules/Stopwatch$Clock;

.field private volatile endNanos:J

.field private volatile startNanos:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 85
    new-instance v0, Lorg/junit/rules/Stopwatch$Clock;

    invoke-direct {v0}, Lorg/junit/rules/Stopwatch$Clock;-><init>()V

    invoke-direct {p0, v0}, Lorg/junit/rules/Stopwatch;-><init>(Lorg/junit/rules/Stopwatch$Clock;)V

    .line 86
    return-void
.end method

.method constructor <init>(Lorg/junit/rules/Stopwatch$Clock;)V
    .registers 2
    .param p1, "clock"    # Lorg/junit/rules/Stopwatch$Clock;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    .line 90
    return-void
.end method

.method static synthetic access$100(Lorg/junit/rules/Stopwatch;)V
    .registers 1
    .param p0, "x0"    # Lorg/junit/rules/Stopwatch;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->starting()V

    return-void
.end method

.method static synthetic access$200(Lorg/junit/rules/Stopwatch;)J
    .registers 3
    .param p0, "x0"    # Lorg/junit/rules/Stopwatch;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->getNanos()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Lorg/junit/rules/Stopwatch;)V
    .registers 1
    .param p0, "x0"    # Lorg/junit/rules/Stopwatch;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->stopping()V

    return-void
.end method

.method private getNanos()J
    .registers 7

    .prologue
    const-wide/16 v4, 0x0

    .line 127
    iget-wide v2, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_10

    .line 128
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Test has not started"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_10
    iget-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 131
    .local v0, "currentEndNanos":J
    cmp-long v2, v0, v4

    if-nez v2, :cond_1c

    .line 132
    iget-object v2, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    invoke-virtual {v2}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    move-result-wide v0

    .line 135
    :cond_1c
    iget-wide v2, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    sub-long v2, v0, v2

    return-wide v2
.end method

.method private starting()V
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    invoke-virtual {v0}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->startNanos:J

    .line 140
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 141
    return-void
.end method

.method private stopping()V
    .registers 3

    .prologue
    .line 144
    iget-object v0, p0, Lorg/junit/rules/Stopwatch;->clock:Lorg/junit/rules/Stopwatch$Clock;

    invoke-virtual {v0}, Lorg/junit/rules/Stopwatch$Clock;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/junit/rules/Stopwatch;->endNanos:J

    .line 145
    return-void
.end method


# virtual methods
.method public final apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .registers 5
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 148
    new-instance v0, Lorg/junit/rules/Stopwatch$InternalWatcher;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/junit/rules/Stopwatch$InternalWatcher;-><init>(Lorg/junit/rules/Stopwatch;Lorg/junit/rules/Stopwatch$1;)V

    invoke-virtual {v0, p1, p2}, Lorg/junit/rules/Stopwatch$InternalWatcher;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    return-object v0
.end method

.method protected failed(JLjava/lang/Throwable;Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "nanos"    # J
    .param p3, "e"    # Ljava/lang/Throwable;
    .param p4, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 112
    return-void
.end method

.method protected finished(JLorg/junit/runner/Description;)V
    .registers 4
    .param p1, "nanos"    # J
    .param p3, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 124
    return-void
.end method

.method public runtime(Ljava/util/concurrent/TimeUnit;)J
    .registers 5
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/junit/rules/Stopwatch;->getNanos()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected skipped(JLorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "nanos"    # J
    .param p3, "e"    # Lorg/junit/AssumptionViolatedException;
    .param p4, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 118
    return-void
.end method

.method protected succeeded(JLorg/junit/runner/Description;)V
    .registers 4
    .param p1, "nanos"    # J
    .param p3, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 106
    return-void
.end method
