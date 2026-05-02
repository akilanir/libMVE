.class public Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;
.super Lcom/drew/metadata/Directory;
.source "SonyType6MakernoteDirectory.java"


# static fields
.field public static final TAG_MAKERNOTE_THUMB_LENGTH:I = 0x514

.field public static final TAG_MAKERNOTE_THUMB_OFFSET:I = 0x513

.field public static final TAG_MAKERNOTE_THUMB_VERSION:I = 0x2000

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
    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 47
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x513

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Thumb Offset"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x514

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Thumb Length"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Makernote Thumb Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 55
    new-instance v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDescriptor;-><init>(Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 56
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 62
    const-string v0, "Sony Makernote"

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
    .line 69
    sget-object v0, Lcom/drew/metadata/exif/makernotes/SonyType6MakernoteDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
