.class Lcom/journeyapps/barcodescanner/BarcodeView$1;
.super Ljava/lang/Object;
.source "BarcodeView.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/BarcodeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/BarcodeView;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/BarcodeView;)V
    .registers 2

    .prologue
    .line 44
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 7
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 47
    iget v3, p1, Landroid/os/Message;->what:I

    sget v4, Lcom/google/zxing/client/android/R$id;->zxing_decode_succeeded:I

    if-ne v3, v4, :cond_38

    .line 48
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/journeyapps/barcodescanner/BarcodeResult;

    .line 50
    .local v0, "result":Lcom/journeyapps/barcodescanner/BarcodeResult;
    if-eqz v0, :cond_37

    .line 51
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$000(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeCallback;

    move-result-object v3

    if-eqz v3, :cond_37

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$100(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    move-result-object v3

    sget-object v4, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    if-eq v3, v4, :cond_37

    .line 52
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$000(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeCallback;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/journeyapps/barcodescanner/BarcodeCallback;->barcodeResult(Lcom/journeyapps/barcodescanner/BarcodeResult;)V

    .line 53
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$100(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    move-result-object v3

    sget-object v4, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->SINGLE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    if-ne v3, v4, :cond_37

    .line 54
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-virtual {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->stopDecoding()V

    .line 69
    .end local v0    # "result":Lcom/journeyapps/barcodescanner/BarcodeResult;
    :cond_37
    :goto_37
    return v2

    .line 59
    :cond_38
    iget v3, p1, Landroid/os/Message;->what:I

    sget v4, Lcom/google/zxing/client/android/R$id;->zxing_decode_failed:I

    if-eq v3, v4, :cond_37

    .line 62
    iget v3, p1, Landroid/os/Message;->what:I

    sget v4, Lcom/google/zxing/client/android/R$id;->zxing_possible_result_points:I

    if-ne v3, v4, :cond_64

    .line 63
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    .line 64
    .local v1, "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$000(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeCallback;

    move-result-object v3

    if-eqz v3, :cond_37

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->decodeMode:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$100(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    move-result-object v3

    sget-object v4, Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;->NONE:Lcom/journeyapps/barcodescanner/BarcodeView$DecodeMode;

    if-eq v3, v4, :cond_37

    .line 65
    iget-object v3, p0, Lcom/journeyapps/barcodescanner/BarcodeView$1;->this$0:Lcom/journeyapps/barcodescanner/BarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/BarcodeView;->callback:Lcom/journeyapps/barcodescanner/BarcodeCallback;
    invoke-static {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->access$000(Lcom/journeyapps/barcodescanner/BarcodeView;)Lcom/journeyapps/barcodescanner/BarcodeCallback;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/journeyapps/barcodescanner/BarcodeCallback;->possibleResultPoints(Ljava/util/List;)V

    goto :goto_37

    .line 69
    .end local v1    # "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    :cond_64
    const/4 v2, 0x0

    goto :goto_37
.end method
