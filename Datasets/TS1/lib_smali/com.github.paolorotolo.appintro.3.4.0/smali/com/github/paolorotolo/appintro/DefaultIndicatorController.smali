.class Lcom/github/paolorotolo/appintro/DefaultIndicatorController;
.super Ljava/lang/Object;
.source "DefaultIndicatorController.java"

# interfaces
.implements Lcom/github/paolorotolo/appintro/IndicatorController;


# static fields
.field public static final DEFAULT_COLOR:I = 0x1

.field private static final FIRST_PAGE_NUM:I


# instance fields
.field private mContext:Landroid/content/Context;

.field mCurrentposition:I

.field private mDotLayout:Landroid/widget/LinearLayout;

.field private mDots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mSlideCount:I

.field selectedDotColor:I

.field unselectedDotColor:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectedDotColor:I

    .line 23
    iput v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->unselectedDotColor:I

    return-void
.end method


# virtual methods
.method public initialize(I)V
    .registers 8
    .param p1, "slideCount"    # I

    .prologue
    const/4 v4, -0x1

    const/4 v5, -0x2

    .line 37
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    .line 38
    iput p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mSlideCount:I

    .line 39
    iput v4, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectedDotColor:I

    .line 40
    iput v4, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->unselectedDotColor:I

    .line 42
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    if-ge v1, p1, :cond_36

    .line 43
    new-instance v0, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 44
    .local v0, "dot":Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    sget v4, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    invoke-static {v3, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 46
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 51
    .local v2, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 55
    .end local v0    # "dot":Landroid/widget/ImageView;
    .end local v2    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_36
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectPosition(I)V

    .line 56
    return-void
.end method

.method public newInstance(Landroid/content/Context;)Landroid/view/View;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 30
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    .line 31
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->default_indicator:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    .line 32
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public selectPosition(I)V
    .registers 9
    .param p1, "index"    # I

    .prologue
    const/4 v6, 0x1

    .line 60
    iput p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mCurrentposition:I

    .line 61
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    iget v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mSlideCount:I

    if-ge v2, v3, :cond_45

    .line 62
    if-ne v2, p1, :cond_42

    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_white:I

    .line 63
    .local v1, "drawableId":I
    :goto_c
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    invoke-static {v3, v1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 64
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectedDotColor:I

    if-eq v3, v6, :cond_23

    if-ne v2, p1, :cond_23

    .line 65
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget v4, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectedDotColor:I

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 66
    :cond_23
    iget v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->unselectedDotColor:I

    if-eq v3, v6, :cond_34

    if-eq v2, p1, :cond_34

    .line 67
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget v4, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->unselectedDotColor:I

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 68
    :cond_34
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 62
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "drawableId":I
    :cond_42
    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    goto :goto_c

    .line 70
    :cond_45
    return-void
.end method

.method public setSelectedIndicatorColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectedDotColor:I

    .line 75
    iget v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mCurrentposition:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectPosition(I)V

    .line 76
    return-void
.end method

.method public setUnselectedIndicatorColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->unselectedDotColor:I

    .line 81
    iget v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mCurrentposition:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectPosition(I)V

    .line 82
    return-void
.end method
