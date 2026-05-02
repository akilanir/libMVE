.class Lorg/jsoup/parser/Tokeniser;
.super Ljava/lang/Object;
.source "Tokeniser.java"


# static fields
.field static final replacementChar:C = '\ufffd'


# instance fields
.field private charBuffer:Ljava/lang/StringBuilder;

.field commentPending:Lorg/jsoup/parser/Token$Comment;

.field dataBuffer:Ljava/lang/StringBuilder;

.field doctypePending:Lorg/jsoup/parser/Token$Doctype;

.field private emitPending:Lorg/jsoup/parser/Token;

.field private errors:Lorg/jsoup/parser/ParseErrorList;

.field private isEmitPending:Z

.field private lastStartTag:Lorg/jsoup/parser/Token$StartTag;

.field private reader:Lorg/jsoup/parser/CharacterReader;

.field private selfClosingFlagAcknowledged:Z

.field private state:Lorg/jsoup/parser/TokeniserState;

.field tagPending:Lorg/jsoup/parser/Token$Tag;


# direct methods
.method constructor <init>(Lorg/jsoup/parser/CharacterReader;Lorg/jsoup/parser/ParseErrorList;)V
    .registers 4
    .param p1, "reader"    # Lorg/jsoup/parser/CharacterReader;
    .param p2, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    sget-object v0, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 31
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    .line 32
    iput-object p2, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    .line 33
    return-void
.end method

.method private characterReferenceError(Ljava/lang/String;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 212
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 213
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    const-string v3, "Invalid character reference: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-direct {v1, v2, v3, v4}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 214
    :cond_20
    return-void
.end method

.method private error(Ljava/lang/String;)V
    .registers 5
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 218
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    invoke-direct {v1, v2, p1}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 219
    :cond_18
    return-void
.end method


# virtual methods
.method acknowledgeSelfClosingFlag()V
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 102
    return-void
.end method

.method advanceTransition(Lorg/jsoup/parser/TokeniserState;)V
    .registers 3
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v0}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 97
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 98
    return-void
.end method

.method appropriateEndTagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 198
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Lorg/jsoup/parser/Token$StartTag;

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method consumeCharacterReference(Ljava/lang/Character;Z)[C
    .registers 15
    .param p1, "additionalAllowedCharacter"    # Ljava/lang/Character;
    .param p2, "inAttribute"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 105
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 157
    :cond_b
    :goto_b
    return-object v7

    .line 107
    :cond_c
    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v10

    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v11}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v11

    if-eq v10, v11, :cond_b

    .line 109
    :cond_1a
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const/4 v11, 0x7

    new-array v11, v11, [C

    fill-array-data v11, :array_122

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchesAny([C)Z

    move-result v10

    if-nez v10, :cond_b

    .line 112
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->mark()V

    .line 113
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v11, "#"

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a4

    .line 114
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v11, "X"

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 115
    .local v3, "isHexMode":Z
    if-eqz v3, :cond_58

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->consumeHexSequence()Ljava/lang/String;

    move-result-object v6

    .line 116
    .local v6, "numRef":Ljava/lang/String;
    :goto_47
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_5f

    .line 117
    const-string v8, "numeric reference with no numerals"

    invoke-direct {p0, v8}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 118
    iget-object v8, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v8}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    goto :goto_b

    .line 115
    .end local v6    # "numRef":Ljava/lang/String;
    :cond_58
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->consumeDigitSequence()Ljava/lang/String;

    move-result-object v6

    goto :goto_47

    .line 121
    .restart local v6    # "numRef":Ljava/lang/String;
    :cond_5f
    iget-object v7, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v10, ";"

    invoke-virtual {v7, v10}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_6e

    .line 122
    const-string v7, "missing semicolon"

    invoke-direct {p0, v7}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 123
    :cond_6e
    const/4 v1, -0x1

    .line 125
    .local v1, "charval":I
    if-eqz v3, :cond_9b

    const/16 v0, 0x10

    .line 126
    .local v0, "base":I
    :goto_73
    :try_start_73
    invoke-static {v6, v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_7a
    .catch Ljava/lang/NumberFormatException; {:try_start_73 .. :try_end_7a} :catch_11f

    move-result v1

    .line 129
    :goto_7b
    const/4 v7, -0x1

    if-eq v1, v7, :cond_8d

    const v7, 0xd800

    if-lt v1, v7, :cond_88

    const v7, 0xdfff

    if-le v1, v7, :cond_8d

    :cond_88
    const v7, 0x10ffff

    if-le v1, v7, :cond_9e

    .line 130
    :cond_8d
    const-string v7, "character outside of valid range"

    invoke-direct {p0, v7}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 131
    new-array v7, v9, [C

    const v9, 0xfffd

    aput-char v9, v7, v8

    goto/16 :goto_b

    .line 125
    .end local v0    # "base":I
    :cond_9b
    const/16 v0, 0xa

    goto :goto_73

    .line 135
    .restart local v0    # "base":I
    :cond_9e
    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v7

    goto/16 :goto_b

    .line 139
    .end local v0    # "base":I
    .end local v1    # "charval":I
    .end local v3    # "isHexMode":Z
    .end local v6    # "numRef":Ljava/lang/String;
    :cond_a4
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->consumeLetterThenDigitSequence()Ljava/lang/String;

    move-result-object v5

    .line 140
    .local v5, "nameRef":Ljava/lang/String;
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const/16 v11, 0x3b

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matches(C)Z

    move-result v4

    .line 142
    .local v4, "looksLegit":Z
    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->isBaseNamedEntity(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_c0

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->isNamedEntity(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d9

    if-eqz v4, :cond_d9

    :cond_c0
    move v2, v9

    .line 144
    .local v2, "found":Z
    :goto_c1
    if-nez v2, :cond_db

    .line 145
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    .line 146
    if-eqz v4, :cond_b

    .line 147
    const-string v10, "invalid named referenece \'%s\'"

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v5, v9, v8

    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    goto/16 :goto_b

    .end local v2    # "found":Z
    :cond_d9
    move v2, v8

    .line 142
    goto :goto_c1

    .line 150
    .restart local v2    # "found":Z
    :cond_db
    if-eqz p2, :cond_102

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->matchesLetter()Z

    move-result v10

    if-nez v10, :cond_fb

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->matchesDigit()Z

    move-result v10

    if-nez v10, :cond_fb

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const/4 v11, 0x3

    new-array v11, v11, [C

    fill-array-data v11, :array_12e

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchesAny([C)Z

    move-result v10

    if-eqz v10, :cond_102

    .line 152
    :cond_fb
    iget-object v8, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v8}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    goto/16 :goto_b

    .line 155
    :cond_102
    iget-object v7, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v10, ";"

    invoke-virtual {v7, v10}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_111

    .line 156
    const-string v7, "missing semicolon"

    invoke-direct {p0, v7}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 157
    :cond_111
    new-array v7, v9, [C

    invoke-static {v5}, Lorg/jsoup/nodes/Entities;->getCharacterByName(Ljava/lang/String;)Ljava/lang/Character;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Character;->charValue()C

    move-result v9

    aput-char v9, v7, v8

    goto/16 :goto_b

    .line 127
    .end local v2    # "found":Z
    .end local v4    # "looksLegit":Z
    .end local v5    # "nameRef":Ljava/lang/String;
    .restart local v0    # "base":I
    .restart local v1    # "charval":I
    .restart local v3    # "isHexMode":Z
    .restart local v6    # "numRef":Ljava/lang/String;
    :catch_11f
    move-exception v7

    goto/16 :goto_7b

    .line 109
    :array_122
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x3cs
        0x26s
    .end array-data

    .line 150
    nop

    :array_12e
    .array-data 2
        0x3ds
        0x2ds
        0x5fs
    .end array-data
.end method

.method createCommentPending()V
    .registers 2

    .prologue
    .line 172
    new-instance v0, Lorg/jsoup/parser/Token$Comment;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$Comment;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    .line 173
    return-void
.end method

.method createDoctypePending()V
    .registers 2

    .prologue
    .line 180
    new-instance v0, Lorg/jsoup/parser/Token$Doctype;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$Doctype;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    .line 181
    return-void
.end method

.method createTagPending(Z)Lorg/jsoup/parser/Token$Tag;
    .registers 3
    .param p1, "start"    # Z

    .prologue
    .line 162
    if-eqz p1, :cond_c

    new-instance v0, Lorg/jsoup/parser/Token$StartTag;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$StartTag;-><init>()V

    :goto_7
    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    .line 163
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    return-object v0

    .line 162
    :cond_c
    new-instance v0, Lorg/jsoup/parser/Token$EndTag;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$EndTag;-><init>()V

    goto :goto_7
.end method

.method createTempBuffer()V
    .registers 2

    .prologue
    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    .line 189
    return-void
.end method

.method currentNodeInHtmlNS()Z
    .registers 2

    .prologue
    .line 223
    const/4 v0, 0x1

    return v0
.end method

.method emit(C)V
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 84
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    return-void
.end method

.method emit(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 76
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    return-void
.end method

.method emit(Lorg/jsoup/parser/Token;)V
    .registers 6
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 56
    iget-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    const-string v3, "There is an unread token pending!"

    invoke-static {v2, v3}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 58
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->emitPending:Lorg/jsoup/parser/Token;

    .line 59
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 61
    iget-object v2, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v3, Lorg/jsoup/parser/Token$TokenType;->StartTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v2, v3, :cond_1f

    move-object v1, p1

    .line 62
    check-cast v1, Lorg/jsoup/parser/Token$StartTag;

    .line 63
    .local v1, "startTag":Lorg/jsoup/parser/Token$StartTag;
    iput-object v1, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Lorg/jsoup/parser/Token$StartTag;

    .line 64
    iget-boolean v2, v1, Lorg/jsoup/parser/Token$StartTag;->selfClosing:Z

    if-eqz v2, :cond_1e

    .line 65
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 71
    .end local v1    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_1e
    :goto_1e
    return-void

    .line 66
    :cond_1f
    iget-object v2, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v3, Lorg/jsoup/parser/Token$TokenType;->EndTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v2, v3, :cond_1e

    move-object v0, p1

    .line 67
    check-cast v0, Lorg/jsoup/parser/Token$EndTag;

    .line 68
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    iget-object v2, v0, Lorg/jsoup/parser/Token$EndTag;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v2, :cond_1e

    .line 69
    const-string v2, "Attributes incorrectly present on end tag"

    invoke-direct {p0, v2}, Lorg/jsoup/parser/Tokeniser;->error(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method emit([C)V
    .registers 3
    .param p1, "chars"    # [C

    .prologue
    .line 80
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 81
    return-void
.end method

.method emitCommentPending()V
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 177
    return-void
.end method

.method emitDoctypePending()V
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 185
    return-void
.end method

.method emitTagPending()V
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Tag;->finaliseTag()V

    .line 168
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 169
    return-void
.end method

.method eofError(Lorg/jsoup/parser/TokeniserState;)V
    .registers 8
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 208
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    const-string v3, "Unexpectedly reached end of file (EOF) in input state [%s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-direct {v1, v2, v3, v4}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 209
    :cond_20
    return-void
.end method

.method error(Lorg/jsoup/parser/TokeniserState;)V
    .registers 9
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 203
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    const-string v3, "Unexpected character \'%s\' in input state [%s]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v6}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-direct {v1, v2, v3, v4}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 204
    :cond_2d
    return-void
.end method

.method getState()Lorg/jsoup/parser/TokeniserState;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    return-object v0
.end method

.method isAppropriateEndTagToken()Z
    .registers 3

    .prologue
    .line 192
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Lorg/jsoup/parser/Token$StartTag;

    if-nez v0, :cond_6

    .line 193
    const/4 v0, 0x0

    .line 194
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    iget-object v0, v0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Lorg/jsoup/parser/Token$StartTag;

    iget-object v1, v1, Lorg/jsoup/parser/Token$StartTag;->tagName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method read()Lorg/jsoup/parser/Token;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 36
    iget-boolean v1, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    if-nez v1, :cond_d

    .line 37
    const-string v1, "Self closing flag not acknowledged"

    invoke-direct {p0, v1}, Lorg/jsoup/parser/Tokeniser;->error(Ljava/lang/String;)V

    .line 38
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 41
    :cond_d
    :goto_d
    iget-boolean v1, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    if-nez v1, :cond_19

    .line 42
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v1, p0, v2}, Lorg/jsoup/parser/TokeniserState;->read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V

    goto :goto_d

    .line 45
    :cond_19
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_38

    .line 46
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v1, v3, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 48
    new-instance v1, Lorg/jsoup/parser/Token$Character;

    invoke-direct {v1, v0}, Lorg/jsoup/parser/Token$Character;-><init>(Ljava/lang/String;)V

    .line 51
    .end local v0    # "str":Ljava/lang/String;
    :goto_37
    return-object v1

    .line 50
    :cond_38
    iput-boolean v3, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 51
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->emitPending:Lorg/jsoup/parser/Token;

    goto :goto_37
.end method

.method transition(Lorg/jsoup/parser/TokeniserState;)V
    .registers 2
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 92
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 93
    return-void
.end method

.method unescapeEntities(Z)Ljava/lang/String;
    .registers 6
    .param p1, "inAttribute"    # Z

    .prologue
    const/16 v3, 0x26

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_7
    :goto_7
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_37

    .line 236
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/CharacterReader;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 238
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    .line 239
    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1}, Lorg/jsoup/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[C

    move-result-object v1

    .line 240
    .local v1, "c":[C
    if-eqz v1, :cond_2f

    array-length v2, v1

    if-nez v2, :cond_33

    .line 241
    :cond_2f
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 243
    :cond_33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 246
    .end local v1    # "c":[C
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
