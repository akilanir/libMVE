.class public interface abstract Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;
.super Ljava/lang/Object;
.source "FolderChooserDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FolderCallback"
.end annotation


# virtual methods
.method public abstract onFolderSelection(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;Ljava/io/File;)V
    .param p1    # Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
