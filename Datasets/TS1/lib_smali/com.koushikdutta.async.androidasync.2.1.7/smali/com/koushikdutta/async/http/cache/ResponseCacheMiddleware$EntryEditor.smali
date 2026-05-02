.class Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;
.super Ljava/lang/Object;
.source "ResponseCacheMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EntryEditor"
.end annotation


# instance fields
.field done:Z

.field key:Ljava/lang/String;

.field outs:[Ljava/io/FileOutputStream;

.field temps:[Ljava/io/File;

.field final synthetic this$0:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Ljava/lang/String;)V
    .registers 5
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x2

    .line 801
    iput-object p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->this$0:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 802
    iput-object p2, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->key:Ljava/lang/String;

    .line 803
    # getter for: Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;
    invoke-static {p1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->access$400(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/util/FileCache;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/FileCache;->getTempFiles(I)[Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->temps:[Ljava/io/File;

    .line 804
    new-array v0, v1, [Ljava/io/FileOutputStream;

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    .line 805
    return-void
.end method


# virtual methods
.method abort()V
    .registers 2

    .prologue
    .line 823
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 824
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->temps:[Ljava/io/File;

    invoke-static {v0}, Lcom/koushikdutta/async/util/FileCache;->removeFiles([Ljava/io/File;)V

    .line 825
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->done:Z

    if-eqz v0, :cond_f

    .line 829
    :goto_e
    return-void

    .line 827
    :cond_f
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->this$0:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    # operator++ for: Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeAbortCount:I
    invoke-static {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->access$608(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I

    .line 828
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->done:Z

    goto :goto_e
.end method

.method commit()V
    .registers 4

    .prologue
    .line 808
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 809
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->done:Z

    if-eqz v0, :cond_a

    .line 814
    :goto_9
    return-void

    .line 811
    :cond_a
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->this$0:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    # getter for: Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;
    invoke-static {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->access$400(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/util/FileCache;

    move-result-object v0

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->key:Ljava/lang/String;

    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->temps:[Ljava/io/File;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/util/FileCache;->commitTempFiles(Ljava/lang/String;[Ljava/io/File;)V

    .line 812
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->this$0:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    # operator++ for: Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeSuccessCount:I
    invoke-static {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->access$508(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I

    .line 813
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->done:Z

    goto :goto_9
.end method

.method newOutputStream(I)Ljava/io/FileOutputStream;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 817
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    aget-object v0, v0, p1

    if-nez v0, :cond_13

    .line 818
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->temps:[Ljava/io/File;

    aget-object v2, v2, p1

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    aput-object v1, v0, p1

    .line 819
    :cond_13
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->outs:[Ljava/io/FileOutputStream;

    aget-object v0, v0, p1

    return-object v0
.end method
