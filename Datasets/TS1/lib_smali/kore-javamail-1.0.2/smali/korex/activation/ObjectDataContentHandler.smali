.class Lkorex/activation/ObjectDataContentHandler;
.super Ljava/lang/Object;
.source "DataHandler.java"

# interfaces
.implements Lkorex/activation/DataContentHandler;


# instance fields
.field private dch:Lkorex/activation/DataContentHandler;

.field private mimeType:Ljava/lang/String;

.field private obj:Ljava/lang/Object;

.field private transferFlavors:[Lkore/awt/datatransfer/DataFlavor;


# direct methods
.method public constructor <init>(Lkorex/activation/DataContentHandler;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p1, "dch"    # Lkorex/activation/DataContentHandler;
    .param p2, "obj"    # Ljava/lang/Object;
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 825
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 816
    iput-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 819
    iput-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    .line 826
    iput-object p2, p0, Lkorex/activation/ObjectDataContentHandler;->obj:Ljava/lang/Object;

    .line 827
    iput-object p3, p0, Lkorex/activation/ObjectDataContentHandler;->mimeType:Ljava/lang/String;

    .line 828
    iput-object p1, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    .line 829
    return-void
.end method


# virtual methods
.method public getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 3
    .param p1, "ds"    # Lkorex/activation/DataSource;

    .prologue
    .line 875
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method public getDCH()Lkorex/activation/DataContentHandler;
    .registers 2

    .prologue
    .line 836
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    return-object v0
.end method

.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 5
    .param p1, "df"    # Lkore/awt/datatransfer/DataFlavor;
    .param p2, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/UnsupportedFlavorException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 865
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_b

    .line 866
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0, p1, p2}, Lkorex/activation/DataContentHandler;->getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 868
    :goto_a
    return-object v0

    .line 867
    :cond_b
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 868
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->obj:Ljava/lang/Object;

    goto :goto_a

    .line 870
    :cond_19
    new-instance v0, Lkore/awt/datatransfer/UnsupportedFlavorException;

    invoke-direct {v0, p1}, Lkore/awt/datatransfer/UnsupportedFlavorException;-><init>(Lkore/awt/datatransfer/DataFlavor;)V

    throw v0
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 7

    .prologue
    .line 844
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    if-nez v0, :cond_10

    .line 845
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_13

    .line 846
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0}, Lkorex/activation/DataContentHandler;->getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 853
    :cond_10
    :goto_10
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    return-object v0

    .line 848
    :cond_13
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 849
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    iget-object v3, p0, Lkorex/activation/ObjectDataContentHandler;->obj:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, p0, Lkorex/activation/ObjectDataContentHandler;->mimeType:Ljava/lang/String;

    iget-object v5, p0, Lkorex/activation/ObjectDataContentHandler;->mimeType:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    goto :goto_10
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 883
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_a

    .line 884
    iget-object v0, p0, Lkorex/activation/ObjectDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0, p1, p2, p3}, Lkorex/activation/DataContentHandler;->writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 888
    return-void

    .line 886
    :cond_a
    new-instance v0, Lkorex/activation/UnsupportedDataTypeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no object DCH for MIME type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/ObjectDataContentHandler;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/activation/UnsupportedDataTypeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
