.class Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResizePopupRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/ListPopupWindow;)V
    .registers 2

    .prologue
    .line 1765
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/ListPopupWindow;
    .param p2, "x1"    # Lcom/rey/material/widget/ListPopupWindow$1;

    .prologue
    .line 1765
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 1767
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v0

    if-eqz v0, :cond_3d

    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v1}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildCount()I

    move-result v1

    if-le v0, v1, :cond_3d

    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildCount()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    iget v1, v1, Lcom/rey/material/widget/ListPopupWindow;->mListItemExpandMaximum:I

    if-gt v0, v1, :cond_3d

    .line 1769
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/PopupWindow;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/PopupWindow;->setInputMethodMode(I)V

    .line 1770
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    .line 1772
    :cond_3d
    return-void
.end method
