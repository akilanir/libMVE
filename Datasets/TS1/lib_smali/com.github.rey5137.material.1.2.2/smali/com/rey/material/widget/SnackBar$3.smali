.class Lcom/rey/material/widget/SnackBar$3;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/SnackBar;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/SnackBar;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/SnackBar;)V
    .registers 2

    .prologue
    .line 824
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar$3;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 838
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$3;->this$0:Lcom/rey/material/widget/SnackBar;

    const/4 v1, 0x1

    # invokes: Lcom/rey/material/widget/SnackBar;->setState(I)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/SnackBar;->access$200(Lcom/rey/material/widget/SnackBar;I)V

    .line 839
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$3;->this$0:Lcom/rey/material/widget/SnackBar;

    # invokes: Lcom/rey/material/widget/SnackBar;->startTimer()V
    invoke-static {v0}, Lcom/rey/material/widget/SnackBar;->access$300(Lcom/rey/material/widget/SnackBar;)V

    .line 840
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 834
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 828
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$3;->this$0:Lcom/rey/material/widget/SnackBar;

    const/4 v1, 0x2

    # invokes: Lcom/rey/material/widget/SnackBar;->setState(I)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/SnackBar;->access$200(Lcom/rey/material/widget/SnackBar;I)V

    .line 829
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$3;->this$0:Lcom/rey/material/widget/SnackBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->setVisibility(I)V

    .line 830
    return-void
.end method
