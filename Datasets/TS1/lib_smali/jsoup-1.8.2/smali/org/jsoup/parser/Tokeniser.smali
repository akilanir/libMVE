.class final Lorg/jsoup/parser/Tokeniser;
.super Ljava/lang/Object;
.source "Tokeniser.java"


# static fields
.field private static final notCharRefCharsSorted:[C

.field static final replacementChar:C = '\ufffd'


# instance fields
.field charPending:Lorg/jsoup/parser/Token$Character;

.field private final charRefHolder:[C

.field private charsBuilder:Ljava/lang/StringBuilder;

.field private charsString:Ljava/lang/String;

.field commentPending:Lorg/jsoup/parser/Token$Comment;

.field dataBuffer:Ljava/lang/StringBuilder;

.field doctypePending:Lorg/jsoup/parser/Token$Doctype;

.field private emitPending:Lorg/jsoup/parser/Token;

.field endPending:Lorg/jsoup/parser/Token$EndTag;

.field private errors:Lorg/jsoup/parser/ParseErrorList;

.field private isEmitPending:Z

.field private lastStartTag:Ljava/lang/String;

.field private reader:Lorg/jsoup/parser/CharacterReader;

.field private selfClosingFlagAcknowledged:Z

.field startPending:Lorg/jsoup/parser/Token$StartTag;

.field private state:Lorg/jsoup/parser/TokeniserState;

.field tagPending:Lorg/jsoup/parser/Token$Tag;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x7

    new-array v0, v0, [C

    fill-array-data v0, :array_e

    sput-object v0, Lorg/jsoup/parser/Tokeniser;->notCharRefCharsSorted:[C

    .line 16
    sget-object v0, Lorg/jsoup/parser/Tokeniser;->notCharRefCharsSorted:[C

    invoke-static {v0}, Ljava/util/Arrays;->sort([C)V

    .line 17
    return-void

    .line 13
    :array_e
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x3cs
        0x26s
    .end array-data
.end method

.method constructor <init>(Lorg/jsoup/parser/CharacterReader;Lorg/jsoup/parser/ParseErrorList;)V
    .registers 6
    .param p1, "reader"    # Lorg/jsoup/parser/CharacterReader;
    .param p2, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    const/16 v2, 0x400

    const/4 v1, 0x1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    sget-object v0, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    .line 30
    new-instance v0, Lorg/jsoup/parser/Token$StartTag;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$StartTag;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->startPending:Lorg/jsoup/parser/Token$StartTag;

    .line 31
    new-instance v0, Lorg/jsoup/parser/Token$EndTag;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$EndTag;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->endPending:Lorg/jsoup/parser/Token$EndTag;

    .line 32
    new-instance v0, Lorg/jsoup/parser/Token$Character;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$Character;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charPending:Lorg/jsoup/parser/Token$Character;

    .line 33
    new-instance v0, Lorg/jsoup/parser/Token$Doctype;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$Doctype;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    .line 34
    new-instance v0, Lorg/jsoup/parser/Token$Comment;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$Comment;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    .line 36
    iput-boolean v1, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 125
    new-array v0, v1, [C

    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charRefHolder:[C

    .line 39
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    .line 40
    iput-object p2, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    .line 41
    return-void
.end method

.method private characterReferenceError(Ljava/lang/String;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 241
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 242
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

    .line 243
    :cond_20
    return-void
.end method

.method private error(Ljava/lang/String;)V
    .registers 5
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 246
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 247
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    invoke-direct {v1, v2, p1}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 248
    :cond_18
    return-void
.end method


# virtual methods
.method acknowledgeSelfClosingFlag()V
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 123
    return-void
.end method

.method advanceTransition(Lorg/jsoup/parser/TokeniserState;)V
    .registers 3
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v0}, Lorg/jsoup/parser/CharacterReader;->advance()V

    .line 118
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 119
    return-void
.end method

.method appropriateEndTagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 226
    const/4 v0, 0x0

    .line 227
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    goto :goto_5
.end method

.method consumeCharacterReference(Ljava/lang/Character;Z)[C
    .registers 16
    .param p1, "additionalAllowedCharacter"    # Ljava/lang/Character;
    .param p2, "inAttribute"    # Z

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 127
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v11}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_d

    move-object v1, v8

    .line 186
    :goto_c
    return-object v1

    .line 129
    :cond_d
    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v11

    iget-object v12, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v12}, Lorg/jsoup/parser/CharacterReader;->current()C

    move-result v12

    if-ne v11, v12, :cond_1d

    move-object v1, v8

    .line 130
    goto :goto_c

    .line 131
    :cond_1d
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    sget-object v12, Lorg/jsoup/parser/Tokeniser;->notCharRefCharsSorted:[C

    invoke-virtual {v11, v12}, Lorg/jsoup/parser/CharacterReader;->matchesAnySorted([C)Z

    move-result v11

    if-eqz v11, :cond_29

    move-object v1, v8

    .line 132
    goto :goto_c

    .line 134
    :cond_29
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->charRefHolder:[C

    .line 135
    .local v1, "charRef":[C
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v11}, Lorg/jsoup/parser/CharacterReader;->mark()V

    .line 136
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v12, "#"

    invoke-virtual {v11, v12}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_af

    .line 137
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v11, "X"

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    .line 138
    .local v4, "isHexMode":Z
    if-eqz v4, :cond_5c

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->consumeHexSequence()Ljava/lang/String;

    move-result-object v7

    .line 139
    .local v7, "numRef":Ljava/lang/String;
    :goto_4a
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_63

    .line 140
    const-string v9, "numeric reference with no numerals"

    invoke-direct {p0, v9}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 141
    iget-object v9, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v9}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    move-object v1, v8

    .line 142
    goto :goto_c

    .line 138
    .end local v7    # "numRef":Ljava/lang/String;
    :cond_5c
    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->consumeDigitSequence()Ljava/lang/String;

    move-result-object v7

    goto :goto_4a

    .line 144
    .restart local v7    # "numRef":Ljava/lang/String;
    :cond_63
    iget-object v8, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v10, ";"

    invoke-virtual {v8, v10}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_72

    .line 145
    const-string v8, "missing semicolon"

    invoke-direct {p0, v8}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 146
    :cond_72
    const/4 v2, -0x1

    .line 148
    .local v2, "charval":I
    if-eqz v4, :cond_9d

    const/16 v0, 0x10

    .line 149
    .local v0, "base":I
    :goto_77
    :try_start_77
    invoke-static {v7, v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I
    :try_end_7e
    .catch Ljava/lang/NumberFormatException; {:try_start_77 .. :try_end_7e} :catch_12a

    move-result v2

    .line 152
    :goto_7f
    const/4 v8, -0x1

    if-eq v2, v8, :cond_91

    const v8, 0xd800

    if-lt v2, v8, :cond_8c

    const v8, 0xdfff

    if-le v2, v8, :cond_91

    :cond_8c
    const v8, 0x10ffff

    if-le v2, v8, :cond_a0

    .line 153
    :cond_91
    const-string v8, "character outside of valid range"

    invoke-direct {p0, v8}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 154
    const v8, 0xfffd

    aput-char v8, v1, v9

    goto/16 :goto_c

    .line 148
    .end local v0    # "base":I
    :cond_9d
    const/16 v0, 0xa

    goto :goto_77

    .line 159
    .restart local v0    # "base":I
    :cond_a0
    const/high16 v8, 0x10000

    if-ge v2, v8, :cond_a9

    .line 160
    int-to-char v8, v2

    aput-char v8, v1, v9

    goto/16 :goto_c

    .line 163
    :cond_a9
    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    goto/16 :goto_c

    .line 167
    .end local v0    # "base":I
    .end local v2    # "charval":I
    .end local v4    # "isHexMode":Z
    .end local v7    # "numRef":Ljava/lang/String;
    :cond_af
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v11}, Lorg/jsoup/parser/CharacterReader;->consumeLetterThenDigitSequence()Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, "nameRef":Ljava/lang/String;
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const/16 v12, 0x3b

    invoke-virtual {v11, v12}, Lorg/jsoup/parser/CharacterReader;->matches(C)Z

    move-result v5

    .line 170
    .local v5, "looksLegit":Z
    invoke-static {v6}, Lorg/jsoup/nodes/Entities;->isBaseNamedEntity(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_cb

    invoke-static {v6}, Lorg/jsoup/nodes/Entities;->isNamedEntity(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_e5

    if-eqz v5, :cond_e5

    :cond_cb
    move v3, v10

    .line 172
    .local v3, "found":Z
    :goto_cc
    if-nez v3, :cond_e7

    .line 173
    iget-object v11, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v11}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    .line 174
    if-eqz v5, :cond_e2

    .line 175
    const-string v11, "invalid named referenece \'%s\'"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v6, v10, v9

    invoke-static {v11, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    :cond_e2
    move-object v1, v8

    .line 176
    goto/16 :goto_c

    .end local v3    # "found":Z
    :cond_e5
    move v3, v9

    .line 170
    goto :goto_cc

    .line 178
    .restart local v3    # "found":Z
    :cond_e7
    if-eqz p2, :cond_10f

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->matchesLetter()Z

    move-result v10

    if-nez v10, :cond_107

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v10}, Lorg/jsoup/parser/CharacterReader;->matchesDigit()Z

    move-result v10

    if-nez v10, :cond_107

    iget-object v10, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const/4 v11, 0x3

    new-array v11, v11, [C

    fill-array-data v11, :array_12e

    invoke-virtual {v10, v11}, Lorg/jsoup/parser/CharacterReader;->matchesAny([C)Z

    move-result v10

    if-eqz v10, :cond_10f

    .line 180
    :cond_107
    iget-object v9, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v9}, Lorg/jsoup/parser/CharacterReader;->rewindToMark()V

    move-object v1, v8

    .line 181
    goto/16 :goto_c

    .line 183
    :cond_10f
    iget-object v8, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    const-string v10, ";"

    invoke-virtual {v8, v10}, Lorg/jsoup/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_11e

    .line 184
    const-string v8, "missing semicolon"

    invoke-direct {p0, v8}, Lorg/jsoup/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;)V

    .line 185
    :cond_11e
    invoke-static {v6}, Lorg/jsoup/nodes/Entities;->getCharacterByName(Ljava/lang/String;)Ljava/lang/Character;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Character;->charValue()C

    move-result v8

    aput-char v8, v1, v9

    goto/16 :goto_c

    .line 150
    .end local v3    # "found":Z
    .end local v5    # "looksLegit":Z
    .end local v6    # "nameRef":Ljava/lang/String;
    .restart local v0    # "base":I
    .restart local v2    # "charval":I
    .restart local v4    # "isHexMode":Z
    .restart local v7    # "numRef":Ljava/lang/String;
    :catch_12a
    move-exception v8

    goto/16 :goto_7f

    .line 178
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
    .line 201
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Comment;->reset()Lorg/jsoup/parser/Token;

    .line 202
    return-void
.end method

.method createDoctypePending()V
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Doctype;->reset()Lorg/jsoup/parser/Token;

    .line 210
    return-void
.end method

.method createTagPending(Z)Lorg/jsoup/parser/Token$Tag;
    .registers 3
    .param p1, "start"    # Z

    .prologue
    .line 191
    if-eqz p1, :cond_d

    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->startPending:Lorg/jsoup/parser/Token$StartTag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$StartTag;->reset()Lorg/jsoup/parser/Token$Tag;

    move-result-object v0

    :goto_8
    iput-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    .line 192
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    return-object v0

    .line 191
    :cond_d
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->endPending:Lorg/jsoup/parser/Token$EndTag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$EndTag;->reset()Lorg/jsoup/parser/Token$Tag;

    move-result-object v0

    goto :goto_8
.end method

.method createTempBuffer()V
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lorg/jsoup/parser/Token;->reset(Ljava/lang/StringBuilder;)V

    .line 218
    return-void
.end method

.method currentNodeInHtmlNS()Z
    .registers 2

    .prologue
    .line 252
    const/4 v0, 0x1

    return v0
.end method

.method emit(C)V
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 105
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method emit(Ljava/lang/String;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 90
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 98
    :goto_6
    return-void

    .line 93
    :cond_7
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 94
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    :cond_16
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6
.end method

.method emit(Lorg/jsoup/parser/Token;)V
    .registers 6
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 69
    iget-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    const-string v3, "There is an unread token pending!"

    invoke-static {v2, v3}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 71
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->emitPending:Lorg/jsoup/parser/Token;

    .line 72
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 74
    iget-object v2, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v3, Lorg/jsoup/parser/Token$TokenType;->StartTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v2, v3, :cond_21

    move-object v1, p1

    .line 75
    check-cast v1, Lorg/jsoup/parser/Token$StartTag;

    .line 76
    .local v1, "startTag":Lorg/jsoup/parser/Token$StartTag;
    iget-object v2, v1, Lorg/jsoup/parser/Token$StartTag;->tagName:Ljava/lang/String;

    iput-object v2, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    .line 77
    iget-boolean v2, v1, Lorg/jsoup/parser/Token$StartTag;->selfClosing:Z

    if-eqz v2, :cond_20

    .line 78
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 84
    .end local v1    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_20
    :goto_20
    return-void

    .line 79
    :cond_21
    iget-object v2, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v3, Lorg/jsoup/parser/Token$TokenType;->EndTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v2, v3, :cond_20

    move-object v0, p1

    .line 80
    check-cast v0, Lorg/jsoup/parser/Token$EndTag;

    .line 81
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    iget-object v2, v0, Lorg/jsoup/parser/Token$EndTag;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v2, :cond_20

    .line 82
    const-string v2, "Attributes incorrectly present on end tag"

    invoke-direct {p0, v2}, Lorg/jsoup/parser/Tokeniser;->error(Ljava/lang/String;)V

    goto :goto_20
.end method

.method emit([C)V
    .registers 3
    .param p1, "chars"    # [C

    .prologue
    .line 101
    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method emitCommentPending()V
    .registers 2

    .prologue
    .line 205
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->commentPending:Lorg/jsoup/parser/Token$Comment;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 206
    return-void
.end method

.method emitDoctypePending()V
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->doctypePending:Lorg/jsoup/parser/Token$Doctype;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 214
    return-void
.end method

.method emitTagPending()V
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Token$Tag;->finaliseTag()V

    .line 197
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    .line 198
    return-void
.end method

.method eofError(Lorg/jsoup/parser/TokeniserState;)V
    .registers 8
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 236
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 237
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

    .line 238
    :cond_20
    return-void
.end method

.method error(Lorg/jsoup/parser/TokeniserState;)V
    .registers 9
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 231
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 232
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

    .line 233
    :cond_2d
    return-void
.end method

.method getState()Lorg/jsoup/parser/TokeniserState;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    return-object v0
.end method

.method isAppropriateEndTagToken()Z
    .registers 3

    .prologue
    .line 221
    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/jsoup/parser/Tokeniser;->tagPending:Lorg/jsoup/parser/Token$Tag;

    iget-object v0, v0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method read()Lorg/jsoup/parser/Token;
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 44
    iget-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    if-nez v2, :cond_e

    .line 45
    const-string v2, "Self closing flag not acknowledged"

    invoke-direct {p0, v2}, Lorg/jsoup/parser/Tokeniser;->error(Ljava/lang/String;)V

    .line 46
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->selfClosingFlagAcknowledged:Z

    .line 49
    :cond_e
    :goto_e
    iget-boolean v2, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    if-nez v2, :cond_1a

    .line 50
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    iget-object v3, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2, p0, v3}, Lorg/jsoup/parser/TokeniserState;->read(Lorg/jsoup/parser/Tokeniser;Lorg/jsoup/parser/CharacterReader;)V

    goto :goto_e

    .line 53
    :cond_1a
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_3c

    .line 54
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 55
    .local v0, "str":Ljava/lang/String;
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    iget-object v3, p0, Lorg/jsoup/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v2, v4, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 56
    iput-object v5, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 57
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charPending:Lorg/jsoup/parser/Token$Character;

    invoke-virtual {v2, v0}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v1

    .line 64
    .end local v0    # "str":Ljava/lang/String;
    :goto_3b
    return-object v1

    .line 58
    :cond_3c
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-eqz v2, :cond_4b

    .line 59
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->charPending:Lorg/jsoup/parser/Token$Character;

    iget-object v3, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v1

    .line 60
    .local v1, "token":Lorg/jsoup/parser/Token;
    iput-object v5, p0, Lorg/jsoup/parser/Tokeniser;->charsString:Ljava/lang/String;

    goto :goto_3b

    .line 63
    .end local v1    # "token":Lorg/jsoup/parser/Token;
    :cond_4b
    iput-boolean v4, p0, Lorg/jsoup/parser/Tokeniser;->isEmitPending:Z

    .line 64
    iget-object v1, p0, Lorg/jsoup/parser/Tokeniser;->emitPending:Lorg/jsoup/parser/Token;

    goto :goto_3b
.end method

.method transition(Lorg/jsoup/parser/TokeniserState;)V
    .registers 2
    .param p1, "state"    # Lorg/jsoup/parser/TokeniserState;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/jsoup/parser/Tokeniser;->state:Lorg/jsoup/parser/TokeniserState;

    .line 114
    return-void
.end method

.method unescapeEntities(Z)Ljava/lang/String;
    .registers 6
    .param p1, "inAttribute"    # Z

    .prologue
    const/16 v3, 0x26

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_7
    :goto_7
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_37

    .line 265
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/CharacterReader;->matches(C)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 267
    iget-object v2, p0, Lorg/jsoup/parser/Tokeniser;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->consume()C

    .line 268
    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1}, Lorg/jsoup/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[C

    move-result-object v1

    .line 269
    .local v1, "c":[C
    if-eqz v1, :cond_2f

    array-length v2, v1

    if-nez v2, :cond_33

    .line 270
    :cond_2f
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 272
    :cond_33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 275
    .end local v1    # "c":[C
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
