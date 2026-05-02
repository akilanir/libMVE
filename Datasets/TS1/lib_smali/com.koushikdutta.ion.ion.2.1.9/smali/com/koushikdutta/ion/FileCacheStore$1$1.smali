.class Lcom/koushikdutta/ion/FileCacheStore$1$1;
.super Ljava/lang/Object;
.source "FileCacheStore.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/FileCacheStore$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

.field final synthetic val$file:Ljava/io/File;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$sink:Lcom/koushikdutta/async/stream/FileDataSink;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/FileCacheStore$1;Lcom/koushikdutta/async/stream/FileDataSink;Ljava/io/File;Ljava/lang/String;)V
    .registers 5
    .param p1, "this$1"    # Lcom/koushikdutta/ion/FileCacheStore$1;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

    iput-object p2, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$sink:Lcom/koushikdutta/async/stream/FileDataSink;

    iput-object p3, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$file:Ljava/io/File;

    iput-object p4, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;)V
    .registers 7
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$sink:Lcom/koushikdutta/async/stream/FileDataSink;

    invoke-virtual {v0}, Lcom/koushikdutta/async/stream/FileDataSink;->end()V

    .line 47
    if-eqz p1, :cond_14

    .line 48
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 49
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

    iget-object v0, v0, Lcom/koushikdutta/ion/FileCacheStore$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    .line 54
    :goto_13
    return-void

    .line 52
    :cond_14
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

    iget-object v0, v0, Lcom/koushikdutta/ion/FileCacheStore$1;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v0, v0, Lcom/koushikdutta/ion/FileCacheStore;->cache:Lcom/koushikdutta/async/util/FileCache;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$key:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/io/File;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->val$file:Ljava/io/File;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/util/FileCache;->commitTempFiles(Ljava/lang/String;[Ljava/io/File;)V

    .line 53
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

    iget-object v0, v0, Lcom/koushikdutta/ion/FileCacheStore$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore$1$1;->this$1:Lcom/koushikdutta/ion/FileCacheStore$1;

    iget-object v1, v1, Lcom/koushikdutta/ion/FileCacheStore$1;->val$value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    goto :goto_13
.end method
