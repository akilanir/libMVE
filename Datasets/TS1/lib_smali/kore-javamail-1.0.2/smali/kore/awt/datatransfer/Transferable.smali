.class public interface abstract Lkore/awt/datatransfer/Transferable;
.super Ljava/lang/Object;
.source "Transferable.java"


# virtual methods
.method public abstract getTransferData(Lkore/awt/datatransfer/DataFlavor;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
.end method

.method public abstract isDataFlavorSupported(Lkore/awt/datatransfer/DataFlavor;)Z
.end method
