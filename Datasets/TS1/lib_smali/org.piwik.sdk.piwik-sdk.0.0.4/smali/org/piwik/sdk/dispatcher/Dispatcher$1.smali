.class Lorg/piwik/sdk/dispatcher/Dispatcher$1;
.super Ljava/lang/Object;
.source "Dispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/piwik/sdk/dispatcher/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;


# direct methods
.method constructor <init>(Lorg/piwik/sdk/dispatcher/Dispatcher;)V
    .registers 2
    .param p1, "this$0"    # Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 133
    iput-object p1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 136
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 137
    :goto_5
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z
    invoke-static {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$000(Lorg/piwik/sdk/dispatcher/Dispatcher;)Z

    move-result v0

    if-eqz v0, :cond_f7

    .line 140
    :try_start_d
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mSleepToken:Ljava/util/concurrent/Semaphore;
    invoke-static {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$200(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    iget-object v1, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J
    invoke-static {v1}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$100(Lorg/piwik/sdk/dispatcher/Dispatcher;)J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_1e} :catch_1f

    .line 143
    goto :goto_23

    .line 141
    :catch_1f
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 145
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_23
    const/4 v0, 0x0

    .line 146
    .local v0, "count":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v1, "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v2}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$300(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/concurrent/BlockingQueue;->drainTo(Ljava/util/Collection;)I

    .line 148
    const-string v2, "PIWIK:Dispatcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Drained "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " events."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    new-instance v2, Lorg/piwik/sdk/TrackerBulkURLWrapper;

    iget-object v3, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mApiUrl:Ljava/net/URL;
    invoke-static {v3}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$400(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/net/URL;

    move-result-object v3

    iget-object v4, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mAuthToken:Ljava/lang/String;
    invoke-static {v4}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$500(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lorg/piwik/sdk/TrackerBulkURLWrapper;-><init>(Ljava/net/URL;Ljava/util/List;Ljava/lang/String;)V

    .line 150
    .local v2, "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    invoke-virtual {v2}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 151
    .local v3, "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    :goto_66
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ae

    .line 152
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    .line 155
    .local v4, "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    invoke-virtual {v4}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_97

    .line 156
    invoke-virtual {v2, v4}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getEvents(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Lorg/json/JSONObject;

    move-result-object v5

    .line 157
    .local v5, "eventData":Lorg/json/JSONObject;
    if-nez v5, :cond_80

    .line 158
    goto :goto_66

    .line 159
    :cond_80
    iget-object v6, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    new-instance v7, Lorg/piwik/sdk/dispatcher/Packet;

    invoke-virtual {v2}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getApiUrl()Ljava/net/URL;

    move-result-object v8

    invoke-direct {v7, v8, v5}, Lorg/piwik/sdk/dispatcher/Packet;-><init>(Ljava/net/URL;Lorg/json/JSONObject;)V

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/dispatcher/Dispatcher;->dispatch(Lorg/piwik/sdk/dispatcher/Packet;)Z

    move-result v6

    if-eqz v6, :cond_96

    .line 160
    invoke-virtual {v4}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->elementsCount()I

    move-result v6

    add-int/2addr v0, v6

    .line 161
    .end local v5    # "eventData":Lorg/json/JSONObject;
    :cond_96
    goto :goto_ad

    .line 162
    :cond_97
    invoke-virtual {v2, v4}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getEventUrl(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Ljava/net/URL;

    move-result-object v5

    .line 163
    .local v5, "targetURL":Ljava/net/URL;
    if-nez v5, :cond_9e

    .line 164
    goto :goto_66

    .line 165
    :cond_9e
    iget-object v6, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    new-instance v7, Lorg/piwik/sdk/dispatcher/Packet;

    invoke-direct {v7, v5}, Lorg/piwik/sdk/dispatcher/Packet;-><init>(Ljava/net/URL;)V

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/dispatcher/Dispatcher;->dispatch(Lorg/piwik/sdk/dispatcher/Packet;)Z

    move-result v6

    if-eqz v6, :cond_ad

    .line 166
    add-int/lit8 v0, v0, 0x1

    .line 168
    .end local v4    # "page":Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .end local v5    # "targetURL":Ljava/net/URL;
    :cond_ad
    :goto_ad
    goto :goto_66

    .line 169
    :cond_ae
    const-string v4, "PIWIK:Dispatcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Dispatched "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " events."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    iget-object v4, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mThreadControl:Ljava/lang/Object;
    invoke-static {v4}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$600(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 172
    :try_start_d0
    iget-object v5, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchQueue:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v5}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$300(Lorg/piwik/sdk/dispatcher/Dispatcher;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_ec

    iget-object v5, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    # getter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mDispatchInterval:J
    invoke-static {v5}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$100(Lorg/piwik/sdk/dispatcher/Dispatcher;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-gez v9, :cond_e9

    goto :goto_ec

    .line 176
    :cond_e9
    monitor-exit v4

    .line 177
    .end local v0    # "count":I
    .end local v1    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    .end local v3    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    goto/16 :goto_5

    .line 173
    .restart local v0    # "count":I
    .restart local v1    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    .restart local v3    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    :cond_ec
    :goto_ec
    iget-object v5, p0, Lorg/piwik/sdk/dispatcher/Dispatcher$1;->this$0:Lorg/piwik/sdk/dispatcher/Dispatcher;

    const/4 v6, 0x0

    # setter for: Lorg/piwik/sdk/dispatcher/Dispatcher;->mRunning:Z
    invoke-static {v5, v6}, Lorg/piwik/sdk/dispatcher/Dispatcher;->access$002(Lorg/piwik/sdk/dispatcher/Dispatcher;Z)Z

    .line 174
    monitor-exit v4

    goto :goto_f7

    .line 176
    :catchall_f4
    move-exception v5

    monitor-exit v4
    :try_end_f6
    .catchall {:try_start_d0 .. :try_end_f6} :catchall_f4

    throw v5

    .line 178
    .end local v0    # "count":I
    .end local v1    # "availableEvents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "wrapper":Lorg/piwik/sdk/TrackerBulkURLWrapper;
    .end local v3    # "pageIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;>;"
    :cond_f7
    :goto_f7
    return-void
.end method
