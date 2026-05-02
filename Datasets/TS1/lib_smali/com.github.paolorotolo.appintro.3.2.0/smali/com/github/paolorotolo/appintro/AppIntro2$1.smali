.class Lcom/github/paolorotolo/appintro/AppIntro2$1;
.super Ljava/lang/Object;
.source "AppIntro2.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V
    .registers 2
    .param p1, "this$0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 59
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 60
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$200(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/os/Vibrator;

    move-result-object v0

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I
    invoke-static {v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$100(Lcom/github/paolorotolo/appintro/AppIntro2;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 62
    :cond_18
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$300(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/support/v4/view/ViewPager;

    move-result-object v0

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;
    invoke-static {v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$300(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/support/v4/view/ViewPager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 63
    return-void
.end method
