.class Lcom/mikepenz/materialize/util/KeyboardUtil$1;
.super Ljava/lang/Object;
.source "KeyboardUtil.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialize/util/KeyboardUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialize/util/KeyboardUtil;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialize/util/KeyboardUtil;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 64
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 66
    .local v1, "r":Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->decorView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$000(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 69
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->decorView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$000(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    iget v4, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->decorView:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$000(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mikepenz/materialize/util/UIUtils;->convertPixelsToDp(FLandroid/content/Context;)F

    move-result v0

    .line 72
    .local v0, "heightDiffDp":F
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->initialDpDiff:F
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$100(Lcom/mikepenz/materialize/util/KeyboardUtil;)F

    move-result v2

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v2, v2, v3

    if-nez v2, :cond_43

    .line 73
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # setter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->initialDpDiff:F
    invoke-static {v2, v0}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$102(Lcom/mikepenz/materialize/util/KeyboardUtil;F)F

    .line 77
    :cond_43
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->initialDpDiff:F
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$100(Lcom/mikepenz/materialize/util/KeyboardUtil;)F

    move-result v2

    sub-float v2, v0, v2

    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_7e

    .line 79
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->contentView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$200(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    if-nez v2, :cond_7d

    .line 81
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->contentView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$200(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->initialDpDiff:F
    invoke-static {v3}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$100(Lcom/mikepenz/materialize/util/KeyboardUtil;)F

    move-result v3

    sub-float v3, v0, v3

    iget-object v4, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->decorView:Landroid/view/View;
    invoke-static {v4}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$000(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v2, v5, v5, v5, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 90
    :cond_7d
    :goto_7d
    return-void

    .line 85
    :cond_7e
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->contentView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$200(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    if-eqz v2, :cond_7d

    .line 87
    iget-object v2, p0, Lcom/mikepenz/materialize/util/KeyboardUtil$1;->this$0:Lcom/mikepenz/materialize/util/KeyboardUtil;

    # getter for: Lcom/mikepenz/materialize/util/KeyboardUtil;->contentView:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialize/util/KeyboardUtil;->access$200(Lcom/mikepenz/materialize/util/KeyboardUtil;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_7d
.end method
