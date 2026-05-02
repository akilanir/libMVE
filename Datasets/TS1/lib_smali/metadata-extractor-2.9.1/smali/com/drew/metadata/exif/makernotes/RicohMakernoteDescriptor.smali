.class public Lcom/drew/metadata/exif/makernotes/RicohMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "RicohMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 41
    return-void
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 47
    .line 53
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
