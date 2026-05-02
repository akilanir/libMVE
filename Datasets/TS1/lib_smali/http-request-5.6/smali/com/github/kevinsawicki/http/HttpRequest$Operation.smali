.class public abstract Lcom/github/kevinsawicki/http/HttpRequest$Operation;
.super Ljava/lang/Object;
.source "HttpRequest.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/kevinsawicki/http/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "Operation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TV;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 662
    .local p0, "this":Lcom/github/kevinsawicki/http/HttpRequest$Operation;, "Lcom/github/kevinsawicki/http/HttpRequest$Operation<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 681
    .local p0, "this":Lcom/github/kevinsawicki/http/HttpRequest$Operation;, "Lcom/github/kevinsawicki/http/HttpRequest$Operation<TV;>;"
    const/4 v1, 0x0

    .line 683
    .local v1, "thrown":Z
    :try_start_1
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest$Operation;->run()Ljava/lang/Object;
    :try_end_4
    .catch Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException; {:try_start_1 .. :try_end_4} :catch_12
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4} :catch_1a
    .catchall {:try_start_1 .. :try_end_4} :catchall_15

    move-result-object v2

    .line 692
    :try_start_5
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest$Operation;->done()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_9

    .line 696
    :cond_8
    return-object v2

    .line 693
    :catch_9
    move-exception v0

    .line 694
    .local v0, "e":Ljava/io/IOException;
    if-nez v1, :cond_8

    .line 695
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 684
    .end local v0    # "e":Ljava/io/IOException;
    :catch_12
    move-exception v0

    .line 685
    .local v0, "e":Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
    const/4 v1, 0x1

    .line 686
    :try_start_14
    throw v0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_15

    .line 691
    .end local v0    # "e":Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
    :catchall_15
    move-exception v2

    .line 692
    :try_start_16
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest$Operation;->done()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_19} :catch_22

    .line 696
    :cond_19
    throw v2

    .line 687
    :catch_1a
    move-exception v0

    .line 688
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    .line 689
    :try_start_1c
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
    :try_end_22
    .catchall {:try_start_1c .. :try_end_22} :catchall_15

    .line 693
    .end local v0    # "e":Ljava/io/IOException;
    :catch_22
    move-exception v0

    .line 694
    .restart local v0    # "e":Ljava/io/IOException;
    if-nez v1, :cond_19

    .line 695
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method protected abstract done()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract run()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
