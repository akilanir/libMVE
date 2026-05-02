.class Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;
.super Lcom/nineoldandroids/view/ViewPropertyAnimator;
.source "ViewPropertyAnimatorICS.java"


# static fields
.field private static final RETURN_WHEN_NULL:J = -0x1L


# instance fields
.field private final mNative:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/ViewPropertyAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;-><init>()V

    .line 22
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    .line 23
    return-void
.end method


# virtual methods
.method public alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 283
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 284
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 285
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 287
    :cond_d
    return-object p0
.end method

.method public alphaBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 292
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 293
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 294
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->alphaBy(F)Landroid/view/ViewPropertyAnimator;

    .line 296
    :cond_d
    return-object p0
.end method

.method public cancel()V
    .registers 3

    .prologue
    .line 113
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 114
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 115
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 117
    :cond_d
    return-void
.end method

.method public getDuration()J
    .registers 4

    .prologue
    .line 36
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 37
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_f

    .line 38
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->getDuration()J

    move-result-wide v1

    .line 40
    :goto_e
    return-wide v1

    :cond_f
    const-wide/16 v1, -0x1

    goto :goto_e
.end method

.method public getStartDelay()J
    .registers 4

    .prologue
    .line 54
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 55
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_f

    .line 56
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->getStartDelay()J

    move-result-wide v1

    .line 58
    :goto_e
    return-wide v1

    :cond_f
    const-wide/16 v1, -0x1

    goto :goto_e
.end method

.method public rotation(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 157
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 158
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 159
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    .line 161
    :cond_d
    return-object p0
.end method

.method public rotationBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 166
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 167
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 168
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotationBy(F)Landroid/view/ViewPropertyAnimator;

    .line 170
    :cond_d
    return-object p0
.end method

.method public rotationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 175
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 176
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 177
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotationX(F)Landroid/view/ViewPropertyAnimator;

    .line 179
    :cond_d
    return-object p0
.end method

.method public rotationXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 184
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 185
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 186
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotationXBy(F)Landroid/view/ViewPropertyAnimator;

    .line 188
    :cond_d
    return-object p0
.end method

.method public rotationY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 193
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 194
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 195
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotationY(F)Landroid/view/ViewPropertyAnimator;

    .line 197
    :cond_d
    return-object p0
.end method

.method public rotationYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 202
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 203
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 204
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->rotationYBy(F)Landroid/view/ViewPropertyAnimator;

    .line 206
    :cond_d
    return-object p0
.end method

.method public scaleX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 247
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 248
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 249
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 251
    :cond_d
    return-object p0
.end method

.method public scaleXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 256
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 257
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 258
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->scaleXBy(F)Landroid/view/ViewPropertyAnimator;

    .line 260
    :cond_d
    return-object p0
.end method

.method public scaleY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 265
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 266
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 267
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 269
    :cond_d
    return-object p0
.end method

.method public scaleYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 274
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 275
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 276
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->scaleYBy(F)Landroid/view/ViewPropertyAnimator;

    .line 278
    :cond_d
    return-object p0
.end method

.method public setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 5
    .param p1, "duration"    # J

    .prologue
    .line 27
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 28
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 29
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 31
    :cond_d
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 63
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 64
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 65
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 67
    :cond_d
    return-object p0
.end method

.method public setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "listener"    # Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .prologue
    .line 72
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 73
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_10

    .line 74
    if-nez p1, :cond_11

    .line 75
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 100
    :cond_10
    :goto_10
    return-object p0

    .line 77
    :cond_11
    new-instance v1, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS$1;

    invoke-direct {v1, p0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS$1;-><init>(Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto :goto_10
.end method

.method public setStartDelay(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 5
    .param p1, "startDelay"    # J

    .prologue
    .line 45
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 46
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 47
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 49
    :cond_d
    return-object p0
.end method

.method public start()V
    .registers 3

    .prologue
    .line 105
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 106
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 107
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 109
    :cond_d
    return-void
.end method

.method public translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 211
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 212
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 213
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 215
    :cond_d
    return-object p0
.end method

.method public translationXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 220
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 221
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 222
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationXBy(F)Landroid/view/ViewPropertyAnimator;

    .line 224
    :cond_d
    return-object p0
.end method

.method public translationY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 229
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 230
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 231
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 233
    :cond_d
    return-object p0
.end method

.method public translationYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 238
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 239
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 240
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationYBy(F)Landroid/view/ViewPropertyAnimator;

    .line 242
    :cond_d
    return-object p0
.end method

.method public x(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 121
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 122
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 123
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->x(F)Landroid/view/ViewPropertyAnimator;

    .line 125
    :cond_d
    return-object p0
.end method

.method public xBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 130
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 131
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 132
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->xBy(F)Landroid/view/ViewPropertyAnimator;

    .line 134
    :cond_d
    return-object p0
.end method

.method public y(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 139
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 140
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 141
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->y(F)Landroid/view/ViewPropertyAnimator;

    .line 143
    :cond_d
    return-object p0
.end method

.method public yBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 148
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorICS;->mNative:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    .line 149
    .local v0, "n":Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_d

    .line 150
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->yBy(F)Landroid/view/ViewPropertyAnimator;

    .line 152
    :cond_d
    return-object p0
.end method
