.class public Lch/qos/logback/core/joran/spi/ConfigurationWatchList;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# instance fields
.field fileWatchList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field lastModifiedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field mainURL:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->lastModifiedList:Ljava/util/List;

    return-void
.end method

.method private addAsFileToWatch(Ljava/net/URL;)V
    .registers 6

    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->convertToFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_18

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->lastModifiedList:Ljava/util/List;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_18
    return-void
.end method


# virtual methods
.method public addToWatchList(Ljava/net/URL;)V
    .registers 2

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->addAsFileToWatch(Ljava/net/URL;)V

    return-void
.end method

.method public changeDetected()Z
    .registers 9

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    move v2, v1

    :goto_8
    if-ge v2, v3, :cond_2c

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->lastModifiedList:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v0, v4, v6

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    :goto_27
    return v0

    :cond_28
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_8

    :cond_2c
    move v0, v1

    goto :goto_27
.end method

.method public clear()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->mainURL:Ljava/net/URL;

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->lastModifiedList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method convertToFile(Ljava/net/URL;)Ljava/io/File;
    .registers 4

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :goto_19
    return-object v0

    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "URL ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] is not of type file"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->addInfo(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_19
.end method

.method public getCopyOfFileWatchList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->fileWatchList:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getMainURL()Ljava/net/URL;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->mainURL:Ljava/net/URL;

    return-object v0
.end method

.method public setMainURL(Ljava/net/URL;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->mainURL:Ljava/net/URL;

    if-eqz p1, :cond_7

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/spi/ConfigurationWatchList;->addAsFileToWatch(Ljava/net/URL;)V

    :cond_7
    return-void
.end method
