.class public Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;
.super Ljava/lang/Object;
.source "ParallelScatterZipCreator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;
    }
.end annotation


# instance fields
.field private final backingStoreSupplier:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;

.field private compressionDoneAt:J

.field private final es:Ljava/util/concurrent/ExecutorService;

.field private final futures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private scatterDoneAt:J

.field private final startedAt:J

.field private final streams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation
.end field

.field private final tlScatterStreams:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 98
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 4
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 108
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$DefaultBackingStoreSupplier;-><init>(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;)V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;-><init>(Ljava/util/concurrent/ExecutorService;Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)V

    .line 109
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)V
    .registers 5
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p2, "backingStoreSupplier"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/List;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/List;

    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->startedAt:J

    .line 61
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    .line 80
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;

    invoke-direct {v0, p0}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;-><init>(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->tlScatterStreams:Ljava/lang/ThreadLocal;

    .line 120
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->backingStoreSupplier:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;

    .line 121
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    .line 122
    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->backingStoreSupplier:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;

    return-object v0
.end method

.method static synthetic access$100(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    .registers 3
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;
    .param p1, "x1"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->createDeferred(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)Ljava/lang/ThreadLocal;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->tlScatterStreams:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method private createDeferred(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    .registers 5
    .param p1, "scatterGatherBackingStoreSupplier"    # Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-interface {p1}, Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;->get()Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;

    move-result-object v0

    .line 76
    .local v0, "bs":Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;
    const/4 v2, -0x1

    invoke-static {v2, v0}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;->create(ILorg/apache/commons/compress/parallel/ScatterGatherBackingStore;)Lorg/apache/commons/compress/archivers/zip/StreamCompressor;

    move-result-object v1

    .line 77
    .local v1, "sc":Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;-><init>(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;Lorg/apache/commons/compress/archivers/zip/StreamCompressor;)V

    return-object v2
.end method


# virtual methods
.method public addArchiveEntry(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/parallel/InputStreamSupplier;)V
    .registers 4
    .param p1, "zipArchiveEntry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "source"    # Lorg/apache/commons/compress/parallel/InputStreamSupplier;

    .prologue
    .line 135
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->createCallable(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/parallel/InputStreamSupplier;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->submit(Ljava/util/concurrent/Callable;)V

    .line 136
    return-void
.end method

.method public final createCallable(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/parallel/InputStreamSupplier;)Ljava/util/concurrent/Callable;
    .registers 8
    .param p1, "zipArchiveEntry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "source"    # Lorg/apache/commons/compress/parallel/InputStreamSupplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
            "Lorg/apache/commons/compress/parallel/InputStreamSupplier;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    .line 169
    .local v0, "method":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_20

    .line 170
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Method must be set on zipArchiveEntry: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 172
    :cond_20
    invoke-static {p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;->createZipArchiveEntryRequest(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/parallel/InputStreamSupplier;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;

    move-result-object v1

    .line 173
    .local v1, "zipArchiveEntryRequest":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$2;

    invoke-direct {v2, p0, v1}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$2;-><init>(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest;)V

    return-object v2
.end method

.method public getStatisticsMessage()Lorg/apache/commons/compress/archivers/zip/ScatterStatistics;
    .registers 8

    .prologue
    .line 222
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ScatterStatistics;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->startedAt:J

    sub-long/2addr v1, v3

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->scatterDoneAt:J

    iget-wide v5, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    sub-long/2addr v3, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/commons/compress/archivers/zip/ScatterStatistics;-><init>(JJ)V

    return-object v0
.end method

.method public final submit(Ljava/util/concurrent/Callable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 146
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<Ljava/lang/Object;>;"
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/List;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    return-void
.end method

.method public writeTo(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;)V
    .registers 9
    .param p1, "targetStream"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->futures:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    .line 199
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    goto :goto_6

    .line 202
    .end local v0    # "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :cond_16
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 203
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->es:Ljava/util/concurrent/ExecutorService;

    const-wide/32 v4, 0xea60

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v5, v6}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    .line 206
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->compressionDoneAt:J

    .line 208
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_31
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    .line 209
    .local v2, "scatterStream":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    invoke-virtual {v2, p1}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->writeTo(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;)V

    .line 210
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;->close()V

    goto :goto_31

    .line 213
    .end local v2    # "scatterStream":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    :cond_44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->scatterDoneAt:J

    .line 214
    return-void
.end method
