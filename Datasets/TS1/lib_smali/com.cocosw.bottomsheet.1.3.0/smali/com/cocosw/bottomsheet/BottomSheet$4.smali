.class Lcom/cocosw/bottomsheet/BottomSheet$4;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/BottomSheet;

.field final synthetic val$mDialogView:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet;Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)V
    .registers 3

    .prologue
    .line 319
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    iput-object p2, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->val$mDialogView:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 322
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v1, Lcom/cocosw/bottomsheet/R$id;->bs_more:I

    if-ne v0, v1, :cond_20

    .line 323
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # invokes: Lcom/cocosw/bottomsheet/BottomSheet;->showFullItems()V
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$000(Lcom/cocosw/bottomsheet/BottomSheet;)V

    .line 324
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->val$mDialogView:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->setCollapsible(Z)V

    .line 335
    :goto_1f
    return-void

    .line 328
    :cond_20
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/ActionMenuItem;->invoke()Z

    move-result v0

    if-nez v0, :cond_57

    .line 329
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menulistener:Landroid/view/MenuItem$OnMenuItemClickListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/view/MenuItem$OnMenuItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_5d

    .line 330
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menulistener:Landroid/view/MenuItem$OnMenuItemClickListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/view/MenuItem$OnMenuItemClickListener;

    move-result-object v1

    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    .line 334
    :cond_57
    :goto_57
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->dismiss()V

    goto :goto_1f

    .line 331
    :cond_5d
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->listener:Landroid/content/DialogInterface$OnClickListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_57

    .line 332
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->listener:Landroid/content/DialogInterface$OnClickListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$4;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-interface {v1, v2, v0}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    goto :goto_57
.end method
