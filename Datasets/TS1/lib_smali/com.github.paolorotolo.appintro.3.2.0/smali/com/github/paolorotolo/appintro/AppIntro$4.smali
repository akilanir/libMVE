.class Lcom/github/paolorotolo/appintro/AppIntro$4;
.super Ljava/lang/Object;
.source "AppIntro.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/paolorotolo/appintro/AppIntro;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/paolorotolo/appintro/AppIntro;

.field final synthetic val$doneButton:Landroid/widget/TextView;

.field final synthetic val$nextButton:Landroid/widget/ImageView;

.field final synthetic val$skipButton:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/AppIntro;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 5
    .param p1, "this$0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    iput-object p2, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$skipButton:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$nextButton:Landroid/widget/ImageView;

    iput-object p4, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$doneButton:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 130
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 102
    return-void
.end method

.method public onPageSelected(I)V
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 106
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$400(Lcom/github/paolorotolo/appintro/AppIntro;)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_16

    .line 107
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$500(Lcom/github/paolorotolo/appintro/AppIntro;)Lcom/github/paolorotolo/appintro/IndicatorController;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/github/paolorotolo/appintro/IndicatorController;->selectPosition(I)V

    .line 108
    :cond_16
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$400(Lcom/github/paolorotolo/appintro/AppIntro;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_4b

    .line 109
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$skipButton:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$nextButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 111
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->showDone:Z
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$600(Lcom/github/paolorotolo/appintro/AppIntro;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 112
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$doneButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 122
    :goto_37
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->showSkip:Z
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$700(Lcom/github/paolorotolo/appintro/AppIntro;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 123
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$skipButton:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 125
    :cond_44
    return-void

    .line 114
    :cond_45
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$doneButton:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_37

    .line 117
    :cond_4b
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$skipButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$doneButton:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 119
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$4;->val$nextButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_37
.end method
