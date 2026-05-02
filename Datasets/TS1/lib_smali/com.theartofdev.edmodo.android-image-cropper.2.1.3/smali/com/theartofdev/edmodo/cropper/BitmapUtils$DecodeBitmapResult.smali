.class public final Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/BitmapUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DecodeBitmapResult"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final sampleSize:I


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;I)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "sampleSize"    # I

    .prologue
    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 526
    iput p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;->sampleSize:I

    .line 527
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$DecodeBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 528
    return-void
.end method
