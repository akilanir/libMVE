.class Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;
.super Landroid/support/v7/widget/util/SortedListAdapterCallback;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->loadInBackground()Landroid/support/v7/util/SortedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/util/SortedListAdapterCallback",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nononsenseapps/filepicker/FilePickerFragment$1;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/FilePickerFragment$1;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .registers 3
    .param p2, "x0"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;->this$1:Lcom/nononsenseapps/filepicker/FilePickerFragment$1;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/util/SortedListAdapterCallback;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method


# virtual methods
.method public areContentsTheSame(Ljava/io/File;Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "file2"    # Ljava/io/File;

    .prologue
    .line 142
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v1

    if-ne v0, v1, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public bridge synthetic areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 127
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/io/File;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;->areContentsTheSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public areItemsTheSame(Ljava/io/File;Ljava/io/File;)Z
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "file2"    # Ljava/io/File;

    .prologue
    .line 147
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;->areContentsTheSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 127
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/io/File;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;->areItemsTheSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public compare(Ljava/io/File;Ljava/io/File;)I
    .registers 5
    .param p1, "lhs"    # Ljava/io/File;
    .param p2, "rhs"    # Ljava/io/File;

    .prologue
    .line 130
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_e

    .line 131
    const/4 v0, -0x1

    .line 135
    :goto_d
    return v0

    .line 132
    :cond_e
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 133
    const/4 v0, 0x1

    goto :goto_d

    .line 135
    :cond_1c
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_d
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 127
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/io/File;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result v0

    return v0
.end method
