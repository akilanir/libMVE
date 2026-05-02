.class Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;
.super Ljava/lang/Object;
.source "ServerMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ServerMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ServerMonitorRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ServerMonitor;


# direct methods
.method constructor <init>(Lcom/mongodb/ServerMonitor;)V
    .registers 2

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private logStateChange(Lcom/mongodb/ServerDescription;Ljava/lang/Throwable;Lcom/mongodb/ServerDescription;Ljava/lang/Throwable;)V
    .registers 11
    .param p1, "previousServerDescription"    # Lcom/mongodb/ServerDescription;
    .param p2, "previousException"    # Ljava/lang/Throwable;
    .param p3, "currentServerDescription"    # Lcom/mongodb/ServerDescription;
    .param p4, "currentException"    # Ljava/lang/Throwable;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 144
    invoke-static {p1, p3}, Lcom/mongodb/ServerMonitor;->descriptionHasChanged(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-static {p2, p4}, Lcom/mongodb/ServerMonitor;->exceptionHasChanged(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 146
    :cond_e
    if-eqz p4, :cond_2a

    .line 147
    # getter for: Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/mongodb/ServerMonitor;->access$800()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v2, "Exception in monitor thread while connecting to server %s"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v4}, Lcom/mongodb/ServerMonitor;->access$200(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p4}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 153
    :cond_29
    :goto_29
    return-void

    .line 150
    :cond_2a
    # getter for: Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/mongodb/ServerMonitor;->access$800()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, "Monitor thread successfully connected to server with description %s"

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto :goto_29
.end method

.method private sendStateChangedEvent(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)V
    .registers 5
    .param p1, "previousServerDescription"    # Lcom/mongodb/ServerDescription;
    .param p2, "currentServerDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 134
    invoke-static {p1, p2}, Lcom/mongodb/ServerMonitor;->stateHasChanged(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 135
    iget-object v0, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->serverStateListener:Lcom/mongodb/ChangeListener;
    invoke-static {v0}, Lcom/mongodb/ServerMonitor;->access$900(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ChangeListener;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ChangeEvent;

    invoke-direct {v1, p1, p2}, Lcom/mongodb/ChangeEvent;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ChangeListener;->stateChanged(Lcom/mongodb/ChangeEvent;)V

    .line 138
    :cond_14
    return-void
.end method

.method private waitForNext()V
    .registers 15

    .prologue
    const-wide/16 v12, 0x0

    .line 157
    :try_start_2
    invoke-direct {p0}, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->waitForSignalOrTimeout()J

    move-result-wide v4

    .line 158
    .local v4, "timeRemaining":J
    cmp-long v8, v4, v12

    if-lez v8, :cond_39

    .line 159
    iget-object v8, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->settings:Lcom/mongodb/ServerSettings;
    invoke-static {v8}, Lcom/mongodb/ServerMonitor;->access$1000(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerSettings;

    move-result-object v8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v9}, Lcom/mongodb/ServerSettings;->getHeartbeatFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v8

    sub-long v6, v8, v4

    .line 160
    .local v6, "timeWaiting":J
    iget-object v8, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->settings:Lcom/mongodb/ServerSettings;
    invoke-static {v8}, Lcom/mongodb/ServerMonitor;->access$1000(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerSettings;

    move-result-object v8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v9}, Lcom/mongodb/ServerSettings;->getHeartbeatConnectRetryFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    .line 161
    .local v2, "minimumNanosToWait":J
    cmp-long v8, v6, v2

    if-gez v8, :cond_39

    .line 162
    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sub-long v9, v2, v6

    sget-object v11, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v9, v10, v11}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    .line 163
    .local v0, "millisToSleep":J
    cmp-long v8, v0, v12

    if-lez v8, :cond_39

    .line 164
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_39
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_39} :catch_3a

    .line 171
    .end local v0    # "millisToSleep":J
    .end local v2    # "minimumNanosToWait":J
    .end local v4    # "timeRemaining":J
    .end local v6    # "timeWaiting":J
    :cond_39
    :goto_39
    return-void

    .line 168
    :catch_3a
    move-exception v8

    goto :goto_39
.end method

.method private waitForSignalOrTimeout()J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v0}, Lcom/mongodb/ServerMonitor;->access$1100(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 176
    :try_start_9
    iget-object v0, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->condition:Ljava/util/concurrent/locks/Condition;
    invoke-static {v0}, Lcom/mongodb/ServerMonitor;->access$1200(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->settings:Lcom/mongodb/ServerSettings;
    invoke-static {v1}, Lcom/mongodb/ServerMonitor;->access$1000(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerSettings;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2}, Lcom/mongodb/ServerSettings;->getHeartbeatFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J
    :try_end_1e
    .catchall {:try_start_9 .. :try_end_1e} :catchall_29

    move-result-wide v0

    .line 178
    iget-object v2, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lcom/mongodb/ServerMonitor;->access$1100(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide v0

    :catchall_29
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lcom/mongodb/ServerMonitor;->access$1100(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method


# virtual methods
.method public run()V
    .registers 14

    .prologue
    .line 78
    const/4 v0, 0x0

    .line 80
    .local v0, "connection":Lcom/mongodb/DBPort;
    :try_start_1
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    const/4 v10, 0x0

    # invokes: Lcom/mongodb/ServerMonitor;->getConnectingServerDescription(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;
    invoke-static {v9, v10}, Lcom/mongodb/ServerMonitor;->access$000(Lcom/mongodb/ServerMonitor;Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_96

    move-result-object v3

    .line 81
    .local v3, "currentServerDescription":Lcom/mongodb/ServerDescription;
    const/4 v2, 0x0

    .local v2, "currentException":Ljava/lang/Throwable;
    move-object v1, v0

    .line 82
    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .local v1, "connection":Lcom/mongodb/DBPort;
    :goto_a
    :try_start_a
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->isClosed:Z
    invoke-static {v9}, Lcom/mongodb/ServerMonitor;->access$100(Lcom/mongodb/ServerMonitor;)Z
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_a3

    move-result v9

    if-nez v9, :cond_9d

    .line 83
    move-object v7, v3

    .line 84
    .local v7, "previousServerDescription":Lcom/mongodb/ServerDescription;
    move-object v6, v2

    .line 86
    .local v6, "previousException":Ljava/lang/Throwable;
    if-nez v1, :cond_a9

    .line 87
    :try_start_16
    new-instance v0, Lcom/mongodb/DBPort;

    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v9}, Lcom/mongodb/ServerMonitor;->access$200(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerAddress;

    move-result-object v9

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # invokes: Lcom/mongodb/ServerMonitor;->getOptions()Lcom/mongodb/MongoOptions;
    invoke-static {v11}, Lcom/mongodb/ServerMonitor;->access$300(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/MongoOptions;

    move-result-object v11

    const/4 v12, 0x0

    invoke-direct {v0, v9, v10, v11, v12}, Lcom/mongodb/DBPort;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/MongoOptions;I)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_29} :catch_a6
    .catchall {:try_start_16 .. :try_end_29} :catchall_a3

    .line 90
    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    :goto_29
    :try_start_29
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # invokes: Lcom/mongodb/ServerMonitor;->lookupServerDescription(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    invoke-static {v9, v0}, Lcom/mongodb/ServerMonitor;->access$400(Lcom/mongodb/ServerMonitor;Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2e} :catch_42
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_2e} :catch_80
    .catchall {:try_start_29 .. :try_end_2e} :catchall_96

    move-result-object v3

    .line 115
    :goto_2f
    :try_start_2f
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->isClosed:Z
    invoke-static {v9}, Lcom/mongodb/ServerMonitor;->access$100(Lcom/mongodb/ServerMonitor;)Z
    :try_end_34
    .catchall {:try_start_2f .. :try_end_34} :catchall_96

    move-result v9

    if-nez v9, :cond_3d

    .line 117
    :try_start_37
    invoke-direct {p0, v7, v6, v3, v2}, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->logStateChange(Lcom/mongodb/ServerDescription;Ljava/lang/Throwable;Lcom/mongodb/ServerDescription;Ljava/lang/Throwable;)V

    .line 118
    invoke-direct {p0, v7, v3}, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->sendStateChangedEvent(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_3d} :catch_89
    .catchall {:try_start_37 .. :try_end_3d} :catchall_96

    .line 123
    :cond_3d
    :goto_3d
    :try_start_3d
    invoke-direct {p0}, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->waitForNext()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_96

    move-object v1, v0

    .line 124
    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .restart local v1    # "connection":Lcom/mongodb/DBPort;
    goto :goto_a

    .line 91
    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    :catch_42
    move-exception v4

    .line 94
    .local v4, "e":Ljava/io/IOException;
    :try_start_43
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    const/4 v10, 0x0

    # setter for: Lcom/mongodb/ServerMonitor;->count:I
    invoke-static {v9, v10}, Lcom/mongodb/ServerMonitor;->access$502(Lcom/mongodb/ServerMonitor;I)I

    .line 95
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    const-wide/16 v10, 0x0

    # setter for: Lcom/mongodb/ServerMonitor;->elapsedNanosSum:J
    invoke-static {v9, v10, v11}, Lcom/mongodb/ServerMonitor;->access$602(Lcom/mongodb/ServerMonitor;J)J

    .line 96
    if-eqz v0, :cond_5f

    .line 97
    invoke-virtual {v0}, Lcom/mongodb/DBPort;->close()V

    .line 98
    const/4 v0, 0x0

    .line 99
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;
    invoke-static {v9}, Lcom/mongodb/ServerMonitor;->access$700(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/PooledConnectionProvider;

    move-result-object v9

    invoke-virtual {v9}, Lcom/mongodb/PooledConnectionProvider;->invalidate()V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_5f} :catch_80
    .catchall {:try_start_43 .. :try_end_5f} :catchall_96

    :cond_5f
    move-object v1, v0

    .line 101
    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .restart local v1    # "connection":Lcom/mongodb/DBPort;
    :try_start_60
    new-instance v0, Lcom/mongodb/DBPort;

    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # getter for: Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v9}, Lcom/mongodb/ServerMonitor;->access$200(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerAddress;

    move-result-object v9

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # invokes: Lcom/mongodb/ServerMonitor;->getOptions()Lcom/mongodb/MongoOptions;
    invoke-static {v11}, Lcom/mongodb/ServerMonitor;->access$300(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/MongoOptions;

    move-result-object v11

    const/4 v12, 0x0

    invoke-direct {v0, v9, v10, v11, v12}, Lcom/mongodb/DBPort;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/MongoOptions;I)V
    :try_end_73
    .catch Ljava/lang/Throwable; {:try_start_60 .. :try_end_73} :catch_a6
    .catchall {:try_start_60 .. :try_end_73} :catchall_a3

    .line 103
    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    :try_start_73
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # invokes: Lcom/mongodb/ServerMonitor;->lookupServerDescription(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    invoke-static {v9, v0}, Lcom/mongodb/ServerMonitor;->access$400(Lcom/mongodb/ServerMonitor;Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    :try_end_78
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_78} :catch_7a
    .catch Ljava/lang/Throwable; {:try_start_73 .. :try_end_78} :catch_80
    .catchall {:try_start_73 .. :try_end_78} :catchall_96

    move-result-object v3

    goto :goto_2f

    .line 104
    :catch_7a
    move-exception v5

    .line 105
    .local v5, "e1":Ljava/io/IOException;
    :try_start_7b
    invoke-virtual {v0}, Lcom/mongodb/DBPort;->close()V

    .line 106
    const/4 v0, 0x0

    .line 107
    throw v5
    :try_end_80
    .catch Ljava/lang/Throwable; {:try_start_7b .. :try_end_80} :catch_80
    .catchall {:try_start_7b .. :try_end_80} :catchall_96

    .line 110
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "e1":Ljava/io/IOException;
    :catch_80
    move-exception v8

    .line 111
    .local v8, "t":Ljava/lang/Throwable;
    :goto_81
    move-object v2, v8

    .line 112
    :try_start_82
    iget-object v9, p0, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;->this$0:Lcom/mongodb/ServerMonitor;

    # invokes: Lcom/mongodb/ServerMonitor;->getConnectingServerDescription(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;
    invoke-static {v9, v8}, Lcom/mongodb/ServerMonitor;->access$000(Lcom/mongodb/ServerMonitor;Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;

    move-result-object v3

    goto :goto_2f

    .line 119
    .end local v8    # "t":Ljava/lang/Throwable;
    :catch_89
    move-exception v8

    .line 120
    .restart local v8    # "t":Ljava/lang/Throwable;
    # getter for: Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/mongodb/ServerMonitor;->access$800()Ljava/util/logging/Logger;

    move-result-object v9

    sget-object v10, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v11, "Exception in monitor thread during notification of server state change"

    invoke-virtual {v9, v10, v11, v8}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_95
    .catchall {:try_start_82 .. :try_end_95} :catchall_96

    goto :goto_3d

    .line 126
    .end local v2    # "currentException":Ljava/lang/Throwable;
    .end local v3    # "currentServerDescription":Lcom/mongodb/ServerDescription;
    .end local v6    # "previousException":Ljava/lang/Throwable;
    .end local v7    # "previousServerDescription":Lcom/mongodb/ServerDescription;
    .end local v8    # "t":Ljava/lang/Throwable;
    :catchall_96
    move-exception v9

    :goto_97
    if-eqz v0, :cond_9c

    .line 127
    invoke-virtual {v0}, Lcom/mongodb/DBPort;->close()V

    :cond_9c
    throw v9

    .line 126
    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .restart local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v2    # "currentException":Ljava/lang/Throwable;
    .restart local v3    # "currentServerDescription":Lcom/mongodb/ServerDescription;
    :cond_9d
    if-eqz v1, :cond_a2

    .line 127
    invoke-virtual {v1}, Lcom/mongodb/DBPort;->close()V

    .line 130
    :cond_a2
    return-void

    .line 126
    :catchall_a3
    move-exception v9

    move-object v0, v1

    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    goto :goto_97

    .line 110
    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .restart local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v6    # "previousException":Ljava/lang/Throwable;
    .restart local v7    # "previousServerDescription":Lcom/mongodb/ServerDescription;
    :catch_a6
    move-exception v8

    move-object v0, v1

    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    goto :goto_81

    .end local v0    # "connection":Lcom/mongodb/DBPort;
    .restart local v1    # "connection":Lcom/mongodb/DBPort;
    :cond_a9
    move-object v0, v1

    .end local v1    # "connection":Lcom/mongodb/DBPort;
    .restart local v0    # "connection":Lcom/mongodb/DBPort;
    goto/16 :goto_29
.end method
