.class Lcom/github/paolorotolo/appintro/AppIntro2$2;
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

    .prologue
    .line 111
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$2;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

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
    .line 114
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$2;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-boolean v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    if-eqz v0, :cond_12

    .line 115
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$2;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$2;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget v1, v1, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 117
    :cond_12
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$2;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->onDonePressed()V

    .line 118
    return-void
.end method
