.class Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;
.super Ljava/lang/Object;
.source "ExtractorSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExtractingLoadable"
.end annotation


# instance fields
.field private final allocator:Lcom/google/android/exoplayer/upstream/Allocator;

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

.field private volatile loadCanceled:Z

.field private pendingExtractorSeek:Z

.field private final positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

.field private final requestedBufferSize:I

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;Lcom/google/android/exoplayer/upstream/Allocator;IJ)V
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "extractorHolder"    # Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;
    .param p4, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p5, "requestedBufferSize"    # I
    .param p6, "position"    # J

    .prologue
    .line 685
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 686
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->uri:Landroid/net/Uri;

    .line 687
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 688
    invoke-static {p3}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    .line 689
    invoke-static {p4}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/Allocator;

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    .line 690
    iput p5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->requestedBufferSize:I

    .line 691
    new-instance v0, Lcom/google/android/exoplayer/extractor/PositionHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/PositionHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    .line 692
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    iput-wide p6, v0, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 693
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->pendingExtractorSeek:Z

    .line 694
    return-void
.end method


# virtual methods
.method public cancelLoad()V
    .registers 2

    .prologue
    .line 698
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->loadCanceled:Z

    .line 699
    return-void
.end method

.method public isLoadCanceled()Z
    .registers 2

    .prologue
    .line 703
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->loadCanceled:Z

    return v0
.end method

.method public load()V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const-wide/16 v13, -0x1

    const/4 v12, 0x1

    .line 708
    const/4 v9, 0x0

    .line 709
    .local v9, "result":I
    :goto_4
    if-nez v9, :cond_79

    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->loadCanceled:Z

    if-nez v1, :cond_79

    .line 710
    const/4 v8, 0x0

    .line 712
    .local v8, "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    :try_start_b
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    iget-wide v2, v1, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    .line 713
    .local v2, "position":J
    iget-object v10, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->uri:Landroid/net/Uri;

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    invoke-interface {v10, v0}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v4

    .line 714
    .local v4, "length":J
    cmp-long v1, v4, v13

    if-eqz v1, :cond_24

    .line 715
    add-long/2addr v4, v2

    .line 717
    :cond_24
    new-instance v0, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;JJ)V
    :try_end_2b
    .catchall {:try_start_b .. :try_end_2b} :catchall_63

    .line 718
    .end local v8    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .local v0, "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    :try_start_2b
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->extractorHolder:Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->selectExtractor(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Lcom/google/android/exoplayer/extractor/Extractor;

    move-result-object v7

    .line 719
    .local v7, "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->pendingExtractorSeek:Z

    if-eqz v1, :cond_3b

    .line 720
    invoke-interface {v7}, Lcom/google/android/exoplayer/extractor/Extractor;->seek()V

    .line 721
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->pendingExtractorSeek:Z

    .line 723
    :cond_3b
    :goto_3b
    if-nez v9, :cond_4f

    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->loadCanceled:Z

    if-nez v1, :cond_4f

    .line 724
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    iget v6, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->requestedBufferSize:I

    invoke-interface {v1, v6}, Lcom/google/android/exoplayer/upstream/Allocator;->blockWhileTotalBytesAllocatedExceeds(I)V

    .line 725
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    invoke-interface {v7, v0, v1}, Lcom/google/android/exoplayer/extractor/Extractor;->read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    :try_end_4d
    .catchall {:try_start_2b .. :try_end_4d} :catchall_7a

    move-result v9

    goto :goto_3b

    .line 729
    :cond_4f
    if-ne v9, v12, :cond_58

    .line 730
    const/4 v9, 0x0

    .line 734
    :cond_52
    :goto_52
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    goto :goto_4

    .line 731
    :cond_58
    if-eqz v0, :cond_52

    .line 732
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v10

    iput-wide v10, v1, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    goto :goto_52

    .line 729
    .end local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .end local v2    # "position":J
    .end local v4    # "length":J
    .end local v7    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    .restart local v8    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    :catchall_63
    move-exception v1

    move-object v0, v8

    .end local v8    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .restart local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    :goto_65
    if-ne v9, v12, :cond_6e

    .line 730
    const/4 v9, 0x0

    .line 734
    :cond_68
    :goto_68
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v6}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v1

    .line 731
    :cond_6e
    if-eqz v0, :cond_68

    .line 732
    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractingLoadable;->positionHolder:Lcom/google/android/exoplayer/extractor/PositionHolder;

    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v10

    iput-wide v10, v6, Lcom/google/android/exoplayer/extractor/PositionHolder;->position:J

    goto :goto_68

    .line 737
    .end local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    :cond_79
    return-void

    .line 729
    .restart local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .restart local v2    # "position":J
    .restart local v4    # "length":J
    :catchall_7a
    move-exception v1

    goto :goto_65
.end method
