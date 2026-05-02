.class public Lcom/drew/metadata/exif/ExifInteropDirectory;
.super Lcom/drew/metadata/exif/ExifDirectoryBase;
.source "ExifInteropDirectory.java"


# static fields
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
    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/ExifInteropDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 40
    sget-object v0, Lcom/drew/metadata/exif/ExifInteropDirectory;->_tagNameMap:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/drew/metadata/exif/ExifInteropDirectory;->addExifTagNames(Ljava/util/HashMap;)V

    .line 41
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/drew/metadata/exif/ExifDirectoryBase;-><init>()V

    .line 45
    new-instance v0, Lcom/drew/metadata/exif/ExifInteropDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/ExifInteropDescriptor;-><init>(Lcom/drew/metadata/exif/ExifInteropDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/ExifInteropDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 52
    const-string v0, "Interoperability"

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
    .line 59
    sget-object v0, Lcom/drew/metadata/exif/ExifInteropDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
