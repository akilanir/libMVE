.class public Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "KyoceraMakernoteDirectory.java"


# static fields
.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_PROPRIETARY_THUMBNAIL:I = 0x1

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
    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 44
    sget-object v0, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Proprietary Thumbnail Format Data"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching (PIM) Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 50
    new-instance v0, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 51
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 57
    const-string v0, "Kyocera/Contax Makernote"

    return-object v0
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
    .line 64
    sget-object v0, Lcom/drew/metadata/exif/makernotes/KyoceraMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
