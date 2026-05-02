.class public Lcom/koushikdutta/ion/ImageViewBitmapInfo;
.super Ljava/lang/Object;
.source "ImageViewBitmapInfo.java"


# instance fields
.field exception:Ljava/lang/Exception;

.field imageView:Landroid/widget/ImageView;

.field info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 13
    iget-object v0, p0, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->imageView:Landroid/widget/ImageView;

    return-object v0
.end method
