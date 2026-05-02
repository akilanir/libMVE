.class abstract Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
.super Ljava/lang/Object;
.source "IonBitmapRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/ion/builder/BitmapFutureBuilder;
.implements Lcom/koushikdutta/ion/builder/Builders$Any$BF;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FUTURE_BITMAP_NULL_URI:Lcom/koushikdutta/async/future/SimpleFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/future/SimpleFuture",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

.field builder:Lcom/koushikdutta/ion/IonRequestBuilder;

.field deepZoom:Z

.field ion:Lcom/koushikdutta/ion/Ion;

.field postProcess:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/PostProcess;",
            ">;"
        }
    .end annotation
.end field

.field resizeHeight:I

.field resizeWidth:I

.field scaleMode:Lcom/koushikdutta/ion/ScaleMode;

.field transforms:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/Transform;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->$assertionsDisabled:Z

    .line 29
    new-instance v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$1;

    invoke-direct {v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->FUTURE_BITMAP_NULL_URI:Lcom/koushikdutta/async/future/SimpleFuture;

    return-void

    .line 28
    :cond_13
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 3
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 63
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V
    .registers 3
    .param p1, "builder"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 58
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 59
    iget-object v0, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 60
    return-void
.end method

.method private checkNoTransforms(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 251
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 252
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t apply "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " after transform has been called."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is applied to the original resized bitmap."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_2f
    return-void
.end method

.method public static computeBitmapKey(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .registers 7
    .param p0, "decodeKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/koushikdutta/ion/bitmap/Transform;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "transforms":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/ion/bitmap/Transform;>;"
    sget-boolean v3, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->$assertionsDisabled:Z

    if-nez v3, :cond_c

    if-nez p0, :cond_c

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 140
    :cond_c
    move-object v0, p0

    .line 141
    .local v0, "bitmapKey":Ljava/lang/String;
    if-eqz p1, :cond_45

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_45

    .line 142
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/ion/bitmap/Transform;

    .line 143
    .local v2, "transform":Lcom/koushikdutta/ion/bitmap/Transform;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lcom/koushikdutta/ion/bitmap/Transform;->key()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 144
    goto :goto_19

    .line 145
    .end local v2    # "transform":Lcom/koushikdutta/ion/bitmap/Transform;
    :cond_3b
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v3}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_45
    return-object v0
.end method

.method private computeDecodeKey()Ljava/lang/String;
    .registers 6

    .prologue
    .line 103
    iget-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    iget v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    sget-object v4, Lcom/koushikdutta/ion/builder/AnimateGifMode;->NO_ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    if-eq v0, v4, :cond_14

    const/4 v0, 0x1

    :goto_d
    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    invoke-static {v1, v2, v3, v0, v4}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey(Lcom/koushikdutta/ion/IonRequestBuilder;IIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static computeDecodeKey(Lcom/koushikdutta/ion/IonRequestBuilder;IIZZ)Ljava/lang/String;
    .registers 8
    .param p0, "builder"    # Lcom/koushikdutta/ion/IonRequestBuilder;
    .param p1, "resizeWidth"    # I
    .param p2, "resizeHeight"    # I
    .param p3, "animateGif"    # Z
    .param p4, "deepZoom"    # Z

    .prologue
    .line 112
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    .line 113
    .local v0, "decodeKey":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "resize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    if-nez p3, :cond_38

    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":noAnimate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    :cond_38
    if-eqz p4, :cond_4d

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":deepZoom"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    :cond_4d
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static doAnimation(Landroid/widget/ImageView;Landroid/view/animation/Animation;I)V
    .registers 4
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .param p1, "animation"    # Landroid/view/animation/Animation;
    .param p2, "animationResource"    # I

    .prologue
    .line 67
    if-nez p0, :cond_3

    .line 77
    :goto_2
    return-void

    .line 69
    :cond_3
    if-nez p1, :cond_f

    if-eqz p2, :cond_f

    .line 70
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 71
    :cond_f
    if-nez p1, :cond_16

    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    goto :goto_2

    .line 76
    :cond_16
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_2
.end method


# virtual methods
.method public addDefaultTransform()V
    .registers 7

    .prologue
    .line 122
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-gtz v0, :cond_8

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-lez v0, :cond_25

    .line 123
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    if-nez v0, :cond_13

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 125
    :cond_13
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    const/4 v1, 0x0

    new-instance v2, Lcom/koushikdutta/ion/DefaultTransform;

    iget v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    iget v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    iget-object v5, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-direct {v2, v3, v4, v5}, Lcom/koushikdutta/ion/DefaultTransform;-><init>(IILcom/koushikdutta/ion/ScaleMode;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 130
    :cond_24
    return-void

    .line 127
    :cond_25
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    if-eqz v0, :cond_24

    .line 128
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Must call resize when using "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2
    .param p1, "mode"    # Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .prologue
    .line 330
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 331
    return-object p0
.end method

.method public bridge synthetic animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public asBitmap()Lcom/koushikdutta/async/future/Future;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 225
    iget-object v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v3, v3, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 226
    sget-object v2, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->FUTURE_BITMAP_NULL_URI:Lcom/koushikdutta/async/future/SimpleFuture;

    .line 247
    :goto_8
    return-object v2

    .line 230
    :cond_9
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 231
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->executeCache()Lcom/koushikdutta/ion/BitmapFetcher;

    move-result-object v0

    .line 232
    .local v0, "bitmapFetcher":Lcom/koushikdutta/ion/BitmapFetcher;
    iget-object v3, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v3, :cond_25

    .line 233
    new-instance v2, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v2}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 234
    .local v2, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Landroid/graphics/Bitmap;>;"
    iget-object v3, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    iget-object v4, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3, v4}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_8

    .line 238
    .end local v2    # "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Landroid/graphics/Bitmap;>;"
    :cond_25
    new-instance v1, Lcom/koushikdutta/ion/BitmapInfoToBitmap;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v3, v3, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-direct {v1, v3}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;-><init>(Lcom/koushikdutta/ion/ContextReference;)V

    .line 239
    .local v1, "ret":Lcom/koushikdutta/ion/BitmapInfoToBitmap;
    sget-object v3, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v4, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$2;

    invoke-direct {v4, p0, v0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$2;-><init>(Lcom/koushikdutta/ion/IonBitmapRequestBuilder;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/BitmapInfoToBitmap;)V

    invoke-static {v3, v4}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    move-object v2, v1

    .line 247
    goto :goto_8
.end method

.method public asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 4

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v1

    .line 185
    .local v1, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 186
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "bitmapKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, v2, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v2, v0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v2

    return-object v2
.end method

.method public centerCrop()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 259
    const-string v0, "centerCrop"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 260
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 261
    return-object p0
.end method

.method public bridge synthetic centerCrop()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerCrop()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 280
    const-string v0, "centerInside"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 281
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 282
    return-object p0
.end method

.method public bridge synthetic centerInside()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "decodeKey"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 336
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_8

    .line 345
    :goto_7
    return-object p0

    .line 338
    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    .line 339
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-gtz v0, :cond_13

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-lez v0, :cond_1b

    .line 340
    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t deepZoom with resize."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_1b
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 342
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t deepZoom with transforms."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 343
    :cond_29
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 344
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    goto :goto_7
.end method

.method public bridge synthetic deepZoom()Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected ensureBuilder()Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    return-object v0
.end method

.method executeCache()Lcom/koushikdutta/ion/BitmapFetcher;
    .registers 3

    .prologue
    .line 191
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    iget v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->executeCache(II)Lcom/koushikdutta/ion/BitmapFetcher;

    move-result-object v0

    return-object v0
.end method

.method executeCache(II)Lcom/koushikdutta/ion/BitmapFetcher;
    .registers 9
    .param p1, "sampleWidth"    # I
    .param p2, "sampleHeight"    # I

    .prologue
    .line 195
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v2

    .line 196
    .local v2, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 199
    .local v1, "bitmapKey":Ljava/lang/String;
    new-instance v3, Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-direct {v3}, Lcom/koushikdutta/ion/BitmapFetcher;-><init>()V

    .line 200
    .local v3, "ret":Lcom/koushikdutta/ion/BitmapFetcher;
    iput-object v1, v3, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    .line 201
    iput-object v2, v3, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    .line 202
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v4

    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->hasTransforms:Z

    .line 203
    iput p1, v3, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    .line 204
    iput p2, v3, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    .line 205
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 206
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->transforms:Ljava/util/ArrayList;

    .line 207
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    sget-object v5, Lcom/koushikdutta/ion/builder/AnimateGifMode;->NO_ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    if-eq v4, v5, :cond_49

    const/4 v4, 0x1

    :goto_2a
    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    .line 208
    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    .line 209
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->postProcess:Ljava/util/ArrayList;

    .line 212
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-boolean v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    if-nez v4, :cond_48

    .line 213
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    .line 214
    .local v0, "bitmap":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v0, :cond_48

    .line 215
    iput-object v0, v3, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 220
    .end local v0    # "bitmap":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_48
    return-object v3

    .line 207
    :cond_49
    const/4 v4, 0x0

    goto :goto_2a
.end method

.method public fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 273
    const-string v0, "fitCenter"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 274
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitCenter:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 275
    return-object p0
.end method

.method public bridge synthetic fitCenter()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 266
    const-string v0, "fitXY"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 267
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 268
    return-object p0
.end method

.method public bridge synthetic fitXY()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method hasTransforms()Z
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isLocallyCached()Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;
    .registers 6

    .prologue
    .line 153
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-boolean v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    if-nez v4, :cond_a

    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v4, :cond_d

    .line 154
    :cond_a
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->NOT_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    .line 167
    :goto_c
    return-object v4

    .line 155
    :cond_d
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 157
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "bitmapKey":Ljava/lang/String;
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v4, v0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v3

    .line 160
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v3, :cond_2b

    iget-object v4, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    if-nez v4, :cond_2b

    .line 161
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 162
    :cond_2b
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v2

    .line 163
    .local v2, "fileCache":Lcom/koushikdutta/async/util/FileCache;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v4

    if-eqz v4, :cond_42

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/util/FileCache;->exists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 164
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 165
    :cond_42
    invoke-virtual {v2, v1}, Lcom/koushikdutta/async/util/FileCache;->exists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 166
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->MAYBE_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 167
    :cond_4b
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->NOT_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c
.end method

.method public postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 4
    .param p1, "postProcess"    # Lcom/koushikdutta/ion/bitmap/PostProcess;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    .line 97
    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v0, Lcom/koushikdutta/ion/TransformBitmap$PostProcessNullTransform;

    invoke-interface {p1}, Lcom/koushikdutta/ion/bitmap/PostProcess;->key()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/koushikdutta/ion/TransformBitmap$PostProcessNullTransform;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/bitmap/PostProcess;

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public removeCachedBitmap()V
    .registers 4

    .prologue
    .line 173
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 175
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "bitmapKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, v2, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 177
    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, v2, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 178
    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, v2, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v2, v0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->remove(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 179
    iget-object v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, v2, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v2, v1}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->remove(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 180
    return-void
.end method

.method reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 46
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 47
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 48
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 49
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 50
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 51
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 52
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 53
    iput-boolean v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    .line 54
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    .line 55
    return-void
.end method

.method public resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 288
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 289
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t apply resize after transform has been called.resize is applied to the original bitmap."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_e
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v0, :cond_1a

    .line 293
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not resize with deepZoom."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 294
    :cond_1a
    iput p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 295
    iput p2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 296
    return-object p0
.end method

.method public bridge synthetic resize(II)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # I

    .prologue
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 306
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeHeight(I)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public resizeWidth(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 301
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeWidth(I)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public smartSize(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 5
    .param p1, "smartSize"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 311
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-gtz v0, :cond_a

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-lez v0, :cond_12

    .line 312
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t set smart size after resize has been called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_12
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v0, :cond_1e

    .line 315
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not smartSize with deepZoom."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 317
    :cond_1e
    if-nez p1, :cond_25

    .line 318
    iput v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 319
    iput v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 325
    :goto_24
    return-object p0

    .line 322
    :cond_25
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 323
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    goto :goto_24
.end method

.method public bridge synthetic smartSize(Z)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->smartSize(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "transform"    # Lcom/koushikdutta/ion/bitmap/Transform;

    .prologue
    .line 85
    if-nez p1, :cond_3

    .line 90
    :goto_2
    return-object p0

    .line 87
    :cond_3
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    if-nez v0, :cond_e

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 89
    :cond_e
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public bridge synthetic transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/bitmap/Transform;

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method
