.class Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "GoogleMusicDicesDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->initObjectAnimator()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

.field final synthetic val$objectAnimator:Landroid/animation/ObjectAnimator;


# direct methods
.method constructor <init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Landroid/animation/ObjectAnimator;)V
    .registers 3

    .prologue
    .line 94
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    iput-object p2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->val$objectAnimator:Landroid/animation/ObjectAnimator;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    const/4 v1, 0x0

    # setter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F
    invoke-static {v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$002(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;F)F

    .line 98
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    # operator++ for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I
    invoke-static {v0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$108(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)I

    .line 99
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I
    invoke-static {v0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$100(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)I

    move-result v0

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;
    invoke-static {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$200(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    move-result-object v1

    array-length v1, v1

    if-ne v0, v1, :cond_20

    .line 100
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    const/4 v1, 0x0

    # setter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I
    invoke-static {v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$102(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;I)I

    .line 102
    :cond_20
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->this$0:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;
    invoke-static {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$300(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;->invert()Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    move-result-object v1

    # setter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;
    invoke-static {v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->access$302(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    .line 103
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;->val$objectAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 104
    return-void
.end method
