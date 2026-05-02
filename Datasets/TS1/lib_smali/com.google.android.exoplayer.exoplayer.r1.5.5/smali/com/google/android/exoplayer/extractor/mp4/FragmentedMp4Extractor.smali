.class public final Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;
.super Ljava/lang/Object;
.source "FragmentedMp4Extractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;


# static fields
.field private static final PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

.field private static final STATE_READING_ATOM_HEADER:I = 0x0

.field private static final STATE_READING_ATOM_PAYLOAD:I = 0x1

.field private static final STATE_READING_ENCRYPTION_DATA:I = 0x2

.field private static final STATE_READING_SAMPLE_CONTINUE:I = 0x4

.field private static final STATE_READING_SAMPLE_START:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FragmentedMp4Extractor"

.field public static final WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME:I = 0x1

.field public static final WORKAROUND_IGNORE_TFDT_BOX:I = 0x2


# instance fields
.field private atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private atomHeaderBytesRead:I

.field private atomSize:J

.field private atomType:I

.field private final containerAtoms:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;",
            ">;"
        }
    .end annotation
.end field

.field private final encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private endOfMdatPosition:J

.field private final extendedTypeScratch:[B

.field private extendsDefaults:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private final fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

.field private haveOutputSeekMap:Z

.field private final nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private parserState:I

.field private sampleBytesWritten:I

.field private sampleCurrentNalBytesRemaining:I

.field private sampleIndex:I

.field private sampleSize:I

.field private track:Lcom/google/android/exoplayer/extractor/mp4/Track;

.field private trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private final workaroundFlags:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    return-void

    :array_a
    .array-data 1
        -0x5et
        0x39t
        0x4ft
        0x52t
        0x5at
        -0x65t
        0x4ft
        0x14t
        -0x5et
        0x44t
        0x6ct
        0x42t
        0x7ct
        0x64t
        -0x73t
        -0xct
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;-><init>(I)V

    .line 115
    return-void
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "workaroundFlags"    # I

    .prologue
    const/16 v2, 0x10

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput p1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->workaroundFlags:I

    .line 123
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 124
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 125
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 126
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 127
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    .line 128
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 129
    new-instance v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 130
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 131
    return-void
.end method

.method private appendSampleEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .registers 11
    .param p1, "sampleEncryptionData"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v7, 0x0

    .line 797
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v6, v6, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget v1, v6, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    .line 798
    .local v1, "sampleDescriptionIndex":I
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget-object v6, v6, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    aget-object v0, v6, v1

    .line 800
    .local v0, "encryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 801
    .local v5, "vectorSize":I
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v6, v6, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget-boolean v4, v6, v8

    .line 804
    .local v4, "subsampleEncryption":Z
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    if-eqz v4, :cond_3a

    const/16 v6, 0x80

    :goto_1f
    or-int/2addr v6, v5

    int-to-byte v6, v6

    aput-byte v6, v8, v7

    .line 805
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 806
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 808
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v6, p1, v5}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 810
    if-nez v4, :cond_3c

    .line 811
    add-int/lit8 v6, v5, 0x1

    .line 818
    :goto_39
    return v6

    :cond_3a
    move v6, v7

    .line 804
    goto :goto_1f

    .line 814
    :cond_3c
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 815
    .local v2, "subsampleCount":I
    const/4 v6, -0x2

    invoke-virtual {p1, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 816
    mul-int/lit8 v6, v2, 0x6

    add-int/lit8 v3, v6, 0x2

    .line 817
    .local v3, "subsampleDataLength":I
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v6, p1, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 818
    add-int/lit8 v6, v5, 0x1

    add-int/2addr v6, v3

    goto :goto_39
.end method

.method private enterReadingAtomHeaderState()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 190
    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 191
    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 192
    return-void
.end method

.method private onContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 4
    .param p1, "container"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 286
    iget v0, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-ne v0, v1, :cond_a

    .line 287
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onMoovContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    .line 293
    :cond_9
    :goto_9
    return-void

    .line 288
    :cond_a
    iget v0, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v0, v1, :cond_14

    .line 289
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onMoofContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_9

    .line 290
    :cond_14
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9

    .line 291
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_9
.end method

.method private onLeafAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;J)V
    .registers 7
    .param p1, "leaf"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .param p2, "inputPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 276
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    .line 277
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;)V

    .line 283
    :cond_13
    :goto_13
    return-void

    .line 278
    :cond_14
    iget v1, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sidx:I

    if-ne v1, v2, :cond_13

    .line 279
    iget-object v1, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v1, p2, p3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSidx(Lcom/google/android/exoplayer/util/ParsableByteArray;J)Lcom/google/android/exoplayer/extractor/ChunkIndex;

    move-result-object v0

    .line 280
    .local v0, "segmentIndex":Lcom/google/android/exoplayer/extractor/ChunkIndex;
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 281
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    goto :goto_13
.end method

.method private onMoofContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 8
    .param p1, "moof"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->reset()V

    .line 332
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget v4, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->workaroundFlags:I

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseMoof(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;I[B)V

    .line 333
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    .line 334
    return-void
.end method

.method private onMoovContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 13
    .param p1, "moov"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 296
    iget-object v3, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    .line 297
    .local v3, "moovChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .line 299
    .local v4, "moovChildrenSize":I
    const/4 v1, 0x0

    .line 300
    .local v1, "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v4, :cond_40

    .line 301
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 302
    .local v0, "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v8, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pssh:I

    if-ne v8, v9, :cond_2e

    .line 303
    if-nez v1, :cond_1d

    .line 304
    new-instance v1, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;

    .end local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    invoke-direct {v1}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;-><init>()V

    .line 306
    .restart local v1    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    :cond_1d
    iget-object v8, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 307
    .local v6, "psshData":[B
    invoke-static {v6}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v7

    .line 308
    .local v7, "uuid":Ljava/util/UUID;
    if-nez v7, :cond_31

    .line 309
    const-string v8, "FragmentedMp4Extractor"

    const-string v9, "Skipped pssh atom (failed to extract uuid)"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    .end local v6    # "psshData":[B
    .end local v7    # "uuid":Ljava/util/UUID;
    :cond_2e
    :goto_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 311
    .restart local v6    # "psshData":[B
    .restart local v7    # "uuid":Ljava/util/UUID;
    :cond_31
    invoke-static {v6}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v8

    new-instance v9, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    const-string v10, "video/mp4"

    invoke-direct {v9, v10, v6}, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v1, v8, v9}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;->put(Ljava/util/UUID;Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    goto :goto_2e

    .line 316
    .end local v0    # "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v6    # "psshData":[B
    .end local v7    # "uuid":Ljava/util/UUID;
    :cond_40
    if-eqz v1, :cond_47

    .line 317
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v8, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->drmInitData(Lcom/google/android/exoplayer/drm/DrmInitData;)V

    .line 320
    :cond_47
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvex:I

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v5

    .line 321
    .local v5, "mvex":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trex:I

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v8

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v8}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    .line 322
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v8

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTrak(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    .line 324
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    if-nez v8, :cond_7a

    .line 325
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Track type not supported."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 327
    :cond_7a
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget-object v9, v9, Lcom/google/android/exoplayer/extractor/mp4/Track;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    invoke-interface {v8, v9}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 328
    return-void
.end method

.method private static parseMoof(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;I[B)V
    .registers 12
    .param p0, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;
    .param p1, "extendsDefaults"    # Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    .param p2, "moof"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .param p3, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .param p4, "workaroundFlags"    # I
    .param p5, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 352
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_traf:I

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getChildAtomOfTypeCount(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_11

    .line 353
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Traf count in moof != 1 (unsupported)."

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 355
    :cond_11
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_traf:I

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTraf(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;I[B)V

    .line 357
    return-void
.end method

.method private static parseSaio(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 10
    .param p0, "saio"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x1

    .line 447
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 448
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 449
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 450
    .local v1, "flags":I
    and-int/lit8 v4, v1, 0x1

    if-ne v4, v5, :cond_15

    .line 451
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 454
    :cond_15
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 455
    .local v0, "entryCount":I
    if-eq v0, v5, :cond_34

    .line 457
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected saio entry count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 460
    :cond_34
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v3

    .line 461
    .local v3, "version":I
    iget-wide v6, p1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    if-nez v3, :cond_44

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    :goto_40
    add-long/2addr v4, v6

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 463
    return-void

    .line 461
    :cond_44
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v4

    goto :goto_40
.end method

.method private static parseSaiz(Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 16
    .param p0, "encryptionBox"    # Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    .param p1, "saiz"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 410
    iget v9, p0, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 411
    .local v9, "vectorSize":I
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 412
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 413
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 414
    .local v1, "flags":I
    and-int/lit8 v10, v1, 0x1

    const/4 v11, 0x1

    if-ne v10, v11, :cond_19

    .line 415
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 417
    :cond_19
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 419
    .local v0, "defaultSampleInfoSize":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 420
    .local v4, "sampleCount":I
    iget v10, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-eq v4, v10, :cond_4a

    .line 421
    new-instance v10, Lcom/google/android/exoplayer/ParserException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Length mismatch: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 424
    :cond_4a
    const/4 v8, 0x0

    .line 425
    .local v8, "totalSize":I
    if-nez v0, :cond_61

    .line 426
    iget-object v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    .line 427
    .local v5, "sampleHasSubsampleEncryptionTable":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_50
    if-ge v3, v4, :cond_6d

    .line 428
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v6

    .line 429
    .local v6, "sampleInfoSize":I
    add-int/2addr v8, v6

    .line 430
    if-le v6, v9, :cond_5f

    const/4 v10, 0x1

    :goto_5a
    aput-boolean v10, v5, v3

    .line 427
    add-int/lit8 v3, v3, 0x1

    goto :goto_50

    .line 430
    :cond_5f
    const/4 v10, 0x0

    goto :goto_5a

    .line 433
    .end local v3    # "i":I
    .end local v5    # "sampleHasSubsampleEncryptionTable":[Z
    .end local v6    # "sampleInfoSize":I
    :cond_61
    if-le v0, v9, :cond_71

    const/4 v7, 0x1

    .line 434
    .local v7, "subsampleEncryption":Z
    :goto_64
    mul-int v10, v0, v4

    add-int/2addr v8, v10

    .line 435
    iget-object v10, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    const/4 v11, 0x0

    invoke-static {v10, v11, v4, v7}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 437
    .end local v7    # "subsampleEncryption":Z
    :cond_6d
    invoke-virtual {p2, v8}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 438
    return-void

    .line 433
    :cond_71
    const/4 v7, 0x0

    goto :goto_64
.end method

.method private static parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 10
    .param p0, "senc"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "offset"    # I
    .param p2, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 613
    add-int/lit8 v5, p1, 0x8

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 614
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 615
    .local v1, "fullAtom":I
    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v0

    .line 617
    .local v0, "flags":I
    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_1a

    .line 619
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    const-string v5, "Overriding TrackEncryptionBox parameters is unsupported."

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 622
    :cond_1a
    and-int/lit8 v5, v0, 0x2

    if-eqz v5, :cond_4c

    const/4 v3, 0x1

    .line 623
    .local v3, "subsampleEncryption":Z
    :goto_1f
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    .line 624
    .local v2, "sampleCount":I
    iget v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-eq v2, v5, :cond_4e

    .line 625
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length mismatch: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "sampleCount":I
    .end local v3    # "subsampleEncryption":Z
    :cond_4c
    move v3, v4

    .line 622
    goto :goto_1f

    .line 628
    .restart local v2    # "sampleCount":I
    .restart local v3    # "subsampleEncryption":Z
    :cond_4e
    iget-object v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    invoke-static {v5, v4, v2, v3}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 629
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    invoke-virtual {p2, v4}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 630
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 631
    return-void
.end method

.method private static parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 3
    .param p0, "senc"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 608
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 609
    return-void
.end method

.method private static parseSidx(Lcom/google/android/exoplayer/util/ParsableByteArray;J)Lcom/google/android/exoplayer/extractor/ChunkIndex;
    .registers 30
    .param p0, "atom"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "inputPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 638
    const/16 v5, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 639
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v13

    .line 640
    .local v13, "fullAtom":I
    invoke-static {v13}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v26

    .line 642
    .local v26, "version":I
    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 643
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v7

    .line 645
    .local v7, "timescale":J
    move-wide/from16 v15, p1

    .line 646
    .local v15, "offset":J
    if-nez v26, :cond_65

    .line 647
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v10

    .line 648
    .local v10, "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v5

    add-long/2addr v15, v5

    .line 654
    :goto_26
    const/4 v5, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 656
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v18

    .line 657
    .local v18, "referenceCount":I
    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v21, v0

    .line 658
    .local v21, "sizes":[I
    move/from16 v0, v18

    new-array v0, v0, [J

    move-object/from16 v17, v0

    .line 659
    .local v17, "offsets":[J
    move/from16 v0, v18

    new-array v9, v0, [J

    .line 660
    .local v9, "durationsUs":[J
    move/from16 v0, v18

    new-array v0, v0, [J

    move-object/from16 v24, v0

    .line 662
    .local v24, "timesUs":[J
    move-wide v3, v10

    .line 663
    .local v3, "time":J
    const-wide/32 v5, 0xf4240

    invoke-static/range {v3 .. v8}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v22

    .line 664
    .local v22, "timeUs":J
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_4f
    move/from16 v0, v18

    if-ge v14, v0, :cond_99

    .line 665
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v12

    .line 667
    .local v12, "firstInt":I
    const/high16 v5, -0x80000000

    and-int v25, v5, v12

    .line 668
    .local v25, "type":I
    if-eqz v25, :cond_6f

    .line 669
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Unhandled indirect reference"

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 650
    .end local v3    # "time":J
    .end local v9    # "durationsUs":[J
    .end local v10    # "earliestPresentationTime":J
    .end local v12    # "firstInt":I
    .end local v14    # "i":I
    .end local v17    # "offsets":[J
    .end local v18    # "referenceCount":I
    .end local v21    # "sizes":[I
    .end local v22    # "timeUs":J
    .end local v24    # "timesUs":[J
    .end local v25    # "type":I
    :cond_65
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v10

    .line 651
    .restart local v10    # "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v5

    add-long/2addr v15, v5

    goto :goto_26

    .line 671
    .restart local v3    # "time":J
    .restart local v9    # "durationsUs":[J
    .restart local v12    # "firstInt":I
    .restart local v14    # "i":I
    .restart local v17    # "offsets":[J
    .restart local v18    # "referenceCount":I
    .restart local v21    # "sizes":[I
    .restart local v22    # "timeUs":J
    .restart local v24    # "timesUs":[J
    .restart local v25    # "type":I
    :cond_6f
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v19

    .line 673
    .local v19, "referenceDuration":J
    const v5, 0x7fffffff

    and-int/2addr v5, v12

    aput v5, v21, v14

    .line 674
    aput-wide v15, v17, v14

    .line 678
    aput-wide v22, v24, v14

    .line 679
    add-long v3, v3, v19

    .line 680
    const-wide/32 v5, 0xf4240

    invoke-static/range {v3 .. v8}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v22

    .line 681
    aget-wide v5, v24, v14

    sub-long v5, v22, v5

    aput-wide v5, v9, v14

    .line 683
    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 684
    aget v5, v21, v14

    int-to-long v5, v5

    add-long/2addr v15, v5

    .line 664
    add-int/lit8 v14, v14, 0x1

    goto :goto_4f

    .line 687
    .end local v12    # "firstInt":I
    .end local v19    # "referenceDuration":J
    .end local v25    # "type":I
    :cond_99
    new-instance v5, Lcom/google/android/exoplayer/extractor/ChunkIndex;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    move-object/from16 v2, v24

    invoke-direct {v5, v0, v1, v9, v2}, Lcom/google/android/exoplayer/extractor/ChunkIndex;-><init>([I[J[J[J)V

    return-object v5
.end method

.method private static parseTfdt(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .registers 5
    .param p0, "tfdt"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 505
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 506
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 507
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 508
    .local v1, "version":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_15

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v2

    :goto_14
    return-wide v2

    :cond_15
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    goto :goto_14
.end method

.method private static parseTfhd(Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 12
    .param p0, "extendsDefaults"    # Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    .param p1, "tfhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .prologue
    .line 474
    const/16 v8, 0x8

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 475
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 476
    .local v7, "fullAtom":I
    invoke-static {v7}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v6

    .line 478
    .local v6, "flags":I
    const/4 v8, 0x4

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 479
    and-int/lit8 v8, v6, 0x1

    if-eqz v8, :cond_1d

    .line 480
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v0

    .line 481
    .local v0, "baseDataPosition":J
    iput-wide v0, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 482
    iput-wide v0, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 485
    .end local v0    # "baseDataPosition":J
    :cond_1d
    and-int/lit8 v8, v6, 0x2

    if-eqz v8, :cond_47

    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v8

    add-int/lit8 v2, v8, -0x1

    .line 488
    .local v2, "defaultSampleDescriptionIndex":I
    :goto_27
    and-int/lit8 v8, v6, 0x8

    if-eqz v8, :cond_4a

    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 490
    .local v3, "defaultSampleDuration":I
    :goto_2f
    and-int/lit8 v8, v6, 0x10

    if-eqz v8, :cond_4d

    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    .line 492
    .local v5, "defaultSampleSize":I
    :goto_37
    and-int/lit8 v8, v6, 0x20

    if-eqz v8, :cond_50

    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 494
    .local v4, "defaultSampleFlags":I
    :goto_3f
    new-instance v8, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v8, v2, v3, v5, v4}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    iput-object v8, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    .line 496
    return-void

    .line 485
    .end local v2    # "defaultSampleDescriptionIndex":I
    .end local v3    # "defaultSampleDuration":I
    .end local v4    # "defaultSampleFlags":I
    .end local v5    # "defaultSampleSize":I
    :cond_47
    iget v2, p0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    goto :goto_27

    .line 488
    .restart local v2    # "defaultSampleDescriptionIndex":I
    :cond_4a
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->duration:I

    goto :goto_2f

    .line 490
    .restart local v3    # "defaultSampleDuration":I
    :cond_4d
    iget v5, p0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->size:I

    goto :goto_37

    .line 492
    .restart local v5    # "defaultSampleSize":I
    :cond_50
    iget v4, p0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    goto :goto_3f
.end method

.method private static parseTraf(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;I[B)V
    .registers 25
    .param p0, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;
    .param p1, "extendsDefaults"    # Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    .param p2, "traf"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .param p3, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .param p4, "workaroundFlags"    # I
    .param p5, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 365
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trun:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getChildAtomOfTypeCount(I)I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_13

    .line 366
    new-instance v2, Lcom/google/android/exoplayer/ParserException;

    const-string v3, "Trun count in traf != 1 (unsupported)."

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 368
    :cond_13
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v15

    .line 370
    .local v15, "tfdtAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v15, :cond_21

    and-int/lit8 v2, p4, 0x2

    if-eqz v2, :cond_b7

    .line 371
    :cond_21
    const-wide/16 v4, 0x0

    .line 376
    .local v4, "decodeTime":J
    :goto_23
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfhd:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v16

    .line 377
    .local v16, "tfhd":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v2, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTfhd(Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 379
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trun:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v18

    .line 380
    .local v18, "trun":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    move-object/from16 v0, v18

    iget-object v7, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v2, p0

    move/from16 v6, p4

    move-object/from16 v8, p3

    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTrun(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;JILcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 382
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saiz:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v13

    .line 383
    .local v13, "saiz":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v13, :cond_6e

    .line 384
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget v3, v3, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    aget-object v17, v2, v3

    .line 386
    .local v17, "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    iget-object v2, v13, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-static {v0, v2, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSaiz(Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 389
    .end local v17    # "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    :cond_6e
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saio:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v12

    .line 390
    .local v12, "saio":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v12, :cond_7f

    .line 391
    iget-object v2, v12, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p3

    invoke-static {v2, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSaio(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 394
    :cond_7f
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_senc:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v14

    .line 395
    .local v14, "senc":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v14, :cond_90

    .line 396
    iget-object v2, v14, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p3

    invoke-static {v2, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 399
    :cond_90
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    .line 400
    .local v10, "childrenSize":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_99
    if-ge v11, v10, :cond_c7

    .line 401
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 402
    .local v9, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v2, v9, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_uuid:I

    if-ne v2, v3, :cond_b4

    .line 403
    iget-object v2, v9, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-static {v2, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseUuid(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;[B)V

    .line 400
    :cond_b4
    add-int/lit8 v11, v11, 0x1

    goto :goto_99

    .line 373
    .end local v4    # "decodeTime":J
    .end local v9    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v10    # "childrenSize":I
    .end local v11    # "i":I
    .end local v12    # "saio":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v13    # "saiz":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v14    # "senc":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v16    # "tfhd":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v18    # "trun":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_b7
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTfdt(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v4

    .restart local v4    # "decodeTime":J
    goto/16 :goto_23

    .line 406
    .restart local v10    # "childrenSize":I
    .restart local v11    # "i":I
    .restart local v12    # "saio":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v13    # "saiz":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v14    # "senc":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v16    # "tfhd":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v18    # "trun":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_c7
    return-void
.end method

.method private static parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    .registers 6
    .param p0, "trex"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 340
    const/16 v4, 0x10

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 341
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 342
    .local v0, "defaultSampleDescriptionIndex":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 343
    .local v1, "defaultSampleDuration":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 344
    .local v3, "defaultSampleSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 345
    .local v2, "defaultSampleFlags":I
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v4, v0, v1, v3, v2}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    return-object v4
.end method

.method private static parseTrun(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;JILcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V
    .registers 38
    .param p0, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;
    .param p1, "defaultSampleValues"    # Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    .param p2, "decodeTime"    # J
    .param p4, "workaroundFlags"    # I
    .param p5, "trun"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p6, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .prologue
    .line 522
    const/16 v4, 0x8

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 523
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v13

    .line 524
    .local v13, "fullAtom":I
    invoke-static {v13}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v12

    .line 526
    .local v12, "flags":I
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v17

    .line 527
    .local v17, "sampleCount":I
    and-int/lit8 v4, v12, 0x1

    if-eqz v4, :cond_2a

    .line 528
    move-object/from16 v0, p6

    iget-wide v4, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v29

    move/from16 v0, v29

    int-to-long v0, v0

    move-wide/from16 v29, v0

    add-long v4, v4, v29

    move-object/from16 v0, p6

    iput-wide v4, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 531
    :cond_2a
    and-int/lit8 v4, v12, 0x4

    if-eqz v4, :cond_f5

    const/4 v11, 0x1

    .line 532
    .local v11, "firstSampleFlagsPresent":Z
    :goto_2f
    move-object/from16 v0, p1

    iget v10, v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    .line 533
    .local v10, "firstSampleFlags":I
    if-eqz v11, :cond_39

    .line 534
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v10

    .line 537
    :cond_39
    and-int/lit16 v4, v12, 0x100

    if-eqz v4, :cond_f8

    const/16 v20, 0x1

    .line 538
    .local v20, "sampleDurationsPresent":Z
    :goto_3f
    and-int/lit16 v4, v12, 0x200

    if-eqz v4, :cond_fc

    const/16 v27, 0x1

    .line 539
    .local v27, "sampleSizesPresent":Z
    :goto_45
    and-int/lit16 v4, v12, 0x400

    if-eqz v4, :cond_100

    const/16 v22, 0x1

    .line 540
    .local v22, "sampleFlagsPresent":Z
    :goto_4b
    and-int/lit16 v4, v12, 0x800

    if-eqz v4, :cond_104

    const/16 v16, 0x1

    .line 545
    .local v16, "sampleCompositionTimeOffsetsPresent":Z
    :goto_51
    const-wide/16 v8, 0x0

    .line 549
    .local v8, "edtsOffset":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    if-eqz v4, :cond_7f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_7f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    const/4 v5, 0x0

    aget-wide v4, v4, v5

    const-wide/16 v29, 0x0

    cmp-long v4, v4, v29

    if-nez v4, :cond_7f

    .line 551
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    const/4 v5, 0x0

    aget-wide v2, v4, v5

    const-wide/16 v4, 0x3e8

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v8

    .line 554
    :cond_7f
    move-object/from16 v0, p6

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initTables(I)V

    .line 555
    move-object/from16 v0, p6

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v26, v0

    .line 556
    .local v26, "sampleSizeTable":[I
    move-object/from16 v0, p6

    iget-object v15, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    .line 557
    .local v15, "sampleCompositionTimeOffsetTable":[I
    move-object/from16 v0, p6

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    move-object/from16 v18, v0

    .line 558
    .local v18, "sampleDecodingTimeTable":[J
    move-object/from16 v0, p6

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    move-object/from16 v23, v0

    .line 560
    .local v23, "sampleIsSyncFrameTable":[Z
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    .line 561
    .local v6, "timescale":J
    move-wide/from16 v2, p2

    .line 562
    .local v2, "cumulativeTime":J
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->type:I

    sget v5, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_vide:I

    if-ne v4, v5, :cond_108

    and-int/lit8 v4, p4, 0x1

    if-eqz v4, :cond_108

    const/16 v28, 0x1

    .line 564
    .local v28, "workaroundEveryVideoFrameIsSyncFrame":Z
    :goto_b0
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_b1
    move/from16 v0, v17

    if-ge v14, v0, :cond_12d

    .line 566
    if-eqz v20, :cond_10b

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v19

    .line 568
    .local v19, "sampleDuration":I
    :goto_bb
    if-eqz v27, :cond_112

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v25

    .line 569
    .local v25, "sampleSize":I
    :goto_c1
    if-nez v14, :cond_119

    if-eqz v11, :cond_119

    move/from16 v21, v10

    .line 571
    .local v21, "sampleFlags":I
    :goto_c7
    if-eqz v16, :cond_127

    .line 577
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v24

    .line 578
    .local v24, "sampleOffset":I
    move/from16 v0, v24

    mul-int/lit16 v4, v0, 0x3e8

    int-to-long v4, v4

    div-long/2addr v4, v6

    long-to-int v4, v4

    aput v4, v15, v14

    .line 582
    .end local v24    # "sampleOffset":I
    :goto_d6
    const-wide/16 v4, 0x3e8

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v4

    sub-long/2addr v4, v8

    aput-wide v4, v18, v14

    .line 584
    aput v25, v26, v14

    .line 585
    shr-int/lit8 v4, v21, 0x10

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_12b

    if-eqz v28, :cond_eb

    if-nez v14, :cond_12b

    :cond_eb
    const/4 v4, 0x1

    :goto_ec
    aput-boolean v4, v23, v14

    .line 587
    move/from16 v0, v19

    int-to-long v4, v0

    add-long/2addr v2, v4

    .line 564
    add-int/lit8 v14, v14, 0x1

    goto :goto_b1

    .line 531
    .end local v2    # "cumulativeTime":J
    .end local v6    # "timescale":J
    .end local v8    # "edtsOffset":J
    .end local v10    # "firstSampleFlags":I
    .end local v11    # "firstSampleFlagsPresent":Z
    .end local v14    # "i":I
    .end local v15    # "sampleCompositionTimeOffsetTable":[I
    .end local v16    # "sampleCompositionTimeOffsetsPresent":Z
    .end local v18    # "sampleDecodingTimeTable":[J
    .end local v19    # "sampleDuration":I
    .end local v20    # "sampleDurationsPresent":Z
    .end local v21    # "sampleFlags":I
    .end local v22    # "sampleFlagsPresent":Z
    .end local v23    # "sampleIsSyncFrameTable":[Z
    .end local v25    # "sampleSize":I
    .end local v26    # "sampleSizeTable":[I
    .end local v27    # "sampleSizesPresent":Z
    .end local v28    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_f5
    const/4 v11, 0x0

    goto/16 :goto_2f

    .line 537
    .restart local v10    # "firstSampleFlags":I
    .restart local v11    # "firstSampleFlagsPresent":Z
    :cond_f8
    const/16 v20, 0x0

    goto/16 :goto_3f

    .line 538
    .restart local v20    # "sampleDurationsPresent":Z
    :cond_fc
    const/16 v27, 0x0

    goto/16 :goto_45

    .line 539
    .restart local v27    # "sampleSizesPresent":Z
    :cond_100
    const/16 v22, 0x0

    goto/16 :goto_4b

    .line 540
    .restart local v22    # "sampleFlagsPresent":Z
    :cond_104
    const/16 v16, 0x0

    goto/16 :goto_51

    .line 562
    .restart local v2    # "cumulativeTime":J
    .restart local v6    # "timescale":J
    .restart local v8    # "edtsOffset":J
    .restart local v15    # "sampleCompositionTimeOffsetTable":[I
    .restart local v16    # "sampleCompositionTimeOffsetsPresent":Z
    .restart local v18    # "sampleDecodingTimeTable":[J
    .restart local v23    # "sampleIsSyncFrameTable":[Z
    .restart local v26    # "sampleSizeTable":[I
    :cond_108
    const/16 v28, 0x0

    goto :goto_b0

    .line 566
    .restart local v14    # "i":I
    .restart local v28    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_10b
    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->duration:I

    move/from16 v19, v0

    goto :goto_bb

    .line 568
    .restart local v19    # "sampleDuration":I
    :cond_112
    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->size:I

    move/from16 v25, v0

    goto :goto_c1

    .line 569
    .restart local v25    # "sampleSize":I
    :cond_119
    if-eqz v22, :cond_120

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v21

    goto :goto_c7

    :cond_120
    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    move/from16 v21, v0

    goto :goto_c7

    .line 580
    .restart local v21    # "sampleFlags":I
    :cond_127
    const/4 v4, 0x0

    aput v4, v15, v14

    goto :goto_d6

    .line 585
    :cond_12b
    const/4 v4, 0x0

    goto :goto_ec

    .line 589
    .end local v19    # "sampleDuration":I
    .end local v21    # "sampleFlags":I
    .end local v25    # "sampleSize":I
    :cond_12d
    return-void
.end method

.method private static parseUuid(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;[B)V
    .registers 5
    .param p0, "uuid"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .param p2, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x10

    .line 593
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 594
    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 597
    sget-object v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_14

    .line 605
    :goto_13
    return-void

    .line 604
    :cond_14
    invoke-static {p0, v1, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    goto :goto_13
.end method

.method private readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 16
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const-wide/32 v12, 0x7fffffff

    const/16 v11, 0x8

    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 195
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    if-nez v7, :cond_2d

    .line 197
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v7, v7, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v7, v5, v11, v6}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BIIZ)Z

    move-result v7

    if-nez v7, :cond_16

    .line 257
    :goto_15
    return v5

    .line 200
    :cond_16
    iput v11, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 201
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v7, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 202
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 203
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    .line 206
    :cond_2d
    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/16 v9, 0x1

    cmp-long v7, v7, v9

    if-nez v7, :cond_4b

    .line 208
    const/16 v4, 0x8

    .line 209
    .local v4, "headerBytesRemaining":I
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v7, v7, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v7, v11, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 210
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    add-int/2addr v7, v4

    iput v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 211
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 214
    .end local v4    # "headerBytesRemaining":I
    :cond_4b
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v7

    iget v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v9, v9

    sub-long v0, v7, v9

    .line 215
    .local v0, "atomPosition":J
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v7, v8, :cond_62

    .line 217
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iput-wide v0, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 218
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iput-wide v0, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 221
    :cond_62
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdat:I

    if-ne v7, v8, :cond_89

    .line 222
    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v7, v0

    iput-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    .line 223
    iget-boolean v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    if-nez v5, :cond_7a

    .line 224
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    sget-object v7, Lcom/google/android/exoplayer/extractor/SeekMap;->UNSEEKABLE:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v5, v7}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 225
    iput-boolean v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    .line 227
    :cond_7a
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-boolean v5, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    if-eqz v5, :cond_85

    .line 228
    const/4 v5, 0x2

    iput v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    :goto_83
    move v5, v6

    .line 232
    goto :goto_15

    .line 230
    :cond_85
    const/4 v5, 0x3

    iput v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_83

    .line 235
    :cond_89
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v7}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->shouldParseContainerAtom(I)Z

    move-result v7

    if-eqz v7, :cond_ae

    .line 236
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v7, v9

    const-wide/16 v9, 0x8

    sub-long v2, v7, v9

    .line 237
    .local v2, "endPosition":J
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-direct {v7, v8, v2, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v5, v7}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 238
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .end local v2    # "endPosition":J
    :goto_ab
    move v5, v6

    .line 257
    goto/16 :goto_15

    .line 239
    :cond_ae
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v7}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->shouldParseLeafAtom(I)Z

    move-result v7

    if-eqz v7, :cond_e8

    .line 240
    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    if-eq v7, v11, :cond_c2

    .line 241
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Leaf atom defines extended atom size (unsupported)."

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 243
    :cond_c2
    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    cmp-long v7, v7, v12

    if-lez v7, :cond_d0

    .line 244
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Leaf atom with length > 2147483647 (unsupported)."

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 246
    :cond_d0
    new-instance v7, Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v8, v8

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 247
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v7, v7, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v7, v5, v8, v5, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 248
    iput v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_ab

    .line 250
    :cond_e8
    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    cmp-long v5, v7, v12

    if-lez v5, :cond_f6

    .line 251
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Skipping atom with length > 2147483647 (unsupported)."

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 253
    :cond_f6
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 254
    iput v6, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_ab
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 8
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 261
    iget-wide v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v3, v3

    iget v4, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    sub-int v0, v3, v4

    .line 262
    .local v0, "atomPayloadSize":I
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v3, :cond_4a

    .line 263
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v4, 0x8

    invoke-interface {p1, v3, v4, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 264
    new-instance v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    iget v4, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v3, v4, v5}, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer/util/ParsableByteArray;)V

    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v4

    invoke-direct {p0, v3, v4, v5}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onLeafAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;J)V

    .line 268
    :goto_24
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    .line 269
    .local v1, "currentPosition":J
    :goto_28
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4e

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget-wide v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    cmp-long v3, v3, v1

    if-nez v3, :cond_4e

    .line 270
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_28

    .line 266
    .end local v1    # "currentPosition":J
    :cond_4a
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_24

    .line 272
    .restart local v1    # "currentPosition":J
    :cond_4e
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 273
    return-void
.end method

.method private readEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 7
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 691
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-wide v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v3

    sub-long/2addr v1, v3

    long-to-int v0, v1

    .line 692
    .local v0, "bytesToSkip":I
    if-gez v0, :cond_14

    .line 693
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    const-string v2, "Offset to encryption data was negative."

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 695
    :cond_14
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 696
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    .line 697
    const/4 v1, 0x3

    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 698
    return-void
.end method

.method private readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 18
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 715
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    const/4 v5, 0x3

    if-ne v1, v5, :cond_91

    .line 716
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget v5, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-ne v1, v5, :cond_31

    .line 719
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v14

    sub-long/2addr v5, v14

    long-to-int v8, v5

    .line 720
    .local v8, "bytesToSkip":I
    if-gez v8, :cond_27

    .line 721
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    const-string v5, "Offset to end of mdat was negative."

    invoke-direct {v1, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 723
    :cond_27
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 724
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 725
    const/4 v1, 0x0

    .line 793
    .end local v8    # "bytesToSkip":I
    :goto_30
    return v1

    .line 727
    :cond_31
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    if-nez v1, :cond_52

    .line 729
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-wide v5, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v14

    sub-long/2addr v5, v14

    long-to-int v8, v5

    .line 730
    .restart local v8    # "bytesToSkip":I
    if-gez v8, :cond_4d

    .line 731
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    const-string v5, "Offset to sample data was negative."

    invoke-direct {v1, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 733
    :cond_4d
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 735
    .end local v8    # "bytesToSkip":I
    :cond_52
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget v1, v1, v5

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 736
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-boolean v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v1, :cond_111

    .line 737
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->appendSampleEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 738
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/2addr v1, v5

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 742
    :goto_87
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 743
    const/4 v1, 0x4

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 746
    :cond_91
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v1, v1, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    const/4 v5, -0x1

    if-eq v1, v5, :cond_13a

    .line 749
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v9, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 750
    .local v9, "nalLengthData":[B
    const/4 v1, 0x0

    const/4 v5, 0x0

    aput-byte v5, v9, v1

    .line 751
    const/4 v1, 0x1

    const/4 v5, 0x0

    aput-byte v5, v9, v1

    .line 752
    const/4 v1, 0x2

    const/4 v5, 0x0

    aput-byte v5, v9, v1

    .line 753
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v10, v1, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    .line 754
    .local v10, "nalUnitLengthFieldLength":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v1, v1, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v11, v1, 0x4

    .line 758
    .local v11, "nalUnitLengthFieldLengthDiff":I
    :goto_ba
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v1, v5, :cond_162

    .line 759
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    if-nez v1, :cond_118

    .line 761
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p1

    invoke-interface {v0, v1, v11, v10}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 762
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 763
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 765
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 766
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v6, 0x4

    invoke-interface {v1, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 767
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/lit8 v1, v1, 0x4

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 768
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    add-int/2addr v1, v11

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    goto :goto_ba

    .line 740
    .end local v9    # "nalLengthData":[B
    .end local v10    # "nalUnitLengthFieldLength":I
    .end local v11    # "nalUnitLengthFieldLengthDiff":I
    :cond_111
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto/16 :goto_87

    .line 771
    .restart local v9    # "nalLengthData":[B
    .restart local v10    # "nalUnitLengthFieldLength":I
    .restart local v11    # "nalUnitLengthFieldLengthDiff":I
    :cond_118
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v13

    .line 772
    .local v13, "writtenBytes":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/2addr v1, v13

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 773
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int/2addr v1, v13

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_ba

    .line 777
    .end local v9    # "nalLengthData":[B
    .end local v10    # "nalUnitLengthFieldLength":I
    .end local v11    # "nalUnitLengthFieldLengthDiff":I
    .end local v13    # "writtenBytes":I
    :cond_13a
    :goto_13a
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v1, v5, :cond_162

    .line 778
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    sub-int/2addr v5, v6

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v13

    .line 779
    .restart local v13    # "writtenBytes":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/2addr v1, v13

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto :goto_13a

    .line 783
    .end local v13    # "writtenBytes":I
    :cond_162
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v5

    const-wide/16 v14, 0x3e8

    mul-long v2, v5, v14

    .line 784
    .local v2, "sampleTimeUs":J
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-boolean v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v1, :cond_1c4

    const/4 v1, 0x2

    :goto_17b
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget-boolean v5, v5, v6

    if-eqz v5, :cond_1c6

    const/4 v5, 0x1

    :goto_18a
    or-int v4, v1, v5

    .line 786
    .local v4, "sampleFlags":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget v12, v1, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    .line 787
    .local v12, "sampleDescriptionIndex":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-boolean v1, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v1, :cond_1c8

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget-object v1, v1, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    aget-object v1, v1, v12

    iget-object v7, v1, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->keyId:[B

    .line 789
    .local v7, "encryptionKey":[B
    :goto_1a6
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    const/4 v6, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 791
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    add-int/lit8 v1, v1, 0x1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleIndex:I

    .line 792
    const/4 v1, 0x3

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 793
    const/4 v1, 0x1

    goto/16 :goto_30

    .line 784
    .end local v4    # "sampleFlags":I
    .end local v7    # "encryptionKey":[B
    .end local v12    # "sampleDescriptionIndex":I
    :cond_1c4
    const/4 v1, 0x0

    goto :goto_17b

    :cond_1c6
    const/4 v5, 0x0

    goto :goto_18a

    .line 787
    .restart local v4    # "sampleFlags":I
    .restart local v12    # "sampleDescriptionIndex":I
    :cond_1c8
    const/4 v7, 0x0

    goto :goto_1a6
.end method

.method private static shouldParseContainerAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 833
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_traf:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvex:I

    if-eq p0, v0, :cond_24

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_edts:I

    if-ne p0, v0, :cond_26

    :cond_24
    const/4 v0, 0x1

    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method private static shouldParseLeafAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 823
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hdlr:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdhd:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sidx:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsd:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfdt:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfhd:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tkhd:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trex:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trun:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pssh:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saiz:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saio:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_senc:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_uuid:I

    if-eq p0, v0, :cond_40

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_elst:I

    if-ne p0, v0, :cond_42

    :cond_40
    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method


# virtual methods
.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 3
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 155
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 157
    return-void
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 4
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 169
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    packed-switch v0, :pswitch_data_1e

    .line 182
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    const/4 v0, 0x0

    :goto_c
    return v0

    .line 171
    :pswitch_d
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    const/4 v0, -0x1

    goto :goto_c

    .line 176
    :pswitch_15
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    goto :goto_0

    .line 179
    :pswitch_19
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    goto :goto_0

    .line 169
    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_15
        :pswitch_19
    .end packed-switch
.end method

.method public seek()V
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 162
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 163
    return-void
.end method

.method public setTrack(Lcom/google/android/exoplayer/extractor/mp4/Track;)V
    .registers 4
    .param p1, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;

    .prologue
    const/4 v1, 0x0

    .line 148
    new-instance v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    .line 149
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    .line 150
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 3
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffFragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method
