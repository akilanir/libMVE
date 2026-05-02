.class Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;
.super Ljava/lang/Object;
.source "AsyncHttpServer.java"

# interfaces
.implements Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/server/AsyncHttpServer;->directory(Ljava/lang/String;Ljava/io/File;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

.field final synthetic val$directory:Ljava/io/File;

.field final synthetic val$list:Z


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer;Ljava/io/File;Z)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    .prologue
    .line 458
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;->val$directory:Ljava/io/File;

    iput-boolean p3, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;->val$list:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V
    .registers 16
    .param p1, "request"    # Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;
    .param p2, "response"    # Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .prologue
    .line 461
    invoke-interface {p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;->getMatcher()Ljava/util/regex/Matcher;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 462
    .local v10, "path":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    iget-object v11, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;->val$directory:Ljava/io/File;

    invoke-direct {v5, v11, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 464
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_4f

    iget-boolean v11, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;->val$list:Z

    if-eqz v11, :cond_4f

    .line 465
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 466
    .local v2, "dirs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 467
    .local v6, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, "arr$":[Ljava/io/File;
    array-length v9, v0

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_2b
    if-ge v7, v9, :cond_3f

    aget-object v4, v0, v7

    .line 468
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_3b

    .line 469
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    :goto_38
    add-int/lit8 v7, v7, 0x1

    goto :goto_2b

    .line 471
    :cond_3b
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_38

    .line 474
    .end local v4    # "f":Ljava/io/File;
    :cond_3f
    new-instance v1, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6$1;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;)V

    .line 481
    .local v1, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/io/File;>;"
    invoke-static {v2, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 482
    invoke-static {v6, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 484
    const/4 v11, 0x0

    invoke-virtual {v6, v11, v2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 507
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/io/File;>;"
    .end local v2    # "dirs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local v6    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    :goto_4e
    return-void

    .line 488
    :cond_4f
    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v11

    if-nez v11, :cond_5e

    .line 489
    const/16 v11, 0x194

    invoke-interface {p2, v11}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 490
    invoke-interface {p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->end()V

    goto :goto_4e

    .line 494
    :cond_5e
    :try_start_5e
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 495
    .local v8, "is":Ljava/io/FileInputStream;
    const/16 v11, 0xc8

    invoke-interface {p2, v11}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 496
    new-instance v11, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6$2;

    invoke-direct {v11, p0, p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$6$2;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$6;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V

    invoke-static {v8, p2, v11}, Lcom/koushikdutta/async/Util;->pump(Ljava/io/InputStream;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    :try_end_70
    .catch Ljava/io/FileNotFoundException; {:try_start_5e .. :try_end_70} :catch_71

    goto :goto_4e

    .line 503
    .end local v8    # "is":Ljava/io/FileInputStream;
    :catch_71
    move-exception v3

    .line 504
    .local v3, "ex":Ljava/io/FileNotFoundException;
    const/16 v11, 0x194

    invoke-interface {p2, v11}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 505
    invoke-interface {p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->end()V

    goto :goto_4e
.end method
