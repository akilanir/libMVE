.class Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;
.super Lcom/google/android/exoplayer/extractor/ts/TsExtractor$TsPayloadReader;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ts/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PatReader"
.end annotation


# instance fields
.field private final patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field final synthetic this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor;)V
    .registers 4

    .prologue
    .line 198
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$TsPayloadReader;-><init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor$1;)V

    .line 199
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x4

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 200
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;ZLcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 15
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "payloadUnitStartIndicator"    # Z
    .param p3, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    const/16 v10, 0xd

    const/16 v7, 0xc

    const/4 v9, 0x3

    .line 211
    if-eqz p2, :cond_e

    .line 212
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 213
    .local v2, "pointerField":I
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 216
    .end local v2    # "pointerField":I
    :cond_e
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {p1, v6, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 217
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 218
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 221
    .local v5, "sectionLength":I
    const/4 v6, 0x5

    invoke-virtual {p1, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 223
    add-int/lit8 v6, v5, -0x9

    div-int/lit8 v3, v6, 0x4

    .line 224
    .local v3, "programCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_27
    if-ge v0, v3, :cond_5b

    .line 225
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x4

    invoke-virtual {p1, v6, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 226
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v4

    .line 227
    .local v4, "programNumber":I
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 228
    if-nez v4, :cond_46

    .line 229
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 224
    :goto_43
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 231
    :cond_46
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 232
    .local v1, "pid":I
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v6, v6, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    new-instance v7, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;

    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;-><init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor;)V

    invoke-virtual {v6, v1, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_43

    .line 237
    .end local v1    # "pid":I
    .end local v4    # "programNumber":I
    :cond_5b
    return-void
.end method

.method public seek()V
    .registers 1

    .prologue
    .line 205
    return-void
.end method
