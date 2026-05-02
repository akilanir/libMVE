.class public final Lcom/google/android/apps/muzei/api/MuzeiContract$Artwork;
.super Ljava/lang/Object;
.source "MuzeiContract.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/muzei/api/MuzeiContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Artwork"
.end annotation


# static fields
.field public static final ACTION_ARTWORK_CHANGED:Ljava/lang/String; = "com.google.android.apps.muzei.ACTION_ARTWORK_CHANGED"

.field public static final COLUMN_NAME_BYLINE:Ljava/lang/String; = "byline"

.field public static final COLUMN_NAME_IMAGE_URI:Ljava/lang/String; = "imageUri"

.field public static final COLUMN_NAME_TITLE:Ljava/lang/String; = "title"

.field public static final COLUMN_NAME_TOKEN:Ljava/lang/String; = "token"

.field public static final COLUMN_NAME_VIEW_INTENT:Ljava/lang/String; = "viewIntent"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.google.android.apps.muzei.artwork"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final TABLE_NAME:Ljava/lang/String; = "artwork"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 161
    const-string v0, "content://com.google.android.apps.muzei/artwork"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/muzei/api/MuzeiContract$Artwork;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    return-void
.end method

.method public static getCurrentArtwork(Landroid/content/Context;)Lcom/google/android/apps/muzei/api/Artwork;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 176
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 177
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    sget-object v1, Lcom/google/android/apps/muzei/api/MuzeiContract$Artwork;->CONTENT_URI:Landroid/net/Uri;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 178
    .local v6, "cursor":Landroid/database/Cursor;
    if-nez v6, :cond_11

    .line 187
    :goto_10
    return-object v2

    .line 182
    :cond_11
    :try_start_11
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_23

    move-result v1

    if-nez v1, :cond_1b

    .line 187
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_10

    .line 185
    :cond_1b
    :try_start_1b
    invoke-static {v6}, Lcom/google/android/apps/muzei/api/Artwork;->fromCursor(Landroid/database/Cursor;)Lcom/google/android/apps/muzei/api/Artwork;
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_23

    move-result-object v2

    .line 187
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_10

    :catchall_23
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public static getCurrentArtworkBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_12

    .line 202
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "getCurrentArtworkBitmap cannot be called on the main thread"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_12
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 205
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    sget-object v1, Lcom/google/android/apps/muzei/api/MuzeiContract$Artwork;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method
