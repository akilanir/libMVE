.class final enum Lezvcard/util/VCardDateFormat$1;
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
    .line 72
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
    .registers 4
    .param p1, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 78
    new-instance v0, Lezvcard/util/VCardDateFormat$1$1;

    iget-object v1, p0, Lezvcard/util/VCardDateFormat$1;->formatStr:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lezvcard/util/VCardDateFormat$1$1;-><init>(Lezvcard/util/VCardDateFormat$1;Ljava/lang/String;)V

    .line 100
    .local v0, "df":Ljava/text/DateFormat;
    if-eqz p1, :cond_c

    .line 101
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 104
    :cond_c
    return-object v0
.end method
