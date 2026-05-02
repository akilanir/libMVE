.class abstract Lorg/junit/runner/notification/RunNotifier$SafeNotifier;
.super Ljava/lang/Object;
.source "RunNotifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runner/notification/RunNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "SafeNotifier"
.end annotation


# instance fields
.field private final currentListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/notification/RunListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method constructor <init>(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 3

    .prologue
    .line 59
    # getter for: Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;
    invoke-static {p1}, Lorg/junit/runner/notification/RunNotifier;->access$000(Lorg/junit/runner/notification/RunNotifier;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;-><init>(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;)V

    .line 60
    return-void
.end method

.method constructor <init>(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/notification/RunListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p2, "currentListeners":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/notification/RunListener;>;"
    iput-object p1, p0, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->this$0:Lorg/junit/runner/notification/RunNotifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p2, p0, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->currentListeners:Ljava/util/List;

    .line 64
    return-void
.end method


# virtual methods
.method protected abstract notifyListener(Lorg/junit/runner/notification/RunListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method run()V
    .registers 9

    .prologue
    .line 67
    iget-object v6, p0, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->currentListeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    .line 68
    .local v0, "capacity":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 69
    .local v5, "safeListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/junit/runner/notification/RunListener;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 70
    .local v2, "failures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/junit/runner/notification/Failure;>;"
    iget-object v6, p0, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->currentListeners:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/junit/runner/notification/RunListener;

    .line 72
    .local v4, "listener":Lorg/junit/runner/notification/RunListener;
    :try_start_22
    invoke-virtual {p0, v4}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->notifyListener(Lorg/junit/runner/notification/RunListener;)V

    .line 73
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_28} :catch_29

    goto :goto_16

    .line 74
    :catch_29
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Lorg/junit/runner/notification/Failure;

    sget-object v7, Lorg/junit/runner/Description;->TEST_MECHANISM:Lorg/junit/runner/Description;

    invoke-direct {v6, v7, v1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 78
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "listener":Lorg/junit/runner/notification/RunListener;
    :cond_35
    iget-object v6, p0, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->this$0:Lorg/junit/runner/notification/RunNotifier;

    # invokes: Lorg/junit/runner/notification/RunNotifier;->fireTestFailures(Ljava/util/List;Ljava/util/List;)V
    invoke-static {v6, v5, v2}, Lorg/junit/runner/notification/RunNotifier;->access$100(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;Ljava/util/List;)V

    .line 79
    return-void
.end method
