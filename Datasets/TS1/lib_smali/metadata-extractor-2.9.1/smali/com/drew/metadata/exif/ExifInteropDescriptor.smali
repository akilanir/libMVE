.class public Lcom/drew/metadata/exif/ExifInteropDescriptor;
.super Lcom/drew/metadata/exif/ExifDescriptorBase;
.source "ExifInteropDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/exif/ExifDescriptorBase",
        "<",
        "Lcom/drew/metadata/exif/ExifInteropDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/ExifInteropDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/ExifInteropDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/drew/metadata/exif/ExifDescriptorBase;-><init>(Lcom/drew/metadata/Directory;)V

    .line 36
    return-void
.end method
