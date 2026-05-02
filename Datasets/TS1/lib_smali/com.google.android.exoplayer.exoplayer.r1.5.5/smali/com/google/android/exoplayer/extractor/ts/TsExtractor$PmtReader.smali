.class Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;
.super Lcom/google/android/exoplayer/extractor/ts/TsExtractor$TsPayloadReader;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ts/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PmtReader"
.end annotation


# instance fields
.field private final pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private sectionBytesRead:I

.field private final sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private sectionLength:I

.field final synthetic this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor;)V
    .registers 4

    .prologue
    .line 252
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$TsPayloadReader;-><init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor$1;)V

    .line 253
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x5

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 254
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 255
    return-void
.end method

.method private readPrivateDataStreamType(Lcom/google/android/exoplayer/util/ParsableByteArray;I)I
    .registers 11
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 391
    const/4 v5, -0x1

    .line 392
    .local v5, "streamType":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v6

    add-int v2, v6, p2

    .line 393
    .local v2, "descriptorsEndPosition":I
    :goto_7
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v6

    if-ge v6, v2, :cond_26

    .line 394
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 395
    .local v1, "descriptorTag":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 396
    .local v0, "descriptorLength":I
    const/4 v6, 0x5

    if-ne v1, v6, :cond_40

    .line 397
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v3

    .line 398
    .local v3, "formatIdentifier":J
    # getter for: Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->AC3_FORMAT_IDENTIFIER:J
    invoke-static {}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->access$200()J

    move-result-wide v6

    cmp-long v6, v3, v6

    if-nez v6, :cond_2a

    .line 399
    const/16 v5, 0x81

    .line 416
    .end local v0    # "descriptorLength":I
    .end local v1    # "descriptorTag":I
    .end local v3    # "formatIdentifier":J
    :cond_26
    :goto_26
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 417
    return v5

    .line 400
    .restart local v0    # "descriptorLength":I
    .restart local v1    # "descriptorTag":I
    .restart local v3    # "formatIdentifier":J
    :cond_2a
    # getter for: Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->E_AC3_FORMAT_IDENTIFIER:J
    invoke-static {}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->access$300()J

    move-result-wide v6

    cmp-long v6, v3, v6

    if-nez v6, :cond_35

    .line 401
    const/16 v5, 0x87

    goto :goto_26

    .line 402
    :cond_35
    # getter for: Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->HEVC_FORMAT_IDENTIFIER:J
    invoke-static {}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->access$400()J

    move-result-wide v6

    cmp-long v6, v3, v6

    if-nez v6, :cond_26

    .line 403
    const/16 v5, 0x24

    goto :goto_26

    .line 406
    .end local v3    # "formatIdentifier":J
    :cond_40
    const/16 v6, 0x6a

    if-ne v1, v6, :cond_4a

    .line 407
    const/16 v5, 0x81

    .line 414
    :cond_46
    :goto_46
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_7

    .line 408
    :cond_4a
    const/16 v6, 0x7a

    if-ne v1, v6, :cond_51

    .line 409
    const/16 v5, 0x87

    goto :goto_46

    .line 410
    :cond_51
    const/16 v6, 0x7b

    if-ne v1, v6, :cond_46

    .line 411
    const/16 v5, 0x8a

    goto :goto_46
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;ZLcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 15
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "payloadUnitStartIndicator"    # Z
    .param p3, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 265
    if-eqz p2, :cond_35

    .line 267
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 268
    .local v4, "pointerField":I
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 272
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x3

    invoke-virtual {p1, v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 273
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xc

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 274
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xc

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v8

    iput v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    .line 276
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->capacity()I

    move-result v8

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    if-ge v8, v9, :cond_57

    .line 277
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    new-array v9, v9, [B

    iget v10, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 284
    .end local v4    # "pointerField":I
    :cond_35
    :goto_35
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v8

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    iget v10, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionBytesRead:I

    sub-int/2addr v9, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 285
    .local v0, "bytesToRead":I
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionBytesRead:I

    invoke-virtual {p1, v8, v9, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 286
    iget v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionBytesRead:I

    add-int/2addr v8, v0

    iput v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionBytesRead:I

    .line 287
    iget v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionBytesRead:I

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    if-ge v8, v9, :cond_64

    .line 379
    :goto_56
    return-void

    .line 279
    .end local v0    # "bytesToRead":I
    .restart local v4    # "pointerField":I
    :cond_57
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset()V

    .line 280
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    goto :goto_35

    .line 295
    .end local v4    # "pointerField":I
    .restart local v0    # "bytesToRead":I
    :cond_64
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v9, 0x7

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 298
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x2

    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 299
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 300
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xc

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 303
    .local v5, "programInfoLength":I
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 305
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer/extractor/ts/Id3Reader;

    if-nez v8, :cond_9a

    .line 308
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/Id3Reader;

    const/16 v10, 0x15

    invoke-interface {p3, v10}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer/extractor/ts/Id3Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    iput-object v9, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer/extractor/ts/Id3Reader;

    .line 311
    :cond_9a
    iget v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionLength:I

    add-int/lit8 v8, v8, -0x9

    sub-int/2addr v8, v5

    add-int/lit8 v6, v8, -0x4

    .line 313
    .local v6, "remainingEntriesLength":I
    :cond_a1
    :goto_a1
    if-lez v6, :cond_19c

    .line 314
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x5

    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 315
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v7

    .line 316
    .local v7, "streamType":I
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 317
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xd

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 318
    .local v1, "elementaryPid":I
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x4

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 319
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xc

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v2

    .line 320
    .local v2, "esInfoLength":I
    const/4 v8, 0x6

    if-ne v7, v8, :cond_102

    .line 322
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {p0, v8, v2}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->readPrivateDataStreamType(Lcom/google/android/exoplayer/util/ParsableByteArray;I)I

    move-result v7

    .line 326
    :goto_d8
    add-int/lit8 v8, v2, 0x5

    sub-int/2addr v6, v8

    .line 327
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->streamTypes:Landroid/util/SparseBooleanArray;

    invoke-virtual {v8, v7}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v8

    if-nez v8, :cond_a1

    .line 332
    sparse-switch v7, :sswitch_data_1a2

    .line 368
    const/4 v3, 0x0

    .line 372
    .local v3, "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :goto_e9
    if-eqz v3, :cond_a1

    .line 373
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->streamTypes:Landroid/util/SparseBooleanArray;

    const/4 v9, 0x1

    invoke-virtual {v8, v7, v9}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 374
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PesReader;

    iget-object v10, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    invoke-direct {v9, v10, v3}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PesReader;-><init>(Lcom/google/android/exoplayer/extractor/ts/TsExtractor;Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;)V

    invoke-virtual {v8, v1, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_a1

    .line 324
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :cond_102
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->sectionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_d8

    .line 334
    :sswitch_108
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/MpegAudioReader;

    const/4 v8, 0x3

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    invoke-direct {v3, v8}, Lcom/google/android/exoplayer/extractor/ts/MpegAudioReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 335
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 337
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_113
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/MpegAudioReader;

    const/4 v8, 0x4

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    invoke-direct {v3, v8}, Lcom/google/android/exoplayer/extractor/ts/MpegAudioReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 338
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 340
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_11e
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;

    const/16 v8, 0xf

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    new-instance v9, Lcom/google/android/exoplayer/extractor/DummyTrackOutput;

    invoke-direct {v9}, Lcom/google/android/exoplayer/extractor/DummyTrackOutput;-><init>()V

    invoke-direct {v3, v8, v9}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 342
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 344
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_12f
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/Ac3Reader;

    const/16 v8, 0x81

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v3, v8, v9}, Lcom/google/android/exoplayer/extractor/ts/Ac3Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Z)V

    .line 345
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 347
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_13c
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/Ac3Reader;

    const/16 v8, 0x87

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    const/4 v9, 0x1

    invoke-direct {v3, v8, v9}, Lcom/google/android/exoplayer/extractor/ts/Ac3Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Z)V

    .line 348
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 351
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_149
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/DtsReader;

    const/16 v8, 0x8a

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    invoke-direct {v3, v8}, Lcom/google/android/exoplayer/extractor/ts/DtsReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 352
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 354
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_155
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/H262Reader;

    const/4 v8, 0x2

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    invoke-direct {v3, v8}, Lcom/google/android/exoplayer/extractor/ts/H262Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 355
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto :goto_e9

    .line 357
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_160
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/H264Reader;

    const/16 v8, 0x1b

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/SeiReader;

    const/16 v10, 0x100

    invoke-interface {p3, v10}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer/extractor/ts/SeiReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    iget-object v10, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->idrKeyframesOnly:Z
    invoke-static {v10}, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->access$100(Lcom/google/android/exoplayer/extractor/ts/TsExtractor;)Z

    move-result v10

    invoke-direct {v3, v8, v9, v10}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Lcom/google/android/exoplayer/extractor/ts/SeiReader;Z)V

    .line 359
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto/16 :goto_e9

    .line 361
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_17e
    new-instance v3, Lcom/google/android/exoplayer/extractor/ts/H265Reader;

    const/16 v8, 0x24

    invoke-interface {p3, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v8

    new-instance v9, Lcom/google/android/exoplayer/extractor/ts/SeiReader;

    const/16 v10, 0x100

    invoke-interface {p3, v10}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer/extractor/ts/SeiReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    invoke-direct {v3, v8, v9}, Lcom/google/android/exoplayer/extractor/ts/H265Reader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Lcom/google/android/exoplayer/extractor/ts/SeiReader;)V

    .line 363
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto/16 :goto_e9

    .line 365
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    :sswitch_196
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/ts/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/extractor/ts/TsExtractor;

    iget-object v3, v8, Lcom/google/android/exoplayer/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer/extractor/ts/Id3Reader;

    .line 366
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    goto/16 :goto_e9

    .line 378
    .end local v1    # "elementaryPid":I
    .end local v2    # "esInfoLength":I
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
    .end local v7    # "streamType":I
    :cond_19c
    invoke-interface {p3}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    goto/16 :goto_56

    .line 332
    nop

    :sswitch_data_1a2
    .sparse-switch
        0x2 -> :sswitch_155
        0x3 -> :sswitch_108
        0x4 -> :sswitch_113
        0xf -> :sswitch_11e
        0x15 -> :sswitch_196
        0x1b -> :sswitch_160
        0x24 -> :sswitch_17e
        0x81 -> :sswitch_12f
        0x82 -> :sswitch_149
        0x87 -> :sswitch_13c
        0x8a -> :sswitch_149
    .end sparse-switch
.end method

.method public seek()V
    .registers 1

    .prologue
    .line 260
    return-void
.end method
