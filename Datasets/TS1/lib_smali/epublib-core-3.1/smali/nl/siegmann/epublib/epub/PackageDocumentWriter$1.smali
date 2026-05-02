.class final Lnl/siegmann/epublib/epub/PackageDocumentWriter$1;
.super Ljava/lang/Object;
.source "PackageDocumentWriter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/siegmann/epublib/epub/PackageDocumentWriter;->getAllResourcesSortById(Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lnl/siegmann/epublib/domain/Resource;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 109
    check-cast p1, Lnl/siegmann/epublib/domain/Resource;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lnl/siegmann/epublib/domain/Resource;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter$1;->compare(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/domain/Resource;)I

    move-result v0

    return v0
.end method

.method public compare(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/domain/Resource;)I
    .registers 5
    .param p1, "resource1"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "resource2"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 113
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
