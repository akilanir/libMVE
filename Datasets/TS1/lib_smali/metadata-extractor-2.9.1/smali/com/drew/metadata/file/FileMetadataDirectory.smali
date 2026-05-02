.class public Lcom/drew/metadata/file/FileMetadataDirectory;
.super Lcom/drew/metadata/Directory;
.source "FileMetadataDirectory.java"


# static fields
.field public static final TAG_FILE_MODIFIED_DATE:I = 0x3

.field public static final TAG_FILE_NAME:I = 0x1

.field public static final TAG_FILE_SIZE:I = 0x2

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
    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/file/FileMetadataDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 42
    sget-object v0, Lcom/drew/metadata/file/FileMetadataDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/drew/metadata/file/FileMetadataDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Size"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/drew/metadata/file/FileMetadataDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Modified Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 49
    new-instance v0, Lcom/drew/metadata/file/FileMetadataDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/file/FileMetadataDescriptor;-><init>(Lcom/drew/metadata/file/FileMetadataDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/file/FileMetadataDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 50
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 56
    const-string v0, "File"

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
    .line 63
    sget-object v0, Lcom/drew/metadata/file/FileMetadataDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
