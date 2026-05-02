.class public Lcom/github/paolorotolo/appintro/ProgressIndicatorController;
.super Ljava/lang/Object;
.source "ProgressIndicatorController.java"

# interfaces
.implements Lcom/github/paolorotolo/appintro/IndicatorController;


# static fields
.field private static final FIRST_PAGE_NUM:I


# instance fields
.field private mProgressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initialize(I)V
    .registers 3
    .param p1, "slideCount"    # I

    .prologue
    .line 21
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 22
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->selectPosition(I)V

    .line 23
    return-void
.end method

.method public newInstance(Landroid/content/Context;)Landroid/view/View;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 15
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->progress_indicator:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    .line 16
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public selectPosition(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 27
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;->mProgressBar:Landroid/widget/ProgressBar;

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 28
    return-void
.end method
