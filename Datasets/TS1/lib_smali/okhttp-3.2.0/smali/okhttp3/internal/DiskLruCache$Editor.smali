.class public final Lokhttp3/internal/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lokhttp3/internal/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lokhttp3/internal/DiskLruCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;)V
    .registers 4
    .param p1, "this$0"    # Lokhttp3/internal/DiskLruCache;
    .param p2, "entry"    # Lokhttp3/internal/DiskLruCache$Entry;

    .prologue
    .line 837
    iput-object p1, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 838
    iput-object p2, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    .line 839
    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {p2}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    :goto_e
    iput-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->written:[Z

    .line 840
    return-void

    .line 839
    :cond_11
    # getter for: Lokhttp3/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lokhttp3/internal/DiskLruCache;->access$2400(Lokhttp3/internal/DiskLruCache;)I

    move-result v0

    new-array v0, v0, [Z

    goto :goto_e
.end method

.method synthetic constructor <init>(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;Lokhttp3/internal/DiskLruCache$1;)V
    .registers 4
    .param p1, "x0"    # Lokhttp3/internal/DiskLruCache;
    .param p2, "x1"    # Lokhttp3/internal/DiskLruCache$Entry;
    .param p3, "x2"    # Lokhttp3/internal/DiskLruCache$1;

    .prologue
    .line 831
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/DiskLruCache$Editor;-><init>(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1800(Lokhttp3/internal/DiskLruCache$Editor;)Lokhttp3/internal/DiskLruCache$Entry;
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Editor;

    .prologue
    .line 831
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$1900(Lokhttp3/internal/DiskLruCache$Editor;)[Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Editor;

    .prologue
    .line 831
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->written:[Z

    return-object v0
.end method

.method static synthetic access$2002(Lokhttp3/internal/DiskLruCache$Editor;Z)Z
    .registers 2
    .param p0, "x0"    # Lokhttp3/internal/DiskLruCache$Editor;
    .param p1, "x1"    # Z

    .prologue
    .line 831
    iput-boolean p1, p0, Lokhttp3/internal/DiskLruCache$Editor;->hasErrors:Z

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
    .line 913
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v1

    .line 914
    :try_start_3
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lokhttp3/internal/DiskLruCache;->completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lokhttp3/internal/DiskLruCache;->access$2700(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Editor;Z)V

    .line 915
    monitor-exit v1

    .line 916
    return-void

    .line 915
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
    .line 919
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v1

    .line 920
    :try_start_3
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->committed:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_f

    if-nez v0, :cond_d

    .line 922
    :try_start_7
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lokhttp3/internal/DiskLruCache;->completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lokhttp3/internal/DiskLruCache;->access$2700(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Editor;Z)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_d} :catch_12
    .catchall {:try_start_7 .. :try_end_d} :catchall_f

    .line 926
    :cond_d
    :goto_d
    :try_start_d
    monitor-exit v1

    .line 927
    return-void

    .line 926
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_d .. :try_end_11} :catchall_f

    throw v0

    .line 923
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
    .line 897
    iget-object v1, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v1

    .line 898
    :try_start_3
    iget-boolean v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_19

    .line 899
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lokhttp3/internal/DiskLruCache;->completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lokhttp3/internal/DiskLruCache;->access$2700(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Editor;Z)V

    .line 900
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # invokes: Lokhttp3/internal/DiskLruCache;->removeEntry(Lokhttp3/internal/DiskLruCache$Entry;)Z
    invoke-static {v0, v2}, Lokhttp3/internal/DiskLruCache;->access$2800(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Entry;)Z

    .line 904
    :goto_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->committed:Z

    .line 905
    monitor-exit v1

    .line 906
    return-void

    .line 902
    :cond_19
    iget-object v0, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    const/4 v2, 0x1

    # invokes: Lokhttp3/internal/DiskLruCache;->completeEdit(Lokhttp3/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lokhttp3/internal/DiskLruCache;->access$2700(Lokhttp3/internal/DiskLruCache;Lokhttp3/internal/DiskLruCache$Editor;Z)V

    goto :goto_14

    .line 905
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
    .line 868
    iget-object v4, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v4

    .line 869
    :try_start_3
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$1000(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eq v3, p0, :cond_14

    .line 870
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 889
    :catchall_11
    move-exception v3

    monitor-exit v4
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v3

    .line 872
    :cond_14
    :try_start_14
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v3

    if-nez v3, :cond_21

    .line 873
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->written:[Z

    const/4 v5, 0x1

    aput-boolean v5, v3, p1

    .line 875
    :cond_21
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$1500(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v3

    aget-object v0, v3, p1
    :try_end_29
    .catchall {:try_start_14 .. :try_end_29} :catchall_11

    .line 878
    .local v0, "dirtyFile":Ljava/io/File;
    :try_start_29
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache;->access$2500(Lokhttp3/internal/DiskLruCache;)Lokhttp3/internal/io/FileSystem;

    move-result-object v3

    invoke-interface {v3, v0}, Lokhttp3/internal/io/FileSystem;->sink(Ljava/io/File;)Lokio/Sink;
    :try_end_32
    .catch Ljava/io/FileNotFoundException; {:try_start_29 .. :try_end_32} :catch_3a
    .catchall {:try_start_29 .. :try_end_32} :catchall_11

    move-result-object v2

    .line 882
    .local v2, "sink":Lokio/Sink;
    :try_start_33
    new-instance v3, Lokhttp3/internal/DiskLruCache$Editor$1;

    invoke-direct {v3, p0, v2}, Lokhttp3/internal/DiskLruCache$Editor$1;-><init>(Lokhttp3/internal/DiskLruCache$Editor;Lokio/Sink;)V

    monitor-exit v4

    .end local v2    # "sink":Lokio/Sink;
    :goto_39
    return-object v3

    .line 879
    :catch_3a
    move-exception v1

    .line 880
    .local v1, "e":Ljava/io/FileNotFoundException;
    # getter for: Lokhttp3/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;
    invoke-static {}, Lokhttp3/internal/DiskLruCache;->access$2600()Lokio/Sink;

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

    .line 847
    iget-object v2, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    monitor-enter v2

    .line 848
    :try_start_4
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->currentEditor:Lokhttp3/internal/DiskLruCache$Editor;
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$1000(Lokhttp3/internal/DiskLruCache$Entry;)Lokhttp3/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eq v3, p0, :cond_15

    .line 849
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 859
    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_12

    throw v1

    .line 851
    :cond_15
    :try_start_15
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache$Entry;->access$900(Lokhttp3/internal/DiskLruCache$Entry;)Z

    move-result v3

    if-nez v3, :cond_1f

    .line 852
    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_15 .. :try_end_1e} :catchall_12

    .line 857
    :goto_1e
    return-object v1

    .line 855
    :cond_1f
    :try_start_1f
    iget-object v3, p0, Lokhttp3/internal/DiskLruCache$Editor;->this$0:Lokhttp3/internal/DiskLruCache;

    # getter for: Lokhttp3/internal/DiskLruCache;->fileSystem:Lokhttp3/internal/io/FileSystem;
    invoke-static {v3}, Lokhttp3/internal/DiskLruCache;->access$2500(Lokhttp3/internal/DiskLruCache;)Lokhttp3/internal/io/FileSystem;

    move-result-object v3

    iget-object v4, p0, Lokhttp3/internal/DiskLruCache$Editor;->entry:Lokhttp3/internal/DiskLruCache$Entry;

    # getter for: Lokhttp3/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v4}, Lokhttp3/internal/DiskLruCache$Entry;->access$1400(Lokhttp3/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-interface {v3, v4}, Lokhttp3/internal/io/FileSystem;->source(Ljava/io/File;)Lokio/Source;
    :try_end_30
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_30} :catch_33
    .catchall {:try_start_1f .. :try_end_30} :catchall_12

    move-result-object v1

    :try_start_31
    monitor-exit v2

    goto :goto_1e

    .line 856
    :catch_33
    move-exception v0

    .line 857
    .local v0, "e":Ljava/io/FileNotFoundException;
    monitor-exit v2
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_12

    goto :goto_1e
.end method
