.class Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;
.super Lcom/google/common/util/concurrent/Monitor$Guard;
.source "ServiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/Monitor;)V
    .registers 3
    .param p2, "x0"    # Lcom/google/common/util/concurrent/Monitor;

    .prologue
    .line 425
    iput-object p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-direct {p0, p2}, Lcom/google/common/util/concurrent/Monitor$Guard;-><init>(Lcom/google/common/util/concurrent/Monitor;)V

    return-void
.end method


# virtual methods
.method public isSatisfied()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 428
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstartedServices:I

    if-nez v0, :cond_15

    move v0, v1

    :goto_9
    iget-object v3, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget v3, v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    iget-object v4, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$1;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget v4, v4, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->numberOfServices:I

    if-eq v3, v4, :cond_17

    :goto_13
    or-int/2addr v0, v1

    return v0

    :cond_15
    move v0, v2

    goto :goto_9

    :cond_17
    move v1, v2

    goto :goto_13
.end method
