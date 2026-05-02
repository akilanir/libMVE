.class public Lnl/siegmann/epublib/domain/TitledResourceReference;
.super Lnl/siegmann/epublib/domain/ResourceReference;
.source "TitledResourceReference.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3660153b43aff440L


# instance fields
.field private fragmentId:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/domain/TitledResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnl/siegmann/epublib/domain/TitledResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "fragmentId"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/domain/ResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    .line 27
    iput-object p2, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->title:Ljava/lang/String;

    .line 28
    iput-object p3, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public getCompleteHref()Ljava/lang/String;
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 55
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->resource:Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    .line 57
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->resource:Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public getFragmentId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setFragmentId(Ljava/lang/String;)V
    .registers 2
    .param p1, "fragmentId"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setResource(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnl/siegmann/epublib/domain/TitledResourceReference;->setResource(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public setResource(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "fragmentId"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-super {p0, p1}, Lnl/siegmann/epublib/domain/ResourceReference;->setResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 63
    iput-object p2, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->fragmentId:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lnl/siegmann/epublib/domain/TitledResourceReference;->title:Ljava/lang/String;

    .line 45
    return-void
.end method
