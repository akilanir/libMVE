.class public Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AbstractFilePickerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DirViewHolder"
.end annotation


# instance fields
.field public file:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public icon:Landroid/view/View;

.field public text:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;


# direct methods
.method public constructor <init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V
    .registers 4
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 684
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 685
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 686
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 687
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 688
    sget v0, Lcom/nononsenseapps/filepicker/R$id;->item_icon:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->icon:Landroid/view/View;

    .line 689
    const v0, 0x1020014

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->text:Landroid/widget/TextView;

    .line 690
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 699
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickDir(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;)V

    .line 700
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 710
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onLongClickDir(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;)Z

    move-result v0

    return v0
.end method
