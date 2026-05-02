.class public Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;
.super Ljava/lang/Object;
.source "OkHttpUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/ModelLoaderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/ModelLoaderFactory",
        "<",
        "Lcom/bumptech/glide/load/model/GlideUrl;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile internalClient:Lcom/squareup/okhttp/OkHttpClient;


# instance fields
.field private client:Lcom/squareup/okhttp/OkHttpClient;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-static {}, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->getInternalClient()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;-><init>(Lcom/squareup/okhttp/OkHttpClient;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 2
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 49
    return-void
.end method

.method private static getInternalClient()Lcom/squareup/okhttp/OkHttpClient;
    .registers 2

    .prologue
    .line 27
    sget-object v0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->internalClient:Lcom/squareup/okhttp/OkHttpClient;

    if-nez v0, :cond_13

    .line 28
    const-class v1, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;

    monitor-enter v1

    .line 29
    :try_start_7
    sget-object v0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->internalClient:Lcom/squareup/okhttp/OkHttpClient;

    if-nez v0, :cond_12

    .line 30
    new-instance v0, Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v0}, Lcom/squareup/okhttp/OkHttpClient;-><init>()V

    sput-object v0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->internalClient:Lcom/squareup/okhttp/OkHttpClient;

    .line 32
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 34
    :cond_13
    sget-object v0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->internalClient:Lcom/squareup/okhttp/OkHttpClient;

    return-object v0

    .line 32
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method


# virtual methods
.method public build(Landroid/content/Context;Lcom/bumptech/glide/load/model/GenericLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "factories"    # Lcom/bumptech/glide/load/model/GenericLoaderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/model/GenericLoaderFactory;",
            ")",
            "Lcom/bumptech/glide/load/model/ModelLoader",
            "<",
            "Lcom/bumptech/glide/load/model/GlideUrl;",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;

    iget-object v1, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader$Factory;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v0, v1}, Lcom/bumptech/glide/integration/okhttp/OkHttpUrlLoader;-><init>(Lcom/squareup/okhttp/OkHttpClient;)V

    return-object v0
.end method

.method public teardown()V
    .registers 1

    .prologue
    .line 59
    return-void
.end method
