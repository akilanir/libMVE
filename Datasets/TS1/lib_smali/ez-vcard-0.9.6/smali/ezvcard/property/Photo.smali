.class public Lezvcard/property/Photo;
.super Lezvcard/property/ImageProperty;
.source "Photo.java"


# direct methods
.method public constructor <init>(Ljava/io/File;Lezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .param p2, "type"    # Lezvcard/parameter/ImageType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0, p1, p2}, Lezvcard/property/ImageProperty;-><init>(Ljava/io/File;Lezvcard/parameter/ImageType;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "type"    # Lezvcard/parameter/ImageType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-direct {p0, p1, p2}, Lezvcard/property/ImageProperty;-><init>(Ljava/io/InputStream;Lezvcard/parameter/ImageType;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "type"    # Lezvcard/parameter/ImageType;

    .prologue
    .line 98
    invoke-direct {p0, p1, p2}, Lezvcard/property/ImageProperty;-><init>(Ljava/lang/String;Lezvcard/parameter/ImageType;)V

    .line 99
    return-void
.end method

.method public constructor <init>([BLezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "type"    # Lezvcard/parameter/ImageType;

    .prologue
    .line 107
    invoke-direct {p0, p1, p2}, Lezvcard/property/ImageProperty;-><init>([BLezvcard/parameter/ImageType;)V

    .line 108
    return-void
.end method
