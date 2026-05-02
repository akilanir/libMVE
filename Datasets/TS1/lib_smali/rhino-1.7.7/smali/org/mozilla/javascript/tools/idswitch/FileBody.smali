.class public Lorg/mozilla/javascript/tools/idswitch/FileBody;
.super Ljava/lang/Object;
.source "FileBody.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
    }
.end annotation


# instance fields
.field private buffer:[C

.field private bufferEnd:I

.field firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

.field lastReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

.field private lineBegin:I

.field private lineEnd:I

.field private lineNumber:I

.field private nextLineStart:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0x4000

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    return-void
.end method

.method private static equals(Ljava/lang/String;[CII)Z
    .registers 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    const/4 v2, 0x0

    .line 148
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v4, p3, p2

    if-ne v3, v4, :cond_15

    .line 149
    move v0, p2

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_b
    if-eq v0, p3, :cond_1b

    .line 150
    aget-char v3, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_16

    .line 154
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_15
    :goto_15
    return v2

    .line 149
    .restart local v0    # "i":I
    .restart local v1    # "j":I
    :cond_16
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 152
    :cond_1b
    const/4 v2, 0x1

    goto :goto_15
.end method


# virtual methods
.method public getBuffer()[C
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    return-object v0
.end method

.method public getLineBegin()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineBegin:I

    return v0
.end method

.method public getLineEnd()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineEnd:I

    return v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineNumber:I

    return v0
.end method

.method public nextLine()Z
    .registers 8

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0xa

    const/4 v2, 0x0

    .line 123
    iget v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    iget v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    if-ne v3, v4, :cond_e

    .line 124
    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineNumber:I

    .line 143
    :goto_d
    return v2

    .line 126
    :cond_e
    const/4 v0, 0x0

    .line 127
    .local v0, "c":I
    iget v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    .local v1, "i":I
    :goto_11
    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    if-eq v1, v2, :cond_1d

    .line 128
    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    aget-char v0, v2, v1

    .line 129
    if-eq v0, v5, :cond_1d

    if-ne v0, v6, :cond_31

    .line 131
    :cond_1d
    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineBegin:I

    .line 132
    iput v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineEnd:I

    .line 133
    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    if-ne v1, v2, :cond_34

    .line 134
    iput v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    .line 142
    :goto_29
    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineNumber:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineNumber:I

    .line 143
    const/4 v2, 0x1

    goto :goto_d

    .line 127
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 136
    :cond_34
    if-ne v0, v6, :cond_49

    add-int/lit8 v2, v1, 0x1

    iget v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    if-eq v2, v3, :cond_49

    iget-object v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    add-int/lit8 v3, v1, 0x1

    aget-char v2, v2, v3

    if-ne v2, v5, :cond_49

    .line 137
    add-int/lit8 v2, v1, 0x2

    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    goto :goto_29

    .line 140
    :cond_49
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    goto :goto_29
.end method

.method public readData(Ljava/io/Reader;)V
    .registers 9
    .param p1, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 42
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    array-length v0, v4

    .line 43
    .local v0, "capacity":I
    const/4 v2, 0x0

    .line 45
    .local v2, "offset":I
    :cond_5
    :goto_5
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    sub-int v5, v0, v2

    invoke-virtual {p1, v4, v2, v5}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .line 46
    .local v1, "n_read":I
    if-gez v1, :cond_12

    .line 55
    iput v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    .line 56
    return-void

    .line 47
    :cond_12
    add-int/2addr v2, v1

    .line 48
    if-ne v0, v2, :cond_5

    .line 49
    mul-int/lit8 v0, v0, 0x2

    .line 50
    new-array v3, v0, [C

    .line 51
    .local v3, "tmp":[C
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    invoke-static {v4, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    iput-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    goto :goto_5
.end method

.method public setReplacement(IILjava/lang/String;)Z
    .registers 8
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    invoke-static {p3, v3, p1, p2}, Lorg/mozilla/javascript/tools/idswitch/FileBody;->equals(Ljava/lang/String;[CII)Z

    move-result v3

    if-eqz v3, :cond_a

    const/4 v3, 0x0

    .line 108
    :goto_9
    return v3

    .line 83
    :cond_a
    new-instance v1, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    invoke-direct {v1, p1, p2, p3}, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;-><init>(IILjava/lang/String;)V

    .line 84
    .local v1, "item":Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    if-nez v3, :cond_19

    .line 85
    iput-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lastReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    iput-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 108
    :cond_17
    :goto_17
    const/4 v3, 0x1

    goto :goto_9

    .line 87
    :cond_19
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    iget v3, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->begin:I

    if-ge p1, v3, :cond_26

    .line 88
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    iput-object v3, v1, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 89
    iput-object v1, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_17

    .line 92
    :cond_26
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 93
    .local v0, "cursor":Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
    iget-object v2, v0, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 94
    .local v2, "next":Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
    :goto_2a
    if-eqz v2, :cond_34

    .line 95
    iget v3, v2, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->begin:I

    if-ge p1, v3, :cond_3b

    .line 96
    iput-object v2, v1, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 97
    iput-object v1, v0, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .line 103
    :cond_34
    if-nez v2, :cond_17

    .line 104
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lastReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    iput-object v1, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_17

    .line 100
    :cond_3b
    move-object v0, v2

    .line 101
    iget-object v2, v2, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_2a
.end method

.method public startLineLoop()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 118
    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineNumber:I

    .line 119
    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->nextLineStart:I

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineEnd:I

    iput v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->lineBegin:I

    .line 120
    return-void
.end method

.method public wasModified()Z
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public writeData(Ljava/io/Writer;)V
    .registers 7
    .param p1, "w"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    const/4 v1, 0x0

    .line 64
    .local v1, "offset":I
    iget-object v3, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->firstReplace:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    .local v3, "x":Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;
    :goto_3
    if-eqz v3, :cond_1a

    .line 65
    iget v4, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->begin:I

    sub-int v0, v4, v1

    .line 66
    .local v0, "before_replace":I
    if-lez v0, :cond_10

    .line 67
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    invoke-virtual {p1, v4, v1, v0}, Ljava/io/Writer;->write([CII)V

    .line 69
    :cond_10
    iget-object v4, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->replacement:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 70
    iget v1, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->end:I

    .line 64
    iget-object v3, v3, Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;->next:Lorg/mozilla/javascript/tools/idswitch/FileBody$ReplaceItem;

    goto :goto_3

    .line 72
    .end local v0    # "before_replace":I
    :cond_1a
    iget v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    sub-int v2, v4, v1

    .line 73
    .local v2, "tail":I
    if-eqz v2, :cond_25

    .line 74
    iget-object v4, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    invoke-virtual {p1, v4, v1, v2}, Ljava/io/Writer;->write([CII)V

    .line 76
    :cond_25
    return-void
.end method

.method public writeInitialData(Ljava/io/Writer;)V
    .registers 5
    .param p1, "w"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->buffer:[C

    const/4 v1, 0x0

    iget v2, p0, Lorg/mozilla/javascript/tools/idswitch/FileBody;->bufferEnd:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/Writer;->write([CII)V

    .line 60
    return-void
.end method
