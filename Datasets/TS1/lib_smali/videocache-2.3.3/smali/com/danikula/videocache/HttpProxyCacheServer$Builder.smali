.class public final Lcom/danikula/videocache/HttpProxyCacheServer$Builder;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/HttpProxyCacheServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# static fields
.field private static final DEFAULT_MAX_SIZE:J = 0x3400000L


# instance fields
.field private cacheRoot:Ljava/io/File;

.field private diskUsage:Lcom/danikula/videocache/file/DiskUsage;

.field private fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 355
    invoke-static {p1}, Lcom/danikula/videocache/StorageUtils;->getIndividualCacheDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->cacheRoot:Ljava/io/File;

    .line 356
    new-instance v0, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;

    const-wide/32 v1, 0x3400000

    invoke-direct {v0, v1, v2}, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;-><init>(J)V

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    .line 357
    new-instance v0, Lcom/danikula/videocache/file/Md5FileNameGenerator;

    invoke-direct {v0}, Lcom/danikula/videocache/file/Md5FileNameGenerator;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    .line 358
    return-void
.end method

.method static synthetic access$000(Lcom/danikula/videocache/HttpProxyCacheServer$Builder;)Lcom/danikula/videocache/Config;
    .registers 2
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    .prologue
    .line 346
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->buildConfig()Lcom/danikula/videocache/Config;

    move-result-object v0

    return-object v0
.end method

.method private buildConfig()Lcom/danikula/videocache/Config;
    .registers 5

    .prologue
    .line 428
    new-instance v0, Lcom/danikula/videocache/Config;

    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->cacheRoot:Ljava/io/File;

    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    invoke-direct {v0, v1, v2, v3}, Lcom/danikula/videocache/Config;-><init>(Ljava/io/File;Lcom/danikula/videocache/file/FileNameGenerator;Lcom/danikula/videocache/file/DiskUsage;)V

    return-object v0
.end method


# virtual methods
.method public build()Lcom/danikula/videocache/HttpProxyCacheServer;
    .registers 4

    .prologue
    .line 423
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->buildConfig()Lcom/danikula/videocache/Config;

    move-result-object v0

    .line 424
    .local v0, "config":Lcom/danikula/videocache/Config;
    new-instance v1, Lcom/danikula/videocache/HttpProxyCacheServer;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/danikula/videocache/HttpProxyCacheServer;-><init>(Lcom/danikula/videocache/Config;Lcom/danikula/videocache/HttpProxyCacheServer$1;)V

    return-object v1
.end method

.method public cacheDirectory(Ljava/io/File;)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 373
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->cacheRoot:Ljava/io/File;

    .line 374
    return-object p0
.end method

.method public fileNameGenerator(Lcom/danikula/videocache/file/FileNameGenerator;)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;
    .registers 3
    .param p1, "fileNameGenerator"    # Lcom/danikula/videocache/file/FileNameGenerator;

    .prologue
    .line 384
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/file/FileNameGenerator;

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->fileNameGenerator:Lcom/danikula/videocache/file/FileNameGenerator;

    .line 385
    return-object p0
.end method

.method public maxCacheFilesCount(I)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 413
    new-instance v0, Lcom/danikula/videocache/file/TotalCountLruDiskUsage;

    invoke-direct {v0, p1}, Lcom/danikula/videocache/file/TotalCountLruDiskUsage;-><init>(I)V

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    .line 414
    return-object p0
.end method

.method public maxCacheSize(J)Lcom/danikula/videocache/HttpProxyCacheServer$Builder;
    .registers 4
    .param p1, "maxSize"    # J

    .prologue
    .line 399
    new-instance v0, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;

    invoke-direct {v0, p1, p2}, Lcom/danikula/videocache/file/TotalSizeLruDiskUsage;-><init>(J)V

    iput-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    .line 400
    return-object p0
.end method
