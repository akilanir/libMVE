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
    .line 104
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 8

    .prologue
    .line 107
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-ge v5, v6, :cond_32

    .line 109
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 114
    :goto_11
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v6, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eq v5, v6, :cond_21

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v6, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v5, v6, :cond_31

    .line 116
    :cond_21
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v6, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v5, v6, :cond_75

    .line 117
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-gez v5, :cond_3e

    .line 142
    :cond_31
    :goto_31
    return-void

    .line 111
    :cond_32
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_11

    .line 119
    :cond_3e
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v3, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 127
    .local v3, "selectedIndex":I
    :goto_44
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v5

    if-ge v5, v3, :cond_31

    .line 128
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v5

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v6}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v6

    sub-int v4, v5, v6

    .line 130
    .local v4, "totalVisible":I
    div-int/lit8 v5, v4, 0x2

    sub-int v2, v3, v5

    .line 131
    .local v2, "scrollIndex":I
    if-gez v2, :cond_67

    const/4 v2, 0x0

    .line 132
    :cond_67
    move v0, v2

    .line 133
    .local v0, "fScrollIndex":I
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    new-instance v6, Lcom/afollestad/materialdialogs/MaterialDialog$1$1;

    invoke-direct {v6, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$1$1;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog$1;I)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    goto :goto_31

    .line 121
    .end local v0    # "fScrollIndex":I
    .end local v2    # "scrollIndex":I
    .end local v3    # "selectedIndex":I
    .end local v4    # "totalVisible":I
    :cond_75
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    if-eqz v5, :cond_31

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    array-length v5, v5

    if-eqz v5, :cond_31

    .line 123
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$1;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 124
    .local v1, "indicesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 125
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .restart local v3    # "selectedIndex":I
    goto :goto_44
.end method
