.class Lcom/octo/android/robospice/SpiceManager$6;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->dontNotifyAnyRequestListeners()V
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
    .line 735
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$6;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 738
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$6;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0}, Lcom/octo/android/robospice/SpiceManager;->dontNotifyAnyRequestListenersInternal()V

    .line 739
    return-void
.end method
