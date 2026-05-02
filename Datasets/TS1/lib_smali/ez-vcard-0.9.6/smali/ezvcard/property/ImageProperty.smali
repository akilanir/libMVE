.class public Lezvcard/property/ImageProperty;
.super Lezvcard/property/BinaryProperty;
.source "ImageProperty.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/property/BinaryProperty",
        "<",
        "Lezvcard/parameter/ImageType;",
        ">;"
    }
.end annotation


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
    .line 78
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/io/File;Lezvcard/parameter/MediaTypeParameter;)V

    .line 79
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
    .line 68
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/io/InputStream;Lezvcard/parameter/MediaTypeParameter;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "type"    # Lezvcard/parameter/ImageType;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>(Ljava/lang/String;Lezvcard/parameter/MediaTypeParameter;)V

    .line 50
    return-void
.end method

.method public constructor <init>([BLezvcard/parameter/ImageType;)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "type"    # Lezvcard/parameter/ImageType;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lezvcard/property/BinaryProperty;-><init>([BLezvcard/parameter/MediaTypeParameter;)V

    .line 59
    return-void
.end method
