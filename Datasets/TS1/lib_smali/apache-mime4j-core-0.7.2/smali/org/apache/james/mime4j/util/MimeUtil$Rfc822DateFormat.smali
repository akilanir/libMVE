.class final Lorg/apache/james/mime4j/util/MimeUtil$Rfc822DateFormat;
.super Ljava/text/SimpleDateFormat;
.source "MimeUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/james/mime4j/util/MimeUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Rfc822DateFormat"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 289
    const-string v0, "EEE, d MMM yyyy HH:mm:ss "

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 290
    return-void
.end method


# virtual methods
.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .registers 12
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "toAppendTo"    # Ljava/lang/StringBuffer;
    .param p3, "pos"    # Ljava/text/FieldPosition;

    .prologue
    .line 295
    invoke-super {p0, p1, p2, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    move-result-object v2

    .line 297
    .local v2, "sb":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lorg/apache/james/mime4j/util/MimeUtil$Rfc822DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0xf

    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 298
    .local v3, "zoneMillis":I
    iget-object v4, p0, Lorg/apache/james/mime4j/util/MimeUtil$Rfc822DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 299
    .local v0, "dstMillis":I
    add-int v4, v3, v0

    div-int/lit16 v4, v4, 0x3e8

    div-int/lit8 v1, v4, 0x3c

    .line 301
    .local v1, "minutes":I
    if-gez v1, :cond_41

    .line 302
    const/16 v4, 0x2d

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 303
    neg-int v1, v1

    .line 308
    :goto_22
    const-string v4, "%02d%02d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    div-int/lit8 v7, v1, 0x3c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    rem-int/lit8 v7, v1, 0x3c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 310
    return-object v2

    .line 305
    :cond_41
    const/16 v4, 0x2b

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_22
.end method
