.class Lcom/github/clans/fab/Label$Shadow;
.super Landroid/graphics/drawable/Drawable;
.source "Label.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/Label;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Shadow"
.end annotation


# instance fields
.field private mErase:Landroid/graphics/Paint;

.field private mPaint:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/github/clans/fab/Label;


# direct methods
.method private constructor <init>(Lcom/github/clans/fab/Label;)V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 313
    iput-object p1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 310
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mPaint:Landroid/graphics/Paint;

    .line 311
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mErase:Landroid/graphics/Paint;

    .line 314
    invoke-direct {p0}, Lcom/github/clans/fab/Label$Shadow;->init()V

    .line 315
    return-void
.end method

.method synthetic constructor <init>(Lcom/github/clans/fab/Label;Lcom/github/clans/fab/Label$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/github/clans/fab/Label;
    .param p2, "x1"    # Lcom/github/clans/fab/Label$1;

    .prologue
    .line 308
    invoke-direct {p0, p1}, Lcom/github/clans/fab/Label$Shadow;-><init>(Lcom/github/clans/fab/Label;)V

    return-void
.end method

.method private init()V
    .registers 6

    .prologue
    .line 318
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/github/clans/fab/Label;->setLayerType(ILandroid/graphics/Paint;)V

    .line 319
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 320
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mColorNormal:I
    invoke-static {v1}, Lcom/github/clans/fab/Label;->access$200(Lcom/github/clans/fab/Label;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 322
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mErase:Landroid/graphics/Paint;

    # getter for: Lcom/github/clans/fab/Label;->PORTER_DUFF_CLEAR:Landroid/graphics/Xfermode;
    invoke-static {}, Lcom/github/clans/fab/Label;->access$300()Landroid/graphics/Xfermode;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 324
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    invoke-virtual {v0}, Lcom/github/clans/fab/Label;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_4a

    .line 325
    iget-object v0, p0, Lcom/github/clans/fab/Label$Shadow;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowRadius:I
    invoke-static {v1}, Lcom/github/clans/fab/Label;->access$400(Lcom/github/clans/fab/Label;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowXOffset:I
    invoke-static {v2}, Lcom/github/clans/fab/Label;->access$500(Lcom/github/clans/fab/Label;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowYOffset:I
    invoke-static {v3}, Lcom/github/clans/fab/Label;->access$600(Lcom/github/clans/fab/Label;)I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowColor:I
    invoke-static {v4}, Lcom/github/clans/fab/Label;->access$700(Lcom/github/clans/fab/Label;)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 327
    :cond_4a
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 331
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    .line 332
    # getter for: Lcom/github/clans/fab/Label;->mShadowRadius:I
    invoke-static {v1}, Lcom/github/clans/fab/Label;->access$400(Lcom/github/clans/fab/Label;)I

    move-result v1

    iget-object v2, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowXOffset:I
    invoke-static {v2}, Lcom/github/clans/fab/Label;->access$500(Lcom/github/clans/fab/Label;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    .line 333
    # getter for: Lcom/github/clans/fab/Label;->mShadowRadius:I
    invoke-static {v2}, Lcom/github/clans/fab/Label;->access$400(Lcom/github/clans/fab/Label;)I

    move-result v2

    iget-object v3, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mShadowYOffset:I
    invoke-static {v3}, Lcom/github/clans/fab/Label;->access$600(Lcom/github/clans/fab/Label;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    .line 334
    # getter for: Lcom/github/clans/fab/Label;->mRawWidth:I
    invoke-static {v3}, Lcom/github/clans/fab/Label;->access$800(Lcom/github/clans/fab/Label;)I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    .line 335
    # getter for: Lcom/github/clans/fab/Label;->mRawHeight:I
    invoke-static {v4}, Lcom/github/clans/fab/Label;->access$900(Lcom/github/clans/fab/Label;)I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 338
    .local v0, "shadowRect":Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mCornerRadius:I
    invoke-static {v1}, Lcom/github/clans/fab/Label;->access$1000(Lcom/github/clans/fab/Label;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mCornerRadius:I
    invoke-static {v2}, Lcom/github/clans/fab/Label;->access$1000(Lcom/github/clans/fab/Label;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/clans/fab/Label$Shadow;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 339
    iget-object v1, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mCornerRadius:I
    invoke-static {v1}, Lcom/github/clans/fab/Label;->access$1000(Lcom/github/clans/fab/Label;)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/clans/fab/Label$Shadow;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mCornerRadius:I
    invoke-static {v2}, Lcom/github/clans/fab/Label;->access$1000(Lcom/github/clans/fab/Label;)I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/clans/fab/Label$Shadow;->mErase:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 340
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 354
    const/4 v0, 0x0

    return v0
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 345
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 350
    return-void
.end method
