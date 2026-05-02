.class final Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;
.super Landroid/os/AsyncTask;
.source "BitmapCroppingWorkerTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAspectRatioX:I

.field private final mAspectRatioY:I

.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mContext:Landroid/content/Context;

.field private final mCropImageViewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImageView;",
            ">;"
        }
    .end annotation
.end field

.field private final mCropPoints:[F

.field private final mDegreesRotated:I

.field private final mFixAspectRatio:Z

.field private final mOrgHeight:I

.field private final mOrgWidth:I

.field private final mReqHeight:I

.field private final mReqWidth:I

.field private final mSaveCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private final mSaveCompressQuality:I

.field private final mSaveUri:Landroid/net/Uri;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/graphics/Bitmap;[FIZIILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 13
    .param p1, "cropImageView"    # Lcom/theartofdev/edmodo/cropper/CropImageView;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "cropPoints"    # [F
    .param p4, "degreesRotated"    # I
    .param p5, "fixAspectRatio"    # Z
    .param p6, "aspectRatioX"    # I
    .param p7, "aspectRatioY"    # I
    .param p8, "saveUri"    # Landroid/net/Uri;
    .param p9, "saveCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p10, "saveCompressQuality"    # I

    .prologue
    const/4 v1, 0x0

    .line 112
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 114
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropImageViewReference:Ljava/lang/ref/WeakReference;

    .line 115
    invoke-virtual {p1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mContext:Landroid/content/Context;

    .line 116
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 117
    iput-object p3, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropPoints:[F

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mUri:Landroid/net/Uri;

    .line 119
    iput p4, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mDegreesRotated:I

    .line 120
    iput-boolean p5, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mFixAspectRatio:Z

    .line 121
    iput p6, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioX:I

    .line 122
    iput p7, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioY:I

    .line 123
    iput-object p8, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    .line 124
    iput-object p9, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 125
    iput p10, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressQuality:I

    .line 126
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgWidth:I

    .line 127
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgHeight:I

    .line 128
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqWidth:I

    .line 129
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqHeight:I

    .line 130
    return-void
.end method

.method public constructor <init>(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;[FIIIZIIIILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 16
    .param p1, "cropImageView"    # Lcom/theartofdev/edmodo/cropper/CropImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "cropPoints"    # [F
    .param p4, "degreesRotated"    # I
    .param p5, "orgWidth"    # I
    .param p6, "orgHeight"    # I
    .param p7, "fixAspectRatio"    # Z
    .param p8, "aspectRatioX"    # I
    .param p9, "aspectRatioY"    # I
    .param p10, "reqWidth"    # I
    .param p11, "reqHeight"    # I
    .param p12, "saveUri"    # Landroid/net/Uri;
    .param p13, "saveCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p14, "saveCompressQuality"    # I

    .prologue
    .line 136
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 138
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropImageViewReference:Ljava/lang/ref/WeakReference;

    .line 139
    invoke-virtual {p1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mContext:Landroid/content/Context;

    .line 140
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mUri:Landroid/net/Uri;

    .line 141
    iput-object p3, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropPoints:[F

    .line 142
    iput p4, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mDegreesRotated:I

    .line 143
    iput-boolean p7, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mFixAspectRatio:Z

    .line 144
    iput p8, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioX:I

    .line 145
    iput p9, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioY:I

    .line 146
    iput p5, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgWidth:I

    .line 147
    iput p6, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgHeight:I

    .line 148
    iput p10, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqWidth:I

    .line 149
    iput p11, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqHeight:I

    .line 150
    iput-object p12, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    .line 151
    iput-object p13, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 152
    iput p14, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressQuality:I

    .line 153
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 154
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;
    .registers 15
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 172
    :try_start_0
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_67

    .line 174
    const/4 v11, 0x0

    .line 175
    .local v11, "bitmap":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_2f

    .line 176
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropPoints:[F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mDegreesRotated:I

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgWidth:I

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mOrgHeight:I

    iget-boolean v6, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mFixAspectRatio:Z

    iget v7, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioX:I

    iget v8, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioY:I

    iget v9, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqWidth:I

    iget v10, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mReqHeight:I

    invoke-static/range {v0 .. v10}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropBitmap(Landroid/content/Context;Landroid/net/Uri;[FIIIZIIII)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 182
    :cond_25
    :goto_25
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    if-nez v0, :cond_44

    .line 183
    new-instance v0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    invoke-direct {v0, v11}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;-><init>(Landroid/graphics/Bitmap;)V

    .line 192
    .end local v11    # "bitmap":Landroid/graphics/Bitmap;
    :goto_2e
    return-object v0

    .line 178
    .restart local v11    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2f
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_25

    .line 179
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropPoints:[F

    iget v2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mDegreesRotated:I

    iget-boolean v3, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mFixAspectRatio:Z

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioX:I

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mAspectRatioY:I

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropBitmap(Landroid/graphics/Bitmap;[FIZII)Landroid/graphics/Bitmap;

    move-result-object v11

    goto :goto_25

    .line 185
    :cond_44
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveCompressQuality:I

    invoke-static {v0, v11, v1, v2, v3}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->writeBitmapToUri(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V

    .line 186
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->recycle()V

    .line 187
    new-instance v0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    invoke-direct {v0, v1}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;-><init>(Landroid/net/Uri;)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_59} :catch_5a

    goto :goto_2e

    .line 191
    .end local v11    # "bitmap":Landroid/graphics/Bitmap;
    :catch_5a
    move-exception v12

    .line 192
    .local v12, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mSaveUri:Landroid/net/Uri;

    if-eqz v0, :cond_69

    const/4 v0, 0x1

    :goto_62
    invoke-direct {v1, v12, v0}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;-><init>(Ljava/lang/Exception;Z)V

    move-object v0, v1

    goto :goto_2e

    .line 190
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_67
    const/4 v0, 0x0

    goto :goto_2e

    .line 192
    .restart local v12    # "e":Ljava/lang/Exception;
    :cond_69
    const/4 v0, 0x0

    goto :goto_62
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->doInBackground([Ljava/lang/Void;)Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method protected onPostExecute(Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;)V
    .registers 5
    .param p1, "result"    # Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    .prologue
    .line 203
    if-eqz p1, :cond_22

    .line 204
    const/4 v0, 0x0

    .line 205
    .local v0, "completeCalled":Z
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_17

    .line 206
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->mCropImageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/CropImageView;

    .line 207
    .local v1, "cropImageView":Lcom/theartofdev/edmodo/cropper/CropImageView;
    if-eqz v1, :cond_17

    .line 208
    const/4 v0, 0x1

    .line 209
    invoke-virtual {v1, p1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->onImageCroppingAsyncComplete(Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;)V

    .line 212
    .end local v1    # "cropImageView":Lcom/theartofdev/edmodo/cropper/CropImageView;
    :cond_17
    if-nez v0, :cond_22

    iget-object v2, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_22

    .line 214
    iget-object v2, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 217
    .end local v0    # "completeCalled":Z
    :cond_22
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 25
    check-cast p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->onPostExecute(Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;)V

    return-void
.end method
