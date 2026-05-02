.class public Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
.super Ljava/lang/Object;
.source "RadioButtonDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RadioButtonDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAnimDuration:I

.field private mHeight:I

.field private mInnerRadius:I

.field private mRadius:I

.field private mStrokeColor:Landroid/content/res/ColorStateList;

.field private mStrokeSize:I

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0x40

    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    const/16 v0, 0x190

    iput v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mAnimDuration:I

    .line 280
    const/4 v0, 0x4

    iput v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeSize:I

    .line 281
    iput v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mWidth:I

    .line 282
    iput v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mHeight:I

    .line 283
    const/16 v0, 0x12

    iput v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mRadius:I

    .line 284
    const/16 v0, 0xa

    iput v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mInnerRadius:I

    .line 287
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 290
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 291
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/16 v5, 0xa

    const/high16 v9, -0x1000000

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    const/16 v3, 0x190

    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mAnimDuration:I

    .line 280
    const/4 v3, 0x4

    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeSize:I

    .line 281
    const/16 v3, 0x40

    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mWidth:I

    .line 282
    const/16 v3, 0x40

    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mHeight:I

    .line 283
    const/16 v3, 0x12

    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mRadius:I

    .line 284
    iput v5, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mInnerRadius:I

    .line 294
    sget-object v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable:[I

    invoke-virtual {p1, p2, v3, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 296
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_width:I

    const/16 v4, 0x20

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->width(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 297
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_height:I

    const/16 v4, 0x20

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->height(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 298
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_strokeSize:I

    invoke-static {p1, v8}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->strokeSize(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 299
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_radius:I

    invoke-static {p1, v5}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->radius(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 300
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_innerRadius:I

    const/4 v4, 0x5

    invoke-static {p1, v4}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->innerRadius(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 301
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_strokeColor:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 302
    sget v3, Lcom/rey/material/R$styleable;->RadioButtonDrawable_rbd_animDuration:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x10e0001

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->animDuration(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 304
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 306
    iget-object v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    if-nez v3, :cond_b9

    .line 307
    new-array v2, v8, [[I

    new-array v3, v7, [I

    const v4, -0x10100a0

    aput v4, v3, v6

    aput-object v3, v2, v6

    new-array v3, v7, [I

    const v4, 0x10100a0

    aput v4, v3, v6

    aput-object v3, v2, v7

    .line 311
    .local v2, "states":[[I
    new-array v1, v8, [I

    invoke-static {p1, v9}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v3

    aput v3, v1, v6

    invoke-static {p1, v9}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v3

    aput v3, v1, v7

    .line 315
    .local v1, "colors":[I
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {p0, v3}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    .line 317
    .end local v1    # "colors":[I
    .end local v2    # "states":[[I
    :cond_b9
    return-void
.end method


# virtual methods
.method public animDuration(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 362
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mAnimDuration:I

    .line 363
    return-object p0
.end method

.method public build()Lcom/rey/material/drawable/RadioButtonDrawable;
    .registers 10

    .prologue
    .line 320
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_c

    .line 321
    const/high16 v0, -0x1000000

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 323
    :cond_c
    new-instance v0, Lcom/rey/material/drawable/RadioButtonDrawable;

    iget v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mWidth:I

    iget v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mHeight:I

    iget v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeSize:I

    iget-object v4, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    iget v5, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mRadius:I

    iget v6, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mInnerRadius:I

    iget v7, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mAnimDuration:I

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/rey/material/drawable/RadioButtonDrawable;-><init>(IIILandroid/content/res/ColorStateList;IIILcom/rey/material/drawable/RadioButtonDrawable$1;)V

    return-object v0
.end method

.method public height(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 332
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mHeight:I

    .line 333
    return-object p0
.end method

.method public innerRadius(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 357
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mInnerRadius:I

    .line 358
    return-object p0
.end method

.method public radius(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "radius"    # I

    .prologue
    .line 352
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mRadius:I

    .line 353
    return-object p0
.end method

.method public strokeColor(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 342
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 343
    return-object p0
.end method

.method public strokeColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 347
    iput-object p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 348
    return-object p0
.end method

.method public strokeSize(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 337
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mStrokeSize:I

    .line 338
    return-object p0
.end method

.method public width(I)Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 327
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->mWidth:I

    .line 328
    return-object p0
.end method
