.class Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;
.super Ljava/lang/Object;
.source "CompoundBarcodeView.java"

# interfaces
.implements Lcom/journeyapps/barcodescanner/BarcodeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/journeyapps/barcodescanner/CompoundBarcodeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WrappedCallback"
.end annotation


# instance fields
.field private delegate:Lcom/journeyapps/barcodescanner/BarcodeCallback;

.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;


# direct methods
.method public constructor <init>(Lcom/journeyapps/barcodescanner/CompoundBarcodeView;Lcom/journeyapps/barcodescanner/BarcodeCallback;)V
    .registers 3
    .param p2, "delegate"    # Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;->this$0:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;->delegate:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    .line 45
    return-void
.end method


# virtual methods
.method public barcodeResult(Lcom/journeyapps/barcodescanner/BarcodeResult;)V
    .registers 3
    .param p1, "result"    # Lcom/journeyapps/barcodescanner/BarcodeResult;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;->delegate:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    invoke-interface {v0, p1}, Lcom/journeyapps/barcodescanner/BarcodeCallback;->barcodeResult(Lcom/journeyapps/barcodescanner/BarcodeResult;)V

    .line 50
    return-void
.end method

.method public possibleResultPoints(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "resultPoints":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/ResultPoint;

    .line 55
    .local v1, "point":Lcom/google/zxing/ResultPoint;
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;->this$0:Lcom/journeyapps/barcodescanner/CompoundBarcodeView;

    # getter for: Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->viewFinder:Lcom/journeyapps/barcodescanner/ViewfinderView;
    invoke-static {v2}, Lcom/journeyapps/barcodescanner/CompoundBarcodeView;->access$000(Lcom/journeyapps/barcodescanner/CompoundBarcodeView;)Lcom/journeyapps/barcodescanner/ViewfinderView;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/journeyapps/barcodescanner/ViewfinderView;->addPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    goto :goto_4

    .line 57
    .end local v1    # "point":Lcom/google/zxing/ResultPoint;
    :cond_1a
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback;->delegate:Lcom/journeyapps/barcodescanner/BarcodeCallback;

    invoke-interface {v2, p1}, Lcom/journeyapps/barcodescanner/BarcodeCallback;->possibleResultPoints(Ljava/util/List;)V

    .line 58
    return-void
.end method
