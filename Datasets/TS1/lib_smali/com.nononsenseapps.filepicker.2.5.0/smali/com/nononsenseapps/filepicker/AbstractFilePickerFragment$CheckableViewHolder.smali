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
    .line 718
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 719
    invoke-direct {p0, p1, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    .line 720
    sget v0, Lcom/nononsenseapps/filepicker/R$id;->checkbox:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    .line 721
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 727
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 736
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickCheckable(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)V

    .line 737
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 747
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onLongClickCheckable(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)Z

    move-result v0

    return v0
.end method
