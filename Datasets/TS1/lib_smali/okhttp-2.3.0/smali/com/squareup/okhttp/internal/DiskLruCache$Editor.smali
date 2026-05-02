.class public final Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)V
    .registers 4
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p2, "entry"    # Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .prologue
    .line 833
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 834
    iput-object p2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 835
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {p2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$800(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    :goto_e
    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    .line 836
    return-void

    .line 835
    :cond_11
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2300(Lcom/squareup/okhttp/internal/DiskLruCache;)I

    move-result v0

    new-array v0, v0, [Z

    goto :goto_e
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;Lcom/squareup/okhttp/internal/DiskLruCache$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .param p3, "x2"    # Lcom/squareup/okhttp/internal/DiskLruCache$1;

    .prologue
    .line 827
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .prologue
    .line 827
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)[Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .prologue
    .line 827
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    return-object v0
.end method

.method static synthetic access$1902(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .param p1, "x1"    # Z

    .prologue
    .line 827
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z

    return p1
.end method


# virtual methods
.method public abort()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 911
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 912
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    .line 913
    monitor-exit v1

    .line 914
    return-void

    .line 913
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public abortUnlessCommitted()V
    .registers 4

    .prologue
    .line 917
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 918
    :try_start_3
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->committed:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_f

    if-nez v0, :cond_d

    .line 920
    :try_start_7
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_d} :catch_12
    .catchall {:try_start_7 .. :try_end_d} :catchall_f

    .line 924
    :cond_d
    :goto_d
    :try_start_d
    monitor-exit v1

    .line 925
    return-void

    .line 924
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_d .. :try_end_11} :catchall_f

    throw v0

    .line 921
    :catch_12
    move-exception v0

    goto :goto_d
.end method

.method public commit()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 895
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 896
    :try_start_3
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_19

    .line 897
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    .line 898
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2700(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    .line 902
    :goto_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->committed:Z

    .line 903
    monitor-exit v1

    .line 904
    return-void

    .line 900
    :cond_19
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x1

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    goto :goto_14

    .line 903
    :catchall_20
    move-exception v0

    monitor-exit v1
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public newSink(I)Lokio/Sink;
    .registers 8
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 866
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v4

    .line 867
    :try_start_3
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$900(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eq v3, p0, :cond_14

    .line 868
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 887
    :catchall_11
    move-exception v3

    monitor-exit v4
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v3

    .line 870
    :cond_14
    :try_start_14
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$800(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v3

    if-nez v3, :cond_21

    .line 871
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    const/4 v5, 0x1

    aput-boolean v5, v3, p1

    .line 873
    :cond_21
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1400(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v3

    aget-object v0, v3, p1
    :try_end_29
    .catchall {:try_start_14 .. :try_end_29} :catchall_11

    .line 876
    .local v0, "dirtyFile":Ljava/io/File;
    :try_start_29
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->fileSystem:Lcom/squareup/okhttp/internal/io/FileSystem;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2400(Lcom/squareup/okhttp/internal/DiskLruCache;)Lcom/squareup/okhttp/internal/io/FileSystem;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/squareup/okhttp/internal/io/FileSystem;->sink(Ljava/io/File;)Lokio/Sink;
    :try_end_32
    .catch Ljava/io/FileNotFoundException; {:try_start_29 .. :try_end_32} :catch_3a
    .catchall {:try_start_29 .. :try_end_32} :catchall_11

    move-result-object v2

    .line 880
    .local v2, "sink":Lokio/Sink;
    :try_start_33
    new-instance v3, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;

    invoke-direct {v3, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$1;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Lokio/Sink;)V

    monitor-exit v4

    .end local v2    # "sink":Lokio/Sink;
    :goto_39
    return-object v3

    .line 877
    :catch_3a
    move-exception v1

    .line 878
    .local v1, "e":Ljava/io/FileNotFoundException;
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;
    invoke-static {}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2500()Lokio/Sink;

    move-result-object v3

    monitor-exit v4
    :try_end_40
    .catchall {:try_start_33 .. :try_end_40} :catchall_11

    goto :goto_39
.end method

.method public newSource(I)Lokio/Source;
    .registers 7
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 843
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 844
    :try_start_4
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$900(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eq v3, p0, :cond_15

    .line 845
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 855
    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_12

    throw v1

    .line 847
    :cond_15
    :try_start_15
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$800(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v3

    if-nez v3, :cond_1f

    .line 848
    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_15 .. :try_end_1e} :catchall_12

    .line 853
    :goto_1e
    return-object v1

    .line 851
    :cond_1f
    :try_start_1f
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->fileSystem:Lcom/squareup/okhttp/internal/io/FileSystem;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2400(Lcom/squareup/okhttp/internal/DiskLruCache;)Lcom/squareup/okhttp/internal/io/FileSystem;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1300(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-interface {v3, v4}, Lcom/squareup/okhttp/internal/io/FileSystem;->source(Ljava/io/File;)Lokio/Source;
    :try_end_30
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_30} :catch_33
    .catchall {:try_start_1f .. :try_end_30} :catchall_12

    move-result-object v1

    :try_start_31
    monitor-exit v2

    goto :goto_1e

    .line 852
    :catch_33
    move-exception v0

    .line 853
    .local v0, "e":Ljava/io/FileNotFoundException;
    monitor-exit v2
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_12

    goto :goto_1e
.end method
