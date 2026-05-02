.class public Lcom/sun/mail/imap/protocol/INTERNALDATE;
.super Ljava/lang/Object;
.source "INTERNALDATE.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field private static df:Ljava/text/SimpleDateFormat;

.field private static mailDateFormat:Lkorex/mail/internet/MailDateFormat;

.field static final name:[C


# instance fields
.field protected date:Ljava/util/Date;

.field public msgno:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 63
    const/16 v0, 0xc

    new-array v0, v0, [C

    fill-array-data v0, :array_1c

    sput-object v0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->name:[C

    .line 75
    new-instance v0, Lkorex/mail/internet/MailDateFormat;

    invoke-direct {v0}, Lkorex/mail/internet/MailDateFormat;-><init>()V

    sput-object v0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    .line 99
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd-MMM-yyyy HH:mm:ss "

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->df:Ljava/text/SimpleDateFormat;

    return-void

    .line 63
    :array_1c
    .array-data 2
        0x49s
        0x4es
        0x54s
        0x45s
        0x52s
        0x4es
        0x41s
        0x4cs
        0x44s
        0x41s
        0x54s
        0x45s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 6
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v2

    iput v2, p0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->msgno:I

    .line 82
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 83
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_1a

    .line 85
    new-instance v2, Lcom/sun/mail/iap/ParsingException;

    const-string v3, "INTERNALDATE is NIL"

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 87
    :cond_1a
    :try_start_1a
    sget-object v2, Lcom/sun/mail/imap/protocol/INTERNALDATE;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    invoke-virtual {v2, v1}, Lkorex/mail/internet/MailDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->date:Ljava/util/Date;
    :try_end_22
    .catch Ljava/text/ParseException; {:try_start_1a .. :try_end_22} :catch_23

    .line 91
    return-void

    .line 88
    :catch_23
    move-exception v0

    .line 89
    .local v0, "pex":Ljava/text/ParseException;
    new-instance v2, Lcom/sun/mail/iap/ParsingException;

    const-string v3, "INTERNALDATE parse error"

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static format(Ljava/util/Date;)Ljava/lang/String;
    .registers 12
    .param p0, "d"    # Ljava/util/Date;

    .prologue
    const/16 v10, 0xa

    .line 119
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 120
    .local v4, "sb":Ljava/lang/StringBuffer;
    sget-object v7, Lcom/sun/mail/imap/protocol/INTERNALDATE;->df:Ljava/text/SimpleDateFormat;

    monitor-enter v7

    .line 121
    :try_start_a
    sget-object v6, Lcom/sun/mail/imap/protocol/INTERNALDATE;->df:Ljava/text/SimpleDateFormat;

    new-instance v8, Ljava/text/FieldPosition;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Ljava/text/FieldPosition;-><init>(I)V

    invoke-virtual {v6, p0, v4, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    .line 122
    monitor-exit v7
    :try_end_16
    .catchall {:try_start_a .. :try_end_16} :catchall_5b

    .line 125
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v5

    .line 126
    .local v5, "tz":Ljava/util/TimeZone;
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    .line 127
    .local v0, "offset":I
    div-int/lit8 v6, v0, 0x3c

    div-int/lit16 v3, v6, 0x3e8

    .line 128
    .local v3, "rawOffsetInMins":I
    if-gez v3, :cond_5e

    .line 129
    const/16 v6, 0x2d

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 130
    neg-int v3, v3

    .line 134
    :goto_2e
    div-int/lit8 v1, v3, 0x3c

    .line 135
    .local v1, "offsetInHrs":I
    rem-int/lit8 v2, v3, 0x3c

    .line 137
    .local v2, "offsetInMins":I
    div-int/lit8 v6, v1, 0xa

    invoke-static {v6, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 138
    rem-int/lit8 v6, v1, 0xa

    invoke-static {v6, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 139
    div-int/lit8 v6, v2, 0xa

    invoke-static {v6, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 140
    rem-int/lit8 v6, v2, 0xa

    invoke-static {v6, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 142
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 122
    .end local v0    # "offset":I
    .end local v1    # "offsetInHrs":I
    .end local v2    # "offsetInMins":I
    .end local v3    # "rawOffsetInMins":I
    .end local v5    # "tz":Ljava/util/TimeZone;
    :catchall_5b
    move-exception v6

    :try_start_5c
    monitor-exit v7
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5b

    throw v6

    .line 132
    .restart local v0    # "offset":I
    .restart local v3    # "rawOffsetInMins":I
    .restart local v5    # "tz":Ljava/util/TimeZone;
    :cond_5e
    const/16 v6, 0x2b

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2e
.end method


# virtual methods
.method public getDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/INTERNALDATE;->date:Ljava/util/Date;

    return-object v0
.end method
