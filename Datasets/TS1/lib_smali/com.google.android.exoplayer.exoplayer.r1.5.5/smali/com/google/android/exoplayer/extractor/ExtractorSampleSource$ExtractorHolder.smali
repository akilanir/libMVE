.class final Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;
.super Ljava/lang/Object;
.source "ExtractorSampleSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ExtractorSampleSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ExtractorHolder"
.end annotation


# instance fields
.field private extractor:Lcom/google/android/exoplayer/extractor/Extractor;

.field private final extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private final extractors:[Lcom/google/android/exoplayer/extractor/Extractor;


# direct methods
.method public constructor <init>([Lcom/google/android/exoplayer/extractor/Extractor;Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 3
    .param p1, "extractors"    # [Lcom/google/android/exoplayer/extractor/Extractor;
    .param p2, "extractorOutput"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 756
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 757
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractors:[Lcom/google/android/exoplayer/extractor/Extractor;

    .line 758
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 759
    return-void
.end method


# virtual methods
.method public selectExtractor(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Lcom/google/android/exoplayer/extractor/Extractor;
    .registers 8
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException;,
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 772
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;

    if-eqz v4, :cond_7

    .line 773
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;

    .line 790
    :goto_6
    return-object v4

    .line 775
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractors:[Lcom/google/android/exoplayer/extractor/Extractor;

    .local v0, "arr$":[Lcom/google/android/exoplayer/extractor/Extractor;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_17

    aget-object v1, v0, v2

    .line 777
    .local v1, "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    :try_start_f
    invoke-interface {v1, p1}, Lcom/google/android/exoplayer/extractor/Extractor;->sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 778
    iput-object v1, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;
    :try_end_17
    .catch Ljava/io/EOFException; {:try_start_f .. :try_end_17} :catch_23

    .line 786
    .end local v1    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    :cond_17
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;

    if-nez v4, :cond_2a

    .line 787
    new-instance v4, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException;

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractors:[Lcom/google/android/exoplayer/extractor/Extractor;

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$UnrecognizedInputFormatException;-><init>([Lcom/google/android/exoplayer/extractor/Extractor;)V

    throw v4

    .line 781
    .restart local v1    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    :catch_23
    move-exception v4

    .line 784
    :cond_24
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->resetPeekPosition()V

    .line 775
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 789
    .end local v1    # "extractor":Lcom/google/android/exoplayer/extractor/Extractor;
    :cond_2a
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v4, v5}, Lcom/google/android/exoplayer/extractor/Extractor;->init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V

    .line 790
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/ExtractorSampleSource$ExtractorHolder;->extractor:Lcom/google/android/exoplayer/extractor/Extractor;

    goto :goto_6
.end method
