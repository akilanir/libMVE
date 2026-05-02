.class public Lcom/octo/android/robospice/priority/PriorityFuture;
.super Ljava/util/concurrent/FutureTask;
.source "PriorityFuture.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TT;>;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/octo/android/robospice/priority/PriorityFuture",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private priority:I


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;ILjava/lang/Object;)V
    .registers 4
    .param p1, "other"    # Ljava/lang/Runnable;
    .param p2, "priority"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "ITT;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    .local p3, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, p3}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 18
    iput p2, p0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    .line 19
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/octo/android/robospice/priority/PriorityFuture;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/priority/PriorityFuture",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    .local p1, "other":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    iget v0, p0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    iget v1, p1, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 12
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    check-cast p1, Lcom/octo/android/robospice/priority/PriorityFuture;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/priority/PriorityFuture;->compareTo(Lcom/octo/android/robospice/priority/PriorityFuture;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 40
    if-ne p0, p1, :cond_5

    .line 54
    :cond_4
    :goto_4
    return v1

    .line 43
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 44
    goto :goto_4

    .line 46
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 47
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 49
    check-cast v0, Lcom/octo/android/robospice/priority/PriorityFuture;

    .line 50
    .local v0, "other":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<*>;"
    iget v3, p0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    iget v4, v0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 51
    goto :goto_4
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 22
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    iget v0, p0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 32
    .local p0, "this":Lcom/octo/android/robospice/priority/PriorityFuture;, "Lcom/octo/android/robospice/priority/PriorityFuture<TT;>;"
    const/16 v0, 0x1f

    .line 33
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 34
    .local v1, "result":I
    iget v2, p0, Lcom/octo/android/robospice/priority/PriorityFuture;->priority:I

    add-int/lit8 v1, v2, 0x1f

    .line 35
    return v1
.end method
