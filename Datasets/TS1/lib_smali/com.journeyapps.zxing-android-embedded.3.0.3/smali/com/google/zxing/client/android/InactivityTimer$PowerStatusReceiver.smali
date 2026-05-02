.class final Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InactivityTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/zxing/client/android/InactivityTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PowerStatusReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/zxing/client/android/InactivityTimer;


# direct methods
.method private constructor <init>(Lcom/google/zxing/client/android/InactivityTimer;)V
    .registers 2

    .prologue
    .line 104
    iput-object p1, p0, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;->this$0:Lcom/google/zxing/client/android/InactivityTimer;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/client/android/InactivityTimer;Lcom/google/zxing/client/android/InactivityTimer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/google/zxing/client/android/InactivityTimer;
    .param p2, "x1"    # Lcom/google/zxing/client/android/InactivityTimer$1;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;-><init>(Lcom/google/zxing/client/android/InactivityTimer;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 107
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 109
    const-string v1, "plugged"

    const/4 v2, -0x1

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-gtz v1, :cond_25

    const/4 v0, 0x1

    .line 111
    .local v0, "onBatteryNow":Z
    :goto_16
    iget-object v1, p0, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;->this$0:Lcom/google/zxing/client/android/InactivityTimer;

    # getter for: Lcom/google/zxing/client/android/InactivityTimer;->handler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/google/zxing/client/android/InactivityTimer;->access$200(Lcom/google/zxing/client/android/InactivityTimer;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver$1;

    invoke-direct {v2, p0, v0}, Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver$1;-><init>(Lcom/google/zxing/client/android/InactivityTimer$PowerStatusReceiver;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 118
    .end local v0    # "onBatteryNow":Z
    :cond_24
    return-void

    .line 109
    :cond_25
    const/4 v0, 0x0

    goto :goto_16
.end method
