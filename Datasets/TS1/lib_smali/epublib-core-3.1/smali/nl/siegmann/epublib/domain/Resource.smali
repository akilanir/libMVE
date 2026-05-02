.class public Lnl/siegmann/epublib/domain/Resource;
.super Ljava/lang/Object;
.source "Resource.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final LOG:Lorg/slf4j/Logger;

.field private static final serialVersionUID:J = 0xe7cd7ffecf1a485L


# instance fields
.field private cachedSize:J

.field private data:[B

.field private fileName:Ljava/lang/String;

.field private href:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private inputEncoding:Ljava/lang/String;

.field private mediaType:Lnl/siegmann/epublib/domain/MediaType;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lnl/siegmann/epublib/domain/Resource;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/domain/Resource;->LOG:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "href"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-static {p1}, Lnl/siegmann/epublib/util/IOUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-static {p2}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-direct {p0, v0, v1, p2, v2}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;)V
    .registers 9
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "href"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v1, 0x0

    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Lnl/siegmann/epublib/util/IOUtil;->toByteArray(Ljava/io/Reader;Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {p2}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v4

    const-string v5, "UTF-8"

    move-object v0, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v0, 0x0

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-static {p1}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-direct {p0, v0, v1, p1, v2}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .registers 7
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "size"    # J
    .param p4, "href"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 127
    invoke-static {p4}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v0

    invoke-direct {p0, v1, v1, p4, v0}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V

    .line 128
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->fileName:Ljava/lang/String;

    .line 129
    iput-wide p2, p0, Lnl/siegmann/epublib/domain/Resource;->cachedSize:J

    .line 130
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "href"    # Ljava/lang/String;
    .param p4, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;

    .prologue
    .line 142
    const-string v5, "UTF-8"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;Ljava/lang/String;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;Ljava/lang/String;)V
    .registers 7
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "href"    # Ljava/lang/String;
    .param p4, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;
    .param p5, "inputEncoding"    # Ljava/lang/String;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, "UTF-8"

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->inputEncoding:Ljava/lang/String;

    .line 156
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->id:Ljava/lang/String;

    .line 157
    iput-object p3, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    .line 158
    iput-object p4, p0, Lnl/siegmann/epublib/domain/Resource;->mediaType:Lnl/siegmann/epublib/domain/MediaType;

    .line 159
    iput-object p5, p0, Lnl/siegmann/epublib/domain/Resource;->inputEncoding:Ljava/lang/String;

    .line 160
    iput-object p2, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    .line 161
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .registers 9
    .param p1, "data"    # [B
    .param p2, "href"    # Ljava/lang/String;

    .prologue
    .line 82
    const/4 v1, 0x0

    invoke-static {p2}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v4

    const-string v5, "UTF-8"

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public constructor <init>([BLnl/siegmann/epublib/domain/MediaType;)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;

    .prologue
    const/4 v0, 0x0

    .line 67
    invoke-direct {p0, v0, p1, v0, p2}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V

    .line 68
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->fileName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 214
    const/4 v0, 0x0

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    .line 216
    :cond_7
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "resourceObject"    # Ljava/lang/Object;

    .prologue
    .line 345
    instance-of v0, p1, Lnl/siegmann/epublib/domain/Resource;

    if-nez v0, :cond_6

    .line 346
    const/4 v0, 0x0

    .line 348
    .end local p1    # "resourceObject":Ljava/lang/Object;
    :goto_5
    return v0

    .restart local p1    # "resourceObject":Ljava/lang/Object;
    :cond_6
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    check-cast p1, Lnl/siegmann/epublib/domain/Resource;

    .end local p1    # "resourceObject":Ljava/lang/Object;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public getData()[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    if-nez v2, :cond_5d

    .line 187
    sget-object v2, Lnl/siegmann/epublib/domain/Resource;->LOG:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Initializing lazy resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lnl/siegmann/epublib/domain/Resource;->fileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 189
    new-instance v0, Ljava/util/zip/ZipInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->fileName:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 191
    .local v0, "in":Ljava/util/zip/ZipInputStream;
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    .local v1, "zipEntry":Ljava/util/zip/ZipEntry;
    :goto_3a
    if-eqz v1, :cond_5a

    .line 192
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 191
    :cond_42
    :goto_42
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    goto :goto_3a

    .line 196
    :cond_47
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 197
    invoke-static {v0}, Lnl/siegmann/epublib/util/IOUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v2

    iput-object v2, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    goto :goto_42

    .line 201
    :cond_5a
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->close()V

    .line 204
    .end local v0    # "in":Ljava/util/zip/ZipInputStream;
    .end local v1    # "zipEntry":Ljava/util/zip/ZipEntry;
    :cond_5d
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    return-object v2
.end method

.method public getHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getInputEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->inputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getMediaType()Lnl/siegmann/epublib/domain/MediaType;
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->mediaType:Lnl/siegmann/epublib/domain/MediaType;

    return-object v0
.end method

.method public getReader()Ljava/io/Reader;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    new-instance v0, Lnl/siegmann/epublib/util/commons/io/XmlStreamReader;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getData()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getInputEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lnl/siegmann/epublib/util/commons/io/XmlStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 243
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    if-eqz v0, :cond_9

    .line 244
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    array-length v0, v0

    int-to-long v0, v0

    .line 247
    :goto_8
    return-wide v0

    :cond_9
    iget-wide v0, p0, Lnl/siegmann/epublib/domain/Resource;->cachedSize:J

    goto :goto_8
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isInitialized()Z
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setData([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 225
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    .line 226
    return-void
.end method

.method public setHref(Ljava/lang/String;)V
    .registers 2
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 297
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    .line 298
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 265
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->id:Ljava/lang/String;

    .line 266
    return-void
.end method

.method public setInputEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 316
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->inputEncoding:Ljava/lang/String;

    .line 317
    return-void
.end method

.method public setMediaType(Lnl/siegmann/epublib/domain/MediaType;)V
    .registers 2
    .param p1, "mediaType"    # Lnl/siegmann/epublib/domain/MediaType;

    .prologue
    .line 361
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->mediaType:Lnl/siegmann/epublib/domain/MediaType;

    .line 362
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 365
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Resource;->title:Ljava/lang/String;

    .line 366
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 369
    const/16 v1, 0xc

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "id"

    aput-object v2, v1, v0

    const/4 v2, 0x1

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->id:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "title"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->title:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "encoding"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->inputEncoding:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "mediaType"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->mediaType:Lnl/siegmann/epublib/domain/MediaType;

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "href"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->href:Ljava/lang/String;

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "size"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    iget-object v3, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    if-nez v3, :cond_4f

    :goto_44
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-static {v1}, Lnl/siegmann/epublib/util/StringUtil;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4f
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Resource;->data:[B

    array-length v0, v0

    goto :goto_44
.end method
