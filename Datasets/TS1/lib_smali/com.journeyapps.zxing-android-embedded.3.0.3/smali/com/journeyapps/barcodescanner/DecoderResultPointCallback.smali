.class public Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;
.super Ljava/lang/Object;
.source "DecoderResultPointCallback.java"

# interfaces
.implements Lcom/google/zxing/ResultPointCallback;


# instance fields
.field private decoder:Lcom/journeyapps/barcodescanner/Decoder;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public constructor <init>(Lcom/journeyapps/barcodescanner/Decoder;)V
    .registers 2
    .param p1, "decoder"    # Lcom/journeyapps/barcodescanner/Decoder;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    .line 14
    return-void
.end method


# virtual methods
.method public foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V
    .registers 3
    .param p1, "point"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    if-eqz v0, :cond_9

    .line 30
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    invoke-virtual {v0, p1}, Lcom/journeyapps/barcodescanner/Decoder;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    .line 32
    :cond_9
    return-void
.end method

.method public getDecoder()Lcom/journeyapps/barcodescanner/Decoder;
    .registers 2

    .prologue
    .line 20
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    return-object v0
.end method

.method public setDecoder(Lcom/journeyapps/barcodescanner/Decoder;)V
    .registers 2
    .param p1, "decoder"    # Lcom/journeyapps/barcodescanner/Decoder;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DecoderResultPointCallback;->decoder:Lcom/journeyapps/barcodescanner/Decoder;

    .line 25
    return-void
.end method
