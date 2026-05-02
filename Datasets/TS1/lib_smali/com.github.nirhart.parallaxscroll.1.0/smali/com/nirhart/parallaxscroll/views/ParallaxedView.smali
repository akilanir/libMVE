.class public abstract Lcom/nirhart/parallaxscroll/views/ParallaxedView;
.super Ljava/lang/Object;
.source "ParallaxedView.java"


# static fields
.field public static isAPI11:Z


# instance fields
.field protected animations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/animation/Animation;",
            ">;"
        }
    .end annotation
.end field

.field protected lastOffset:I

.field protected view:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->isAPI11:Z

    return-void

    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->lastOffset:I

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animations:Ljava/util/List;

    .line 25
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    .line 26
    return-void
.end method


# virtual methods
.method protected declared-synchronized addAnimation(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 54
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 55
    monitor-exit p0

    return-void

    .line 54
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected alphaPreICS(Landroid/view/View;F)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "alpha"    # F

    .prologue
    .line 58
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, p2, p2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {p0, v0}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->addAnimation(Landroid/view/animation/Animation;)V

    .line 59
    return-void
.end method

.method protected declared-synchronized animateNow()V
    .registers 7

    .prologue
    .line 62
    monitor-enter p0

    :try_start_1
    iget-object v4, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 63
    .local v3, "view":Landroid/view/View;
    if-eqz v3, :cond_40

    .line 64
    new-instance v2, Landroid/view/animation/AnimationSet;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 65
    .local v2, "set":Landroid/view/animation/AnimationSet;
    iget-object v4, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animations:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/animation/Animation;

    .line 66
    .local v0, "animation":Landroid/view/animation/Animation;
    if-eqz v0, :cond_17

    .line 67
    invoke-virtual {v2, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_29

    goto :goto_17

    .line 62
    .end local v0    # "animation":Landroid/view/animation/Animation;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "set":Landroid/view/animation/AnimationSet;
    .end local v3    # "view":Landroid/view/View;
    :catchall_29
    move-exception v4

    monitor-exit p0

    throw v4

    .line 68
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "set":Landroid/view/animation/AnimationSet;
    .restart local v3    # "view":Landroid/view/View;
    :cond_2c
    const-wide/16 v4, 0x0

    :try_start_2e
    invoke-virtual {v2, v4, v5}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 69
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 70
    invoke-virtual {v3, v2}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 71
    invoke-virtual {v2}, Landroid/view/animation/AnimationSet;->start()V

    .line 72
    iget-object v4, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->animations:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V
    :try_end_40
    .catchall {:try_start_2e .. :try_end_40} :catchall_29

    .line 74
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "set":Landroid/view/animation/AnimationSet;
    :cond_40
    monitor-exit p0

    return-void
.end method

.method public is(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 29
    if-eqz p1, :cond_1e

    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public setAlpha(F)V
    .registers 4
    .param p1, "alpha"    # F

    .prologue
    .line 44
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 45
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_11

    .line 46
    sget-boolean v1, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->isAPI11:Z

    if-eqz v1, :cond_12

    .line 47
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    :cond_11
    :goto_11
    return-void

    .line 49
    :cond_12
    invoke-virtual {p0, v0, p1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->alphaPreICS(Landroid/view/View;F)V

    goto :goto_11
.end method

.method public setOffset(F)V
    .registers 4
    .param p1, "offset"    # F
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v1, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 35
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_11

    .line 36
    sget-boolean v1, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->isAPI11:Z

    if-eqz v1, :cond_12

    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 41
    :cond_11
    :goto_11
    return-void

    .line 39
    :cond_12
    invoke-virtual {p0, v0, p1}, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->translatePreICS(Landroid/view/View;F)V

    goto :goto_11
.end method

.method public setView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 77
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nirhart/parallaxscroll/views/ParallaxedView;->view:Ljava/lang/ref/WeakReference;

    .line 78
    return-void
.end method

.method protected abstract translatePreICS(Landroid/view/View;F)V
.end method
