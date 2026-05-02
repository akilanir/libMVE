.class public Lcom/drew/metadata/jpeg/JpegDirectory;
.super Lcom/drew/metadata/Directory;
.source "JpegDirectory.java"


# static fields
.field public static final TAG_COMPONENT_DATA_1:I = 0x6

.field public static final TAG_COMPONENT_DATA_2:I = 0x7

.field public static final TAG_COMPONENT_DATA_3:I = 0x8

.field public static final TAG_COMPONENT_DATA_4:I = 0x9

.field public static final TAG_COMPRESSION_TYPE:I = -0x3

.field public static final TAG_DATA_PRECISION:I = 0x0

.field public static final TAG_IMAGE_HEIGHT:I = 0x1

.field public static final TAG_IMAGE_WIDTH:I = 0x3

.field public static final TAG_NUMBER_OF_COMPONENTS:I = 0x5

.field protected static final _tagNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 71
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, -0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Compression Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Data Precision"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Width"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Height"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Number of Components"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Component 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Component 2"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Component 3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Component 4"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 84
    new-instance v0, Lcom/drew/metadata/jpeg/JpegDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/jpeg/JpegDescriptor;-><init>(Lcom/drew/metadata/jpeg/JpegDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 85
    return-void
.end method


# virtual methods
.method public getComponent(I)Lcom/drew/metadata/jpeg/JpegComponent;
    .registers 4
    .param p1, "componentNumber"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 109
    add-int/lit8 v0, p1, 0x6

    .line 110
    .local v0, "tagType":I
    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->getObject(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/drew/metadata/jpeg/JpegComponent;

    return-object v1
.end method

.method public getImageHeight()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getImageWidth()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 91
    const-string v0, "JPEG"

    return-object v0
.end method

.method public getNumberOfComponents()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;
        }
    .end annotation

    .prologue
    .line 125
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDirectory;->getInt(I)I

    move-result v0

    return v0
.end method

.method protected getTagNameMap()Ljava/util/HashMap;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    sget-object v0, Lcom/drew/metadata/jpeg/JpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
