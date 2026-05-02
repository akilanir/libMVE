.class Lcom/github/paolorotolo/appintro/DefaultIndicatorController;
.super Ljava/lang/Object;
.source "DefaultIndicatorController.java"

# interfaces
.implements Lcom/github/paolorotolo/appintro/IndicatorController;


# static fields
.field private static final FIRST_PAGE_NUM:I


# instance fields
.field private mContext:Landroid/content/Context;

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


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initialize(I)V
    .registers 8
    .param p1, "slideCount"    # I

    .prologue
    const/4 v5, -0x2

    .line 30
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    .line 31
    iput p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mSlideCount:I

    .line 33
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    if-ge v1, p1, :cond_31

    .line 34
    new-instance v0, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 35
    .local v0, "dot":Landroid/widget/ImageView;
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    sget v4, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    invoke-static {v3, v4}, Lcom/github/paolorotolo/appintro/ResourceUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 42
    .local v2, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 46
    .end local v0    # "dot":Landroid/widget/ImageView;
    .end local v2    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_31
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->selectPosition(I)V

    .line 47
    return-void
.end method

.method public newInstance(Landroid/content/Context;)Landroid/view/View;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    .line 24
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->default_indicator:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    .line 25
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDotLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public selectPosition(I)V
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 51
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mSlideCount:I

    if-ge v2, v3, :cond_20

    .line 52
    if-ne v2, p1, :cond_1d

    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_white:I

    .line 53
    .local v1, "drawableId":I
    :goto_9
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mContext:Landroid/content/Context;

    invoke-static {v3, v1}, Lcom/github/paolorotolo/appintro/ResourceUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 54
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;->mDots:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 52
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "drawableId":I
    :cond_1d
    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    goto :goto_9

    .line 56
    :cond_20
    return-void
.end method
