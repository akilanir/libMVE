.class public Lcom/github/paolorotolo/appintro/ProgressIndicatorController;
.super Ljava/lang/Object;
.source "ProgressIndicatorController.java"

# interfaces
.implements Lcom/github/paolorotolo/appintro/IndicatorController;


# static fields
.field public static final DEFAULT_COLOR:I = 0x1

.field private static final FIRST_PAGE_NUM:I


# instance fields
.field private mProgressBar:Landroid/widget/ProgressBar;

.field selectedDotColor:I

.field unselectedDotColor:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectedDotColor:I

    .line 15
    iput v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->unselectedDotColor:I

    return-void
.end method


# virtual methods
.method public initialize(I)V
    .registers 3
    .param p1, "slideCount"    # I

    .prologue
    .line 29
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 30
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectPosition(I)V

    .line 31
    return-void
.end method

.method public newInstance(Landroid/content/Context;)Landroid/view/View;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    .line 19
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->progress_indicator:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    .line 20
    iget v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectedDotColor:I

    if-eq v0, v3, :cond_1d

    .line 21
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectedDotColor:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 22
    :cond_1d
    iget v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->unselectedDotColor:I

    if-eq v0, v3, :cond_2e

    .line 23
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->unselectedDotColor:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 24
    :cond_2e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public selectPosition(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 35
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 36
    return-void
.end method

.method public setSelectedIndicatorColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectedDotColor:I

    .line 41
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_11

    .line 42
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 43
    :cond_11
    return-void
.end method

.method public setUnselectedIndicatorColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 47
    iput p1, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->unselectedDotColor:I

    .line 48
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_11

    .line 49
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 50
    :cond_11
    return-void
.end method
