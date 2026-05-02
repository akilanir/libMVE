.class public Lcom/theartofdev/edmodo/cropper/CropImageActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "CropImageActivity.java"

# interfaces
.implements Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;
.implements Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;


# instance fields
.field private mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

.field private mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private updateMenuItemIconColor(Landroid/view/Menu;II)V
    .registers 7
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "itemId"    # I
    .param p3, "color"    # I

    .prologue
    .line 232
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 233
    .local v0, "menuItem":Landroid/view/MenuItem;
    if-eqz v0, :cond_17

    .line 234
    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 235
    .local v1, "menuItemIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_17

    .line 237
    :try_start_c
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 238
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, p3, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 239
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_17} :catch_18

    .line 244
    .end local v1    # "menuItemIcon":Landroid/graphics/drawable/Drawable;
    :cond_17
    :goto_17
    return-void

    .line 240
    .restart local v1    # "menuItemIcon":Landroid/graphics/drawable/Drawable;
    :catch_18
    move-exception v2

    goto :goto_17
.end method


# virtual methods
.method protected cropImage()V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 160
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-boolean v0, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->noOutputImage:Z

    if-eqz v0, :cond_b

    .line 161
    invoke-virtual {p0, v2, v2}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResult(Landroid/net/Uri;Ljava/lang/Exception;)V

    .line 170
    :goto_a
    return-void

    .line 163
    :cond_b
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getOutputUri()Landroid/net/Uri;

    move-result-object v1

    .line 164
    .local v1, "outputUri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v2, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v3, v3, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressQuality:I

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v4, v4, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v5, v5, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    invoke-virtual/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->saveCroppedImageAsync(Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;III)V

    goto :goto_a
.end method

.method protected getOutputUri()Landroid/net/Uri;
    .registers 6

    .prologue
    .line 184
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v2, v3, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputUri:Landroid/net/Uri;

    .line 185
    .local v2, "outputUri":Landroid/net/Uri;
    sget-object v3, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 187
    :try_start_c
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v3, v3, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    if-ne v3, v4, :cond_25

    const-string v1, ".jpg"

    .line 189
    .local v1, "ext":Ljava/lang/String;
    :goto_16
    const-string v3, "cropped"

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v3, v1, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 194
    .end local v1    # "ext":Ljava/lang/String;
    :cond_24
    return-object v2

    .line 187
    :cond_25
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v3, v3, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    if-ne v3, v4, :cond_30

    const-string v1, ".png"

    goto :goto_16

    :cond_30
    const-string v1, ".wepb"
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_32} :catch_33

    goto :goto_16

    .line 190
    :catch_33
    move-exception v0

    .line 191
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Failed to create temp file for output image"

    invoke-direct {v3, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected getResultIntent(Landroid/net/Uri;Ljava/lang/Exception;)Landroid/content/Intent;
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "error"    # Ljava/lang/Exception;

    .prologue
    .line 218
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    .line 220
    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v3

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    .line 221
    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    .line 222
    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getRotatedDegrees()I

    move-result v5

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;-><init>(Landroid/net/Uri;Ljava/lang/Exception;[FLandroid/graphics/Rect;I)V

    .line 223
    .local v0, "result":Lcom/theartofdev/edmodo/cropper/CropImage$ActivityResult;
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 224
    .local v6, "intent":Landroid/content/Intent;
    const-string v1, "CROP_IMAGE_EXTRA_RESULT"

    invoke-virtual {v6, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 225
    return-object v6
.end method

.method public onBackPressed()V
    .registers 1

    .prologue
    .line 131
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    .line 132
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResultCancel()V

    .line 133
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    sget v4, Lcom/theartofdev/edmodo/cropper/R$layout;->crop_image_activity:I

    invoke-virtual {p0, v4}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setContentView(I)V

    .line 51
    sget v4, Lcom/theartofdev/edmodo/cropper/R$id;->cropImageView:I

    invoke-virtual {p0, v4}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/theartofdev/edmodo/cropper/CropImageView;

    iput-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    .line 53
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 54
    .local v1, "intent":Landroid/content/Intent;
    const-string v4, "CROP_IMAGE_EXTRA_SOURCE"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    .line 55
    .local v2, "source":Landroid/net/Uri;
    const-string v4, "CROP_IMAGE_EXTRA_OPTIONS"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .line 57
    if-nez p1, :cond_2f

    .line 58
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    invoke-virtual {v4, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setImageUriAsync(Landroid/net/Uri;)V

    .line 61
    :cond_2f
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 62
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_50

    .line 63
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v4, v4, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    if-eqz v4, :cond_51

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v4, v4, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_51

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v3, v4, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    .line 66
    .local v3, "title":Ljava/lang/String;
    :goto_49
    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 67
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 69
    .end local v3    # "title":Ljava/lang/String;
    :cond_50
    return-void

    .line 65
    :cond_51
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/theartofdev/edmodo/cropper/R$string;->crop_image_activity_title:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_49
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 87
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    sget v2, Lcom/theartofdev/edmodo/cropper/R$menu;->crop_image_menu:I

    invoke-virtual {v1, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 89
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-boolean v1, v1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->allowRotation:Z

    if-nez v1, :cond_14

    .line 90
    sget v1, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_rotate:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->removeItem(I)V

    .line 93
    :cond_14
    const/4 v0, 0x0

    .line 95
    .local v0, "cropIcon":Landroid/graphics/drawable/Drawable;
    :try_start_15
    sget v1, Lcom/theartofdev/edmodo/cropper/R$drawable;->crop_image_menu_crop:I

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 96
    if-eqz v0, :cond_26

    .line 97
    sget v1, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_crop:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_26} :catch_42

    .line 102
    :cond_26
    :goto_26
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v1, v1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    if-eqz v1, :cond_40

    .line 103
    sget v1, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_rotate:I

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v2, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    invoke-direct {p0, p1, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->updateMenuItemIconColor(Landroid/view/Menu;II)V

    .line 104
    if-eqz v0, :cond_40

    .line 105
    sget v1, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_crop:I

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v2, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    invoke-direct {p0, p1, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->updateMenuItemIconColor(Landroid/view/Menu;II)V

    .line 109
    :cond_40
    const/4 v1, 0x1

    return v1

    .line 99
    :catch_42
    move-exception v1

    goto :goto_26
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 114
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sget v2, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_crop:I

    if-ne v1, v2, :cond_d

    .line 115
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->cropImage()V

    .line 126
    :goto_c
    return v0

    .line 118
    :cond_d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sget v2, Lcom/theartofdev/edmodo/cropper/R$id;->crop_image_menu_rotate:I

    if-ne v1, v2, :cond_19

    .line 119
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->rotateImage()V

    goto :goto_c

    .line 122
    :cond_19
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x102002c

    if-ne v1, v2, :cond_26

    .line 123
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResultCancel()V

    goto :goto_c

    .line 126
    :cond_26
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_c
.end method

.method public onSaveCroppedImageComplete(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "view"    # Lcom/theartofdev/edmodo/cropper/CropImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "error"    # Ljava/lang/Exception;

    .prologue
    .line 151
    invoke-virtual {p0, p2, p3}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResult(Landroid/net/Uri;Ljava/lang/Exception;)V

    .line 152
    return-void
.end method

.method public onSetImageUriComplete(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "view"    # Lcom/theartofdev/edmodo/cropper/CropImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "error"    # Ljava/lang/Exception;

    .prologue
    .line 137
    if-nez p3, :cond_22

    .line 138
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    if-eqz v0, :cond_11

    .line 139
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget-object v1, v1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setCropRect(Landroid/graphics/Rect;)V

    .line 141
    :cond_11
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v0, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_21

    .line 142
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iget v1, v1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setRotatedDegrees(I)V

    .line 147
    :cond_21
    :goto_21
    return-void

    .line 145
    :cond_22
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p3}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResult(Landroid/net/Uri;Ljava/lang/Exception;)V

    goto :goto_21
.end method

.method protected onStart()V
    .registers 2

    .prologue
    .line 73
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStart()V

    .line 74
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    invoke-virtual {v0, p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setOnSetImageUriCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;)V

    .line 75
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    invoke-virtual {v0, p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setOnSaveCroppedImageCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;)V

    .line 76
    return-void
.end method

.method protected onStop()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 80
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStop()V

    .line 81
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setOnSetImageUriCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;)V

    .line 82
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setOnSaveCroppedImageCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;)V

    .line 83
    return-void
.end method

.method protected rotateImage()V
    .registers 3

    .prologue
    .line 176
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->mCropImageView:Lcom/theartofdev/edmodo/cropper/CropImageView;

    const/16 v1, 0x5a

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->rotateImage(I)V

    .line 177
    return-void
.end method

.method protected setResult(Landroid/net/Uri;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "error"    # Ljava/lang/Exception;

    .prologue
    .line 201
    if-nez p2, :cond_e

    const/4 v0, -0x1

    .line 202
    .local v0, "resultCode":I
    :goto_3
    invoke-virtual {p0, p1, p2}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->getResultIntent(Landroid/net/Uri;Ljava/lang/Exception;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResult(ILandroid/content/Intent;)V

    .line 203
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->finish()V

    .line 204
    return-void

    .line 201
    .end local v0    # "resultCode":I
    :cond_e
    const/16 v0, 0xcc

    goto :goto_3
.end method

.method protected setResultCancel()V
    .registers 2

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->setResult(I)V

    .line 211
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageActivity;->finish()V

    .line 212
    return-void
.end method
