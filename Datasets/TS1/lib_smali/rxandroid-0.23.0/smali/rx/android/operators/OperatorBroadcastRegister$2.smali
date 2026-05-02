.class Lrx/android/operators/OperatorBroadcastRegister$2;
.super Ljava/lang/Object;
.source "OperatorBroadcastRegister.java"

# interfaces
.implements Lrx/functions/Action0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorBroadcastRegister;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorBroadcastRegister;

.field final synthetic val$broadcastReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorBroadcastRegister;Landroid/content/BroadcastReceiver;)V
    .registers 3

    .prologue
    .line 51
    iput-object p1, p0, Lrx/android/operators/OperatorBroadcastRegister$2;->this$0:Lrx/android/operators/OperatorBroadcastRegister;

    iput-object p2, p0, Lrx/android/operators/OperatorBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()V
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lrx/android/operators/OperatorBroadcastRegister$2;->this$0:Lrx/android/operators/OperatorBroadcastRegister;

    # getter for: Lrx/android/operators/OperatorBroadcastRegister;->context:Landroid/content/Context;
    invoke-static {v0}, Lrx/android/operators/OperatorBroadcastRegister;->access$000(Lrx/android/operators/OperatorBroadcastRegister;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lrx/android/operators/OperatorBroadcastRegister$2;->val$broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 55
    return-void
.end method
