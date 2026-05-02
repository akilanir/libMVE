.class Lcom/journeyapps/barcodescanner/RotationListener$1;
.super Landroid/view/OrientationEventListener;
.source "RotationListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/journeyapps/barcodescanner/RotationListener;->listen(Landroid/content/Context;Lcom/journeyapps/barcodescanner/RotationCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/RotationListener;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/RotationListener;Landroid/content/Context;I)V
    .registers 4
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # I

    .prologue
    .line 40
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .registers 6
    .param p1, "orientation"    # I

    .prologue
    .line 43
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    # getter for: Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/RotationListener;->access$000(Lcom/journeyapps/barcodescanner/RotationListener;)Landroid/view/WindowManager;

    move-result-object v1

    .line 44
    .local v1, "localWindowManager":Landroid/view/WindowManager;
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    # getter for: Lcom/journeyapps/barcodescanner/RotationListener;->callback:Lcom/journeyapps/barcodescanner/RotationCallback;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/RotationListener;->access$100(Lcom/journeyapps/barcodescanner/RotationListener;)Lcom/journeyapps/barcodescanner/RotationCallback;

    move-result-object v0

    .line 45
    .local v0, "localCallback":Lcom/journeyapps/barcodescanner/RotationCallback;
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    # getter for: Lcom/journeyapps/barcodescanner/RotationListener;->windowManager:Landroid/view/WindowManager;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/RotationListener;->access$000(Lcom/journeyapps/barcodescanner/RotationListener;)Landroid/view/WindowManager;

    move-result-object v3

    if-eqz v3, :cond_2e

    if-eqz v0, :cond_2e

    .line 46
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    move-result v2

    .line 47
    .local v2, "newRotation":I
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    # getter for: Lcom/journeyapps/barcodescanner/RotationListener;->lastRotation:I
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/RotationListener;->access$200(Lcom/journeyapps/barcodescanner/RotationListener;)I

    move-result v3

    if-eq v2, v3, :cond_2e

    .line 48
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/RotationListener$1;->this$0:Lcom/journeyapps/barcodescanner/RotationListener;

    # setter for: Lcom/journeyapps/barcodescanner/RotationListener;->lastRotation:I
    invoke-static {v3, v2}, Lcom/journeyapps/barcodescanner/RotationListener;->access$202(Lcom/journeyapps/barcodescanner/RotationListener;I)I

    .line 49
    invoke-interface {v0, v2}, Lcom/journeyapps/barcodescanner/RotationCallback;->onRotationChanged(I)V

    .line 52
    .end local v2    # "newRotation":I
    :cond_2e
    return-void
.end method
