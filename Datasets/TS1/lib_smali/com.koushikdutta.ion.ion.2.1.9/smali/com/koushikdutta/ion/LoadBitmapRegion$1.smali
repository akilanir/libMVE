.class Lcom/koushikdutta/ion/LoadBitmapRegion$1;
.super Ljava/lang/Object;
.source "LoadBitmapRegion.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/LoadBitmapRegion;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/LoadBitmapRegion;

.field final synthetic val$decoder:Landroid/graphics/BitmapRegionDecoder;

.field final synthetic val$inSampleSize:I

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$region:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/LoadBitmapRegion;Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;ILjava/lang/String;)V
    .registers 6
    .param p1, "this$0"    # Lcom/koushikdutta/ion/LoadBitmapRegion;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->this$0:Lcom/koushikdutta/ion/LoadBitmapRegion;

    iput-object p2, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$decoder:Landroid/graphics/BitmapRegionDecoder;

    iput-object p3, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$region:Landroid/graphics/Rect;

    iput p4, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$inSampleSize:I

    iput-object p5, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 22
    :try_start_1
    iget-object v3, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$decoder:Landroid/graphics/BitmapRegionDecoder;

    iget-object v4, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$region:Landroid/graphics/Rect;

    iget v5, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$inSampleSize:I

    invoke-static {v3, v4, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 23
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_1c

    .line 24
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "failed to load bitmap region"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_15} :catch_15

    .line 28
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catch_15
    move-exception v1

    .line 29
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->this$0:Lcom/koushikdutta/ion/LoadBitmapRegion;

    invoke-virtual {v3, v1, v8}, Lcom/koushikdutta/ion/LoadBitmapRegion;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 31
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1b
    return-void

    .line 25
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1c
    :try_start_1c
    new-instance v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->val$key:Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {v2, v3, v4, v0, v5}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 26
    .local v2, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iget-object v3, p0, Lcom/koushikdutta/ion/LoadBitmapRegion$1;->this$0:Lcom/koushikdutta/ion/LoadBitmapRegion;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Lcom/koushikdutta/ion/LoadBitmapRegion;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_37} :catch_15

    goto :goto_1b
.end method
