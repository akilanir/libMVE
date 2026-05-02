.class Lcom/mongodb/DBCollectionImpl$2;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Lcom/mongodb/DBPort$Operation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/DBPort$Operation",
        "<",
        "Lcom/mongodb/BulkWriteResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBCollectionImpl;

.field final synthetic val$message:Lcom/mongodb/BaseWriteCommandMessage;

.field final synthetic val$port:Lcom/mongodb/DBPort;

.field final synthetic val$type:Lcom/mongodb/WriteRequest$Type;

.field final synthetic val$writeConcern:Lcom/mongodb/WriteConcern;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;Lcom/mongodb/WriteRequest$Type;)V
    .registers 6

    .prologue
    .line 424
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$2;->val$message:Lcom/mongodb/BaseWriteCommandMessage;

    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$2;->val$writeConcern:Lcom/mongodb/WriteConcern;

    iput-object p5, p0, Lcom/mongodb/DBCollectionImpl$2;->val$type:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/mongodb/BulkWriteResult;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    .line 427
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$2;->val$message:Lcom/mongodb/BaseWriteCommandMessage;

    .line 428
    .local v3, "curMessage":Lcom/mongodb/BaseWriteCommandMessage;
    const/4 v0, 0x0

    .line 429
    .local v0, "batchNum":I
    const/4 v4, 0x0

    .line 430
    .local v4, "currentRangeStartIndex":I
    new-instance v1, Lcom/mongodb/BulkWriteBatchCombiner;

    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    invoke-virtual {v8}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v8

    iget-object v9, p0, Lcom/mongodb/DBCollectionImpl$2;->val$writeConcern:Lcom/mongodb/WriteConcern;

    invoke-direct {v1, v8, v9}, Lcom/mongodb/BulkWriteBatchCombiner;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V

    .line 432
    .local v1, "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    :cond_12
    add-int/lit8 v0, v0, 0x1

    .line 433
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v9, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    # invokes: Lcom/mongodb/DBCollectionImpl;->sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;
    invoke-static {v8, v3, v0, v9}, Lcom/mongodb/DBCollectionImpl;->access$200(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v7

    .line 434
    .local v7, "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    if-eqz v7, :cond_76

    invoke-virtual {v3}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v8

    invoke-virtual {v7}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v9

    sub-int v6, v8, v9

    .line 436
    .local v6, "itemCount":I
    :goto_28
    invoke-static {v4, v6}, Lcom/mongodb/IndexMap;->create(II)Lcom/mongodb/IndexMap;

    move-result-object v5

    .line 437
    .local v5, "indexMap":Lcom/mongodb/IndexMap;
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v9, p0, Lcom/mongodb/DBCollectionImpl$2;->val$port:Lcom/mongodb/DBPort;

    # invokes: Lcom/mongodb/DBCollectionImpl;->receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;
    invoke-static {v8, v9}, Lcom/mongodb/DBCollectionImpl;->access$300(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 438
    .local v2, "commandResult":Lcom/mongodb/CommandResult;
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    # invokes: Lcom/mongodb/DBCollectionImpl;->willTrace()Z
    invoke-static {v8}, Lcom/mongodb/DBCollectionImpl;->access$400(Lcom/mongodb/DBCollectionImpl;)Z

    move-result v8

    if-eqz v8, :cond_3e

    if-nez v7, :cond_40

    :cond_3e
    if-le v0, v13, :cond_58

    .line 439
    :cond_40
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->this$0:Lcom/mongodb/DBCollectionImpl;

    # invokes: Lcom/mongodb/DBCollectionImpl;->getLogger()Ljava/util/logging/Logger;
    invoke-static {v8}, Lcom/mongodb/DBCollectionImpl;->access$500(Lcom/mongodb/DBCollectionImpl;)Ljava/util/logging/Logger;

    move-result-object v8

    const-string v9, "Received response for batch %d"

    new-array v10, v13, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 442
    :cond_58
    invoke-static {v2}, Lcom/mongodb/WriteCommandResultHelper;->hasError(Lcom/mongodb/CommandResult;)Z

    move-result v8

    if-eqz v8, :cond_7b

    .line 443
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->val$type:Lcom/mongodb/WriteRequest$Type;

    invoke-static {v8, v2}, Lcom/mongodb/WriteCommandResultHelper;->getBulkWriteException(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteException;

    move-result-object v8

    invoke-virtual {v1, v8, v5}, Lcom/mongodb/BulkWriteBatchCombiner;->addErrorResult(Lcom/mongodb/BulkWriteException;Lcom/mongodb/IndexMap;)V

    .line 447
    :goto_67
    add-int/2addr v4, v6

    .line 448
    move-object v3, v7

    .line 449
    if-eqz v3, :cond_71

    invoke-virtual {v1}, Lcom/mongodb/BulkWriteBatchCombiner;->shouldStopSendingMoreBatches()Z

    move-result v8

    if-eqz v8, :cond_12

    .line 451
    :cond_71
    invoke-virtual {v1}, Lcom/mongodb/BulkWriteBatchCombiner;->getResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v8

    return-object v8

    .line 434
    .end local v2    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v5    # "indexMap":Lcom/mongodb/IndexMap;
    .end local v6    # "itemCount":I
    :cond_76
    invoke-virtual {v3}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v6

    goto :goto_28

    .line 445
    .restart local v2    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v5    # "indexMap":Lcom/mongodb/IndexMap;
    .restart local v6    # "itemCount":I
    :cond_7b
    iget-object v8, p0, Lcom/mongodb/DBCollectionImpl$2;->val$type:Lcom/mongodb/WriteRequest$Type;

    invoke-static {v8, v2}, Lcom/mongodb/WriteCommandResultHelper;->getBulkWriteResult(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteResult;

    move-result-object v8

    invoke-virtual {v1, v8, v5}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V

    goto :goto_67
.end method

.method public bridge synthetic execute()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 424
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$2;->execute()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method
