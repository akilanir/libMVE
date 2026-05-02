.class Lch/qos/logback/core/AsyncAppenderBase$Worker;
.super Ljava/lang/Thread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/core/AsyncAppenderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Worker"
.end annotation


# instance fields
.field final synthetic this$0:Lch/qos/logback/core/AsyncAppenderBase;


# direct methods
.method constructor <init>(Lch/qos/logback/core/AsyncAppenderBase;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/AsyncAppenderBase$Worker;->this$0:Lch/qos/logback/core/AsyncAppenderBase;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase$Worker;->this$0:Lch/qos/logback/core/AsyncAppenderBase;

    iget-object v1, v0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    :goto_4
    invoke-virtual {v0}, Lch/qos/logback/core/AsyncAppenderBase;->isStarted()Z

    move-result v2

    if-eqz v2, :cond_15

    :try_start_a
    iget-object v2, v0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appendLoopOnAppenders(Ljava/lang/Object;)I
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_13} :catch_14

    goto :goto_4

    :catch_14
    move-exception v2

    :cond_15
    iget-object v2, p0, Lch/qos/logback/core/AsyncAppenderBase$Worker;->this$0:Lch/qos/logback/core/AsyncAppenderBase;

    const-string v3, "Worker thread will flush remaining events before exiting."

    invoke-virtual {v2, v3}, Lch/qos/logback/core/AsyncAppenderBase;->addInfo(Ljava/lang/String;)V

    iget-object v0, v0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->appendLoopOnAppenders(Ljava/lang/Object;)I

    goto :goto_22

    :cond_30
    invoke-virtual {v1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->detachAndStopAllAppenders()V

    return-void
.end method
