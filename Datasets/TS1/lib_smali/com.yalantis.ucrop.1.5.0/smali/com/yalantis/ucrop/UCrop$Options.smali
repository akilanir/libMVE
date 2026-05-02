.class public Lcom/yalantis/ucrop/UCrop$Options;
.super Ljava/lang/Object;
.source "UCrop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/UCrop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Options"
.end annotation


# static fields
.field public static final EXTRA_ALLOWED_GESTURES:Ljava/lang/String; = "com.yalantis.ucrop.AllowedGestures"

.field public static final EXTRA_COMPRESSION_FORMAT_NAME:Ljava/lang/String; = "com.yalantis.ucrop.CompressionFormatName"

.field public static final EXTRA_COMPRESSION_QUALITY:Ljava/lang/String; = "com.yalantis.ucrop.CompressionQuality"

.field public static final EXTRA_CROP_FRAME_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.CropFrameColor"

.field public static final EXTRA_CROP_FRAME_STROKE_WIDTH:Ljava/lang/String; = "com.yalantis.ucrop.CropFrameStrokeWidth"

.field public static final EXTRA_CROP_GRID_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.CropGridColor"

.field public static final EXTRA_CROP_GRID_COLUMN_COUNT:Ljava/lang/String; = "com.yalantis.ucrop.CropGridColumnCount"

.field public static final EXTRA_CROP_GRID_ROW_COUNT:Ljava/lang/String; = "com.yalantis.ucrop.CropGridRowCount"

.field public static final EXTRA_CROP_GRID_STROKE_WIDTH:Ljava/lang/String; = "com.yalantis.ucrop.CropGridStrokeWidth"

.field public static final EXTRA_DIMMED_LAYER_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.DimmedLayerColor"

.field public static final EXTRA_FREE_STYLE_CROP:Ljava/lang/String; = "com.yalantis.ucrop.FreeStyleCrop"

.field public static final EXTRA_HIDE_BOTTOM_CONTROLS:Ljava/lang/String; = "com.yalantis.ucrop.HideBottomControls"

.field public static final EXTRA_IMAGE_TO_CROP_BOUNDS_ANIM_DURATION:Ljava/lang/String; = "com.yalantis.ucrop.ImageToCropBoundsAnimDuration"

.field public static final EXTRA_MAX_BITMAP_SIZE:Ljava/lang/String; = "com.yalantis.ucrop.MaxBitmapSize"

.field public static final EXTRA_MAX_SCALE_MULTIPLIER:Ljava/lang/String; = "com.yalantis.ucrop.MaxScaleMultiplier"

.field public static final EXTRA_OVAL_DIMMED_LAYER:Ljava/lang/String; = "com.yalantis.ucrop.OvalDimmedLayer"

.field public static final EXTRA_SHOW_CROP_FRAME:Ljava/lang/String; = "com.yalantis.ucrop.ShowCropFrame"

.field public static final EXTRA_SHOW_CROP_GRID:Ljava/lang/String; = "com.yalantis.ucrop.ShowCropGrid"

.field public static final EXTRA_STATUS_BAR_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.StatusBarColor"

.field public static final EXTRA_TOOL_BAR_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.ToolbarColor"

.field public static final EXTRA_UCROP_COLOR_WIDGET_ACTIVE:Ljava/lang/String; = "com.yalantis.ucrop.UcropColorWidgetActive"

.field public static final EXTRA_UCROP_LOGO_COLOR:Ljava/lang/String; = "com.yalantis.ucrop.UcropLogoColor"

.field public static final EXTRA_UCROP_TITLE_TEXT_TOOLBAR:Ljava/lang/String; = "com.yalantis.ucrop.UcropToolbarTitleText"

.field public static final EXTRA_UCROP_WIDGET_COLOR_TOOLBAR:Ljava/lang/String; = "com.yalantis.ucrop.UcropToolbarWidgetColor"


# instance fields
.field private final mOptionBundle:Landroid/os/Bundle;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    .line 252
    return-void
.end method


# virtual methods
.method public getOptionBundle()Landroid/os/Bundle;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 256
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public setActiveWidgetColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 397
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.UcropColorWidgetActive"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 398
    return-void
.end method

.method public setAllowedGestures(III)V
    .registers 8
    .param p1, "tabScale"    # I
    .param p2, "tabRotate"    # I
    .param p3, "tabAspectRatio"    # I

    .prologue
    .line 279
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AllowedGestures"

    const/4 v2, 0x3

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v3, 0x1

    aput p2, v2, v3

    const/4 v3, 0x2

    aput p3, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 280
    return-void
.end method

.method public setCompressionFormat(Landroid/graphics/Bitmap$CompressFormat;)V
    .registers 5
    .param p1, "format"    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 263
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CompressionFormatName"

    invoke-virtual {p1}, Landroid/graphics/Bitmap$CompressFormat;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    return-void
.end method

.method public setCompressionQuality(I)V
    .registers 4
    .param p1, "compressQuality"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 270
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CompressionQuality"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 271
    return-void
.end method

.method public setCropFrameColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 334
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropFrameColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 335
    return-void
.end method

.method public setCropFrameStrokeWidth(I)V
    .registers 4
    .param p1, "width"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 341
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropFrameStrokeWidth"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 342
    return-void
.end method

.method public setCropGridColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 369
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropGridColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 370
    return-void
.end method

.method public setCropGridColumnCount(I)V
    .registers 4
    .param p1, "count"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 362
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropGridColumnCount"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 363
    return-void
.end method

.method public setCropGridRowCount(I)V
    .registers 4
    .param p1, "count"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 355
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropGridRowCount"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 356
    return-void
.end method

.method public setCropGridStrokeWidth(I)V
    .registers 4
    .param p1, "width"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 376
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.CropGridStrokeWidth"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 377
    return-void
.end method

.method public setDimmedLayerColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 313
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.DimmedLayerColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 314
    return-void
.end method

.method public setFreeStyleCropEnabled(Z)V
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 432
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.FreeStyleCrop"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 433
    return-void
.end method

.method public setHideBottomControls(Z)V
    .registers 4
    .param p1, "hide"    # Z

    .prologue
    .line 425
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.HideBottomControls"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 426
    return-void
.end method

.method public setImageToCropBoundsAnimDuration(I)V
    .registers 4
    .param p1, "durationMillis"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x64L
        .end annotation
    .end param

    .prologue
    .line 297
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.ImageToCropBoundsAnimDuration"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 298
    return-void
.end method

.method public setLogoColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 418
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.UcropLogoColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 419
    return-void
.end method

.method public setMaxBitmapSize(I)V
    .registers 4
    .param p1, "maxBitmapSize"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x64L
        .end annotation
    .end param

    .prologue
    .line 306
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.MaxBitmapSize"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 307
    return-void
.end method

.method public setMaxScaleMultiplier(F)V
    .registers 4
    .param p1, "maxScaleMultiplier"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 1.0
            fromInclusive = false
        .end annotation
    .end param

    .prologue
    .line 288
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.MaxScaleMultiplier"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 289
    return-void
.end method

.method public setOvalDimmedLayer(Z)V
    .registers 4
    .param p1, "isOval"    # Z

    .prologue
    .line 320
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.OvalDimmedLayer"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 321
    return-void
.end method

.method public setShowCropFrame(Z)V
    .registers 4
    .param p1, "show"    # Z

    .prologue
    .line 327
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.ShowCropFrame"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 328
    return-void
.end method

.method public setShowCropGrid(Z)V
    .registers 4
    .param p1, "show"    # Z

    .prologue
    .line 348
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.ShowCropGrid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 349
    return-void
.end method

.method public setStatusBarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 390
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.StatusBarColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 391
    return-void
.end method

.method public setToolbarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 383
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.ToolbarColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 384
    return-void
.end method

.method public setToolbarTitle(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 411
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.UcropToolbarTitleText"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    return-void
.end method

.method public setToolbarWidgetColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 404
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop$Options;->mOptionBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.UcropToolbarWidgetColor"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 405
    return-void
.end method
