.class public interface abstract Lkorex/activation/DataContentHandler;
.super Ljava/lang/Object;
.source "DataContentHandler.java"


# virtual methods
.method public abstract getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
.end method

.method public abstract writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
