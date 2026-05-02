.class Lkorex/activation/DataSourceDataContentHandler;
.super Ljava/lang/Object;
.source "DataHandler.java"

# interfaces
.implements Lkorex/activation/DataContentHandler;


# instance fields
.field private dch:Lkorex/activation/DataContentHandler;

.field private ds:Lkorex/activation/DataSource;

.field private transferFlavors:[Lkore/awt/datatransfer/DataFlavor;


# direct methods
.method public constructor <init>(Lkorex/activation/DataContentHandler;Lkorex/activation/DataSource;)V
    .registers 4
    .param p1, "dch"    # Lkorex/activation/DataContentHandler;
    .param p2, "ds"    # Lkorex/activation/DataSource;

    .prologue
    const/4 v0, 0x0

    .line 746
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 739
    iput-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->ds:Lkorex/activation/DataSource;

    .line 740
    iput-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 741
    iput-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    .line 747
    iput-object p2, p0, Lkorex/activation/DataSourceDataContentHandler;->ds:Lkorex/activation/DataSource;

    .line 748
    iput-object p1, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    .line 749
    return-void
.end method


# virtual methods
.method public getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 3
    .param p1, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 789
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_b

    .line 790
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0, p1}, Lkorex/activation/DataContentHandler;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 792
    :goto_a
    return-object v0

    :cond_b
    invoke-interface {p1}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_a
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
    .line 779
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_b

    .line 780
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0, p1, p2}, Lkorex/activation/DataContentHandler;->getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 782
    :goto_a
    return-object v0

    .line 781
    :cond_b
    invoke-virtual {p0}, Lkorex/activation/DataSourceDataContentHandler;->getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 782
    invoke-interface {p2}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_a

    .line 784
    :cond_1d
    new-instance v0, Lkore/awt/datatransfer/UnsupportedFlavorException;

    invoke-direct {v0, p1}, Lkore/awt/datatransfer/UnsupportedFlavorException;-><init>(Lkore/awt/datatransfer/DataFlavor;)V

    throw v0
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 6

    .prologue
    .line 757
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    if-nez v0, :cond_10

    .line 758
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_13

    .line 759
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0}, Lkorex/activation/DataContentHandler;->getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 767
    :cond_10
    :goto_10
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    return-object v0

    .line 761
    :cond_13
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    iput-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 762
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->transferFlavors:[Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    iget-object v3, p0, Lkorex/activation/DataSourceDataContentHandler;->ds:Lkorex/activation/DataSource;

    .line 763
    invoke-interface {v3}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lkorex/activation/DataSourceDataContentHandler;->ds:Lkorex/activation/DataSource;

    .line 764
    invoke-interface {v4}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/String;Ljava/lang/String;)V

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
    .line 800
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    if-eqz v0, :cond_a

    .line 801
    iget-object v0, p0, Lkorex/activation/DataSourceDataContentHandler;->dch:Lkorex/activation/DataContentHandler;

    invoke-interface {v0, p1, p2, p3}, Lkorex/activation/DataContentHandler;->writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 805
    return-void

    .line 803
    :cond_a
    new-instance v0, Lkorex/activation/UnsupportedDataTypeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no DCH for content type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/activation/DataSourceDataContentHandler;->ds:Lkorex/activation/DataSource;

    .line 804
    invoke-interface {v2}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lkorex/activation/UnsupportedDataTypeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
