.class abstract Lcom/google/common/cache/LocalCache$HashIterator;
.super Ljava/lang/Object;
.source "LocalCache.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "HashIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field currentSegment:Lcom/google/common/cache/LocalCache$Segment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$Segment",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field currentTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>.WriteThroughEntry;"
        }
    .end annotation
.end field

.field nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>.WriteThroughEntry;"
        }
    .end annotation
.end field

.field nextSegmentIndex:I

.field nextTableIndex:I

.field final synthetic this$0:Lcom/google/common/cache/LocalCache;


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache;)V
    .registers 3

    .prologue
    .line 4253
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4254
    iget-object v0, p1, Lcom/google/common/cache/LocalCache;->segments:[Lcom/google/common/cache/LocalCache$Segment;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextSegmentIndex:I

    .line 4255
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextTableIndex:I

    .line 4256
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->advance()V

    .line 4257
    return-void
.end method


# virtual methods
.method final advance()V
    .registers 4

    .prologue
    .line 4263
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    .line 4265
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->nextInChain()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 4283
    :cond_9
    :goto_9
    return-void

    .line 4269
    :cond_a
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->nextInTable()Z

    move-result v0

    if-nez v0, :cond_9

    .line 4273
    :cond_10
    iget v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextSegmentIndex:I

    if-ltz v0, :cond_9

    .line 4274
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->segments:[Lcom/google/common/cache/LocalCache$Segment;

    iget v1, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextSegmentIndex:I

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextSegmentIndex:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    .line 4275
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    iget v0, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v0, :cond_10

    .line 4276
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 4277
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextTableIndex:I

    .line 4278
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->nextInTable()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_9
.end method

.method advanceTo(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 4319
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :try_start_0
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v4}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v1

    .line 4320
    .local v1, "now":J
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 4321
    .local v0, "key":Ljava/lang/Object;, "TK;"
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v4, p1, v1, v2}, Lcom/google/common/cache/LocalCache;->getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;

    move-result-object v3

    .line 4322
    .local v3, "value":Ljava/lang/Object;, "TV;"
    if-eqz v3, :cond_24

    .line 4323
    new-instance v4, Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    iget-object v5, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-direct {v4, v5, v0, v3}, Lcom/google/common/cache/LocalCache$WriteThroughEntry;-><init>(Lcom/google/common/cache/LocalCache;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;
    :try_end_1d
    .catchall {:try_start_0 .. :try_end_1d} :catchall_2b

    .line 4324
    const/4 v4, 0x1

    .line 4330
    iget-object v5, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    invoke-virtual {v5}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    :goto_23
    return v4

    .line 4327
    :cond_24
    const/4 v4, 0x0

    .line 4330
    iget-object v5, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    invoke-virtual {v5}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_23

    .end local v0    # "key":Ljava/lang/Object;, "TK;"
    .end local v1    # "now":J
    .end local v3    # "value":Ljava/lang/Object;, "TV;"
    :catchall_2b
    move-exception v4

    iget-object v5, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentSegment:Lcom/google/common/cache/LocalCache$Segment;

    invoke-virtual {v5}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v4
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 4336
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public abstract next()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method nextEntry()Lcom/google/common/cache/LocalCache$WriteThroughEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>.WriteThroughEntry;"
        }
    .end annotation

    .prologue
    .line 4340
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    if-nez v0, :cond_a

    .line 4341
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 4343
    :cond_a
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextExternal:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    .line 4344
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->advance()V

    .line 4345
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    return-object v0
.end method

.method nextInChain()Z
    .registers 2

    .prologue
    .line 4289
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    if-eqz v0, :cond_23

    .line 4290
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    :goto_c
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    if-eqz v0, :cond_23

    .line 4291
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$HashIterator;->advanceTo(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 4292
    const/4 v0, 0x1

    .line 4296
    :goto_19
    return v0

    .line 4290
    :cond_1a
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    goto :goto_c

    .line 4296
    :cond_23
    const/4 v0, 0x0

    goto :goto_19
.end method

.method nextInTable()Z
    .registers 4

    .prologue
    .line 4303
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    :cond_0
    iget v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextTableIndex:I

    if-ltz v0, :cond_26

    .line 4304
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->currentTable:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    iget v1, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextTableIndex:I

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextTableIndex:I

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    if-eqz v0, :cond_0

    .line 4305
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->nextEntry:Lcom/google/common/cache/LocalCache$ReferenceEntry;

    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$HashIterator;->advanceTo(Lcom/google/common/cache/LocalCache$ReferenceEntry;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$HashIterator;->nextInChain()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4306
    :cond_24
    const/4 v0, 0x1

    .line 4310
    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 4350
    .local p0, "this":Lcom/google/common/cache/LocalCache$HashIterator;, "Lcom/google/common/cache/LocalCache<TK;TV;>.HashIterator<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_5
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 4351
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->this$0:Lcom/google/common/cache/LocalCache;

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$HashIterator;->lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache$WriteThroughEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/cache/LocalCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4352
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$HashIterator;->lastReturned:Lcom/google/common/cache/LocalCache$WriteThroughEntry;

    .line 4353
    return-void

    .line 4350
    :cond_17
    const/4 v0, 0x0

    goto :goto_5
.end method
