.class public Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
.super Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
.source "IonImageViewRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/ion/builder/Builders$IV$F;
.implements Lcom/koushikdutta/ion/builder/ImageViewFutureBuilder;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

.field crossfade:Z

.field errorDrawable:Landroid/graphics/drawable/Drawable;

.field errorResource:I

.field fadeIn:Z

.field imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

.field inAnimation:Landroid/view/animation/Animation;

.field inAnimationResource:I

.field loadAnimation:Landroid/view/animation/Animation;

.field loadAnimationResource:I

.field placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field placeholderResource:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 3
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;-><init>(Lcom/koushikdutta/ion/Ion;)V

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn:Z

    .line 34
    sget-object v0, Lcom/koushikdutta/ion/BitmapDrawableFactory;->DEFAULT:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V
    .registers 3
    .param p1, "builder"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn:Z

    .line 34
    sget-object v0, Lcom/koushikdutta/ion/BitmapDrawableFactory;->DEFAULT:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 38
    return-void
.end method

.method private static getAdjustViewBounds(Landroid/widget/ImageView;)Z
    .registers 3
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 122
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_e

    invoke-static {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->getAdjustViewBounds_16(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static getAdjustViewBounds_16(Landroid/widget/ImageView;)Z
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0}, Landroid/widget/ImageView;->getAdjustViewBounds()Z

    move-result v0

    return v0
.end method

.method private getImageViewDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 191
    iget-object v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 192
    .local v0, "iv":Landroid/widget/ImageView;
    if-nez v0, :cond_c

    .line 193
    const/4 v1, 0x0

    .line 194
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_b
.end method

.method private setIonDrawable(Landroid/widget/ImageView;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 11
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "bitmapFetcher"    # Lcom/koushikdutta/ion/BitmapFetcher;
    .param p3, "servedFrom"    # Lcom/koushikdutta/ion/ResponseServedFrom;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 89
    const/4 v0, 0x0

    .line 90
    .local v0, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz p2, :cond_7

    .line 91
    iget-object v0, p2, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 92
    :cond_7
    if-eqz v0, :cond_a

    .line 93
    const/4 p2, 0x0

    .line 95
    :cond_a
    invoke-static {p1}, Lcom/koushikdutta/ion/IonDrawable;->getOrCreateIonDrawable(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget-object v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 96
    invoke-virtual {v2, v5}, Lcom/koushikdutta/ion/IonDrawable;->ion(Lcom/koushikdutta/ion/Ion;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    .line 97
    invoke-virtual {v2, v0, p3}, Lcom/koushikdutta/ion/IonDrawable;->setBitmap(Lcom/koushikdutta/ion/bitmap/BitmapInfo;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    .line 98
    invoke-virtual {v2, p2}, Lcom/koushikdutta/ion/IonDrawable;->setBitmapFetcher(Lcom/koushikdutta/ion/BitmapFetcher;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v5

    iget-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    sget-object v6, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    if-ne v2, v6, :cond_5a

    move v2, v3

    .line 99
    :goto_23
    invoke-virtual {v5, v2}, Lcom/koushikdutta/ion/IonDrawable;->setRepeatAnimation(Z)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeWidth:I

    iget v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeHeight:I

    .line 100
    invoke-virtual {v2, v5, v6}, Lcom/koushikdutta/ion/IonDrawable;->setSize(II)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorResource:I

    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 101
    invoke-virtual {v2, v5, v6}, Lcom/koushikdutta/ion/IonDrawable;->setError(ILandroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderResource:I

    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 102
    invoke-virtual {v2, v5, v6}, Lcom/koushikdutta/ion/IonDrawable;->setPlaceholder(ILandroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget-boolean v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn:Z

    if-nez v5, :cond_47

    iget-boolean v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->crossfade:Z

    if-eqz v5, :cond_48

    :cond_47
    move v4, v3

    .line 103
    :cond_48
    invoke-virtual {v2, v4}, Lcom/koushikdutta/ion/IonDrawable;->setFadeIn(Z)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 104
    invoke-virtual {v2, v3}, Lcom/koushikdutta/ion/IonDrawable;->setBitmapDrawableFactory(Lcom/koushikdutta/ion/BitmapDrawableFactory;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lcom/koushikdutta/ion/IonDrawable;->updateLayers()Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v1

    .line 106
    .local v1, "ret":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    return-object v1

    .end local v1    # "ret":Lcom/koushikdutta/ion/IonDrawable;
    :cond_5a
    move v2, v4

    .line 98
    goto :goto_23
.end method


# virtual methods
.method public bridge synthetic addDefaultTransform()V
    .registers 1

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    return-void
.end method

.method public bridge synthetic animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public animateIn(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "animationResource"    # I

    .prologue
    .line 275
    iput p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimationResource:I

    .line 276
    return-object p0
.end method

.method public animateIn(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "in"    # Landroid/view/animation/Animation;

    .prologue
    .line 257
    iput-object p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimation:Landroid/view/animation/Animation;

    .line 258
    return-object p0
.end method

.method public bridge synthetic animateIn(I)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->animateIn(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic animateIn(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/view/animation/Animation;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->animateIn(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public animateLoad(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "animationResource"    # I

    .prologue
    .line 269
    iput p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimationResource:I

    .line 270
    return-object p0
.end method

.method public animateLoad(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "load"    # Landroid/view/animation/Animation;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimation:Landroid/view/animation/Animation;

    .line 264
    return-object p0
.end method

.method public bridge synthetic animateLoad(I)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->animateLoad(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic animateLoad(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/view/animation/Animation;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->animateLoad(Landroid/view/animation/Animation;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic asBitmap()Lcom/koushikdutta/async/future/Future;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->asBitmap()Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    return-object v0
.end method

.method public bitmapDrawableFactory(Lcom/koushikdutta/ion/BitmapDrawableFactory;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "bitmapDrawableFactory"    # Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 282
    return-object p0
.end method

.method public bridge synthetic bitmapDrawableFactory(Lcom/koushikdutta/ion/BitmapDrawableFactory;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory(Lcom/koushikdutta/ion/BitmapDrawableFactory;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic centerCrop()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerCrop()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public crossfade(Z)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "crossfade"    # Z

    .prologue
    .line 227
    iput-boolean p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->crossfade:Z

    .line 228
    return-object p0
.end method

.method public bridge synthetic crossfade(Z)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->crossfade(Z)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected ensureBuilder()Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4

    .prologue
    .line 63
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    if-nez v0, :cond_1b

    .line 64
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/ion/ContextReference;->fromContext(Landroid/content/Context;)Lcom/koushikdutta/ion/ContextReference;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;-><init>(Lcom/koushikdutta/ion/ContextReference;Lcom/koushikdutta/ion/Ion;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 65
    :cond_1b
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    return-object v0
.end method

.method public error(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "resourceId"    # I

    .prologue
    .line 251
    iput p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorResource:I

    .line 252
    return-object p0
.end method

.method public error(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 246
    return-object p0
.end method

.method public bridge synthetic error(I)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->error(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic error(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->error(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public fadeIn(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2
    .param p1, "fadeIn"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn:Z

    .line 113
    return-object p0
.end method

.method public bridge synthetic fadeIn(Z)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 199
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->getImageViewDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 200
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_8

    .line 210
    :cond_7
    :goto_7
    return-object v2

    .line 202
    :cond_8
    instance-of v3, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_14

    move-object v2, v0

    .line 203
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_7

    .line 204
    :cond_14
    instance-of v3, v0, Lcom/koushikdutta/ion/IonDrawable;

    if-eqz v3, :cond_7

    move-object v1, v0

    .line 206
    check-cast v1, Lcom/koushikdutta/ion/IonDrawable;

    .line 207
    .local v1, "id":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {v1}, Lcom/koushikdutta/ion/IonDrawable;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 208
    instance-of v3, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v3, :cond_7

    move-object v2, v0

    .line 209
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_7
.end method

.method public getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 215
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->getImageViewDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 216
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_8

    .line 221
    :cond_7
    :goto_7
    return-object v2

    .line 218
    :cond_8
    instance-of v3, v0, Lcom/koushikdutta/ion/IonDrawable;

    if-eqz v3, :cond_7

    move-object v1, v0

    .line 220
    check-cast v1, Lcom/koushikdutta/ion/IonDrawable;

    .line 221
    .local v1, "id":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {v1}, Lcom/koushikdutta/ion/IonDrawable;->getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v2

    goto :goto_7
.end method

.method public intoImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/future/ImageViewFuture;
    .registers 11
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    const/4 v8, 0x0

    .line 127
    sget-boolean v6, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->$assertionsDisabled:Z

    if-nez v6, :cond_19

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v7

    if-eq v6, v7, :cond_19

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 128
    :cond_19
    if-nez p1, :cond_23

    .line 129
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "imageView"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 132
    :cond_23
    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v6, v6, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    if-nez v6, :cond_35

    .line 133
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_NETWORK:Lcom/koushikdutta/ion/ResponseServedFrom;

    invoke-direct {p0, p1, v8, v6}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->setIonDrawable(Landroid/widget/ImageView;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v6

    invoke-virtual {v6}, Lcom/koushikdutta/ion/IonDrawable;->cancel()V

    .line 134
    sget-object v2, Lcom/koushikdutta/ion/ImageViewFutureImpl;->FUTURE_IMAGEVIEW_NULL_URI:Lcom/koushikdutta/ion/ImageViewFutureImpl;

    .line 187
    :goto_34
    return-object v2

    .line 137
    :cond_35
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->withImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    .line 139
    iget-boolean v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->crossfade:Z

    if-eqz v6, :cond_4e

    .line 140
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 141
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v6, v1, Lcom/koushikdutta/ion/IonDrawable;

    if-eqz v6, :cond_4b

    move-object v3, v1

    .line 142
    check-cast v3, Lcom/koushikdutta/ion/IonDrawable;

    .line 143
    .local v3, "ionDrawable":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {v3}, Lcom/koushikdutta/ion/IonDrawable;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 145
    .end local v3    # "ionDrawable":Lcom/koushikdutta/ion/IonDrawable;
    :cond_4b
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    .line 148
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_4e
    iget v5, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeWidth:I

    .line 149
    .local v5, "sampleWidth":I
    iget v4, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeHeight:I

    .line 152
    .local v4, "sampleHeight":I
    iget v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeHeight:I

    if-nez v6, :cond_a1

    iget v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->resizeWidth:I

    if-nez v6, :cond_a1

    invoke-static {p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->getAdjustViewBounds(Landroid/widget/ImageView;)Z

    move-result v6

    if-nez v6, :cond_a1

    .line 158
    invoke-virtual {p1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v5

    .line 159
    invoke-virtual {p1}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v4

    .line 166
    :goto_68
    invoke-virtual {p0, v5, v4}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->executeCache(II)Lcom/koushikdutta/ion/BitmapFetcher;

    move-result-object v0

    .line 167
    .local v0, "bitmapFetcher":Lcom/koushikdutta/ion/BitmapFetcher;
    iget-object v6, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v6, :cond_a5

    .line 168
    const/4 v6, 0x0

    invoke-static {p1, v8, v6}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->doAnimation(Landroid/widget/ImageView;Landroid/view/animation/Animation;I)V

    .line 169
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_MEMORY:Lcom/koushikdutta/ion/ResponseServedFrom;

    invoke-direct {p0, p1, v0, v6}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->setIonDrawable(Landroid/widget/ImageView;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v1

    .line 170
    .local v1, "drawable":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {v1}, Lcom/koushikdutta/ion/IonDrawable;->cancel()V

    .line 171
    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-static {v6, v1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->getOrCreateImageViewFuture(Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;Lcom/koushikdutta/ion/IonDrawable;)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimation:Landroid/view/animation/Animation;

    iget v8, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimationResource:I

    .line 172
    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setInAnimation(Landroid/view/animation/Animation;I)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 173
    invoke-virtual {v6, v7}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setScaleMode(Lcom/koushikdutta/ion/ScaleMode;)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v2

    .line 174
    .local v2, "imageViewFuture":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-static {p1, v6}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->applyScaleMode(Landroid/widget/ImageView;Lcom/koushikdutta/ion/ScaleMode;)V

    .line 175
    invoke-virtual {v2}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->reset()Lcom/koushikdutta/async/future/SimpleFuture;

    .line 176
    iget-object v6, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    invoke-virtual {v2, v6, p1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_34

    .line 162
    .end local v0    # "bitmapFetcher":Lcom/koushikdutta/ion/BitmapFetcher;
    .end local v1    # "drawable":Lcom/koushikdutta/ion/IonDrawable;
    .end local v2    # "imageViewFuture":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    :cond_a1
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->addDefaultTransform()V

    goto :goto_68

    .line 180
    .restart local v0    # "bitmapFetcher":Lcom/koushikdutta/ion/BitmapFetcher;
    :cond_a5
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_NETWORK:Lcom/koushikdutta/ion/ResponseServedFrom;

    invoke-direct {p0, p1, v0, v6}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->setIonDrawable(Landroid/widget/ImageView;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v1

    .line 181
    .restart local v1    # "drawable":Lcom/koushikdutta/ion/IonDrawable;
    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimation:Landroid/view/animation/Animation;

    iget v7, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimationResource:I

    invoke-static {p1, v6, v7}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->doAnimation(Landroid/widget/ImageView;Landroid/view/animation/Animation;I)V

    .line 182
    iget-object v6, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-static {v6, v1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->getOrCreateImageViewFuture(Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;Lcom/koushikdutta/ion/IonDrawable;)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimation:Landroid/view/animation/Animation;

    iget v8, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimationResource:I

    .line 183
    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setInAnimation(Landroid/view/animation/Animation;I)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 184
    invoke-virtual {v6, v7}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setScaleMode(Lcom/koushikdutta/ion/ScaleMode;)Lcom/koushikdutta/ion/ImageViewFutureImpl;

    move-result-object v2

    .line 185
    .restart local v2    # "imageViewFuture":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    invoke-virtual {v2}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->reset()Lcom/koushikdutta/async/future/SimpleFuture;

    goto/16 :goto_34
.end method

.method public bridge synthetic isLocallyCached()Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;
    .registers 2

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->isLocallyCached()Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->ensureBuilder()Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 78
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->load(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 79
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->intoImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/future/ImageViewFuture;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/String;)Lcom/koushikdutta/ion/future/ImageViewFuture;
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->ensureBuilder()Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 71
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->load(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 72
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->intoImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/future/ImageViewFuture;

    move-result-object v0

    return-object v0
.end method

.method public placeholder(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "resourceId"    # I

    .prologue
    .line 239
    iput p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderResource:I

    .line 240
    return-object p0
.end method

.method public placeholder(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 234
    return-object p0
.end method

.method public bridge synthetic placeholder(I)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholder(I)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic placeholder(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/bitmap/PostProcess;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic removeCachedBitmap()V
    .registers 1

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->removeCachedBitmap()V

    return-void
.end method

.method reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 46
    invoke-super {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->reset()V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->fadeIn:Z

    .line 48
    iput-boolean v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->crossfade:Z

    .line 49
    iput-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    .line 50
    iput-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    .line 51
    sget-object v0, Lcom/koushikdutta/ion/BitmapDrawableFactory;->DEFAULT:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 52
    iput v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->placeholderResource:I

    .line 53
    iput-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 54
    iput v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->errorResource:I

    .line 55
    iput-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimation:Landroid/view/animation/Animation;

    .line 56
    iput v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->inAnimationResource:I

    .line 57
    iput-object v2, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimation:Landroid/view/animation/Animation;

    .line 58
    iput v1, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->loadAnimationResource:I

    .line 59
    return-void
.end method

.method public bridge synthetic resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # I

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeWidth(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic smartSize(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->smartSize(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/bitmap/Transform;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method withImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 3
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_13

    .line 84
    :cond_c
    new-instance v0, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-direct {v0, p1}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->imageViewPostRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    .line 85
    :cond_13
    return-object p0
.end method
