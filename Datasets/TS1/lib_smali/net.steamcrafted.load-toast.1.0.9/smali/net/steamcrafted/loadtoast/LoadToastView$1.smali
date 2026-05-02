.class Lnet/steamcrafted/loadtoast/LoadToastView$1;
.super Ljava/lang/Object;
.source "LoadToastView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/steamcrafted/loadtoast/LoadToastView;-><init>(Landroid/content/Context;)V
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
    .line 102
    iput-object p1, p0, Lnet/steamcrafted/loadtoast/LoadToastView$1;->this$0:Lnet/steamcrafted/loadtoast/LoadToastView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 3
    .param p1, "valueAnimator"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 106
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView$1;->this$0:Lnet/steamcrafted/loadtoast/LoadToastView;

    invoke-virtual {v0}, Lnet/steamcrafted/loadtoast/LoadToastView;->postInvalidate()V

    .line 107
    return-void
.end method
