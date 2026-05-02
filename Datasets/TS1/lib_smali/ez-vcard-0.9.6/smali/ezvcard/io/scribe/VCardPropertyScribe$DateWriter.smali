.class public Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;
.super Ljava/lang/Object;
.source "VCardPropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/scribe/VCardPropertyScribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "DateWriter"
.end annotation


# instance fields
.field private date:Ljava/util/Date;

.field private extended:Z

.field private hasTime:Z

.field private utc:Z


# direct methods
.method public constructor <init>(Ljava/util/Date;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    const/4 v1, 0x1

    .line 1022
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1014
    iput-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->hasTime:Z

    .line 1015
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended:Z

    .line 1016
    iput-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc:Z

    .line 1023
    iput-object p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->date:Ljava/util/Date;

    .line 1024
    return-void
.end method


# virtual methods
.method public extended(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;
    .registers 2
    .param p1, "extended"    # Z

    .prologue
    .line 1044
    iput-boolean p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended:Z

    .line 1045
    return-object p0
.end method

.method public time(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;
    .registers 2
    .param p1, "hasTime"    # Z

    .prologue
    .line 1033
    iput-boolean p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->hasTime:Z

    .line 1034
    return-object p0
.end method

.method public utc(Z)Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;
    .registers 2
    .param p1, "utc"    # Z

    .prologue
    .line 1056
    iput-boolean p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc:Z

    .line 1057
    return-object p0
.end method

.method public write()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1066
    iget-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->hasTime:Z

    if-eqz v1, :cond_22

    .line 1067
    iget-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->utc:Z

    if-eqz v1, :cond_18

    .line 1068
    iget-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended:Z

    if-eqz v1, :cond_15

    sget-object v0, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    .line 1076
    .local v0, "format":Lezvcard/util/VCardDateFormat;
    :goto_e
    iget-object v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->date:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lezvcard/util/VCardDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1068
    .end local v0    # "format":Lezvcard/util/VCardDateFormat;
    :cond_15
    sget-object v0, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    goto :goto_e

    .line 1070
    :cond_18
    iget-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended:Z

    if-eqz v1, :cond_1f

    sget-object v0, Lezvcard/util/VCardDateFormat;->DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    .restart local v0    # "format":Lezvcard/util/VCardDateFormat;
    :goto_1e
    goto :goto_e

    .end local v0    # "format":Lezvcard/util/VCardDateFormat;
    :cond_1f
    sget-object v0, Lezvcard/util/VCardDateFormat;->DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    goto :goto_1e

    .line 1073
    :cond_22
    iget-boolean v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$DateWriter;->extended:Z

    if-eqz v1, :cond_29

    sget-object v0, Lezvcard/util/VCardDateFormat;->DATE_EXTENDED:Lezvcard/util/VCardDateFormat;

    .restart local v0    # "format":Lezvcard/util/VCardDateFormat;
    :goto_28
    goto :goto_e

    .end local v0    # "format":Lezvcard/util/VCardDateFormat;
    :cond_29
    sget-object v0, Lezvcard/util/VCardDateFormat;->DATE_BASIC:Lezvcard/util/VCardDateFormat;

    goto :goto_28
.end method
