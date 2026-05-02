.class Lorg/junit/rules/TestWatcher$1;
.super Lorg/junit/runners/model/Statement;
.source "TestWatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/rules/TestWatcher;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/rules/TestWatcher;

.field final synthetic val$base:Lorg/junit/runners/model/Statement;

.field final synthetic val$description:Lorg/junit/runner/Description;


# direct methods
.method constructor <init>(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Lorg/junit/runners/model/Statement;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 50
    iput-object p1, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iput-object p2, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    iput-object p3, p0, Lorg/junit/rules/TestWatcher$1;->val$base:Lorg/junit/runners/model/Statement;

    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    return-void
.end method


# virtual methods
.method public evaluate()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->startingQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v3, v1}, Lorg/junit/rules/TestWatcher;->access$000(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V

    .line 55
    :try_start_c
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->val$base:Lorg/junit/runners/model/Statement;

    invoke-virtual {v2}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 56
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->succeededQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v3, v1}, Lorg/junit/rules/TestWatcher;->access$100(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V
    :try_end_18
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_c .. :try_end_18} :catch_23
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_18} :catch_36
    .catchall {:try_start_c .. :try_end_18} :catchall_49

    .line 64
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v3, v1}, Lorg/junit/rules/TestWatcher;->access$400(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V

    .line 67
    :goto_1f
    invoke-static {v1}, Lorg/junit/runners/model/MultipleFailureException;->assertEmpty(Ljava/util/List;)V

    .line 68
    return-void

    .line 57
    :catch_23
    move-exception v0

    .line 58
    .local v0, "e":Lorg/junit/internal/AssumptionViolatedException;
    :try_start_24
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->skippedQuietly(Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v0, v3, v1}, Lorg/junit/rules/TestWatcher;->access$200(Lorg/junit/rules/TestWatcher;Lorg/junit/internal/AssumptionViolatedException;Lorg/junit/runner/Description;Ljava/util/List;)V
    :try_end_2e
    .catchall {:try_start_24 .. :try_end_2e} :catchall_49

    .line 64
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v3, v1}, Lorg/junit/rules/TestWatcher;->access$400(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V

    goto :goto_1f

    .line 60
    .end local v0    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_36
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_37
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->failedQuietly(Ljava/lang/Throwable;Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v0, v3, v1}, Lorg/junit/rules/TestWatcher;->access$300(Lorg/junit/rules/TestWatcher;Ljava/lang/Throwable;Lorg/junit/runner/Description;Ljava/util/List;)V
    :try_end_41
    .catchall {:try_start_37 .. :try_end_41} :catchall_49

    .line 64
    iget-object v2, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v2, v3, v1}, Lorg/junit/rules/TestWatcher;->access$400(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V

    goto :goto_1f

    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_49
    move-exception v2

    iget-object v3, p0, Lorg/junit/rules/TestWatcher$1;->this$0:Lorg/junit/rules/TestWatcher;

    iget-object v4, p0, Lorg/junit/rules/TestWatcher$1;->val$description:Lorg/junit/runner/Description;

    # invokes: Lorg/junit/rules/TestWatcher;->finishedQuietly(Lorg/junit/runner/Description;Ljava/util/List;)V
    invoke-static {v3, v4, v1}, Lorg/junit/rules/TestWatcher;->access$400(Lorg/junit/rules/TestWatcher;Lorg/junit/runner/Description;Ljava/util/List;)V

    throw v2
.end method
