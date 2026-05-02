.class public Lcom/sun/mail/imap/protocol/FetchResponse;
.super Lcom/sun/mail/imap/protocol/IMAPResponse;
.source "FetchResponse.java"


# static fields
.field private static final HEADER:[C

.field private static final TEXT:[C


# instance fields
.field private extensionItems:Ljava/util/Map;

.field private final fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

.field private items:[Lcom/sun/mail/imap/protocol/Item;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 181
    const/4 v0, 0x7

    new-array v0, v0, [C

    fill-array-data v0, :array_12

    sput-object v0, Lcom/sun/mail/imap/protocol/FetchResponse;->HEADER:[C

    .line 182
    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_1e

    sput-object v0, Lcom/sun/mail/imap/protocol/FetchResponse;->TEXT:[C

    return-void

    .line 181
    nop

    :array_12
    .array-data 2
        0x2es
        0x48s
        0x45s
        0x41s
        0x44s
        0x45s
        0x52s
    .end array-data

    .line 182
    nop

    :array_1e
    .array-data 2
        0x2es
        0x54s
        0x45s
        0x58s
        0x54s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/iap/Protocol;)V
    .registers 3
    .param p1, "p"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;-><init>(Lcom/sun/mail/iap/Protocol;)V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    .line 75
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->parse()V

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/IMAPResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/protocol/FetchResponse;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;[Lcom/sun/mail/imap/protocol/FetchItem;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPResponse;[Lcom/sun/mail/imap/protocol/FetchItem;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/IMAPResponse;
    .param p2, "fitems"    # [Lcom/sun/mail/imap/protocol/FetchItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V

    .line 91
    iput-object p2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    .line 92
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->parse()V

    .line 93
    return-void
.end method

.method public static getItem([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;
    .registers 8
    .param p0, "r"    # [Lcom/sun/mail/iap/Response;
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/sun/mail/imap/protocol/Item;",
            ">([",
            "Lcom/sun/mail/iap/Response;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v4, 0x0

    .line 118
    if-nez p0, :cond_5

    move-object v3, v4

    .line 135
    :goto_4
    return-object v3

    .line 121
    :cond_5
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v3, p0

    if-ge v1, v3, :cond_42

    .line 123
    aget-object v3, p0, v1

    if-eqz v3, :cond_1d

    aget-object v3, p0, v1

    instance-of v3, v3, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-eqz v3, :cond_1d

    aget-object v3, p0, v1

    check-cast v3, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 125
    invoke-virtual {v3}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v3

    if-eq v3, p1, :cond_20

    .line 121
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 128
    :cond_20
    aget-object v0, p0, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 129
    .local v0, "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_25
    iget-object v3, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    array-length v3, v3

    if-ge v2, v3, :cond_1d

    .line 130
    iget-object v3, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v3, v3, v2

    invoke-virtual {p2, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 131
    iget-object v3, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v3, v3, v2

    invoke-virtual {p2, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sun/mail/imap/protocol/Item;

    goto :goto_4

    .line 129
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    .end local v0    # "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    .end local v2    # "j":I
    :cond_42
    move-object v3, v4

    .line 135
    goto :goto_4
.end method

.method public static getItems([Lcom/sun/mail/iap/Response;ILjava/lang/Class;)Ljava/util/List;
    .registers 8
    .param p0, "r"    # [Lcom/sun/mail/iap/Response;
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/sun/mail/imap/protocol/Item;",
            ">([",
            "Lcom/sun/mail/iap/Response;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 146
    .local p2, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-nez p0, :cond_8

    .line 165
    :cond_7
    return-object v2

    .line 151
    :cond_8
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    array-length v4, p0

    if-ge v1, v4, :cond_7

    .line 153
    aget-object v4, p0, v1

    if-eqz v4, :cond_20

    aget-object v4, p0, v1

    instance-of v4, v4, Lcom/sun/mail/imap/protocol/FetchResponse;

    if-eqz v4, :cond_20

    aget-object v4, p0, v1

    check-cast v4, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 155
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v4

    if-eq v4, p1, :cond_23

    .line 151
    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 158
    :cond_23
    aget-object v0, p0, v1

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchResponse;

    .line 159
    .local v0, "f":Lcom/sun/mail/imap/protocol/FetchResponse;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_28
    iget-object v4, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    array-length v4, v4

    if-ge v3, v4, :cond_20

    .line 160
    iget-object v4, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v4, v4, v3

    invoke-virtual {p2, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 161
    iget-object v4, v0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v4, v4, v3

    invoke-virtual {p2, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_42
    add-int/lit8 v3, v3, 0x1

    goto :goto_28
.end method

.method private match(Ljava/lang/String;)Z
    .registers 9
    .param p1, "itemName"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 309
    .local v4, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .local v2, "j":I
    move v3, v2

    .end local v2    # "j":I
    .local v3, "j":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_9
    if-ge v1, v4, :cond_20

    .line 312
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "j":I
    .restart local v2    # "j":I
    aget-byte v5, v5, v3

    int-to-char v5, v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    add-int/lit8 v0, v1, 0x1

    .line 313
    .end local v1    # "i":I
    .restart local v0    # "i":I
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v5, v6, :cond_29

    .line 314
    const/4 v5, 0x0

    .line 316
    :goto_1f
    return v5

    .line 315
    .end local v0    # "i":I
    .end local v2    # "j":I
    .restart local v1    # "i":I
    .restart local v3    # "j":I
    :cond_20
    iget v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    add-int/2addr v5, v4

    iput v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .line 316
    const/4 v5, 0x1

    move v2, v3

    .end local v3    # "j":I
    .restart local v2    # "j":I
    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_1f

    :cond_29
    move v3, v2

    .end local v2    # "j":I
    .restart local v3    # "j":I
    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_9
.end method

.method private match([C)Z
    .registers 9
    .param p1, "itemName"    # [C

    .prologue
    .line 290
    array-length v4, p1

    .line 291
    .local v4, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .local v2, "j":I
    move v3, v2

    .end local v2    # "j":I
    .local v3, "j":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_6
    if-ge v1, v4, :cond_1b

    .line 294
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "j":I
    .restart local v2    # "j":I
    aget-byte v5, v5, v3

    int-to-char v5, v5

    invoke-static {v5}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    aget-char v6, p1, v1

    if-eq v5, v6, :cond_24

    .line 295
    const/4 v5, 0x0

    .line 297
    :goto_1a
    return v5

    .line 296
    .end local v0    # "i":I
    .end local v2    # "j":I
    .restart local v1    # "i":I
    .restart local v3    # "j":I
    :cond_1b
    iget v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    add-int/2addr v5, v4

    iput v5, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .line 297
    const/4 v5, 0x1

    move v2, v3

    .end local v3    # "j":I
    .restart local v2    # "j":I
    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_1a

    :cond_24
    move v3, v2

    .end local v2    # "j":I
    .restart local v3    # "j":I
    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_6
.end method

.method private parse()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 186
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    iget v3, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    aget-byte v2, v2, v3

    const/16 v3, 0x28

    if-eq v2, v3, :cond_28

    .line 187
    new-instance v2, Lcom/sun/mail/iap/ParsingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error in FETCH parsing, missing \'(\' at index "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 190
    :cond_28
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v1, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/Item;>;"
    const/4 v0, 0x0

    .line 193
    .local v0, "i":Lcom/sun/mail/imap/protocol/Item;
    :cond_2e
    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .line 195
    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    iget v3, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->size:I

    if-lt v2, v3, :cond_55

    .line 196
    new-instance v2, Lcom/sun/mail/iap/ParsingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error in FETCH parsing, ran off end of buffer, size "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->size:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 199
    :cond_55
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->parseItem()Lcom/sun/mail/imap/protocol/Item;

    move-result-object v0

    .line 200
    if-eqz v0, :cond_7d

    .line 201
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    :cond_5e
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    iget v3, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    aget-byte v2, v2, v3

    const/16 v3, 0x29

    if-ne v2, v3, :cond_2e

    .line 207
    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    .line 208
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/sun/mail/imap/protocol/Item;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/sun/mail/imap/protocol/Item;

    iput-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    .line 209
    return-void

    .line 202
    :cond_7d
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->parseExtensionItem()Z

    move-result v2

    if-nez v2, :cond_5e

    .line 203
    new-instance v2, Lcom/sun/mail/iap/ParsingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error in FETCH parsing, unrecognized item at index "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private parseExtensionItem()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 270
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    if-nez v2, :cond_6

    .line 279
    :cond_5
    :goto_5
    return v1

    .line 272
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    array-length v2, v2

    if-ge v0, v2, :cond_5

    .line 273
    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/sun/mail/imap/protocol/FetchResponse;->match(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 274
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/FetchResponse;->getExtensionItems()Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->fitems:[Lcom/sun/mail/imap/protocol/FetchItem;

    aget-object v3, v3, v0

    .line 275
    invoke-virtual {v3, p0}, Lcom/sun/mail/imap/protocol/FetchItem;->parseItem(Lcom/sun/mail/imap/protocol/FetchResponse;)Ljava/lang/Object;

    move-result-object v3

    .line 274
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    const/4 v1, 0x1

    goto :goto_5

    .line 272
    :cond_33
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method private parseItem()Lcom/sun/mail/imap/protocol/Item;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    aget-byte v1, v1, v2

    sparse-switch v1, :sswitch_data_ae

    .line 263
    :cond_9
    const/4 v1, 0x0

    :goto_a
    return-object v1

    .line 219
    :sswitch_b
    sget-object v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 220
    new-instance v1, Lcom/sun/mail/imap/protocol/ENVELOPE;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/ENVELOPE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 223
    :sswitch_19
    sget-object v1, Lcom/sun/mail/imap/protocol/FLAGS;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 224
    new-instance v1, Lcom/sun/mail/imap/protocol/FLAGS;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/FLAGS;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V

    goto :goto_a

    .line 227
    :sswitch_27
    sget-object v1, Lcom/sun/mail/imap/protocol/INTERNALDATE;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 228
    new-instance v1, Lcom/sun/mail/imap/protocol/INTERNALDATE;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/INTERNALDATE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 231
    :sswitch_35
    sget-object v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 232
    new-instance v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 233
    :cond_43
    sget-object v1, Lcom/sun/mail/imap/protocol/BODY;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 234
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->buffer:[B

    iget v2, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->index:I

    aget-byte v1, v1, v2

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_5b

    .line 235
    new-instance v1, Lcom/sun/mail/imap/protocol/BODY;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/BODY;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 237
    :cond_5b
    new-instance v1, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 241
    :sswitch_61
    sget-object v1, Lcom/sun/mail/imap/protocol/RFC822SIZE;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 242
    new-instance v1, Lcom/sun/mail/imap/protocol/RFC822SIZE;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/RFC822SIZE;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto :goto_a

    .line 243
    :cond_6f
    sget-object v1, Lcom/sun/mail/imap/protocol/RFC822DATA;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 244
    const/4 v0, 0x0

    .line 245
    .local v0, "isHeader":Z
    sget-object v1, Lcom/sun/mail/imap/protocol/FetchResponse;->HEADER:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 246
    const/4 v0, 0x1

    .line 249
    :cond_81
    :goto_81
    new-instance v1, Lcom/sun/mail/imap/protocol/RFC822DATA;

    invoke-direct {v1, p0, v0}, Lcom/sun/mail/imap/protocol/RFC822DATA;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;Z)V

    goto :goto_a

    .line 247
    :cond_87
    sget-object v1, Lcom/sun/mail/imap/protocol/FetchResponse;->TEXT:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_81

    goto :goto_81

    .line 253
    .end local v0    # "isHeader":Z
    :sswitch_90
    sget-object v1, Lcom/sun/mail/imap/protocol/UID;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 254
    new-instance v1, Lcom/sun/mail/imap/protocol/UID;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/UID;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto/16 :goto_a

    .line 257
    :sswitch_9f
    sget-object v1, Lcom/sun/mail/imap/protocol/MODSEQ;->name:[C

    invoke-direct {p0, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->match([C)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 258
    new-instance v1, Lcom/sun/mail/imap/protocol/MODSEQ;

    invoke-direct {v1, p0}, Lcom/sun/mail/imap/protocol/MODSEQ;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V

    goto/16 :goto_a

    .line 217
    :sswitch_data_ae
    .sparse-switch
        0x42 -> :sswitch_35
        0x45 -> :sswitch_b
        0x46 -> :sswitch_19
        0x49 -> :sswitch_27
        0x4d -> :sswitch_9f
        0x52 -> :sswitch_61
        0x55 -> :sswitch_90
        0x62 -> :sswitch_35
        0x65 -> :sswitch_b
        0x66 -> :sswitch_19
        0x69 -> :sswitch_27
        0x6d -> :sswitch_9f
        0x72 -> :sswitch_61
        0x75 -> :sswitch_90
    .end sparse-switch
.end method


# virtual methods
.method public getExtensionItems()Ljava/util/Map;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->extensionItems:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->extensionItems:Ljava/util/Map;

    .line 178
    :cond_b
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->extensionItems:Ljava/util/Map;

    return-object v0
.end method

.method public getItem(I)Lcom/sun/mail/imap/protocol/Item;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getItem(Ljava/lang/Class;)Lcom/sun/mail/imap/protocol/Item;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/sun/mail/imap/protocol/Item;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    array-length v1, v1

    if-ge v0, v1, :cond_1e

    .line 105
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 106
    iget-object v1, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/protocol/Item;

    .line 109
    :goto_1a
    return-object v1

    .line 104
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 109
    :cond_1e
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchResponse;->items:[Lcom/sun/mail/imap/protocol/Item;

    array-length v0, v0

    return v0
.end method
