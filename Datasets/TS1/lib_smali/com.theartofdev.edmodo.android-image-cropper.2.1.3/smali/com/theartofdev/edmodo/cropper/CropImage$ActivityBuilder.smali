.class public final Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
.super Ljava/lang/Object;
.source "CropImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/theartofdev/edmodo/cropper/CropImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ActivityBuilder"
.end annotation


# instance fields
.field private final mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

.field private final mSource:Landroid/net/Uri;


# direct methods
.method private constructor <init>(Landroid/net/Uri;)V
    .registers 3
    .param p1, "source"    # Landroid/net/Uri;

    .prologue
    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mSource:Landroid/net/Uri;

    .line 319
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    invoke-direct {v0}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .line 320
    return-void
.end method

.method synthetic constructor <init>(Landroid/net/Uri;Lcom/theartofdev/edmodo/cropper/CropImage$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/net/Uri;
    .param p2, "x1"    # Lcom/theartofdev/edmodo/cropper/CropImage$1;

    .prologue
    .line 305
    invoke-direct {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;-><init>(Landroid/net/Uri;)V

    return-void
.end method


# virtual methods
.method public getIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 326
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->validate()V

    .line 328
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 329
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/theartofdev/edmodo/cropper/CropImageActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 330
    const-string v1, "CROP_IMAGE_EXTRA_SOURCE"

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mSource:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 331
    const-string v1, "CROP_IMAGE_EXTRA_OPTIONS"

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 332
    return-object v0
.end method

.method public setActivityMenuIconColor(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "activityMenuIconColor"    # I

    .prologue
    .line 561
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    .line 562
    return-object p0
.end method

.method public setActivityTitle(Ljava/lang/String;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "activityTitle"    # Ljava/lang/String;

    .prologue
    .line 553
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    .line 554
    return-object p0
.end method

.method public setAllowRotation(Z)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "allowRotation"    # Z

    .prologue
    .line 630
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-boolean p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->allowRotation:Z

    .line 631
    return-object p0
.end method

.method public setAspectRatio(II)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 4
    .param p1, "aspectRatioX"    # I
    .param p2, "aspectRatioY"    # I

    .prologue
    .line 445
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    .line 446
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p2, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    .line 447
    return-object p0
.end method

.method public setAutoZoomEnabled(Z)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "autoZoomEnabled"    # Z

    .prologue
    .line 413
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-boolean p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    .line 414
    return-object p0
.end method

.method public setBackgroundColor(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "backgroundColor"    # I

    .prologue
    .line 518
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    .line 519
    return-object p0
.end method

.method public setBorderCornerColor(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderCornerColor"    # I

    .prologue
    .line 494
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    .line 495
    return-object p0
.end method

.method public setBorderCornerLength(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderCornerLength"    # F

    .prologue
    .line 486
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    .line 487
    return-object p0
.end method

.method public setBorderCornerOffset(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderCornerOffset"    # F

    .prologue
    .line 478
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    .line 479
    return-object p0
.end method

.method public setBorderCornerThickness(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderCornerThickness"    # F

    .prologue
    .line 470
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    .line 471
    return-object p0
.end method

.method public setBorderLineColor(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderLineColor"    # I

    .prologue
    .line 462
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    .line 463
    return-object p0
.end method

.method public setBorderLineThickness(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "borderLineThickness"    # F

    .prologue
    .line 454
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    .line 455
    return-object p0
.end method

.method public setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "cropShape"    # Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .prologue
    .line 358
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 359
    return-object p0
.end method

.method public setFixAspectRatio(Z)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "fixAspectRatio"    # Z

    .prologue
    .line 437
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-boolean p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    .line 438
    return-object p0
.end method

.method public setGuidelines(Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "guidelines"    # Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .prologue
    .line 386
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .line 387
    return-object p0
.end method

.method public setGuidelinesColor(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "guidelinesColor"    # I

    .prologue
    .line 510
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    .line 511
    return-object p0
.end method

.method public setGuidelinesThickness(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "guidelinesThickness"    # F

    .prologue
    .line 502
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    .line 503
    return-object p0
.end method

.method public setInitialCropWindowPaddingRatio(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "initialCropWindowPaddingRatio"    # F

    .prologue
    .line 429
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    .line 430
    return-object p0
.end method

.method public setInitialCropWindowRectangle(Landroid/graphics/Rect;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "initialCropWindowRectangle"    # Landroid/graphics/Rect;

    .prologue
    .line 614
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    .line 615
    return-object p0
.end method

.method public setInitialRotation(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "initialRotation"    # I

    .prologue
    .line 622
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    .line 623
    return-object p0
.end method

.method public setMaxCropResultSize(II)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 4
    .param p1, "maxCropResultWidth"    # I
    .param p2, "maxCropResultHeight"    # I

    .prologue
    .line 544
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    .line 545
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p2, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    .line 546
    return-object p0
.end method

.method public setMaxZoom(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "maxZoom"    # I

    .prologue
    .line 421
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    .line 422
    return-object p0
.end method

.method public setMinCropResultSize(II)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 4
    .param p1, "minCropResultWidth"    # I
    .param p2, "minCropResultHeight"    # I

    .prologue
    .line 535
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    .line 536
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p2, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    .line 537
    return-object p0
.end method

.method public setMinCropWindowSize(II)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 4
    .param p1, "minCropWindowWidth"    # I
    .param p2, "minCropWindowHeight"    # I

    .prologue
    .line 526
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    .line 527
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p2, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    .line 528
    return-object p0
.end method

.method public setNoOutputImage(Z)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "noOutputImage"    # Z

    .prologue
    .line 606
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-boolean p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->noOutputImage:Z

    .line 607
    return-object p0
.end method

.method public setOutputCompressFormat(Landroid/graphics/Bitmap$CompressFormat;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "outputCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 577
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 578
    return-object p0
.end method

.method public setOutputCompressQuality(I)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "outputCompressQuality"    # I

    .prologue
    .line 585
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressQuality:I

    .line 586
    return-object p0
.end method

.method public setOutputUri(Landroid/net/Uri;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "outputUri"    # Landroid/net/Uri;

    .prologue
    .line 569
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputUri:Landroid/net/Uri;

    .line 570
    return-object p0
.end method

.method public setRequestedSize(II)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 4
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    .line 596
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    .line 597
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p2, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    .line 598
    return-object p0
.end method

.method public setScaleType(Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "scaleType"    # Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .prologue
    .line 394
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-object p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 395
    return-object p0
.end method

.method public setShowCropOverlay(Z)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "showCropOverlay"    # Z

    .prologue
    .line 404
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput-boolean p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    .line 405
    return-object p0
.end method

.method public setSnapRadius(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "snapRadius"    # F

    .prologue
    .line 368
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    .line 369
    return-object p0
.end method

.method public setTouchRadius(F)Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;
    .registers 3
    .param p1, "touchRadius"    # F

    .prologue
    .line 378
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    iput p1, v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    .line 379
    return-object p0
.end method

.method public start(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 341
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->mOptions:Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->validate()V

    .line 342
    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xcb

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 343
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/support/v4/app/Fragment;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 351
    invoke-virtual {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropImage$ActivityBuilder;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xcb

    invoke-virtual {p2, v0, v1}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 352
    return-void
.end method
