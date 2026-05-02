.class public Lnl/siegmann/epublib/domain/Date;
.super Ljava/lang/Object;
.source "Date.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/domain/Date$Event;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x688dabf752cc9a08L


# instance fields
.field private dateString:Ljava/lang/String;

.field private event:Lnl/siegmann/epublib/domain/Date$Event;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "dateString"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x0

    check-cast v0, Lnl/siegmann/epublib/domain/Date$Event;

    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Date$Event;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "dateString"    # Ljava/lang/String;
    .param p2, "event"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-static {p1}, Lnl/siegmann/epublib/domain/Date;->checkDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Lnl/siegmann/epublib/domain/Date$Event;->fromValue(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Date$Event;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Date$Event;)V

    .line 73
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Date;->dateString:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Date$Event;)V
    .registers 3
    .param p1, "dateString"    # Ljava/lang/String;
    .param p2, "event"    # Lnl/siegmann/epublib/domain/Date$Event;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Date;->dateString:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Lnl/siegmann/epublib/domain/Date;->event:Lnl/siegmann/epublib/domain/Date$Event;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .registers 3
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 51
    const/4 v0, 0x0

    check-cast v0, Lnl/siegmann/epublib/domain/Date$Event;

    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/util/Date;Lnl/siegmann/epublib/domain/Date$Event;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/lang/String;)V
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "event"    # Ljava/lang/String;

    .prologue
    .line 68
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Lnl/siegmann/epublib/domain/Date$Event;)V
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "event"    # Lnl/siegmann/epublib/domain/Date$Event;

    .prologue
    .line 59
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Date$Event;)V

    .line 60
    return-void
.end method

.method private static checkDate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "dateString"    # Ljava/lang/String;

    .prologue
    .line 77
    if-nez p0, :cond_a

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot create a date from a blank string"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_a
    return-object p0
.end method


# virtual methods
.method public getEvent()Lnl/siegmann/epublib/domain/Date$Event;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Date;->event:Lnl/siegmann/epublib/domain/Date$Event;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Date;->dateString:Ljava/lang/String;

    return-object v0
.end method

.method public setEvent(Lnl/siegmann/epublib/domain/Date$Event;)V
    .registers 2
    .param p1, "event"    # Lnl/siegmann/epublib/domain/Date$Event;

    .prologue
    .line 90
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Date;->event:Lnl/siegmann/epublib/domain/Date$Event;

    .line 91
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 94
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Date;->event:Lnl/siegmann/epublib/domain/Date$Event;

    if-nez v0, :cond_7

    .line 95
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Date;->dateString:Ljava/lang/String;

    .line 97
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Date;->event:Lnl/siegmann/epublib/domain/Date$Event;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Date;->dateString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
