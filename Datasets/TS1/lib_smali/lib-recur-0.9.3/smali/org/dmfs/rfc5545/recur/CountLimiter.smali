.class Lorg/dmfs/rfc5545/recur/CountLimiter;
.super Lorg/dmfs/rfc5545/recur/Limiter;


# instance fields
.field private mCounter:I

.field private final mLimit:I


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;)V
    .registers 4

    invoke-direct {p0, p2}, Lorg/dmfs/rfc5545/recur/Limiter;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/CountLimiter;->mCounter:I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getCount()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/CountLimiter;->mLimit:I

    return-void
.end method


# virtual methods
.method fastForward(J)V
    .registers 3

    return-void
.end method

.method stop(J)Z
    .registers 5

    iget v0, p0, Lorg/dmfs/rfc5545/recur/CountLimiter;->mCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/dmfs/rfc5545/recur/CountLimiter;->mCounter:I

    iget v1, p0, Lorg/dmfs/rfc5545/recur/CountLimiter;->mLimit:I

    if-le v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
