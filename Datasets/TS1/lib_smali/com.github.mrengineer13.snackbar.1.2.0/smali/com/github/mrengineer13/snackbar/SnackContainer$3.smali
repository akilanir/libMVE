.class Lcom/github/mrengineer13/snackbar/SnackContainer$3;
.super Ljava/lang/Object;
.source "SnackContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/SnackContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;


# direct methods
.method constructor <init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V
    .registers 2

    .prologue
    .line 258
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 261
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->getVisibility()I

    move-result v0

    if-nez v0, :cond_13

    .line 262
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;
    invoke-static {v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$600(Lcom/github/mrengineer13/snackbar/SnackContainer;)Landroid/view/animation/AnimationSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->startAnimation(Landroid/view/animation/Animation;)V

    .line 264
    :cond_13
    return-void
.end method
