.class public interface abstract Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
.super Ljava/lang/Object;
.source "AbstractFilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnFilePickedListener"
.end annotation


# virtual methods
.method public abstract onCancelled()V
.end method

.method public abstract onFilePicked(Landroid/net/Uri;)V
.end method

.method public abstract onFilesPicked(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation
.end method
