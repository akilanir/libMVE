.class Lkorex/activation/DataHandlerDataSource;
.super Ljava/lang/Object;
.source "DataHandler.java"

# interfaces
.implements Lkorex/activation/DataSource;


# instance fields
.field dataHandler:Lkorex/activation/DataHandler;


# direct methods
.method public constructor <init>(Lkorex/activation/DataHandler;)V
    .registers 3
    .param p1, "dh"    # Lkorex/activation/DataHandler;

    .prologue
    .line 694
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 689
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    .line 695
    iput-object p1, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    .line 696
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 719
    iget-object v0, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getContentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 703
    iget-object v0, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 727
    iget-object v0, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 711
    iget-object v0, p0, Lkorex/activation/DataHandlerDataSource;->dataHandler:Lkorex/activation/DataHandler;

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
