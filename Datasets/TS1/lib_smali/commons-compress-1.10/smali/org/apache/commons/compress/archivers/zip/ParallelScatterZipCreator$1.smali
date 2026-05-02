.class Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;
.super Ljava/lang/ThreadLocal;
.source "ParallelScatterZipCreator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)V
    .registers 2

    .prologue
    .line 80
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;->this$0:Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;->initialValue()Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    .registers 5

    .prologue
    .line 84
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;->this$0:Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;->this$0:Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->backingStoreSupplier:Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;
    invoke-static {v3}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->access$000(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;

    move-result-object v3

    # invokes: Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->createDeferred(Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->access$100(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;Lorg/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier;)Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;

    move-result-object v1

    .line 85
    .local v1, "scatterStream":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator$1;->this$0:Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;

    # getter for: Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->streams:Ljava/util/List;
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;->access$200(Lorg/apache/commons/compress/archivers/zip/ParallelScatterZipCreator;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_15} :catch_16

    .line 86
    return-object v1

    .line 87
    .end local v1    # "scatterStream":Lorg/apache/commons/compress/archivers/zip/ScatterZipOutputStream;
    :catch_16
    move-exception v0

    .line 88
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
