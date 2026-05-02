.class public Luk/co/senab/photoview/PhotoView;
.super Landroid/widget/ImageView;
.source "PhotoView.java"

# interfaces
.implements Luk/co/senab/photoview/IPhotoView;


# instance fields
.field private final mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

.field private mPendingScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 49
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    .line 51
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v0, :cond_1b

    .line 52
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Luk/co/senab/photoview/PhotoView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    .line 55
    :cond_1b
    return-void
.end method


# virtual methods
.method public canZoom()Z
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->canZoom()Z

    move-result v0

    return v0
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getIPhotoViewImplementation()Luk/co/senab/photoview/IPhotoView;
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    return-object v0
.end method

.method public getMaxScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMaximumScale()F
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    return v0
.end method

.method public getMediumScale()F
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMidScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 109
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMediumScale()F

    move-result v0

    return v0
.end method

.method public getMinScale()F
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoView;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getMinimumScale()F
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    move-result-object v0

    return-object v0
.end method

.method public getScale()F
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getVisibleRectangleBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 283
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 284
    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 3
    .param p1, "allow"    # Z

    .prologue
    .line 140
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setAllowParentInterceptOnEdge(Z)V

    .line 141
    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .registers 3
    .param p1, "finalRectangle"    # Landroid/graphics/Matrix;

    .prologue
    .line 92
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setDisplayMatrix(Landroid/graphics/Matrix;)Z

    move-result v0

    return v0
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 179
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 180
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 181
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 183
    :cond_c
    return-void
.end method

.method public setImageResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 187
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 188
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 189
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 191
    :cond_c
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 195
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 196
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_c

    .line 197
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 199
    :cond_c
    return-void
.end method

.method public setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMaximumScale(F)V

    .line 169
    return-void
.end method

.method public setMaximumScale(F)V
    .registers 3
    .param p1, "maximumScale"    # F

    .prologue
    .line 173
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMaximumScale(F)V

    .line 174
    return-void
.end method

.method public setMediumScale(F)V
    .registers 3
    .param p1, "mediumScale"    # F

    .prologue
    .line 162
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMediumScale(F)V

    .line 163
    return-void
.end method

.method public setMidScale(F)V
    .registers 2
    .param p1, "midScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMediumScale(F)V

    .line 158
    return-void
.end method

.method public setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoView;->setMinimumScale(F)V

    .line 147
    return-void
.end method

.method public setMinimumScale(F)V
    .registers 3
    .param p1, "minimumScale"    # F

    .prologue
    .line 151
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setMinimumScale(F)V

    .line 152
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .registers 3
    .param p1, "newOnDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 277
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 278
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 208
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 209
    return-void
.end method

.method public setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 3
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 203
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V

    .line 204
    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 3
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 213
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V

    .line 214
    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 3
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 223
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    .line 224
    return-void
.end method

.method public setPhotoViewRotation(F)V
    .registers 3
    .param p1, "rotationDegree"    # F

    .prologue
    .line 62
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationTo(F)V

    .line 63
    return-void
.end method

.method public setRotationBy(F)V
    .registers 3
    .param p1, "rotationDegree"    # F

    .prologue
    .line 72
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationBy(F)V

    .line 73
    return-void
.end method

.method public setRotationTo(F)V
    .registers 3
    .param p1, "rotationDegree"    # F

    .prologue
    .line 67
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotationTo(F)V

    .line 68
    return-void
.end method

.method public setScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .prologue
    .line 233
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(F)V

    .line 234
    return-void
.end method

.method public setScale(FFFZ)V
    .registers 6
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 243
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2, p3, p4}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 244
    return-void
.end method

.method public setScale(FZ)V
    .registers 4
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 238
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    .line 239
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 248
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    if-eqz v0, :cond_a

    .line 249
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 253
    :goto_9
    return-void

    .line 251
    :cond_a
    iput-object p1, p0, Luk/co/senab/photoview/PhotoView;->mPendingScaleType:Landroid/widget/ImageView$ScaleType;

    goto :goto_9
.end method

.method public setZoomTransitionDuration(I)V
    .registers 3
    .param p1, "milliseconds"    # I

    .prologue
    .line 267
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomTransitionDuration(I)V

    .line 268
    return-void
.end method

.method public setZoomable(Z)V
    .registers 3
    .param p1, "zoomable"    # Z

    .prologue
    .line 257
    iget-object v0, p0, Luk/co/senab/photoview/PhotoView;->mAttacher:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    .line 258
    return-void
.end method
