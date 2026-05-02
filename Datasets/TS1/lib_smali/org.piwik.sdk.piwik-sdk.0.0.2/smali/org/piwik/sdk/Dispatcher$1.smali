.class Lorg/piwik/sdk/Dispatcher$1;
.super Ljava/lang/Object;
.source "Dispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/piwik/sdk/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/piwik/sdk/Dispatcher;


# direct methods
.method constructor <init>(Lorg/piwik/sdk/Dispatcher;)V
    .registers 2

    .prologue
    .line 124
    iput-object p1, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    .line 127
    const/16 v6, 0xa

    invoke-static {v6}, Landroid/os/Process;->setThreadPriority(I)V

    .line 128
    :goto_5
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mRunning:Z
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$000(Lorg/piwik/sdk/Dispatcher;)Z

    move-result v6

    if-eqz v6, :cond_e5

    .line 131
    :try_start_d
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$200(Lorg/piwik/sdk/Dispatcher;)Ljava/util/concurrent/Semaphore;

    move-result-object v6

    iget-object v7, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J
    invoke-static {v7}, Lorg/piwik/sdk/Dispatcher;->access$100(Lorg/piwik/sdk/Dispatcher;)J

    move-result-wide v7

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v7, v8, v9}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_1e} :catch_8d

    .line 136
    :goto_1e
    const/4 v1, 0x0

    .line 137
    .local v1, "count":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v0, "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$300(Lorg/piwik/sdk/Dispatcher;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v6

    invoke-interface {v6, v0}, Ljava/util/concurrent/BlockingQueue;->drainTo(Ljava/util/Collection;)I

    .line 139
    const-string v6, "PIWIK:Dispatcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Drained "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " events."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    new-instance v5, Lorg/piwik/sdk/TrackerBulkURLWrapper;

    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mApiUrl:Ljava/net/URL;
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$400(Lorg/piwik/sdk/Dispatcher;)Ljava/net/URL;

    move-result-object v6

    iget-object v7, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mAuthToken:Ljava/lang/String;
    invoke-static {v7}, Lorg/piwik/sdk/Dispatcher;->access$500(Lorg/piwik/sdk/Dispatcher;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v0, v7}, Lorg/piwik/sdk/TrackerBulkURLWrapper;-><init>(Ljava/net/URL;Ljava/util/List;Ljava/lang/String;)V

    .line 141
    .local v5, "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    invoke-virtual {v5}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 142
    .local v4, "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    :cond_64
    :goto_64
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a1

    .line 143
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    .line 146
    .local v3, "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    invoke-virtual {v3}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_92

    .line 147
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v5}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getApiUrl()Ljava/net/URL;

    move-result-object v7

    invoke-virtual {v5, v3}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getEvents(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Lorg/json/JSONObject;

    move-result-object v8

    # invokes: Lorg/piwik/sdk/Dispatcher;->doPost(Ljava/net/URL;Lorg/json/JSONObject;)Z
    invoke-static {v6, v7, v8}, Lorg/piwik/sdk/Dispatcher;->access$600(Lorg/piwik/sdk/Dispatcher;Ljava/net/URL;Lorg/json/JSONObject;)Z

    move-result v6

    if-eqz v6, :cond_64

    .line 148
    invoke-virtual {v3}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v6

    add-int/2addr v1, v6

    goto :goto_64

    .line 132
    .end local v0    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "count":I
    .end local v3    # "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .end local v4    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    .end local v5    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    :catch_8d
    move-exception v2

    .line 133
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1e

    .line 150
    .end local v2    # "e":Ljava/lang/InterruptedException;
    .restart local v0    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "count":I
    .restart local v3    # "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .restart local v4    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    .restart local v5    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    :cond_92
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v5, v3}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getEventUrl(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Ljava/lang/String;

    move-result-object v7

    # invokes: Lorg/piwik/sdk/Dispatcher;->doGet(Ljava/lang/String;)Z
    invoke-static {v6, v7}, Lorg/piwik/sdk/Dispatcher;->access$700(Lorg/piwik/sdk/Dispatcher;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_64

    .line 151
    add-int/lit8 v1, v1, 0x1

    goto :goto_64

    .line 154
    .end local v3    # "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    :cond_a1
    const-string v6, "PIWIK:Dispatcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Dispatched "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " events."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mThreadControl:Ljava/lang/Object;
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$800(Lorg/piwik/sdk/Dispatcher;)Ljava/lang/Object;

    move-result-object v7

    monitor-enter v7

    .line 157
    :try_start_c6
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$300(Lorg/piwik/sdk/Dispatcher;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_de

    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    # getter for: Lorg/piwik/sdk/Dispatcher;->mDispatchInterval:J
    invoke-static {v6}, Lorg/piwik/sdk/Dispatcher;->access$100(Lorg/piwik/sdk/Dispatcher;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-gez v6, :cond_e6

    .line 158
    :cond_de
    iget-object v6, p0, Lorg/piwik/sdk/Dispatcher$1;->this$0:Lorg/piwik/sdk/Dispatcher;

    const/4 v8, 0x0

    # setter for: Lorg/piwik/sdk/Dispatcher;->mRunning:Z
    invoke-static {v6, v8}, Lorg/piwik/sdk/Dispatcher;->access$002(Lorg/piwik/sdk/Dispatcher;Z)Z

    .line 159
    monitor-exit v7

    .line 163
    .end local v0    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "count":I
    .end local v4    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    .end local v5    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    :cond_e5
    return-void

    .line 161
    .restart local v0    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "count":I
    .restart local v4    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    .restart local v5    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    :cond_e6
    monitor-exit v7

    goto/16 :goto_5

    :catchall_e9
    move-exception v6

    monitor-exit v7
    :try_end_eb
    .catchall {:try_start_c6 .. :try_end_eb} :catchall_e9

    throw v6
.end method
