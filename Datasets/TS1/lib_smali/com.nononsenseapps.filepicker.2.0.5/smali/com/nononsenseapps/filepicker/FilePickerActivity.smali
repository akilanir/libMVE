.class public Lcom/nononsenseapps/filepicker/FilePickerActivity;
.super Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;
.source "FilePickerActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "Registered"
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerActivity;-><init>()V

    .line 29
    return-void
.end method


# virtual methods
.method protected getFragment(Ljava/lang/String;IZZ)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
    .registers 6
    .param p1, "startPath"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "allowMultiple"    # Z
    .param p4, "allowCreateDir"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IZZ)",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Lcom/nononsenseapps/filepicker/FilePickerFragment;

    invoke-direct {v0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;-><init>()V

    .line 36
    .local v0, "fragment":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<Ljava/io/File;>;"
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setArgs(Ljava/lang/String;IZZ)V

    .line 37
    return-object v0
.end method
