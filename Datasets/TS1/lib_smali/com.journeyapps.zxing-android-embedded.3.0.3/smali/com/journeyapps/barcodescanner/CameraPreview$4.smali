.class Lcom/journeyapps/barcodescanner/CameraPreview$4;
.super Ljava/lang/Object;
.source "CameraPreview.java"

# interfaces
.implements Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/CameraPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CameraPreview;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CameraPreview;)V
    .registers 2

    .prologue
    .line 220
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CameraPreview$4;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cameraError(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "error"    # Ljava/lang/Exception;

    .prologue
    .line 245
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview$4;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$700(Lcom/journeyapps/barcodescanner/CameraPreview;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 246
    .local v1, "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    invoke-interface {v1, p1}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->cameraError(Ljava/lang/Exception;)V

    goto :goto_a

    .line 248
    .end local v1    # "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    :cond_1a
    return-void
.end method

.method public previewSized()V
    .registers 4

    .prologue
    .line 223
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview$4;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$700(Lcom/journeyapps/barcodescanner/CameraPreview;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 224
    .local v1, "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    invoke-interface {v1}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewSized()V

    goto :goto_a

    .line 226
    .end local v1    # "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    :cond_1a
    return-void
.end method

.method public previewStarted()V
    .registers 4

    .prologue
    .line 230
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview$4;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$700(Lcom/journeyapps/barcodescanner/CameraPreview;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 231
    .local v1, "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    invoke-interface {v1}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewStarted()V

    goto :goto_a

    .line 234
    .end local v1    # "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    :cond_1a
    return-void
.end method

.method public previewStopped()V
    .registers 4

    .prologue
    .line 238
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CameraPreview$4;->this$0:Lcom/journeyapps/barcodescanner/CameraPreview;

    # getter for: Lcom/journeyapps/barcodescanner/CameraPreview;->stateListeners:Ljava/util/List;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->access$700(Lcom/journeyapps/barcodescanner/CameraPreview;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;

    .line 239
    .local v1, "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    invoke-interface {v1}, Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;->previewStopped()V

    goto :goto_a

    .line 241
    .end local v1    # "listener":Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;
    :cond_1a
    return-void
.end method
