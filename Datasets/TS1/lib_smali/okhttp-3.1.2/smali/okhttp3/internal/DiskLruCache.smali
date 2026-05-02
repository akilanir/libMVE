.class public final Lokhttp3/internal/DiskLruCache;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/internal/DiskLruCache$Entry;,
        Lokhttp3/internal/DiskLruCache$Editor;,
        Lokhttp3/internal/DiskLruCache$Snapshot;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final ANY_SEQUENCE_NUMBER:J = -0x1L

.field private static final CLEAN:Ljava/lang/String; = "CLEAN"

.field private static final DIRTY:Ljava/lang/String; = "DIRTY"

.field static final JOURNAL_FILE:Ljava/lang/String; = "journal"

.field static final JOURNAL_FILE_BACKUP:Ljava/lang/String; = "journal.bkp"

.field static final JOURNAL_FILE_TEMP:Ljava/lang/String; = "journal.tmp"

.field static final LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

.field static final MAGIC:Ljava/lang/String; = "libcore.io.DiskLruCache"

.field private static final NULL_SINK:Lokio/Sink;

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private final cleanupRunnable:Ljava/lang/Runnable;

.field private closed:Z

.field private final directory:Ljava/io/File;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final fileSystem:Lokhttp3/internal/io/FileSystem;

.field private hasJournalErrors:Z

.field private initialized:Z

.field private final journalFile:Ljava/io/File;

.field private final journalFileBackup:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private journalWriter:Lokio/BufferedSink;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lokhttp3/internal/DiskLruCache$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private maxSize:J

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    const-class v0, Lokhttp3/internal/DiskLruCache;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lokhttp3/internal/DiskLruCache;->$assertionsDisabled:Z

    .line 91
    const-string v0, "[a-z0-9_-]{1,120}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    .line 798
    new-instance v0, Lokhttp3/internal/DiskLruCache$4;

    invoke-direct {v0}, Lokhttp3/internal/DiskLruCache$4;-><init>()V

    sput-object v0, Lokhttp3/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;

    return-void

    .line 84
    :cond_1b
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lokhttp3/internal/io/FileSystem;Ljava/io/File;IIJLjava/util/concurrent/Executor;)V
    .registers 14
    .param p1, "fileSystem"    # Lokhttp3/internal/io/FileSystem;
    .param p2, "directory"    # Ljava/io/File;
    .param p3, "appVersion"    # I
    .param p4, "valueCount"    # I
    .param p5, "maxSize"    # J
    .param p7, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    const-wide/16 v4, 0x0

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-wide v4, p0, Lokhttp3/internal/DiskLruCache;->size:J

    .line 147
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 160
    iput-wide v4, p0, Lokhttp3/internal/DiskLruCache;->nextSequenceNumber:J

    .line 164
    new-instance v0, Lokhttp3/internal/DiskLruCache$1;

    invoke-direct {v0, p0}, Lokhttp3/internal/DiskLruCache$1;-><init>(Lokhttp3/internal/DiskLruCache;)V

    iput-object v0, p0, Lokhttp3/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    .line 185
    iput-object p1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    .line 186
    iput-object p2, p0, Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;

    .line 187
    iput p3, p0, Lokhttp3/internal/DiskLruCache;->appVersion:I

    .line 188
    new-instance v0, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    .line 189
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.tmp"

    invoke-direct {v0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lokhttp3/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    .line 190
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    .line 191
    iput p4, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    .line 192
    iput-wide p5, p0, Lokhttp3/internal/DiskLruCache;->maxSize:J

    .line 193
    iput-object p7, p0, Lokhttp3/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    .line 194
    return-void
.end method

.method static synthetic access$000(Lokhttp3/internal/DiskLruCache;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z

    return v0
.end method

.method static synthetic access$100(Lokhttp3/internal/DiskLruCache;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache;->closed:Z

    return v0
.end method

.method static synthetic access$200(Lokhttp3/internal/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$2000(Lokhttp3/internal/DiskLruCache;)Ljava/util/LinkedHashMap;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method static synthetic access$2200(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;J)Lokhttp3/internal/DiskLruCache$Editor;
    .registers 5
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0, p1, p2, p3}, Lokhttp3/internal/DiskLruCache;->edit(Ljava/lang/String;J)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2300(Lokhttp3/internal/DiskLruCache;)I
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget v0, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    return v0
.end method

.method static synthetic access$2400(Lokhttp3/internal/DiskLruCache;)Lokhttp3/internal/io/FileSystem;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    return-object v0
.end method

.method static synthetic access$2500()Lokio/Sink;
    .registers 1

    .prologue
    .line 84
    sget-object v0, Lokhttp3/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;

    return-object v0
.end method

.method static synthetic access$2600(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Editor;Z)V
    .registers 3
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p1, "x1"    # Lokhttp3/internal/DiskLruCache$Editor;
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/DiskLruCache;->completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$2700(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;)Z
    .registers 3
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p1, "x1"    # Lokhttp3/internal/DiskLruCache$Entry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache;->removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2800(Lokhttp3/internal/DiskLruCache;)Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$300(Lokhttp3/internal/DiskLruCache;)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;

    .prologue
    .line 84
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lokhttp3/internal/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$502(Lokhttp3/internal/DiskLruCache;I)I
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p1, "x1"    # I

    .prologue
    .line 84
    iput p1, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    return p1
.end method

.method static synthetic access$602(Lokhttp3/internal/DiskLruCache;Z)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p1, "x1"    # Z

    .prologue
    .line 84
    iput-boolean p1, p0, Lokhttp3/internal/DiskLruCache;->hasJournalErrors:Z

    return p1
.end method

.method private declared-synchronized checkNotClosed()V
    .registers 3

    .prologue
    .line 620
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 621
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 620
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0

    .line 623
    :cond_12
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V
    .registers 15
    .param p1, "editor"    # Lokhttp3/internal/DiskLruCache$Editor;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    monitor-enter p0

    :try_start_1
    # getter for: Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Editor;->access$1700(Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Entry;

    move-result-object v2

    .line 508
    .local v2, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v8

    if-eq v8, p1, :cond_14

    .line 509
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    .line 507
    .end local v2    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :catchall_11
    move-exception v8

    monitor-exit p0

    throw v8

    .line 513
    .restart local v2    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :cond_14
    if-eqz p2, :cond_5b

    :try_start_16
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$800(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v8

    if-nez v8, :cond_5b

    .line 514
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    iget v8, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_5b

    .line 515
    # getter for: Lokhttp3/internal/DiskLruCache$Editor;->written:[Z
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Editor;->access$1800(Lokhttp3/internal/DiskLruCache$Editor;)[Z

    move-result-object v8

    aget-boolean v8, v8, v3

    if-nez v8, :cond_45

    .line 516
    invoke-virtual {p1}, Lokhttp3/internal/DiskLruCache$Editor;->abort()V

    .line 517
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Newly created entry didn\'t create value for index "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 519
    :cond_45
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1400(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v9

    aget-object v9, v9, v3

    invoke-interface {v8, v9}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z

    move-result v8

    if-nez v8, :cond_58

    .line 520
    invoke-virtual {p1}, Lokhttp3/internal/DiskLruCache$Editor;->abort()V
    :try_end_56
    .catchall {:try_start_16 .. :try_end_56} :catchall_11

    .line 564
    :cond_56
    :goto_56
    monitor-exit p0

    return-void

    .line 514
    :cond_58
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 526
    .end local v3    # "i":I
    :cond_5b
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_5c
    :try_start_5c
    iget v8, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_9c

    .line 527
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1400(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v8

    aget-object v1, v8, v3

    .line 528
    .local v1, "dirty":Ljava/io/File;
    if-eqz p2, :cond_96

    .line 529
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    invoke-interface {v8, v1}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_93

    .line 530
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1300(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v8

    aget-object v0, v8, v3

    .line 531
    .local v0, "clean":Ljava/io/File;
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    invoke-interface {v8, v1, v0}, Lokhttp3/internal/io/FileSystem;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 532
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J

    move-result-object v8

    aget-wide v6, v8, v3

    .line 533
    .local v6, "oldLength":J
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    invoke-interface {v8, v0}, Lokhttp3/internal/io/FileSystem;->size(Ljava/io/File;)J

    move-result-wide v4

    .line 534
    .local v4, "newLength":J
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J

    move-result-object v8

    aput-wide v4, v8, v3

    .line 535
    iget-wide v8, p0, Lokhttp3/internal/DiskLruCache;->size:J

    sub-long/2addr v8, v6

    add-long/2addr v8, v4

    iput-wide v8, p0, Lokhttp3/internal/DiskLruCache;->size:J

    .line 526
    .end local v0    # "clean":Ljava/io/File;
    .end local v4    # "newLength":J
    .end local v6    # "oldLength":J
    :cond_93
    :goto_93
    add-int/lit8 v3, v3, 0x1

    goto :goto_5c

    .line 538
    :cond_96
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    invoke-interface {v8, v1}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    goto :goto_93

    .line 542
    .end local v1    # "dirty":Ljava/io/File;
    :cond_9c
    iget v8, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    .line 543
    const/4 v8, 0x0

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v2, v8}, Lokhttp3/internal/DiskLruCache$Entry;->access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;

    .line 544
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$800(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v8

    or-int/2addr v8, p2

    if-eqz v8, :cond_fb

    .line 545
    const/4 v8, 0x1

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2, v8}, Lokhttp3/internal/DiskLruCache$Entry;->access$802(Lokhttp3/internal/DiskLruCache$Entry;Z)Z

    .line 546
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v9, "CLEAN"

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v8

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 547
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 548
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-virtual {v2, v8}, Lokhttp3/internal/DiskLruCache$Entry;->writeLengths(Lokio/BufferedSink;)V

    .line 549
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const/16 v9, 0xa

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 550
    if-eqz p2, :cond_df

    .line 551
    iget-wide v8, p0, Lokhttp3/internal/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lokhttp3/internal/DiskLruCache;->nextSequenceNumber:J

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v2, v8, v9}, Lokhttp3/internal/DiskLruCache$Entry;->access$1602(Lokhttp3/internal/DiskLruCache$Entry;J)J

    .line 559
    :cond_df
    :goto_df
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v8}, Lokio/BufferedSink;->flush()V

    .line 561
    iget-wide v8, p0, Lokhttp3/internal/DiskLruCache;->size:J

    iget-wide v10, p0, Lokhttp3/internal/DiskLruCache;->maxSize:J

    cmp-long v8, v8, v10

    if-gtz v8, :cond_f2

    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v8

    if-eqz v8, :cond_56

    .line 562
    :cond_f2
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v9, p0, Lokhttp3/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v8, v9}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_56

    .line 554
    :cond_fb
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v9, "REMOVE"

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v8

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 556
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 557
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const/16 v9, 0xa

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_121
    .catchall {:try_start_5c .. :try_end_121} :catchall_11

    goto :goto_df
.end method

.method public static create(Lokhttp3/internal/io/FileSystem;Ljava/io/File;IIJ)Lokhttp3/internal/DiskLruCache;
    .registers 15
    .param p0, "fileSystem"    # Lokhttp3/internal/io/FileSystem;
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "valueCount"    # I
    .param p4, "maxSize"    # J

    .prologue
    const/4 v2, 0x1

    .line 243
    const-wide/16 v3, 0x0

    cmp-long v1, p4, v3

    if-gtz v1, :cond_f

    .line 244
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "maxSize <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 246
    :cond_f
    if-gtz p3, :cond_19

    .line 247
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "valueCount <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 251
    :cond_19
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v7, "OkHttp DiskLruCache"

    .line 252
    invoke-static {v7, v2}, Lokhttp3/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 254
    .local v0, "executor":Ljava/util/concurrent/Executor;
    new-instance v1, Lokhttp3/internal/DiskLruCache;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-wide v6, p4

    move-object v8, v0

    invoke-direct/range {v1 .. v8}, Lokhttp3/internal/DiskLruCache;-><init>(Lokhttp3/internal/io/FileSystem;Ljava/io/File;IIJLjava/util/concurrent/Executor;)V

    return-object v1
.end method

.method private declared-synchronized edit(Ljava/lang/String;J)Lokhttp3/internal/DiskLruCache$Editor;
    .registers 8
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "expectedSequenceNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 444
    monitor-enter p0

    :try_start_2
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 446
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->checkNotClosed()V

    .line 447
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 448
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/internal/DiskLruCache$Entry;

    .line 449
    .local v1, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_25

    if-eqz v1, :cond_23

    .line 450
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1600(Lokhttp3/internal/DiskLruCache$Entry;)J
    :try_end_1e
    .catchall {:try_start_2 .. :try_end_1e} :catchall_64

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_25

    .line 471
    :cond_23
    :goto_23
    monitor-exit p0

    return-object v0

    .line 453
    :cond_25
    if-eqz v1, :cond_2d

    :try_start_27
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v1}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v2

    if-nez v2, :cond_23

    .line 458
    :cond_2d
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v3, "DIRTY"

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    move-result-object v2

    invoke-interface {v2, p1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 459
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v2}, Lokio/BufferedSink;->flush()V

    .line 461
    iget-boolean v2, p0, Lokhttp3/internal/DiskLruCache;->hasJournalErrors:Z

    if-nez v2, :cond_23

    .line 465
    if-nez v1, :cond_5a

    .line 466
    new-instance v1, Lokhttp3/internal/DiskLruCache$Entry;

    .end local v1    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lokhttp3/internal/DiskLruCache$Entry;-><init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;Lokhttp3/internal/DiskLruCache$1;)V

    .line 467
    .restart local v1    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    :cond_5a
    new-instance v0, Lokhttp3/internal/DiskLruCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lokhttp3/internal/DiskLruCache$Editor;-><init>(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$1;)V

    .line 470
    .local v0, "editor":Lokhttp3/internal/DiskLruCache$Editor;
    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;
    :try_end_63
    .catchall {:try_start_27 .. :try_end_63} :catchall_64

    goto :goto_23

    .line 444
    .end local v0    # "editor":Lokhttp3/internal/DiskLruCache$Editor;
    .end local v1    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :catchall_64
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private journalRebuildRequired()Z
    .registers 4

    .prologue
    .line 571
    const/16 v0, 0x7d0

    .line 572
    .local v0, "redundantOpCompactThreshold":I
    iget v1, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_14

    iget v1, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 573
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    if-lt v1, v2, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private newJournalWriter()Lokio/BufferedSink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 297
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v2, v3}, Lokhttp3/internal/io/FileSystem;->appendingSink(Ljava/io/File;)Lokio/Sink;

    move-result-object v1

    .line 298
    .local v1, "fileSink":Lokio/Sink;
    new-instance v0, Lokhttp3/internal/DiskLruCache$2;

    invoke-direct {v0, p0, v1}, Lokhttp3/internal/DiskLruCache$2;-><init>(Lokhttp3/internal/DiskLruCache;Lokio/Sink;)V

    .line 304
    .local v0, "faultHidingSink":Lokio/Sink;
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v2

    return-object v2
.end method

.method private processJournal()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v4, p0, Lokhttp3/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-interface {v3, v4}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 352
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lokhttp3/internal/DiskLruCache$Entry;>;"
    :cond_11
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5c

    .line 353
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;

    .line 354
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v3

    if-nez v3, :cond_36

    .line 355
    const/4 v2, 0x0

    .local v2, "t":I
    :goto_24
    iget v3, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_11

    .line 356
    iget-wide v3, p0, Lokhttp3/internal/DiskLruCache;->size:J

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J

    move-result-object v5

    aget-wide v5, v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lokhttp3/internal/DiskLruCache;->size:J

    .line 355
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 359
    .end local v2    # "t":I
    :cond_36
    const/4 v3, 0x0

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0, v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;

    .line 360
    const/4 v2, 0x0

    .restart local v2    # "t":I
    :goto_3b
    iget v3, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_58

    .line 361
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$1300(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-interface {v3, v4}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 362
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$1400(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-interface {v3, v4}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 360
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    .line 364
    :cond_58
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_11

    .line 367
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    .end local v2    # "t":I
    :cond_5c
    return-void
.end method

.method private readJournal()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v9, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v8, v9}, Lokhttp3/internal/io/FileSystem;->source(Ljava/io/File;)Lokio/Source;

    move-result-object v8

    invoke-static {v8}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v5

    .line 260
    .local v5, "source":Lokio/BufferedSource;
    :try_start_c
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v4

    .line 261
    .local v4, "magic":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v7

    .line 262
    .local v7, "version":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "appVersionString":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v6

    .line 264
    .local v6, "valueCountString":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    .line 265
    .local v1, "blank":Ljava/lang/String;
    const-string v8, "libcore.io.DiskLruCache"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_50

    const-string v8, "1"

    .line 266
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_50

    iget v8, p0, Lokhttp3/internal/DiskLruCache;->appVersion:I

    .line 267
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_50

    iget v8, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    .line 268
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_50

    const-string v8, ""

    .line 269
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_92

    .line 270
    :cond_50
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unexpected journal header: ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_8d
    .catchall {:try_start_c .. :try_end_8d} :catchall_8d

    .line 292
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v4    # "magic":Ljava/lang/String;
    .end local v6    # "valueCountString":Ljava/lang/String;
    .end local v7    # "version":Ljava/lang/String;
    :catchall_8d
    move-exception v8

    invoke-static {v5}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v8

    .line 274
    .restart local v0    # "appVersionString":Ljava/lang/String;
    .restart local v1    # "blank":Ljava/lang/String;
    .restart local v4    # "magic":Ljava/lang/String;
    .restart local v6    # "valueCountString":Ljava/lang/String;
    .restart local v7    # "version":Ljava/lang/String;
    :cond_92
    const/4 v3, 0x0

    .line 277
    .local v3, "lineCount":I
    :goto_93
    :try_start_93
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lokhttp3/internal/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_9a
    .catch Ljava/io/EOFException; {:try_start_93 .. :try_end_9a} :catch_9d
    .catchall {:try_start_93 .. :try_end_9a} :catchall_8d

    .line 278
    add-int/lit8 v3, v3, 0x1

    goto :goto_93

    .line 279
    :catch_9d
    move-exception v2

    .line 283
    .local v2, "endOfJournal":Ljava/io/EOFException;
    :try_start_9e
    iget-object v8, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->size()I

    move-result v8

    sub-int v8, v3, v8

    iput v8, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    .line 286
    invoke-interface {v5}, Lokio/BufferedSource;->exhausted()Z

    move-result v8

    if-nez v8, :cond_b5

    .line 287
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->rebuildJournal()V
    :try_end_b1
    .catchall {:try_start_9e .. :try_end_b1} :catchall_8d

    .line 292
    :goto_b1
    invoke-static {v5}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 294
    return-void

    .line 289
    :cond_b5
    :try_start_b5
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->newJournalWriter()Lokio/BufferedSink;

    move-result-object v8

    iput-object v8, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    :try_end_bb
    .catchall {:try_start_b5 .. :try_end_bb} :catchall_8d

    goto :goto_b1
.end method

.method private readJournalLine(Ljava/lang/String;)V
    .registers 11
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 308
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 309
    .local v1, "firstSpace":I
    if-ne v1, v7, :cond_23

    .line 310
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unexpected journal line: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 313
    :cond_23
    add-int/lit8 v3, v1, 0x1

    .line 314
    .local v3, "keyBegin":I
    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 316
    .local v5, "secondSpace":I
    if-ne v5, v7, :cond_45

    .line 317
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 318
    .local v2, "key":Ljava/lang/String;
    const-string v6, "REMOVE"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_49

    const-string v6, "REMOVE"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 319
    iget-object v6, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    :cond_44
    :goto_44
    return-void

    .line 323
    .end local v2    # "key":Ljava/lang/String;
    :cond_45
    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 326
    .restart local v2    # "key":Ljava/lang/String;
    :cond_49
    iget-object v6, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;

    .line 327
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    if-nez v0, :cond_5d

    .line 328
    new-instance v0, Lokhttp3/internal/DiskLruCache$Entry;

    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    invoke-direct {v0, p0, v2, v8}, Lokhttp3/internal/DiskLruCache$Entry;-><init>(Lokhttp3/internal/DiskLruCache;Ljava/lang/String;Lokhttp3/internal/DiskLruCache$1;)V

    .line 329
    .restart local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    iget-object v6, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    :cond_5d
    if-eq v5, v7, :cond_86

    const-string v6, "CLEAN"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_86

    const-string v6, "CLEAN"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_86

    .line 333
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 334
    .local v4, "parts":[Ljava/lang/String;
    const/4 v6, 0x1

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v0, v6}, Lokhttp3/internal/DiskLruCache$Entry;->access$802(Lokhttp3/internal/DiskLruCache$Entry;Z)Z

    .line 335
    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0, v8}, Lokhttp3/internal/DiskLruCache$Entry;->access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;

    .line 336
    # invokes: Lokhttp3/internal/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V
    invoke-static {v0, v4}, Lokhttp3/internal/DiskLruCache$Entry;->access$1000(Lokhttp3/internal/DiskLruCache$Entry;[Ljava/lang/String;)V

    goto :goto_44

    .line 337
    .end local v4    # "parts":[Ljava/lang/String;
    :cond_86
    if-ne v5, v7, :cond_a1

    const-string v6, "DIRTY"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_a1

    const-string v6, "DIRTY"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a1

    .line 338
    new-instance v6, Lokhttp3/internal/DiskLruCache$Editor;

    invoke-direct {v6, p0, v0, v8}, Lokhttp3/internal/DiskLruCache$Editor;-><init>(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$1;)V

    # setter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0, v6}, Lokhttp3/internal/DiskLruCache$Entry;->access$902(Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Editor;

    goto :goto_44

    .line 339
    :cond_a1
    if-ne v5, v7, :cond_b3

    const-string v6, "READ"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_b3

    const-string v6, "READ"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_44

    .line 342
    :cond_b3
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unexpected journal line: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private declared-synchronized rebuildJournal()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    if-eqz v2, :cond_a

    .line 375
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v2}, Lokio/BufferedSink;->close()V

    .line 378
    :cond_a
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-interface {v2, v3}, Lokhttp3/internal/io/FileSystem;->sink(Ljava/io/File;)Lokio/Sink;

    move-result-object v2

    invoke-static {v2}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_82

    move-result-object v1

    .line 380
    .local v1, "writer":Lokio/BufferedSink;
    :try_start_16
    const-string v2, "libcore.io.DiskLruCache"

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 381
    const-string v2, "1"

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 382
    iget v2, p0, Lokhttp3/internal/DiskLruCache;->appVersion:I

    int-to-long v2, v2

    invoke-interface {v1, v2, v3}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 383
    iget v2, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    int-to-long v2, v2

    invoke-interface {v1, v2, v3}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 384
    const/16 v2, 0xa

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 386
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_53
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;

    .line 387
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eqz v3, :cond_85

    .line 388
    const-string v3, "DIRTY"

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v3

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 389
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 390
    const/16 v3, 0xa

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_7c
    .catchall {:try_start_16 .. :try_end_7c} :catchall_7d

    goto :goto_53

    .line 399
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :catchall_7d
    move-exception v2

    :try_start_7e
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    throw v2
    :try_end_82
    .catchall {:try_start_7e .. :try_end_82} :catchall_82

    .line 374
    .end local v1    # "writer":Lokio/BufferedSink;
    :catchall_82
    move-exception v2

    monitor-exit p0

    throw v2

    .line 392
    .restart local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    .restart local v1    # "writer":Lokio/BufferedSink;
    :cond_85
    :try_start_85
    const-string v3, "CLEAN"

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v3

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 393
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 394
    invoke-virtual {v0, v1}, Lokhttp3/internal/DiskLruCache$Entry;->writeLengths(Lokio/BufferedSink;)V

    .line 395
    const/16 v3, 0xa

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_9f
    .catchall {:try_start_85 .. :try_end_9f} :catchall_7d

    goto :goto_53

    .line 399
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :cond_a0
    :try_start_a0
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 402
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v2, v3}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_b6

    .line 403
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    iget-object v4, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-interface {v2, v3, v4}, Lokhttp3/internal/io/FileSystem;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 405
    :cond_b6
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    iget-object v4, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v2, v3, v4}, Lokhttp3/internal/io/FileSystem;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 406
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-interface {v2, v3}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 408
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->newJournalWriter()Lokio/BufferedSink;

    move-result-object v2

    iput-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    .line 409
    const/4 v2, 0x0

    iput-boolean v2, p0, Lokhttp3/internal/DiskLruCache;->hasJournalErrors:Z
    :try_end_cf
    .catchall {:try_start_a0 .. :try_end_cf} :catchall_82

    .line 410
    monitor-exit p0

    return-void
.end method

.method private removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z
    .registers 8
    .param p1, "entry"    # Lokhttp3/internal/DiskLruCache$Entry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 593
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 594
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v1

    # setter for: Lokhttp3/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v1, v5}, Lokhttp3/internal/DiskLruCache$Editor;->access$1902(Lokhttp3/internal/DiskLruCache$Editor;Z)Z

    .line 597
    :cond_e
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget v1, p0, Lokhttp3/internal/DiskLruCache;->valueCount:I

    if-ge v0, v1, :cond_34

    .line 598
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1300(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-interface {v1, v2}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 599
    iget-wide v1, p0, Lokhttp3/internal/DiskLruCache;->size:J

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J

    move-result-object v3

    aget-wide v3, v3, v0

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lokhttp3/internal/DiskLruCache;->size:J

    .line 600
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1200(Lokhttp3/internal/DiskLruCache$Entry;)[J

    move-result-object v1

    const-wide/16 v2, 0x0

    aput-wide v2, v1, v0

    .line 597
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 603
    :cond_34
    iget v1, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    .line 604
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v2, "REMOVE"

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v1

    const/16 v2, 0x20

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    move-result-object v1

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v1

    const/16 v2, 0xa

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 605
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 607
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v1

    if-eqz v1, :cond_6b

    .line 608
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 611
    :cond_6b
    return v5
.end method

.method private trimToSize()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 653
    :goto_0
    iget-wide v1, p0, Lokhttp3/internal/DiskLruCache;->size:J

    iget-wide v3, p0, Lokhttp3/internal/DiskLruCache;->maxSize:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_1c

    .line 654
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;

    .line 655
    .local v0, "toEvict":Lokhttp3/internal/DiskLruCache$Entry;
    invoke-direct {p0, v0}, Lokhttp3/internal/DiskLruCache;->removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z

    goto :goto_0

    .line 657
    .end local v0    # "toEvict":Lokhttp3/internal/DiskLruCache$Entry;
    :cond_1c
    return-void
.end method

.method private validateKey(Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 681
    sget-object v1, Lokhttp3/internal/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 682
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 683
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "keys must match regex [a-z0-9_-]{1,120}: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 686
    :cond_2b
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 636
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->closed:Z

    if-eqz v1, :cond_e

    .line 637
    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->closed:Z
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_47

    .line 650
    :goto_c
    monitor-exit p0

    return-void

    .line 641
    :cond_e
    :try_start_e
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    new-array v2, v2, [Lokhttp3/internal/DiskLruCache$Entry;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lokhttp3/internal/DiskLruCache$Entry;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_24
    if-ge v2, v3, :cond_38

    aget-object v0, v1, v2

    .line 642
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v4

    if-eqz v4, :cond_35

    .line 643
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/internal/DiskLruCache$Editor;->abort()V

    .line 641
    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 646
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :cond_38
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->trimToSize()V

    .line 647
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 648
    const/4 v1, 0x0

    iput-object v1, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    .line 649
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->closed:Z
    :try_end_46
    .catchall {:try_start_e .. :try_end_46} :catchall_47

    goto :goto_c

    .line 636
    :catchall_47
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public delete()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 664
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->close()V

    .line 665
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;

    invoke-interface {v0, v1}, Lokhttp3/internal/io/FileSystem;->deleteContents(Ljava/io/File;)V

    .line 666
    return-void
.end method

.method public edit(Ljava/lang/String;)Lokhttp3/internal/DiskLruCache$Editor;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 440
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lokhttp3/internal/DiskLruCache;->edit(Ljava/lang/String;J)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized evictAll()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 675
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    new-array v2, v2, [Lokhttp3/internal/DiskLruCache$Entry;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lokhttp3/internal/DiskLruCache$Entry;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_1a
    if-ge v2, v3, :cond_24

    aget-object v0, v1, v2

    .line 676
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    invoke-direct {p0, v0}, Lokhttp3/internal/DiskLruCache;->removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_26

    .line 675
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 678
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :cond_24
    monitor-exit p0

    return-void

    .line 673
    :catchall_26
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 627
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_13

    if-nez v0, :cond_7

    .line 632
    :goto_5
    monitor-exit p0

    return-void

    .line 629
    :cond_7
    :try_start_7
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->checkNotClosed()V

    .line 630
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->trimToSize()V

    .line 631
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_13

    goto :goto_5

    .line 627
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lokhttp3/internal/DiskLruCache$Snapshot;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 417
    monitor-enter p0

    :try_start_2
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 419
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->checkNotClosed()V

    .line 420
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 421
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;

    .line 422
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    if-eqz v0, :cond_1b

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v0}, Lokhttp3/internal/DiskLruCache$Entry;->access$800(Lokhttp3/internal/DiskLruCache$Entry;)Z
    :try_end_18
    .catchall {:try_start_2 .. :try_end_18} :catchall_51

    move-result v3

    if-nez v3, :cond_1e

    :cond_1b
    move-object v1, v2

    .line 433
    :cond_1c
    :goto_1c
    monitor-exit p0

    return-object v1

    .line 424
    :cond_1e
    :try_start_1e
    invoke-virtual {v0}, Lokhttp3/internal/DiskLruCache$Entry;->snapshot()Lokhttp3/internal/DiskLruCache$Snapshot;

    move-result-object v1

    .line 425
    .local v1, "snapshot":Lokhttp3/internal/DiskLruCache$Snapshot;
    if-nez v1, :cond_26

    move-object v1, v2

    goto :goto_1c

    .line 427
    :cond_26
    iget v2, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lokhttp3/internal/DiskLruCache;->redundantOpCount:I

    .line 428
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v3, "READ"

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    move-result-object v2

    invoke-interface {v2, p1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 429
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 430
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_50
    .catchall {:try_start_1e .. :try_end_50} :catchall_51

    goto :goto_1c

    .line 417
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    .end local v1    # "snapshot":Lokhttp3/internal/DiskLruCache$Snapshot;
    :catchall_51
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 476
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public declared-synchronized getMaxSize()J
    .registers 3

    .prologue
    .line 483
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lokhttp3/internal/DiskLruCache;->maxSize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized initialize()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    monitor-enter p0

    :try_start_1
    sget-boolean v1, Lokhttp3/internal/DiskLruCache;->$assertionsDisabled:Z

    if-nez v1, :cond_14

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    :catchall_11
    move-exception v1

    monitor-exit p0

    throw v1

    .line 199
    :cond_14
    :try_start_14
    iget-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z
    :try_end_16
    .catchall {:try_start_14 .. :try_end_16} :catchall_11

    if-eqz v1, :cond_1a

    .line 231
    :goto_18
    monitor-exit p0

    return-void

    .line 204
    :cond_1a
    :try_start_1a
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-interface {v1, v2}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 206
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v1, v2}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 207
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-interface {v1, v2}, Lokhttp3/internal/io/FileSystem;->delete(Ljava/io/File;)V

    .line 214
    :cond_35
    :goto_35
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v1, v2}, Lokhttp3/internal/io/FileSystem;->exists(Ljava/io/File;)Z
    :try_end_3c
    .catchall {:try_start_1a .. :try_end_3c} :catchall_11

    move-result v1

    if-eqz v1, :cond_80

    .line 216
    :try_start_3f
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->readJournal()V

    .line 217
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->processJournal()V

    .line 218
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_48} :catch_49
    .catchall {:try_start_3f .. :try_end_48} :catchall_11

    goto :goto_18

    .line 220
    :catch_49
    move-exception v0

    .line 221
    .local v0, "journalIsCorrupt":Ljava/io/IOException;
    :try_start_4a
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DiskLruCache "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->directory:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is corrupt: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 222
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 221
    invoke-virtual {v1, v2}, Lokhttp3/internal/Platform;->logW(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->delete()V

    .line 224
    const/4 v1, 0x0

    iput-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->closed:Z

    .line 228
    .end local v0    # "journalIsCorrupt":Ljava/io/IOException;
    :cond_80
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->rebuildJournal()V

    .line 230
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z

    goto :goto_18

    .line 209
    :cond_87
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    iget-object v3, p0, Lokhttp3/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-interface {v1, v2, v3}, Lokhttp3/internal/io/FileSystem;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_90
    .catchall {:try_start_4a .. :try_end_90} :catchall_11

    goto :goto_35
.end method

.method public declared-synchronized isClosed()Z
    .registers 2

    .prologue
    .line 616
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/String;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 583
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 585
    invoke-direct {p0}, Lokhttp3/internal/DiskLruCache;->checkNotClosed()V

    .line 586
    invoke-direct {p0, p1}, Lokhttp3/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 587
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lokhttp3/internal/DiskLruCache$Entry;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_1c

    .line 588
    .local v0, "entry":Lokhttp3/internal/DiskLruCache$Entry;
    if-nez v0, :cond_17

    const/4 v1, 0x0

    .line 589
    :goto_15
    monitor-exit p0

    return v1

    :cond_17
    :try_start_17
    invoke-direct {p0, v0}, Lokhttp3/internal/DiskLruCache;->removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_1c

    move-result v1

    goto :goto_15

    .line 583
    .end local v0    # "entry":Lokhttp3/internal/DiskLruCache$Entry;
    :catchall_1c
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setMaxSize(J)V
    .registers 5
    .param p1, "maxSize"    # J

    .prologue
    .line 491
    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lokhttp3/internal/DiskLruCache;->maxSize:J

    .line 492
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache;->initialized:Z

    if-eqz v0, :cond_e

    .line 493
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lokhttp3/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 495
    :cond_e
    monitor-exit p0

    return-void

    .line 491
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 503
    iget-wide v0, p0, Lokhttp3/internal/DiskLruCache;->size:J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-wide v0

    .line 502
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized snapshots()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lokhttp3/internal/DiskLruCache$Snapshot;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 704
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lokhttp3/internal/DiskLruCache;->initialize()V

    .line 705
    new-instance v0, Lokhttp3/internal/DiskLruCache$3;

    invoke-direct {v0, p0}, Lokhttp3/internal/DiskLruCache$3;-><init>(Lokhttp3/internal/DiskLruCache;)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 704
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method
