.class public Lcom/rey/material/drawable/PaddingDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PaddingDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# instance fields
.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 26
    invoke-virtual {p0, p1}, Lcom/rey/material/drawable/PaddingDrawable;->setWrappedDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 27
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 55
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 56
    :cond_9
    return-void
.end method

.method public getChangingConfigurations()I
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getCurrent()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .prologue
    .line 146
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    :goto_a
    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    add-int/2addr v0, v1

    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .prologue
    .line 141
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    :goto_a
    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    add-int/2addr v0, v1

    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getMinimumHeight()I
    .registers 3

    .prologue
    .line 156
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    :goto_a
    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    add-int/2addr v0, v1

    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getMinimumWidth()I
    .registers 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    :goto_a
    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    add-int/2addr v0, v1

    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .registers 9
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 161
    iget-object v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_2e

    iget-object v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v3

    if-eqz v3, :cond_2e

    move v0, v2

    .line 162
    .local v0, "hasPadding":Z
    :goto_f
    if-eqz v0, :cond_30

    .line 163
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 164
    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 165
    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget v2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->right:I

    .line 166
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 173
    :goto_2d
    return v0

    .end local v0    # "hasPadding":Z
    :cond_2e
    move v0, v1

    .line 161
    goto :goto_f

    .line 169
    .restart local v0    # "hasPadding":Z
    :cond_30
    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    iget v4, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    iget v5, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    iget v6, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 170
    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    if-nez v3, :cond_4b

    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    if-nez v3, :cond_4b

    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    if-nez v3, :cond_4b

    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    if-eqz v3, :cond_4d

    :cond_4b
    move v0, v2

    :goto_4c
    goto :goto_2d

    :cond_4d
    move v0, v1

    goto :goto_4c
.end method

.method public getPaddingBottom()I
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    return v0
.end method

.method public getPaddingLeft()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    return v0
.end method

.method public getPaddingRight()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    return v0
.end method

.method public getPaddingTop()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    return v0
.end method

.method public getState()[I
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getTransparentRegion()Landroid/graphics/Region;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getTransparentRegion()Landroid/graphics/Region;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getWrappedDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/rey/material/drawable/PaddingDrawable;->invalidateSelf()V

    .line 181
    return-void
.end method

.method public isAutoMirrored()Z
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->isAutoMirrored(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public jumpToCurrentState()V
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 116
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->jumpToCurrentState(Landroid/graphics/drawable/Drawable;)V

    .line 117
    :cond_9
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1d

    .line 61
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    add-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    add-int/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    sub-int/2addr v3, v4

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    iget v5, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 62
    :cond_1d
    return-void
.end method

.method protected onLevelChange(I)Z
    .registers 3
    .param p1, "level"    # I

    .prologue
    .line 199
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 187
    invoke-virtual {p0, p2, p3, p4}, Lcom/rey/material/drawable/PaddingDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 188
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 89
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 90
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 91
    :cond_9
    return-void
.end method

.method public setAutoMirrored(Z)V
    .registers 3
    .param p1, "mirrored"    # Z

    .prologue
    .line 204
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 205
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setAutoMirrored(Landroid/graphics/drawable/Drawable;Z)V

    .line 206
    :cond_9
    return-void
.end method

.method public setChangingConfigurations(I)V
    .registers 3
    .param p1, "configs"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 67
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 68
    :cond_9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 96
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 97
    :cond_9
    return-void
.end method

.method public setDither(Z)V
    .registers 3
    .param p1, "dither"    # Z

    .prologue
    .line 77
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 78
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 79
    :cond_9
    return-void
.end method

.method public setFilterBitmap(Z)V
    .registers 3
    .param p1, "filter"    # Z

    .prologue
    .line 83
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 84
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 85
    :cond_9
    return-void
.end method

.method public setHotspot(FF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 233
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 234
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1, p2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspot(Landroid/graphics/drawable/Drawable;FF)V

    .line 235
    :cond_9
    return-void
.end method

.method public setHotspotBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 239
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 240
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1, p2, p3, p4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspotBounds(Landroid/graphics/drawable/Drawable;IIII)V

    .line 241
    :cond_9
    return-void
.end method

.method public setPadding(IIII)V
    .registers 5
    .param p1, "paddingLeft"    # I
    .param p2, "paddingTop"    # I
    .param p3, "paddingRight"    # I
    .param p4, "paddingBottom"    # I

    .prologue
    .line 30
    iput p1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingLeft:I

    .line 31
    iput p2, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingTop:I

    .line 32
    iput p3, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingRight:I

    .line 33
    iput p4, p0, Lcom/rey/material/drawable/PaddingDrawable;->mPaddingBottom:I

    .line 34
    return-void
.end method

.method public setState([I)Z
    .registers 3
    .param p1, "stateSet"    # [I

    .prologue
    .line 106
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setTint(I)V
    .registers 3
    .param p1, "tint"    # I

    .prologue
    .line 215
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 216
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTint(Landroid/graphics/drawable/Drawable;I)V

    .line 217
    :cond_9
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 222
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 223
    :cond_9
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 227
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 228
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 229
    :cond_9
    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 4
    .param p1, "visible"    # Z
    .param p2, "restart"    # Z

    .prologue
    .line 126
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public setWrappedDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 248
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_a

    .line 249
    iget-object v0, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 252
    :cond_a
    iput-object p1, p0, Lcom/rey/material/drawable/PaddingDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 254
    if-eqz p1, :cond_11

    .line 255
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 258
    :cond_11
    invoke-virtual {p0}, Lcom/rey/material/drawable/PaddingDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/PaddingDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 259
    invoke-virtual {p0}, Lcom/rey/material/drawable/PaddingDrawable;->invalidateSelf()V

    .line 260
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 194
    invoke-virtual {p0, p2}, Lcom/rey/material/drawable/PaddingDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 195
    return-void
.end method
