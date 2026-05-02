.class Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;
.super Ljava/lang/Object;
.source "MediaStoreThumbFetcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThumbnailStreamOpener"
.end annotation


# static fields
.field private static final DEFAULT_SERVICE:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;


# instance fields
.field private query:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;

.field private final service:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 118
    new-instance v0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    invoke-direct {v0}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->DEFAULT_SERVICE:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;)V
    .registers 3
    .param p1, "service"    # Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;
    .param p2, "query"    # Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->service:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    .line 128
    iput-object p2, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->query:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;

    .line 129
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;)V
    .registers 3
    .param p1, "query"    # Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;

    .prologue
    .line 123
    sget-object v0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->DEFAULT_SERVICE:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;-><init>(Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;)V

    .line 124
    return-void
.end method


# virtual methods
.method public open(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 132
    const/4 v4, 0x0

    .line 133
    .local v4, "thumbnailUri":Landroid/net/Uri;
    const/4 v2, 0x0

    .line 135
    .local v2, "inputStream":Ljava/io/InputStream;
    iget-object v5, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->query:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;

    invoke-interface {v5, p1, p2}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;->query(Landroid/content/Context;Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v0

    .line 137
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_39

    :try_start_a
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_39

    .line 138
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "path":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_39

    .line 140
    iget-object v5, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->service:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    invoke-virtual {v5, v3}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;->get(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 141
    .local v1, "file":Ljava/io/File;
    iget-object v5, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->service:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    invoke-virtual {v5, v1}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;->exists(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_39

    iget-object v5, p0, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailStreamOpener;->service:Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;

    invoke-virtual {v5, v1}, Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$FileService;->length(Ljava/io/File;)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_39

    .line 142
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    :try_end_38
    .catchall {:try_start_a .. :try_end_38} :catchall_49

    move-result-object v4

    .line 147
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "path":Ljava/lang/String;
    :cond_39
    if-eqz v0, :cond_3e

    .line 148
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 151
    :cond_3e
    if-eqz v4, :cond_48

    .line 152
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 154
    :cond_48
    return-object v2

    .line 147
    :catchall_49
    move-exception v5

    if-eqz v0, :cond_4f

    .line 148
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_4f
    throw v5
.end method
