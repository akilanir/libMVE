.class Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;
.super Ljava/lang/Object;
.source "AbstractFilePickerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V
    .registers 2

    .prologue
    .line 161
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment.2;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 164
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment.2;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    if-nez v0, :cond_9

    .line 190
    :goto_8
    return-void

    .line 169
    :cond_9
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-boolean v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-nez v0, :cond_30

    :cond_15
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 170
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/nononsenseapps/filepicker/R$string;->select_something_first:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_8

    .line 176
    :cond_30
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-boolean v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-eqz v0, :cond_4a

    .line 177
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilesPicked(Ljava/util/List;)V

    goto :goto_8

    .line 178
    :cond_4a
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-nez v0, :cond_66

    .line 179
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFirstCheckedItem()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_8

    .line 180
    :cond_66
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_81

    .line 181
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_8

    .line 184
    :cond_81
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a0

    .line 185
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto/16 :goto_8

    .line 187
    :cond_a0
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    # getter for: Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    invoke-static {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFirstCheckedItem()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto/16 :goto_8
.end method
