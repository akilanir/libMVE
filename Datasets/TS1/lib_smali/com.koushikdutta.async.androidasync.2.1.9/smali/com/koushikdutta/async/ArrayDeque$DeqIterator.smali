.class Lcom/koushikdutta/async/ArrayDeque$DeqIterator;
.super Ljava/lang/Object;
.source "ArrayDeque.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/ArrayDeque;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeqIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private cursor:I

.field private fence:I

.field private lastRet:I

.field final synthetic this$0:Lcom/koushikdutta/async/ArrayDeque;


# direct methods
.method private constructor <init>(Lcom/koushikdutta/async/ArrayDeque;)V
    .registers 3

    .prologue
    .line 586
    .local p0, "this":Lcom/koushikdutta/async/ArrayDeque$DeqIterator;, "Lcom/koushikdutta/async/ArrayDeque<TE;>.DeqIterator;"
    iput-object p1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 590
    iget-object v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->head:I
    invoke-static {v0}, Lcom/koushikdutta/async/ArrayDeque;->access$200(Lcom/koushikdutta/async/ArrayDeque;)I

    move-result v0

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    .line 596
    iget-object v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->tail:I
    invoke-static {v0}, Lcom/koushikdutta/async/ArrayDeque;->access$300(Lcom/koushikdutta/async/ArrayDeque;)I

    move-result v0

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->fence:I

    .line 602
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->lastRet:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/koushikdutta/async/ArrayDeque;Lcom/koushikdutta/async/ArrayDeque$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/async/ArrayDeque;
    .param p2, "x1"    # Lcom/koushikdutta/async/ArrayDeque$1;

    .prologue
    .line 586
    .local p0, "this":Lcom/koushikdutta/async/ArrayDeque$DeqIterator;, "Lcom/koushikdutta/async/ArrayDeque<TE;>.DeqIterator;"
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;-><init>(Lcom/koushikdutta/async/ArrayDeque;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 605
    .local p0, "this":Lcom/koushikdutta/async/ArrayDeque$DeqIterator;, "Lcom/koushikdutta/async/ArrayDeque<TE;>.DeqIterator;"
    iget v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    iget v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->fence:I

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 609
    .local p0, "this":Lcom/koushikdutta/async/ArrayDeque$DeqIterator;, "Lcom/koushikdutta/async/ArrayDeque<TE;>.DeqIterator;"
    iget v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    iget v2, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->fence:I

    if-ne v1, v2, :cond_c

    .line 610
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 611
    :cond_c
    iget-object v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->elements:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/koushikdutta/async/ArrayDeque;->access$400(Lcom/koushikdutta/async/ArrayDeque;)[Ljava/lang/Object;

    move-result-object v1

    iget v2, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    aget-object v0, v1, v2

    .line 614
    .local v0, "result":Ljava/lang/Object;, "TE;"
    iget-object v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->tail:I
    invoke-static {v1}, Lcom/koushikdutta/async/ArrayDeque;->access$300(Lcom/koushikdutta/async/ArrayDeque;)I

    move-result v1

    iget v2, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->fence:I

    if-ne v1, v2, :cond_22

    if-nez v0, :cond_28

    .line 615
    :cond_22
    new-instance v1, Ljava/util/ConcurrentModificationException;

    invoke-direct {v1}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v1

    .line 616
    :cond_28
    iget v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    iput v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->lastRet:I

    .line 617
    iget v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->elements:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/koushikdutta/async/ArrayDeque;->access$400(Lcom/koushikdutta/async/ArrayDeque;)[Ljava/lang/Object;

    move-result-object v2

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    .line 618
    return-object v0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 622
    .local p0, "this":Lcom/koushikdutta/async/ArrayDeque$DeqIterator;, "Lcom/koushikdutta/async/ArrayDeque<TE;>.DeqIterator;"
    iget v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->lastRet:I

    if-gez v0, :cond_a

    .line 623
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 624
    :cond_a
    iget-object v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    iget v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->lastRet:I

    # invokes: Lcom/koushikdutta/async/ArrayDeque;->delete(I)Z
    invoke-static {v0, v1}, Lcom/koushikdutta/async/ArrayDeque;->access$500(Lcom/koushikdutta/async/ArrayDeque;I)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 625
    iget v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->elements:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/koushikdutta/async/ArrayDeque;->access$400(Lcom/koushikdutta/async/ArrayDeque;)[Ljava/lang/Object;

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->cursor:I

    .line 626
    iget-object v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->this$0:Lcom/koushikdutta/async/ArrayDeque;

    # getter for: Lcom/koushikdutta/async/ArrayDeque;->tail:I
    invoke-static {v0}, Lcom/koushikdutta/async/ArrayDeque;->access$300(Lcom/koushikdutta/async/ArrayDeque;)I

    move-result v0

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->fence:I

    .line 628
    :cond_2c
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/ArrayDeque$DeqIterator;->lastRet:I

    .line 629
    return-void
.end method
