.class public final Lcom/squareup/okhttp/internal/DiskLruCache;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/DiskLruCache$Entry;,
        Lcom/squareup/okhttp/internal/DiskLruCache$Editor;,
        Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    }
.end annotation


# static fields
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

.field private final directory:Ljava/io/File;

.field private final executor:Ljava/util/concurrent/Executor;

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
            "Lcom/squareup/okhttp/internal/DiskLruCache$Entry;",
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
    .line 95
    const-string v0, "[a-z0-9_-]{1,120}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    .line 794
    new-instance v0, Lcom/squareup/okhttp/internal/DiskLruCache$3;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$3;-><init>()V

    sput-object v0, Lcom/squareup/okhttp/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;

    return-void
.end method

.method constructor <init>(Ljava/io/File;IIJLjava/util/concurrent/Executor;)V
    .registers 13
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "valueCount"    # I
    .param p4, "maxSize"    # J
    .param p6, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    const-wide/16 v4, 0x0

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-wide v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    .line 150
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 158
    iput-wide v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->nextSequenceNumber:J

    .line 162
    new-instance v0, Lcom/squareup/okhttp/internal/DiskLruCache$1;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/internal/DiskLruCache$1;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    .line 182
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    .line 183
    iput p2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->appVersion:I

    .line 184
    new-instance v0, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    .line 185
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    .line 186
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    .line 187
    iput p3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    .line 188
    iput-wide p4, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->maxSize:J

    .line 189
    iput-object p6, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    .line 190
    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/internal/DiskLruCache;)Lokio/BufferedSink;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$1800(Lcom/squareup/okhttp/internal/DiskLruCache;)Ljava/util/LinkedHashMap;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/DiskLruCache;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .registers 5
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/okhttp/internal/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2100(Lokio/Source;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-static {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->sourceToString(Lokio/Source;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2200(Lcom/squareup/okhttp/internal/DiskLruCache;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 88
    iget v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    return v0
.end method

.method static synthetic access$2300(Lcom/squareup/okhttp/internal/DiskLruCache;)Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$2400()Lokio/Sink;
    .registers 1

    .prologue
    .line 88
    sget-object v0, Lcom/squareup/okhttp/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p1, "x1"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p1, "x1"    # Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/internal/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$402(Lcom/squareup/okhttp/internal/DiskLruCache;I)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p1, "x1"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    return p1
.end method

.method private checkNotClosed()V
    .registers 3

    .prologue
    .line 607
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    if-nez v0, :cond_c

    .line 608
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 610
    :cond_c
    return-void
.end method

.method private declared-synchronized completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    .registers 15
    .param p1, "editor"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 494
    monitor-enter p0

    :try_start_1
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1500(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    move-result-object v2

    .line 495
    .local v2, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v8

    if-eq v8, p1, :cond_14

    .line 496
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    .line 494
    .end local v2    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :catchall_11
    move-exception v8

    monitor-exit p0

    throw v8

    .line 500
    .restart local v2    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_14
    if-eqz p2, :cond_59

    :try_start_16
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v8

    if-nez v8, :cond_59

    .line 501
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    iget v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_59

    .line 502
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1600(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)[Z

    move-result-object v8

    aget-boolean v8, v8, v3

    if-nez v8, :cond_45

    .line 503
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->abort()V

    .line 504
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

    .line 506
    :cond_45
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1200(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v8

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_56

    .line 507
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->abort()V
    :try_end_54
    .catchall {:try_start_16 .. :try_end_54} :catchall_11

    .line 551
    :cond_54
    :goto_54
    monitor-exit p0

    return-void

    .line 501
    :cond_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 513
    .end local v3    # "i":I
    :cond_59
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_5a
    :try_start_5a
    iget v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_92

    .line 514
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1200(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v8

    aget-object v1, v8, v3

    .line 515
    .local v1, "dirty":Ljava/io/File;
    if-eqz p2, :cond_8e

    .line 516
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_8b

    .line 517
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1100(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v8

    aget-object v0, v8, v3

    .line 518
    .local v0, "clean":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 519
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1000(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J

    move-result-object v8

    aget-wide v6, v8, v3

    .line 520
    .local v6, "oldLength":J
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 521
    .local v4, "newLength":J
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1000(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J

    move-result-object v8

    aput-wide v4, v8, v3

    .line 522
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    sub-long/2addr v8, v6

    add-long/2addr v8, v4

    iput-wide v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    .line 513
    .end local v0    # "clean":Ljava/io/File;
    .end local v4    # "newLength":J
    .end local v6    # "oldLength":J
    :cond_8b
    :goto_8b
    add-int/lit8 v3, v3, 0x1

    goto :goto_5a

    .line 525
    :cond_8e
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    goto :goto_8b

    .line 529
    .end local v1    # "dirty":Ljava/io/File;
    :cond_92
    iget v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    .line 530
    const/4 v8, 0x0

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v2, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$702(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .line 531
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v8

    or-int/2addr v8, p2

    if-eqz v8, :cond_f1

    .line 532
    const/4 v8, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v2, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$602(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Z)Z

    .line 533
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v9, "CLEAN"

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v8

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 534
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 535
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-virtual {v2, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->writeLengths(Lokio/BufferedSink;)V

    .line 536
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const/16 v9, 0xa

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 537
    if-eqz p2, :cond_d5

    .line 538
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->nextSequenceNumber:J

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v2, v8, v9}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1402(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;J)J

    .line 546
    :cond_d5
    :goto_d5
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v8}, Lokio/BufferedSink;->flush()V

    .line 548
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->maxSize:J

    cmp-long v8, v8, v10

    if-gtz v8, :cond_e8

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v8

    if-eqz v8, :cond_54

    .line 549
    :cond_e8
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v8, v9}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_54

    .line 541
    :cond_f1
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v9, "REMOVE"

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v8

    const/16 v9, 0x20

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 543
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 544
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const/16 v9, 0xa

    invoke-interface {v8, v9}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_117
    .catchall {:try_start_5a .. :try_end_117} :catchall_11

    goto :goto_d5
.end method

.method private static deleteIfExists(Ljava/io/File;)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_25

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_25

    .line 394
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "failed to delete "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 396
    :cond_25
    return-void
.end method

.method private declared-synchronized edit(Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
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

    .line 439
    monitor-enter p0

    :try_start_2
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->checkNotClosed()V

    .line 440
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 441
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 442
    .local v1, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_22

    if-eqz v1, :cond_20

    .line 443
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1400(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)J
    :try_end_1b
    .catchall {:try_start_2 .. :try_end_1b} :catchall_55

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_22

    .line 459
    :cond_20
    :goto_20
    monitor-exit p0

    return-object v0

    .line 446
    :cond_22
    if-nez v1, :cond_58

    .line 447
    :try_start_24
    new-instance v1, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .end local v1    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;Lcom/squareup/okhttp/internal/DiskLruCache$1;)V

    .line 448
    .restart local v1    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    :cond_2f
    new-instance v0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$1;)V

    .line 454
    .local v0, "editor":Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$702(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .line 457
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

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

    .line 458
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v2}, Lokio/BufferedSink;->flush()V
    :try_end_54
    .catchall {:try_start_24 .. :try_end_54} :catchall_55

    goto :goto_20

    .line 439
    .end local v0    # "editor":Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .end local v1    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :catchall_55
    move-exception v2

    monitor-exit p0

    throw v2

    .line 449
    .restart local v1    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_58
    :try_start_58
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_55

    move-result-object v2

    if-eqz v2, :cond_2f

    goto :goto_20
.end method

.method private journalRebuildRequired()Z
    .registers 4

    .prologue
    .line 558
    const/16 v0, 0x7d0

    .line 559
    .local v0, "redundantOpCompactThreshold":I
    iget v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_14

    iget v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 560
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

.method public static open(Ljava/io/File;IIJ)Lcom/squareup/okhttp/internal/DiskLruCache;
    .registers 13
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "appVersion"    # I
    .param p2, "valueCount"    # I
    .param p3, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 232
    const-wide/16 v3, 0x0

    cmp-long v3, p3, v3

    if-gtz v3, :cond_f

    .line 233
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "maxSize <= 0"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 235
    :cond_f
    if-gtz p2, :cond_19

    .line 236
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "valueCount <= 0"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 240
    :cond_19
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v7, "OkHttp DiskLruCache"

    .line 241
    invoke-static {v7, v2}, Lcom/squareup/okhttp/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 243
    .local v0, "executor":Ljava/util/concurrent/Executor;
    new-instance v1, Lcom/squareup/okhttp/internal/DiskLruCache;

    move-object v2, p0

    move v3, p1

    move v4, p2

    move-wide v5, p3

    move-object v7, v0

    invoke-direct/range {v1 .. v7}, Lcom/squareup/okhttp/internal/DiskLruCache;-><init>(Ljava/io/File;IIJLjava/util/concurrent/Executor;)V

    .line 244
    .local v1, "cache":Lcom/squareup/okhttp/internal/DiskLruCache;
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->initialize()V

    .line 245
    return-object v1
.end method

.method private processJournal()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 332
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/squareup/okhttp/internal/DiskLruCache$Entry;>;"
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_56

    .line 333
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 334
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v3

    if-nez v3, :cond_34

    .line 335
    const/4 v2, 0x0

    .local v2, "t":I
    :goto_22
    iget v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_f

    .line 336
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1000(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J

    move-result-object v5

    aget-wide v5, v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    .line 335
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 339
    .end local v2    # "t":I
    :cond_34
    const/4 v3, 0x0

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$702(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .line 340
    const/4 v2, 0x0

    .restart local v2    # "t":I
    :goto_39
    iget v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_52

    .line 341
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1100(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v3

    aget-object v3, v3, v2

    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 342
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1200(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v3

    aget-object v3, v3, v2

    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 340
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 344
    :cond_52
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_f

    .line 347
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .end local v2    # "t":I
    :cond_56
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
    .line 249
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-static {v8}, Lokio/Okio;->source(Ljava/io/File;)Lokio/Source;

    move-result-object v8

    invoke-static {v8}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v5

    .line 251
    .local v5, "source":Lokio/BufferedSource;
    :try_start_a
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "magic":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v7

    .line 253
    .local v7, "version":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "appVersionString":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v6

    .line 255
    .local v6, "valueCountString":Ljava/lang/String;
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    .line 256
    .local v1, "blank":Ljava/lang/String;
    const-string v8, "libcore.io.DiskLruCache"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4e

    const-string v8, "1"

    .line 257
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4e

    iget v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->appVersion:I

    .line 258
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4e

    iget v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    .line 259
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4e

    const-string v8, ""

    .line 260
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_90

    .line 261
    :cond_4e
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
    :try_end_8b
    .catchall {:try_start_a .. :try_end_8b} :catchall_8b

    .line 283
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v4    # "magic":Ljava/lang/String;
    .end local v6    # "valueCountString":Ljava/lang/String;
    .end local v7    # "version":Ljava/lang/String;
    :catchall_8b
    move-exception v8

    invoke-static {v5}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v8

    .line 265
    .restart local v0    # "appVersionString":Ljava/lang/String;
    .restart local v1    # "blank":Ljava/lang/String;
    .restart local v4    # "magic":Ljava/lang/String;
    .restart local v6    # "valueCountString":Ljava/lang/String;
    .restart local v7    # "version":Ljava/lang/String;
    :cond_90
    const/4 v3, 0x0

    .line 268
    .local v3, "lineCount":I
    :goto_91
    :try_start_91
    invoke-interface {v5}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/squareup/okhttp/internal/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_98
    .catch Ljava/io/EOFException; {:try_start_91 .. :try_end_98} :catch_9b
    .catchall {:try_start_91 .. :try_end_98} :catchall_8b

    .line 269
    add-int/lit8 v3, v3, 0x1

    goto :goto_91

    .line 270
    :catch_9b
    move-exception v2

    .line 274
    .local v2, "endOfJournal":Ljava/io/EOFException;
    :try_start_9c
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->size()I

    move-result v8

    sub-int v8, v3, v8

    iput v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    .line 277
    invoke-interface {v5}, Lokio/BufferedSource;->exhausted()Z

    move-result v8

    if-nez v8, :cond_b3

    .line 278
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->rebuildJournal()V
    :try_end_af
    .catchall {:try_start_9c .. :try_end_af} :catchall_8b

    .line 283
    :goto_af
    invoke-static {v5}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 285
    return-void

    .line 280
    :cond_b3
    :try_start_b3
    iget-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-static {v8}, Lokio/Okio;->appendingSink(Ljava/io/File;)Lokio/Sink;

    move-result-object v8

    invoke-static {v8}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v8

    iput-object v8, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    :try_end_bf
    .catchall {:try_start_b3 .. :try_end_bf} :catchall_8b

    goto :goto_af
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

    .line 288
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 289
    .local v1, "firstSpace":I
    if-ne v1, v7, :cond_23

    .line 290
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

    .line 293
    :cond_23
    add-int/lit8 v3, v1, 0x1

    .line 294
    .local v3, "keyBegin":I
    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 296
    .local v5, "secondSpace":I
    if-ne v5, v7, :cond_45

    .line 297
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 298
    .local v2, "key":Ljava/lang/String;
    const-string v6, "REMOVE"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_49

    const-string v6, "REMOVE"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 299
    iget-object v6, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    :cond_44
    :goto_44
    return-void

    .line 303
    .end local v2    # "key":Ljava/lang/String;
    :cond_45
    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 306
    .restart local v2    # "key":Ljava/lang/String;
    :cond_49
    iget-object v6, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 307
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    if-nez v0, :cond_5d

    .line 308
    new-instance v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    invoke-direct {v0, p0, v2, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;Lcom/squareup/okhttp/internal/DiskLruCache$1;)V

    .line 309
    .restart local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    iget-object v6, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
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

    .line 313
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 314
    .local v4, "parts":[Ljava/lang/String;
    const/4 v6, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v0, v6}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$602(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Z)Z

    .line 315
    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$702(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .line 316
    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V
    invoke-static {v0, v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$800(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;[Ljava/lang/String;)V

    goto :goto_44

    .line 317
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

    .line 318
    new-instance v6, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    invoke-direct {v6, p0, v0, v8}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$1;)V

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0, v6}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$702(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    goto :goto_44

    .line 319
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

    .line 322
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
    .line 354
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    if-eqz v2, :cond_a

    .line 355
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v2}, Lokio/BufferedSink;->close()V

    .line 358
    :cond_a
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v2}, Lokio/Okio;->sink(Ljava/io/File;)Lokio/Sink;

    move-result-object v2

    invoke-static {v2}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_86

    move-result-object v1

    .line 360
    .local v1, "writer":Lokio/BufferedSink;
    :try_start_14
    const-string v2, "libcore.io.DiskLruCache"

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 361
    const-string v2, "1"

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 362
    iget v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->appVersion:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 363
    iget v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 364
    const/16 v2, 0xa

    invoke-interface {v1, v2}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 366
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_57
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 367
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eqz v3, :cond_89

    .line 368
    const-string v3, "DIRTY"

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v3

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 369
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 370
    const/16 v3, 0xa

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_80
    .catchall {:try_start_14 .. :try_end_80} :catchall_81

    goto :goto_57

    .line 379
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :catchall_81
    move-exception v2

    :try_start_82
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    throw v2
    :try_end_86
    .catchall {:try_start_82 .. :try_end_86} :catchall_86

    .line 354
    .end local v1    # "writer":Lokio/BufferedSink;
    :catchall_86
    move-exception v2

    monitor-exit p0

    throw v2

    .line 372
    .restart local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .restart local v1    # "writer":Lokio/BufferedSink;
    :cond_89
    :try_start_89
    const-string v3, "CLEAN"

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v3

    const/16 v4, 0x20

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 373
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 374
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->writeLengths(Lokio/BufferedSink;)V

    .line 375
    const/16 v3, 0xa

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_a3
    .catchall {:try_start_89 .. :try_end_a3} :catchall_81

    goto :goto_57

    .line 379
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_a4
    :try_start_a4
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 382
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_b7

    .line 383
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/squareup/okhttp/internal/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 385
    :cond_b7
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileTmp:Ljava/io/File;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lcom/squareup/okhttp/internal/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 386
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 388
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-static {v2}, Lokio/Okio;->appendingSink(Ljava/io/File;)Lokio/Sink;

    move-result-object v2

    invoke-static {v2}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    :try_end_d0
    .catchall {:try_start_a4 .. :try_end_d0} :catchall_86

    .line 389
    monitor-exit p0

    return-void
.end method

.method private removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    .registers 9
    .param p1, "entry"    # Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 579
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 580
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v2

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v2, v6}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1702(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z

    .line 583
    :cond_e
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I

    if-ge v1, v2, :cond_32

    .line 584
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1100(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v2

    aget-object v0, v2, v1

    .line 585
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 586
    iget-wide v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1000(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J

    move-result-object v4

    aget-wide v4, v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    .line 587
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->lengths:[J
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1000(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J

    move-result-object v2

    const-wide/16 v3, 0x0

    aput-wide v3, v2, v1

    .line 583
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 590
    .end local v0    # "file":Ljava/io/File;
    :cond_32
    iget v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    .line 591
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    const-string v3, "REMOVE"

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0x20

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    move-result-object v2

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v2

    const/16 v3, 0xa

    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 592
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v2

    if-eqz v2, :cond_69

    .line 595
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 598
    :cond_69
    return v6
.end method

.method private static renameTo(Ljava/io/File;Ljava/io/File;Z)V
    .registers 4
    .param p0, "from"    # Ljava/io/File;
    .param p1, "to"    # Ljava/io/File;
    .param p2, "deleteDestination"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 399
    if-eqz p2, :cond_5

    .line 400
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 402
    :cond_5
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 403
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 405
    :cond_11
    return-void
.end method

.method private static sourceToString(Lokio/Source;)Ljava/lang/String;
    .registers 2
    .param p0, "in"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    :try_start_0
    invoke-static {p0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSource;->readUtf8()Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_0 .. :try_end_7} :catchall_c

    move-result-object v0

    .line 675
    invoke-static {p0}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    return-object v0

    :catchall_c
    move-exception v0

    invoke-static {p0}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v0
.end method

.method private trimToSize()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 636
    :goto_0
    iget-wide v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J

    iget-wide v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->maxSize:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_1c

    .line 637
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 638
    .local v0, "toEvict":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    goto :goto_0

    .line 640
    .end local v0    # "toEvict":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_1c
    return-void
.end method

.method private validateKey(Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 664
    sget-object v1, Lcom/squareup/okhttp/internal/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 665
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 666
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

    .line 669
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
    .line 621
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_3d

    if-nez v1, :cond_7

    .line 633
    :goto_5
    monitor-exit p0

    return-void

    .line 625
    :cond_7
    :try_start_7
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    new-array v2, v2, [Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_1d
    if-ge v2, v3, :cond_31

    aget-object v0, v1, v2

    .line 626
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v4

    if-eqz v4, :cond_2e

    .line 627
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->abort()V

    .line 625
    :cond_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 630
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_31
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->trimToSize()V

    .line 631
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 632
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    :try_end_3c
    .catchall {:try_start_7 .. :try_end_3c} :catchall_3d

    goto :goto_5

    .line 621
    :catchall_3d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public delete()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 648
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->close()V

    .line 649
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->deleteContents(Ljava/io/File;)V

    .line 650
    return-void
.end method

.method public edit(Ljava/lang/String;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 435
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

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
    .line 658
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    new-array v2, v2, [Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_17
    if-ge v2, v3, :cond_21

    aget-object v0, v1, v2

    .line 659
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_23

    .line 658
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 661
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :cond_21
    monitor-exit p0

    return-void

    .line 658
    :catchall_23
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
    .line 614
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->checkNotClosed()V

    .line 615
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->trimToSize()V

    .line 616
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 617
    monitor-exit p0

    return-void

    .line 614
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 413
    monitor-enter p0

    :try_start_2
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->checkNotClosed()V

    .line 414
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 415
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 416
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    if-eqz v0, :cond_18

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    :try_end_15
    .catchall {:try_start_2 .. :try_end_15} :catchall_4e

    move-result v3

    if-nez v3, :cond_1b

    :cond_18
    move-object v1, v2

    .line 427
    :cond_19
    :goto_19
    monitor-exit p0

    return-object v1

    .line 418
    :cond_1b
    :try_start_1b
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->snapshot()Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    move-result-object v1

    .line 419
    .local v1, "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    if-nez v1, :cond_23

    move-object v1, v2

    goto :goto_19

    .line 421
    :cond_23
    iget v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I

    .line 422
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

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

    .line 423
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 424
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_4d
    .catchall {:try_start_1b .. :try_end_4d} :catchall_4e

    goto :goto_19

    .line 413
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .end local v1    # "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    :catchall_4e
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public declared-synchronized getMaxSize()J
    .registers 3

    .prologue
    .line 472
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->maxSize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method initialize()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 197
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 198
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 205
    :cond_15
    :goto_15
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 207
    :try_start_1d
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->readJournal()V

    .line 208
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->processJournal()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_23} :catch_2d

    .line 219
    :goto_23
    return-void

    .line 200
    :cond_24
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFileBackup:Ljava/io/File;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    goto :goto_15

    .line 210
    :catch_2d
    move-exception v0

    .line 211
    .local v0, "journalIsCorrupt":Ljava/io/IOException;
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DiskLruCache "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is corrupt: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 212
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 211
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 213
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->delete()V

    .line 217
    .end local v0    # "journalIsCorrupt":Ljava/io/IOException;
    :cond_61
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 218
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->rebuildJournal()V

    goto :goto_23
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 603
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
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
    .line 571
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/DiskLruCache;->checkNotClosed()V

    .line 572
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 573
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_19

    .line 574
    .local v0, "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    if-nez v0, :cond_14

    const/4 v1, 0x0

    .line 575
    :goto_12
    monitor-exit p0

    return v1

    :cond_14
    :try_start_14
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_19

    move-result v1

    goto :goto_12

    .line 571
    .end local v0    # "entry":Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    :catchall_19
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setMaxSize(J)V
    .registers 5
    .param p1, "maxSize"    # J

    .prologue
    .line 480
    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->maxSize:J

    .line 481
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->executor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->cleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 482
    monitor-exit p0

    return-void

    .line 480
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()J
    .registers 3

    .prologue
    .line 490
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache;->size:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
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
            "Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;",
            ">;"
        }
    .end annotation

    .prologue
    .line 695
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/squareup/okhttp/internal/DiskLruCache$2;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/internal/DiskLruCache$2;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
