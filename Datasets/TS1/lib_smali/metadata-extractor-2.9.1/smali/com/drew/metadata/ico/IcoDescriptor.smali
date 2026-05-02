.class public Lcom/drew/metadata/ico/IcoDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "IcoDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/ico/IcoDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/ico/IcoDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/ico/IcoDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 39
    return-void
.end method


# virtual methods
.method public getColourPaletteSizeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 85
    iget-object v1, p0, Lcom/drew/metadata/ico/IcoDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/ico/IcoDirectory;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/drew/metadata/ico/IcoDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 86
    .local v0, "size":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 87
    const/4 v1, 0x0

    .line 88
    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_16

    const-string v1, "No palette"

    goto :goto_c

    :cond_16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " colour"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_37

    const-string v1, ""

    :goto_2e
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    :cond_37
    const-string v1, "s"

    goto :goto_2e
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 44
    packed-switch p1, :pswitch_data_1c

    .line 54
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 46
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/ico/IcoDescriptor;->getImageTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 48
    :pswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/ico/IcoDescriptor;->getImageWidthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :pswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/ico/IcoDescriptor;->getImageHeightDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :pswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/ico/IcoDescriptor;->getColourPaletteSizeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 44
    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_8
        :pswitch_d
        :pswitch_12
        :pswitch_17
    .end packed-switch
.end method

.method public getImageHeightDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 76
    iget-object v1, p0, Lcom/drew/metadata/ico/IcoDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/ico/IcoDirectory;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/drew/metadata/ico/IcoDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 77
    .local v0, "width":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 78
    const/4 v1, 0x0

    .line 79
    :goto_c
    return-object v1

    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_29

    const/16 v1, 0x100

    :goto_1a
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    :cond_29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1a
.end method

.method public getImageTypeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 61
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Icon"

    aput-object v2, v0, v1

    const-string v1, "Cursor"

    aput-object v1, v0, v3

    invoke-virtual {p0, v3, v3, v0}, Lcom/drew/metadata/ico/IcoDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageWidthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 67
    iget-object v1, p0, Lcom/drew/metadata/ico/IcoDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/ico/IcoDirectory;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/drew/metadata/ico/IcoDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 68
    .local v0, "width":Ljava/lang/Integer;
    if-nez v0, :cond_d

    .line 69
    const/4 v1, 0x0

    .line 70
    :goto_c
    return-object v1

    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_29

    const/16 v1, 0x100

    :goto_1a
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    :cond_29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1a
.end method
