.class public Lnl/siegmann/epublib/domain/TOCReference;
.super Lnl/siegmann/epublib/domain/TitledResourceReference;
.source "TOCReference.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final COMPARATOR_BY_TITLE_IGNORE_CASE:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x5052f55be0370f18L


# instance fields
.field private children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    new-instance v0, Lnl/siegmann/epublib/domain/TOCReference$1;

    invoke-direct {v0}, Lnl/siegmann/epublib/domain/TOCReference$1;-><init>()V

    sput-object v0, Lnl/siegmann/epublib/domain/TOCReference;->COMPARATOR_BY_TITLE_IGNORE_CASE:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, v0, v0, v0}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p3, "fragmentId"    # Ljava/lang/String;

    .prologue
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/util/List;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p3, "fragmentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/domain/Resource;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p4, "children":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-direct {p0, p2, p1, p3}, Lnl/siegmann/epublib/domain/TitledResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    iput-object p4, p0, Lnl/siegmann/epublib/domain/TOCReference;->children:Ljava/util/List;

    .line 46
    return-void
.end method

.method public static getComparatorByTitleIgnoreCase()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    sget-object v0, Lnl/siegmann/epublib/domain/TOCReference;->COMPARATOR_BY_TITLE_IGNORE_CASE:Ljava/util/Comparator;

    return-object v0
.end method


# virtual methods
.method public addChildSection(Lnl/siegmann/epublib/domain/TOCReference;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 3
    .param p1, "childSection"    # Lnl/siegmann/epublib/domain/TOCReference;

    .prologue
    .line 57
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TOCReference;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    return-object p1
.end method

.method public getChildren()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TOCReference;->children:Ljava/util/List;

    return-object v0
.end method

.method public setChildren(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "children":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    iput-object p1, p0, Lnl/siegmann/epublib/domain/TOCReference;->children:Ljava/util/List;

    .line 63
    return-void
.end method
