.class Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;
.super Ljava/lang/Object;
.source "ServiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->serviceFinishedStarting(Lcom/google/common/util/concurrent/Service;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

.field final synthetic val$pair:Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;)V
    .registers 3

    .prologue
    .line 520
    iput-object p1, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;->this$0:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    iput-object p2, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;->val$pair:Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 522
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState$3;->val$pair:Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;

    iget-object v0, v0, Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;->listener:Lcom/google/common/util/concurrent/ServiceManager$Listener;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ServiceManager$Listener;->healthy()V

    .line 523
    return-void
.end method
