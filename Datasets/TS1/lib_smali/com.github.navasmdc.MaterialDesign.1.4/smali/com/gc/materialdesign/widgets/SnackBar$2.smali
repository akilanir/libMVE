.class Lcom/gc/materialdesign/widgets/SnackBar$2;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gc/materialdesign/widgets/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gc/materialdesign/widgets/SnackBar;


# direct methods
.method constructor <init>(Lcom/gc/materialdesign/widgets/SnackBar;)V
    .registers 2

    .prologue
    .line 102
    iput-object p1, p0, Lcom/gc/materialdesign/widgets/SnackBar$2;->this$0:Lcom/gc/materialdesign/widgets/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 107
    :try_start_0
    iget-object v1, p0, Lcom/gc/materialdesign/widgets/SnackBar$2;->this$0:Lcom/gc/materialdesign/widgets/SnackBar;

    # getter for: Lcom/gc/materialdesign/widgets/SnackBar;->mTimer:I
    invoke-static {v1}, Lcom/gc/materialdesign/widgets/SnackBar;->access$000(Lcom/gc/materialdesign/widgets/SnackBar;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_a} :catch_17

    .line 111
    :goto_a
    iget-object v1, p0, Lcom/gc/materialdesign/widgets/SnackBar$2;->this$0:Lcom/gc/materialdesign/widgets/SnackBar;

    iget-object v1, v1, Lcom/gc/materialdesign/widgets/SnackBar;->handler:Landroid/os/Handler;

    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 112
    return-void

    .line 108
    :catch_17
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_a
.end method
