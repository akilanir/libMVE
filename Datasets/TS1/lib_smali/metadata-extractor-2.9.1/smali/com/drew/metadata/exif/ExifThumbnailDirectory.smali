.class public Lcom/drew/metadata/exif/ExifThumbnailDirectory;
.super Lcom/drew/metadata/exif/ExifDirectoryBase;
.source "ExifThumbnailDirectory.java"


# static fields
.field public static final TAG_THUMBNAIL_COMPRESSION:I = 0x103
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TAG_THUMBNAIL_LENGTH:I = 0x202

.field public static final TAG_THUMBNAIL_OFFSET:I = 0x201

.field protected static final _tagNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _thumbnailData:[B
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 60
    sget-object v0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->addExifTagNames(Ljava/util/HashMap;)V

    .line 62
    sget-object v0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x201

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x202

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Thumbnail Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/drew/metadata/exif/ExifDirectoryBase;-><init>()V

    .line 71
    new-instance v0, Lcom/drew/metadata/exif/ExifThumbnailDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/ExifThumbnailDescriptor;-><init>(Lcom/drew/metadata/exif/ExifThumbnailDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 72
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 78
    const-string v0, "Exif Thumbnail"

    return-object v0
.end method

.method protected getTagNameMap()Ljava/util/HashMap;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    sget-object v0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method

.method public getThumbnailData()[B
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_thumbnailData:[B

    return-object v0
.end method

.method public hasThumbnailData()Z
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_thumbnailData:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setThumbnailData([B)V
    .registers 2
    .param p1, "data"    # [B
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 101
    iput-object p1, p0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_thumbnailData:[B

    .line 102
    return-void
.end method

.method public writeThumbnail(Ljava/lang/String;)V
    .registers 7
    .param p1, "filename"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->_thumbnailData:[B

    .line 108
    .local v0, "data":[B
    if-nez v0, :cond_c

    .line 109
    new-instance v3, Lcom/drew/metadata/MetadataException;

    const-string v4, "No thumbnail data exists."

    invoke-direct {v3, v4}, Lcom/drew/metadata/MetadataException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 111
    :cond_c
    const/4 v1, 0x0

    .line 113
    .local v1, "stream":Ljava/io/FileOutputStream;
    :try_start_d
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_d .. :try_end_12} :catchall_1b

    .line 114
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .local v2, "stream":Ljava/io/FileOutputStream;
    :try_start_12
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_15
    .catchall {:try_start_12 .. :try_end_15} :catchall_22

    .line 116
    if-eqz v2, :cond_1a

    .line 117
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 119
    :cond_1a
    return-void

    .line 116
    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    :catchall_1b
    move-exception v3

    :goto_1c
    if-eqz v1, :cond_21

    .line 117
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    :cond_21
    throw v3

    .line 116
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v2    # "stream":Ljava/io/FileOutputStream;
    :catchall_22
    move-exception v3

    move-object v1, v2

    .end local v2    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    goto :goto_1c
.end method
