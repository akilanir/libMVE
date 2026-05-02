.class Lcom/bumptech/glide/request/animation/DrawableCrossFadeFactory$DefaultAnimationFactory;
.super Ljava/lang/Object;
.source "DrawableCrossFadeFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/animation/ViewAnimation$AnimationFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/request/animation/DrawableCrossFadeFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultAnimationFactory"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bumptech/glide/request/animation/DrawableCrossFadeFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/bumptech/glide/request/animation/DrawableCrossFadeFactory$1;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/bumptech/glide/request/animation/DrawableCrossFadeFactory$DefaultAnimationFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Landroid/view/animation/Animation;
    .registers 4

    .prologue
    .line 67
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 68
    .local v0, "animation":Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 69
    return-object v0
.end method
