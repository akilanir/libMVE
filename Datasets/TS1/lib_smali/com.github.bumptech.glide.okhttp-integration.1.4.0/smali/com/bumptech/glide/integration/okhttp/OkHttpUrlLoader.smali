.class public Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;
.super Ljava/lang/Object;
.source "OkHttpUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoader",
        "<",
        "Lcom/bumptech/glide/load/model/GlideUrl;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final client:Lcom/squareup/okhttp/OkHttpClient;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 2
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 66
    return-void
.end method


# virtual methods
.method public getResourceFetcher(Lcom/bumptech/glide/load/model/GlideUrl;II)Lcom/bumptech/glide/load/data/DataFetcher;
    .registers 6
    .param p1, "model"    # Lcom/bumptech/glide/load/model/GlideUrl;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/GlideUrl;",
            "II)",
            "Lcom/bumptech/glide/load/data/DataFetcher",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;

    iget-object v1, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v0, v1, p1}, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/bumptech/glide/load/model/GlideUrl;)V

    return-object v0
.end method

.method public bridge synthetic getResourceFetcher(Ljava/lang/Object;II)Lcom/bumptech/glide/load/data/DataFetcher;
    .registers 5
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 17
    check-cast p1, Lcom/bumptech/glide/load/model/GlideUrl;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;->getResourceFetcher(Lcom/bumptech/glide/load/model/GlideUrl;II)Lcom/bumptech/glide/load/data/DataFetcher;

    move-result-object v0

    return-object v0
.end method
