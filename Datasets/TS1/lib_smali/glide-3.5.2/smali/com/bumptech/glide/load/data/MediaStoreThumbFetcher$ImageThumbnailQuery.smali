.class Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ImageThumbnailQuery;
.super Ljava/lang/Object;
.source "MediaStoreThumbFetcher.java"

# interfaces
.implements Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher$ThumbnailQuery;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/data/MediaStoreThumbFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageThumbnailQuery"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public query(Landroid/content/Context;Landroid/net/Uri;)Landroid/database/Cursor;
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x1

    .line 162
    invoke-virtual {p2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    .line 163
    .local v6, "id":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Thumbnails;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "_data"

    aput-object v3, v2, v5

    const-string v3, "image_id = ? AND kind = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
