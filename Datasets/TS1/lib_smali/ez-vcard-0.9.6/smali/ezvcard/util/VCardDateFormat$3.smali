.class final enum Lezvcard/util/VCardDateFormat$3;
.super Lezvcard/util/VCardDateFormat;
.source "VCardDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/util/VCardDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p3, "x0"    # Ljava/lang/String;
    .param p4, "x1"    # Ljava/lang/String;

    .prologue
    .line 125
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lezvcard/util/VCardDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lezvcard/util/VCardDateFormat$1;)V

    return-void
.end method


# virtual methods
.method public getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;
    .registers 3
    .param p1, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 131
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    .line 132
    invoke-super {p0, p1}, Lezvcard/util/VCardDateFormat;->getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method
