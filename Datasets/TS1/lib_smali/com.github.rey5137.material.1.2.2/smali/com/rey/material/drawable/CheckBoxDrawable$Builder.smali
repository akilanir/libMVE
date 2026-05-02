.class public Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
.super Ljava/lang/Object;
.source "CheckBoxDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/CheckBoxDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAnimDuration:I

.field private mBoxSize:I

.field private mCornerRadius:I

.field private mHeight:I

.field private mStrokeColor:Landroid/content/res/ColorStateList;

.field private mStrokeSize:I

.field private mTickColor:I

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0x40

    .line 365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 356
    const/16 v0, 0x190

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mAnimDuration:I

    .line 357
    const/4 v0, 0x4

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeSize:I

    .line 358
    iput v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mWidth:I

    .line 359
    iput v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mHeight:I

    .line 361
    const/16 v0, 0x8

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mCornerRadius:I

    .line 362
    const/16 v0, 0x20

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mBoxSize:I

    .line 363
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mTickColor:I

    .line 365
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 368
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 369
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/high16 v9, -0x1000000

    const/16 v5, 0x20

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 356
    const/16 v3, 0x190

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mAnimDuration:I

    .line 357
    const/4 v3, 0x4

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeSize:I

    .line 358
    const/16 v3, 0x40

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mWidth:I

    .line 359
    const/16 v3, 0x40

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mHeight:I

    .line 361
    const/16 v3, 0x8

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mCornerRadius:I

    .line 362
    iput v5, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mBoxSize:I

    .line 363
    const/4 v3, -0x1

    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mTickColor:I

    .line 372
    sget-object v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable:[I

    invoke-virtual {p1, p2, v3, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 374
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_width:I

    invoke-static {p1, v5}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->width(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 375
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_height:I

    invoke-static {p1, v5}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->height(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 376
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_boxSize:I

    const/16 v4, 0x12

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->boxSize(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 377
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_cornerRadius:I

    invoke-static {p1, v8}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->cornerRadius(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 378
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_strokeSize:I

    invoke-static {p1, v8}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->strokeSize(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 379
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_strokeColor:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 380
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_tickColor:I

    const/4 v4, -0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->tickColor(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 381
    sget v3, Lcom/rey/material/R$styleable;->CheckBoxDrawable_cbd_animDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x10e0001

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->animDuration(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 383
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 385
    iget-object v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    if-nez v3, :cond_c3

    .line 386
    new-array v2, v8, [[I

    new-array v3, v7, [I

    const v4, -0x10100a0

    aput v4, v3, v6

    aput-object v3, v2, v6

    new-array v3, v7, [I

    const v4, 0x10100a0

    aput v4, v3, v6

    aput-object v3, v2, v7

    .line 390
    .local v2, "states":[[I
    new-array v1, v8, [I

    invoke-static {p1, v9}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v3

    aput v3, v1, v6

    invoke-static {p1, v9}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v3

    aput v3, v1, v7

    .line 394
    .local v1, "colors":[I
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    .line 396
    .end local v1    # "colors":[I
    .end local v2    # "states":[[I
    :cond_c3
    return-void
.end method


# virtual methods
.method public animDuration(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 446
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mAnimDuration:I

    .line 447
    return-object p0
.end method

.method public boxSize(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 441
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mBoxSize:I

    .line 442
    return-object p0
.end method

.method public build()Lcom/rey/material/drawable/CheckBoxDrawable;
    .registers 11

    .prologue
    .line 399
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_c

    .line 400
    const/high16 v0, -0x1000000

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 402
    :cond_c
    new-instance v0, Lcom/rey/material/drawable/CheckBoxDrawable;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mWidth:I

    iget v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mHeight:I

    iget v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mBoxSize:I

    iget v4, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mCornerRadius:I

    iget v5, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeSize:I

    iget-object v6, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    iget v7, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mTickColor:I

    iget v8, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mAnimDuration:I

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/rey/material/drawable/CheckBoxDrawable;-><init>(IIIIILandroid/content/res/ColorStateList;IILcom/rey/material/drawable/CheckBoxDrawable$1;)V

    return-object v0
.end method

.method public cornerRadius(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 436
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mCornerRadius:I

    .line 437
    return-object p0
.end method

.method public height(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 411
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mHeight:I

    .line 412
    return-object p0
.end method

.method public strokeColor(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 421
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 422
    return-object p0
.end method

.method public strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 426
    iput-object p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 427
    return-object p0
.end method

.method public strokeSize(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 416
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mStrokeSize:I

    .line 417
    return-object p0
.end method

.method public tickColor(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 431
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mTickColor:I

    .line 432
    return-object p0
.end method

.method public width(I)Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 406
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->mWidth:I

    .line 407
    return-object p0
.end method
