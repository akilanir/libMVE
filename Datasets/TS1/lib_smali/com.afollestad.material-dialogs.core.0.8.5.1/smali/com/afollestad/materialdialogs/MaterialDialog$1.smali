.class Lcom/afollestad/materialdialogs/MaterialDialog$1;
.super Ljava/lang/Object;
.source "MaterialDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;->checkIfListInitScroll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2

    .prologue
    .line 108
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 7

    .prologue
    .line 111
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-ge v4, v5, :cond_32

    .line 113
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 118
    :goto_11
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v5, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eq v4, v5, :cond_21

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v5, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v4, v5, :cond_31

    .line 120
    :cond_21
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v5, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v4, v5, :cond_75

    .line 121
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-gez v4, :cond_3e

    .line 145
    :cond_31
    :goto_31
    return-void

    .line 115
    :cond_32
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_11

    .line 123
    :cond_3e
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v4, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 130
    .local v2, "selectedIndex":I
    :goto_44
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v4

    if-ge v4, v2, :cond_31

    .line 131
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v4

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v5

    sub-int v3, v4, v5

    .line 133
    .local v3, "totalVisible":I
    div-int/lit8 v4, v3, 0x2

    sub-int v1, v2, v4

    .line 134
    .local v1, "scrollIndex":I
    if-gez v1, :cond_67

    const/4 v1, 0x0

    .line 135
    :cond_67
    move v0, v1

    .line 136
    .local v0, "fScrollIndex":I
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    new-instance v5, Lcom/afollestad/materialdialogs/MaterialDialog$1$1;

    invoke-direct {v5, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$1$1;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog$1;I)V

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    goto :goto_31

    .line 125
    .end local v0    # "fScrollIndex":I
    .end local v1    # "scrollIndex":I
    .end local v2    # "selectedIndex":I
    .end local v3    # "totalVisible":I
    :cond_75
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    if-eqz v4, :cond_31

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-eqz v4, :cond_31

    .line 127
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 128
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .restart local v2    # "selectedIndex":I
    goto :goto_44
.end method
