.class public Lnl/siegmann/epublib/browsersupport/NavigationEvent;
.super Ljava/util/EventObject;
.source "NavigationEvent.java"


# static fields
.field private static final serialVersionUID:J = -0x58142fa135b1bebaL


# instance fields
.field private navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

.field private oldBook:Lnl/siegmann/epublib/domain/Book;

.field private oldFragmentId:Ljava/lang/String;

.field private oldResource:Lnl/siegmann/epublib/domain/Resource;

.field private oldSectionPos:I

.field private oldSpinePos:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lnl/siegmann/epublib/browsersupport/Navigator;)V
    .registers 4
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "navigator"    # Lnl/siegmann/epublib/browsersupport/Navigator;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 32
    iput-object p2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    .line 33
    invoke-virtual {p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getBook()Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    .line 34
    invoke-virtual {p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentFragmentId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldFragmentId:Ljava/lang/String;

    .line 35
    invoke-virtual {p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentSectionPos()I

    move-result v0

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSectionPos:I

    .line 36
    invoke-virtual {p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldResource:Lnl/siegmann/epublib/domain/Resource;

    .line 37
    invoke-virtual {p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentSpinePos()I

    move-result v0

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSpinePos:I

    .line 38
    return-void
.end method


# virtual methods
.method public getCurrentBook()Lnl/siegmann/epublib/domain/Book;
    .registers 2

    .prologue
    .line 129
    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getNavigator()Lnl/siegmann/epublib/browsersupport/Navigator;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getBook()Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentFragmentId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentFragmentId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentSectionPos()I
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentSectionPos()I

    move-result v0

    return v0
.end method

.method public getCurrentSpinePos()I
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentSpinePos()I

    move-result v0

    return v0
.end method

.method public getNavigator()Lnl/siegmann/epublib/browsersupport/Navigator;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    return-object v0
.end method

.method public getOldBook()Lnl/siegmann/epublib/domain/Book;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    return-object v0
.end method

.method public getOldFragmentId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldFragmentId:Ljava/lang/String;

    return-object v0
.end method

.method public getOldResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldResource:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public getOldSectionPos()I
    .registers 2

    .prologue
    .line 46
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSectionPos:I

    return v0
.end method

.method public getOldSpinePos()I
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSpinePos:I

    return v0
.end method

.method public isBookChanged()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 88
    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    if-nez v1, :cond_6

    .line 91
    :cond_5
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v2}, Lnl/siegmann/epublib/browsersupport/Navigator;->getBook()Lnl/siegmann/epublib/domain/Book;

    move-result-object v2

    if-ne v1, v2, :cond_5

    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isFragmentChanged()Z
    .registers 3

    .prologue
    .line 99
    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getOldFragmentId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentFragmentId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnl/siegmann/epublib/util/StringUtil;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isResourceChanged()Z
    .registers 3

    .prologue
    .line 133
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldResource:Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    if-eq v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isSectionPosChanged()Z
    .registers 3

    .prologue
    .line 152
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSectionPos:I

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentSectionPos()I

    move-result v1

    if-eq v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isSpinePosChanged()Z
    .registers 3

    .prologue
    .line 95
    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getOldSpinePos()I

    move-result v0

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentSpinePos()I

    move-result v1

    if-eq v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setNavigator(Lnl/siegmann/epublib/browsersupport/Navigator;)V
    .registers 2
    .param p1, "navigator"    # Lnl/siegmann/epublib/browsersupport/Navigator;

    .prologue
    .line 120
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    .line 121
    return-void
.end method

.method public setOldBook(Lnl/siegmann/epublib/domain/Book;)V
    .registers 2
    .param p1, "oldBook"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 125
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    .line 126
    return-void
.end method

.method setOldFragmentId(Ljava/lang/String;)V
    .registers 2
    .param p1, "oldFragmentId"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldFragmentId:Ljava/lang/String;

    .line 60
    return-void
.end method

.method setOldPagePos(I)V
    .registers 2
    .param p1, "oldPagePos"    # I

    .prologue
    .line 68
    iput p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSectionPos:I

    .line 69
    return-void
.end method

.method public setOldResource(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 2
    .param p1, "oldResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 110
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldResource:Lnl/siegmann/epublib/domain/Resource;

    .line 111
    return-void
.end method

.method public setOldSpinePos(I)V
    .registers 2
    .param p1, "oldSpinePos"    # I

    .prologue
    .line 115
    iput p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSpinePos:I

    .line 116
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 137
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "oldSectionPos"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSectionPos:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "oldResource"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldResource:Lnl/siegmann/epublib/domain/Resource;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "oldBook"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldBook:Lnl/siegmann/epublib/domain/Book;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "oldFragmentId"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldFragmentId:Ljava/lang/String;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "oldSpinePos"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    iget v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->oldSpinePos:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "currentPagePos"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentSectionPos()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "currentResource"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "currentBook"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentBook()Lnl/siegmann/epublib/domain/Book;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "currentFragmentId"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentFragmentId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "currentSpinePos"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    invoke-virtual {p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentSpinePos()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
