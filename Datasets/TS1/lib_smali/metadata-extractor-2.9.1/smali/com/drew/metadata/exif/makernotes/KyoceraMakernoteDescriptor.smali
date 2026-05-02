.class public Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "KyoceraMakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 53
    sparse-switch p1, :sswitch_data_12

    .line 59
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 55
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;->getPrintImageMatchingInfoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;->getProprietaryThumbnailDataDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 53
    :sswitch_data_12
    .sparse-switch
        0x1 -> :sswitch_d
        0xe00 -> :sswitch_8
    .end sparse-switch
.end method

.method public getPrintImageMatchingInfoDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 66
    const/16 v0, 0xe00

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;->getByteLengthDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProprietaryThumbnailDataDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;->getByteLengthDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
