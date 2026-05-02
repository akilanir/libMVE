.class public Lcom/drew/metadata/adobe/AdobeJpegDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "AdobeJpegDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/adobe/AdobeJpegDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/adobe/AdobeJpegDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/adobe/AdobeJpegDirectory;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 38
    return-void
.end method

.method private getColorTransformDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x3

    .line 67
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Unknown (RGB or CMYK)"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "YCbCr"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "YCCK"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDctEncodeVersionDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 56
    iget-object v1, p0, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/adobe/AdobeJpegDirectory;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 57
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x64

    if-ne v1, v2, :cond_18

    const-string v1, "100"

    goto :goto_c

    :cond_18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 43
    packed-switch p1, :pswitch_data_12

    .line 49
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 45
    :pswitch_8
    invoke-direct {p0}, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;->getColorTransformDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 47
    :pswitch_d
    invoke-direct {p0}, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;->getDctEncodeVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 43
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
        :pswitch_3
        :pswitch_3
        :pswitch_8
    .end packed-switch
.end method
