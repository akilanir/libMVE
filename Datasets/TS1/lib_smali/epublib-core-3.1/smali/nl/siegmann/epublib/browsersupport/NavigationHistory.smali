.class public Lnl/siegmann/epublib/browsersupport/NavigationHistory;
.super Ljava/lang/Object;
.source "NavigationHistory.java"

# interfaces
.implements Lnl/siegmann/epublib/browsersupport/NavigationEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;
    }
.end annotation


# static fields
.field private static final DEFAULT_HISTORY_WAIT_TIME:J = 0x3e8L

.field public static final DEFAULT_MAX_HISTORY_SIZE:I = 0x3e8


# instance fields
.field private currentPos:I

.field private currentSize:I

.field private historyWaitTime:J

.field private lastUpdateTime:J

.field private locations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;",
            ">;"
        }
    .end annotation
.end field

.field private maxHistorySize:I

.field private navigator:Lnl/siegmann/epublib/browsersupport/Navigator;


# direct methods
.method public constructor <init>(Lnl/siegmann/epublib/browsersupport/Navigator;)V
    .registers 4
    .param p1, "navigator"    # Lnl/siegmann/epublib/browsersupport/Navigator;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->lastUpdateTime:J

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    .line 45
    const/16 v0, 0x3e8

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->maxHistorySize:I

    .line 46
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->historyWaitTime:J

    .line 49
    iput-object p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    .line 50
    invoke-virtual {p1, p0}, Lnl/siegmann/epublib/browsersupport/Navigator;->addNavigationEventListener(Lnl/siegmann/epublib/browsersupport/NavigationEventListener;)Z

    .line 51
    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/Navigator;->getBook()Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->initBook(Lnl/siegmann/epublib/domain/Book;)V

    .line 52
    return-void
.end method

.method private checkHistorySize()V
    .registers 3

    .prologue
    .line 127
    :goto_0
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->maxHistorySize:I

    if-le v0, v1, :cond_1d

    .line 128
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 129
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    .line 130
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    goto :goto_0

    .line 132
    :cond_1d
    return-void
.end method

.method private getLocationHref(I)Ljava/lang/String;
    .registers 4
    .param p1, "pos"    # I

    .prologue
    .line 139
    if-ltz p1, :cond_a

    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_c

    .line 140
    :cond_a
    const/4 v0, 0x0

    .line 142
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;->getHref()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method


# virtual methods
.method public addLocation(Ljava/lang/String;)V
    .registers 3
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v0, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;

    invoke-direct {v0, p1}, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->addLocation(Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;)V

    .line 136
    return-void
.end method

.method public addLocation(Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;)V
    .registers 5
    .param p1, "location"    # Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;

    .prologue
    .line 108
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_21

    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;->getHref()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    iget v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 120
    :goto_20
    return-void

    .line 112
    :cond_21
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    .line 113
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    if-eq v0, v1, :cond_3b

    .line 114
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 119
    :goto_34
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    goto :goto_20

    .line 116
    :cond_3b
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    invoke-direct {p0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->checkHistorySize()V

    goto :goto_34
.end method

.method public addLocation(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 90
    if-nez p1, :cond_3

    .line 94
    :goto_2
    return-void

    .line 93
    :cond_3
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->addLocation(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public getCurrentHref()Ljava/lang/String;
    .registers 3

    .prologue
    .line 188
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    if-ltz v0, :cond_e

    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    iget-object v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_10

    .line 189
    :cond_e
    const/4 v0, 0x0

    .line 191
    :goto_f
    return-object v0

    :cond_10
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory$Location;->getHref()Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method public getCurrentPos()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    return v0
.end method

.method public getCurrentSize()I
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    return v0
.end method

.method public getHistoryWaitTime()J
    .registers 3

    .prologue
    .line 82
    iget-wide v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->historyWaitTime:J

    return-wide v0
.end method

.method public getMaxHistorySize()I
    .registers 2

    .prologue
    .line 199
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->maxHistorySize:I

    return v0
.end method

.method public initBook(Lnl/siegmann/epublib/domain/Book;)V
    .registers 3
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 64
    if-nez p1, :cond_3

    .line 73
    :cond_2
    :goto_2
    return-void

    .line 67
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->locations:Ljava/util/List;

    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    .line 70
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 71
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    invoke-virtual {v0}, Lnl/siegmann/epublib/browsersupport/Navigator;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->addLocation(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public move(I)Z
    .registers 4
    .param p1, "delta"    # I

    .prologue
    .line 156
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/2addr v0, p1

    if-ltz v0, :cond_c

    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/2addr v0, p1

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentSize:I

    if-lt v0, v1, :cond_e

    .line 158
    :cond_c
    const/4 v0, 0x0

    .line 162
    :goto_d
    return v0

    .line 160
    :cond_e
    iget v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    add-int/2addr v0, p1

    iput v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    .line 161
    iget-object v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->navigator:Lnl/siegmann/epublib/browsersupport/Navigator;

    iget v1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->currentPos:I

    invoke-direct {p0, v1}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->getLocationHref(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lnl/siegmann/epublib/browsersupport/Navigator;->gotoResource(Ljava/lang/String;Ljava/lang/Object;)I

    .line 162
    const/4 v0, 0x1

    goto :goto_d
.end method

.method public navigationPerformed(Lnl/siegmann/epublib/browsersupport/NavigationEvent;)V
    .registers 6
    .param p1, "navigationEvent"    # Lnl/siegmann/epublib/browsersupport/NavigationEvent;

    .prologue
    .line 171
    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getSource()Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_7

    .line 185
    :cond_6
    :goto_6
    return-void

    .line 174
    :cond_7
    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 178
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->lastUpdateTime:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->historyWaitTime:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_2c

    .line 180
    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getOldResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->addLocation(Lnl/siegmann/epublib/domain/Resource;)V

    .line 182
    invoke-virtual {p1}, Lnl/siegmann/epublib/browsersupport/NavigationEvent;->getCurrentResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->addLocation(Ljava/lang/String;)V

    .line 184
    :cond_2c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->lastUpdateTime:J

    goto :goto_6
.end method

.method public setHistoryWaitTime(J)V
    .registers 3
    .param p1, "historyWaitTime"    # J

    .prologue
    .line 86
    iput-wide p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->historyWaitTime:J

    .line 87
    return-void
.end method

.method public setMaxHistorySize(I)V
    .registers 2
    .param p1, "maxHistorySize"    # I

    .prologue
    .line 195
    iput p1, p0, Lnl/siegmann/epublib/browsersupport/NavigationHistory;->maxHistorySize:I

    .line 196
    return-void
.end method
