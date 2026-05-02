.class Lnet/steamcrafted/loadtoast/LoadToastView$2;
.super Ljava/lang/Object;
.source "LoadToastView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/steamcrafted/loadtoast/LoadToastView;->done()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnet/steamcrafted/loadtoast/LoadToastView;


# direct methods
.method constructor <init>(Lnet/steamcrafted/loadtoast/LoadToastView;)V
    .registers 2

    .prologue
    .line 148
    iput-object p1, p0, Lnet/steamcrafted/loadtoast/LoadToastView$2;->this$0:Lnet/steamcrafted/loadtoast/LoadToastView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 5
    .param p1, "valueAnimator"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 151
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView$2;->this$0:Lnet/steamcrafted/loadtoast/LoadToastView;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v2

    mul-float/2addr v1, v2

    # setter for: Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F
    invoke-static {v0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->access$002(Lnet/steamcrafted/loadtoast/LoadToastView;F)F

    .line 153
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView$2;->this$0:Lnet/steamcrafted/loadtoast/LoadToastView;

    invoke-virtual {v0}, Lnet/steamcrafted/loadtoast/LoadToastView;->postInvalidate()V

    .line 154
    return-void
.end method
