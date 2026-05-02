.class Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;
.super Landroid/graphics/drawable/ShapeDrawable;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CircleDrawable"
.end annotation


# instance fields
.field private circleInsetHorizontal:I

.field private circleInsetVertical:I

.field final synthetic this$0:Lcom/github/clans/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/github/clans/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 633
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    invoke-direct {p0}, Landroid/graphics/drawable/ShapeDrawable;-><init>()V

    .line 634
    return-void
.end method

.method private constructor <init>(Lcom/github/clans/fab/FloatingActionButton;Landroid/graphics/drawable/shapes/Shape;)V
    .registers 6
    .param p2, "s"    # Landroid/graphics/drawable/shapes/Shape;

    .prologue
    const/4 v1, 0x0

    .line 636
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    .line 637
    invoke-direct {p0, p2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 638
    invoke-virtual {p1}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v0

    if-eqz v0, :cond_41

    iget v0, p1, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v2, p1, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    add-int/2addr v0, v2

    :goto_15
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetHorizontal:I

    .line 639
    invoke-virtual {p1}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v0

    if-eqz v0, :cond_26

    iget v0, p1, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v1, p1, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    add-int/2addr v1, v0

    :cond_26
    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetVertical:I

    .line 641
    # getter for: Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z
    invoke-static {p1}, Lcom/github/clans/fab/FloatingActionButton;->access$200(Lcom/github/clans/fab/FloatingActionButton;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 642
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetHorizontal:I

    # getter for: Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I
    invoke-static {p1}, Lcom/github/clans/fab/FloatingActionButton;->access$300(Lcom/github/clans/fab/FloatingActionButton;)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetHorizontal:I

    .line 643
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetVertical:I

    # getter for: Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I
    invoke-static {p1}, Lcom/github/clans/fab/FloatingActionButton;->access$300(Lcom/github/clans/fab/FloatingActionButton;)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetVertical:I

    .line 645
    :cond_40
    return-void

    :cond_41
    move v0, v1

    .line 638
    goto :goto_15
.end method

.method synthetic constructor <init>(Lcom/github/clans/fab/FloatingActionButton;Landroid/graphics/drawable/shapes/Shape;Lcom/github/clans/fab/FloatingActionButton$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/github/clans/fab/FloatingActionButton;
    .param p2, "x1"    # Landroid/graphics/drawable/shapes/Shape;
    .param p3, "x2"    # Lcom/github/clans/fab/FloatingActionButton$1;

    .prologue
    .line 628
    invoke-direct {p0, p1, p2}, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;-><init>(Lcom/github/clans/fab/FloatingActionButton;Landroid/graphics/drawable/shapes/Shape;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 649
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetHorizontal:I

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetVertical:I

    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    # invokes: Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredWidth()I
    invoke-static {v2}, Lcom/github/clans/fab/FloatingActionButton;->access$400(Lcom/github/clans/fab/FloatingActionButton;)I

    move-result v2

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetHorizontal:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    .line 650
    # invokes: Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredHeight()I
    invoke-static {v3}, Lcom/github/clans/fab/FloatingActionButton;->access$500(Lcom/github/clans/fab/FloatingActionButton;)I

    move-result v3

    iget v4, p0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->circleInsetVertical:I

    sub-int/2addr v3, v4

    .line 649
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->setBounds(IIII)V

    .line 651
    invoke-super {p0, p1}, Landroid/graphics/drawable/ShapeDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 652
    return-void
.end method
