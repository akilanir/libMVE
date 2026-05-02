.class public final Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/BitmapUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RotateBitmapResult"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final degrees:I


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;I)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "degrees"    # I

    .prologue
    .line 549
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 550
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 551
    iput p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;->degrees:I

    .line 552
    return-void
.end method
