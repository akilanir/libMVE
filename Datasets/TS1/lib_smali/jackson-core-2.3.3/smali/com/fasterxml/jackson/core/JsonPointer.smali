.class public Lcom/fasterxml/jackson/core/JsonPointer;
.super Ljava/lang/Object;
.source "JsonPointer.java"


# static fields
.field protected static final EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;


# instance fields
.field protected final _asString:Ljava/lang/String;

.field protected final _matchingElementIndex:I

.field protected final _matchingPropertyName:Ljava/lang/String;

.field protected final _nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 58
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 60
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V
    .registers 5

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 69
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    .line 70
    invoke-static {p2}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    .line 71
    return-void
.end method

.method private static _appendEscape(Ljava/lang/StringBuilder;C)V
    .registers 4

    .prologue
    const/16 v0, 0x7e

    .line 260
    const/16 v1, 0x30

    if-ne p1, v1, :cond_b

    move p1, v0

    .line 267
    :goto_7
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 268
    return-void

    .line 262
    :cond_b
    const/16 v1, 0x31

    if-ne p1, v1, :cond_12

    .line 263
    const/16 p1, 0x2f

    goto :goto_7

    .line 265
    :cond_12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7
.end method

.method private static final _parseIndex(Ljava/lang/String;)I
    .registers 7

    .prologue
    const/16 v5, 0xa

    const/4 v0, -0x1

    .line 186
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 189
    if-eqz v2, :cond_b

    if-le v2, v5, :cond_c

    .line 204
    :cond_b
    :goto_b
    return v0

    .line 192
    :cond_c
    const/4 v1, 0x0

    :goto_d
    if-ge v1, v2, :cond_20

    .line 193
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 194
    const/16 v4, 0x39

    if-gt v1, v4, :cond_b

    const/16 v4, 0x30

    if-lt v1, v4, :cond_b

    .line 192
    add-int/lit8 v1, v3, 0x1

    goto :goto_d

    .line 198
    :cond_20
    if-ne v2, v5, :cond_2d

    .line 199
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 200
    const-wide/32 v3, 0x7fffffff

    cmp-long v1, v1, v3

    if-gtz v1, :cond_b

    .line 204
    :cond_2d
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_b
.end method

.method protected static _parseQuotedTail(Ljava/lang/String;I)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 7

    .prologue
    .line 236
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 237
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v0, 0x10

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 238
    const/4 v0, 0x2

    if-le p1, v0, :cond_18

    .line 239
    const/4 v0, 0x1

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v3, p0, v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 241
    :cond_18
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v3, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    move v1, v0

    .line 242
    :goto_22
    if-ge v1, v2, :cond_55

    .line 243
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 244
    const/16 v4, 0x2f

    if-ne v0, v4, :cond_3e

    .line 245
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v1

    invoke-direct {v0, p0, v2, v1}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    .line 256
    :goto_3d
    return-object v0

    .line 248
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    .line 249
    const/16 v4, 0x7e

    if-ne v0, v4, :cond_51

    if-ge v1, v2, :cond_51

    .line 250
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v3, v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_appendEscape(Ljava/lang/StringBuilder;C)V

    move v1, v0

    .line 251
    goto :goto_22

    .line 253
    :cond_51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 256
    :cond_55
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    goto :goto_3d
.end method

.method protected static _parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 6

    .prologue
    const/4 v2, 0x1

    .line 208
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    move v1, v2

    .line 211
    :goto_6
    if-ge v1, v3, :cond_31

    .line 212
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 213
    const/16 v0, 0x2f

    if-ne v4, v0, :cond_22

    .line 214
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v1

    invoke-direct {v0, p0, v2, v1}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    .line 225
    :goto_21
    return-object v0

    .line 217
    :cond_22
    add-int/lit8 v0, v1, 0x1

    .line 219
    const/16 v1, 0x7e

    if-ne v4, v1, :cond_2f

    if-ge v0, v3, :cond_2f

    .line 220
    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseQuotedTail(Ljava/lang/String;I)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    goto :goto_21

    :cond_2f
    move v1, v0

    .line 223
    goto :goto_6

    .line 225
    :cond_31
    new-instance v0, Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    invoke-direct {v0, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonPointer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonPointer;)V

    goto :goto_21
.end method

.method public static compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 91
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_b

    .line 92
    :cond_8
    sget-object v0, Lcom/fasterxml/jackson/core/JsonPointer;->EMPTY:Lcom/fasterxml/jackson/core/JsonPointer;

    .line 98
    :goto_a
    return-object v0

    .line 95
    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-eq v0, v1, :cond_33

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid input: JSON Pointer expression must start with \'/\': \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_33
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->_parseTail(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    goto :goto_a
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 2

    .prologue
    .line 105
    invoke-static {p0}, Lcom/fasterxml/jackson/core/JsonPointer;->compile(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 173
    if-ne p1, p0, :cond_5

    const/4 v0, 0x1

    .line 176
    :cond_4
    :goto_4
    return v0

    .line 174
    :cond_5
    if-eqz p1, :cond_4

    .line 175
    instance-of v1, p1, Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v1, :cond_4

    .line 176
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    check-cast p1, Lcom/fasterxml/jackson/core/JsonPointer;

    iget-object v1, p1, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_4
.end method

.method public getMatchingIndex()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    return v0
.end method

.method public getMatchingProperty()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public matchElement(I)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 3

    .prologue
    .line 149
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ne p1, v0, :cond_6

    if-gez p1, :cond_8

    .line 150
    :cond_6
    const/4 v0, 0x0

    .line 152
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    goto :goto_7
.end method

.method public matchProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 3

    .prologue
    .line 142
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 143
    :cond_c
    const/4 v0, 0x0

    .line 145
    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    goto :goto_d
.end method

.method public matches()Z
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public mayMatchElement()Z
    .registers 2

    .prologue
    .line 139
    iget v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingElementIndex:I

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public mayMatchProperty()Z
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_matchingPropertyName:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public tail()Lcom/fasterxml/jackson/core/JsonPointer;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_nextSegment:Lcom/fasterxml/jackson/core/JsonPointer;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/fasterxml/jackson/core/JsonPointer;->_asString:Ljava/lang/String;

    return-object v0
.end method
