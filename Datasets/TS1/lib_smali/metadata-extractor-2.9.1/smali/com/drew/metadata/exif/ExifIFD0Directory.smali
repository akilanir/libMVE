.class public Lcom/drew/metadata/exif/ExifIFD0Directory;
.super Lcom/drew/metadata/exif/ExifDirectoryBase;
.source "ExifIFD0Directory.java"


# static fields
.field public static final TAG_EXIF_SUB_IFD_OFFSET:I = 0x8769

.field public static final TAG_GPS_INFO_OFFSET:I = 0x8825

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
    .registers 1

    .prologue
    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/ExifIFD0Directory;->_tagNameMap:Ljava/util/HashMap;

    .line 52
    sget-object v0, Lcom/drew/metadata/exif/ExifIFD0Directory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/drew/metadata/exif/ExifIFD0Directory;->addExifTagNames(Ljava/util/HashMap;)V

    .line 53
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/drew/metadata/exif/ExifDirectoryBase;-><init>()V

    .line 44
    new-instance v0, Lcom/drew/metadata/exif/ExifIFD0Descriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/ExifIFD0Descriptor;-><init>(Lcom/drew/metadata/exif/ExifIFD0Directory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/ExifIFD0Directory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 45
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 59
    const-string v0, "Exif IFD0"

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
    .line 66
    sget-object v0, Lcom/drew/metadata/exif/ExifIFD0Directory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
