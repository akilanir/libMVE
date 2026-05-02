.class final Lorg/junit/experimental/max/MaxHistory$RememberingListener;
.super Lorg/junit/runner/notification/RunListener;
.source "MaxHistory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/max/MaxHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RememberingListener"
.end annotation


# instance fields
.field private overallStart:J

.field private starts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/junit/runner/Description;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/junit/experimental/max/MaxHistory;


# direct methods
.method private constructor <init>(Lorg/junit/experimental/max/MaxHistory;)V
    .registers 4

    .prologue
    .line 104
    iput-object p1, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-direct {p0}, Lorg/junit/runner/notification/RunListener;-><init>()V

    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->overallStart:J

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/experimental/max/MaxHistory;Lorg/junit/experimental/max/MaxHistory$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/experimental/max/MaxHistory;
    .param p2, "x1"    # Lorg/junit/experimental/max/MaxHistory$1;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxHistory$RememberingListener;-><init>(Lorg/junit/experimental/max/MaxHistory;)V

    return-void
.end method


# virtual methods
.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 6
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {p1}, Lorg/junit/runner/notification/Failure;->getDescription()Lorg/junit/runner/Description;

    move-result-object v1

    iget-wide v2, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->overallStart:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/junit/experimental/max/MaxHistory;->putTestFailureTimestamp(Lorg/junit/runner/Description;J)V

    .line 125
    return-void
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .registers 9
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 117
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 118
    .local v0, "end":J
    iget-object v4, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 119
    .local v2, "start":J
    iget-object v4, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    sub-long v5, v0, v2

    invoke-virtual {v4, p1, v5, v6}, Lorg/junit/experimental/max/MaxHistory;->putTestDuration(Lorg/junit/runner/Description;J)V

    .line 120
    return-void
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .registers 3
    .param p1, "result"    # Lorg/junit/runner/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->this$0:Lorg/junit/experimental/max/MaxHistory;

    # invokes: Lorg/junit/experimental/max/MaxHistory;->save()V
    invoke-static {v0}, Lorg/junit/experimental/max/MaxHistory;->access$000(Lorg/junit/experimental/max/MaxHistory;)V

    .line 130
    return-void
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;->starts:Ljava/util/Map;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    return-void
.end method
