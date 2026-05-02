.class public Lcom/drew/metadata/jpeg/JpegCommentDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "JpegCommentDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/jpeg/JpegCommentDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/jpeg/JpegCommentDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/jpeg/JpegCommentDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getJpegCommentDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/drew/metadata/jpeg/JpegCommentDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/jpeg/JpegCommentDirectory;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/drew/metadata/jpeg/JpegCommentDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
