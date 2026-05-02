.class public final Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/allocations/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "StreamAllocation"
.end annotation


# instance fields
.field private released:Z

.field private rescinded:Z

.field private stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/allocations/Connection;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/allocations/Connection;)V
    .registers 2
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/allocations/Connection;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->this$0:Lcom/squareup/okhttp/internal/allocations/Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/allocations/Connection;Lcom/squareup/okhttp/internal/allocations/Connection$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/allocations/Connection$1;

    .prologue
    .line 163
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;-><init>(Lcom/squareup/okhttp/internal/allocations/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    .prologue
    .line 163
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z

    return v0
.end method

.method static synthetic access$102(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    .param p1, "x1"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z

    return p1
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)Lcom/squareup/okhttp/internal/allocations/Connection$Stream;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    return-object v0
.end method

.method static synthetic access$602(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    .param p1, "x1"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->rescinded:Z

    return p1
.end method


# virtual methods
.method public newStream(Ljava/lang/String;)Lcom/squareup/okhttp/internal/allocations/Connection$Stream;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->this$0:Lcom/squareup/okhttp/internal/allocations/Connection;

    # getter for: Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/allocations/Connection;->access$400(Lcom/squareup/okhttp/internal/allocations/Connection;)Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v1

    monitor-enter v1

    .line 186
    :try_start_7
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    if-nez v0, :cond_f

    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z

    if-eqz v0, :cond_18

    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 190
    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_7 .. :try_end_17} :catchall_15

    throw v0

    .line 187
    :cond_18
    :try_start_18
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->rescinded:Z

    if-eqz v0, :cond_1f

    const/4 v0, 0x0

    monitor-exit v1

    .line 189
    :goto_1e
    return-object v0

    .line 188
    :cond_1f
    new-instance v0, Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    invoke-direct {v0, p1}, Lcom/squareup/okhttp/internal/allocations/Connection$Stream;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    .line 189
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    monitor-exit v1
    :try_end_29
    .catchall {:try_start_18 .. :try_end_29} :catchall_15

    goto :goto_1e
.end method

.method public streamComplete(Lcom/squareup/okhttp/internal/allocations/Connection$Stream;)V
    .registers 4
    .param p1, "stream"    # Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->this$0:Lcom/squareup/okhttp/internal/allocations/Connection;

    # getter for: Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/allocations/Connection;->access$400(Lcom/squareup/okhttp/internal/allocations/Connection;)Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v1

    monitor-enter v1

    .line 195
    if-eqz p1, :cond_d

    :try_start_9
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    if-eq p1, v0, :cond_16

    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 200
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_9 .. :try_end_15} :catchall_13

    throw v0

    .line 196
    :cond_16
    const/4 v0, 0x0

    :try_start_17
    iput-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    .line 197
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z

    if-eqz v0, :cond_22

    .line 198
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->this$0:Lcom/squareup/okhttp/internal/allocations/Connection;

    # invokes: Lcom/squareup/okhttp/internal/allocations/Connection;->remove(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V
    invoke-static {v0, p0}, Lcom/squareup/okhttp/internal/allocations/Connection;->access$500(Lcom/squareup/okhttp/internal/allocations/Connection;Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V

    .line 200
    :cond_22
    monitor-exit v1
    :try_end_23
    .catchall {:try_start_17 .. :try_end_23} :catchall_13

    .line 201
    return-void
.end method
