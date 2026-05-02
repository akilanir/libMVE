.class Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;
.super Landroid/database/DataSetObserver;
.source "SimpleSectionedGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;-><init>(Landroid/content/Context;Landroid/widget/BaseAdapter;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)V
    .registers 2

    .prologue
    .line 68
    iput-object p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 3

    .prologue
    .line 71
    iget-object v1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    # getter for: Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mBaseAdapter:Landroid/widget/ListAdapter;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->access$100(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    :goto_f
    # setter for: Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mValid:Z
    invoke-static {v1, v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->access$002(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;Z)Z

    .line 72
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetChanged()V

    .line 73
    return-void

    .line 71
    :cond_18
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public onInvalidated()V
    .registers 3

    .prologue
    .line 77
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    const/4 v1, 0x0

    # setter for: Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mValid:Z
    invoke-static {v0, v1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->access$002(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;Z)Z

    .line 78
    iget-object v0, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$1;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetInvalidated()V

    .line 79
    return-void
.end method
