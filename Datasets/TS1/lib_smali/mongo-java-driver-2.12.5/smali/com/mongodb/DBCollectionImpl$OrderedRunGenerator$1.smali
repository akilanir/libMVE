.class Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/mongodb/DBCollectionImpl$Run;",
        ">;"
    }
.end annotation


# instance fields
.field private curIndex:I

.field final synthetic this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)V
    .registers 2

    .prologue
    .line 574
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getStartIndexOfNextRun()I
    .registers 5

    .prologue
    .line 594
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/WriteRequest;

    invoke-virtual {v2}, Lcom/mongodb/WriteRequest;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v1

    .line 595
    .local v1, "type":Lcom/mongodb/WriteRequest$Type;
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    .local v0, "i":I
    :goto_14
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_41

    .line 596
    iget v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->maxBatchWriteSize:I
    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$1000(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)I

    move-result v3

    add-int/2addr v2, v3

    if-eq v0, v2, :cond_3d

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/WriteRequest;

    invoke-virtual {v2}, Lcom/mongodb/WriteRequest;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v2

    if-eq v2, v1, :cond_3e

    .line 600
    .end local v0    # "i":I
    :cond_3d
    :goto_3d
    return v0

    .line 595
    .restart local v0    # "i":I
    :cond_3e
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 600
    :cond_41
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_3d
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 579
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v1}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public next()Lcom/mongodb/DBCollectionImpl$Run;
    .registers 8

    .prologue
    .line 584
    new-instance v1, Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    iget-object v4, v3, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v3

    iget v5, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/WriteRequest;

    invoke-virtual {v3}, Lcom/mongodb/WriteRequest;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeConcern:Lcom/mongodb/WriteConcern;
    invoke-static {v5}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$800(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Lcom/mongodb/WriteConcern;

    move-result-object v5

    iget-object v6, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->encoder:Lcom/mongodb/DBEncoder;
    invoke-static {v6}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$900(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Lcom/mongodb/DBEncoder;

    move-result-object v6

    invoke-direct {v1, v4, v3, v5, v6}, Lcom/mongodb/DBCollectionImpl$Run;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)V

    .line 585
    .local v1, "run":Lcom/mongodb/DBCollectionImpl$Run;
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->getStartIndexOfNextRun()I

    move-result v2

    .line 586
    .local v2, "startIndexOfNextRun":I
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    .local v0, "i":I
    :goto_2d
    if-ge v0, v2, :cond_41

    .line 587
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    # getter for: Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->writeRequests:Ljava/util/List;
    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/WriteRequest;

    invoke-virtual {v1, v3, v0}, Lcom/mongodb/DBCollectionImpl$Run;->add(Lcom/mongodb/WriteRequest;I)V

    .line 586
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 589
    :cond_41
    iput v2, p0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->curIndex:I

    .line 590
    return-object v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 574
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator$1;->next()Lcom/mongodb/DBCollectionImpl$Run;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 605
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
