.class public Lcom/sun/mail/imap/protocol/SearchSequence;
.super Ljava/lang/Object;
.source "SearchSequence.java"


# static fields
.field private static monthTable:[Ljava/lang/String;


# instance fields
.field protected cal:Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 381
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Jan"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Feb"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Mar"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Apr"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "May"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Jun"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Jul"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Aug"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "Sep"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "Oct"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Nov"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Dec"

    aput-object v2, v0, v1

    sput-object v0, Lcom/sun/mail/imap/protocol/SearchSequence;->monthTable:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 387
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/SearchSequence;->cal:Ljava/util/Calendar;

    return-void
.end method

.method public static isAscii(Ljava/lang/String;)Z
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 165
    .local v1, "l":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_14

    .line 166
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x7f

    if-le v2, v3, :cond_11

    .line 167
    const/4 v2, 0x0

    .line 169
    :goto_10
    return v2

    .line 165
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 169
    :cond_14
    const/4 v2, 0x1

    goto :goto_10
.end method

.method public static isAscii(Lkorex/mail/search/SearchTerm;)Z
    .registers 2
    .param p0, "term"    # Lkorex/mail/search/SearchTerm;

    .prologue
    .line 133
    instance-of v0, p0, Lkorex/mail/search/AndTerm;

    if-eqz v0, :cond_f

    .line 134
    check-cast p0, Lkorex/mail/search/AndTerm;

    .end local p0    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0}, Lkorex/mail/search/AndTerm;->getTerms()[Lkorex/mail/search/SearchTerm;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii([Lkorex/mail/search/SearchTerm;)Z

    move-result v0

    .line 145
    :goto_e
    return v0

    .line 135
    .restart local p0    # "term":Lkorex/mail/search/SearchTerm;
    :cond_f
    instance-of v0, p0, Lkorex/mail/search/OrTerm;

    if-eqz v0, :cond_1e

    .line 136
    check-cast p0, Lkorex/mail/search/OrTerm;

    .end local p0    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0}, Lkorex/mail/search/OrTerm;->getTerms()[Lkorex/mail/search/SearchTerm;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii([Lkorex/mail/search/SearchTerm;)Z

    move-result v0

    goto :goto_e

    .line 137
    .restart local p0    # "term":Lkorex/mail/search/SearchTerm;
    :cond_1e
    instance-of v0, p0, Lkorex/mail/search/NotTerm;

    if-eqz v0, :cond_2d

    .line 138
    check-cast p0, Lkorex/mail/search/NotTerm;

    .end local p0    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0}, Lkorex/mail/search/NotTerm;->getTerm()Lkorex/mail/search/SearchTerm;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii(Lkorex/mail/search/SearchTerm;)Z

    move-result v0

    goto :goto_e

    .line 139
    .restart local p0    # "term":Lkorex/mail/search/SearchTerm;
    :cond_2d
    instance-of v0, p0, Lkorex/mail/search/StringTerm;

    if-eqz v0, :cond_3c

    .line 140
    check-cast p0, Lkorex/mail/search/StringTerm;

    .end local p0    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0}, Lkorex/mail/search/StringTerm;->getPattern()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii(Ljava/lang/String;)Z

    move-result v0

    goto :goto_e

    .line 141
    .restart local p0    # "term":Lkorex/mail/search/SearchTerm;
    :cond_3c
    instance-of v0, p0, Lkorex/mail/search/AddressTerm;

    if-eqz v0, :cond_4f

    .line 142
    check-cast p0, Lkorex/mail/search/AddressTerm;

    .end local p0    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0}, Lkorex/mail/search/AddressTerm;->getAddress()Lkorex/mail/Address;

    move-result-object v0

    invoke-virtual {v0}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii(Ljava/lang/String;)Z

    move-result v0

    goto :goto_e

    .line 145
    .restart local p0    # "term":Lkorex/mail/search/SearchTerm;
    :cond_4f
    const/4 v0, 0x1

    goto :goto_e
.end method

.method public static isAscii([Lkorex/mail/search/SearchTerm;)Z
    .registers 3
    .param p0, "terms"    # [Lkorex/mail/search/SearchTerm;

    .prologue
    .line 153
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_11

    .line 154
    aget-object v1, p0, v0

    invoke-static {v1}, Lcom/sun/mail/imap/protocol/SearchSequence;->isAscii(Lkorex/mail/search/SearchTerm;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 155
    const/4 v1, 0x0

    .line 156
    :goto_d
    return v1

    .line 153
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 156
    :cond_11
    const/4 v1, 0x1

    goto :goto_d
.end method


# virtual methods
.method protected and(Lkorex/mail/search/AndTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 7
    .param p1, "term"    # Lkorex/mail/search/AndTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-virtual {p1}, Lkorex/mail/search/AndTerm;->getTerms()[Lkorex/mail/search/SearchTerm;

    move-result-object v2

    .line 177
    .local v2, "terms":[Lkorex/mail/search/SearchTerm;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-virtual {p0, v3, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v1

    .line 179
    .local v1, "result":Lcom/sun/mail/iap/Argument;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_c
    array-length v3, v2

    if-ge v0, v3, :cond_1b

    .line 180
    aget-object v3, v2, v0

    invoke-virtual {p0, v3, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/sun/mail/iap/Argument;->append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 179
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 181
    :cond_1b
    return-object v1
.end method

.method protected body(Lkorex/mail/search/BodyTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lkorex/mail/search/BodyTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 345
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "BODY"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 346
    invoke-virtual {p1}, Lkorex/mail/search/BodyTerm;->getPattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 347
    return-object v0
.end method

.method protected flag(Lkorex/mail/search/FlagTerm;)Lcom/sun/mail/iap/Argument;
    .registers 10
    .param p1, "term"    # Lkorex/mail/search/FlagTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-virtual {p1}, Lkorex/mail/search/FlagTerm;->getTestSet()Z

    move-result v3

    .line 275
    .local v3, "set":Z
    new-instance v2, Lcom/sun/mail/iap/Argument;

    invoke-direct {v2}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 277
    .local v2, "result":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p1}, Lkorex/mail/search/FlagTerm;->getFlags()Lkorex/mail/Flags;

    move-result-object v0

    .line 278
    .local v0, "flags":Lkorex/mail/Flags;
    invoke-virtual {v0}, Lkorex/mail/Flags;->getSystemFlags()[Lkorex/mail/Flags$Flag;

    move-result-object v4

    .line 279
    .local v4, "sf":[Lkorex/mail/Flags$Flag;
    invoke-virtual {v0}, Lkorex/mail/Flags;->getUserFlags()[Ljava/lang/String;

    move-result-object v5

    .line 280
    .local v5, "uf":[Ljava/lang/String;
    array-length v6, v4

    if-nez v6, :cond_23

    array-length v6, v5

    if-nez v6, :cond_23

    .line 281
    new-instance v6, Lkorex/mail/search/SearchException;

    const-string v7, "Invalid FlagTerm"

    invoke-direct {v6, v7}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 283
    :cond_23
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_24
    array-length v6, v4

    if-ge v1, v6, :cond_8f

    .line 284
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_3a

    .line 285
    if-eqz v3, :cond_37

    const-string v6, "DELETED"

    :goto_31
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 283
    :cond_34
    :goto_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 285
    :cond_37
    const-string v6, "UNDELETED"

    goto :goto_31

    .line 286
    :cond_3a
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_4b

    .line 287
    if-eqz v3, :cond_48

    const-string v6, "ANSWERED"

    :goto_44
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_34

    :cond_48
    const-string v6, "UNANSWERED"

    goto :goto_44

    .line 288
    :cond_4b
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->DRAFT:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_5c

    .line 289
    if-eqz v3, :cond_59

    const-string v6, "DRAFT"

    :goto_55
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_34

    :cond_59
    const-string v6, "UNDRAFT"

    goto :goto_55

    .line 290
    :cond_5c
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->FLAGGED:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_6d

    .line 291
    if-eqz v3, :cond_6a

    const-string v6, "FLAGGED"

    :goto_66
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_34

    :cond_6a
    const-string v6, "UNFLAGGED"

    goto :goto_66

    .line 292
    :cond_6d
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_7e

    .line 293
    if-eqz v3, :cond_7b

    const-string v6, "RECENT"

    :goto_77
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_34

    :cond_7b
    const-string v6, "OLD"

    goto :goto_77

    .line 294
    :cond_7e
    aget-object v6, v4, v1

    sget-object v7, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    if-ne v6, v7, :cond_34

    .line 295
    if-eqz v3, :cond_8c

    const-string v6, "SEEN"

    :goto_88
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_34

    :cond_8c
    const-string v6, "UNSEEN"

    goto :goto_88

    .line 298
    :cond_8f
    const/4 v1, 0x0

    :goto_90
    array-length v6, v5

    if-ge v1, v6, :cond_a5

    .line 299
    if-eqz v3, :cond_a2

    const-string v6, "KEYWORD"

    :goto_97
    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 300
    aget-object v6, v5, v1

    invoke-virtual {v2, v6}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 298
    add-int/lit8 v1, v1, 0x1

    goto :goto_90

    .line 299
    :cond_a2
    const-string v6, "UNKEYWORD"

    goto :goto_97

    .line 303
    :cond_a5
    return-object v2
.end method

.method protected from(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 309
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "FROM"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 310
    invoke-virtual {v0, p1, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 311
    return-object v0
.end method

.method public generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 7
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    instance-of v2, p1, Lkorex/mail/search/AndTerm;

    if-eqz v2, :cond_b

    .line 77
    check-cast p1, Lkorex/mail/search/AndTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->and(Lkorex/mail/search/AndTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    .line 123
    :goto_a
    return-object v2

    .line 78
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_b
    instance-of v2, p1, Lkorex/mail/search/OrTerm;

    if-eqz v2, :cond_16

    .line 79
    check-cast p1, Lkorex/mail/search/OrTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->or(Lkorex/mail/search/OrTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 80
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_16
    instance-of v2, p1, Lkorex/mail/search/NotTerm;

    if-eqz v2, :cond_21

    .line 81
    check-cast p1, Lkorex/mail/search/NotTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->not(Lkorex/mail/search/NotTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 82
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_21
    instance-of v2, p1, Lkorex/mail/search/HeaderTerm;

    if-eqz v2, :cond_2c

    .line 83
    check-cast p1, Lkorex/mail/search/HeaderTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->header(Lkorex/mail/search/HeaderTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 84
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_2c
    instance-of v2, p1, Lkorex/mail/search/FlagTerm;

    if-eqz v2, :cond_37

    .line 85
    check-cast p1, Lkorex/mail/search/FlagTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->flag(Lkorex/mail/search/FlagTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 86
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_37
    instance-of v2, p1, Lkorex/mail/search/FromTerm;

    if-eqz v2, :cond_4b

    move-object v0, p1

    .line 87
    check-cast v0, Lkorex/mail/search/FromTerm;

    .line 88
    .local v0, "fterm":Lkorex/mail/search/FromTerm;
    invoke-virtual {v0}, Lkorex/mail/search/FromTerm;->getAddress()Lkorex/mail/Address;

    move-result-object v2

    invoke-virtual {v2}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->from(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 90
    .end local v0    # "fterm":Lkorex/mail/search/FromTerm;
    :cond_4b
    instance-of v2, p1, Lkorex/mail/search/FromStringTerm;

    if-eqz v2, :cond_5b

    move-object v0, p1

    .line 91
    check-cast v0, Lkorex/mail/search/FromStringTerm;

    .line 92
    .local v0, "fterm":Lkorex/mail/search/FromStringTerm;
    invoke-virtual {v0}, Lkorex/mail/search/FromStringTerm;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->from(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 94
    .end local v0    # "fterm":Lkorex/mail/search/FromStringTerm;
    :cond_5b
    instance-of v2, p1, Lkorex/mail/search/RecipientTerm;

    if-eqz v2, :cond_73

    move-object v1, p1

    .line 95
    check-cast v1, Lkorex/mail/search/RecipientTerm;

    .line 96
    .local v1, "rterm":Lkorex/mail/search/RecipientTerm;
    invoke-virtual {v1}, Lkorex/mail/search/RecipientTerm;->getRecipientType()Lkorex/mail/Message$RecipientType;

    move-result-object v2

    .line 97
    invoke-virtual {v1}, Lkorex/mail/search/RecipientTerm;->getAddress()Lkorex/mail/Address;

    move-result-object v3

    invoke-virtual {v3}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v3

    .line 96
    invoke-virtual {p0, v2, v3, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->recipient(Lkorex/mail/Message$RecipientType;Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 100
    .end local v1    # "rterm":Lkorex/mail/search/RecipientTerm;
    :cond_73
    instance-of v2, p1, Lkorex/mail/search/RecipientStringTerm;

    if-eqz v2, :cond_87

    move-object v1, p1

    .line 101
    check-cast v1, Lkorex/mail/search/RecipientStringTerm;

    .line 102
    .local v1, "rterm":Lkorex/mail/search/RecipientStringTerm;
    invoke-virtual {v1}, Lkorex/mail/search/RecipientStringTerm;->getRecipientType()Lkorex/mail/Message$RecipientType;

    move-result-object v2

    .line 103
    invoke-virtual {v1}, Lkorex/mail/search/RecipientStringTerm;->getPattern()Ljava/lang/String;

    move-result-object v3

    .line 102
    invoke-virtual {p0, v2, v3, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->recipient(Lkorex/mail/Message$RecipientType;Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto :goto_a

    .line 106
    .end local v1    # "rterm":Lkorex/mail/search/RecipientStringTerm;
    :cond_87
    instance-of v2, p1, Lkorex/mail/search/SubjectTerm;

    if-eqz v2, :cond_93

    .line 107
    check-cast p1, Lkorex/mail/search/SubjectTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->subject(Lkorex/mail/search/SubjectTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 108
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_93
    instance-of v2, p1, Lkorex/mail/search/BodyTerm;

    if-eqz v2, :cond_9f

    .line 109
    check-cast p1, Lkorex/mail/search/BodyTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->body(Lkorex/mail/search/BodyTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 110
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_9f
    instance-of v2, p1, Lkorex/mail/search/SizeTerm;

    if-eqz v2, :cond_ab

    .line 111
    check-cast p1, Lkorex/mail/search/SizeTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->size(Lkorex/mail/search/SizeTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 112
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_ab
    instance-of v2, p1, Lkorex/mail/search/SentDateTerm;

    if-eqz v2, :cond_b7

    .line 113
    check-cast p1, Lkorex/mail/search/SentDateTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->sentdate(Lkorex/mail/search/DateTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 114
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_b7
    instance-of v2, p1, Lkorex/mail/search/ReceivedDateTerm;

    if-eqz v2, :cond_c3

    .line 115
    check-cast p1, Lkorex/mail/search/ReceivedDateTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->receiveddate(Lkorex/mail/search/DateTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 116
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_c3
    instance-of v2, p1, Lcom/sun/mail/imap/OlderTerm;

    if-eqz v2, :cond_cf

    .line 117
    check-cast p1, Lcom/sun/mail/imap/OlderTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->older(Lcom/sun/mail/imap/OlderTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 118
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_cf
    instance-of v2, p1, Lcom/sun/mail/imap/YoungerTerm;

    if-eqz v2, :cond_db

    .line 119
    check-cast p1, Lcom/sun/mail/imap/YoungerTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->younger(Lcom/sun/mail/imap/YoungerTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 120
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_db
    instance-of v2, p1, Lkorex/mail/search/MessageIDTerm;

    if-eqz v2, :cond_e7

    .line 121
    check-cast p1, Lkorex/mail/search/MessageIDTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->messageid(Lkorex/mail/search/MessageIDTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 122
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_e7
    instance-of v2, p1, Lcom/sun/mail/imap/ModifiedSinceTerm;

    if-eqz v2, :cond_f3

    .line 123
    check-cast p1, Lcom/sun/mail/imap/ModifiedSinceTerm;

    .end local p1    # "term":Lkorex/mail/search/SearchTerm;
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/protocol/SearchSequence;->modifiedSince(Lcom/sun/mail/imap/ModifiedSinceTerm;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    goto/16 :goto_a

    .line 125
    .restart local p1    # "term":Lkorex/mail/search/SearchTerm;
    :cond_f3
    new-instance v2, Lkorex/mail/search/SearchException;

    const-string v3, "Search too complex"

    invoke-direct {v2, v3}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected header(Lkorex/mail/search/HeaderTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lkorex/mail/search/HeaderTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 256
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "HEADER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 257
    invoke-virtual {p1}, Lkorex/mail/search/HeaderTerm;->getHeaderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 258
    invoke-virtual {p1}, Lkorex/mail/search/HeaderTerm;->getPattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 259
    return-object v0
.end method

.method protected messageid(Lkorex/mail/search/MessageIDTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lkorex/mail/search/MessageIDTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 265
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "HEADER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 266
    const-string v1, "Message-ID"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 268
    invoke-virtual {p1}, Lkorex/mail/search/MessageIDTerm;->getPattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 269
    return-object v0
.end method

.method protected modifiedSince(Lcom/sun/mail/imap/ModifiedSinceTerm;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lcom/sun/mail/imap/ModifiedSinceTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 494
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 495
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "MODSEQ"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 496
    invoke-virtual {p1}, Lcom/sun/mail/imap/ModifiedSinceTerm;->getModSeq()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/sun/mail/iap/Argument;->writeNumber(J)Lcom/sun/mail/iap/Argument;

    .line 497
    return-object v0
.end method

.method protected not(Lkorex/mail/search/NotTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p1, "term"    # Lkorex/mail/search/NotTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 237
    .local v1, "result":Lcom/sun/mail/iap/Argument;
    const-string v2, "NOT"

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 244
    invoke-virtual {p1}, Lkorex/mail/search/NotTerm;->getTerm()Lkorex/mail/search/SearchTerm;

    move-result-object v0

    .line 245
    .local v0, "nterm":Lkorex/mail/search/SearchTerm;
    instance-of v2, v0, Lkorex/mail/search/AndTerm;

    if-nez v2, :cond_16

    instance-of v2, v0, Lkorex/mail/search/FlagTerm;

    if-eqz v2, :cond_1e

    .line 246
    :cond_16
    invoke-virtual {p0, v0, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 250
    :goto_1d
    return-object v1

    .line 248
    :cond_1e
    invoke-virtual {p0, v0, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_1d
.end method

.method protected older(Lcom/sun/mail/imap/OlderTerm;)Lcom/sun/mail/iap/Argument;
    .registers 4
    .param p1, "term"    # Lcom/sun/mail/imap/OlderTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 469
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 470
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "OLDER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 471
    invoke-virtual {p1}, Lcom/sun/mail/imap/OlderTerm;->getInterval()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeNumber(I)Lcom/sun/mail/iap/Argument;

    .line 472
    return-object v0
.end method

.method protected or(Lkorex/mail/search/OrTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 12
    .param p1, "term"    # Lkorex/mail/search/OrTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 186
    invoke-virtual {p1}, Lkorex/mail/search/OrTerm;->getTerms()[Lkorex/mail/search/SearchTerm;

    move-result-object v4

    .line 192
    .local v4, "terms":[Lkorex/mail/search/SearchTerm;
    array-length v5, v4

    const/4 v6, 0x2

    if-le v5, v6, :cond_22

    .line 193
    aget-object v2, v4, v8

    .line 196
    .local v2, "t":Lkorex/mail/search/SearchTerm;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_d
    array-length v5, v4

    if-ge v0, v5, :cond_1b

    .line 197
    new-instance v3, Lkorex/mail/search/OrTerm;

    aget-object v5, v4, v0

    invoke-direct {v3, v2, v5}, Lkorex/mail/search/OrTerm;-><init>(Lkorex/mail/search/SearchTerm;Lkorex/mail/search/SearchTerm;)V

    .line 196
    .end local v2    # "t":Lkorex/mail/search/SearchTerm;
    .local v3, "t":Lkorex/mail/search/SearchTerm;
    add-int/lit8 v0, v0, 0x1

    move-object v2, v3

    .end local v3    # "t":Lkorex/mail/search/SearchTerm;
    .restart local v2    # "t":Lkorex/mail/search/SearchTerm;
    goto :goto_d

    :cond_1b
    move-object p1, v2

    .line 199
    check-cast p1, Lkorex/mail/search/OrTerm;

    .line 201
    invoke-virtual {p1}, Lkorex/mail/search/OrTerm;->getTerms()[Lkorex/mail/search/SearchTerm;

    move-result-object v4

    .line 205
    .end local v0    # "i":I
    .end local v2    # "t":Lkorex/mail/search/SearchTerm;
    :cond_22
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 208
    .local v1, "result":Lcom/sun/mail/iap/Argument;
    array-length v5, v4

    if-le v5, v7, :cond_2f

    .line 209
    const-string v5, "OR"

    invoke-virtual {v1, v5}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 216
    :cond_2f
    aget-object v5, v4, v8

    instance-of v5, v5, Lkorex/mail/search/AndTerm;

    if-nez v5, :cond_3b

    aget-object v5, v4, v8

    instance-of v5, v5, Lkorex/mail/search/FlagTerm;

    if-eqz v5, :cond_5d

    .line 217
    :cond_3b
    aget-object v5, v4, v8

    invoke-virtual {p0, v5, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 222
    :goto_44
    array-length v5, v4

    if-le v5, v7, :cond_5c

    .line 223
    aget-object v5, v4, v7

    instance-of v5, v5, Lkorex/mail/search/AndTerm;

    if-nez v5, :cond_53

    aget-object v5, v4, v7

    instance-of v5, v5, Lkorex/mail/search/FlagTerm;

    if-eqz v5, :cond_67

    .line 224
    :cond_53
    aget-object v5, v4, v7

    invoke-virtual {p0, v5, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 229
    :cond_5c
    :goto_5c
    return-object v1

    .line 219
    :cond_5d
    aget-object v5, v4, v8

    invoke-virtual {p0, v5, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/sun/mail/iap/Argument;->append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_44

    .line 226
    :cond_67
    aget-object v5, v4, v7

    invoke-virtual {p0, v5, p2}, Lcom/sun/mail/imap/protocol/SearchSequence;->generateSequence(Lkorex/mail/search/SearchTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/sun/mail/iap/Argument;->append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_5c
.end method

.method protected receiveddate(Lkorex/mail/search/DateTerm;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p1, "term"    # Lkorex/mail/search/DateTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 434
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 435
    .local v1, "result":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p1}, Lkorex/mail/search/DateTerm;->getDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/SearchSequence;->toIMAPDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 437
    .local v0, "date":Ljava/lang/String;
    invoke-virtual {p1}, Lkorex/mail/search/DateTerm;->getComparison()I

    move-result v2

    packed-switch v2, :pswitch_data_bc

    .line 457
    new-instance v2, Lkorex/mail/search/SearchException;

    const-string v3, "Cannot handle Date Comparison"

    invoke-direct {v2, v3}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 439
    :pswitch_1c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SINCE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 460
    :goto_32
    return-object v1

    .line 442
    :pswitch_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 445
    :pswitch_4a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BEFORE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 448
    :pswitch_61
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OR SINCE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 451
    :pswitch_82
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OR BEFORE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 454
    :pswitch_a3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NOT ON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto/16 :goto_32

    .line 437
    nop

    :pswitch_data_bc
    .packed-switch 0x1
        :pswitch_82
        :pswitch_4a
        :pswitch_33
        :pswitch_a3
        :pswitch_1c
        :pswitch_61
    .end packed-switch
.end method

.method protected recipient(Lkorex/mail/Message$RecipientType;Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 7
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 317
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 319
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_12

    .line 320
    const-string v1, "TO"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 328
    :goto_e
    invoke-virtual {v0, p2, p3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 329
    return-object v0

    .line 321
    :cond_12
    sget-object v1, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_1c

    .line 322
    const-string v1, "CC"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_e

    .line 323
    :cond_1c
    sget-object v1, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_26

    .line 324
    const-string v1, "BCC"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_e

    .line 326
    :cond_26
    new-instance v1, Lkorex/mail/search/SearchException;

    const-string v2, "Illegal Recipient type"

    invoke-direct {v1, v2}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected sentdate(Lkorex/mail/search/DateTerm;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p1, "term"    # Lkorex/mail/search/DateTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 403
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 404
    .local v1, "result":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p1}, Lkorex/mail/search/DateTerm;->getDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/sun/mail/imap/protocol/SearchSequence;->toIMAPDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 406
    .local v0, "date":Ljava/lang/String;
    invoke-virtual {p1}, Lkorex/mail/search/DateTerm;->getComparison()I

    move-result v2

    packed-switch v2, :pswitch_data_bc

    .line 426
    new-instance v2, Lkorex/mail/search/SearchException;

    const-string v3, "Cannot handle Date Comparison"

    invoke-direct {v2, v3}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 408
    :pswitch_1c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SENTSINCE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 429
    :goto_32
    return-object v1

    .line 411
    :pswitch_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SENTON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 414
    :pswitch_4a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SENTBEFORE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 417
    :pswitch_61
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OR SENTSINCE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " SENTON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 420
    :pswitch_82
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "OR SENTBEFORE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " SENTON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_32

    .line 423
    :pswitch_a3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NOT SENTON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto/16 :goto_32

    .line 406
    nop

    :pswitch_data_bc
    .packed-switch 0x1
        :pswitch_82
        :pswitch_4a
        :pswitch_33
        :pswitch_a3
        :pswitch_1c
        :pswitch_61
    .end packed-switch
.end method

.method protected size(Lkorex/mail/search/SizeTerm;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lkorex/mail/search/SizeTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 352
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 354
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p1}, Lkorex/mail/search/SizeTerm;->getComparison()I

    move-result v1

    packed-switch v1, :pswitch_data_28

    .line 363
    :pswitch_c
    new-instance v1, Lkorex/mail/search/SearchException;

    const-string v2, "Cannot handle Comparison"

    invoke-direct {v1, v2}, Lkorex/mail/search/SearchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 356
    :pswitch_14
    const-string v1, "LARGER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 366
    :goto_19
    invoke-virtual {p1}, Lkorex/mail/search/SizeTerm;->getNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeNumber(I)Lcom/sun/mail/iap/Argument;

    .line 367
    return-object v0

    .line 359
    :pswitch_21
    const-string v1, "SMALLER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_19

    .line 354
    nop

    :pswitch_data_28
    .packed-switch 0x2
        :pswitch_21
        :pswitch_c
        :pswitch_c
        :pswitch_14
    .end packed-switch
.end method

.method protected subject(Lkorex/mail/search/SubjectTerm;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "term"    # Lkorex/mail/search/SubjectTerm;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 334
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 336
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "SUBJECT"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 337
    invoke-virtual {p1}, Lkorex/mail/search/SubjectTerm;->getPattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 338
    return-object v0
.end method

.method protected toIMAPDate(Ljava/util/Date;)Ljava/lang/String;
    .registers 6
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 390
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 392
    .local v0, "s":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/SearchSequence;->cal:Ljava/util/Calendar;

    invoke-virtual {v1, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 394
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/SearchSequence;->cal:Ljava/util/Calendar;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 395
    sget-object v1, Lcom/sun/mail/imap/protocol/SearchSequence;->monthTable:[Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/imap/protocol/SearchSequence;->cal:Ljava/util/Calendar;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 396
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/SearchSequence;->cal:Ljava/util/Calendar;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 398
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected younger(Lcom/sun/mail/imap/YoungerTerm;)Lcom/sun/mail/iap/Argument;
    .registers 4
    .param p1, "term"    # Lcom/sun/mail/imap/YoungerTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/search/SearchException;
        }
    .end annotation

    .prologue
    .line 481
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 482
    .local v0, "result":Lcom/sun/mail/iap/Argument;
    const-string v1, "YOUNGER"

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 483
    invoke-virtual {p1}, Lcom/sun/mail/imap/YoungerTerm;->getInterval()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeNumber(I)Lcom/sun/mail/iap/Argument;

    .line 484
    return-object v0
.end method
