.class Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$2;
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
    .line 434
    iput-object p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$2;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-direct {p0, p2}, Lcom/google/common/util/concurrent/Monitor$Guard;-><init>(Lcom/google/common/util/concurrent/Monitor;)V

    return-void
.end method


# virtual methods
.method public isSatisfied()Z
    .registers 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$2;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iget v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->unstoppedServices:I

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
