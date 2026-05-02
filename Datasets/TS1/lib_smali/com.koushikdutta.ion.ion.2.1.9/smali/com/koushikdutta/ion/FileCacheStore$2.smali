.class Lcom/koushikdutta/ion/FileCacheStore$2;
.super Ljava/lang/Object;
.source "FileCacheStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/FileCacheStore;

.field final synthetic val$parser:Lcom/koushikdutta/async/parser/AsyncParser;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/FileCacheStore;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/parser/AsyncParser;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/FileCacheStore;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    iput-object p2, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iput-object p3, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$parser:Lcom/koushikdutta/async/parser/AsyncParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 102
    :try_start_0
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    # invokes: Lcom/koushikdutta/ion/FileCacheStore;->computeKey()Ljava/lang/String;
    invoke-static {v3}, Lcom/koushikdutta/ion/FileCacheStore;->access$000(Lcom/koushikdutta/ion/FileCacheStore;)Ljava/lang/String;

    move-result-object v2

    .line 103
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v3, v3, Lcom/koushikdutta/ion/FileCacheStore;->cache:Lcom/koushikdutta/async/util/FileCache;

    invoke-virtual {v3, v2}, Lcom/koushikdutta/async/util/FileCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 104
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 105
    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    const/4 v3, 0x0

    check-cast v3, Ljava/lang/Object;

    invoke-virtual {v4, v3}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 115
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "key":Ljava/lang/String;
    :goto_1c
    return-void

    .line 108
    .restart local v1    # "file":Ljava/io/File;
    .restart local v2    # "key":Ljava/lang/String;
    :cond_1d
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v3, v3, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->this$0:Lcom/koushikdutta/ion/FileCacheStore;

    iget-object v4, v4, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion;->build(Landroid/content/Context;)Lcom/koushikdutta/ion/builder/LoadBuilder;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/koushikdutta/ion/builder/LoadBuilder;->load(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/ion/builder/Builders$Any$B;

    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$parser:Lcom/koushikdutta/async/parser/AsyncParser;

    .line 109
    invoke-interface {v3, v4}, Lcom/koushikdutta/ion/builder/Builders$Any$B;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v3

    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    .line 110
    invoke-virtual {v4}, Lcom/koushikdutta/async/future/SimpleFuture;->getCompletionCallback()Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/koushikdutta/ion/future/ResponseFuture;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_42} :catch_43

    goto :goto_1c

    .line 112
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "key":Ljava/lang/String;
    :catch_43
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v3, v0}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_1c
.end method
