.class Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;
.super Ljava/lang/Object;
.source "ProgressBarIndeterminate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gc/materialdesign/views/ProgressBarIndeterminate;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;


# direct methods
.method constructor <init>(Lcom/gc/materialdesign/views/ProgressBarIndeterminate;)V
    .registers 2

    .prologue
    .line 18
    iput-object p1, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 24
    iget-object v2, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    const/16 v3, 0x3c

    invoke-virtual {v2, v3}, Lcom/gc/materialdesign/views/ProgressBarIndeterminate;->setProgress(I)V

    .line 25
    iget-object v2, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/ProgressBarIndeterminate;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/gc/materialdesign/R$anim;->progress_indeterminate_animation:I

    invoke-static {v2, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 26
    .local v0, "anim":Landroid/view/animation/Animation;
    iget-object v2, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    iget-object v2, v2, Lcom/gc/materialdesign/views/ProgressBarIndeterminate;->progressView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 27
    iget-object v2, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    iget-object v2, v2, Lcom/gc/materialdesign/views/ProgressBarIndeterminate;->progressView:Landroid/view/View;

    const-string v3, "x"

    const/4 v4, 0x1

    new-array v4, v4, [F

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;->this$0:Lcom/gc/materialdesign/views/ProgressBarIndeterminate;

    invoke-virtual {v6}, Lcom/gc/materialdesign/views/ProgressBarIndeterminate;->getWidth()I

    move-result v6

    int-to-float v6, v6

    aput v6, v4, v5

    invoke-static {v2, v3, v4}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    .line 28
    .local v1, "anim2":Lcom/nineoldandroids/animation/ObjectAnimator;
    const-wide/16 v2, 0x4b0

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 29
    new-instance v2, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1$1;

    invoke-direct {v2, p0}, Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1$1;-><init>(Lcom/gc/materialdesign/views/ProgressBarIndeterminate$1;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 52
    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 53
    return-void
.end method
