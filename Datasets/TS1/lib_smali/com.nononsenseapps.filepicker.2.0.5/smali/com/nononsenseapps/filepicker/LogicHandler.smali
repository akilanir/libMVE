.class public interface abstract Lcom/nononsenseapps/filepicker/LogicHandler;
.super Ljava/lang/Object;
.source "LogicHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final VIEWTYPE_CHECKABLE:I = 0x2

.field public static final VIEWTYPE_DIR:I = 0x1

.field public static final VIEWTYPE_HEADER:I


# virtual methods
.method public abstract getFullPath(Ljava/lang/Object;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract getItemViewType(ILjava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)I"
        }
    .end annotation
.end method

.method public abstract getLoader()Landroid/support/v4/content/Loader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;>;"
        }
    .end annotation
.end method

.method public abstract getName(Ljava/lang/Object;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public abstract getPath(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract getRoot()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract isDir(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method

.method public abstract onBindHeaderViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.HeaderViewHolder;)V"
        }
    .end annotation
.end method

.method public abstract onBindViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;ILjava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.DirViewHolder;ITT;)V"
        }
    .end annotation
.end method

.method public abstract onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
.end method

.method public abstract toUri(Ljava/lang/Object;)Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/net/Uri;"
        }
    .end annotation
.end method
