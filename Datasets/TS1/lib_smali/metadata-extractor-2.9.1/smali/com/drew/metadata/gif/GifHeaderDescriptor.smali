.class public Lcom/drew/metadata/gif/GifHeaderDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "GifHeaderDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/gif/GifHeaderDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/gif/GifHeaderDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/gif/GifHeaderDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 35
    return-void
.end method
