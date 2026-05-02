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
    .line 661
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .line 662
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 663
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 664
    const v0, 0x1020014

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->text:Landroid/widget/TextView;

    .line 665
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 674
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickHeader(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;)V

    .line 675
    return-void
.end method
