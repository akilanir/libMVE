.class Lcom/github/paolorotolo/appintro/AppIntro$1;
.super Ljava/lang/Object;
.source "AppIntro.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/AppIntro;)V
    .registers 2
    .param p1, "this$0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

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
    .line 64
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$000(Lcom/github/paolorotolo/appintro/AppIntro;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 65
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->mVibrator:Landroid/os/Vibrator;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->access$200(Lcom/github/paolorotolo/appintro/AppIntro;)Landroid/os/Vibrator;

    move-result-object v0

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I
    invoke-static {v1}, Lcom/github/paolorotolo/appintro/AppIntro;->access$100(Lcom/github/paolorotolo/appintro/AppIntro;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 67
    :cond_18
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntro;->onSkipPressed()V

    .line 68
    return-void
.end method
