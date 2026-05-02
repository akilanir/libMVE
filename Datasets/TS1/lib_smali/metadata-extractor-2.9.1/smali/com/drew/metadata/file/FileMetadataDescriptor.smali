.class public Lcom/drew/metadata/file/FileMetadataDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "FileMetadataDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/file/FileMetadataDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/file/FileMetadataDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/file/FileMetadataDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 38
    return-void
.end method

.method private getFileSizeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 55
    iget-object v1, p0, Lcom/drew/metadata/file/FileMetadataDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/file/FileMetadataDirectory;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/drew/metadata/file/FileMetadataDirectory;->getLongObject(I)Ljava/lang/Long;

    move-result-object v0

    .line 57
    .local v0, "size":Ljava/lang/Long;
    if-nez v0, :cond_d

    .line 58
    const/4 v1, 0x0

    .line 60
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 44
    packed-switch p1, :pswitch_data_e

    .line 48
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 46
    :pswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/file/FileMetadataDescriptor;->getFileSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 44
    nop

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_8
    .end packed-switch
.end method
