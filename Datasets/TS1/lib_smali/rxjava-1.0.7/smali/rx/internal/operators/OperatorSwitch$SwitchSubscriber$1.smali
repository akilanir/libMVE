.class Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;
.super Ljava/lang/Object;
.source "OperatorSwitch.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;-><init>(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;)V
    .registers 2

    .prologue
    .line 83
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .registers 6
    .param p1, "n"    # J

    .prologue
    .line 87
    .local p0, "this":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber.1;"
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iget-boolean v1, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->infinite:Z

    if-eqz v1, :cond_7

    .line 107
    :cond_6
    :goto_6
    return-void

    .line 90
    :cond_7
    const-wide v1, 0x7fffffffffffffffL

    cmp-long v1, p1, v1

    if-nez v1, :cond_15

    .line 91
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->infinite:Z

    .line 94
    :cond_15
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iget-object v2, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v2

    .line 95
    :try_start_1a
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iget-object v0, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    .line 96
    .local v0, "localSubscriber":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>.InnerSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iget-object v1, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    if-nez v1, :cond_2f

    .line 97
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iput-wide p1, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->initialRequested:J

    .line 103
    :goto_28
    monitor-exit v2
    :try_end_29
    .catchall {:try_start_1a .. :try_end_29} :catchall_37

    .line 104
    if-eqz v0, :cond_6

    .line 105
    invoke-virtual {v0, p1, p2}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requestMore(J)V

    goto :goto_6

    .line 101
    :cond_2f
    :try_start_2f
    iget-object v1, p0, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$1;->this$0:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;

    iget-object v1, v1, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber;->currentSubscriber:Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;

    # += operator for: Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->requested:J
    invoke-static {v1, p1, p2}, Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;->access$114(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;J)J

    goto :goto_28

    .line 103
    .end local v0    # "localSubscriber":Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;, "Lrx/internal/operators/OperatorSwitch$SwitchSubscriber<TT;>.InnerSubscriber;"
    :catchall_37
    move-exception v1

    monitor-exit v2
    :try_end_39
    .catchall {:try_start_2f .. :try_end_39} :catchall_37

    throw v1
.end method
