.class public Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "RicohMakernoteDirectory.java"


# static fields
.field public static final TAG_MAKERNOTE_DATA_TYPE:I = 0x1

.field public static final TAG_PRINT_IMAGE_MATCHING_INFO:I = 0xe00

.field public static final TAG_RICOH_CAMERA_INFO_MAKERNOTE_SUB_IFD_POINTER:I = 0x2001

.field public static final TAG_VERSION:I = 0x2

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
    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 46
    sget-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Data Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0xe00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Print Image Matching (PIM) Info"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2001

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Ricoh Camera Info Makernote Sub-IFD"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 54
    new-instance v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 55
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 61
    const-string v0, "Ricoh Makernote"

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
    .line 68
    sget-object v0, Lcom/drew/metadata/exif/makernotes/RicohMakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
