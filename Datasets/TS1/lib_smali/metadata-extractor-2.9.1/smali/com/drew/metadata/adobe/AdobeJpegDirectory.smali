.class public Lcom/drew/metadata/adobe/AdobeJpegDirectory;
.super Lcom/drew/metadata/Directory;
.source "AdobeJpegDirectory.java"


# static fields
.field public static final TAG_APP14_FLAGS0:I = 0x1

.field public static final TAG_APP14_FLAGS1:I = 0x2

.field public static final TAG_COLOR_TRANSFORM:I = 0x3

.field public static final TAG_DCT_ENCODE_VERSION:I

.field private static final _tagNameMap:Ljava/util/HashMap;
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
    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 54
    sget-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DCT Encode Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flags 0"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Flags 1"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Color Transform"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 61
    new-instance v0, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/adobe/AdobeJpegDescriptor;-><init>(Lcom/drew/metadata/adobe/AdobeJpegDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 62
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 67
    const-string v0, "Adobe JPEG"

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
    .line 73
    sget-object v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
