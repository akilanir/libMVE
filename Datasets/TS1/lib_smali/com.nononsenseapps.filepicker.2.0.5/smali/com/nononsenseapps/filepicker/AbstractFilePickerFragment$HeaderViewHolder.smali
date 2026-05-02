.class public Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AbstractFilePickerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeaderViewHolder"
.end annotation


# instance fields
.field final text:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;


# direct methods
.method public constructor <init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V
    .registers 4
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 469
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 470
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 471
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 472
    const v0, 0x1020014

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->text:Landroid/widget/TextView;

    .line 473
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 482
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getParent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 483
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 484
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 485
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->refresh()V

    .line 486
    return-void
.end method
