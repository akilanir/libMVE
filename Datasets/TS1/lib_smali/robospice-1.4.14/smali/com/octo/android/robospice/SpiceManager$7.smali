.class Lcom/octo/android/robospice/SpiceManager$7;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->cancelAllRequests()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2

    .prologue
    .line 833
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$7;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 836
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$7;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # invokes: Lcom/octo/android/robospice/SpiceManager;->cancelAllRequestsInternal()V
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$200(Lcom/octo/android/robospice/SpiceManager;)V

    .line 837
    return-void
.end method
