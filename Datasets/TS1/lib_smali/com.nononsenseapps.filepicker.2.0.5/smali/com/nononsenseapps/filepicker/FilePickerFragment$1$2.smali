.class Lcom/nononsenseapps/filepicker/FilePickerFragment$1$2;
.super Landroid/os/FileObserver;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->onStartLoading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nononsenseapps/filepicker/FilePickerFragment$1;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/FilePickerFragment$1;Ljava/lang/String;I)V
    .registers 4
    .param p2, "x0"    # Ljava/lang/String;
    .param p3, "x1"    # I

    .prologue
    .line 184
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/FilePickerFragment$1;

    invoke-direct {p0, p2, p3}, Landroid/os/FileObserver;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .registers 4
    .param p1, "event"    # I
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/FilePickerFragment$1;

    invoke-virtual {v0}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->onContentChanged()V

    .line 190
    return-void
.end method
