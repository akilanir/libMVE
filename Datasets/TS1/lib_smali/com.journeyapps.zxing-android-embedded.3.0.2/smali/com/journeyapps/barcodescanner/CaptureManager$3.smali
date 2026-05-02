.class Lcom/journeyapps/barcodescanner/CaptureManager$3;
.super Ljava/lang/Object;
.source "CaptureManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/journeyapps/barcodescanner/CaptureManager;-><init>(Landroid/app/Activity;Lcom/journeyapps/barcodescanner/CompoundBarcodeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CaptureManager;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V
    .registers 2

    .prologue
    .line 112
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CaptureManager$3;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 115
    # getter for: Lcom/journeyapps/barcodescanner/CaptureManager;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$300()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Finishing due to inactivity"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$3;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    # invokes: Lcom/journeyapps/barcodescanner/CaptureManager;->finish()V
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$400(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    .line 117
    return-void
.end method
