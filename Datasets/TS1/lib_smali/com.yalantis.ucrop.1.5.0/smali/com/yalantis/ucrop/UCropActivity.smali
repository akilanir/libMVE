.class public Lcom/yalantis/ucrop/UCropActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "UCropActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/UCropActivity$GestureTypes;
    }
.end annotation


# static fields
.field public static final ALL:I = 0x3

.field public static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

.field public static final DEFAULT_COMPRESS_QUALITY:I = 0x5a

.field public static final NONE:I = 0x0

.field public static final ROTATE:I = 0x2

.field private static final ROTATE_WIDGET_SENSITIVITY_COEFFICIENT:I = 0x2a

.field public static final SCALE:I = 0x1

.field private static final SCALE_WIDGET_SENSITIVITY_COEFFICIENT:I = 0x3a98

.field private static final TABS_COUNT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "UCropActivity"


# instance fields
.field private mActiveWidgetColor:I

.field private mAllowedGestures:[I

.field private mBlockingView:Landroid/view/View;

.field private mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private mCompressQuality:I

.field private mCropAspectRatioViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

.field private mImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

.field private mLayoutAspectRatio:Landroid/view/ViewGroup;

.field private mLayoutRotate:Landroid/view/ViewGroup;

.field private mLayoutScale:Landroid/view/ViewGroup;

.field private mLogoColor:I

.field private mOutputUri:Landroid/net/Uri;

.field private mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

.field private mShowBottomControls:Z

.field private mShowLoader:Z

.field private final mStateClickListener:Landroid/view/View$OnClickListener;

.field private mStatusBarColor:I

.field private mTextViewRotateAngle:Landroid/widget/TextView;

.field private mTextViewScalePercent:Landroid/widget/TextView;

.field private mToolbarColor:I

.field private mToolbarTitle:Ljava/lang/String;

.field private mToolbarWidgetColor:I

.field private mUCropView:Lcom/yalantis/ucrop/view/UCropView;

.field private mWrapperStateAspectRatio:Landroid/view/ViewGroup;

.field private mWrapperStateRotate:Landroid/view/ViewGroup;

.field private mWrapperStateScale:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/yalantis/ucrop/UCropActivity;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    .line 95
    sget-object v0, Lcom/yalantis/ucrop/UCropActivity;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 96
    const/16 v0, 0x5a

    iput v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressQuality:I

    .line 97
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_2c

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    .line 337
    new-instance v0, Lcom/yalantis/ucrop/UCropActivity$1;

    invoke-direct {v0, p0}, Lcom/yalantis/ucrop/UCropActivity$1;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    .line 512
    new-instance v0, Lcom/yalantis/ucrop/UCropActivity$7;

    invoke-direct {v0, p0}, Lcom/yalantis/ucrop/UCropActivity$7;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mStateClickListener:Landroid/view/View$OnClickListener;

    return-void

    .line 97
    :array_2c
    .array-data 4
        0x1
        0x2
        0x3
    .end array-data
.end method

.method static synthetic access$000(Lcom/yalantis/ucrop/UCropActivity;F)V
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;
    .param p1, "x1"    # F

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/UCropActivity;->setAngleText(F)V

    return-void
.end method

.method static synthetic access$100(Lcom/yalantis/ucrop/UCropActivity;F)V
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;
    .param p1, "x1"    # F

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/UCropActivity;->setScaleText(F)V

    return-void
.end method

.method static synthetic access$1000(Lcom/yalantis/ucrop/UCropActivity;)Landroid/net/Uri;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$200(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/UCropView;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mUCropView:Lcom/yalantis/ucrop/view/UCropView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/yalantis/ucrop/UCropActivity;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$402(Lcom/yalantis/ucrop/UCropActivity;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 50
    iput-boolean p1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z

    return p1
.end method

.method static synthetic access$500(Lcom/yalantis/ucrop/UCropActivity;)Lcom/yalantis/ucrop/view/GestureCropImageView;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/yalantis/ucrop/UCropActivity;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/yalantis/ucrop/UCropActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->resetRotation()V

    return-void
.end method

.method static synthetic access$800(Lcom/yalantis/ucrop/UCropActivity;I)V
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;
    .param p1, "x1"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/UCropActivity;->rotateByAngle(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/yalantis/ucrop/UCropActivity;I)V
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/UCropActivity;
    .param p1, "x1"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/UCropActivity;->setWidgetState(I)V

    return-void
.end method

.method private addBlockingView()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 564
    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    if-nez v1, :cond_22

    .line 565
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    .line 566
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 567
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v1, 0x3

    sget v2, Lcom/yalantis/ucrop/R$id;->toolbar:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 568
    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 569
    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 572
    .end local v0    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_22
    sget v1, Lcom/yalantis/ucrop/R$id;->ucrop_photobox:I

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 573
    return-void
.end method

.method private initiateRootViews()V
    .registers 4

    .prologue
    .line 315
    sget v0, Lcom/yalantis/ucrop/R$id;->ucrop:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/UCropView;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mUCropView:Lcom/yalantis/ucrop/view/UCropView;

    .line 316
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mUCropView:Lcom/yalantis/ucrop/view/UCropView;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/UCropView;->getCropImageView()Lcom/yalantis/ucrop/view/GestureCropImageView;

    move-result-object v0

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    .line 317
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mUCropView:Lcom/yalantis/ucrop/view/UCropView;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/UCropView;->getOverlayView()Lcom/yalantis/ucrop/view/OverlayView;

    move-result-object v0

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    .line 319
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setTransformImageListener(Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;)V

    .line 321
    iget-boolean v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v0, :cond_76

    .line 322
    sget v0, Lcom/yalantis/ucrop/R$id;->state_aspect_ratio:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateAspectRatio:Landroid/view/ViewGroup;

    .line 323
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateAspectRatio:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mStateClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 324
    sget v0, Lcom/yalantis/ucrop/R$id;->state_rotate:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateRotate:Landroid/view/ViewGroup;

    .line 325
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateRotate:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mStateClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 326
    sget v0, Lcom/yalantis/ucrop/R$id;->state_scale:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateScale:Landroid/view/ViewGroup;

    .line 327
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateScale:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mStateClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    sget v0, Lcom/yalantis/ucrop/R$id;->layout_aspect_ratio:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutAspectRatio:Landroid/view/ViewGroup;

    .line 330
    sget v0, Lcom/yalantis/ucrop/R$id;->layout_rotate_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutRotate:Landroid/view/ViewGroup;

    .line 331
    sget v0, Lcom/yalantis/ucrop/R$id;->layout_scale_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutScale:Landroid/view/ViewGroup;

    .line 334
    :cond_76
    sget v0, Lcom/yalantis/ucrop/R$id;->image_view_logo:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mLogoColor:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 335
    return-void
.end method

.method private processOptions(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 222
    const-string v3, "com.yalantis.ucrop.CompressionFormatName"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 223
    .local v2, "compressionFormatName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 224
    .local v1, "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_14

    .line 225
    invoke-static {v2}, Landroid/graphics/Bitmap$CompressFormat;->valueOf(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    .line 227
    :cond_14
    if-nez v1, :cond_18

    sget-object v1, Lcom/yalantis/ucrop/UCropActivity;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    .end local v1    # "compressFormat":Landroid/graphics/Bitmap$CompressFormat;
    :cond_18
    iput-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 229
    const-string v3, "com.yalantis.ucrop.CompressionQuality"

    const/16 v4, 0x5a

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressQuality:I

    .line 232
    const-string v3, "com.yalantis.ucrop.AllowedGestures"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v0

    .line 233
    .local v0, "allowedGestures":[I
    if-eqz v0, :cond_32

    array-length v3, v0

    const/4 v4, 0x3

    if-ne v3, v4, :cond_32

    .line 234
    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    .line 238
    :cond_32
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    const-string v4, "com.yalantis.ucrop.MaxBitmapSize"

    invoke-virtual {p1, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setMaxBitmapSize(I)V

    .line 239
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    const-string v4, "com.yalantis.ucrop.MaxScaleMultiplier"

    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setMaxScaleMultiplier(F)V

    .line 240
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    const-string v4, "com.yalantis.ucrop.ImageToCropBoundsAnimDuration"

    const/16 v5, 0x1f4

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageToWrapCropBoundsAnimDuration(J)V

    .line 244
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.FreeStyleCrop"

    invoke-virtual {p1, v4, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setFreestyleCropEnabled(Z)V

    .line 246
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.DimmedLayerColor"

    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_dimmed:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setDimmedColor(I)V

    .line 247
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.OvalDimmedLayer"

    invoke-virtual {p1, v4, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setOvalDimmedLayer(Z)V

    .line 249
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.ShowCropFrame"

    invoke-virtual {p1, v4, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setShowCropFrame(Z)V

    .line 250
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropFrameColor"

    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_crop_frame:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropFrameColor(I)V

    .line 251
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropFrameStrokeWidth"

    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_frame_stoke_width:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropFrameStrokeWidth(I)V

    .line 253
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.ShowCropGrid"

    invoke-virtual {p1, v4, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setShowCropGrid(Z)V

    .line 254
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropGridRowCount"

    invoke-virtual {p1, v4, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropGridRowCount(I)V

    .line 255
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropGridColumnCount"

    invoke-virtual {p1, v4, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropGridColumnCount(I)V

    .line 256
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropGridColor"

    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_crop_grid:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropGridColor(I)V

    .line 257
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOverlayView:Lcom/yalantis/ucrop/view/OverlayView;

    const-string v4, "com.yalantis.ucrop.CropGridStrokeWidth"

    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_grid_stoke_width:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/yalantis/ucrop/view/OverlayView;->setCropGridStrokeWidth(I)V

    .line 258
    return-void
.end method

.method private resetRotation()V
    .registers 3

    .prologue
    .line 503
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->getCurrentAngle()F

    move-result v1

    neg-float v1, v1

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->postRotate(F)V

    .line 504
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageToWrapCropBounds()V

    .line 505
    return-void
.end method

.method private rotateByAngle(I)V
    .registers 4
    .param p1, "angle"    # I

    .prologue
    .line 508
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->postRotate(F)V

    .line 509
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageToWrapCropBounds()V

    .line 510
    return-void
.end method

.method private setAllowedGestures(I)V
    .registers 7
    .param p1, "tab"    # I

    .prologue
    const/4 v4, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 554
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    aget v0, v0, p1

    if-eq v0, v4, :cond_11

    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    aget v0, v0, p1

    if-ne v0, v2, :cond_29

    :cond_11
    move v0, v2

    :goto_12
    invoke-virtual {v3, v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setScaleEnabled(Z)V

    .line 555
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    aget v3, v3, p1

    if-eq v3, v4, :cond_24

    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mAllowedGestures:[I

    aget v3, v3, p1

    const/4 v4, 0x2

    if-ne v3, v4, :cond_25

    :cond_24
    move v1, v2

    :cond_25
    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setRotateEnabled(Z)V

    .line 556
    return-void

    :cond_29
    move v0, v1

    .line 554
    goto :goto_12
.end method

.method private setAngleText(F)V
    .registers 7
    .param p1, "angle"    # F

    .prologue
    .line 491
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewRotateAngle:Landroid/widget/TextView;

    if-eqz v0, :cond_19

    .line 492
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewRotateAngle:Landroid/widget/TextView;

    const-string v1, "%.1f\u00b0"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 494
    :cond_19
    return-void
.end method

.method private setImageData(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 171
    const-string v6, "com.yalantis.ucrop.InputUri"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    .line 172
    .local v3, "inputUri":Landroid/net/Uri;
    const-string v6, "com.yalantis.ucrop.OutputUri"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    iput-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;

    .line 173
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/UCropActivity;->processOptions(Landroid/content/Intent;)V

    .line 175
    if-eqz v3, :cond_7d

    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;

    if-eqz v6, :cond_7d

    .line 177
    :try_start_1d
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v7, p0, Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;

    invoke-virtual {v6, v3, v7}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setImageUri(Landroid/net/Uri;Landroid/net/Uri;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_24} :catch_75

    .line 187
    :goto_24
    const-string v6, "com.yalantis.ucrop.AspectRatioSet"

    invoke-virtual {p1, v6, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_52

    .line 188
    iget-boolean v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v6, :cond_37

    .line 189
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateAspectRatio:Landroid/view/ViewGroup;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 192
    :cond_37
    const-string v6, "com.yalantis.ucrop.AspectRatioX"

    invoke-virtual {p1, v6, v8}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    .line 193
    .local v0, "aspectRatioX":F
    const-string v6, "com.yalantis.ucrop.AspectRatioY"

    invoke-virtual {p1, v6, v8}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v1

    .line 195
    .local v1, "aspectRatioY":F
    cmpl-float v6, v0, v8

    if-lez v6, :cond_8f

    cmpl-float v6, v1, v8

    if-lez v6, :cond_8f

    .line 196
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    div-float v7, v0, v1

    invoke-virtual {v6, v7}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setTargetAspectRatio(F)V

    .line 202
    .end local v0    # "aspectRatioX":F
    .end local v1    # "aspectRatioY":F
    :cond_52
    :goto_52
    const-string v6, "com.yalantis.ucrop.MaxSizeSet"

    invoke-virtual {p1, v6, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_74

    .line 203
    const-string v6, "com.yalantis.ucrop.MaxSizeX"

    invoke-virtual {p1, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 204
    .local v4, "maxSizeX":I
    const-string v6, "com.yalantis.ucrop.MaxSizeY"

    invoke-virtual {p1, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 206
    .local v5, "maxSizeY":I
    if-lez v4, :cond_95

    if-lez v5, :cond_95

    .line 207
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v6, v4}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setMaxResultImageSizeX(I)V

    .line 208
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v6, v5}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setMaxResultImageSizeY(I)V

    .line 213
    .end local v4    # "maxSizeX":I
    .end local v5    # "maxSizeY":I
    :cond_74
    :goto_74
    return-void

    .line 178
    :catch_75
    move-exception v2

    .line 179
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->setResultException(Ljava/lang/Throwable;)V

    .line 180
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->finish()V

    goto :goto_24

    .line 183
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_7d
    new-instance v6, Ljava/lang/NullPointerException;

    sget v7, Lcom/yalantis/ucrop/R$string;->ucrop_error_input_data_is_absent:I

    invoke-virtual {p0, v7}, Lcom/yalantis/ucrop/UCropActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lcom/yalantis/ucrop/UCropActivity;->setResultException(Ljava/lang/Throwable;)V

    .line 184
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->finish()V

    goto :goto_24

    .line 198
    .restart local v0    # "aspectRatioX":F
    .restart local v1    # "aspectRatioY":F
    :cond_8f
    iget-object v6, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v6, v8}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setTargetAspectRatio(F)V

    goto :goto_52

    .line 210
    .end local v0    # "aspectRatioX":F
    .end local v1    # "aspectRatioY":F
    .restart local v4    # "maxSizeX":I
    .restart local v5    # "maxSizeY":I
    :cond_95
    const-string v6, "UCropActivity"

    const-string v7, "EXTRA_MAX_SIZE_X and EXTRA_MAX_SIZE_Y must be greater than 0"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_74
.end method

.method private setInitialState()V
    .registers 2

    .prologue
    .line 522
    iget-boolean v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v0, :cond_18

    .line 523
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateAspectRatio:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_12

    .line 524
    sget v0, Lcom/yalantis/ucrop/R$id;->state_aspect_ratio:I

    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setWidgetState(I)V

    .line 531
    :goto_11
    return-void

    .line 526
    :cond_12
    sget v0, Lcom/yalantis/ucrop/R$id;->state_scale:I

    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setWidgetState(I)V

    goto :goto_11

    .line 529
    :cond_18
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setAllowedGestures(I)V

    goto :goto_11
.end method

.method private setScaleText(F)V
    .registers 7
    .param p1, "scale"    # F

    .prologue
    .line 497
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewScalePercent:Landroid/widget/TextView;

    if-eqz v0, :cond_1d

    .line 498
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewScalePercent:Landroid/widget/TextView;

    const-string v1, "%d%%"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v4, p1

    float-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 500
    :cond_1d
    return-void
.end method

.method private setStatusBarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 385
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_13

    .line 386
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 387
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 390
    :cond_13
    return-void
.end method

.method private setWidgetState(I)V
    .registers 7
    .param p1, "stateViewId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    const/16 v3, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 534
    iget-boolean v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v0, :cond_44

    .line 535
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateAspectRatio:Landroid/view/ViewGroup;

    sget v0, Lcom/yalantis/ucrop/R$id;->state_aspect_ratio:I

    if-ne p1, v0, :cond_4c

    move v0, v1

    :goto_f
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setSelected(Z)V

    .line 536
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateRotate:Landroid/view/ViewGroup;

    sget v0, Lcom/yalantis/ucrop/R$id;->state_rotate:I

    if-ne p1, v0, :cond_4e

    move v0, v1

    :goto_19
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setSelected(Z)V

    .line 537
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mWrapperStateScale:Landroid/view/ViewGroup;

    sget v0, Lcom/yalantis/ucrop/R$id;->state_scale:I

    if-ne p1, v0, :cond_50

    move v0, v1

    :goto_23
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setSelected(Z)V

    .line 539
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutAspectRatio:Landroid/view/ViewGroup;

    sget v0, Lcom/yalantis/ucrop/R$id;->state_aspect_ratio:I

    if-ne p1, v0, :cond_52

    move v0, v2

    :goto_2d
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 540
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutRotate:Landroid/view/ViewGroup;

    sget v0, Lcom/yalantis/ucrop/R$id;->state_rotate:I

    if-ne p1, v0, :cond_54

    move v0, v2

    :goto_37
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 541
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mLayoutScale:Landroid/view/ViewGroup;

    sget v4, Lcom/yalantis/ucrop/R$id;->state_scale:I

    if-ne p1, v4, :cond_41

    move v3, v2

    :cond_41
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 544
    :cond_44
    sget v0, Lcom/yalantis/ucrop/R$id;->state_scale:I

    if-ne p1, v0, :cond_56

    .line 545
    invoke-direct {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->setAllowedGestures(I)V

    .line 551
    :goto_4b
    return-void

    :cond_4c
    move v0, v2

    .line 535
    goto :goto_f

    :cond_4e
    move v0, v2

    .line 536
    goto :goto_19

    :cond_50
    move v0, v2

    .line 537
    goto :goto_23

    :cond_52
    move v0, v3

    .line 539
    goto :goto_2d

    :cond_54
    move v0, v3

    .line 540
    goto :goto_37

    .line 546
    :cond_56
    sget v0, Lcom/yalantis/ucrop/R$id;->state_rotate:I

    if-ne p1, v0, :cond_5e

    .line 547
    invoke-direct {p0, v1}, Lcom/yalantis/ucrop/UCropActivity;->setAllowedGestures(I)V

    goto :goto_4b

    .line 549
    :cond_5e
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setAllowedGestures(I)V

    goto :goto_4b
.end method

.method private setupAppBar()V
    .registers 7

    .prologue
    .line 290
    iget v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mStatusBarColor:I

    invoke-direct {p0, v4}, Lcom/yalantis/ucrop/UCropActivity;->setStatusBarColor(I)V

    .line 292
    sget v4, Lcom/yalantis/ucrop/R$id;->toolbar:I

    invoke-virtual {p0, v4}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/Toolbar;

    .line 295
    .local v2, "toolbar":Landroid/support/v7/widget/Toolbar;
    iget v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarColor:I

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 296
    iget v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/Toolbar;->setTitleTextColor(I)V

    .line 298
    sget v4, Lcom/yalantis/ucrop/R$id;->toolbar_title:I

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 299
    .local v3, "toolbarTitle":Landroid/widget/TextView;
    iget v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 300
    iget-object v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarTitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 303
    sget v4, Lcom/yalantis/ucrop/R$drawable;->ucrop_ic_cross:I

    invoke-static {p0, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 304
    .local v1, "stateButtonDrawable":Landroid/graphics/drawable/Drawable;
    iget v4, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v4, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 305
    invoke-virtual {v2, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 307
    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 308
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 309
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_4a

    .line 310
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 312
    :cond_4a
    return-void
.end method

.method private setupAspectRatioWidget()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 395
    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_1_1:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    iget v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v2, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setActiveColor(I)V

    .line 396
    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_3_4:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    iget v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v2, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setActiveColor(I)V

    .line 397
    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_original:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    iget v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v2, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setActiveColor(I)V

    .line 398
    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_3_2:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    iget v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v2, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setActiveColor(I)V

    .line 399
    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_16_9:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;

    iget v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v2, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setActiveColor(I)V

    .line 401
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_1_1:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 402
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_3_4:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_original:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 404
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_3_2:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 405
    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    sget v2, Lcom/yalantis/ucrop/R$id;->crop_aspect_ratio_16_9:I

    invoke-virtual {p0, v2}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    const/4 v3, 0x2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setSelected(Z)V

    .line 408
    iget-object v2, p0, Lcom/yalantis/ucrop/UCropActivity;->mCropAspectRatioViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 409
    .local v0, "cropAspectRatioView":Landroid/view/ViewGroup;
    new-instance v2, Lcom/yalantis/ucrop/UCropActivity$2;

    invoke-direct {v2, p0}, Lcom/yalantis/ucrop/UCropActivity$2;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_b4

    .line 423
    .end local v0    # "cropAspectRatioView":Landroid/view/ViewGroup;
    :cond_c9
    return-void
.end method

.method private setupRotateWidget()V
    .registers 3

    .prologue
    .line 426
    sget v0, Lcom/yalantis/ucrop/R$id;->text_view_rotate:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewRotateAngle:Landroid/widget/TextView;

    .line 427
    sget v0, Lcom/yalantis/ucrop/R$id;->rotate_scroll_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;

    new-instance v1, Lcom/yalantis/ucrop/UCropActivity$3;

    invoke-direct {v1, p0}, Lcom/yalantis/ucrop/UCropActivity$3;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->setScrollingListener(Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;)V

    .line 445
    sget v0, Lcom/yalantis/ucrop/R$id;->rotate_scroll_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;

    iget v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->setMiddleLineColor(I)V

    .line 448
    sget v0, Lcom/yalantis/ucrop/R$id;->wrapper_reset_rotate:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yalantis/ucrop/UCropActivity$4;

    invoke-direct {v1, p0}, Lcom/yalantis/ucrop/UCropActivity$4;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 454
    sget v0, Lcom/yalantis/ucrop/R$id;->wrapper_rotate_by_angle:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/yalantis/ucrop/UCropActivity$5;

    invoke-direct {v1, p0}, Lcom/yalantis/ucrop/UCropActivity$5;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 460
    return-void
.end method

.method private setupScaleWidget()V
    .registers 3

    .prologue
    .line 463
    sget v0, Lcom/yalantis/ucrop/R$id;->text_view_scale:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mTextViewScalePercent:Landroid/widget/TextView;

    .line 464
    sget v0, Lcom/yalantis/ucrop/R$id;->scale_scroll_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;

    new-instance v1, Lcom/yalantis/ucrop/UCropActivity$6;

    invoke-direct {v1, p0}, Lcom/yalantis/ucrop/UCropActivity$6;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->setScrollingListener(Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;)V

    .line 487
    sget v0, Lcom/yalantis/ucrop/R$id;->scale_scroll_wheel:I

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;

    iget v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->setMiddleLineColor(I)V

    .line 488
    return-void
.end method

.method private setupStatesWrapper()V
    .registers 7

    .prologue
    .line 368
    sget v3, Lcom/yalantis/ucrop/R$id;->image_view_state_scale:I

    invoke-virtual {p0, v3}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 369
    .local v2, "stateScaleImageView":Landroid/widget/ImageView;
    sget v3, Lcom/yalantis/ucrop/R$id;->image_view_state_rotate:I

    invoke-virtual {p0, v3}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 370
    .local v1, "stateRotateImageView":Landroid/widget/ImageView;
    sget v3, Lcom/yalantis/ucrop/R$id;->image_view_state_aspect_ratio:I

    invoke-virtual {p0, v3}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 372
    .local v0, "stateAspectRatioImageView":Landroid/widget/ImageView;
    new-instance v3, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget v5, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-direct {v3, v4, v5}, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 373
    new-instance v3, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget v5, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-direct {v3, v4, v5}, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 374
    new-instance v3, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget v5, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    invoke-direct {v3, v4, v5}, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 375
    return-void
.end method

.method private setupViews(Landroid/content/Intent;)V
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 261
    const-string v1, "com.yalantis.ucrop.StatusBarColor"

    sget v3, Lcom/yalantis/ucrop/R$color;->ucrop_color_statusbar:I

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mStatusBarColor:I

    .line 262
    const-string v1, "com.yalantis.ucrop.ToolbarColor"

    sget v3, Lcom/yalantis/ucrop/R$color;->ucrop_color_toolbar:I

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarColor:I

    .line 263
    const-string v1, "com.yalantis.ucrop.UcropColorWidgetActive"

    sget v3, Lcom/yalantis/ucrop/R$color;->ucrop_color_widget_active:I

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mActiveWidgetColor:I

    .line 264
    const-string v1, "com.yalantis.ucrop.UcropToolbarWidgetColor"

    sget v3, Lcom/yalantis/ucrop/R$color;->ucrop_color_toolbar_widget:I

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    .line 265
    const-string v1, "com.yalantis.ucrop.UcropToolbarTitleText"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarTitle:Ljava/lang/String;

    .line 266
    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarTitle:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8e

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarTitle:Ljava/lang/String;

    :goto_4b
    iput-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarTitle:Ljava/lang/String;

    .line 267
    const-string v1, "com.yalantis.ucrop.UcropLogoColor"

    sget v3, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_logo:I

    invoke-static {p0, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mLogoColor:I

    .line 268
    const-string v1, "com.yalantis.ucrop.HideBottomControls"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_99

    const/4 v1, 0x1

    :goto_64
    iput-boolean v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    .line 270
    iget-boolean v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v1, :cond_77

    .line 271
    sget v1, Lcom/yalantis/ucrop/R$id;->ucrop_photobox:I

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/UCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 272
    .local v0, "photoBox":Landroid/view/ViewGroup;
    sget v1, Lcom/yalantis/ucrop/R$layout;->ucrop_controls:I

    invoke-static {p0, v1, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 275
    .end local v0    # "photoBox":Landroid/view/ViewGroup;
    :cond_77
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setupAppBar()V

    .line 276
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->initiateRootViews()V

    .line 278
    iget-boolean v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowBottomControls:Z

    if-eqz v1, :cond_8d

    .line 279
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setupAspectRatioWidget()V

    .line 280
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setupRotateWidget()V

    .line 281
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setupScaleWidget()V

    .line 282
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setupStatesWrapper()V

    .line 284
    :cond_8d
    return-void

    .line 266
    :cond_8e
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v3, Lcom/yalantis/ucrop/R$string;->ucrop_label_edit_photo:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4b

    :cond_99
    move v1, v2

    .line 268
    goto :goto_64
.end method


# virtual methods
.method protected cropAndSaveImage()V
    .registers 6

    .prologue
    const/4 v1, 0x1

    .line 576
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mBlockingView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 577
    iput-boolean v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z

    .line 578
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->supportInvalidateOptionsMenu()V

    .line 580
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v2, p0, Lcom/yalantis/ucrop/UCropActivity;->mCompressQuality:I

    iget-object v3, p0, Lcom/yalantis/ucrop/UCropActivity;->mOutputUri:Landroid/net/Uri;

    new-instance v4, Lcom/yalantis/ucrop/UCropActivity$8;

    invoke-direct {v4, p0}, Lcom/yalantis/ucrop/UCropActivity$8;-><init>(Lcom/yalantis/ucrop/UCropActivity;)V

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/yalantis/ucrop/view/GestureCropImageView;->cropAndSaveImage(Landroid/graphics/Bitmap$CompressFormat;ILandroid/net/Uri;Lcom/yalantis/ucrop/callback/BitmapCropCallback;)V

    .line 594
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 101
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 102
    sget v1, Lcom/yalantis/ucrop/R$layout;->ucrop_activity_photobox:I

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/UCropActivity;->setContentView(I)V

    .line 104
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 106
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setupViews(Landroid/content/Intent;)V

    .line 107
    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/UCropActivity;->setImageData(Landroid/content/Intent;)V

    .line 108
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->setInitialState()V

    .line 109
    invoke-direct {p0}, Lcom/yalantis/ucrop/UCropActivity;->addBlockingView()V

    .line 110
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 13
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v10, 0x1

    .line 114
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v5

    sget v6, Lcom/yalantis/ucrop/R$menu;->ucrop_menu_activity:I

    invoke-virtual {v5, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 118
    sget v5, Lcom/yalantis/ucrop/R$id;->menu_loader:I

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 119
    .local v3, "menuItemLoader":Landroid/view/MenuItem;
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 120
    .local v4, "menuItemLoaderIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v4, :cond_2c

    .line 122
    :try_start_16
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 123
    iget v5, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 124
    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    :try_end_23
    .catch Ljava/lang/IllegalStateException; {:try_start_16 .. :try_end_23} :catch_46

    .line 128
    :goto_23
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    check-cast v5, Landroid/graphics/drawable/Animatable;

    invoke-interface {v5}, Landroid/graphics/drawable/Animatable;->start()V

    .line 131
    :cond_2c
    sget v5, Lcom/yalantis/ucrop/R$id;->menu_crop:I

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 132
    .local v1, "menuItemCrop":Landroid/view/MenuItem;
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 133
    .local v2, "menuItemCropIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_45

    .line 134
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 135
    iget v5, p0, Lcom/yalantis/ucrop/UCropActivity;->mToolbarWidgetColor:I

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 136
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 139
    :cond_45
    return v10

    .line 125
    .end local v1    # "menuItemCrop":Landroid/view/MenuItem;
    .end local v2    # "menuItemCropIcon":Landroid/graphics/drawable/Drawable;
    :catch_46
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v5, "UCropActivity"

    const-string v6, "%s - %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    sget v8, Lcom/yalantis/ucrop/R$string;->ucrop_mutate_exception_hint:I

    invoke-virtual {p0, v8}, Lcom/yalantis/ucrop/UCropActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_23
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 151
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v1, Lcom/yalantis/ucrop/R$id;->menu_crop:I

    if-ne v0, v1, :cond_10

    .line 152
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->cropAndSaveImage()V

    .line 156
    :cond_b
    :goto_b
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    .line 153
    :cond_10
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_b

    .line 154
    invoke-virtual {p0}, Lcom/yalantis/ucrop/UCropActivity;->onBackPressed()V

    goto :goto_b
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 144
    sget v0, Lcom/yalantis/ucrop/R$id;->menu_crop:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-boolean v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    :goto_b
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 145
    sget v0, Lcom/yalantis/ucrop/R$id;->menu_loader:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-boolean v1, p0, Lcom/yalantis/ucrop/UCropActivity;->mShowLoader:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 146
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    .line 144
    :cond_1e
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 161
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStop()V

    .line 162
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    if-eqz v0, :cond_c

    .line 163
    iget-object v0, p0, Lcom/yalantis/ucrop/UCropActivity;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->cancelAllAnimations()V

    .line 165
    :cond_c
    return-void
.end method

.method protected setResultException(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 603
    const/16 v0, 0x60

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.yalantis.ucrop.Error"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/yalantis/ucrop/UCropActivity;->setResult(ILandroid/content/Intent;)V

    .line 604
    return-void
.end method

.method protected setResultUri(Landroid/net/Uri;F)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "resultAspectRatio"    # F

    .prologue
    .line 597
    const/4 v0, -0x1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.yalantis.ucrop.OutputUri"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.yalantis.ucrop.CropAspectRatio"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/yalantis/ucrop/UCropActivity;->setResult(ILandroid/content/Intent;)V

    .line 600
    return-void
.end method
