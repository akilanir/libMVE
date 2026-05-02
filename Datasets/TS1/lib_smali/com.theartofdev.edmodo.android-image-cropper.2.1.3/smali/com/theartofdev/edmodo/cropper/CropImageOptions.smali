.class final Lcom/theartofdev/edmodo/cropper/CropImageOptions;
.super Ljava/lang/Object;
.source "CropImageOptions.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImageOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public activityMenuIconColor:I

.field public activityTitle:Ljava/lang/String;

.field public allowRotation:Z

.field public aspectRatioX:I

.field public aspectRatioY:I

.field public autoZoomEnabled:Z

.field public backgroundColor:I

.field public borderCornerColor:I

.field public borderCornerLength:F

.field public borderCornerOffset:F

.field public borderCornerThickness:F

.field public borderLineColor:I

.field public borderLineThickness:F

.field public cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

.field public fixAspectRatio:Z

.field public guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

.field public guidelinesColor:I

.field public guidelinesThickness:F

.field public initialCropWindowPaddingRatio:F

.field public initialCropWindowRectangle:Landroid/graphics/Rect;

.field public initialRotation:I

.field public maxCropResultHeight:I

.field public maxCropResultWidth:I

.field public maxZoom:I

.field public minCropResultHeight:I

.field public minCropResultWidth:I

.field public minCropWindowHeight:I

.field public minCropWindowWidth:I

.field public noOutputImage:Z

.field public outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field public outputCompressQuality:I

.field public outputRequestHeight:I

.field public outputRequestWidth:I

.field public outputUri:Landroid/net/Uri;

.field public scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

.field public showCropOverlay:Z

.field public showProgressBar:Z

.field public snapRadius:F

.field public touchRadius:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions$1;

    invoke-direct {v0}, Lcom/theartofdev/edmodo/cropper/CropImageOptions$1;-><init>()V

    sput-object v0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .prologue
    const/high16 v6, 0x42280000    # 42.0f

    const/high16 v5, 0x40400000    # 3.0f

    const/16 v4, 0xff

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 252
    .local v0, "dm":Landroid/util/DisplayMetrics;
    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 253
    invoke-static {v2, v5, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    .line 254
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    .line 255
    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->ON_TOUCH:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .line 256
    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->FIT_CENTER:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 257
    iput-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    .line 258
    iput-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showProgressBar:Z

    .line 259
    iput-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    .line 260
    const/4 v1, 0x4

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    .line 261
    const v1, 0x3dcccccd    # 0.1f

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    .line 263
    iput-boolean v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    .line 264
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    .line 265
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    .line 267
    invoke-static {v2, v5, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    .line 268
    const/16 v1, 0xaa

    invoke-static {v1, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    .line 269
    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    .line 270
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    .line 271
    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    .line 272
    const/4 v1, -0x1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    .line 274
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    .line 275
    const/16 v1, 0xaa

    invoke-static {v1, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    .line 276
    const/16 v1, 0x77

    invoke-static {v1, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    .line 278
    invoke-static {v2, v6, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    .line 279
    invoke-static {v2, v6, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    .line 280
    const/16 v1, 0x28

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    .line 281
    const/16 v1, 0x28

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    .line 282
    const v1, 0x1869f

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    .line 283
    const v1, 0x1869f

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    .line 285
    const-string v1, ""

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    .line 286
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    .line 288
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputUri:Landroid/net/Uri;

    .line 289
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 290
    const/16 v1, 0x5a

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressQuality:I

    .line 291
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    .line 292
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    .line 293
    iput-boolean v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->noOutputImage:Z

    .line 295
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    .line 296
    const/4 v1, -0x1

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    .line 297
    iput-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->allowRotation:Z

    .line 298
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 304
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 305
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    .line 306
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    .line 307
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .line 308
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aget-object v0, v0, v3

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 309
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_127

    move v0, v1

    :goto_3c
    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    .line 310
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_12a

    move v0, v1

    :goto_45
    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showProgressBar:Z

    .line 311
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_12d

    move v0, v1

    :goto_4e
    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    .line 312
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    .line 313
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    .line 314
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_130

    move v0, v1

    :goto_63
    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    .line 315
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    .line 316
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    .line 317
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    .line 318
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    .line 319
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    .line 320
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    .line 321
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    .line 322
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    .line 323
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    .line 324
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    .line 325
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    .line 326
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    .line 327
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    .line 328
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    .line 329
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    .line 330
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    .line 331
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    .line 332
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    .line 333
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    .line 334
    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputUri:Landroid/net/Uri;

    .line 335
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/Bitmap$CompressFormat;->valueOf(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 336
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressQuality:I

    .line 337
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    .line 338
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    .line 339
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_133

    move v0, v1

    :goto_108
    iput-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->noOutputImage:Z

    .line 340
    const-class v0, Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    .line 341
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    .line 342
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_135

    :goto_124
    iput-boolean v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->allowRotation:Z

    .line 343
    return-void

    :cond_127
    move v0, v2

    .line 309
    goto/16 :goto_3c

    :cond_12a
    move v0, v2

    .line 310
    goto/16 :goto_45

    :cond_12d
    move v0, v2

    .line 311
    goto/16 :goto_4e

    :cond_130
    move v0, v2

    .line 314
    goto/16 :goto_63

    :cond_133
    move v0, v2

    .line 339
    goto :goto_108

    :cond_135
    move v1, v2

    .line 342
    goto :goto_124
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 390
    const/4 v0, 0x0

    return v0
.end method

.method public validate()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 399
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    if-gez v0, :cond_d

    .line 400
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set max zoom to a number < 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 402
    :cond_d
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    cmpg-float v0, v0, v4

    if-gez v0, :cond_1b

    .line 403
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set touch radius value to a number <= 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_1b
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    cmpg-float v0, v0, v4

    if-ltz v0, :cond_2a

    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    float-to-double v0, v0

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_32

    .line 406
    :cond_2a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set initial crop window padding value to a number < 0 or >= 0.5"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 408
    :cond_32
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    if-gtz v0, :cond_3e

    .line 409
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 411
    :cond_3e
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    if-gtz v0, :cond_4a

    .line 412
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 414
    :cond_4a
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    cmpg-float v0, v0, v4

    if-gez v0, :cond_58

    .line 415
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set line thickness value to a number less than 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_58
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    cmpg-float v0, v0, v4

    if-gez v0, :cond_66

    .line 418
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set corner thickness value to a number less than 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 420
    :cond_66
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    cmpg-float v0, v0, v4

    if-gez v0, :cond_74

    .line 421
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set guidelines thickness value to a number less than 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 423
    :cond_74
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    if-gez v0, :cond_80

    .line 424
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set min crop window height value to a number < 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 426
    :cond_80
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    if-gez v0, :cond_8c

    .line 427
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set min crop result width value to a number < 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    :cond_8c
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    if-gez v0, :cond_98

    .line 430
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set min crop result height value to a number < 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 432
    :cond_98
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    if-ge v0, v1, :cond_a6

    .line 433
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set max crop result width to smaller value than min crop result width"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 435
    :cond_a6
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    if-ge v0, v1, :cond_b4

    .line 436
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set max crop result height to smaller value than min crop result height"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 438
    :cond_b4
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    if-gez v0, :cond_c0

    .line 439
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set request width value to a number < 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 441
    :cond_c0
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    if-gez v0, :cond_cc

    .line 442
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set request height value to a number < 0 "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 444
    :cond_cc
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 347
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 348
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 349
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 350
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 351
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 352
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    if-eqz v0, :cond_ec

    move v0, v1

    :goto_2c
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 353
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showProgressBar:Z

    if-eqz v0, :cond_ef

    move v0, v1

    :goto_35
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 354
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    if-eqz v0, :cond_f2

    move v0, v1

    :goto_3e
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 355
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 356
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 357
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    if-eqz v0, :cond_f5

    move v0, v1

    :goto_51
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 358
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 359
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 360
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 361
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 362
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 363
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 364
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 365
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 366
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 367
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 368
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 369
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 370
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 371
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 372
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 373
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 374
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 375
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 376
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->activityMenuIconColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 377
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 378
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v0}, Landroid/graphics/Bitmap$CompressFormat;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 379
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputCompressQuality:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 380
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestWidth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 381
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->outputRequestHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 382
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->noOutputImage:Z

    if-eqz v0, :cond_f8

    move v0, v1

    :goto_d6
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 383
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowRectangle:Landroid/graphics/Rect;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 384
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialRotation:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 385
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->allowRotation:Z

    if-eqz v0, :cond_fa

    :goto_e7
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 386
    return-void

    :cond_ec
    move v0, v2

    .line 352
    goto/16 :goto_2c

    :cond_ef
    move v0, v2

    .line 353
    goto/16 :goto_35

    :cond_f2
    move v0, v2

    .line 354
    goto/16 :goto_3e

    :cond_f5
    move v0, v2

    .line 357
    goto/16 :goto_51

    :cond_f8
    move v0, v2

    .line 382
    goto :goto_d6

    :cond_fa
    move v1, v2

    .line 385
    goto :goto_e7
.end method
