.class Lcom/github/mrengineer13/snackbar/SnackContainer$2;
.super Ljava/lang/Object;
.source "SnackContainer.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

.field final synthetic val$holder:Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;


# direct methods
.method constructor <init>(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 3

    .prologue
    .line 210
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iput-object p2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->val$holder:Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    .line 213
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 215
    .local v2, "y":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_82

    .line 235
    :cond_c
    :goto_c
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # setter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mPreviousY:F
    invoke-static {v3, v2}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$402(Lcom/github/mrengineer13/snackbar/SnackContainer;F)F

    .line 237
    return v5

    .line 217
    :pswitch_12
    const/4 v3, 0x2

    new-array v1, v3, [I

    .line 218
    .local v1, "location":[I
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->val$holder:Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    iget-object v3, v3, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 219
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mPreviousY:F
    invoke-static {v3}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$400(Lcom/github/mrengineer13/snackbar/SnackContainer;)F

    move-result v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_c

    .line 220
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mPreviousY:F
    invoke-static {v3}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$400(Lcom/github/mrengineer13/snackbar/SnackContainer;)F

    move-result v3

    sub-float v0, v2, v3

    .line 221
    .local v0, "dy":F
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->val$holder:Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    iget-object v3, v3, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    const/high16 v4, 0x40800000    # 4.0f

    mul-float/2addr v4, v0

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 223
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v3}, Lcom/github/mrengineer13/snackbar/SnackContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    aget v4, v1, v5

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x64

    if-gtz v3, :cond_c

    .line 224
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v4, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;
    invoke-static {v4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$500(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 225
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v4, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->val$holder:Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackContainer;->sendOnHide(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    invoke-static {v3, v4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$100(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    .line 226
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v4, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;
    invoke-static {v4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$600(Lcom/github/mrengineer13/snackbar/SnackContainer;)Landroid/view/animation/AnimationSet;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->startAnimation(Landroid/view/animation/Animation;)V

    .line 228
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;
    invoke-static {v3}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Queue;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c

    .line 229
    iget-object v3, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$2;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;
    invoke-static {v3}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    goto :goto_c

    .line 215
    :pswitch_data_82
    .packed-switch 0x2
        :pswitch_12
    .end packed-switch
.end method
