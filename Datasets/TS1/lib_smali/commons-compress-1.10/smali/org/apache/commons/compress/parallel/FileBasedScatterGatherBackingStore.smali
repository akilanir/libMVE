.class public Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;
.super Ljava/lang/Object;
.source "FileBasedScatterGatherBackingStore.java"

# interfaces
.implements Lorg/apache/commons/compress/parallel/ScatterGatherBackingStore;


# instance fields
.field private closed:Z

.field private final os:Ljava/io/FileOutputStream;

.field private final target:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "target"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->target:Ljava/io/File;

    .line 39
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->os:Ljava/io/FileOutputStream;

    .line 40
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->closeForWriting()V

    .line 60
    iget-object v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->target:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 61
    return-void
.end method

.method public closeForWriting()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    iget-boolean v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->closed:Z

    if-nez v0, :cond_c

    .line 49
    iget-object v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->closed:Z

    .line 52
    :cond_c
    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->target:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public writeOut([BII)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore;->os:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 56
    return-void
.end method
