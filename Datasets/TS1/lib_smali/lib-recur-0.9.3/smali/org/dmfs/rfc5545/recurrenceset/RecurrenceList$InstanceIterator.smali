.class Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InstanceIterator"
.end annotation


# instance fields
.field private mNext:I

.field final synthetic this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;J)V
    .registers 4

    iput-object p1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->fastForward(J)V

    return-void
.end method


# virtual methods
.method public fastForward(J)V
    .registers 8

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I
    invoke-static {v0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$000(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)I

    move-result v1

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    iget-object v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J
    invoke-static {v2}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$100(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)[J

    move-result-object v2

    :goto_e
    if-ge v0, v1, :cond_19

    aget-wide v3, v2, v0

    cmp-long v3, v3, p1

    if-gez v3, :cond_19

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_19
    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    return-void
.end method

.method public hasNext()Z
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I
    invoke-static {v1}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$000(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public next()J
    .registers 4

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I
    invoke-static {v1}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$000(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)I

    move-result v1

    if-lt v0, v1, :cond_12

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J
    invoke-static {v0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$100(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)[J

    move-result-object v0

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public peek()J
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    iget-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I
    invoke-static {v1}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$000(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)I

    move-result v1

    if-lt v0, v1, :cond_12

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "No more instances to iterate."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->this$0:Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;

    # getter for: Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J
    invoke-static {v0}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->access$100(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)[J

    move-result-object v0

    iget v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public skip(I)V
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;->mNext:I

    return-void
.end method
