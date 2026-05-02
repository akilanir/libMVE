.class public final Lcom/jakewharton/disklrucache/DiskLruCache;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jakewharton/disklrucache/DiskLruCache$Entry;,
        Lcom/jakewharton/disklrucache/DiskLruCache$Editor;,
        Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
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

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private final cleanupCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final directory:Ljava/io/File;

.field final executorService:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final journalFile:Ljava/io/File;

.field private final journalFileBackup:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private journalWriter:Ljava/io/Writer;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/jakewharton/disklrucache/DiskLruCache$Entry;",
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
    const-string v0, "[a-z0-9_-]{1,64}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/jakewharton/disklrucache/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    .line 713
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache$2;

    invoke-direct {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$2;-><init>()V

    sput-object v0, Lcom/jakewharton/disklrucache/DiskLruCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-void
.end method

.method private constructor <init>(Ljava/io/File;IIJ)V
    .registers 13
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "valueCount"    # I
    .param p4, "maxSize"    # J

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput-wide v4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    .line 150
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v0, v1, v3, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 159
    iput-wide v4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->nextSequenceNumber:J

    .line 162
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 164
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache$1;

    invoke-direct {v0, p0}, Lcom/jakewharton/disklrucache/DiskLruCache$1;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    .line 181
    iput-object p1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    .line 182
    iput p2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->appVersion:I

    .line 183
    new-instance v0, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    .line 184
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    .line 185
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileBackup:Ljava/io/File;

    .line 186
    iput p3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    .line 187
    iput-wide p4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->maxSize:J

    .line 188
    return-void
.end method

.method static synthetic access$000(Lcom/jakewharton/disklrucache/DiskLruCache;)Ljava/io/Writer;
    .registers 2
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/jakewharton/disklrucache/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$1600(Lcom/jakewharton/disklrucache/DiskLruCache;Ljava/lang/String;J)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .registers 5
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/jakewharton/disklrucache/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-static {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/jakewharton/disklrucache/DiskLruCache;)I
    .registers 2
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;

    .prologue
    .line 88
    iget v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    return v0
.end method

.method static synthetic access$1900(Lcom/jakewharton/disklrucache/DiskLruCache;)Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$200(Lcom/jakewharton/disklrucache/DiskLruCache;)Z
    .registers 2
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000()Ljava/io/OutputStream;
    .registers 1

    .prologue
    .line 88
    sget-object v0, Lcom/jakewharton/disklrucache/DiskLruCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/jakewharton/disklrucache/DiskLruCache;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;Z)V
    .registers 3
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;
    .param p1, "x1"    # Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/jakewharton/disklrucache/DiskLruCache;->completeEdit(Lcom/jakewharton/disklrucache/DiskLruCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/jakewharton/disklrucache/DiskLruCache;)V
    .registers 1
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$402(Lcom/jakewharton/disklrucache/DiskLruCache;I)I
    .registers 2
    .param p0, "x0"    # Lcom/jakewharton/disklrucache/DiskLruCache;
    .param p1, "x1"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    return p1
.end method

.method private checkNotClosed()V
    .registers 3

    .prologue
    .line 613
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_c

    .line 614
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 616
    :cond_c
    return-void
.end method

.method private declared-synchronized completeEdit(Lcom/jakewharton/disklrucache/DiskLruCache$Editor;Z)V
    .registers 15
    .param p1, "editor"    # Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 509
    monitor-enter p0

    :try_start_1
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->entry:Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    invoke-static {p1}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->access$1400(Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    move-result-object v2

    .line 510
    .local v2, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v8

    if-eq v8, p1, :cond_14

    .line 511
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    .line 509
    .end local v2    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :catchall_11
    move-exception v8

    monitor-exit p0

    throw v8

    .line 515
    .restart local v2    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :cond_14
    if-eqz p2, :cond_57

    :try_start_16
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$600(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Z

    move-result v8

    if-nez v8, :cond_57

    .line 516
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    iget v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_57

    .line 517
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->written:[Z
    invoke-static {p1}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->access$1500(Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)[Z

    move-result-object v8

    aget-boolean v8, v8, v3

    if-nez v8, :cond_45

    .line 518
    invoke-virtual {p1}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->abort()V

    .line 519
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

    .line 521
    :cond_45
    invoke-virtual {v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_54

    .line 522
    invoke-virtual {p1}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->abort()V
    :try_end_52
    .catchall {:try_start_16 .. :try_end_52} :catchall_11

    .line 561
    :cond_52
    :goto_52
    monitor-exit p0

    return-void

    .line 516
    :cond_54
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 528
    .end local v3    # "i":I
    :cond_57
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_58
    :try_start_58
    iget v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v3, v8, :cond_8c

    .line 529
    invoke-virtual {v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v1

    .line 530
    .local v1, "dirty":Ljava/io/File;
    if-eqz p2, :cond_88

    .line 531
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_85

    .line 532
    invoke-virtual {v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v0

    .line 533
    .local v0, "clean":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 534
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v8

    aget-wide v6, v8, v3

    .line 535
    .local v6, "oldLength":J
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 536
    .local v4, "newLength":J
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v8

    aput-wide v4, v8, v3

    .line 537
    iget-wide v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    sub-long/2addr v8, v6

    add-long/2addr v8, v4

    iput-wide v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    .line 528
    .end local v0    # "clean":Ljava/io/File;
    .end local v4    # "newLength":J
    .end local v6    # "oldLength":J
    :cond_85
    :goto_85
    add-int/lit8 v3, v3, 0x1

    goto :goto_58

    .line 540
    :cond_88
    invoke-static {v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    goto :goto_85

    .line 544
    .end local v1    # "dirty":Ljava/io/File;
    :cond_8c
    iget v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    .line 545
    const/4 v8, 0x0

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v2, v8}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$702(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .line 546
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$600(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Z

    move-result v8

    or-int/2addr v8, p2

    if-eqz v8, :cond_f3

    .line 547
    const/4 v8, 0x1

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->readable:Z
    invoke-static {v2, v8}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$602(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Z)Z

    .line 548
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "CLEAN "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1100(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 549
    if-eqz p2, :cond_d7

    .line 550
    iget-wide v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->nextSequenceNumber:J

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v2, v8, v9}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1202(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;J)J

    .line 556
    :cond_d7
    :goto_d7
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v8}, Ljava/io/Writer;->flush()V

    .line 558
    iget-wide v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    iget-wide v10, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->maxSize:J

    cmp-long v8, v8, v10

    if-gtz v8, :cond_ea

    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->journalRebuildRequired()Z

    move-result v8

    if-eqz v8, :cond_52

    .line 559
    :cond_ea
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v9, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v8, v9}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    goto/16 :goto_52

    .line 553
    :cond_f3
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1100(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "REMOVE "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1100(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_11e
    .catchall {:try_start_58 .. :try_end_11e} :catchall_11

    goto :goto_d7
.end method

.method private static deleteIfExists(Ljava/io/File;)V
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_12

    .line 386
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 388
    :cond_12
    return-void
.end method

.method private declared-synchronized edit(Ljava/lang/String;J)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "expectedSequenceNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 454
    monitor-enter p0

    :try_start_2
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->checkNotClosed()V

    .line 455
    invoke-direct {p0, p1}, Lcom/jakewharton/disklrucache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 456
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 457
    .local v1, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_22

    if-eqz v1, :cond_20

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v1}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1200(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)J
    :try_end_1b
    .catchall {:try_start_2 .. :try_end_1b} :catchall_5c

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_22

    .line 474
    :cond_20
    :goto_20
    monitor-exit p0

    return-object v0

    .line 461
    :cond_22
    if-nez v1, :cond_5f

    .line 462
    :try_start_24
    new-instance v1, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .end local v1    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;Ljava/lang/String;Lcom/jakewharton/disklrucache/DiskLruCache$1;)V

    .line 463
    .restart local v1    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    :cond_2f
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$1;)V

    .line 469
    .local v0, "editor":Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$702(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .line 472
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DIRTY "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 473
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_5b
    .catchall {:try_start_24 .. :try_end_5b} :catchall_5c

    goto :goto_20

    .line 454
    .end local v0    # "editor":Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .end local v1    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :catchall_5c
    move-exception v2

    monitor-exit p0

    throw v2

    .line 464
    .restart local v1    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :cond_5f
    :try_start_5f
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v1}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_5c

    move-result-object v2

    if-eqz v2, :cond_2f

    goto :goto_20
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 665
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lcom/jakewharton/disklrucache/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-static {v0}, Lcom/jakewharton/disklrucache/Util;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private journalRebuildRequired()Z
    .registers 4

    .prologue
    .line 568
    const/16 v0, 0x7d0

    .line 569
    .local v0, "redundantOpCompactThreshold":I
    iget v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    const/16 v2, 0x7d0

    if-lt v1, v2, :cond_14

    iget v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

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

.method public static open(Ljava/io/File;IIJ)Lcom/jakewharton/disklrucache/DiskLruCache;
    .registers 15
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
    .line 201
    const-wide/16 v1, 0x0

    cmp-long v1, p3, v1

    if-gtz v1, :cond_e

    .line 202
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "maxSize <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_e
    if-gtz p2, :cond_18

    .line 205
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "valueCount <= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 209
    :cond_18
    new-instance v6, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v6, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 210
    .local v6, "backupFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_35

    .line 211
    new-instance v8, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v8, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 213
    .local v8, "journalFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_64

    .line 214
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 221
    .end local v8    # "journalFile":Ljava/io/File;
    :cond_35
    :goto_35
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/jakewharton/disklrucache/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 222
    .local v0, "cache":Lcom/jakewharton/disklrucache/DiskLruCache;
    iget-object v1, v0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_99

    .line 224
    :try_start_46
    invoke-direct {v0}, Lcom/jakewharton/disklrucache/DiskLruCache;->readJournal()V

    .line 225
    invoke-direct {v0}, Lcom/jakewharton/disklrucache/DiskLruCache;->processJournal()V

    .line 226
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, v0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    sget-object v4, Lcom/jakewharton/disklrucache/Util;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, v0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_62
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_62} :catch_69

    move-object v7, v0

    .line 244
    .end local v0    # "cache":Lcom/jakewharton/disklrucache/DiskLruCache;
    .local v7, "cache":Ljava/lang/Object;
    :goto_63
    return-object v7

    .line 216
    .end local v7    # "cache":Ljava/lang/Object;
    .restart local v8    # "journalFile":Ljava/io/File;
    :cond_64
    const/4 v1, 0x0

    invoke-static {v6, v8, v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    goto :goto_35

    .line 229
    .end local v8    # "journalFile":Ljava/io/File;
    .restart local v0    # "cache":Lcom/jakewharton/disklrucache/DiskLruCache;
    :catch_69
    move-exception v9

    .line 230
    .local v9, "journalIsCorrupt":Ljava/io/IOException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DiskLruCache "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is corrupt: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache;->delete()V

    .line 241
    .end local v9    # "journalIsCorrupt":Ljava/io/IOException;
    :cond_99
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 242
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache;

    .end local v0    # "cache":Lcom/jakewharton/disklrucache/DiskLruCache;
    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/jakewharton/disklrucache/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 243
    .restart local v0    # "cache":Lcom/jakewharton/disklrucache/DiskLruCache;
    invoke-direct {v0}, Lcom/jakewharton/disklrucache/DiskLruCache;->rebuildJournal()V

    move-object v7, v0

    .line 244
    .restart local v7    # "cache":Ljava/lang/Object;
    goto :goto_63
.end method

.method private processJournal()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 323
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v3}, Lcom/jakewharton/disklrucache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 324
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/jakewharton/disklrucache/DiskLruCache$Entry;>;"
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_52

    .line 325
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 326
    .local v0, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v3

    if-nez v3, :cond_34

    .line 327
    const/4 v2, 0x0

    .local v2, "t":I
    :goto_22
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_f

    .line 328
    iget-wide v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v5

    aget-wide v5, v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    .line 327
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 331
    .end local v2    # "t":I
    :cond_34
    const/4 v3, 0x0

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$702(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .line 332
    const/4 v2, 0x0

    .restart local v2    # "t":I
    :goto_39
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_4e

    .line 333
    invoke-virtual {v0, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/jakewharton/disklrucache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 334
    invoke-virtual {v0, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lcom/jakewharton/disklrucache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 332
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 336
    :cond_4e
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_f

    .line 339
    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .end local v2    # "t":I
    :cond_52
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
    .line 248
    new-instance v5, Lcom/jakewharton/disklrucache/StrictLineReader;

    new-instance v8, Ljava/io/FileInputStream;

    iget-object v9, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    sget-object v9, Lcom/jakewharton/disklrucache/Util;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v5, v8, v9}, Lcom/jakewharton/disklrucache/StrictLineReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 250
    .local v5, "reader":Lcom/jakewharton/disklrucache/StrictLineReader;
    :try_start_e
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 251
    .local v4, "magic":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .line 252
    .local v7, "version":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, "appVersionString":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 254
    .local v6, "valueCountString":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 255
    .local v1, "blank":Ljava/lang/String;
    const-string v8, "libcore.io.DiskLruCache"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_52

    const-string v8, "1"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_52

    iget v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->appVersion:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_52

    iget v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_52

    const-string v8, ""

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_94

    .line 260
    :cond_52
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
    :try_end_8f
    .catchall {:try_start_e .. :try_end_8f} :catchall_8f

    .line 275
    .end local v0    # "appVersionString":Ljava/lang/String;
    .end local v1    # "blank":Ljava/lang/String;
    .end local v4    # "magic":Ljava/lang/String;
    .end local v6    # "valueCountString":Ljava/lang/String;
    .end local v7    # "version":Ljava/lang/String;
    :catchall_8f
    move-exception v8

    invoke-static {v5}, Lcom/jakewharton/disklrucache/Util;->closeQuietly(Ljava/io/Closeable;)V

    throw v8

    .line 264
    .restart local v0    # "appVersionString":Ljava/lang/String;
    .restart local v1    # "blank":Ljava/lang/String;
    .restart local v4    # "magic":Ljava/lang/String;
    .restart local v6    # "valueCountString":Ljava/lang/String;
    .restart local v7    # "version":Ljava/lang/String;
    :cond_94
    const/4 v3, 0x0

    .line 267
    .local v3, "lineCount":I
    :goto_95
    :try_start_95
    invoke-virtual {v5}, Lcom/jakewharton/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/jakewharton/disklrucache/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_9c
    .catch Ljava/io/EOFException; {:try_start_95 .. :try_end_9c} :catch_9f
    .catchall {:try_start_95 .. :try_end_9c} :catchall_8f

    .line 268
    add-int/lit8 v3, v3, 0x1

    goto :goto_95

    .line 269
    :catch_9f
    move-exception v2

    .line 273
    .local v2, "endOfJournal":Ljava/io/EOFException;
    :try_start_a0
    iget-object v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v8}, Ljava/util/LinkedHashMap;->size()I

    move-result v8

    sub-int v8, v3, v8

    iput v8, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I
    :try_end_aa
    .catchall {:try_start_a0 .. :try_end_aa} :catchall_8f

    .line 275
    invoke-static {v5}, Lcom/jakewharton/disklrucache/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 277
    return-void
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

    .line 280
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 281
    .local v1, "firstSpace":I
    if-ne v1, v7, :cond_23

    .line 282
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

    .line 285
    :cond_23
    add-int/lit8 v3, v1, 0x1

    .line 286
    .local v3, "keyBegin":I
    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 288
    .local v5, "secondSpace":I
    if-ne v5, v7, :cond_45

    .line 289
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 290
    .local v2, "key":Ljava/lang/String;
    const-string v6, "REMOVE"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v1, v6, :cond_49

    const-string v6, "REMOVE"

    invoke-virtual {p1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 291
    iget-object v6, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    :cond_44
    :goto_44
    return-void

    .line 295
    .end local v2    # "key":Ljava/lang/String;
    :cond_45
    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 298
    .restart local v2    # "key":Ljava/lang/String;
    :cond_49
    iget-object v6, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 299
    .local v0, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    if-nez v0, :cond_5d

    .line 300
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    invoke-direct {v0, p0, v2, v8}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;Ljava/lang/String;Lcom/jakewharton/disklrucache/DiskLruCache$1;)V

    .line 301
    .restart local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    iget-object v6, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v2, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
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

    .line 305
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 306
    .local v4, "parts":[Ljava/lang/String;
    const/4 v6, 0x1

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->readable:Z
    invoke-static {v0, v6}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$602(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Z)Z

    .line 307
    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0, v8}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$702(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .line 308
    # invokes: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V
    invoke-static {v0, v4}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$800(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;[Ljava/lang/String;)V

    goto :goto_44

    .line 309
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

    .line 310
    new-instance v6, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    invoke-direct {v6, p0, v0, v8}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$1;)V

    # setter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0, v6}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$702(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    goto :goto_44

    .line 311
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

    .line 314
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
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-eqz v3, :cond_a

    .line 347
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 350
    :cond_a
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v5, Lcom/jakewharton/disklrucache/Util;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_94

    .line 353
    .local v2, "writer":Ljava/io/Writer;
    :try_start_1d
    const-string v3, "libcore.io.DiskLruCache"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 354
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 355
    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 356
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 357
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->appVersion:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 358
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 359
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 360
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 361
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 363
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_5c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 364
    .local v0, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v3

    if-eqz v3, :cond_97

    .line 365
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DIRTY "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1100(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_8e
    .catchall {:try_start_1d .. :try_end_8e} :catchall_8f

    goto :goto_5c

    .line 371
    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_8f
    move-exception v3

    :try_start_90
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    throw v3
    :try_end_94
    .catchall {:try_start_90 .. :try_end_94} :catchall_94

    .line 346
    .end local v2    # "writer":Ljava/io/Writer;
    :catchall_94
    move-exception v3

    monitor-exit p0

    throw v3

    .line 367
    .restart local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "writer":Ljava/io/Writer;
    :cond_97
    :try_start_97
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CLEAN "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1100(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_bf
    .catchall {:try_start_97 .. :try_end_bf} :catchall_8f

    goto :goto_5c

    .line 371
    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :cond_c0
    :try_start_c0
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 374
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_d3

    .line 375
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    iget-object v4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileBackup:Ljava/io/File;

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Lcom/jakewharton/disklrucache/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 377
    :cond_d3
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileTmp:Ljava/io/File;

    iget-object v4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/jakewharton/disklrucache/DiskLruCache;->renameTo(Ljava/io/File;Ljava/io/File;Z)V

    .line 378
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 380
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    new-instance v5, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v7, 0x1

    invoke-direct {v5, v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    sget-object v6, Lcom/jakewharton/disklrucache/Util;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_f6
    .catchall {:try_start_c0 .. :try_end_f6} :catchall_94

    .line 382
    monitor-exit p0

    return-void
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
    .line 391
    if-eqz p2, :cond_5

    .line 392
    invoke-static {p1}, Lcom/jakewharton/disklrucache/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 394
    :cond_5
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 395
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 397
    :cond_11
    return-void
.end method

.method private trimToSize()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 641
    :goto_0
    iget-wide v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    iget-wide v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->maxSize:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_22

    .line 642
    iget-object v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 643
    .local v0, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/jakewharton/disklrucache/DiskLruCache$Entry;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->remove(Ljava/lang/String;)Z

    goto :goto_0

    .line 645
    .end local v0    # "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/jakewharton/disklrucache/DiskLruCache$Entry;>;"
    :cond_22
    return-void
.end method

.method private validateKey(Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 658
    sget-object v1, Lcom/jakewharton/disklrucache/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 659
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 660
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "keys must match regex [a-z0-9_-]{1,64}: \""

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

    .line 662
    :cond_2b
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 627
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_30

    if-nez v2, :cond_7

    .line 638
    :goto_5
    monitor-exit p0

    return-void

    .line 630
    :cond_7
    :try_start_7
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_16
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 631
    .local v0, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 632
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->abort()V
    :try_end_2f
    .catchall {:try_start_7 .. :try_end_2f} :catchall_30

    goto :goto_16

    .line 627
    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_30
    move-exception v2

    monitor-exit p0

    throw v2

    .line 635
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_33
    :try_start_33
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->trimToSize()V

    .line 636
    iget-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 637
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_3e
    .catchall {:try_start_33 .. :try_end_3e} :catchall_30

    goto :goto_5
.end method

.method public delete()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 653
    invoke-virtual {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->close()V

    .line 654
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/jakewharton/disklrucache/Util;->deleteContents(Ljava/io/File;)V

    .line 655
    return-void
.end method

.method public edit(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->checkNotClosed()V

    .line 621
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->trimToSize()V

    .line 622
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 623
    monitor-exit p0

    return-void

    .line 620
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    .registers 13
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 405
    monitor-enter p0

    :try_start_2
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->checkNotClosed()V

    .line 406
    invoke-direct {p0, p1}, Lcom/jakewharton/disklrucache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 407
    iget-object v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    :try_end_10
    .catchall {:try_start_2 .. :try_end_10} :catchall_85

    .line 408
    .local v9, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    if-nez v9, :cond_14

    .line 442
    :cond_12
    :goto_12
    monitor-exit p0

    return-object v0

    .line 412
    :cond_14
    :try_start_14
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->readable:Z
    invoke-static {v9}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$600(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 419
    iget v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    new-array v5, v1, [Ljava/io/InputStream;
    :try_end_1e
    .catchall {:try_start_14 .. :try_end_1e} :catchall_85

    .line 421
    .local v5, "ins":[Ljava/io/InputStream;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1f
    :try_start_1f
    iget v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v10, v1, :cond_43

    .line 422
    new-instance v1, Ljava/io/FileInputStream;

    invoke-virtual {v9, v10}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    aput-object v1, v5, v10
    :try_end_2e
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_2e} :catch_31
    .catchall {:try_start_1f .. :try_end_2e} :catchall_85

    .line 421
    add-int/lit8 v10, v10, 0x1

    goto :goto_1f

    .line 424
    :catch_31
    move-exception v8

    .line 426
    .local v8, "e":Ljava/io/FileNotFoundException;
    const/4 v10, 0x0

    :goto_33
    :try_start_33
    iget v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v10, v1, :cond_12

    .line 427
    aget-object v1, v5, v10

    if-eqz v1, :cond_12

    .line 428
    aget-object v1, v5, v10

    invoke-static {v1}, Lcom/jakewharton/disklrucache/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 426
    add-int/lit8 v10, v10, 0x1

    goto :goto_33

    .line 436
    .end local v8    # "e":Ljava/io/FileNotFoundException;
    :cond_43
    iget v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    .line 437
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "READ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 438
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    if-eqz v0, :cond_74

    .line 439
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 442
    :cond_74
    new-instance v0, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v9}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1200(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)J

    move-result-wide v3

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v9}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v6

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/jakewharton/disklrucache/DiskLruCache$1;)V
    :try_end_84
    .catchall {:try_start_33 .. :try_end_84} :catchall_85

    goto :goto_12

    .line 405
    .end local v5    # "ins":[Ljava/io/InputStream;
    .end local v9    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .end local v10    # "i":I
    :catchall_85
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public declared-synchronized getMaxSize()J
    .registers 3

    .prologue
    .line 487
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->maxSize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isClosed()Z
    .registers 2

    .prologue
    .line 609
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/String;)Z
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 580
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->checkNotClosed()V

    .line 581
    invoke-direct {p0, p1}, Lcom/jakewharton/disklrucache/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 582
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;

    .line 583
    .local v0, "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    if-eqz v0, :cond_17

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->currentEditor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$700(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_48

    move-result-object v3

    if-eqz v3, :cond_1a

    .line 584
    :cond_17
    const/4 v3, 0x0

    .line 604
    :goto_18
    monitor-exit p0

    return v3

    .line 587
    :cond_1a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    :try_start_1b
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_61

    .line 588
    invoke-virtual {v0, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v1

    .line 589
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_4b

    .line 590
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "failed to delete "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_48
    .catchall {:try_start_1b .. :try_end_48} :catchall_48

    .line 580
    .end local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "i":I
    :catchall_48
    move-exception v3

    monitor-exit p0

    throw v3

    .line 592
    .restart local v0    # "entry":Lcom/jakewharton/disklrucache/DiskLruCache$Entry;
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "i":I
    :cond_4b
    :try_start_4b
    iget-wide v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v5

    aget-wide v5, v5, v2

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J

    .line 593
    # getter for: Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Entry;->access$1000(Lcom/jakewharton/disklrucache/DiskLruCache$Entry;)[J

    move-result-object v3

    const-wide/16 v4, 0x0

    aput-wide v4, v3, v2

    .line 587
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 596
    .end local v1    # "file":Ljava/io/File;
    :cond_61
    iget v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->redundantOpCount:I

    .line 597
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "REMOVE "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 598
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    invoke-direct {p0}, Lcom/jakewharton/disklrucache/DiskLruCache;->journalRebuildRequired()Z

    move-result v3

    if-eqz v3, :cond_97

    .line 601
    iget-object v3, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v4, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_97
    .catchall {:try_start_4b .. :try_end_97} :catchall_48

    .line 604
    :cond_97
    const/4 v3, 0x1

    goto :goto_18
.end method

.method public declared-synchronized setMaxSize(J)V
    .registers 5
    .param p1, "maxSize"    # J

    .prologue
    .line 495
    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->maxSize:J

    .line 496
    iget-object v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 497
    monitor-exit p0

    return-void

    .line 495
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()J
    .registers 3

    .prologue
    .line 505
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/jakewharton/disklrucache/DiskLruCache;->size:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
