.class Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;
.super Ljava/lang/Object;
.source "AbstractFilePickerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

.field final synthetic val$this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V
    .registers 3

    .prologue
    .line 721
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder.1;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;->this$1:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    iput-object p2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;->val$this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 724
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder.1;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;->this$1:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder$1;->this$1:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    invoke-virtual {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickCheckBox(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)V

    .line 725
    return-void
.end method
