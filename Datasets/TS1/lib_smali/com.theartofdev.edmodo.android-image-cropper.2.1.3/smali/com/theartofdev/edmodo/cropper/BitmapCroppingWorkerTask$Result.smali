.class public final Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;
.super Ljava/lang/Object;
.source "BitmapCroppingWorkerTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final error:Ljava/lang/Exception;

.field public final isSave:Z

.field public final uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v0, 0x0

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 248
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->uri:Landroid/net/Uri;

    .line 249
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->error:Ljava/lang/Exception;

    .line 250
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->isSave:Z

    .line 251
    return-void
.end method

.method constructor <init>(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v0, 0x0

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 255
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->uri:Landroid/net/Uri;

    .line 256
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->error:Ljava/lang/Exception;

    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->isSave:Z

    .line 258
    return-void
.end method

.method constructor <init>(Ljava/lang/Exception;Z)V
    .registers 4
    .param p1, "error"    # Ljava/lang/Exception;
    .param p2, "isSave"    # Z

    .prologue
    const/4 v0, 0x0

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 262
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->uri:Landroid/net/Uri;

    .line 263
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->error:Ljava/lang/Exception;

    .line 264
    iput-boolean p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->isSave:Z

    .line 265
    return-void
.end method
