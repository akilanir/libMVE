.class public Lnl/siegmann/epublib/domain/Guide;
.super Ljava/lang/Object;
.source "Guide.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final COVERPAGE_NOT_FOUND:I = -0x1

.field private static final COVERPAGE_UNITIALIZED:I = -0x2

.field public static final DEFAULT_COVER_TITLE:Ljava/lang/String;

.field private static final serialVersionUID:J = -0x56d411c99b480f15L


# instance fields
.field private coverPageIndex:I

.field private references:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/GuideReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    sput-object v0, Lnl/siegmann/epublib/domain/Guide;->DEFAULT_COVER_TITLE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    return-void
.end method

.method private checkCoverPage()V
    .registers 3

    .prologue
    .line 65
    iget v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_8

    .line 66
    invoke-direct {p0}, Lnl/siegmann/epublib/domain/Guide;->initCoverPage()V

    .line 68
    :cond_8
    return-void
.end method

.method private initCoverPage()V
    .registers 6

    .prologue
    .line 72
    const/4 v2, -0x1

    .line 73
    .local v2, "result":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1f

    .line 74
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/GuideReference;

    .line 75
    .local v0, "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/GuideReference;->getType()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 76
    move v2, v1

    .line 80
    .end local v0    # "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    :cond_1f
    iput v2, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    .line 81
    return-void

    .line 73
    .restart local v0    # "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private uncheckCoverPage()V
    .registers 2

    .prologue
    .line 43
    const/4 v0, -0x2

    iput v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    .line 44
    return-void
.end method


# virtual methods
.method public addReference(Lnl/siegmann/epublib/domain/GuideReference;)Lnl/siegmann/epublib/domain/ResourceReference;
    .registers 3
    .param p1, "reference"    # Lnl/siegmann/epublib/domain/GuideReference;

    .prologue
    .line 103
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-direct {p0}, Lnl/siegmann/epublib/domain/Guide;->uncheckCoverPage()V

    .line 105
    return-object p1
.end method

.method public getCoverPage()Lnl/siegmann/epublib/domain/Resource;
    .registers 3

    .prologue
    .line 89
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Guide;->getCoverReference()Lnl/siegmann/epublib/domain/GuideReference;

    move-result-object v0

    .line 90
    .local v0, "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    if-nez v0, :cond_8

    .line 91
    const/4 v1, 0x0

    .line 93
    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/GuideReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    goto :goto_7
.end method

.method public getCoverReference()Lnl/siegmann/epublib/domain/GuideReference;
    .registers 3

    .prologue
    .line 47
    invoke-direct {p0}, Lnl/siegmann/epublib/domain/Guide;->checkCoverPage()V

    .line 48
    iget v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    if-ltz v0, :cond_12

    .line 49
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    iget v1, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/GuideReference;

    .line 51
    :goto_11
    return-object v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getGuideReferencesByType(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .param p1, "referenceTypeName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/GuideReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/GuideReference;>;"
    iget-object v3, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/GuideReference;

    .line 117
    .local v0, "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/GuideReference;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 118
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 121
    .end local v0    # "guideReference":Lnl/siegmann/epublib/domain/GuideReference;
    :cond_25
    return-object v2
.end method

.method public getReferences()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/GuideReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    return-object v0
.end method

.method public setCoverPage(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 5
    .param p1, "coverPage"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 97
    new-instance v0, Lnl/siegmann/epublib/domain/GuideReference;

    sget-object v1, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    sget-object v2, Lnl/siegmann/epublib/domain/Guide;->DEFAULT_COVER_TITLE:Ljava/lang/String;

    invoke-direct {v0, p1, v1, v2}, Lnl/siegmann/epublib/domain/GuideReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .local v0, "coverpageGuideReference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/domain/Guide;->setCoverReference(Lnl/siegmann/epublib/domain/GuideReference;)I

    .line 99
    return-void
.end method

.method public setCoverReference(Lnl/siegmann/epublib/domain/GuideReference;)I
    .registers 4
    .param p1, "guideReference"    # Lnl/siegmann/epublib/domain/GuideReference;

    .prologue
    const/4 v1, 0x0

    .line 55
    iget v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    if-ltz v0, :cond_f

    .line 56
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    iget v1, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 61
    :goto_c
    iget v0, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    return v0

    .line 58
    :cond_f
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 59
    iput v1, p0, Lnl/siegmann/epublib/domain/Guide;->coverPageIndex:I

    goto :goto_c
.end method

.method public setReferences(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/GuideReference;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "references":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/GuideReference;>;"
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Guide;->references:Ljava/util/List;

    .line 39
    invoke-direct {p0}, Lnl/siegmann/epublib/domain/Guide;->uncheckCoverPage()V

    .line 40
    return-void
.end method
