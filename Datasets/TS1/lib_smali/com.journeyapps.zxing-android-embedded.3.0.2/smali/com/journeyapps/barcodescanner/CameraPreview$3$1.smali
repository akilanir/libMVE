.class Lcom/journeyapps/barcodescanner/CameraPreview$3$1;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/journeyapps/barcodescanner/CameraPreview$3;->onRotationChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/journeyapps/barcodescanner/CameraPreview$3;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CameraPreview$3;)V
    .registers 2

    .prologue
    .line 157
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$3$1;->this$1:Lcom/journeyapps/barcodescanner/CameraPreview$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CameraPreview$3$1;->this$1:Lcom/journeyapps/barcodescanner/CameraPreview$3;

    iget-object v0, v0, Lcom/journeyapps/barcodescanner/CameraPreview$3;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # invokes: Lcom/journeyapps/barcodescanner/CameraPreview;->rotationChanged()V
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$500(Lcom/journeyapps/barcodescanner/CameraPreview;)V

    .line 161
    return-void
.end method
