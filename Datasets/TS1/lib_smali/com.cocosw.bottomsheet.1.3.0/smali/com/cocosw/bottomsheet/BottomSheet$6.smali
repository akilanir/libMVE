.class Lcom/cocosw/bottomsheet/BottomSheet$6;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->setListLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/BottomSheet;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 2

    .prologue
    .line 416
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 7

    .prologue
    .line 419
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-ge v1, v2, :cond_4f

    .line 421
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 425
    :goto_13
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v1

    iget-object v2, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v2}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/GridView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 426
    .local v0, "lastChild":Landroid/view/View;
    if-eqz v0, :cond_4e

    .line 427
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v5}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/GridView;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 428
    :cond_4e
    return-void

    .line 423
    .end local v0    # "lastChild":Landroid/view/View;
    :cond_4f
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$6;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_13
.end method
