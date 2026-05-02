.class Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/MessageThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MessageQueue"
.end annotation


# instance fields
.field private mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized next()Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 3

    .prologue
    .line 223
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_13

    if-nez v1, :cond_8

    .line 224
    const/4 v0, 0x0

    .line 228
    :goto_6
    monitor-exit p0

    return-object v0

    .line 226
    :cond_8
    :try_start_8
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 227
    .local v0, "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_13

    goto :goto_6

    .line 223
    .end local v0    # "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_13
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized removeMessages(I)V
    .registers 6
    .param p1, "what"    # I

    .prologue
    .line 249
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v3, :cond_1c

    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget v3, v3, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-ne v3, p1, :cond_1c

    .line 250
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 251
    .local v0, "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v3}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 252
    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_19

    goto :goto_1

    .line 249
    .end local v0    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_19
    move-exception v3

    monitor-exit p0

    throw v3

    .line 254
    :cond_1c
    :try_start_1c
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v3, :cond_3a

    .line 255
    iget-object v2, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 256
    .local v2, "prev":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v2}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    .line 257
    .restart local v0    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :goto_26
    if-eqz v0, :cond_3a

    .line 258
    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    .line 259
    .local v1, "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget v3, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-ne v3, p1, :cond_38

    .line 260
    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v2, v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 261
    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V
    :try_end_36
    .catchall {:try_start_1c .. :try_end_36} :catchall_19

    .line 265
    :goto_36
    move-object v0, v1

    .line 266
    goto :goto_26

    .line 263
    :cond_38
    move-object v2, v0

    goto :goto_36

    .line 268
    .end local v0    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .end local v1    # "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .end local v2    # "prev":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :cond_3a
    monitor-exit p0

    return-void
.end method

.method declared-synchronized sendMessage(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 4
    .param p1, "item"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .prologue
    .line 237
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-nez v1, :cond_9

    .line 238
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1a

    .line 246
    :goto_7
    monitor-exit p0

    return-void

    .line 241
    :cond_9
    :try_start_9
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 242
    .local v0, "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :goto_b
    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    if-eqz v1, :cond_16

    .line 243
    # getter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    goto :goto_b

    .line 245
    :cond_16
    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v0, p1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_19
    .catchall {:try_start_9 .. :try_end_19} :catchall_1a

    goto :goto_7

    .line 237
    .end local v0    # "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_1a
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized sendMessageAtFrontOfQueue(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .prologue
    .line 232
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    # setter for: Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->next:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {p1, v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 233
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 234
    monitor-exit p0

    return-void

    .line 232
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
