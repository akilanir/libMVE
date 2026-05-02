.class public Lcom/drew/metadata/pcx/PcxDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "PcxDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/pcx/PcxDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/pcx/PcxDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/pcx/PcxDirectory;
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
.method public getColorPlanesDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 74
    const/16 v0, 0xa

    const/4 v1, 0x3

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "24-bit color"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "16 colors"

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/drew/metadata/pcx/PcxDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 44
    sparse-switch p1, :sswitch_data_18

    .line 52
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 46
    :sswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/pcx/PcxDescriptor;->getVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 48
    :sswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/pcx/PcxDescriptor;->getColorPlanesDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 50
    :sswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/pcx/PcxDescriptor;->getPaletteTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 44
    nop

    :sswitch_data_18
    .sparse-switch
        0x1 -> :sswitch_8
        0xa -> :sswitch_d
        0xc -> :sswitch_12
    .end sparse-switch
.end method

.method public getPaletteTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 82
    const/16 v0, 0xc

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Color or B&W"

    aput-object v3, v1, v2

    const-string v2, "Grayscale"

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/pcx/PcxDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVersionDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 62
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "2.5 with fixed EGA palette information"

    aput-object v2, v0, v1

    const/4 v1, 0x0

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "2.8 with modifiable EGA palette information"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "2.8 without palette information (default palette)"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "PC Paintbrush for Windows"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "3.0 or better"

    aput-object v2, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/drew/metadata/pcx/PcxDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
