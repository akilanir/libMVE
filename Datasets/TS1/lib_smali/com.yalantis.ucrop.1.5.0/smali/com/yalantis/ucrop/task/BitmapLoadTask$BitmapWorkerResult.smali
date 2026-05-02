.class public Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;
.super Ljava/lang/Object;
.source "BitmapLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/task/BitmapLoadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitmapWorkerResult"
.end annotation


# instance fields
.field mBitmapResult:Landroid/graphics/Bitmap;

.field mBitmapWorkerException:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "bitmapResult"    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "bitmapWorkerException"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;->mBitmapResult:Landroid/graphics/Bitmap;

    .line 54
    iput-object p2, p0, Lcom/yalantis/ucrop/task/BitmapLoadTask$BitmapWorkerResult;->mBitmapWorkerException:Ljava/lang/Exception;

    .line 55
    return-void
.end method
