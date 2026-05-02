.class Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;
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
    .line 159
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment.1;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 162
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment.1;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    invoke-virtual {v0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickCancel(Landroid/view/View;)V

    .line 163
    return-void
.end method
