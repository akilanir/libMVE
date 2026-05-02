.class Lzmq/ZMQ$PollSelector;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PollSelector"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private selector:Ljava/nio/channels/Selector;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 803
    const-class v0, Lzmq/ZMQ;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/ZMQ$PollSelector;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private constructor <init>(Ljava/nio/channels/Selector;)V
    .registers 2
    .param p1, "selector"    # Ljava/nio/channels/Selector;

    .prologue
    .line 808
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 809
    iput-object p1, p0, Lzmq/ZMQ$PollSelector;->selector:Ljava/nio/channels/Selector;

    .line 810
    return-void
.end method

.method public static open()Ljava/nio/channels/Selector;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 814
    # getter for: Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;
    invoke-static {}, Lzmq/ZMQ;->access$000()Ljava/lang/ThreadLocal;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/ZMQ$PollSelector;

    .line 815
    .local v2, "polls":Lzmq/ZMQ$PollSelector;
    if-nez v2, :cond_31

    .line 816
    # getter for: Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;
    invoke-static {}, Lzmq/ZMQ;->access$000()Ljava/lang/ThreadLocal;

    move-result-object v5

    monitor-enter v5

    .line 817
    :try_start_11
    # getter for: Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;
    invoke-static {}, Lzmq/ZMQ;->access$000()Ljava/lang/ThreadLocal;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lzmq/ZMQ$PollSelector;

    move-object v2, v0
    :try_end_1d
    .catchall {:try_start_11 .. :try_end_1d} :catchall_3d

    .line 819
    if-nez v2, :cond_30

    .line 820
    :try_start_1f
    new-instance v3, Lzmq/ZMQ$PollSelector;

    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v4

    invoke-direct {v3, v4}, Lzmq/ZMQ$PollSelector;-><init>(Ljava/nio/channels/Selector;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_28} :catch_36
    .catchall {:try_start_1f .. :try_end_28} :catchall_3d

    .line 821
    .end local v2    # "polls":Lzmq/ZMQ$PollSelector;
    .local v3, "polls":Lzmq/ZMQ$PollSelector;
    :try_start_28
    # getter for: Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;
    invoke-static {}, Lzmq/ZMQ;->access$000()Ljava/lang/ThreadLocal;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_2f} :catch_43
    .catchall {:try_start_28 .. :try_end_2f} :catchall_40

    move-object v2, v3

    .line 827
    .end local v3    # "polls":Lzmq/ZMQ$PollSelector;
    .restart local v2    # "polls":Lzmq/ZMQ$PollSelector;
    :cond_30
    :try_start_30
    monitor-exit v5
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_3d

    .line 829
    :cond_31
    invoke-virtual {v2}, Lzmq/ZMQ$PollSelector;->get()Ljava/nio/channels/Selector;

    move-result-object v4

    return-object v4

    .line 824
    :catch_36
    move-exception v1

    .line 825
    .local v1, "e":Ljava/io/IOException;
    :goto_37
    :try_start_37
    new-instance v4, Lzmq/ZError$IOException;

    invoke-direct {v4, v1}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v4

    .line 827
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_3d
    move-exception v4

    :goto_3e
    monitor-exit v5
    :try_end_3f
    .catchall {:try_start_37 .. :try_end_3f} :catchall_3d

    throw v4

    .end local v2    # "polls":Lzmq/ZMQ$PollSelector;
    .restart local v3    # "polls":Lzmq/ZMQ$PollSelector;
    :catchall_40
    move-exception v4

    move-object v2, v3

    .end local v3    # "polls":Lzmq/ZMQ$PollSelector;
    .restart local v2    # "polls":Lzmq/ZMQ$PollSelector;
    goto :goto_3e

    .line 824
    .end local v2    # "polls":Lzmq/ZMQ$PollSelector;
    .restart local v3    # "polls":Lzmq/ZMQ$PollSelector;
    :catch_43
    move-exception v1

    move-object v2, v3

    .end local v3    # "polls":Lzmq/ZMQ$PollSelector;
    .restart local v2    # "polls":Lzmq/ZMQ$PollSelector;
    goto :goto_37
.end method


# virtual methods
.method public finalize()V
    .registers 2

    .prologue
    .line 843
    :try_start_0
    iget-object v0, p0, Lzmq/ZMQ$PollSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_b

    .line 848
    :goto_5
    :try_start_5
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_8} :catch_9

    .line 852
    :goto_8
    return-void

    .line 850
    :catch_9
    move-exception v0

    goto :goto_8

    .line 845
    :catch_b
    move-exception v0

    goto :goto_5
.end method

.method public get()Ljava/nio/channels/Selector;
    .registers 2

    .prologue
    .line 834
    sget-boolean v0, Lzmq/ZMQ$PollSelector;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/ZMQ$PollSelector;->selector:Ljava/nio/channels/Selector;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 835
    :cond_e
    sget-boolean v0, Lzmq/ZMQ$PollSelector;->$assertionsDisabled:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Lzmq/ZMQ$PollSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v0

    if-nez v0, :cond_20

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 836
    :cond_20
    iget-object v0, p0, Lzmq/ZMQ$PollSelector;->selector:Ljava/nio/channels/Selector;

    return-object v0
.end method
