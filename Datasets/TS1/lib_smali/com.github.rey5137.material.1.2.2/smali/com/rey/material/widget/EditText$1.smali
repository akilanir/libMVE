.class Lcom/rey/material/widget/EditText$1;
.super Ljava/lang/Object;
.source "EditText.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/EditText;->setLabelVisible(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/EditText;)V
    .registers 2

    .prologue
    .line 660
    iput-object p1, p0, Lcom/rey/material/widget/EditText$1;->this$0:Lcom/rey/material/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 671
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 668
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 664
    iget-object v0, p0, Lcom/rey/material/widget/EditText$1;->this$0:Lcom/rey/material/widget/EditText;

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setVisibility(I)V

    .line 665
    return-void
.end method
