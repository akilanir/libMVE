.class public Lcom/jjoe64/graphview/GraphView;
.super Landroid/view/View;
.source "GraphView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jjoe64/graphview/GraphView$TapDetector;,
        Lcom/jjoe64/graphview/GraphView$Styles;
    }
.end annotation


# instance fields
.field private mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

.field private mLegendRenderer:Lcom/jjoe64/graphview/LegendRenderer;

.field private mPaintTitle:Landroid/graphics/Paint;

.field private mPreviewPaint:Landroid/graphics/Paint;

.field protected mSecondScale:Lcom/jjoe64/graphview/SecondScale;

.field private mSeries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jjoe64/graphview/series/Series;",
            ">;"
        }
    .end annotation
.end field

.field private mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

.field private mTapDetector:Lcom/jjoe64/graphview/GraphView$TapDetector;

.field private mTitle:Ljava/lang/String;

.field private mViewport:Lcom/jjoe64/graphview/Viewport;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 168
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 169
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->init()V

    .line 170
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 179
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 180
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->init()V

    .line 181
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 191
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 192
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->init()V

    .line 193
    return-void
.end method


# virtual methods
.method public addSeries(Lcom/jjoe64/graphview/series/Series;)V
    .registers 4
    .param p1, "s"    # Lcom/jjoe64/graphview/series/Series;

    .prologue
    const/4 v1, 0x0

    .line 240
    invoke-interface {p1, p0}, Lcom/jjoe64/graphview/series/Series;->onGraphViewAttached(Lcom/jjoe64/graphview/GraphView;)V

    .line 241
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    invoke-virtual {p0, v1, v1}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 243
    return-void
.end method

.method public computeScroll()V
    .registers 2

    .prologue
    .line 440
    invoke-super {p0}, Landroid/view/View;->computeScroll()V

    .line 441
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/Viewport;->computeScroll()V

    .line 442
    return-void
.end method

.method protected drawTitle(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 318
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    if-eqz v2, :cond_39

    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_39

    .line 319
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget v3, v3, Lcom/jjoe64/graphview/GraphView$Styles;->titleColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 320
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget v3, v3, Lcom/jjoe64/graphview/GraphView$Styles;->titleTextSize:F

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 321
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 322
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v0, v2

    .line 323
    .local v0, "x":F
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextSize()F

    move-result v1

    .line 324
    .local v1, "y":F
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 326
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_39
    return-void
.end method

.method public getGraphContentHeight()I
    .registers 5

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jjoe64/graphview/GridLabelRenderer;->getStyles()Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    move-result-object v2

    iget v0, v2, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    .line 392
    .local v0, "border":I
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getHeight()I

    move-result v2

    mul-int/lit8 v3, v0, 0x2

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jjoe64/graphview/GridLabelRenderer;->getLabelHorizontalHeight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getTitleHeight()I

    move-result v3

    sub-int v1, v2, v3

    .line 393
    .local v1, "graphheight":I
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalAxisTitleHeight()I

    move-result v2

    sub-int/2addr v1, v2

    .line 394
    return v1
.end method

.method public getGraphContentLeft()I
    .registers 4

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->getStyles()Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    move-result-object v1

    iget v0, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    .line 374
    .local v0, "border":I
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->getLabelVerticalWidth()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleWidth()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public getGraphContentTop()I
    .registers 4

    .prologue
    .line 383
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->getStyles()Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    move-result-object v1

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getTitleHeight()I

    move-result v2

    add-int v0, v1, v2

    .line 384
    .local v0, "border":I
    return v0
.end method

.method public getGraphContentWidth()I
    .registers 5

    .prologue
    .line 401
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jjoe64/graphview/GridLabelRenderer;->getStyles()Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    move-result-object v2

    iget v0, v2, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    .line 402
    .local v0, "border":I
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getWidth()I

    move-result v2

    mul-int/lit8 v3, v0, 0x2

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jjoe64/graphview/GridLabelRenderer;->getLabelVerticalWidth()I

    move-result v3

    sub-int v1, v2, v3

    .line 403
    .local v1, "graphwidth":I
    iget-object v2, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-eqz v2, :cond_28

    .line 404
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jjoe64/graphview/GridLabelRenderer;->getLabelVerticalSecondScaleWidth()I

    move-result v2

    sub-int/2addr v1, v2

    .line 406
    :cond_28
    return v1
.end method

.method public getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    return-object v0
.end method

.method public getLegendRenderer()Lcom/jjoe64/graphview/LegendRenderer;
    .registers 2

    .prologue
    .line 449
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mLegendRenderer:Lcom/jjoe64/graphview/LegendRenderer;

    return-object v0
.end method

.method public getSecondScale()Lcom/jjoe64/graphview/SecondScale;
    .registers 3

    .prologue
    .line 520
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-nez v0, :cond_d

    .line 521
    new-instance v0, Lcom/jjoe64/graphview/SecondScale;

    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-direct {v0, v1}, Lcom/jjoe64/graphview/SecondScale;-><init>(Lcom/jjoe64/graphview/Viewport;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    .line 523
    :cond_d
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    return-object v0
.end method

.method public getSeries()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/jjoe64/graphview/series/Series;",
            ">;"
        }
    .end annotation

    .prologue
    .line 254
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleColor()I
    .registers 2

    .prologue
    .line 502
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleColor:I

    return v0
.end method

.method protected getTitleHeight()I
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_14

    .line 337
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    float-to-int v0, v0

    .line 339
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public getTitleTextSize()F
    .registers 2

    .prologue
    .line 485
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleTextSize:F

    return v0
.end method

.method public getViewport()Lcom/jjoe64/graphview/Viewport;
    .registers 2

    .prologue
    .line 348
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    return-object v0
.end method

.method protected init()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 201
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPreviewPaint:Landroid/graphics/Paint;

    .line 202
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPreviewPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 203
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPreviewPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 204
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPreviewPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x42480000    # 50.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 206
    new-instance v0, Lcom/jjoe64/graphview/GraphView$Styles;

    invoke-direct {v0, v2}, Lcom/jjoe64/graphview/GraphView$Styles;-><init>(Lcom/jjoe64/graphview/GraphView$1;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    .line 207
    new-instance v0, Lcom/jjoe64/graphview/Viewport;

    invoke-direct {v0, p0}, Lcom/jjoe64/graphview/Viewport;-><init>(Lcom/jjoe64/graphview/GraphView;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    .line 208
    new-instance v0, Lcom/jjoe64/graphview/GridLabelRenderer;

    invoke-direct {v0, p0}, Lcom/jjoe64/graphview/GridLabelRenderer;-><init>(Lcom/jjoe64/graphview/GraphView;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    .line 209
    new-instance v0, Lcom/jjoe64/graphview/LegendRenderer;

    invoke-direct {v0, p0}, Lcom/jjoe64/graphview/LegendRenderer;-><init>(Lcom/jjoe64/graphview/GraphView;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mLegendRenderer:Lcom/jjoe64/graphview/LegendRenderer;

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    .line 212
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mPaintTitle:Landroid/graphics/Paint;

    .line 214
    new-instance v0, Lcom/jjoe64/graphview/GraphView$TapDetector;

    invoke-direct {v0, p0, v2}, Lcom/jjoe64/graphview/GraphView$TapDetector;-><init>(Lcom/jjoe64/graphview/GraphView;Lcom/jjoe64/graphview/GraphView$1;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mTapDetector:Lcom/jjoe64/graphview/GraphView$TapDetector;

    .line 216
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->loadStyles()V

    .line 217
    return-void
.end method

.method protected loadStyles()V
    .registers 3

    .prologue
    .line 223
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalLabelsColor()I

    move-result v1

    iput v1, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleColor:I

    .line 224
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v1

    iput v1, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleTextSize:F

    .line 225
    return-void
.end method

.method public onDataChanged(ZZ)V
    .registers 4
    .param p1, "keepLabelsSize"    # Z
    .param p2, "keepViewport"    # Z

    .prologue
    .line 278
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/Viewport;->calcCompleteRange()V

    .line 279
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/jjoe64/graphview/GridLabelRenderer;->invalidate(ZZ)V

    .line 280
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->invalidate()V

    .line 281
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v2, 0xc8

    .line 290
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GraphView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 291
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 292
    const-string v1, "GraphView: No Preview available"

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget-object v4, p0, Lcom/jjoe64/graphview/GraphView;->mPreviewPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 308
    :goto_24
    return-void

    .line 294
    :cond_25
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GraphView;->drawTitle(Landroid/graphics/Canvas;)V

    .line 295
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v1, p1}, Lcom/jjoe64/graphview/Viewport;->drawFirst(Landroid/graphics/Canvas;)V

    .line 296
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mGridLabelRenderer:Lcom/jjoe64/graphview/GridLabelRenderer;

    invoke-virtual {v1, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->draw(Landroid/graphics/Canvas;)V

    .line 297
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jjoe64/graphview/series/Series;

    .line 298
    .local v0, "s":Lcom/jjoe64/graphview/series/Series;
    const/4 v2, 0x0

    invoke-interface {v0, p0, p1, v2}, Lcom/jjoe64/graphview/series/Series;->draw(Lcom/jjoe64/graphview/GraphView;Landroid/graphics/Canvas;Z)V

    goto :goto_38

    .line 300
    .end local v0    # "s":Lcom/jjoe64/graphview/series/Series;
    :cond_49
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-eqz v1, :cond_68

    .line 301
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/SecondScale;->getSeries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_57
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jjoe64/graphview/series/Series;

    .line 302
    .restart local v0    # "s":Lcom/jjoe64/graphview/series/Series;
    const/4 v2, 0x1

    invoke-interface {v0, p0, p1, v2}, Lcom/jjoe64/graphview/series/Series;->draw(Lcom/jjoe64/graphview/GraphView;Landroid/graphics/Canvas;Z)V

    goto :goto_57

    .line 305
    .end local v0    # "s":Lcom/jjoe64/graphview/series/Series;
    :cond_68
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v1, p1}, Lcom/jjoe64/graphview/Viewport;->draw(Landroid/graphics/Canvas;)V

    .line 306
    iget-object v1, p0, Lcom/jjoe64/graphview/GraphView;->mLegendRenderer:Lcom/jjoe64/graphview/LegendRenderer;

    invoke-virtual {v1, p1}, Lcom/jjoe64/graphview/LegendRenderer;->draw(Landroid/graphics/Canvas;)V

    goto :goto_24
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v0, 0x0

    .line 363
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 364
    invoke-virtual {p0, v0, v0}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 365
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 417
    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v3, p1}, Lcom/jjoe64/graphview/Viewport;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 418
    .local v1, "b":Z
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 421
    .local v0, "a":Z
    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mTapDetector:Lcom/jjoe64/graphview/GraphView$TapDetector;

    invoke-virtual {v3, p1}, Lcom/jjoe64/graphview/GraphView$TapDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 422
    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jjoe64/graphview/series/Series;

    .line 423
    .local v2, "s":Lcom/jjoe64/graphview/series/Series;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-interface {v2, v4, v5}, Lcom/jjoe64/graphview/series/Series;->onTap(FF)V

    goto :goto_18

    .line 425
    .end local v2    # "s":Lcom/jjoe64/graphview/series/Series;
    :cond_30
    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-eqz v3, :cond_56

    .line 426
    iget-object v3, p0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v3}, Lcom/jjoe64/graphview/SecondScale;->getSeries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_56

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jjoe64/graphview/series/Series;

    .line 427
    .restart local v2    # "s":Lcom/jjoe64/graphview/series/Series;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-interface {v2, v4, v5}, Lcom/jjoe64/graphview/series/Series;->onTap(FF)V

    goto :goto_3e

    .line 432
    .end local v2    # "s":Lcom/jjoe64/graphview/series/Series;
    :cond_56
    if-nez v1, :cond_5a

    if-eqz v0, :cond_5c

    :cond_5a
    const/4 v3, 0x1

    :goto_5b
    return v3

    :cond_5c
    const/4 v3, 0x0

    goto :goto_5b
.end method

.method public removeAllSeries()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 530
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 531
    invoke-virtual {p0, v1, v1}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 532
    return-void
.end method

.method public removeSeries(Lcom/jjoe64/graphview/series/Series;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jjoe64/graphview/series/Series",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "series":Lcom/jjoe64/graphview/series/Series;, "Lcom/jjoe64/graphview/series/Series<*>;"
    const/4 v1, 0x0

    .line 545
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mSeries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 546
    invoke-virtual {p0, v1, v1}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 547
    return-void
.end method

.method public setLegendRenderer(Lcom/jjoe64/graphview/LegendRenderer;)V
    .registers 2
    .param p1, "mLegendRenderer"    # Lcom/jjoe64/graphview/LegendRenderer;

    .prologue
    .line 458
    iput-object p1, p0, Lcom/jjoe64/graphview/GraphView;->mLegendRenderer:Lcom/jjoe64/graphview/LegendRenderer;

    .line 459
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "mTitle"    # Ljava/lang/String;

    .prologue
    .line 478
    iput-object p1, p0, Lcom/jjoe64/graphview/GraphView;->mTitle:Ljava/lang/String;

    .line 479
    return-void
.end method

.method public setTitleColor(I)V
    .registers 3
    .param p1, "titleColor"    # I

    .prologue
    .line 512
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleColor:I

    .line 513
    return-void
.end method

.method public setTitleTextSize(F)V
    .registers 3
    .param p1, "titleTextSize"    # F

    .prologue
    .line 495
    iget-object v0, p0, Lcom/jjoe64/graphview/GraphView;->mStyles:Lcom/jjoe64/graphview/GraphView$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GraphView$Styles;->titleTextSize:F

    .line 496
    return-void
.end method
