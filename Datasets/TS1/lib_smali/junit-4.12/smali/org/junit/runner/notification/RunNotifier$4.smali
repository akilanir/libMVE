.class Lorg/junit/runner/notification/RunNotifier$4;
.super Lorg/junit/runner/notification/RunNotifier$SafeNotifier;
.source "RunNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runner/notification/RunNotifier;->fireTestFailures(Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runner/notification/RunNotifier;

.field final synthetic val$failures:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 140
    .local p2, "x0":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/notification/RunListener;>;"
    iput-object p1, p0, Lorg/junit/runner/notification/RunNotifier$4;->this$0:Lorg/junit/runner/notification/RunNotifier;

    iput-object p3, p0, Lorg/junit/runner/notification/RunNotifier$4;->val$failures:Ljava/util/List;

    invoke-direct {p0, p1, p2}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;-><init>(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method protected notifyListener(Lorg/junit/runner/notification/RunListener;)V
    .registers 5
    .param p1, "listener"    # Lorg/junit/runner/notification/RunListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v2, p0, Lorg/junit/runner/notification/RunNotifier$4;->val$failures:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/notification/Failure;

    .line 142
    .local v0, "each":Lorg/junit/runner/notification/Failure;
    invoke-virtual {p1, v0}, Lorg/junit/runner/notification/RunListener;->testFailure(Lorg/junit/runner/notification/Failure;)V

    goto :goto_6

    .line 144
    .end local v0    # "each":Lorg/junit/runner/notification/Failure;
    :cond_16
    return-void
.end method
