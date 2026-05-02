.class abstract Lorg/dmfs/rfc5545/recur/RuleIterator;
.super Ljava/lang/Object;


# instance fields
.field final mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;


# direct methods
.method constructor <init>(Lorg/dmfs/rfc5545/recur/RuleIterator;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/rfc5545/recur/RuleIterator;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    return-void
.end method


# virtual methods
.method fastForward(J)V
    .registers 4

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RuleIterator;->mPrevious:Lorg/dmfs/rfc5545/recur/RuleIterator;

    invoke-virtual {v0, p1, p2}, Lorg/dmfs/rfc5545/recur/RuleIterator;->fastForward(J)V

    return-void
.end method

.method public abstract next()J
.end method

.method abstract nextSet()Lorg/dmfs/rfc5545/recur/LongArray;
.end method
