.class public final Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;
.super Ljava/lang/Object;
.source "BitmapLoadingWorkerTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final degreesRotated:I

.field public final error:Ljava/lang/Exception;

.field public final loadSampleSize:I

.field public final uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;Landroid/graphics/Bitmap;II)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "loadSampleSize"    # I
    .param p4, "degreesRotated"    # I

    .prologue
    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->uri:Landroid/net/Uri;

    .line 160
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 161
    iput p3, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->loadSampleSize:I

    .line 162
    iput p4, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->degreesRotated:I

    .line 163
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->error:Ljava/lang/Exception;

    .line 164
    return-void
.end method

.method constructor <init>(Landroid/net/Uri;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "error"    # Ljava/lang/Exception;

    .prologue
    const/4 v1, 0x0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->uri:Landroid/net/Uri;

    .line 168
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 169
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->loadSampleSize:I

    .line 170
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->degreesRotated:I

    .line 171
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->error:Ljava/lang/Exception;

    .line 172
    return-void
.end method
