.class public Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "SonyType6MakernoteDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;
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
    packed-switch p1, :pswitch_data_e

    .line 51
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 49
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDescriptor;->getMakernoteThumbVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 47
    nop

    :pswitch_data_e
    .packed-switch 0x2000
        :pswitch_8
    .end packed-switch
.end method

.method public getMakernoteThumbVersionDescription()Ljava/lang/String;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 58
    const/16 v0, 0x2000

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDescriptor;->getVersionBytesDescription(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
