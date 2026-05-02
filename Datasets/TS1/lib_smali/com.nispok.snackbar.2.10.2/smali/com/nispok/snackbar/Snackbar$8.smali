.class Lcom/nispok/snackbar/Snackbar$8;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/Snackbar;->dismiss(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nispok/snackbar/Snackbar;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "this$0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 897
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$8;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 904
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$8;->this$0:Lcom/nispok/snackbar/Snackbar;

    new-instance v1, Lcom/nispok/snackbar/Snackbar$8$1;

    invoke-direct {v1, p0}, Lcom/nispok/snackbar/Snackbar$8$1;-><init>(Lcom/nispok/snackbar/Snackbar$8;)V

    invoke-virtual {v0, v1}, Lcom/nispok/snackbar/Snackbar;->post(Ljava/lang/Runnable;)Z

    .line 910
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 914
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 900
    return-void
.end method
