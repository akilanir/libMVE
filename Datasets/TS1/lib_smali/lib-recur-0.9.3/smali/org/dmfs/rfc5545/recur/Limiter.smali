.class abstract Lorg/dmfs/rfc5545/recur/Limiter;
.super Lorg/dmfs/rfc5545/recur/RuleIterator;


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V
    .registers 2

    invoke-direct {p0, p1}, Lorg/dmfs/rfc5545/recur/RuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    return-void
.end method


# virtual methods
.method public next()J
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/Limiter;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/recur/RuleIterator;->next()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/rfc5545/recur/Limiter;->stop(J)Z

    move-result v2

    if-eqz v2, :cond_e

    const-wide/high16 v0, -0x8000000000000000L

    :cond_e
    return-wide v0
.end method

.method nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "nextSet is not implemented for Limiters, since it should never be called"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method abstract stop(J)Z
.end method
