.class final Lokhttp3/internal/DiskLruCache$Entry;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Entry"
.end annotation


# instance fields
.field private final cleanFiles:[Ljava/io/File;

.field private currentEditor:Lokhttp3/internal/DiskLruCache$Editor;

.field private final dirtyFiles:[Ljava/io/File;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private readable:Z

.field private sequenceNumber:J

.field final synthetic this$0:Lokhttp3/internal/DiskLruCache;


# direct methods
.method private constructor <init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;)V
    .registers 10
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 931
    iput-object p1, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 932
    iput-object p2, p0, Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 934
    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v3

    new-array v3, v3, [J

    iput-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J

    .line 935
    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v3

    new-array v3, v3, [Ljava/io/File;

    iput-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    .line 936
    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v3

    new-array v3, v3, [Ljava/io/File;

    iput-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;

    .line 939
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 940
    .local v0, "fileBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 941
    .local v2, "truncateTo":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2f
    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v3

    if-ge v1, v3, :cond_65

    .line 942
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 943
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    new-instance v4, Ljava/io/File;

    # getter for: Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2800(Lokhttp3/internal/DiskLruCache;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v4, v3, v1

    .line 944
    const-string v3, ".tmp"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;

    new-instance v4, Ljava/io/File;

    # getter for: Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2800(Lokhttp3/internal/DiskLruCache;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v4, v3, v1

    .line 946
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 941
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 948
    :cond_65
    return-void
.end method

.method synthetic constructor <init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;Lokhttp3/internal/DiskLruCache$1;)V
    .registers 4
    .param p1, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lokhttp3/internal/DiskLruCache$1;

    .prologue
    .line 914
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/DiskLruCache$Entry;-><init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lokhttp3/internal/DiskLruCache$Entry;[Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;
    .param p1, "x1"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 914
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J

    return-object v0
.end method

.method static synthetic access$1300(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$1400(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600(Lokhttp3/internal/DiskLruCache$Entry;)J
    .registers 3
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-wide v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->sequenceNumber:J

    return-wide v0
.end method

.method static synthetic access$1602(Lokhttp3/internal/DiskLruCache$Entry;J)J
    .registers 3
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;
    .param p1, "x1"    # J

    .prologue
    .line 914
    iput-wide p1, p0, Lokhttp3/internal/DiskLruCache$Entry;->sequenceNumber:J

    return-wide p1
.end method

.method static synthetic access$800(Lokhttp3/internal/DiskLruCache$Entry;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->readable:Z

    return v0
.end method

.method static synthetic access$802(Lokhttp3/internal/DiskLruCache$Entry;Z)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;
    .param p1, "x1"    # Z

    .prologue
    .line 914
    iput-boolean p1, p0, Lokhttp3/internal/DiskLruCache$Entry;->readable:Z

    return p1
.end method

.method static synthetic access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 914
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;

    return-object v0
.end method

.method static synthetic access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Entry;
    .param p1, "x1"    # Lokhttp3/internal/DiskLruCache$Editor;

    .prologue
    .line 914
    iput-object p1, p0, Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;

    return-object p1
.end method

.method private invalidLengths([Ljava/lang/String;)Ljava/io/IOException;
    .registers 5
    .param p1, "strings"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 973
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setLengths([Ljava/lang/String;)V
    .registers 7
    .param p1, "strings"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 952
    array-length v2, p1

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v3

    if-eq v2, v3, :cond_e

    .line 953
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 957
    :cond_e
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    :try_start_f
    array-length v2, p1

    if-ge v1, v2, :cond_25

    .line 958
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J

    aget-object v3, p1, v1

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    aput-wide v3, v2, v1
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_f .. :try_end_1c} :catch_1f

    .line 957
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 960
    :catch_1f
    move-exception v0

    .line 961
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 963
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_25
    return-void
.end method


# virtual methods
.method snapshot()Lokhttp3/internal/DiskLruCache$Snapshot;
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 982
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 984
    :cond_f
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v0

    new-array v5, v0, [Lokio/Source;

    .line 985
    .local v5, "sources":[Lokio/Source;
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J

    invoke-virtual {v0}, [J->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [J

    .line 987
    .local v6, "lengths":[J
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_20
    :try_start_20
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v0

    if-ge v9, v0, :cond_3b

    .line 988
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache;->access$2400(Lokhttp3/internal/DiskLruCache;)Lokhttp3/internal/io/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    aget-object v1, v1, v9

    invoke-interface {v0, v1}, Lokhttp3/internal/io/FileSystem;->source(Ljava/io/File;)Lokio/Source;

    move-result-object v0

    aput-object v0, v5, v9

    .line 987
    add-int/lit8 v9, v9, 0x1

    goto :goto_20

    .line 990
    :cond_3b
    new-instance v0, Lokhttp3/internal/DiskLruCache$Snapshot;

    iget-object v1, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;

    iget-wide v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->sequenceNumber:J

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lokhttp3/internal/DiskLruCache$Snapshot;-><init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;J[Lokio/Source;[JLokhttp3/internal/DiskLruCache$1;)V
    :try_end_47
    .catch Ljava/io/FileNotFoundException; {:try_start_20 .. :try_end_47} :catch_48

    .line 1000
    :goto_47
    return-object v0

    .line 991
    :catch_48
    move-exception v8

    .line 993
    .local v8, "e":Ljava/io/FileNotFoundException;
    const/4 v9, 0x0

    :goto_4a
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Entry;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache;->access$2300(Lokhttp3/internal/DiskLruCache;)I

    move-result v0

    if-ge v9, v0, :cond_5e

    .line 994
    aget-object v0, v5, v9

    if-eqz v0, :cond_5e

    .line 995
    aget-object v0, v5, v9

    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 993
    add-int/lit8 v9, v9, 0x1

    goto :goto_4a

    :cond_5e
    move-object v0, v10

    .line 1000
    goto :goto_47
.end method

.method writeLengths(Lokio/BufferedSink;)V
    .registers 8
    .param p1, "writer"    # Lokio/BufferedSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 967
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v4, :cond_14

    aget-wide v0, v3, v2

    .line 968
    .local v0, "length":J
    const/16 v5, 0x20

    invoke-interface {p1, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    move-result-object v5

    invoke-interface {v5, v0, v1}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 967
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 970
    .end local v0    # "length":J
    :cond_14
    return-void
.end method
