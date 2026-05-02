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
    .line 50
    const-string v0, "qt  "

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 82
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 83
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 84
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 85
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    .line 86
    return-void
.end method

.method private enterReadingAtomHeaderState()V
    .registers 2

    .prologue
    .line 170
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    .line 171
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 172
    return-void
.end method

.method private getTrackIndexOfEarliestCurrentSample()I
    .registers 10

    .prologue
    .line 422
    const/4 v2, -0x1

    .line 423
    .local v2, "earliestSampleTrackIndex":I
    const-wide v0, 0x7fffffffffffffffL

    .line 424
    .local v0, "earliestSampleOffset":J
    const/4 v5, 0x0

    .local v5, "trackIndex":I
    :goto_7
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    array-length v8, v8

    if-ge v5, v8, :cond_28

    .line 425
    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v4, v8, v5

    .line 426
    .local v4, "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    iget v3, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 427
    .local v3, "sampleIndex":I
    iget-object v8, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget v8, v8, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sampleCount:I

    if-ne v3, v8, :cond_1b

    .line 424
    :cond_18
    :goto_18
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    .line 431
    :cond_1b
    iget-object v8, v4, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v8, v8, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v6, v8, v3

    .line 432
    .local v6, "trackSampleOffset":J
    cmp-long v8, v6, v0

    if-gez v8, :cond_18

    .line 433
    move-wide v0, v6

    .line 434
    move v2, v5

    goto :goto_18

    .line 438
    .end local v3    # "sampleIndex":I
    .end local v4    # "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    .end local v6    # "trackSampleOffset":J
    :cond_28
    return v2
.end method

.method private processAtomEnded(J)V
    .registers 7
    .param p1, "atomEndPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    .line 250
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget-wide v1, v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    cmp-long v1, v1, p1

    if-nez v1, :cond_44

    .line 251
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 252
    .local v0, "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v1, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-ne v1, v2, :cond_30

    .line 254
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processMoovAtom(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    .line 255
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->clear()V

    .line 256
    iput v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_1

    .line 257
    :cond_30
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 258
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_1

    .line 261
    .end local v0    # "containerAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    :cond_44
    iget v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    if-eq v1, v3, :cond_4b

    .line 262
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    .line 264
    :cond_4b
    return-void
.end method

.method private static processFtypAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .registers 5
    .param p0, "atomData"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v1, 0x1

    .line 273
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 274
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 275
    .local v0, "majorBrand":I
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    if-ne v0, v2, :cond_f

    .line 284
    :goto_e
    return v1

    .line 278
    :cond_f
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 279
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-lez v2, :cond_22

    .line 280
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->BRAND_QUICKTIME:I

    if-ne v2, v3, :cond_13

    goto :goto_e

    .line 284
    :cond_22
    const/4 v1, 0x0

    goto :goto_e
.end method

.method private processMoovAtom(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)V
    .registers 21
    .param p1, "moov"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 291
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .local v15, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;>;"
    const-wide v3, 0x7fffffffffffffffL

    .line 293
    .local v3, "earliestSampleOffset":J
    const/4 v7, 0x0

    .line 294
    .local v7, "gaplessInfo":Lcom/google/android/exoplayer/extractor/GaplessInfo;
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_udta:I

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v16

    .line 295
    .local v16, "udta":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v16, :cond_21

    .line 296
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->isQuickTime:Z

    move/from16 v17, v0

    invoke-static/range {v16 .. v17}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseUdta(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v7

    .line 298
    :cond_21
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_22
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_d5

    .line 299
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .line 300
    .local v2, "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    iget v0, v2, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->type:I

    move/from16 v17, v0

    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_4d

    .line 298
    :cond_4a
    :goto_4a
    add-int/lit8 v8, v8, 0x1

    goto :goto_22

    .line 304
    :cond_4d
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mvhd:I

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->isQuickTime:Z

    move/from16 v18, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v2, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTrak(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/mp4/Track;

    move-result-object v13

    .line 306
    .local v13, "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    if-eqz v13, :cond_4a

    .line 310
    sget v17, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    move/from16 v0, v17

    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v17

    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v17

    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v12

    .line 312
    .local v12, "stblAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    invoke-static {v13, v12}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseStbl(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    move-result-object v14

    .line 313
    .local v14, "trackSampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    iget v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sampleCount:I

    move/from16 v17, v0

    if-eqz v17, :cond_4a

    .line 317
    new-instance v11, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v11, v13, v14, v0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;-><init>(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 320
    .local v11, "mp4Track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    iget v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->maximumSize:I

    move/from16 v17, v0

    add-int/lit8 v9, v17, 0x1e

    .line 321
    .local v9, "maxInputSize":I
    iget-object v0, v13, Lcom/google/android/exoplayer/extractor/mp4/Track;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer/MediaFormat;->copyWithMaxInputSize(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v10

    .line 322
    .local v10, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-eqz v7, :cond_ba

    .line 323
    iget v0, v7, Lcom/google/android/exoplayer/extractor/GaplessInfo;->encoderDelay:I

    move/from16 v17, v0

    iget v0, v7, Lcom/google/android/exoplayer/extractor/GaplessInfo;->encoderPadding:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->copyWithGaplessInfo(II)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v10

    .line 326
    :cond_ba
    iget-object v0, v11, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v10}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 327
    invoke-interface {v15, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    iget-object v0, v14, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-wide v5, v17, v18

    .line 330
    .local v5, "firstSampleOffset":J
    cmp-long v17, v5, v3

    if-gez v17, :cond_4a

    .line 331
    move-wide v3, v5

    goto/16 :goto_4a

    .line 334
    .end local v2    # "atom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v5    # "firstSampleOffset":J
    .end local v9    # "maxInputSize":I
    .end local v10    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v11    # "mp4Track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    .end local v12    # "stblAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v13    # "track":Lcom/google/android/exoplayer/extractor/mp4/Track;
    .end local v14    # "trackSampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    :cond_d5
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v0, v0, [Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 337
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

    .line 175
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    if-nez v3, :cond_2b

    .line 177
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v3, v5, v10, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BIIZ)Z

    move-result v3

    if-nez v3, :cond_14

    .line 216
    :goto_13
    return v5

    .line 180
    :cond_14
    iput v10, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 181
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 182
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    .line 183
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    .line 186
    :cond_2b
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    const-wide/16 v8, 0x1

    cmp-long v3, v6, v8

    if-nez v3, :cond_49

    .line 188
    const/16 v2, 0x8

    .line 189
    .local v2, "headerBytesRemaining":I
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v3, v10, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 190
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 191
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    .line 194
    .end local v2    # "headerBytesRemaining":I
    :cond_49
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->shouldParseContainerAtom(I)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 195
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    add-long/2addr v5, v7

    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    int-to-long v7, v3

    sub-long v0, v5, v7

    .line 196
    .local v0, "endPosition":J
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v5, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    iget v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-direct {v5, v6, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v3, v5}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 197
    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    int-to-long v7, v3

    cmp-long v3, v5, v7

    if-nez v3, :cond_77

    .line 198
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processAtomEnded(J)V

    .end local v0    # "endPosition":J
    :goto_75
    move v5, v4

    .line 216
    goto :goto_13

    .line 201
    .restart local v0    # "endPosition":J
    :cond_77
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_75

    .line 203
    .end local v0    # "endPosition":J
    :cond_7b
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->shouldParseLeafAtom(I)Z

    move-result v3

    if-eqz v3, :cond_b4

    .line 206
    iget v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    if-ne v3, v10, :cond_b0

    move v3, v4

    :goto_88
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 207
    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    const-wide/32 v8, 0x7fffffff

    cmp-long v3, v6, v8

    if-gtz v3, :cond_b2

    move v3, v4

    :goto_95
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 208
    new-instance v3, Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-wide v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    long-to-int v6, v6

    invoke-direct {v3, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 209
    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v3, v5, v6, v5, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    iput v11, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_75

    :cond_b0
    move v3, v5

    .line 206
    goto :goto_88

    :cond_b2
    move v3, v5

    .line 207
    goto :goto_95

    .line 212
    :cond_b4
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 213
    iput v11, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_75
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)Z
    .registers 12
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "positionHolder"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 226
    iget-wide v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomSize:J

    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    int-to-long v7, v7

    sub-long v2, v5, v7

    .line 227
    .local v2, "atomPayloadSize":J
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    add-long v0, v5, v2

    .line 228
    .local v0, "atomEndPosition":J
    const/4 v4, 0x0

    .line 229
    .local v4, "seekRequired":Z
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v5, :cond_53

    .line 230
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v5, v5, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v6, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    long-to-int v7, v2

    invoke-interface {p1, v5, v6, v7}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 231
    iget v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    sget v6, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ftyp:I

    if-ne v5, v6, :cond_36

    .line 232
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v5}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processFtypAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    move-result v5

    iput-boolean v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->isQuickTime:Z

    .line 245
    :cond_2a
    :goto_2a
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->processAtomEnded(J)V

    .line 246
    if-eqz v4, :cond_68

    iget v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    const/4 v6, 0x3

    if-eq v5, v6, :cond_68

    const/4 v5, 0x1

    :goto_35
    return v5

    .line 233
    :cond_36
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2a

    .line 234
    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    new-instance v6, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    iget v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomType:I

    iget-object v8, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v6, v7, v8}, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer/util/ParsableByteArray;)V

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;)V

    goto :goto_2a

    .line 238
    :cond_53
    const-wide/32 v5, 0x40000

    cmp-long v5, v2, v5

    if-gez v5, :cond_5f

    .line 239
    long-to-int v5, v2

    invoke-interface {p1, v5}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_2a

    .line 241
    :cond_5f
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v5

    add-long/2addr v5, v2

    iput-wide v5, p2, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 242
    const/4 v4, 0x1

    goto :goto_2a

    .line 246
    :cond_68
    const/4 v5, 0x0

    goto :goto_35
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
    .line 357
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->getTrackIndexOfEarliestCurrentSample()I

    move-result v17

    .line 358
    .local v17, "trackIndex":I
    const/4 v2, -0x1

    move/from16 v0, v17

    if-ne v0, v2, :cond_b

    .line 359
    const/4 v2, -0x1

    .line 414
    :goto_a
    return v2

    .line 361
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v16, v2, v17

    .line 362
    .local v16, "track":Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;
    move-object/from16 v0, v16

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 363
    .local v1, "trackOutput":Lcom/google/android/exoplayer/extractor/TrackOutput;
    move-object/from16 v0, v16

    iget v13, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 364
    .local v13, "sampleIndex":I
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v11, v2, v13

    .line 365
    .local v11, "position":J
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    sub-long v2, v11, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    int-to-long v4, v4

    add-long v14, v2, v4

    .line 366
    .local v14, "skipAmount":J
    const-wide/16 v2, 0x0

    cmp-long v2, v14, v2

    if-ltz v2, :cond_3b

    const-wide/32 v2, 0x40000

    cmp-long v2, v14, v2

    if-ltz v2, :cond_41

    .line 367
    :cond_3b
    move-object/from16 v0, p2

    iput-wide v11, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 368
    const/4 v2, 0x1

    goto :goto_a

    .line 370
    :cond_41
    long-to-int v2, v14

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 371
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->sizes:[I

    aget v2, v2, v13

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    .line 372
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_ef

    .line 375
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 376
    .local v8, "nalLengthData":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 377
    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 378
    const/4 v2, 0x2

    const/4 v3, 0x0

    aput-byte v3, v8, v2

    .line 379
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v9, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    .line 380
    .local v9, "nalUnitLengthFieldLength":I
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->track:Lcom/google/android/exoplayer/extractor/mp4/Track;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v10, v2, 0x4

    .line 384
    .local v10, "nalUnitLengthFieldLengthDiff":I
    :goto_7c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    if-ge v2, v3, :cond_11e

    .line 385
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    if-nez v2, :cond_cf

    .line 387
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p1

    invoke-interface {v0, v2, v10, v9}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->readFully([BII)V

    .line 388
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 389
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalLength:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 391
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 392
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->nalStartCode:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v3, 0x4

    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 393
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int/lit8 v2, v2, 0x4

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 394
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    add-int/2addr v2, v10

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    goto :goto_7c

    .line 397
    :cond_cf
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 398
    .local v18, "writtenBytes":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 399
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_7c

    .line 403
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

    .line 404
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2, v3}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v18

    .line 405
    .restart local v18    # "writtenBytes":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    add-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 406
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v2, v2, v18

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto :goto_ef

    .line 409
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

    .line 411
    move-object/from16 v0, v16

    iget v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v16

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 412
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 413
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 414
    const/4 v2, 0x0

    goto/16 :goto_a
.end method

.method private static shouldParseContainerAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 456
    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moov:I

    if-eq p0, v0, :cond_18

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_trak:I

    if-eq p0, v0, :cond_18

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    if-eq p0, v0, :cond_18

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    if-eq p0, v0, :cond_18

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    if-eq p0, v0, :cond_18

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_edts:I

    if-ne p0, v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private static shouldParseLeafAtom(I)Z
    .registers 2
    .param p0, "atom"    # I

    .prologue
    .line 445
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

    sget v0, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_udta:I

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
    .line 149
    const-wide v0, 0x7fffffffffffffffL

    .line 150
    .local v0, "earliestSamplePosition":J
    const/4 v6, 0x0

    .local v6, "trackIndex":I
    :goto_6
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    array-length v7, v7

    if-ge v6, v7, :cond_2e

    .line 151
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v7, v7, v6

    iget-object v5, v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleTable:Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    .line 152
    .local v5, "sampleTable":Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    invoke-virtual {v5, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->getIndexOfEarlierOrEqualSynchronizationSample(J)I

    move-result v4

    .line 153
    .local v4, "sampleIndex":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_1c

    .line 155
    invoke-virtual {v5, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->getIndexOfLaterOrEqualSynchronizationSample(J)I

    move-result v4

    .line 157
    :cond_1c
    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->tracks:[Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;

    aget-object v7, v7, v6

    iput v4, v7, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor$Mp4Track;->sampleIndex:I

    .line 159
    iget-object v7, v5, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;->offsets:[J

    aget-wide v2, v7, v4

    .line 160
    .local v2, "offset":J
    cmp-long v7, v2, v0

    if-gez v7, :cond_2b

    .line 161
    move-wide v0, v2

    .line 150
    :cond_2b
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 164
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
    .line 95
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 96
    return-void
.end method

.method public isSeekable()Z
    .registers 2

    .prologue
    .line 144
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
    .line 116
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    packed-switch v0, :pswitch_data_2c

    .line 135
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readSample(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I

    move-result v0

    :goto_9
    return v0

    .line 118
    :pswitch_a
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    .line 119
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_0

    .line 121
    :cond_18
    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    goto :goto_0

    .line 125
    :pswitch_1c
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 126
    const/4 v0, -0x1

    goto :goto_9

    .line 130
    :pswitch_24
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    const/4 v0, 0x1

    goto :goto_9

    .line 116
    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_a
        :pswitch_1c
        :pswitch_24
    .end packed-switch
.end method

.method public release()V
    .registers 1

    .prologue
    .line 110
    return-void
.end method

.method public seek()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 100
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 101
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->atomHeaderBytesRead:I

    .line 102
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleBytesWritten:I

    .line 103
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 104
    iput v1, p0, Lcom/google/android/exoplayer/extractor/mp4/Mp4Extractor;->parserState:I

    .line 105
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
    .line 90
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffUnfragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method
