.class Lorg/jivesoftware/smack/util/Cache$LinkedList;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LinkedList"
.end annotation


# instance fields
.field private head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 507
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 502
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    const-string v1, "head"

    invoke-direct {v0, v1, v2, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 508
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v2, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v2, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 509
    return-void
.end method


# virtual methods
.method public addFirst(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 559
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-direct {v0, p1, v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    .line 560
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 561
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 562
    return-object v0
.end method

.method public addFirst(Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .registers 3
    .param p1, "node"    # Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .prologue
    .line 544
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 545
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 546
    iget-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object p1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 547
    iget-object v0, p1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object p1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 548
    return-object p1
.end method

.method public addLast(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 573
    new-instance v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    invoke-direct {v0, p1, v1, v2}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V

    .line 574
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 575
    iget-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 576
    return-object v0
.end method

.method public clear()V
    .registers 5

    .prologue
    .line 584
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    .line 585
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :goto_4
    if-eqz v0, :cond_e

    .line 586
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->remove()V

    .line 587
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Cache$LinkedList;->getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    move-result-object v0

    goto :goto_4

    .line 591
    :cond_e
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v3, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v3, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v3, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 592
    return-void
.end method

.method public getFirst()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .registers 3

    .prologue
    .line 517
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 518
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-ne v0, v1, :cond_9

    .line 519
    const/4 v0, 0x0

    .line 521
    .end local v0    # "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :cond_9
    return-object v0
.end method

.method public getLast()Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .registers 3

    .prologue
    .line 530
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v0, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 531
    .local v0, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-ne v0, v1, :cond_9

    .line 532
    const/4 v0, 0x0

    .line 534
    .end local v0    # "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    :cond_9
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 601
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, v2, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 602
    .local v1, "node":Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 603
    .local v0, "buf":Ljava/lang/StringBuilder;
    :goto_9
    iget-object v2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedList;->head:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    if-eq v1, v2, :cond_1d

    .line 604
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    iget-object v1, v1, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    goto :goto_9

    .line 607
    :cond_1d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
