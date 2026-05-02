.class Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SwipeDismissTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;)V
    .registers 2
    .param p1, "this$0"    # Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$1;->this$0:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$1;->this$0:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;

    # invokes: Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->performDismiss()V
    invoke-static {v0}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->access$000(Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;)V

    .line 158
    return-void
.end method
