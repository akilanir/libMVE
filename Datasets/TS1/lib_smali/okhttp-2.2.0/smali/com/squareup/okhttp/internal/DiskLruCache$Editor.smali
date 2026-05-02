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

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;
    }
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
    .line 817
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 818
    iput-object p2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    .line 819
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {p2}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    :goto_e
    iput-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    .line 820
    return-void

    .line 819
    :cond_11
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2200(Lcom/squareup/okhttp/internal/DiskLruCache;)I

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
    .line 811
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)Lcom/squareup/okhttp/internal/DiskLruCache$Entry;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .prologue
    .line 811
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)[Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .prologue
    .line 811
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    return-object v0
.end method

.method static synthetic access$1702(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .param p1, "x1"    # Z

    .prologue
    .line 811
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
    .line 912
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 913
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2500(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    .line 914
    monitor-exit v1

    .line 915
    return-void

    .line 914
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
    .line 918
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 919
    :try_start_3
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->committed:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_f

    if-nez v0, :cond_d

    .line 921
    :try_start_7
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2500(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_d} :catch_12
    .catchall {:try_start_7 .. :try_end_d} :catchall_f

    .line 925
    :cond_d
    :goto_d
    :try_start_d
    monitor-exit v1

    .line 926
    return-void

    .line 925
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_d .. :try_end_11} :catchall_f

    throw v0

    .line 922
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
    .line 896
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v1

    .line 897
    :try_start_3
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_19

    .line 898
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x0

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2500(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    .line 899
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->removeEntry(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2600(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    .line 903
    :goto_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->committed:Z

    .line 904
    monitor-exit v1

    .line 905
    return-void

    .line 901
    :cond_19
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v2, 0x1

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->completeEdit(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2500(Lcom/squareup/okhttp/internal/DiskLruCache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)V

    goto :goto_14

    .line 904
    :catchall_20
    move-exception v0

    monitor-exit v1
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public getString(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 847
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->newSource(I)Lokio/Source;

    move-result-object v0

    .line 848
    .local v0, "source":Lokio/Source;
    if-eqz v0, :cond_b

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->sourceToString(Lokio/Source;)Ljava/lang/String;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2100(Lokio/Source;)Ljava/lang/String;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public newSink(I)Lokio/Sink;
    .registers 9
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 859
    iget-object v5, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v5

    .line 860
    :try_start_3
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v4

    if-eq v4, p0, :cond_14

    .line 861
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 881
    :catchall_11
    move-exception v4

    monitor-exit v5
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v4

    .line 863
    :cond_14
    :try_start_14
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v4

    if-nez v4, :cond_21

    .line 864
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->written:[Z

    const/4 v6, 0x1

    aput-boolean v6, v4, p1

    .line 866
    :cond_21
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1200(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v4

    aget-object v0, v4, p1
    :try_end_29
    .catchall {:try_start_14 .. :try_end_29} :catchall_11

    .line 869
    .local v0, "dirtyFile":Ljava/io/File;
    :try_start_29
    invoke-static {v0}, Lokio/Okio;->sink(Ljava/io/File;)Lokio/Sink;
    :try_end_2c
    .catch Ljava/io/FileNotFoundException; {:try_start_29 .. :try_end_2c} :catch_34
    .catchall {:try_start_29 .. :try_end_2c} :catchall_11

    move-result-object v3

    .line 880
    .local v3, "sink":Lokio/Sink;
    :goto_2d
    :try_start_2d
    new-instance v4, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;

    invoke-direct {v4, p0, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Lokio/Sink;)V

    monitor-exit v5

    .end local v3    # "sink":Lokio/Sink;
    :goto_33
    return-object v4

    .line 870
    :catch_34
    move-exception v1

    .line 872
    .local v1, "e":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2300(Lcom/squareup/okhttp/internal/DiskLruCache;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z
    :try_end_3e
    .catchall {:try_start_2d .. :try_end_3e} :catchall_11

    .line 874
    :try_start_3e
    invoke-static {v0}, Lokio/Okio;->sink(Ljava/io/File;)Lokio/Sink;
    :try_end_41
    .catch Ljava/io/FileNotFoundException; {:try_start_3e .. :try_end_41} :catch_43
    .catchall {:try_start_3e .. :try_end_41} :catchall_11

    move-result-object v3

    .restart local v3    # "sink":Lokio/Sink;
    goto :goto_2d

    .line 875
    .end local v3    # "sink":Lokio/Sink;
    :catch_43
    move-exception v2

    .line 877
    .local v2, "e2":Ljava/io/FileNotFoundException;
    :try_start_44
    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->NULL_SINK:Lokio/Sink;
    invoke-static {}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$2400()Lokio/Sink;

    move-result-object v4

    monitor-exit v5
    :try_end_49
    .catchall {:try_start_44 .. :try_end_49} :catchall_11

    goto :goto_33
.end method

.method public newSource(I)Lokio/Source;
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 827
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 828
    :try_start_4
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->currentEditor:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$700(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v3

    if-eq v3, p0, :cond_15

    .line 829
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 839
    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_12

    throw v1

    .line 831
    :cond_15
    :try_start_15
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->readable:Z
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$600(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z

    move-result v3

    if-nez v3, :cond_1f

    .line 832
    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_15 .. :try_end_1e} :catchall_12

    .line 837
    :goto_1e
    return-object v1

    .line 835
    :cond_1f
    :try_start_1f
    iget-object v3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->entry:Lcom/squareup/okhttp/internal/DiskLruCache$Entry;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;
    invoke-static {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Entry;->access$1100(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[Ljava/io/File;

    move-result-object v3

    aget-object v3, v3, p1

    invoke-static {v3}, Lokio/Okio;->source(Ljava/io/File;)Lokio/Source;
    :try_end_2a
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_2a} :catch_2d
    .catchall {:try_start_1f .. :try_end_2a} :catchall_12

    move-result-object v1

    :try_start_2b
    monitor-exit v2

    goto :goto_1e

    .line 836
    :catch_2d
    move-exception v0

    .line 837
    .local v0, "e":Ljava/io/FileNotFoundException;
    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_2b .. :try_end_2f} :catchall_12

    goto :goto_1e
.end method

.method public set(ILjava/lang/String;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 886
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->newSink(I)Lokio/Sink;

    move-result-object v1

    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v0

    .line 887
    .local v0, "writer":Lokio/BufferedSink;
    invoke-interface {v0, p2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 888
    invoke-interface {v0}, Lokio/BufferedSink;->close()V

    .line 889
    return-void
.end method
