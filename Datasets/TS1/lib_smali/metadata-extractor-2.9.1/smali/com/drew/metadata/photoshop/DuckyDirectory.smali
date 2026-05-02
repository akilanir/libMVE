.class public Lcom/drew/metadata/photoshop/DuckyDirectory;
.super Lcom/drew/metadata/Directory;
.source "DuckyDirectory.java"


# static fields
.field public static final TAG_COMMENT:I = 0x2

.field public static final TAG_COPYRIGHT:I = 0x3

.field public static final TAG_QUALITY:I = 0x1

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

    sput-object v0, Lcom/drew/metadata/photoshop/DuckyDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 46
    sget-object v0, Lcom/drew/metadata/photoshop/DuckyDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Quality"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/drew/metadata/photoshop/DuckyDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Comment"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/drew/metadata/photoshop/DuckyDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Copyright"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 53
    new-instance v0, Lcom/drew/metadata/TagDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/photoshop/DuckyDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 54
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 60
    const-string v0, "Ducky"

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
    .line 67
    sget-object v0, Lcom/drew/metadata/photoshop/DuckyDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
