.class public Lcom/drew/metadata/exif/ExifIFD0Descriptor;
.super Lcom/drew/metadata/exif/ExifDescriptorBase;
.source "ExifIFD0Descriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/exif/ExifDescriptorBase",
        "<",
        "Lcom/drew/metadata/exif/ExifIFD0Directory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/ExifIFD0Directory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/ExifIFD0Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/drew/metadata/exif/ExifDescriptorBase;-><init>(Lcom/drew/metadata/Directory;)V

    .line 37
    return-void
.end method
