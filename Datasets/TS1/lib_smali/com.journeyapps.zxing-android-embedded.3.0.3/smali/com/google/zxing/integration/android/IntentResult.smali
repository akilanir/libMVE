.class public final Lcom/google/zxing/integration/android/IntentResult;
.super Ljava/lang/Object;
.source "IntentResult.java"


# instance fields
.field private final barcodeImagePath:Ljava/lang/String;

.field private final contents:Ljava/lang/String;

.field private final errorCorrectionLevel:Ljava/lang/String;

.field private final formatName:Ljava/lang/String;

.field private final orientation:Ljava/lang/Integer;

.field private final rawBytes:[B


# direct methods
.method constructor <init>()V
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 34
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    invoke-direct/range {v0 .. v6}, Lcom/google/zxing/integration/android/IntentResult;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "formatName"    # Ljava/lang/String;
    .param p3, "rawBytes"    # [B
    .param p4, "orientation"    # Ljava/lang/Integer;
    .param p5, "errorCorrectionLevel"    # Ljava/lang/String;
    .param p6, "barcodeImagePath"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/zxing/integration/android/IntentResult;->contents:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/google/zxing/integration/android/IntentResult;->formatName:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/google/zxing/integration/android/IntentResult;->rawBytes:[B

    .line 46
    iput-object p4, p0, Lcom/google/zxing/integration/android/IntentResult;->orientation:Ljava/lang/Integer;

    .line 47
    iput-object p5, p0, Lcom/google/zxing/integration/android/IntentResult;->errorCorrectionLevel:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lcom/google/zxing/integration/android/IntentResult;->barcodeImagePath:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public getBarcodeImagePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->barcodeImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getContents()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->contents:Ljava/lang/String;

    return-object v0
.end method

.method public getErrorCorrectionLevel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->errorCorrectionLevel:Ljava/lang/String;

    return-object v0
.end method

.method public getFormatName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->formatName:Ljava/lang/String;

    return-object v0
.end method

.method public getOrientation()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->orientation:Ljava/lang/Integer;

    return-object v0
.end method

.method public getRawBytes()[B
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/google/zxing/integration/android/IntentResult;->rawBytes:[B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v4, 0xa

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x78

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 96
    .local v0, "dialogText":Ljava/lang/StringBuilder;
    const-string v2, "Format: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentResult;->formatName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 97
    const-string v2, "Contents: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentResult;->contents:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    iget-object v2, p0, Lcom/google/zxing/integration/android/IntentResult;->rawBytes:[B

    if-nez v2, :cond_6d

    const/4 v1, 0x0

    .line 99
    .local v1, "rawBytesLength":I
    :goto_2c
    const-string v2, "Raw bytes: ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes)\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    const-string v2, "Orientation: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentResult;->orientation:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    const-string v2, "EC level: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentResult;->errorCorrectionLevel:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    const-string v2, "Barcode image: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/integration/android/IntentResult;->barcodeImagePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 98
    .end local v1    # "rawBytesLength":I
    :cond_6d
    iget-object v2, p0, Lcom/google/zxing/integration/android/IntentResult;->rawBytes:[B

    array-length v1, v2

    goto :goto_2c
.end method
