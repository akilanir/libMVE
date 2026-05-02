.class Lcom/koushikdutta/ion/loader/PackageIconLoader$1;
.super Ljava/lang/Object;
.source "PackageIconLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/PackageIconLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/PackageIconLoader;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

.field final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/PackageIconLoader;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 6
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/PackageIconLoader;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->this$0:Lcom/koushikdutta/ion/loader/PackageIconLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$uri:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$key:Ljava/lang/String;

    iput-object p5, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    .line 32
    :try_start_0
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$uri:Ljava/lang/String;

    invoke-static {v6}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v5

    .line 33
    .local v5, "request":Ljava/net/URI;
    invoke-virtual {v5}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 34
    .local v3, "pkg":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v6}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 35
    .local v4, "pm":Landroid/content/pm/PackageManager;
    const/4 v6, 0x0

    invoke-virtual {v4, v3, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v6, v4}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    check-cast v6, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 36
    .local v0, "bmp":Landroid/graphics/Bitmap;
    if-nez v0, :cond_36

    .line 37
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "package icon failed to load"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_2f

    .line 42
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    .end local v3    # "pkg":Ljava/lang/String;
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    .end local v5    # "request":Ljava/net/URI;
    :catch_2f
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v6, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    .line 45
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_35
    return-void

    .line 38
    .restart local v0    # "bmp":Landroid/graphics/Bitmap;
    .restart local v3    # "pkg":Ljava/lang/String;
    .restart local v4    # "pm":Landroid/content/pm/PackageManager;
    .restart local v5    # "request":Ljava/net/URI;
    :cond_36
    :try_start_36
    new-instance v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$key:Ljava/lang/String;

    const/4 v7, 0x0

    new-instance v8, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    invoke-direct {v8, v9, v10}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {v2, v6, v7, v0, v8}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 39
    .local v2, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v6, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 40
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/PackageIconLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v6, v2}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_54} :catch_2f

    goto :goto_35
.end method
