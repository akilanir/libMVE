.class public final Lcom/theartofdev/edmodo/cropper/CropImage;
.super Ljava/lang/Object;
.source "CropImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;,
        Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    }
.end annotation


# static fields
.field public static final CROP_IMAGE_ACTIVITY_REQUEST_CODE:I = 0xcb

.field public static final CROP_IMAGE_ACTIVITY_RESULT_ERROR_CODE:I = 0xcc

.field static final CROP_IMAGE_EXTRA_OPTIONS:Ljava/lang/String; = "CROP_IMAGE_EXTRA_OPTIONS"

.field static final CROP_IMAGE_EXTRA_RESULT:Ljava/lang/String; = "CROP_IMAGE_EXTRA_RESULT"

.field static final CROP_IMAGE_EXTRA_SOURCE:Ljava/lang/String; = "CROP_IMAGE_EXTRA_SOURCE"

.field public static final PICK_IMAGE_CHOOSER_REQUEST_CODE:I = 0xc8

.field public static final PICK_IMAGE_PERMISSIONS_REQUEST_CODE:I = 0xc9


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    return-void
.end method

.method public static activity(Landroid/net/Uri;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 284
    if-eqz p0, :cond_a

    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 285
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Uri must be non null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_12
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;-><init>(Landroid/net/Uri;Lcom/theartofdev/edmodo/cropper/CropImage$1;)V

    return-object v0
.end method

.method public static getActivityResult(Landroid/content/Intent;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;
    .registers 2
    .param p0, "data"    # Landroid/content/Intent;

    .prologue
    .line 297
    if-eqz p0, :cond_b

    const-string v0, "CROP_IMAGE_EXTRA_RESULT"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static getCaptureImageOutputUri(Landroid/content/Context;)Landroid/net/Uri;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 217
    const/4 v1, 0x0

    .line 218
    .local v1, "outputFileUri":Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 219
    .local v0, "getImage":Ljava/io/File;
    if-eqz v0, :cond_16

    .line 220
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "pickImageResult.jpeg"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 222
    :cond_16
    return-object v1
.end method

.method public static getPickImageChooserIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    const-string v0, "Select source"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImage;->getPickImageChooserIntent(Landroid/content/Context;Ljava/lang/CharSequence;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getPickImageChooserIntent(Landroid/content/Context;Ljava/lang/CharSequence;Z)Landroid/content/Intent;
    .registers 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "includeDocuments"    # Z

    .prologue
    .line 155
    invoke-static/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropImage;->getCaptureImageOutputUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v8

    .line 157
    .local v8, "outputFileUri":Landroid/net/Uri;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .local v1, "allIntents":Ljava/util/List;, "Ljava/util/List<Landroid/content/Intent;>;"
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 161
    .local v9, "packageManager":Landroid/content/pm/PackageManager;
    new-instance v2, Landroid/content/Intent;

    const-string v12, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v2, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 162
    .local v2, "captureIntent":Landroid/content/Intent;
    const/4 v12, 0x0

    invoke-virtual {v9, v2, v12}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v6

    .line 163
    .local v6, "listCam":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_50

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/ResolveInfo;

    .line 164
    .local v10, "res":Landroid/content/pm/ResolveInfo;
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 165
    .local v5, "intent":Landroid/content/Intent;
    new-instance v13, Landroid/content/ComponentName;

    iget-object v14, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v14, v14, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v15, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v15, v15, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v13, v14, v15}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 166
    iget-object v13, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v13}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    if-eqz v8, :cond_4c

    .line 168
    const-string v13, "output"

    invoke-virtual {v5, v13, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 170
    :cond_4c
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 174
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "res":Landroid/content/pm/ResolveInfo;
    :cond_50
    new-instance v4, Landroid/content/Intent;

    const-string v12, "android.intent.action.GET_CONTENT"

    invoke-direct {v4, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 175
    .local v4, "galleryIntent":Landroid/content/Intent;
    const-string v12, "image/*"

    invoke-virtual {v4, v12}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 176
    const/4 v12, 0x0

    invoke-virtual {v9, v4, v12}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v7

    .line 177
    .local v7, "listGallery":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_65
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_91

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/ResolveInfo;

    .line 178
    .restart local v10    # "res":Landroid/content/pm/ResolveInfo;
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 179
    .restart local v5    # "intent":Landroid/content/Intent;
    new-instance v13, Landroid/content/ComponentName;

    iget-object v14, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v14, v14, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v15, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v15, v15, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v13, v14, v15}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 180
    iget-object v13, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v13}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_65

    .line 185
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v10    # "res":Landroid/content/pm/ResolveInfo;
    :cond_91
    if-nez p2, :cond_b6

    .line 186
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_97
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Intent;

    .line 187
    .restart local v5    # "intent":Landroid/content/Intent;
    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v13

    const-string v14, "com.android.documentsui.DocumentsActivity"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_97

    .line 188
    invoke-interface {v1, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 195
    .end local v5    # "intent":Landroid/content/Intent;
    :cond_b6
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x17

    if-lt v12, v13, :cond_d9

    .line 196
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 203
    .local v11, "target":Landroid/content/Intent;
    :goto_c1
    move-object/from16 v0, p1

    invoke-static {v11, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    .line 206
    .local v3, "chooserIntent":Landroid/content/Intent;
    const-string v13, "android.intent.extra.INITIAL_INTENTS"

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Landroid/os/Parcelable;

    invoke-interface {v1, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Landroid/os/Parcelable;

    invoke-virtual {v3, v13, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 208
    return-object v3

    .line 198
    .end local v3    # "chooserIntent":Landroid/content/Intent;
    .end local v11    # "target":Landroid/content/Intent;
    :cond_d9
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/Intent;

    .line 199
    .restart local v11    # "target":Landroid/content/Intent;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_c1
.end method

.method public static getPickImageResultUri(Landroid/content/Context;Landroid/content/Intent;)Landroid/net/Uri;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    .line 233
    const/4 v1, 0x1

    .line 234
    .local v1, "isCamera":Z
    if-eqz p1, :cond_18

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_18

    .line 235
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "action":Ljava/lang/String;
    if-eqz v0, :cond_25

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    const/4 v1, 0x1

    .line 238
    .end local v0    # "action":Ljava/lang/String;
    :cond_18
    :goto_18
    if-nez v1, :cond_20

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_27

    :cond_20
    invoke-static {p0}, Lcom/theartofdev/edmodo/cropper/CropImage;->getCaptureImageOutputUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    :goto_24
    return-object v2

    .line 236
    .restart local v0    # "action":Ljava/lang/String;
    :cond_25
    const/4 v1, 0x0

    goto :goto_18

    .line 238
    .end local v0    # "action":Ljava/lang/String;
    :cond_27
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    goto :goto_24
.end method

.method public static isReadExternalStoragePermissionsRequired(Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 252
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_16

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 253
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_16

    .line 254
    invoke-static {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImage;->isUriRequiresPermissions(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public static isUriRequiresPermissions(Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 266
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 267
    .local v1, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 268
    .local v2, "stream":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_d

    .line 269
    const/4 v3, 0x0

    .line 271
    .end local v1    # "resolver":Landroid/content/ContentResolver;
    .end local v2    # "stream":Ljava/io/InputStream;
    :goto_c
    return v3

    .line 270
    :catch_d
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x1

    goto :goto_c
.end method

.method public static startPickImageActivity(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 129
    invoke-static {p0}, Lcom/theartofdev/edmodo/cropper/CropImage;->getPickImageChooserIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 130
    return-void
.end method

.method public static toOvalBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 99
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 100
    .local v6, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 101
    .local v2, "height":I
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v2, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 103
    .local v3, "output":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 105
    .local v0, "canvas":Landroid/graphics/Canvas;
    const v1, -0xbdbdbe

    .line 106
    .local v1, "color":I
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 108
    .local v4, "paint":Landroid/graphics/Paint;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 109
    invoke-virtual {v0, v8, v8, v8, v8}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 110
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v7, v6

    int-to-float v8, v2

    invoke-direct {v5, v9, v9, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 113
    .local v5, "rect":Landroid/graphics/RectF;
    invoke-virtual {v0, v5, v4}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 114
    new-instance v7, Landroid/graphics/PorterDuffXfermode;

    sget-object v8, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v7, v8}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 115
    invoke-virtual {v0, p0, v9, v9, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 117
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 119
    return-object v3
.end method
