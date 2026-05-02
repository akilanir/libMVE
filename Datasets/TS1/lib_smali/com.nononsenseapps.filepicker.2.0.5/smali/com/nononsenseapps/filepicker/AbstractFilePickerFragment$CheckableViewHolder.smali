.class public Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;
.super Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;
.source "AbstractFilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CheckableViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
        "<TT;>.DirViewHolder;"
    }
.end annotation


# instance fields
.field public checkbox:Landroid/widget/CheckBox;

.field final synthetic this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;


# direct methods
.method public constructor <init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V
    .registers 5
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 534
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 535
    invoke-direct {p0, p1, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    .line 536
    sget v0, Lcom/nononsenseapps/filepicker/R$id;->checkbox:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    .line 537
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 543
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 552
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 553
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    iput-object v1, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 554
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 555
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 556
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->refresh()V

    .line 560
    :goto_23
    return-void

    .line 558
    :cond_24
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->onLongClick(Landroid/view/View;)Z

    goto :goto_23
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    const/4 v2, 0x1

    .line 570
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 571
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 572
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 573
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 582
    :goto_23
    return v2

    .line 575
    :cond_24
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-boolean v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-nez v0, :cond_2f

    .line 576
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->clearSelections()V

    .line 578
    :cond_2f
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 579
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 580
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_23
.end method
