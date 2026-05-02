.class Lorg/junit/runner/Result$Listener;
.super Lorg/junit/runner/notification/RunListener;
.source "Result.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runner/Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Listener"
.end annotation

.annotation runtime Lorg/junit/runner/notification/RunListener$ThreadSafe;
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runner/Result;


# direct methods
.method private constructor <init>(Lorg/junit/runner/Result;)V
    .registers 2

    .prologue
    .line 111
    iput-object p1, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/runner/Result;Lorg/junit/runner/Result$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/runner/Result;
    .param p2, "x1"    # Lorg/junit/runner/Result$1;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lorg/junit/runner/Result$Listener;-><init>(Lorg/junit/runner/Result;)V

    return-void
.end method


# virtual methods
.method public testAssumptionFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 2
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;

    .prologue
    .line 141
    return-void
.end method

.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 3
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->failures:Ljava/util/concurrent/CopyOnWriteArrayList;
    invoke-static {v0}, Lorg/junit/runner/Result;->access$800(Lorg/junit/runner/Result;)Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    return-void
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->count:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v0}, Lorg/junit/runner/Result;->access$700(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 126
    return-void
.end method

.method public testIgnored(Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->ignoreCount:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v0}, Lorg/junit/runner/Result;->access$900(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 136
    return-void
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .registers 7
    .param p1, "result"    # Lorg/junit/runner/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 120
    .local v0, "endTime":J
    iget-object v2, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->runTime:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v2}, Lorg/junit/runner/Result;->access$600(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    iget-object v3, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->startTime:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v3}, Lorg/junit/runner/Result;->access$500(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 121
    return-void
.end method

.method public testRunStarted(Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lorg/junit/runner/Result$Listener;->this$0:Lorg/junit/runner/Result;

    # getter for: Lorg/junit/runner/Result;->startTime:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v0}, Lorg/junit/runner/Result;->access$500(Lorg/junit/runner/Result;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 115
    return-void
.end method
