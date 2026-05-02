.class Lcom/github/paolorotolo/appintro/AppIntro2$3;
.super Ljava/lang/Object;
.source "AppIntro2.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/paolorotolo/appintro/AppIntro2;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

.field final synthetic val$doneButton:Landroid/widget/ImageView;

.field final synthetic val$nextButton:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/AppIntro2;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .registers 4
    .param p1, "this$0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iput-object p2, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$nextButton:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$doneButton:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 107
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 86
    return-void
.end method

.method public onPageSelected(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 90
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$400(Lcom/github/paolorotolo/appintro/AppIntro2;)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_15

    .line 91
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$500(Lcom/github/paolorotolo/appintro/AppIntro2;)Lcom/github/paolorotolo/appintro/IndicatorController;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/github/paolorotolo/appintro/IndicatorController;->selectPosition(I)V

    .line 92
    :cond_15
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$400(Lcom/github/paolorotolo/appintro/AppIntro2;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_39

    .line 93
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$nextButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 94
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->showDone:Z
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$600(Lcom/github/paolorotolo/appintro/AppIntro2;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 95
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$doneButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 103
    :goto_31
    return-void

    .line 97
    :cond_32
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$doneButton:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_31

    .line 100
    :cond_39
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$doneButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 101
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->val$nextButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_31
.end method
