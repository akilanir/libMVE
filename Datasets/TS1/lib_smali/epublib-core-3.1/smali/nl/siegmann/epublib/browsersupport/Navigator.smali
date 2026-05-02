.class public Lnl/siegmann/epublib/browsersupport/Navigator;
.super Ljava/lang/Object;
.source "Navigator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0xeef2bcae711bd22L


# instance fields
.field private book:Lnl/siegmann/epublib/domain/Book;

.field private currentFragmentId:Ljava/lang/String;

.field private currentPagePos:I

.field private currentResource:Lnl/siegmann/epublib/domain/Resource;

.field private currentSpinePos:I

.field private eventListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/browsersupport/NavigationEventListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnl/siegmann/epublib/browsersupport/Navigator;-><init>(Lnl/siegmann/epublib/domain/Book;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Book;)V
    .registers 4
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->eventListeners:Ljava/util/List;

    .line 38
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    .line 39
    iput v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 40
    if-eqz p1, :cond_17

    .line 41
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 43
    :cond_17
    iput v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentPagePos:I

    .line 44
    return-void
.end method

.method private declared-synchronized handleEventListeners(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V
    .registers 5
    .param p1, "navigationEvent"    # Lnl/siegmann/epublib/browsersupport/NavigationEvent;

    .prologue
    .line 47
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->eventListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_18

    .line 48
    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->eventListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/browsersupport/NavigationEventListener;

    .line 49
    .local v1, "navigationEventListener":Lnl/siegmann/epublib/browsersupport/NavigationEventListener;
    invoke-interface {v1, p1}, Lnl/siegmann/epublib/browsersupport/NavigationEventListener;->navigationPerformed(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V
    :try_end_15
    .catchall {:try_start_2 .. :try_end_15} :catchall_1a

    .line 47
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 51
    .end local v1    # "navigationEventListener":Lnl/siegmann/epublib/browsersupport/NavigationEventListener;
    :cond_18
    monitor-exit p0

    return-void

    .line 47
    :catchall_1a
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public addNavigationEventListener(Lnl/siegmann/epublib/browsersupport/NavigationEventListener;)Z
    .registers 3
    .param p1, "navigationEventListener"    # Lnl/siegmann/epublib/browsersupport/NavigationEventListener;

    .prologue
    .line 54
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->eventListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getBook()Lnl/siegmann/epublib/domain/Book;
    .registers 2

    .prologue
    .line 198
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    return-object v0
.end method

.method public getCurrentFragmentId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 215
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentFragmentId:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentResource()Lnl/siegmann/epublib/domain/Resource;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    return-object v0
.end method

.method public getCurrentSectionPos()I
    .registers 2

    .prologue
    .line 219
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentPagePos:I

    return v0
.end method

.method public getCurrentSpinePos()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    return v0
.end method

.method public gotoBook(Lnl/siegmann/epublib/domain/Book;Ljava/lang/Object;)V
    .registers 6
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 162
    new-instance v0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;

    invoke-direct {v0, p2, p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;-><init>(Ljava/lang/Object;Lnl/siegmann/epublib/browsersupport/Navigator;)V

    .line 163
    .local v0, "navigationEvent":Lnl/siegmann/epublib/browsersupport/NavigationEvent;
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    .line 164
    iput-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentFragmentId:Ljava/lang/String;

    .line 165
    const/4 v1, 0x0

    iput v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentPagePos:I

    .line 166
    iput-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 167
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v1

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->getResourceIndex(Lnl/siegmann/epublib/domain/Resource;)I

    move-result v1

    iput v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 168
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->handleEventListeners(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V

    .line 169
    return-void
.end method

.method public gotoFirstSpineSection(Ljava/lang/Object;)I
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoLastSpineSection(Ljava/lang/Object;)I
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 158
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Spine;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0, p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoNextSpineSection(Ljava/lang/Object;)I
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 87
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    if-gez v0, :cond_a

    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(ILjava/lang/Object;)I

    move-result v0

    .line 90
    :goto_9
    return v0

    :cond_a
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0, p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(ILjava/lang/Object;)I

    move-result v0

    goto :goto_9
.end method

.method public gotoPreviousSpineSection(ILjava/lang/Object;)I
    .registers 4
    .param p1, "pagePos"    # I
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 71
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    if-gez v0, :cond_a

    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(IILjava/lang/Object;)I

    move-result v0

    .line 74
    :goto_9
    return v0

    :cond_a
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0, p1, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(IILjava/lang/Object;)I

    move-result v0

    goto :goto_9
.end method

.method public gotoPreviousSpineSection(Ljava/lang/Object;)I
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoPreviousSpineSection(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoResource(Ljava/lang/String;Ljava/lang/Object;)I
    .registers 5
    .param p1, "resourceHref"    # Ljava/lang/String;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 95
    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 96
    .local v0, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {p0, v0, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoResource(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/Object;)I

    move-result v1

    return v1
.end method

.method public gotoResource(Lnl/siegmann/epublib/domain/Resource;ILjava/lang/Object;)I
    .registers 5
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "pagePos"    # I
    .param p3, "source"    # Ljava/lang/Object;

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoResource(Lnl/siegmann/epublib/domain/Resource;ILjava/lang/String;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoResource(Lnl/siegmann/epublib/domain/Resource;ILjava/lang/String;Ljava/lang/Object;)I
    .registers 8
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "pagePos"    # I
    .param p3, "fragmentId"    # Ljava/lang/String;
    .param p4, "source"    # Ljava/lang/Object;

    .prologue
    .line 113
    if-nez p1, :cond_4

    .line 114
    const/4 v1, -0x1

    .line 123
    :goto_3
    return v1

    .line 116
    :cond_4
    new-instance v0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;

    invoke-direct {v0, p4, p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;-><init>(Ljava/lang/Object;Lnl/siegmann/epublib/browsersupport/Navigator;)V

    .line 117
    .local v0, "navigationEvent":Lnl/siegmann/epublib/browsersupport/NavigationEvent;
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 118
    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v1

    iget-object v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->getResourceIndex(Lnl/siegmann/epublib/domain/Resource;)I

    move-result v1

    iput v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 119
    iput p2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentPagePos:I

    .line 120
    iput-object p3, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentFragmentId:Ljava/lang/String;

    .line 121
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->handleEventListeners(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V

    .line 123
    iget v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    goto :goto_3
.end method

.method public gotoResource(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/Object;)I
    .registers 5
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 101
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoResource(Lnl/siegmann/epublib/domain/Resource;ILjava/lang/String;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoResource(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/Object;)I
    .registers 5
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "fragmentId"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/Object;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2, p3}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoResource(Lnl/siegmann/epublib/domain/Resource;ILjava/lang/String;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoResourceId(Ljava/lang/String;Ljava/lang/Object;)I
    .registers 4
    .param p1, "resourceId"    # Ljava/lang/String;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 127
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Spine;->findFirstResourceById(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public gotoSpineSection(IILjava/lang/Object;)I
    .registers 7
    .param p1, "newSpinePos"    # I
    .param p2, "newPagePos"    # I
    .param p3, "source"    # Ljava/lang/Object;

    .prologue
    .line 143
    iget v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    if-ne p1, v1, :cond_7

    .line 144
    iget v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 154
    :goto_6
    return v1

    .line 146
    :cond_7
    if-ltz p1, :cond_15

    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v1

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Spine;->size()I

    move-result v1

    if-lt p1, v1, :cond_18

    .line 147
    :cond_15
    iget v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    goto :goto_6

    .line 149
    :cond_18
    new-instance v0, Lnl/siegmann/epublib/browsersupport/NavigationEvent;

    invoke-direct {v0, p3, p0}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;-><init>(Ljava/lang/Object;Lnl/siegmann/epublib/browsersupport/Navigator;)V

    .line 150
    .local v0, "navigationEvent":Lnl/siegmann/epublib/browsersupport/NavigationEvent;
    iput p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 151
    iput p2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentPagePos:I

    .line 152
    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v1

    iget v2, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    invoke-virtual {v1, v2}, Lnl/siegmann/epublib/domain/Spine;->getResource(I)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    iput-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 153
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->handleEventListeners(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V

    .line 154
    iget v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    goto :goto_6
.end method

.method public gotoSpineSection(ILjava/lang/Object;)I
    .registers 4
    .param p1, "newSpinePos"    # I
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoSpineSection(IILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public hasNextSpineSection()Z
    .registers 3

    .prologue
    .line 79
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v1

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Spine;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public hasPreviousSpineSection()Z
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public removeNavigationEventListener(Lnl/siegmann/epublib/browsersupport/NavigationEventListener;)Z
    .registers 3
    .param p1, "navigationEventListener"    # Lnl/siegmann/epublib/browsersupport/NavigationEventListener;

    .prologue
    .line 59
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->eventListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setCurrentResource(Lnl/siegmann/epublib/domain/Resource;)I
    .registers 3
    .param p1, "currentResource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 209
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Spine;->getResourceIndex(Lnl/siegmann/epublib/domain/Resource;)I

    move-result v0

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 210
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 211
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    return v0
.end method

.method public setCurrentSpinePos(I)V
    .registers 3
    .param p1, "currentIndex"    # I

    .prologue
    .line 193
    iput p1, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentSpinePos:I

    .line 194
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->book:Lnl/siegmann/epublib/domain/Book;

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnl/siegmann/epublib/domain/Spine;->getResource(I)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/Navigator;->currentResource:Lnl/siegmann/epublib/domain/Resource;

    .line 195
    return-void
.end method
