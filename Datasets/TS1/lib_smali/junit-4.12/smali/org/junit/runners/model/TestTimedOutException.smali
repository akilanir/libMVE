.class public Lorg/junit/runners/model/TestTimedOutException;
.super Ljava/lang/Exception;
.source "TestTimedOutException.java"


# static fields
.field private static final serialVersionUID:J = 0x71755621d4fb93L


# instance fields
.field private final timeUnit:Ljava/util/concurrent/TimeUnit;

.field private final timeout:J


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .registers 8
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 25
    const-string v0, "test timed out after %d %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p3}, Ljava/util/concurrent/TimeUnit;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 27
    iput-object p3, p0, Lorg/junit/runners/model/TestTimedOutException;->timeUnit:Ljava/util/concurrent/TimeUnit;

    .line 28
    iput-wide p1, p0, Lorg/junit/runners/model/TestTimedOutException;->timeout:J

    .line 29
    return-void
.end method


# virtual methods
.method public getTimeUnit()Ljava/util/concurrent/TimeUnit;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/junit/runners/model/TestTimedOutException;->timeUnit:Ljava/util/concurrent/TimeUnit;

    return-object v0
.end method

.method public getTimeout()J
    .registers 3

    .prologue
    .line 35
    iget-wide v0, p0, Lorg/junit/runners/model/TestTimedOutException;->timeout:J

    return-wide v0
.end method
