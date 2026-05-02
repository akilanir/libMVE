.class final Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;
.super Ljava/lang/Object;
.source "AbstractService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StateSnapshot"
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field final failure:Ljava/lang/Throwable;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final shutdownWhenStartupFinishes:Z

.field final state:Lcom/google/common/util/concurrent/Service$State;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/Service$State;)V
    .registers 4
    .param p1, "internalState"    # Lcom/google/common/util/concurrent/Service$State;

    .prologue
    .line 597
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;-><init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V

    .line 598
    return-void
.end method

.method constructor <init>(Lcom/google/common/util/concurrent/Service$State;ZLjava/lang/Throwable;)V
    .registers 9
    .param p1, "internalState"    # Lcom/google/common/util/concurrent/Service$State;
    .param p2, "shutdownWhenStartupFinishes"    # Z
    .param p3, "failure"    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 601
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 602
    if-eqz p2, :cond_b

    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v0, :cond_34

    :cond_b
    move v0, v2

    :goto_c
    const-string v3, "shudownWhenStartupFinishes can only be set if state is STARTING. Got %s instead."

    new-array v4, v2, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 605
    if-eqz p3, :cond_36

    move v0, v2

    :goto_18
    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-ne p1, v3, :cond_38

    move v3, v2

    :goto_1d
    xor-int/2addr v0, v3

    if-nez v0, :cond_3a

    move v0, v2

    :goto_21
    const-string v3, "A failure cause should be set if and only if the state is failed.  Got %s and %s instead."

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    aput-object p3, v4, v2

    invoke-static {v0, v3, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 608
    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    .line 609
    iput-boolean p2, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->shutdownWhenStartupFinishes:Z

    .line 610
    iput-object p3, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->failure:Ljava/lang/Throwable;

    .line 611
    return-void

    :cond_34
    move v0, v1

    .line 602
    goto :goto_c

    :cond_36
    move v0, v1

    .line 605
    goto :goto_18

    :cond_38
    move v3, v1

    goto :goto_1d

    :cond_3a
    move v0, v1

    goto :goto_21
.end method


# virtual methods
.method externalState()Lcom/google/common/util/concurrent/Service$State;
    .registers 3

    .prologue
    .line 615
    iget-boolean v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->shutdownWhenStartupFinishes:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    sget-object v1, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v1, :cond_d

    .line 616
    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->STOPPING:Lcom/google/common/util/concurrent/Service$State;

    .line 618
    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    goto :goto_c
.end method

.method failureCause()Ljava/lang/Throwable;
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 624
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    sget-object v3, Lcom/google/common/util/concurrent/Service$State;->FAILED:Lcom/google/common/util/concurrent/Service$State;

    if-ne v0, v3, :cond_17

    move v0, v1

    :goto_9
    const-string v3, "failureCause() is only valid if the service has failed, service is %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->state:Lcom/google/common/util/concurrent/Service$State;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 626
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractService$StateSnapshot;->failure:Ljava/lang/Throwable;

    return-object v0

    :cond_17
    move v0, v2

    .line 624
    goto :goto_9
.end method
