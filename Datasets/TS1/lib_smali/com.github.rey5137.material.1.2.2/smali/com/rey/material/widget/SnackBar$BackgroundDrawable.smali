.class Lcom/rey/material/widget/SnackBar$BackgroundDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SnackBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackgroundDrawable"
.end annotation


# instance fields
.field private mBackgroundColor:I

.field private mBackgroundRadius:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/rey/material/widget/SnackBar;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/SnackBar;)V
    .registers 4

    .prologue
    .line 927
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 928
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    .line 929
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 930
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 932
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mRect:Landroid/graphics/RectF;

    .line 933
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 957
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundRadius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundRadius:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 958
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 972
    const/4 v0, -0x3

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 952
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 953
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 962
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 963
    return-void
.end method

.method public setColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 936
    iget v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundColor:I

    if-eq v0, p1, :cond_10

    .line 937
    iput p1, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundColor:I

    .line 938
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 939
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->invalidateSelf()V

    .line 941
    :cond_10
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 967
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 968
    return-void
.end method

.method public setRadius(I)V
    .registers 3
    .param p1, "radius"    # I

    .prologue
    .line 944
    iget v0, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundRadius:I

    if-eq v0, p1, :cond_9

    .line 945
    iput p1, p0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->mBackgroundRadius:I

    .line 946
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->invalidateSelf()V

    .line 948
    :cond_9
    return-void
.end method
