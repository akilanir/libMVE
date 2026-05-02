.class Lorg/apache/commons/compress/archivers/sevenz/Archive;
.super Ljava/lang/Object;
.source "Archive.java"


# instance fields
.field files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

.field folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

.field packCrcs:[J

.field packCrcsDefined:Ljava/util/BitSet;

.field packPos:J

.field packSizes:[J

.field streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

.field subStreamsInfo:Lorg/apache/commons/compress/archivers/sevenz/SubStreamsInfo;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static lengthOf([J)Ljava/lang/String;
    .registers 2
    .param p0, "a"    # [J

    .prologue
    .line 49
    if-nez p0, :cond_5

    const-string v0, "(null)"

    :goto_4
    return-object v0

    :cond_5
    array-length v0, p0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method private static lengthOf([Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "a"    # [Ljava/lang/Object;

    .prologue
    .line 53
    if-nez p0, :cond_5

    const-string v0, "(null)"

    :goto_4
    return-object v0

    :cond_5
    array-length v0, p0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Archive with packed streams starting at offset "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packPos:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packSizes:[J

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/sevenz/Archive;->lengthOf([J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " pack sizes, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->packCrcs:[J

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/sevenz/Archive;->lengthOf([J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " CRCs, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->folders:[Lorg/apache/commons/compress/archivers/sevenz/Folder;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/sevenz/Archive;->lengthOf([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " folders, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->files:[Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/sevenz/Archive;->lengthOf([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " files and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Archive;->streamMap:Lorg/apache/commons/compress/archivers/sevenz/StreamMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
