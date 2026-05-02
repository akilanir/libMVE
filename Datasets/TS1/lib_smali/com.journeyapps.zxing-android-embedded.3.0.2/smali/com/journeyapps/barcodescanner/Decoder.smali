.class public Lcom/journeyapps/barcodescanner/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"

# interfaces
.implements Lcom/google/zxing/ResultPointCallback;


# instance fields
.field private possibleResultPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation
.end field

.field private reader:Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Reader;)V
    .registers 3
    .param p1, "reader"    # Lcom/google/zxing/Reader;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/journeyapps/barcodescanner/Decoder;->possibleResultPoints:Ljava/util/List;

    .line 33
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    .line 34
    return-void
.end method


# virtual methods
.method protected decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 5
    .param p1, "bitmap"    # Lcom/google/zxing/BinaryBitmap;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/Decoder;->possibleResultPoints:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 73
    :try_start_5
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    instance-of v1, v1, Lcom/google/zxing/MultiFormatReader;

    if-eqz v1, :cond_19

    .line 75
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    check-cast v1, Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v1, p1}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_12} :catch_25
    .catchall {:try_start_5 .. :try_end_12} :catchall_2d

    move-result-object v1

    .line 83
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    invoke-interface {v2}, Lcom/google/zxing/Reader;->reset()V

    :goto_18
    return-object v1

    .line 77
    :cond_19
    :try_start_19
    iget-object v1, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    invoke-interface {v1, p1}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1e} :catch_25
    .catchall {:try_start_19 .. :try_end_1e} :catchall_2d

    move-result-object v1

    .line 83
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    invoke-interface {v2}, Lcom/google/zxing/Reader;->reset()V

    goto :goto_18

    .line 79
    :catch_25
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 83
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    invoke-interface {v2}, Lcom/google/zxing/Reader;->reset()V

    goto :goto_18

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    invoke-interface {v2}, Lcom/google/zxing/Reader;->reset()V

    throw v1
.end method

.method public decode(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Result;
    .registers 3
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lcom/journeyapps/barcodescanner/Decoder;->toBitmap(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/BinaryBitmap;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/journeyapps/barcodescanner/Decoder;->decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V
    .registers 3
    .param p1, "point"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/Decoder;->possibleResultPoints:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    return-void
.end method

.method public getPossibleResultPoints()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/journeyapps/barcodescanner/Decoder;->possibleResultPoints:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected getReader()Lcom/google/zxing/Reader;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/Decoder;->reader:Lcom/google/zxing/Reader;

    return-object v0
.end method

.method protected toBitmap(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/BinaryBitmap;
    .registers 4
    .param p1, "source"    # Lcom/google/zxing/LuminanceSource;

    .prologue
    .line 61
    new-instance v0, Lcom/google/zxing/BinaryBitmap;

    new-instance v1, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v1, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v0, v1}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    return-object v0
.end method
