.class public final Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;
.super Ljava/lang/Object;
.source "FragmentedMp4Extractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    }
.end annotation


# static fields
.field private static final FLAG_SIDELOADED:I = 0x4

.field public static final FLAG_WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME:I = 0x1

.field public static final FLAG_WORKAROUND_IGNORE_TFDT_BOX:I = 0x2

.field private static final PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

.field private static final STATE_READING_ATOM_HEADER:I = 0x0

.field private static final STATE_READING_ATOM_PAYLOAD:I = 0x1

.field private static final STATE_READING_ENCRYPTION_DATA:I = 0x2

.field private static final STATE_READING_SAMPLE_CONTINUE:I = 0x4

.field private static final STATE_READING_SAMPLE_START:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FragmentedMp4Extractor"


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

.field private currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

.field private final encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private endOfMdatPosition:J

.field private final extendedTypeScratch:[B

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private final flags:I

.field private haveOutputSeekMap:Z

.field private final nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private parserState:I

.field private sampleBytesWritten:I

.field private sampleCurrentNalBytesRemaining:I

.field private sampleSize:I

.field private final sideloadedTrack:Lcom/google/android/exoplayer/extractor/mp4/Track;

.field private final trackBundles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 74
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
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;-><init>(I)V

    .line 121
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "flags"    # I

    .prologue
    .line 127
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;-><init>(ILcom/google/android/exoplayer/extractor/mp4/Track;)V

    .line 128
    return-void
.end method

.method public constructor <init>(ILcom/google/android/exoplayer/extractor/mp4/Track;)V
    .registers 7
    .param p1, "flags"    # I
    .param p2, "sideloadedTrack"    # Lcom/google/android/exoplayer/extractor/mp4/Track;

    .prologue
    const/16 v3, 0x10

    const/4 v1, 0x4

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer/extractor/mp4/Track;

    .line 137
    if-eqz p2, :cond_43

    move v0, v1

    :goto_b
    or-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->flags:I

    .line 138
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 139
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v2, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 140
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 141
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 142
    new-array v0, v3, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    .line 143
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 144
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    .line 145
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 146
    return-void

    .line 137
    :cond_43
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private appendSampleEncryptionData(Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;)I
    .registers 14
    .param p1, "trackBundle"    # Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .prologue
    const/4 v10, 0x0

    .line 926
    iget-object v7, p1, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 927
    .local v7, "trackFragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    iget-object v3, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 928
    .local v3, "sampleEncryptionData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    iget-object v9, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget v2, v9, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    .line 929
    .local v2, "sampleDescriptionIndex":I
    iget-object v9, p1, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget-object v9, v9, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    aget-object v0, v9, v2

    .line 931
    .local v0, "encryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    iget v8, v0, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 932
    .local v8, "vectorSize":I
    iget-object v9, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    iget v11, p1, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    aget-boolean v6, v9, v11

    .line 936
    .local v6, "subsampleEncryption":Z
    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v11, v9, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    if-eqz v6, :cond_38

    const/16 v9, 0x80

    :goto_1f
    or-int/2addr v9, v8

    int-to-byte v9, v9

    aput-byte v9, v11, v10

    .line 937
    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 938
    iget-object v1, p1, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 939
    .local v1, "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v10, 0x1

    invoke-interface {v1, v9, v10}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 941
    invoke-interface {v1, v3, v8}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 943
    if-nez v6, :cond_3a

    .line 944
    add-int/lit8 v9, v8, 0x1

    .line 951
    :goto_37
    return v9

    .end local v1    # "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    :cond_38
    move v9, v10

    .line 936
    goto :goto_1f

    .line 947
    .restart local v1    # "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    :cond_3a
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v4

    .line 948
    .local v4, "subsampleCount":I
    const/4 v9, -0x2

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 949
    mul-int/lit8 v9, v4, 0x6

    add-int/lit8 v5, v9, 0x2

    .line 950
    .local v5, "subsampleDataLength":I
    invoke-interface {v1, v3, v5}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 951
    add-int/lit8 v9, v8, 0x1

    add-int/2addr v9, v5

    goto :goto_37
.end method

.method private enterReadingAtomHeaderState()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 200
    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 201
    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 202
    return-void
.end method

.method private static getNextFragmentRun(Landroid/util/SparseArray;)Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;)",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;"
        }
    .end annotation

    .prologue
    .line 898
    .local p0, "trackBundles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    const/4 v1, 0x0

    .line 899
    .local v1, "nextTrackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    const-wide v2, 0x7fffffffffffffffL

    .line 901
    .local v2, "nextTrackRunOffset":J
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 902
    .local v5, "trackBundlesSize":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v5, :cond_29

    .line 903
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 904
    .local v4, "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    iget v8, v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    iget-object v9, v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget v9, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-ne v8, v9, :cond_1e

    .line 902
    :cond_1b
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 907
    :cond_1e
    iget-object v8, v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-wide v6, v8, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 908
    .local v6, "trunOffset":J
    cmp-long v8, v6, v2

    if-gez v8, :cond_1b

    .line 909
    move-object v1, v4

    .line 910
    move-wide v2, v6

    goto :goto_1b

    .line 914
    .end local v4    # "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .end local v6    # "trunOffset":J
    :cond_29
    return-object v1
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
    .line 305
    iget v0, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-ne v0, v1, :cond_a

    .line 306
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onMoovContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    .line 312
    :cond_9
    :goto_9
    return-void

    .line 307
    :cond_a
    iget v0, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v0, v1, :cond_14

    .line 308
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onMoofContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_9

    .line 309
    :cond_14
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9

    .line 310
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
    .line 295
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    .line 296
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;)V

    .line 302
    :cond_13
    :goto_13
    return-void

    .line 297
    :cond_14
    iget v1, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sidx:I

    if-ne v1, v2, :cond_13

    .line 298
    iget-object v1, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v1, p2, p3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSidx(Lcom/google/android/exoplayer/util/ParsableByteArray;J)Lcom/google/android/exoplayer/extractor/ChunkIndex;

    move-result-object v0

    .line 299
    .local v0, "segmentIndex":Lcom/google/android/exoplayer/extractor/ChunkIndex;
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 300
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    goto :goto_13
.end method

.method private onMoofContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 5
    .param p1, "moof"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 384
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    iget v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->flags:I

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    invoke-static {p1, v0, v1, v2}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseMoof(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V

    .line 385
    return-void
.end method

.method private onMoovContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 25
    .param p1, "moov"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .prologue
    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-object/from16 v19, v0

    if-nez v19, :cond_4c

    const/16 v19, 0x1

    :goto_a
    const-string v20, "Unexpected moov box."

    invoke-static/range {v19 .. v20}, Lcom/google/android/exoplayer/util/Assertions;->checkState(ZLjava/lang/Object;)V

    .line 316
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    .line 317
    .local v9, "moovLeafChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    .line 319
    .local v10, "moovLeafChildrenSize":I
    const/4 v6, 0x0

    .line 320
    .local v6, "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_19
    if-ge v7, v10, :cond_66

    .line 321
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 322
    .local v4, "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    move/from16 v19, v0

    sget v20, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pssh:I

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_49

    .line 323
    if-nez v6, :cond_34

    .line 324
    new-instance v6, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;

    .end local v6    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    invoke-direct {v6}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;-><init>()V

    .line 326
    .restart local v6    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    :cond_34
    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v13, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 327
    .local v13, "psshData":[B
    invoke-static {v13}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v18

    .line 328
    .local v18, "uuid":Ljava/util/UUID;
    if-nez v18, :cond_4f

    .line 329
    const-string v19, "FragmentedMp4Extractor"

    const-string v20, "Skipped pssh atom (failed to extract uuid)"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .end local v13    # "psshData":[B
    .end local v18    # "uuid":Ljava/util/UUID;
    :cond_49
    :goto_49
    add-int/lit8 v7, v7, 0x1

    goto :goto_19

    .line 315
    .end local v4    # "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v6    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    .end local v7    # "i":I
    .end local v9    # "moovLeafChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;>;"
    .end local v10    # "moovLeafChildrenSize":I
    :cond_4c
    const/16 v19, 0x0

    goto :goto_a

    .line 331
    .restart local v4    # "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v6    # "drmInitData":Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;
    .restart local v7    # "i":I
    .restart local v9    # "moovLeafChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;>;"
    .restart local v10    # "moovLeafChildrenSize":I
    .restart local v13    # "psshData":[B
    .restart local v18    # "uuid":Ljava/util/UUID;
    :cond_4f
    invoke-static {v13}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v19

    new-instance v20, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;

    const-string v21, "video/mp4"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v13}, Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;-><init>(Ljava/lang/String;[B)V

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Lcom/google/android/exoplayer/drm/DrmInitData$Mapped;->put(Ljava/util/UUID;Lcom/google/android/exoplayer/drm/DrmInitData$SchemeInitData;)V

    goto :goto_49

    .line 336
    .end local v4    # "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v13    # "psshData":[B
    .end local v18    # "uuid":Ljava/util/UUID;
    :cond_66
    if-eqz v6, :cond_73

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v6}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->drmInitData(Lcom/google/android/exoplayer/drm/DrmInitData;)V

    .line 341
    :cond_73
    sget v19, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvex:I

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v11

    .line 342
    .local v11, "mvex":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 343
    .local v5, "defaultSampleValuesArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;>;"
    iget-object v0, v11, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v12

    .line 344
    .local v12, "mvexChildrenSize":I
    const/4 v7, 0x0

    :goto_8b
    if-ge v7, v12, :cond_c9

    .line 345
    iget-object v0, v11, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 346
    .local v3, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v0, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    move/from16 v19, v0

    sget v20, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trex:I

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_c6

    .line 347
    iget-object v0, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v17

    .line 348
    .local v17, "trexData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;>;"
    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move-object/from16 v0, v17

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v20, v0

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 344
    .end local v17    # "trexData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;>;"
    :cond_c6
    add-int/lit8 v7, v7, 0x1

    goto :goto_8b

    .line 353
    .end local v3    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_c9
    new-instance v16, Landroid/util/SparseArray;

    invoke-direct/range {v16 .. v16}, Landroid/util/SparseArray;-><init>()V

    .line 354
    .local v16, "tracks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/Track;>;"
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v8

    .line 355
    .local v8, "moovContainerChildrenSize":I
    const/4 v7, 0x0

    :goto_d9
    if-ge v7, v8, :cond_119

    .line 356
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 357
    .local v3, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v0, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    move/from16 v19, v0

    sget v20, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_116

    .line 358
    sget v19, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v3, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTrak(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-result-object v14

    .line 359
    .local v14, "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    if-eqz v14, :cond_116

    .line 360
    iget v0, v14, Lcom/google/android/exoplayer/extractor/mp4/Track;->id:I

    move/from16 v19, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1, v14}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 355
    .end local v14    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    :cond_116
    add-int/lit8 v7, v7, 0x1

    goto :goto_d9

    .line 364
    .end local v3    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_119
    invoke-virtual/range {v16 .. v16}, Landroid/util/SparseArray;->size()I

    move-result v15

    .line 366
    .local v15, "trackCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/util/SparseArray;->size()I

    move-result v19

    if-nez v19, :cond_197

    .line 368
    const/4 v7, 0x0

    :goto_12a
    if-ge v7, v15, :cond_15d

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    move-object/from16 v20, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-object/from16 v0, v19

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->id:I

    move/from16 v19, v0

    new-instance v21, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-interface {v0, v7}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    move-object/from16 v0, v20

    move/from16 v1, v19

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 368
    add-int/lit8 v7, v7, 0x1

    goto :goto_12a

    .line 371
    :cond_15d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 377
    :goto_166
    const/4 v7, 0x0

    :goto_167
    if-ge v7, v15, :cond_1ae

    .line 378
    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/exoplayer/extractor/mp4/Track;

    .line 379
    .restart local v14    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    move-object/from16 v19, v0

    iget v0, v14, Lcom/google/android/exoplayer/extractor/mp4/Track;->id:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v0, v14, Lcom/google/android/exoplayer/extractor/mp4/Track;->id:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v14, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->init(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;)V

    .line 377
    add-int/lit8 v7, v7, 0x1

    goto :goto_167

    .line 373
    .end local v14    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    :cond_197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/util/SparseArray;->size()I

    move-result v19

    move/from16 v0, v19

    if-ne v0, v15, :cond_1ab

    const/16 v19, 0x1

    :goto_1a7
    invoke-static/range {v19 .. v19}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    goto :goto_166

    :cond_1ab
    const/16 v19, 0x0

    goto :goto_1a7

    .line 381
    :cond_1ae
    return-void
.end method

.method private static parseMoof(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V
    .registers 9
    .param p0, "moof"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .param p2, "flags"    # I
    .param p3, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 404
    .local p1, "trackBundleArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 405
    .local v2, "moofContainerChildrenSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v2, :cond_1d

    .line 406
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 407
    .local v0, "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_traf:I

    if-ne v3, v4, :cond_1a

    .line 408
    invoke-static {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTraf(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V

    .line 405
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 411
    .end local v0    # "child":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_1d
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

    .line 507
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 508
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 509
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 510
    .local v1, "flags":I
    and-int/lit8 v4, v1, 0x1

    if-ne v4, v5, :cond_15

    .line 511
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 514
    :cond_15
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 515
    .local v0, "entryCount":I
    if-eq v0, v5, :cond_34

    .line 517
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

    .line 520
    :cond_34
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v3

    .line 521
    .local v3, "version":I
    iget-wide v6, p1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    if-nez v3, :cond_44

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    :goto_40
    add-long/2addr v4, v6

    iput-wide v4, p1, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 523
    return-void

    .line 521
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
    .line 470
    iget v9, p0, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 471
    .local v9, "vectorSize":I
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 472
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 473
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 474
    .local v1, "flags":I
    and-int/lit8 v10, v1, 0x1

    const/4 v11, 0x1

    if-ne v10, v11, :cond_19

    .line 475
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 477
    :cond_19
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 479
    .local v0, "defaultSampleInfoSize":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 480
    .local v4, "sampleCount":I
    iget v10, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-eq v4, v10, :cond_4a

    .line 481
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

    .line 484
    :cond_4a
    const/4 v8, 0x0

    .line 485
    .local v8, "totalSize":I
    if-nez v0, :cond_61

    .line 486
    iget-object v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    .line 487
    .local v5, "sampleHasSubsampleEncryptionTable":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_50
    if-ge v3, v4, :cond_6d

    .line 488
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v6

    .line 489
    .local v6, "sampleInfoSize":I
    add-int/2addr v8, v6

    .line 490
    if-le v6, v9, :cond_5f

    const/4 v10, 0x1

    :goto_5a
    aput-boolean v10, v5, v3

    .line 487
    add-int/lit8 v3, v3, 0x1

    goto :goto_50

    .line 490
    :cond_5f
    const/4 v10, 0x0

    goto :goto_5a

    .line 493
    .end local v3    # "i":I
    .end local v5    # "sampleHasSubsampleEncryptionTable":[Z
    .end local v6    # "sampleInfoSize":I
    :cond_61
    if-le v0, v9, :cond_71

    const/4 v7, 0x1

    .line 494
    .local v7, "subsampleEncryption":Z
    :goto_64
    mul-int v10, v0, v4

    add-int/2addr v8, v10

    .line 495
    iget-object v10, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    const/4 v11, 0x0

    invoke-static {v10, v11, v4, v7}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 497
    .end local v7    # "subsampleEncryption":Z
    :cond_6d
    invoke-virtual {p2, v8}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 498
    return-void

    .line 493
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

    .line 685
    add-int/lit8 v5, p1, 0x8

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 686
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 687
    .local v1, "fullAtom":I
    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v0

    .line 689
    .local v0, "flags":I
    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_1a

    .line 691
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    const-string v5, "Overriding TrackEncryptionBox parameters is unsupported."

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 694
    :cond_1a
    and-int/lit8 v5, v0, 0x2

    if-eqz v5, :cond_4c

    const/4 v3, 0x1

    .line 695
    .local v3, "subsampleEncryption":Z
    :goto_1f
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    .line 696
    .local v2, "sampleCount":I
    iget v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-eq v2, v5, :cond_4e

    .line 697
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

    .line 694
    goto :goto_1f

    .line 700
    .restart local v2    # "sampleCount":I
    .restart local v3    # "subsampleEncryption":Z
    :cond_4e
    iget-object v5, p2, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    invoke-static {v5, v4, v2, v3}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 701
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    invoke-virtual {p2, v4}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 702
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 703
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
    .line 680
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 681
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
    .line 710
    const/16 v5, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 711
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v13

    .line 712
    .local v13, "fullAtom":I
    invoke-static {v13}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v26

    .line 714
    .local v26, "version":I
    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 715
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v7

    .line 717
    .local v7, "timescale":J
    move-wide/from16 v15, p1

    .line 718
    .local v15, "offset":J
    if-nez v26, :cond_65

    .line 719
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v10

    .line 720
    .local v10, "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v5

    add-long/2addr v15, v5

    .line 726
    :goto_26
    const/4 v5, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 728
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v18

    .line 729
    .local v18, "referenceCount":I
    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v21, v0

    .line 730
    .local v21, "sizes":[I
    move/from16 v0, v18

    new-array v0, v0, [J

    move-object/from16 v17, v0

    .line 731
    .local v17, "offsets":[J
    move/from16 v0, v18

    new-array v9, v0, [J

    .line 732
    .local v9, "durationsUs":[J
    move/from16 v0, v18

    new-array v0, v0, [J

    move-object/from16 v24, v0

    .line 734
    .local v24, "timesUs":[J
    move-wide v3, v10

    .line 735
    .local v3, "time":J
    const-wide/32 v5, 0xf4240

    invoke-static/range {v3 .. v8}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v22

    .line 736
    .local v22, "timeUs":J
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_4f
    move/from16 v0, v18

    if-ge v14, v0, :cond_99

    .line 737
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v12

    .line 739
    .local v12, "firstInt":I
    const/high16 v5, -0x80000000

    and-int v25, v5, v12

    .line 740
    .local v25, "type":I
    if-eqz v25, :cond_6f

    .line 741
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Unhandled indirect reference"

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 722
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

    .line 723
    .restart local v10    # "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v5

    add-long/2addr v15, v5

    goto :goto_26

    .line 743
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

    .line 745
    .local v19, "referenceDuration":J
    const v5, 0x7fffffff

    and-int/2addr v5, v12

    aput v5, v21, v14

    .line 746
    aput-wide v15, v17, v14

    .line 750
    aput-wide v22, v24, v14

    .line 751
    add-long v3, v3, v19

    .line 752
    const-wide/32 v5, 0xf4240

    invoke-static/range {v3 .. v8}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v22

    .line 753
    aget-wide v5, v24, v14

    sub-long v5, v22, v5

    aput-wide v5, v9, v14

    .line 755
    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 756
    aget v5, v21, v14

    int-to-long v5, v5

    add-long/2addr v15, v5

    .line 736
    add-int/lit8 v14, v14, 0x1

    goto :goto_4f

    .line 759
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
    .line 573
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 574
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 575
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 576
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

.method private static parseTfhd(Lcom/google/android/exoplayer/util/ParsableByteArray;Landroid/util/SparseArray;I)Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .registers 16
    .param p0, "tfhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I)",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;"
        }
    .end annotation

    .prologue
    .line 537
    .local p1, "trackBundles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    const/16 v11, 0x8

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 538
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    .line 539
    .local v8, "fullAtom":I
    invoke-static {v8}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v0

    .line 540
    .local v0, "atomFlags":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v10

    .line 541
    .local v10, "trackId":I
    and-int/lit8 v11, p2, 0x4

    if-nez v11, :cond_1f

    .end local v10    # "trackId":I
    :goto_15
    invoke-virtual {p1, v10}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 542
    .local v9, "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    if-nez v9, :cond_21

    .line 543
    const/4 v9, 0x0

    .line 563
    .end local v9    # "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :goto_1e
    return-object v9

    .line 541
    .restart local v10    # "trackId":I
    :cond_1f
    const/4 v10, 0x0

    goto :goto_15

    .line 545
    .end local v10    # "trackId":I
    .restart local v9    # "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_21
    and-int/lit8 v11, v0, 0x1

    if-eqz v11, :cond_31

    .line 546
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v1

    .line 547
    .local v1, "baseDataPosition":J
    iget-object v11, v9, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iput-wide v1, v11, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 548
    iget-object v11, v9, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iput-wide v1, v11, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 551
    .end local v1    # "baseDataPosition":J
    :cond_31
    iget-object v7, v9, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->defaultSampleValues:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    .line 552
    .local v7, "defaultSampleValues":Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    and-int/lit8 v11, v0, 0x2

    if-eqz v11, :cond_5f

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v11

    add-int/lit8 v3, v11, -0x1

    .line 555
    .local v3, "defaultSampleDescriptionIndex":I
    :goto_3d
    and-int/lit8 v11, v0, 0x8

    if-eqz v11, :cond_62

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 557
    .local v4, "defaultSampleDuration":I
    :goto_45
    and-int/lit8 v11, v0, 0x10

    if-eqz v11, :cond_65

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v6

    .line 559
    .local v6, "defaultSampleSize":I
    :goto_4d
    and-int/lit8 v11, v0, 0x20

    if-eqz v11, :cond_68

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    .line 561
    .local v5, "defaultSampleFlags":I
    :goto_55
    iget-object v11, v9, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    new-instance v12, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v12, v3, v4, v6, v5}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    iput-object v12, v11, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    goto :goto_1e

    .line 552
    .end local v3    # "defaultSampleDescriptionIndex":I
    .end local v4    # "defaultSampleDuration":I
    .end local v5    # "defaultSampleFlags":I
    .end local v6    # "defaultSampleSize":I
    :cond_5f
    iget v3, v7, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    goto :goto_3d

    .line 555
    .restart local v3    # "defaultSampleDescriptionIndex":I
    :cond_62
    iget v4, v7, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->duration:I

    goto :goto_45

    .line 557
    .restart local v4    # "defaultSampleDuration":I
    :cond_65
    iget v6, v7, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->size:I

    goto :goto_4d

    .line 559
    .restart local v6    # "defaultSampleSize":I
    :cond_68
    iget v5, v7, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    goto :goto_55
.end method

.method private static parseTraf(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V
    .registers 23
    .param p0, "traf"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .param p2, "flags"    # I
    .param p3, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 418
    .local p1, "trackBundleArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trun:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getChildAtomOfTypeCount(I)I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_1a

    .line 419
    new-instance v17, Lcom/google/android/exoplayer/ParserException;

    const-string v18, "Trun count in traf != 1 (unsupported)."

    invoke-direct/range {v17 .. v18}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 422
    :cond_1a
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfhd:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v13

    .line 423
    .local v13, "tfhd":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget-object v0, v13, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTfhd(Lcom/google/android/exoplayer/util/ParsableByteArray;Landroid/util/SparseArray;I)Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-result-object v14

    .line 424
    .local v14, "trackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    if-nez v14, :cond_35

    .line 466
    :cond_34
    return-void

    .line 427
    :cond_35
    iget-object v7, v14, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 428
    .local v7, "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    const/16 v17, 0x0

    move/from16 v0, v17

    iput v0, v14, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    .line 429
    invoke-virtual {v7}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->reset()V

    .line 431
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v12

    .line 433
    .local v12, "tfdtAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v12, :cond_50

    and-int/lit8 v17, p2, 0x2

    if-eqz v17, :cond_f3

    .line 434
    :cond_50
    const-wide/16 v5, 0x0

    .line 439
    .local v5, "decodeTime":J
    :goto_52
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trun:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v16

    .line 440
    .local v16, "trun":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move/from16 v0, p2

    move-object/from16 v1, v17

    invoke-static {v14, v5, v6, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTrun(Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;JILcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 442
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saiz:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v10

    .line 443
    .local v10, "saiz":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v10, :cond_94

    .line 444
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v17, v0

    iget-object v0, v7, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    move/from16 v18, v0

    aget-object v15, v17, v18

    .line 446
    .local v15, "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    iget-object v0, v10, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v15, v0, v7}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSaiz(Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 449
    .end local v15    # "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    :cond_94
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_saio:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v9

    .line 450
    .local v9, "saio":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v9, :cond_a9

    .line 451
    iget-object v0, v9, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v7}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSaio(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 454
    :cond_a9
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_senc:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v11

    .line 455
    .local v11, "senc":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v11, :cond_be

    .line 456
    iget-object v0, v11, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v7}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    .line 459
    :cond_be
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v4

    .line 460
    .local v4, "childrenSize":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_c9
    if-ge v8, v4, :cond_34

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    .line 462
    .local v3, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    iget v0, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    move/from16 v17, v0

    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_uuid:I

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_f0

    .line 463
    iget-object v0, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-static {v0, v7, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseUuid(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;[B)V

    .line 460
    :cond_f0
    add-int/lit8 v8, v8, 0x1

    goto :goto_c9

    .line 436
    .end local v3    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v4    # "childrenSize":I
    .end local v5    # "decodeTime":J
    .end local v8    # "i":I
    .end local v9    # "saio":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v10    # "saiz":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v11    # "senc":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v16    # "trun":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_f3
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v17

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseTfdt(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v5

    .restart local v5    # "decodeTime":J
    goto/16 :goto_52
.end method

.method private static parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .registers 8
    .param p0, "trex"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;",
            ">;"
        }
    .end annotation

    .prologue
    .line 391
    const/16 v5, 0xc

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 392
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 393
    .local v4, "trackId":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .line 394
    .local v0, "defaultSampleDescriptionIndex":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 395
    .local v1, "defaultSampleDuration":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 396
    .local v3, "defaultSampleSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 398
    .local v2, "defaultSampleFlags":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v6, v0, v1, v3, v2}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    invoke-static {v5, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    return-object v5
.end method

.method private static parseTrun(Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;JILcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 39
    .param p0, "trackBundle"    # Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .param p1, "decodeTime"    # J
    .param p3, "flags"    # I
    .param p4, "trun"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 590
    const/16 v4, 0x8

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 591
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 592
    .local v15, "fullAtom":I
    invoke-static {v15}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v8

    .line 594
    .local v8, "atomFlags":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-object/from16 v30, v0

    .line 595
    .local v30, "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 596
    .local v14, "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    iget-object v9, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    .line 598
    .local v9, "defaultSampleValues":Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v19

    .line 599
    .local v19, "sampleCount":I
    and-int/lit8 v4, v8, 0x1

    if-eqz v4, :cond_32

    .line 600
    iget-wide v4, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v32

    move/from16 v0, v32

    int-to-long v0, v0

    move-wide/from16 v32, v0

    add-long v4, v4, v32

    iput-wide v4, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 603
    :cond_32
    and-int/lit8 v4, v8, 0x4

    if-eqz v4, :cond_f6

    const/4 v13, 0x1

    .line 604
    .local v13, "firstSampleFlagsPresent":Z
    :goto_37
    iget v12, v9, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    .line 605
    .local v12, "firstSampleFlags":I
    if-eqz v13, :cond_3f

    .line 606
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v12

    .line 609
    :cond_3f
    and-int/lit16 v4, v8, 0x100

    if-eqz v4, :cond_f9

    const/16 v22, 0x1

    .line 610
    .local v22, "sampleDurationsPresent":Z
    :goto_45
    and-int/lit16 v4, v8, 0x200

    if-eqz v4, :cond_fd

    const/16 v29, 0x1

    .line 611
    .local v29, "sampleSizesPresent":Z
    :goto_4b
    and-int/lit16 v4, v8, 0x400

    if-eqz v4, :cond_101

    const/16 v24, 0x1

    .line 612
    .local v24, "sampleFlagsPresent":Z
    :goto_51
    and-int/lit16 v4, v8, 0x800

    if-eqz v4, :cond_105

    const/16 v18, 0x1

    .line 617
    .local v18, "sampleCompositionTimeOffsetsPresent":Z
    :goto_57
    const-wide/16 v10, 0x0

    .line 621
    .local v10, "edtsOffset":J
    move-object/from16 v0, v30

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    if-eqz v4, :cond_85

    move-object/from16 v0, v30

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_85

    move-object/from16 v0, v30

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    const/4 v5, 0x0

    aget-wide v4, v4, v5

    const-wide/16 v32, 0x0

    cmp-long v4, v4, v32

    if-nez v4, :cond_85

    .line 623
    move-object/from16 v0, v30

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    const/4 v5, 0x0

    aget-wide v2, v4, v5

    const-wide/16 v4, 0x3e8

    move-object/from16 v0, v30

    iget-wide v6, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v10

    .line 626
    :cond_85
    move/from16 v0, v19

    invoke-virtual {v14, v0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->initTables(I)V

    .line 627
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v28, v0

    .line 628
    .local v28, "sampleSizeTable":[I
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    move-object/from16 v17, v0

    .line 629
    .local v17, "sampleCompositionTimeOffsetTable":[I
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    move-object/from16 v20, v0

    .line 630
    .local v20, "sampleDecodingTimeTable":[J
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    move-object/from16 v25, v0

    .line 632
    .local v25, "sampleIsSyncFrameTable":[Z
    move-object/from16 v0, v30

    iget-wide v6, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    .line 633
    .local v6, "timescale":J
    move-wide/from16 v2, p1

    .line 634
    .local v2, "cumulativeTime":J
    move-object/from16 v0, v30

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->type:I

    sget v5, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_vide:I

    if-ne v4, v5, :cond_109

    and-int/lit8 v4, p3, 0x1

    if-eqz v4, :cond_109

    const/16 v31, 0x1

    .line 636
    .local v31, "workaroundEveryVideoFrameIsSyncFrame":Z
    :goto_ae
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_b0
    move/from16 v0, v16

    move/from16 v1, v19

    if-ge v0, v1, :cond_128

    .line 638
    if-eqz v22, :cond_10c

    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v21

    .line 640
    .local v21, "sampleDuration":I
    :goto_bc
    if-eqz v29, :cond_111

    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v27

    .line 641
    .local v27, "sampleSize":I
    :goto_c2
    if-nez v16, :cond_116

    if-eqz v13, :cond_116

    move/from16 v23, v12

    .line 643
    .local v23, "sampleFlags":I
    :goto_c8
    if-eqz v18, :cond_122

    .line 649
    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v26

    .line 650
    .local v26, "sampleOffset":I
    move/from16 v0, v26

    mul-int/lit16 v4, v0, 0x3e8

    int-to-long v4, v4

    div-long/2addr v4, v6

    long-to-int v4, v4

    aput v4, v17, v16

    .line 654
    .end local v26    # "sampleOffset":I
    :goto_d7
    const-wide/16 v4, 0x3e8

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v4

    sub-long/2addr v4, v10

    aput-wide v4, v20, v16

    .line 656
    aput v27, v28, v16

    .line 657
    shr-int/lit8 v4, v23, 0x10

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_126

    if-eqz v31, :cond_ec

    if-nez v16, :cond_126

    :cond_ec
    const/4 v4, 0x1

    :goto_ed
    aput-boolean v4, v25, v16

    .line 659
    move/from16 v0, v21

    int-to-long v4, v0

    add-long/2addr v2, v4

    .line 636
    add-int/lit8 v16, v16, 0x1

    goto :goto_b0

    .line 603
    .end local v2    # "cumulativeTime":J
    .end local v6    # "timescale":J
    .end local v10    # "edtsOffset":J
    .end local v12    # "firstSampleFlags":I
    .end local v13    # "firstSampleFlagsPresent":Z
    .end local v16    # "i":I
    .end local v17    # "sampleCompositionTimeOffsetTable":[I
    .end local v18    # "sampleCompositionTimeOffsetsPresent":Z
    .end local v20    # "sampleDecodingTimeTable":[J
    .end local v21    # "sampleDuration":I
    .end local v22    # "sampleDurationsPresent":Z
    .end local v23    # "sampleFlags":I
    .end local v24    # "sampleFlagsPresent":Z
    .end local v25    # "sampleIsSyncFrameTable":[Z
    .end local v27    # "sampleSize":I
    .end local v28    # "sampleSizeTable":[I
    .end local v29    # "sampleSizesPresent":Z
    .end local v31    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_f6
    const/4 v13, 0x0

    goto/16 :goto_37

    .line 609
    .restart local v12    # "firstSampleFlags":I
    .restart local v13    # "firstSampleFlagsPresent":Z
    :cond_f9
    const/16 v22, 0x0

    goto/16 :goto_45

    .line 610
    .restart local v22    # "sampleDurationsPresent":Z
    :cond_fd
    const/16 v29, 0x0

    goto/16 :goto_4b

    .line 611
    .restart local v29    # "sampleSizesPresent":Z
    :cond_101
    const/16 v24, 0x0

    goto/16 :goto_51

    .line 612
    .restart local v24    # "sampleFlagsPresent":Z
    :cond_105
    const/16 v18, 0x0

    goto/16 :goto_57

    .line 634
    .restart local v2    # "cumulativeTime":J
    .restart local v6    # "timescale":J
    .restart local v10    # "edtsOffset":J
    .restart local v17    # "sampleCompositionTimeOffsetTable":[I
    .restart local v18    # "sampleCompositionTimeOffsetsPresent":Z
    .restart local v20    # "sampleDecodingTimeTable":[J
    .restart local v25    # "sampleIsSyncFrameTable":[Z
    .restart local v28    # "sampleSizeTable":[I
    :cond_109
    const/16 v31, 0x0

    goto :goto_ae

    .line 638
    .restart local v16    # "i":I
    .restart local v31    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_10c
    iget v0, v9, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->duration:I

    move/from16 v21, v0

    goto :goto_bc

    .line 640
    .restart local v21    # "sampleDuration":I
    :cond_111
    iget v0, v9, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->size:I

    move/from16 v27, v0

    goto :goto_c2

    .line 641
    .restart local v27    # "sampleSize":I
    :cond_116
    if-eqz v24, :cond_11d

    invoke-virtual/range {p4 .. p4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v23

    goto :goto_c8

    :cond_11d
    iget v0, v9, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->flags:I

    move/from16 v23, v0

    goto :goto_c8

    .line 652
    .restart local v23    # "sampleFlags":I
    :cond_122
    const/4 v4, 0x0

    aput v4, v17, v16

    goto :goto_d7

    .line 657
    :cond_126
    const/4 v4, 0x0

    goto :goto_ed

    .line 661
    .end local v21    # "sampleDuration":I
    .end local v23    # "sampleFlags":I
    .end local v27    # "sampleSize":I
    :cond_128
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

    .line 665
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 666
    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 669
    sget-object v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_14

    .line 677
    :goto_13
    return-void

    .line 676
    :cond_14
    invoke-static {p0, v1, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/extractor/mp4/TrackFragment;)V

    goto :goto_13
.end method

.method private processAtomEnded(J)V
    .registers 5
    .param p1, "atomEndPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 288
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_22

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_22

    .line 289
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onContainerAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_0

    .line 291
    :cond_22
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 292
    return-void
.end method

.method private readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 15
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 205
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    if-nez v8, :cond_2e

    .line 207
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v9, 0x0

    const/16 v10, 0x8

    const/4 v11, 0x1

    invoke-interface {p1, v8, v9, v10, v11}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BIIZ)Z

    move-result v8

    if-nez v8, :cond_14

    .line 208
    const/4 v8, 0x0

    .line 273
    :goto_13
    return v8

    .line 210
    :cond_14
    const/16 v8, 0x8

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 211
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 212
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 213
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    .line 216
    :cond_2e
    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/16 v10, 0x1

    cmp-long v8, v8, v10

    if-nez v8, :cond_4e

    .line 218
    const/16 v5, 0x8

    .line 219
    .local v5, "headerBytesRemaining":I
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v9, 0x8

    invoke-interface {p1, v8, v9, v5}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 220
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    add-int/2addr v8, v5

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 221
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 224
    .end local v5    # "headerBytesRemaining":I
    :cond_4e
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    iget v10, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v10, v10

    sub-long v0, v8, v10

    .line 225
    .local v0, "atomPosition":J
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v8, v9, :cond_77

    .line 227
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v7

    .line 228
    .local v7, "trackCount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_64
    if-ge v6, v7, :cond_77

    .line 229
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v4, v8, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 230
    .local v4, "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    iput-wide v0, v4, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 231
    iput-wide v0, v4, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 228
    add-int/lit8 v6, v6, 0x1

    goto :goto_64

    .line 235
    .end local v4    # "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .end local v6    # "i":I
    .end local v7    # "trackCount":I
    :cond_77
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdat:I

    if-ne v8, v9, :cond_99

    .line 236
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 237
    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v8, v0

    iput-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    .line 238
    iget-boolean v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    if-nez v8, :cond_93

    .line 239
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    sget-object v9, Lcom/google/android/exoplayer/extractor/SeekMap;->UNSEEKABLE:Lcom/google/android/exoplayer/extractor/SeekMap;

    invoke-interface {v8, v9}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 240
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    .line 242
    :cond_93
    const/4 v8, 0x2

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 243
    const/4 v8, 0x1

    goto/16 :goto_13

    .line 246
    :cond_99
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v8}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->shouldParseContainerAtom(I)Z

    move-result v8

    if-eqz v8, :cond_cb

    .line 247
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v8, v10

    const-wide/16 v10, 0x8

    sub-long v2, v8, v10

    .line 248
    .local v2, "endPosition":J
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v9, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget v10, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-direct {v9, v10, v2, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v8, v9}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 249
    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    iget v10, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-nez v8, :cond_c7

    .line 250
    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->processAtomEnded(J)V

    .line 273
    .end local v2    # "endPosition":J
    :goto_c4
    const/4 v8, 0x1

    goto/16 :goto_13

    .line 253
    .restart local v2    # "endPosition":J
    :cond_c7
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_c4

    .line 255
    .end local v2    # "endPosition":J
    :cond_cb
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v8}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->shouldParseLeafAtom(I)Z

    move-result v8

    if-eqz v8, :cond_10f

    .line 256
    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    const/16 v9, 0x8

    if-eq v8, v9, :cond_e1

    .line 257
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Leaf atom defines extended atom size (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 259
    :cond_e1
    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_f2

    .line 260
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Leaf atom with length > 2147483647 (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 262
    :cond_f2
    new-instance v8, Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v9, v9

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 263
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v10, v10, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v8, v9, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 264
    const/4 v8, 0x1

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_c4

    .line 266
    :cond_10f
    iget-wide v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_120

    .line 267
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Skipping atom with length > 2147483647 (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 269
    :cond_120
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 270
    const/4 v8, 0x1

    iput v8, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_c4
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 6
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 277
    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v1, v1

    iget v2, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    sub-int v0, v1, v2

    .line 278
    .local v0, "atomPayloadSize":I
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v1, :cond_2c

    .line 279
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v2, 0x8

    invoke-interface {p1, v1, v2, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 280
    new-instance v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    iget v2, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer/util/ParsableByteArray;)V

    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    invoke-direct {p0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->onLeafAtomRead(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;J)V

    .line 284
    :goto_24
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->processAtomEnded(J)V

    .line 285
    return-void

    .line 282
    :cond_2c
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_24
.end method

.method private readEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V
    .registers 11
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 763
    const/4 v4, 0x0

    .line 764
    .local v4, "nextTrackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    const-wide v2, 0x7fffffffffffffffL

    .line 765
    .local v2, "nextDataOffset":J
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 766
    .local v5, "trackBundlesSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    if-ge v1, v5, :cond_30

    .line 767
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v6, v7, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 768
    .local v6, "trackFragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    iget-boolean v7, v6, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    if-eqz v7, :cond_2d

    iget-wide v7, v6, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    cmp-long v7, v7, v2

    if-gez v7, :cond_2d

    .line 770
    iget-wide v2, v6, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 771
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "nextTrackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    check-cast v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 766
    .restart local v4    # "nextTrackBundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 774
    .end local v6    # "trackFragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    :cond_30
    if-nez v4, :cond_36

    .line 775
    const/4 v7, 0x3

    iput v7, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 784
    :goto_35
    return-void

    .line 778
    :cond_36
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v7

    sub-long v7, v2, v7

    long-to-int v0, v7

    .line 779
    .local v0, "bytesToSkip":I
    if-gez v0, :cond_47

    .line 780
    new-instance v7, Lcom/google/android/exoplayer/ParserException;

    const-string v8, "Offset to encryption data was negative."

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 782
    :cond_47
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 783
    iget-object v7, v4, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    invoke-virtual {v7, p1}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    goto :goto_35
.end method

.method private readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 23
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 801
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_9f

    .line 802
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    if-nez v5, :cond_5c

    .line 803
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-static {v5}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->getNextFragmentRun(Landroid/util/SparseArray;)Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 804
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    if-nez v5, :cond_3e

    .line 807
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v19

    sub-long v5, v5, v19

    long-to-int v8, v5

    .line 808
    .local v8, "bytesToSkip":I
    if-gez v8, :cond_34

    .line 809
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Offset to end of mdat was negative."

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 811
    :cond_34
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 812
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 813
    const/4 v5, 0x0

    .line 890
    .end local v8    # "bytesToSkip":I
    :goto_3d
    return v5

    .line 816
    :cond_3e
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-wide v13, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->dataPosition:J

    .line 818
    .local v13, "nextDataPosition":J
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    sub-long v5, v13, v5

    long-to-int v8, v5

    .line 819
    .restart local v8    # "bytesToSkip":I
    if-gez v8, :cond_57

    .line 820
    new-instance v5, Lcom/google/android/exoplayer/ParserException;

    const-string v6, "Offset to sample data was negative."

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 822
    :cond_57
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 824
    .end local v8    # "bytesToSkip":I
    .end local v13    # "nextDataPosition":J
    :cond_5c
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v6, v6, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    aget v5, v5, v6

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 826
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v5, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    iget-boolean v5, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v5, :cond_131

    .line 827
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->appendSampleEncryptionData(Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;)I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 828
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/2addr v5, v6

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 832
    :goto_95
    const/4 v5, 0x4

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 833
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 836
    :cond_9f
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v9, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;

    .line 837
    .local v9, "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v0, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-object/from16 v17, v0

    .line 838
    .local v17, "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v1, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 839
    .local v1, "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v0, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    move/from16 v16, v0

    .line 840
    .local v16, "sampleIndex":I
    move-object/from16 v0, v17

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_158

    .line 843
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v10, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 844
    .local v10, "nalLengthData":[B
    const/4 v5, 0x0

    const/4 v6, 0x0

    aput-byte v6, v10, v5

    .line 845
    const/4 v5, 0x1

    const/4 v6, 0x0

    aput-byte v6, v10, v5

    .line 846
    const/4 v5, 0x2

    const/4 v6, 0x0

    aput-byte v6, v10, v5

    .line 847
    move-object/from16 v0, v17

    iget v11, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    .line 848
    .local v11, "nalUnitLengthFieldLength":I
    move-object/from16 v0, v17

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v12, v5, 0x4

    .line 852
    .local v12, "nalUnitLengthFieldLengthDiff":I
    :goto_de
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v5, v6, :cond_17d

    .line 853
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    if-nez v5, :cond_138

    .line 855
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p1

    invoke-interface {v0, v5, v12, v11}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 856
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 857
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 859
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 860
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v6, 0x4

    invoke-interface {v1, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 861
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/lit8 v5, v5, 0x4

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 862
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    add-int/2addr v5, v12

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    goto :goto_de

    .line 830
    .end local v1    # "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    .end local v9    # "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .end local v10    # "nalLengthData":[B
    .end local v11    # "nalUnitLengthFieldLength":I
    .end local v12    # "nalUnitLengthFieldLengthDiff":I
    .end local v16    # "sampleIndex":I
    .end local v17    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    :cond_131
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto/16 :goto_95

    .line 865
    .restart local v1    # "output":Lcom/google/android/exoplayer/extractor/TrackOutput;
    .restart local v9    # "fragment":Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;
    .restart local v10    # "nalLengthData":[B
    .restart local v11    # "nalUnitLengthFieldLength":I
    .restart local v12    # "nalUnitLengthFieldLengthDiff":I
    .restart local v16    # "sampleIndex":I
    .restart local v17    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    :cond_138
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 866
    .local v18, "writtenBytes":I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int v5, v5, v18

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 867
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v5, v5, v18

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_de

    .line 871
    .end local v10    # "nalLengthData":[B
    .end local v11    # "nalUnitLengthFieldLength":I
    .end local v12    # "nalUnitLengthFieldLengthDiff":I
    .end local v18    # "writtenBytes":I
    :cond_158
    :goto_158
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v5, v6, :cond_17d

    .line 872
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    sub-int/2addr v5, v6

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v5, v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 873
    .restart local v18    # "writtenBytes":I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int v5, v5, v18

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto :goto_158

    .line 877
    .end local v18    # "writtenBytes":I
    :cond_17d
    move/from16 v0, v16

    invoke-virtual {v9, v0}, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v5

    const-wide/16 v19, 0x3e8

    mul-long v2, v5, v19

    .line 878
    .local v2, "sampleTimeUs":J
    iget-boolean v5, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v5, :cond_1ce

    const/4 v5, 0x2

    :goto_18c
    iget-object v6, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    aget-boolean v6, v6, v16

    if-eqz v6, :cond_1d0

    const/4 v6, 0x1

    :goto_193
    or-int v4, v5, v6

    .line 880
    .local v4, "sampleFlags":I
    iget-object v5, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    iget v15, v5, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    .line 881
    .local v15, "sampleDescriptionIndex":I
    iget-boolean v5, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v5, :cond_1d2

    move-object/from16 v0, v17

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    aget-object v5, v5, v15

    iget-object v7, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;->keyId:[B

    .line 883
    .local v7, "encryptionKey":[B
    :goto_1a5
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    const/4 v6, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 885
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v6, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    .line 886
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v5, v5, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    iget v6, v9, Lcom/google/android/exoplayer/extractor/mp4/TrackFragment;->length:I

    if-ne v5, v6, :cond_1c6

    .line 887
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 889
    :cond_1c6
    const/4 v5, 0x3

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 890
    const/4 v5, 0x1

    goto/16 :goto_3d

    .line 878
    .end local v4    # "sampleFlags":I
    .end local v7    # "encryptionKey":[B
    .end local v15    # "sampleDescriptionIndex":I
    :cond_1ce
    const/4 v5, 0x0

    goto :goto_18c

    :cond_1d0
    const/4 v6, 0x0

    goto :goto_193

    .line 881
    .restart local v4    # "sampleFlags":I
    .restart local v15    # "sampleDescriptionIndex":I
    :cond_1d2
    const/4 v7, 0x0

    goto :goto_1a5
.end method

.method private static shouldParseContainerAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 966
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
    .line 956
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
    .registers 6
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    const/4 v3, 0x0

    .line 155
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 156
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer/extractor/mp4/Track;

    if-eqz v1, :cond_24

    .line 157
    new-instance v0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    invoke-interface {p1, v3}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 158
    .local v0, "bundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer/extractor/mp4/Track;

    new-instance v2, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;

    invoke-direct {v2, v3, v3, v3, v3}, Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->init(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/DefaultSampleValues;)V

    .line 159
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 160
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 162
    .end local v0    # "bundle":Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_24
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
    .line 179
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    packed-switch v0, :pswitch_data_1e

    .line 192
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    const/4 v0, 0x0

    :goto_c
    return v0

    .line 181
    :pswitch_d
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    const/4 v0, -0x1

    goto :goto_c

    .line 186
    :pswitch_15
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    goto :goto_0

    .line 189
    :pswitch_19
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->readEncryptionData(Lcom/google/android/exoplayer/extractor/ExtractorInput;)V

    goto :goto_0

    .line 179
    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_15
        :pswitch_19
    .end packed-switch
.end method

.method public release()V
    .registers 1

    .prologue
    .line 173
    return-void
.end method

.method public seek()V
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 167
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 168
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
    .line 150
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffFragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method
