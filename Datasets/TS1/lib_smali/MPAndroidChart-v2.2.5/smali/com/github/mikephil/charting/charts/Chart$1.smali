.class Lcom/github/mikephil/charting/charts/Chart$1;
.super Ljava/lang/Object;
.source "Chart.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/mikephil/charting/charts/Chart;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/mikephil/charting/charts/Chart;


# direct methods
.method constructor <init>(Lcom/github/mikephil/charting/charts/Chart;)V
    .registers 2

    .prologue
    .line 220
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart$1;, "Lcom/github/mikephil/charting/charts/Chart.1;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/Chart$1;->this$0:Lcom/github/mikephil/charting/charts/Chart;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 3
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 225
    .local p0, "this":Lcom/github/mikephil/charting/charts/Chart$1;, "Lcom/github/mikephil/charting/charts/Chart.1;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/Chart$1;->this$0:Lcom/github/mikephil/charting/charts/Chart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/Chart;->postInvalidate()V

    .line 226
    return-void
.end method
