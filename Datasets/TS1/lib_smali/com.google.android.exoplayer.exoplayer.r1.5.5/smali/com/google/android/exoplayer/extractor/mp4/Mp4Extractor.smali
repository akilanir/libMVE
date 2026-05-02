.class public final Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;
.super Ljava/lang/Object;
.source "Mp4Extractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;
.implements Lcom/google/android/exoplayer/extractor/SeekMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    }
.end annotation


# static fields
.field private static final BRAND_QUICKTIME:I

.field private static final RELOAD_MINIMUM_SEEK_DISTANCE:J = 0x40000L

.field private static final STATE_AFTER_SEEK:I = 0x0

.field private static final STATE_READING_ATOM_HEADER:I = 0x1

.field private static final STATE_READING_ATOM_PAYLOAD:I = 0x2

.field private static final STATE_READING_SAMPLE:I = 0x3


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

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private isQuickTime:Z

.field private final nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private parserState:I

.field private sampleBytesWritten:I

.field private sampleCurrentNalBytesRemaining:I

.field private sampleSize:I

.field private tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-string v0, "qt  "

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 79
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 80
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 81
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 82
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    .line 83
    return-void
.end method

.method private enterReadingAtomHeaderState()V
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    .line 163
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 164
    return-void
.end method

.method private getTrackIndexOfEarliestCurrentSample()I
    .registers 10

    .prologue
    .line 402
    const/4 v2, -0x1

    .line 403
    .local v2, "earliestSampleTrackIndex":I
    const-wide v0, 0x7fffffffffffffffL

    .line 404
    .local v0, "earliestSampleOffset":J
    const/4 v5, 0x0

    .local v5, "trackIndex":I
    :goto_7
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    array-length v8, v8

    if-ge v5, v8, :cond_28

    .line 405
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v4, v8, v5

    .line 406
    .local v4, "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    iget v3, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 407
    .local v3, "sampleIndex":I
    iget-object v8, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget v8, v8, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sampleCount:I

    if-ne v3, v8, :cond_1b

    .line 404
    :cond_18
    :goto_18
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 411
    :cond_1b
    iget-object v8, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v6, v8, v3

    .line 412
    .local v6, "trackSampleOffset":J
    cmp-long v8, v6, v0

    if-gez v8, :cond_18

    .line 413
    move-wide v0, v6

    .line 414
    move v2, v5

    goto :goto_18

    .line 418
    .end local v3    # "sampleIndex":I
    .end local v4    # "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    .end local v6    # "trackSampleOffset":J
    :cond_28
    return v2
.end method

.method private static processFtypAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .registers 5
    .param p0, "atomData"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v1, 0x1

    .line 257
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 258
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 259
    .local v0, "majorBrand":I
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    if-ne v0, v2, :cond_f

    .line 268
    :goto_e
    return v1

    .line 262
    :cond_f
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 263
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-lez v2, :cond_22

    .line 264
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    if-ne v2, v3, :cond_13

    goto :goto_e

    .line 268
    :cond_22
    const/4 v1, 0x0

    goto :goto_e
.end method

.method private processMoovAtom(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 16
    .param p1, "moov"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .prologue
    .line 275
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .local v11, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;>;"
    const-wide v1, 0x7fffffffffffffffL

    .line 283
    .local v1, "earliestSampleOffset":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_b
    iget-object v12, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ge v5, v12, :cond_74

    .line 284
    iget-object v12, p1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v12, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 285
    .local v0, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v12, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v13, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    if-eq v12, v13, :cond_24

    .line 283
    :cond_21
    :goto_21
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 289
    :cond_24
    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    invoke-virtual {p1, v12}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v12

    iget-boolean v13, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->isQuickTime:Z

    invoke-static {v0, v12, v13}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTrak(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-result-object v9

    .line 291
    .local v9, "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    if-eqz v9, :cond_21

    .line 295
    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    invoke-virtual {v0, v12}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v12

    sget v13, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v12

    sget v13, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    invoke-virtual {v12, v13}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v8

    .line 297
    .local v8, "stblAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    invoke-static {v9, v8}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseStbl(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    move-result-object v10

    .line 298
    .local v10, "trackSampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    iget v12, v10, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sampleCount:I

    if-eqz v12, :cond_21

    .line 302
    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    iget-object v12, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v12, v5}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v12

    invoke-direct {v7, v9, v10, v12}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;-><init>(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 305
    .local v7, "mp4Track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    iget v12, v10, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->maximumSize:I

    add-int/lit8 v6, v12, 0x1e

    .line 306
    .local v6, "maxInputSize":I
    iget-object v12, v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v13, v9, Lcom/google/android/exoplayer/extractor/mp4/Track;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {v13, v6}, Lcom/google/android/exoplayer/MediaFormat;->copyWithMaxInputSize(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v13

    invoke-interface {v12, v13}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 307
    invoke-interface {v11, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    iget-object v12, v10, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    const/4 v13, 0x0

    aget-wide v3, v12, v13

    .line 310
    .local v3, "firstSampleOffset":J
    cmp-long v12, v3, v1

    if-gez v12, :cond_21

    .line 311
    move-wide v1, v3

    goto :goto_21

    .line 314
    .end local v0    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v3    # "firstSampleOffset":J
    .end local v6    # "maxInputSize":I
    .end local v7    # "mp4Track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    .end local v8    # "stblAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v9    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    .end local v10    # "trackSampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    :cond_74
    const/4 v12, 0x0

    new-array v12, v12, [Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    invoke-interface {v11, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    iput-object v12, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    .line 315
    iget-object v12, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v12}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 316
    iget-object v12, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v12, p0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 317
    return-void
.end method

.method private readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 14
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v4, 0x1

    const/16 v10, 0x8

    const/4 v5, 0x0

    .line 167
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    if-nez v3, :cond_2b

    .line 169
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v3, v5, v10, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BIIZ)Z

    move-result v3

    if-nez v3, :cond_14

    .line 203
    :goto_13
    return v5

    .line 172
    :cond_14
    iput v10, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 173
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 174
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    .line 175
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    .line 178
    :cond_2b
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    const-wide/16 v8, 0x1

    cmp-long v3, v6, v8

    if-nez v3, :cond_49

    .line 180
    const/16 v2, 0x8

    .line 181
    .local v2, "headerBytesRemaining":I
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v3, v10, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 182
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 183
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    .line 186
    .end local v2    # "headerBytesRemaining":I
    :cond_49
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->shouldParseContainerAtom(I)Z

    move-result v3

    if-eqz v3, :cond_6e

    .line 187
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    add-long/2addr v5, v7

    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    int-to-long v7, v3

    sub-long v0, v5, v7

    .line 188
    .local v0, "endPosition":J
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v5, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-direct {v5, v6, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v3, v5}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 189
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    .end local v0    # "endPosition":J
    :goto_6c
    move v5, v4

    .line 203
    goto :goto_13

    .line 190
    :cond_6e
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->shouldParseLeafAtom(I)Z

    move-result v3

    if-eqz v3, :cond_a7

    .line 193
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    if-ne v3, v10, :cond_a3

    move v3, v4

    :goto_7b
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 194
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    const-wide/32 v8, 0x7fffffff

    cmp-long v3, v6, v8

    if-gtz v3, :cond_a5

    move v3, v4

    :goto_88
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 195
    new-instance v3, Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    long-to-int v6, v6

    invoke-direct {v3, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 196
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v3, v5, v6, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 197
    iput v11, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_6c

    :cond_a3
    move v3, v5

    .line 193
    goto :goto_7b

    :cond_a5
    move v3, v5

    .line 194
    goto :goto_88

    .line 199
    :cond_a7
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 200
    iput v11, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_6c
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)Z
    .registers 13
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "positionHolder"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 213
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    int-to-long v8, v8

    sub-long v2, v6, v8

    .line 214
    .local v2, "atomPayloadSize":J
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v6

    add-long v0, v6, v2

    .line 215
    .local v0, "atomEndPosition":J
    const/4 v5, 0x0

    .line 216
    .local v5, "seekRequired":Z
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v6, :cond_78

    .line 217
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    long-to-int v8, v2

    invoke-interface {p1, v6, v7, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 218
    iget v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    sget v7, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ftyp:I

    if-ne v6, v7, :cond_5b

    .line 219
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v6}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processFtypAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    move-result v6

    iput-boolean v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->isQuickTime:Z

    .line 233
    :cond_2a
    :goto_2a
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_a1

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget-wide v6, v6, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    cmp-long v6, v6, v0

    if-nez v6, :cond_a1

    .line 234
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 235
    .local v4, "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v6, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v7, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-ne v6, v7, :cond_8d

    .line 237
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processMoovAtom(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    .line 238
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->clear()V

    .line 239
    const/4 v6, 0x3

    iput v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    .line 240
    const/4 v5, 0x0

    .line 247
    .end local v4    # "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v5    # "seekRequired":Z
    :goto_5a
    return v5

    .line 220
    .restart local v5    # "seekRequired":Z
    :cond_5b
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2a

    .line 221
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    iget v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v7, v8, v9}, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer/util/ParsableByteArray;)V

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;)V

    goto :goto_2a

    .line 225
    :cond_78
    const-wide/32 v6, 0x40000

    cmp-long v6, v2, v6

    if-gez v6, :cond_84

    .line 226
    long-to-int v6, v2

    invoke-interface {p1, v6}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_2a

    .line 228
    :cond_84
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v6

    add-long/2addr v6, v2

    iput-wide v6, p2, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 229
    const/4 v5, 0x1

    goto :goto_2a

    .line 241
    .restart local v4    # "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_8d
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2a

    .line 242
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v6}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v6, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_2a

    .line 246
    .end local v4    # "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_a1
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_5a
.end method

.method private readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 22
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "positionHolder"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->getTrackIndexOfEarliestCurrentSample()I

    move-result v17

    .line 338
    .local v17, "trackIndex":I
    const/4 v2, -0x1

    move/from16 v0, v17

    if-ne v0, v2, :cond_b

    .line 339
    const/4 v2, -0x1

    .line 394
    :goto_a
    return v2

    .line 341
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v16, v2, v17

    .line 342
    .local v16, "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    move-object/from16 v0, v16

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 343
    .local v1, "trackOutput":Lcom/google/android/exoplayer/extractor/TrackOutput;
    move-object/from16 v0, v16

    iget v13, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 344
    .local v13, "sampleIndex":I
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v11, v2, v13

    .line 345
    .local v11, "position":J
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    sub-long v2, v11, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    int-to-long v4, v4

    add-long v14, v2, v4

    .line 346
    .local v14, "skipAmount":J
    const-wide/16 v2, 0x0

    cmp-long v2, v14, v2

    if-ltz v2, :cond_3b

    const-wide/32 v2, 0x40000

    cmp-long v2, v14, v2

    if-ltz v2, :cond_41

    .line 347
    :cond_3b
    move-object/from16 v0, p2

    iput-wide v11, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 348
    const/4 v2, 0x1

    goto :goto_a

    .line 350
    :cond_41
    long-to-int v2, v14

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 351
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sizes:[I

    aget v2, v2, v13

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    .line 352
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_ef

    .line 355
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 356
    .local v8, "nalLengthData":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 357
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 358
    const/4 v2, 0x2

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 359
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v9, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    .line 360
    .local v9, "nalUnitLengthFieldLength":I
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v10, v2, 0x4

    .line 364
    .local v10, "nalUnitLengthFieldLengthDiff":I
    :goto_7c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    if-ge v2, v3, :cond_11e

    .line 365
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    if-nez v2, :cond_cf

    .line 367
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p1

    invoke-interface {v0, v2, v10, v9}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 368
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 369
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 371
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 372
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x4

    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 373
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int/lit8 v2, v2, 0x4

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 374
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    add-int/2addr v2, v10

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    goto :goto_7c

    .line 377
    :cond_cf
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 378
    .local v18, "writtenBytes":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 379
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_7c

    .line 383
    .end local v8    # "nalLengthData":[B
    .end local v9    # "nalUnitLengthFieldLength":I
    .end local v10    # "nalUnitLengthFieldLengthDiff":I
    .end local v18    # "writtenBytes":I
    :cond_ef
    :goto_ef
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    if-ge v2, v3, :cond_11e

    .line 384
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 385
    .restart local v18    # "writtenBytes":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 386
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_ef

    .line 389
    .end local v18    # "writtenBytes":I
    :cond_11e
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->timestampsUs:[J

    aget-wide v2, v2, v13

    move-object/from16 v0, v16

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v4, v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->flags:[I

    aget v4, v4, v13

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 391
    move-object/from16 v0, v16

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v16

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 392
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 393
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 394
    const/4 v2, 0x0

    goto/16 :goto_a
.end method

.method private static shouldParseContainerAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 436
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_edts:I

    if-eq p0, v0, :cond_1c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_udta:I

    if-ne p0, v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private static shouldParseLeafAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 425
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdhd:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hdlr:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsd:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stts:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stss:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ctts:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_elst:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsc:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsz:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_co64:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tkhd:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ftyp:I

    if-eq p0, v0, :cond_3c

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_meta:I

    if-ne p0, v0, :cond_3e

    :cond_3c
    const/4 v0, 0x1

    :goto_3d
    return v0

    :cond_3e
    const/4 v0, 0x0

    goto :goto_3d
.end method


# virtual methods
.method public getPosition(J)J
    .registers 11
    .param p1, "timeUs"    # J

    .prologue
    .line 141
    const-wide v0, 0x7fffffffffffffffL

    .line 142
    .local v0, "earliestSamplePosition":J
    const/4 v6, 0x0

    .local v6, "trackIndex":I
    :goto_6
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    array-length v7, v7

    if-ge v6, v7, :cond_2e

    .line 143
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v7, v7, v6

    iget-object v5, v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    .line 144
    .local v5, "sampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    invoke-virtual {v5, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->getIndexOfEarlierOrEqualSynchronizationSample(J)I

    move-result v4

    .line 145
    .local v4, "sampleIndex":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_1c

    .line 147
    invoke-virtual {v5, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->getIndexOfLaterOrEqualSynchronizationSample(J)I

    move-result v4

    .line 149
    :cond_1c
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v7, v7, v6

    iput v4, v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 151
    iget-object v7, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v2, v7, v4

    .line 152
    .local v2, "offset":J
    cmp-long v7, v2, v0

    if-gez v7, :cond_2b

    .line 153
    move-wide v0, v2

    .line 142
    :cond_2b
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 156
    .end local v2    # "offset":J
    .end local v4    # "sampleIndex":I
    .end local v5    # "sampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    :cond_2e
    return-wide v0
.end method

.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 2
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 93
    return-void
.end method

.method public isSeekable()Z
    .registers 2

    .prologue
    .line 136
    const/4 v0, 0x1

    return v0
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 7
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 108
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    packed-switch v0, :pswitch_data_2c

    .line 127
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I

    move-result v0

    :goto_9
    return v0

    .line 110
    :pswitch_a
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    .line 111
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_0

    .line 113
    :cond_18
    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_0

    .line 117
    :pswitch_1c
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    const/4 v0, -0x1

    goto :goto_9

    .line 122
    :pswitch_24
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    const/4 v0, 0x1

    goto :goto_9

    .line 108
    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_a
        :pswitch_1c
        :pswitch_24
    .end packed-switch
.end method

.method public seek()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 97
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 98
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 99
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 100
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 101
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    .line 102
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
    .line 87
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffUnfragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method
