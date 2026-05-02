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

    .prologue
    .line 80
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9
    .param p1, "v"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 83
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-boolean v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    if-eqz v3, :cond_13

    .line 84
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;

    iget-object v5, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget v5, v5, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    int-to-long v5, v5

    invoke-virtual {v3, v5, v6}, Landroid/os/Vibrator;->vibrate(J)V

    .line 87
    :cond_13
    const/4 v2, 0x0

    .line 88
    .local v2, "requestPermission":Z
    const/4 v1, 0x0

    .line 90
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_3c

    .line 91
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v3}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v3

    add-int/lit8 v5, v3, 0x1

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/paolorotolo/appintro/PermissionObject;

    invoke-virtual {v3}, Lcom/github/paolorotolo/appintro/PermissionObject;->getPosition()I

    move-result v3

    if-ne v5, v3, :cond_5f

    move v2, v4

    .line 92
    :goto_3b
    move v1, v0

    .line 96
    :cond_3c
    if-eqz v2, :cond_78

    .line 97
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x17

    if-lt v3, v5, :cond_61

    .line 98
    iget-object v5, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/paolorotolo/appintro/PermissionObject;

    invoke-virtual {v3}, Lcom/github/paolorotolo/appintro/PermissionObject;->getPermission()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3, v4}, Lcom/github/paolorotolo/appintro/AppIntro2;->requestPermissions([Ljava/lang/String;I)V

    .line 99
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 108
    :goto_5e
    return-void

    .line 91
    :cond_5f
    const/4 v2, 0x0

    goto :goto_3b

    .line 101
    :cond_61
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v4, v4, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v4}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    .line 102
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-virtual {v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->onNextPressed()V

    goto :goto_5e

    .line 105
    :cond_78
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v3, v3, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v4, v4, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v4}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    .line 106
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$1;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-virtual {v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->onNextPressed()V

    goto :goto_5e
.end method
