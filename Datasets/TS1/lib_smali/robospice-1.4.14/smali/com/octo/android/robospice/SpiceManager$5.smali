.class Lcom/octo/android/robospice/SpiceManager$5;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/SpiceRequest;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;

.field final synthetic val$request:Lcom/octo/android/robospice/request/SpiceRequest;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/request/SpiceRequest;)V
    .registers 3

    .prologue
    .line 644
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$5;->this$0:Lcom/octo/android/robospice/SpiceManager;

    iput-object p2, p0, Lcom/octo/android/robospice/SpiceManager$5;->val$request:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 647
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$5;->this$0:Lcom/octo/android/robospice/SpiceManager;

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$5;->val$request:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/SpiceManager;->dontNotifyRequestListenersForRequestInternal(Lcom/octo/android/robospice/request/SpiceRequest;)V

    .line 648
    return-void
.end method
