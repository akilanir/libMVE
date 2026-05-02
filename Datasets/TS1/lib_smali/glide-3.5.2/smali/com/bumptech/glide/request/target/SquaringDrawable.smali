.class public Lcom/bumptech/glide/request/target/SquaringDrawable;
.super Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;
.source "SquaringDrawable.java"


# instance fields
.field private final side:I

.field private final wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;I)V
    .registers 3
    .param p1, "wrapped"    # Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;
    .param p2, "side"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    .line 25
    iput p2, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->side:I

    .line 26
    return-void
.end method


# virtual methods
.method public clearColorFilter()V
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->clearColorFilter()V

    .line 80
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 138
    return-void
.end method

.method public getAlpha()I
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getCallback()Landroid/graphics/drawable/Drawable$Callback;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    return-object v0
.end method

.method public getChangingConfigurations()I
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->side:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 94
    iget v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->side:I

    return v0
.end method

.method public getMinimumHeight()I
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .registers 3
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v0

    return v0
.end method

.method public invalidateSelf()V
    .registers 2

    .prologue
    .line 119
    invoke-super {p0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->invalidateSelf()V

    .line 120
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->invalidateSelf()V

    .line 121
    return-void
.end method

.method public isAnimated()Z
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->isAnimated()Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->isRunning()Z

    move-result v0

    return v0
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 131
    invoke-super {p0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 132
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1, p2, p3}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 133
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 142
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setAlpha(I)V

    .line 143
    return-void
.end method

.method public setBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 30
    invoke-super {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setBounds(IIII)V

    .line 31
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setBounds(IIII)V

    .line 32
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 37
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 38
    return-void
.end method

.method public setChangingConfigurations(I)V
    .registers 3
    .param p1, "configs"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setChangingConfigurations(I)V

    .line 43
    return-void
.end method

.method public setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "color"    # I
    .param p2, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 75
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 148
    return-void
.end method

.method public setDither(Z)V
    .registers 3
    .param p1, "dither"    # Z

    .prologue
    .line 52
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setDither(Z)V

    .line 53
    return-void
.end method

.method public setFilterBitmap(Z)V
    .registers 3
    .param p1, "filter"    # Z

    .prologue
    .line 57
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setFilterBitmap(Z)V

    .line 58
    return-void
.end method

.method public setLoopCount(I)V
    .registers 3
    .param p1, "loopCount"    # I

    .prologue
    .line 162
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setLoopCount(I)V

    .line 163
    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 4
    .param p1, "visible"    # Z
    .param p2, "restart"    # Z

    .prologue
    .line 89
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->setVisible(ZZ)Z

    move-result v0

    return v0
.end method

.method public start()V
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->start()V

    .line 168
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->stop()V

    .line 173
    return-void
.end method

.method public unscheduleSelf(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 125
    invoke-super {p0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 126
    iget-object v0, p0, Lcom/bumptech/glide/request/target/SquaringDrawable;->wrapped:Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/resource/drawable/GlideDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 127
    return-void
.end method
