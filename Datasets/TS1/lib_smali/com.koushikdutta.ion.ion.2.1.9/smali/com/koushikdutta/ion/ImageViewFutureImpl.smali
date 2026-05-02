.class Lcom/koushikdutta/ion/ImageViewFutureImpl;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "ImageViewFutureImpl.java"

# interfaces
.implements Lcom/koushikdutta/ion/future/ImageViewFuture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/ImageViewFutureImpl$3;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Landroid/widget/ImageView;",
        "Lcom/koushikdutta/ion/IonDrawable;",
        ">;",
        "Lcom/koushikdutta/ion/future/ImageViewFuture;"
    }
.end annotation


# static fields
.field public static final FUTURE_IMAGEVIEW_NULL_URI:Lcom/koushikdutta/ion/ImageViewFutureImpl;


# instance fields
.field private imageViewRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

.field private inAnimation:Landroid/view/animation/Animation;

.field private inAnimationResource:I

.field private scaleMode:Lcom/koushikdutta/ion/ScaleMode;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    new-instance v0, Lcom/koushikdutta/ion/ImageViewFutureImpl$1;

    invoke-direct {v0}, Lcom/koushikdutta/ion/ImageViewFutureImpl$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->FUTURE_IMAGEVIEW_NULL_URI:Lcom/koushikdutta/ion/ImageViewFutureImpl;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    .line 118
    return-void
.end method

.method public static applyScaleMode(Landroid/widget/ImageView;Lcom/koushikdutta/ion/ScaleMode;)V
    .registers 4
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .param p1, "scaleMode"    # Lcom/koushikdutta/ion/ScaleMode;

    .prologue
    .line 104
    if-nez p1, :cond_3

    .line 120
    :goto_2
    return-void

    .line 106
    :cond_3
    sget-object v0, Lcom/koushikdutta/ion/ImageViewFutureImpl$3;->$SwitchMap$com$koushikdutta$ion$ScaleMode:[I

    invoke-virtual {p1}, Lcom/koushikdutta/ion/ScaleMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_28

    goto :goto_2

    .line 108
    :pswitch_f
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_2

    .line 111
    :pswitch_15
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_2

    .line 114
    :pswitch_1b
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_2

    .line 117
    :pswitch_21
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_2

    .line 106
    nop

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_f
        :pswitch_15
        :pswitch_1b
        :pswitch_21
    .end packed-switch
.end method

.method public static getOrCreateImageViewFuture(Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;Lcom/koushikdutta/ion/IonDrawable;)Lcom/koushikdutta/ion/ImageViewFutureImpl;
    .registers 4
    .param p0, "imageViewRef"    # Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;
    .param p1, "drawable"    # Lcom/koushikdutta/ion/IonDrawable;

    .prologue
    .line 29
    invoke-virtual {p1}, Lcom/koushikdutta/ion/IonDrawable;->getLoadCallback()Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v1

    instance-of v1, v1, Lcom/koushikdutta/ion/ImageViewFutureImpl;

    if-eqz v1, :cond_14

    .line 30
    invoke-virtual {p1}, Lcom/koushikdutta/ion/IonDrawable;->getLoadCallback()Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/ImageViewFutureImpl;

    .line 34
    .local v0, "ret":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    :goto_e
    invoke-virtual {p1, v0}, Lcom/koushikdutta/ion/IonDrawable;->setLoadCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/ion/IonDrawable;

    .line 35
    iput-object p0, v0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->imageViewRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    .line 36
    return-object v0

    .line 32
    .end local v0    # "ret":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    :cond_14
    new-instance v0, Lcom/koushikdutta/ion/ImageViewFutureImpl;

    invoke-direct {v0}, Lcom/koushikdutta/ion/ImageViewFutureImpl;-><init>()V

    .restart local v0    # "ret":Lcom/koushikdutta/ion/ImageViewFutureImpl;
    goto :goto_e
.end method


# virtual methods
.method public setInAnimation(Landroid/view/animation/Animation;I)Lcom/koushikdutta/ion/ImageViewFutureImpl;
    .registers 3
    .param p1, "inAnimation"    # Landroid/view/animation/Animation;
    .param p2, "inAnimationResource"    # I

    .prologue
    .line 93
    iput-object p1, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->inAnimation:Landroid/view/animation/Animation;

    .line 94
    iput p2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->inAnimationResource:I

    .line 95
    return-object p0
.end method

.method public setScaleMode(Lcom/koushikdutta/ion/ScaleMode;)Lcom/koushikdutta/ion/ImageViewFutureImpl;
    .registers 2
    .param p1, "scaleMode"    # Lcom/koushikdutta/ion/ScaleMode;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 100
    return-object p0
.end method

.method protected transform(Lcom/koushikdutta/ion/IonDrawable;)V
    .registers 6
    .param p1, "result"    # Lcom/koushikdutta/ion/IonDrawable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->imageViewRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 47
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->imageViewRef:Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;->isAlive()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_12

    if-nez v0, :cond_16

    .line 48
    :cond_12
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->cancelSilently()Z

    .line 67
    :goto_15
    return-void

    .line 52
    :cond_16
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eq v2, p1, :cond_20

    .line 54
    invoke-virtual {p0}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->cancelSilently()Z

    goto :goto_15

    .line 59
    :cond_20
    invoke-virtual {p1}, Lcom/koushikdutta/ion/IonDrawable;->getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v1

    .line 60
    .local v1, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v1, :cond_2f

    iget-object v2, v1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    if-nez v2, :cond_2f

    .line 61
    iget-object v2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-static {v0, v2}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->applyScaleMode(Landroid/widget/ImageView;Lcom/koushikdutta/ion/ScaleMode;)V

    .line 63
    :cond_2f
    iget-object v2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->inAnimation:Landroid/view/animation/Animation;

    iget v3, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl;->inAnimationResource:I

    invoke-static {v0, v2, v3}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->doAnimation(Landroid/widget/ImageView;Landroid/view/animation/Animation;I)V

    .line 64
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setComplete(Ljava/lang/Object;)Z

    goto :goto_15
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    check-cast p1, Lcom/koushikdutta/ion/IonDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->transform(Lcom/koushikdutta/ion/IonDrawable;)V

    return-void
.end method

.method public withBitmapInfo()Lcom/koushikdutta/async/future/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/ion/ImageViewBitmapInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 72
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/ion/ImageViewBitmapInfo;>;"
    new-instance v1, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;

    invoke-direct {v1, p0, v0}, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;-><init>(Lcom/koushikdutta/ion/ImageViewFutureImpl;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 88
    invoke-virtual {v0, p0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 89
    return-object v0
.end method
