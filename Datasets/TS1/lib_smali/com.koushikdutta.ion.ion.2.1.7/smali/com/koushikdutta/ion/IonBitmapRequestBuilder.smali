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
    .line 27
    const-class v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->$assertionsDisabled:Z

    .line 28
    new-instance v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$1;

    invoke-direct {v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->FUTURE_BITMAP_NULL_URI:Lcom/koushikdutta/async/future/SimpleFuture;

    return-void

    .line 27
    :cond_13
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 3
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 62
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 63
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V
    .registers 3
    .param p1, "builder"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 57
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 58
    iget-object v0, p1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 59
    return-void
.end method

.method private checkNoTransforms(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 239
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

    .line 242
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
    .line 136
    .local p1, "transforms":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/ion/bitmap/Transform;>;"
    sget-boolean v3, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->$assertionsDisabled:Z

    if-nez v3, :cond_c

    if-nez p0, :cond_c

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 139
    :cond_c
    move-object v0, p0

    .line 140
    .local v0, "bitmapKey":Ljava/lang/String;
    if-eqz p1, :cond_45

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_45

    .line 141
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

    .line 142
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

    goto :goto_19

    .line 144
    .end local v2    # "transform":Lcom/koushikdutta/ion/bitmap/Transform;
    :cond_3b
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v3}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 147
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_45
    return-object v0
.end method

.method private computeDecodeKey()Ljava/lang/String;
    .registers 6

    .prologue
    .line 102
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
    .line 111
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    .line 112
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

    .line 113
    if-nez p3, :cond_38

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":noAnimate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 115
    :cond_38
    if-eqz p4, :cond_4d

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":deepZoom"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 117
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
    .line 66
    if-nez p0, :cond_3

    .line 76
    :goto_2
    return-void

    .line 68
    :cond_3
    if-nez p1, :cond_f

    if-eqz p2, :cond_f

    .line 69
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 70
    :cond_f
    if-nez p1, :cond_16

    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    goto :goto_2

    .line 75
    :cond_16
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_2
.end method


# virtual methods
.method public addDefaultTransform()V
    .registers 7

    .prologue
    .line 121
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-gtz v0, :cond_8

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-lez v0, :cond_25

    .line 122
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    if-nez v0, :cond_13

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 124
    :cond_13
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    const/4 v1, 0x0

    new-instance v2, Lcom/koushikdutta/ion/DefaultTransform;

    iget v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    iget v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    iget-object v5, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-direct {v2, v3, v4, v5}, Lcom/koushikdutta/ion/DefaultTransform;-><init>(IILcom/koushikdutta/ion/ScaleMode;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 129
    :cond_24
    return-void

    .line 126
    :cond_25
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    if-eqz v0, :cond_24

    .line 127
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
    .line 317
    iput-object p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 318
    return-object p0
.end method

.method public bridge synthetic animateGif(Lcom/koushikdutta/ion/builder/AnimateGifMode;)Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .prologue
    .line 27
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
    .line 212
    iget-object v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v3, v3, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 213
    sget-object v2, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->FUTURE_BITMAP_NULL_URI:Lcom/koushikdutta/async/future/SimpleFuture;

    .line 234
    :goto_8
    return-object v2

    .line 217
    :cond_9
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 218
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->executeCache()Lcom/koushikdutta/ion/BitmapFetcher;

    move-result-object v0

    .line 219
    .local v0, "bitmapFetcher":Lcom/koushikdutta/ion/BitmapFetcher;
    iget-object v3, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v3, :cond_25

    .line 220
    new-instance v2, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v2}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 221
    .local v2, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Landroid/graphics/Bitmap;>;"
    iget-object v3, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    iget-object v4, v0, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3, v4}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_8

    .line 225
    .end local v2    # "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Landroid/graphics/Bitmap;>;"
    :cond_25
    new-instance v1, Lcom/koushikdutta/ion/BitmapInfoToBitmap;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v3, v3, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-direct {v1, v3}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;-><init>(Lcom/koushikdutta/ion/ContextReference;)V

    .line 226
    .local v1, "ret":Lcom/koushikdutta/ion/BitmapInfoToBitmap;
    sget-object v3, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v4, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$2;

    invoke-direct {v4, p0, v0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder$2;-><init>(Lcom/koushikdutta/ion/IonBitmapRequestBuilder;Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/BitmapInfoToBitmap;)V

    invoke-static {v3, v4}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    move-object v2, v1

    .line 234
    goto :goto_8
.end method

.method public asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 4

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 173
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
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
    .line 246
    const-string v0, "centerCrop"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 247
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 248
    return-object p0
.end method

.method public bridge synthetic centerCrop()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerCrop()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 267
    const-string v0, "centerInside"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 268
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 269
    return-object p0
.end method

.method public bridge synthetic centerInside()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->centerInside()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "decodeKey"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 323
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_8

    .line 332
    :goto_7
    return-object p0

    .line 325
    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    .line 326
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-gtz v0, :cond_13

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-lez v0, :cond_1b

    .line 327
    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t deepZoom with resize."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :cond_1b
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 329
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t deepZoom with transforms."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_29
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 331
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    goto :goto_7
.end method

.method public bridge synthetic deepZoom()Lcom/koushikdutta/ion/builder/ImageViewBuilder;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected ensureBuilder()Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    return-object v0
.end method

.method executeCache()Lcom/koushikdutta/ion/BitmapFetcher;
    .registers 3

    .prologue
    .line 178
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
    .line 182
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "bitmapKey":Ljava/lang/String;
    new-instance v3, Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-direct {v3}, Lcom/koushikdutta/ion/BitmapFetcher;-><init>()V

    .line 187
    .local v3, "ret":Lcom/koushikdutta/ion/BitmapFetcher;
    iput-object v1, v3, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    .line 188
    iput-object v2, v3, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    .line 189
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v4

    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->hasTransforms:Z

    .line 190
    iput p1, v3, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    .line 191
    iput p2, v3, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    .line 192
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 193
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->transforms:Ljava/util/ArrayList;

    .line 194
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    sget-object v5, Lcom/koushikdutta/ion/builder/AnimateGifMode;->NO_ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    if-eq v4, v5, :cond_49

    const/4 v4, 0x1

    :goto_2a
    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    .line 195
    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    iput-boolean v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    .line 196
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    iput-object v4, v3, Lcom/koushikdutta/ion/BitmapFetcher;->postProcess:Ljava/util/ArrayList;

    .line 199
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-boolean v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    if-nez v4, :cond_48

    .line 200
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    .line 201
    .local v0, "bitmap":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v0, :cond_48

    .line 202
    iput-object v0, v3, Lcom/koushikdutta/ion/BitmapFetcher;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 207
    .end local v0    # "bitmap":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_48
    return-object v3

    .line 194
    :cond_49
    const/4 v4, 0x0

    goto :goto_2a
.end method

.method public fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 260
    const-string v0, "fitCenter"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 261
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitCenter:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 262
    return-object p0
.end method

.method public bridge synthetic fitCenter()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitCenter()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 2

    .prologue
    .line 253
    const-string v0, "fitXY"

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->checkNoTransforms(Ljava/lang/String;)V

    .line 254
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 255
    return-object p0
.end method

.method public bridge synthetic fitXY()Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->fitXY()Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method hasTransforms()Z
    .registers 2

    .prologue
    .line 336
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
    .line 152
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-boolean v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    if-nez v4, :cond_a

    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v4, :cond_d

    .line 153
    :cond_a
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->NOT_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    .line 166
    :goto_c
    return-object v4

    .line 154
    :cond_d
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey()Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, "decodeKey":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->addDefaultTransform()V

    .line 156
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "bitmapKey":Ljava/lang/String;
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v4, v4, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v4, v0}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v3

    .line 159
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v3, :cond_2b

    iget-object v4, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    if-nez v4, :cond_2b

    .line 160
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 161
    :cond_2b
    iget-object v4, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v2

    .line 162
    .local v2, "fileCache":Lcom/koushikdutta/async/util/FileCache;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v4

    if-eqz v4, :cond_42

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/util/FileCache;->exists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 163
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 164
    :cond_42
    invoke-virtual {v2, v1}, Lcom/koushikdutta/async/util/FileCache;->exists(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 165
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->MAYBE_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c

    .line 166
    :cond_4b
    sget-object v4, Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;->NOT_CACHED:Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    goto :goto_c
.end method

.method public postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 4
    .param p1, "postProcess"    # Lcom/koushikdutta/ion/bitmap/PostProcess;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    .line 96
    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
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
    .line 27
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess(Lcom/koushikdutta/ion/bitmap/PostProcess;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 45
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 46
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 47
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 48
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 49
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 50
    sget-object v0, Lcom/koushikdutta/ion/builder/AnimateGifMode;->ANIMATE:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->animateGifMode:Lcom/koushikdutta/ion/builder/AnimateGifMode;

    .line 51
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 52
    iput-boolean v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    .line 53
    iput-object v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->postProcess:Ljava/util/ArrayList;

    .line 54
    return-void
.end method

.method public resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->hasTransforms()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 276
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t apply resize after transform has been called.resize is applied to the original bitmap."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    :cond_e
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v0, :cond_1a

    .line 280
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not resize with deepZoom."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_1a
    iput p1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 282
    iput p2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 283
    return-object p0
.end method

.method public bridge synthetic resize(II)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # I

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 293
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeHeight(I)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public resizeWidth(I)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 288
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resize(II)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic resizeWidth(I)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 27
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

    .line 298
    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    if-gtz v0, :cond_a

    iget v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    if-lez v0, :cond_12

    .line 299
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t set smart size after resize has been called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 301
    :cond_12
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->deepZoom:Z

    if-eqz v0, :cond_1e

    .line 302
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not smartSize with deepZoom."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 304
    :cond_1e
    if-nez p1, :cond_25

    .line 305
    iput v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 306
    iput v1, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    .line 312
    :goto_24
    return-object p0

    .line 309
    :cond_25
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeWidth:I

    .line 310
    iput v2, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->resizeHeight:I

    goto :goto_24
.end method

.method public bridge synthetic smartSize(Z)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->smartSize(Z)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;
    .registers 3
    .param p1, "transform"    # Lcom/koushikdutta/ion/bitmap/Transform;

    .prologue
    .line 84
    if-nez p1, :cond_3

    .line 89
    :goto_2
    return-object p0

    .line 86
    :cond_3
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    if-nez v0, :cond_e

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    .line 88
    :cond_e
    iget-object v0, p0, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transforms:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public bridge synthetic transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/builder/BitmapBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/bitmap/Transform;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->transform(Lcom/koushikdutta/ion/bitmap/Transform;)Lcom/koushikdutta/ion/IonBitmapRequestBuilder;

    move-result-object v0

    return-object v0
.end method
