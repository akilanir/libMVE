.class public Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;
.super Ljava/lang/Object;
.source "FailOnTimeout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/internal/runners/statements/FailOnTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private lookForStuckThread:Z

.field private timeout:J

.field private unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->lookForStuckThread:Z

    .line 59
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->timeout:J

    .line 60
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->unit:Ljava/util/concurrent/TimeUnit;

    .line 63
    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/internal/runners/statements/FailOnTimeout$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/internal/runners/statements/FailOnTimeout$1;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;)J
    .registers 3
    .param p0, "x0"    # Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;

    .prologue
    .line 57
    iget-wide v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->timeout:J

    return-wide v0
.end method

.method static synthetic access$200(Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;)Ljava/util/concurrent/TimeUnit;
    .registers 2
    .param p0, "x0"    # Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->unit:Ljava/util/concurrent/TimeUnit;

    return-object v0
.end method

.method static synthetic access$300(Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;

    .prologue
    .line 57
    iget-boolean v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->lookForStuckThread:Z

    return v0
.end method


# virtual methods
.method public build(Lorg/junit/runners/model/Statement;)Lorg/junit/internal/runners/statements/FailOnTimeout;
    .registers 4
    .param p1, "statement"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 111
    if-nez p1, :cond_a

    .line 112
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "statement cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_a
    new-instance v0, Lorg/junit/internal/runners/statements/FailOnTimeout;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lorg/junit/internal/runners/statements/FailOnTimeout;-><init>(Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;Lorg/junit/runners/model/Statement;Lorg/junit/internal/runners/statements/FailOnTimeout$1;)V

    return-object v0
.end method

.method public withLookingForStuckThread(Z)Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->lookForStuckThread:Z

    .line 101
    return-object p0
.end method

.method public withTimeout(JLjava/util/concurrent/TimeUnit;)Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;
    .registers 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 79
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_e

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "timeout must be non-negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_e
    if-nez p3, :cond_18

    .line 83
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "TimeUnit cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_18
    iput-wide p1, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->timeout:J

    .line 86
    iput-object p3, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$Builder;->unit:Ljava/util/concurrent/TimeUnit;

    .line 87
    return-object p0
.end method
