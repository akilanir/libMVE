.class Lfreemarker/ext/jsp/TaglibFactory$TldPath;
.super Ljava/lang/Object;
.source "TaglibFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TldPath"
.end annotation


# instance fields
.field final filePath:Ljava/lang/String;

.field final jarItemPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 216
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/ext/jsp/TaglibFactory$TldPath;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "jarItemPath"    # Ljava/lang/String;

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->filePath:Ljava/lang/String;

    .line 221
    iput-object p2, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->jarItemPath:Ljava/lang/String;

    .line 222
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 225
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->jarItemPath:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 226
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->filePath:Ljava/lang/String;

    .line 228
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->filePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/jsp/TaglibFactory$TldPath;->jarItemPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
