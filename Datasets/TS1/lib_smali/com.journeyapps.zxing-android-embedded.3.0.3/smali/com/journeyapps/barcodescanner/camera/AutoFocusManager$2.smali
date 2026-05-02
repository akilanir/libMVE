.class Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;
.super Ljava/lang/Object;
.source "AutoFocusManager.java"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)V
    .registers 2

    .prologue
    .line 64
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;->this$0:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .registers 5
    .param p1, "success"    # Z
    .param p2, "theCamera"    # Landroid/hardware/Camera;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;->this$0:Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;

    # getter for: Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;->access$400(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2$1;

    invoke-direct {v1, p0}, Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2$1;-><init>(Lcom/journeyapps/barcodescanner/camera/AutoFocusManager$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 74
    return-void
.end method
