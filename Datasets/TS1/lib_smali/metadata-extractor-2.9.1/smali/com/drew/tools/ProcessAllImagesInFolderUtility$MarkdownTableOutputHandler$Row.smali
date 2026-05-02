.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;
.super Ljava/lang/Object;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Row"
.end annotation


# instance fields
.field private exifVersion:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field final file:Ljava/io/File;

.field private makernote:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field private manufacturer:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field final metadata:Lcom/drew/metadata/Metadata;

.field private model:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field

.field final relativePath:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field final synthetic this$0:Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;

.field private thumbnail:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;)V
    .registers 16
    .param p1    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p4, "relativePath"    # Ljava/lang/String;

    .prologue
    .line 424
    iput-object p1, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->this$0:Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    iput-object p2, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->file:Ljava/io/File;

    .line 426
    iput-object p3, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->metadata:Lcom/drew/metadata/Metadata;

    .line 427
    iput-object p4, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->relativePath:Ljava/lang/String;

    .line 429
    const-class v8, Lcom/drew/metadata/exif/ExifIFD0Directory;

    invoke-virtual {p3, v8}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v4

    check-cast v4, Lcom/drew/metadata/exif/ExifIFD0Directory;

    .line 430
    .local v4, "ifd0Dir":Lcom/drew/metadata/exif/ExifIFD0Directory;
    const-class v8, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    invoke-virtual {p3, v8}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v5

    check-cast v5, Lcom/drew/metadata/exif/ExifSubIFDDirectory;

    .line 431
    .local v5, "subIfdDir":Lcom/drew/metadata/exif/ExifSubIFDDirectory;
    const-class v8, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    invoke-virtual {p3, v8}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v6

    check-cast v6, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    .line 432
    .local v6, "thumbDir":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    if-eqz v4, :cond_35

    .line 433
    const/16 v8, 0x10f

    invoke-virtual {v4, v8}, Lcom/drew/metadata/exif/ExifIFD0Directory;->getDescription(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->manufacturer:Ljava/lang/String;

    .line 434
    const/16 v8, 0x110

    invoke-virtual {v4, v8}, Lcom/drew/metadata/exif/ExifIFD0Directory;->getDescription(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->model:Ljava/lang/String;

    .line 436
    :cond_35
    const/4 v1, 0x0

    .line 437
    .local v1, "hasMakernoteData":Z
    if-eqz v5, :cond_48

    .line 438
    const v8, 0x9000

    invoke-virtual {v5, v8}, Lcom/drew/metadata/exif/ExifSubIFDDirectory;->getDescription(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->exifVersion:Ljava/lang/String;

    .line 439
    const v8, 0x927c

    invoke-virtual {v5, v8}, Lcom/drew/metadata/exif/ExifSubIFDDirectory;->containsTag(I)Z

    move-result v1

    .line 441
    :cond_48
    if-eqz v6, :cond_6b

    .line 442
    const/16 v8, 0x100

    invoke-virtual {v6, v8}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v7

    .line 443
    .local v7, "width":Ljava/lang/Integer;
    const/16 v8, 0x101

    invoke-virtual {v6, v8}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v2

    .line 444
    .local v2, "height":Ljava/lang/Integer;
    if-eqz v7, :cond_a2

    if-eqz v2, :cond_a2

    const-string v8, "Yes (%s x %s)"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    const/4 v10, 0x1

    aput-object v2, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    :goto_69
    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->thumbnail:Ljava/lang/String;

    .line 448
    .end local v2    # "height":Ljava/lang/Integer;
    .end local v7    # "width":Ljava/lang/Integer;
    :cond_6b
    invoke-virtual {p3}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v8

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_73
    :goto_73
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/drew/metadata/Directory;

    .line 449
    .local v0, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Makernote"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_73

    .line 450
    invoke-virtual {v0}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Makernote"

    const-string v10, ""

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;

    goto :goto_73

    .line 444
    .end local v0    # "directory":Lcom/drew/metadata/Directory;
    .end local v3    # "i$":Ljava/util/Iterator;
    .restart local v2    # "height":Ljava/lang/Integer;
    .restart local v7    # "width":Ljava/lang/Integer;
    :cond_a2
    const-string v8, "Yes"

    goto :goto_69

    .line 453
    .end local v2    # "height":Ljava/lang/Integer;
    .end local v7    # "width":Ljava/lang/Integer;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_a5
    iget-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;

    if-nez v8, :cond_af

    .line 454
    if-eqz v1, :cond_b0

    const-string v8, "(Unknown)"

    :goto_ad
    iput-object v8, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;

    .line 456
    :cond_af
    return-void

    .line 454
    :cond_b0
    const-string v8, "N/A"

    goto :goto_ad
.end method

.method static synthetic access$000(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->manufacturer:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->model:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->exifVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->makernote:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;

    .prologue
    .line 412
    iget-object v0, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row;->thumbnail:Ljava/lang/String;

    return-object v0
.end method
