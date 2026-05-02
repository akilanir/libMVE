.class public Lezvcard/io/text/FoldedLineReader;
.super Ljava/io/BufferedReader;
.source "FoldedLineReader.java"


# static fields
.field private static final foldedQuotedPrintableValueRegex:Ljava/util/regex/Pattern;


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private lastLine:Ljava/lang/String;

.field private lastLineNum:I

.field private lineCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 50
    const-string v0, "[^:]*?QUOTED-PRINTABLE.*?:.*?="

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lezvcard/io/text/FoldedLineReader;->foldedQuotedPrintableValueRegex:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 6
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 61
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 53
    iput v3, p0, Lezvcard/io/text/FoldedLineReader;->lastLineNum:I

    iput v3, p0, Lezvcard/io/text/FoldedLineReader;->lineCount:I

    .line 62
    instance-of v3, p1, Ljava/io/InputStreamReader;

    if-eqz v3, :cond_1e

    move-object v1, p1

    .line 63
    check-cast v1, Ljava/io/InputStreamReader;

    .line 64
    .local v1, "isr":Ljava/io/InputStreamReader;
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "charsetStr":Ljava/lang/String;
    if-nez v0, :cond_19

    :goto_16
    iput-object v2, p0, Lezvcard/io/text/FoldedLineReader;->charset:Ljava/nio/charset/Charset;

    .line 69
    .end local v0    # "charsetStr":Ljava/lang/String;
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :goto_18
    return-void

    .line 65
    .restart local v0    # "charsetStr":Ljava/lang/String;
    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_19
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    goto :goto_16

    .line 67
    .end local v0    # "charsetStr":Ljava/lang/String;
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_1e
    iput-object v2, p0, Lezvcard/io/text/FoldedLineReader;->charset:Ljava/nio/charset/Charset;

    goto :goto_18
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 76
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lezvcard/io/text/FoldedLineReader;-><init>(Ljava/io/Reader;)V

    .line 77
    return-void
.end method

.method private readNonEmptyLine()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    :cond_0
    invoke-super {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_c

    .line 108
    iget v1, p0, Lezvcard/io/text/FoldedLineReader;->lineCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lezvcard/io/text/FoldedLineReader;->lineCount:I

    .line 110
    :cond_c
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    :cond_14
    return-object v0
.end method


# virtual methods
.method public getEncoding()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lezvcard/io/text/FoldedLineReader;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getLineNum()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lezvcard/io/text/FoldedLineReader;->lastLineNum:I

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 121
    iget-object v7, p0, Lezvcard/io/text/FoldedLineReader;->lastLine:Ljava/lang/String;

    if-nez v7, :cond_f

    invoke-direct {p0}, Lezvcard/io/text/FoldedLineReader;->readNonEmptyLine()Ljava/lang/String;

    move-result-object v5

    .line 122
    .local v5, "wholeLine":Ljava/lang/String;
    :goto_a
    iput-object v6, p0, Lezvcard/io/text/FoldedLineReader;->lastLine:Ljava/lang/String;

    .line 123
    if-nez v5, :cond_12

    .line 207
    :goto_e
    return-object v6

    .line 121
    .end local v5    # "wholeLine":Ljava/lang/String;
    :cond_f
    iget-object v5, p0, Lezvcard/io/text/FoldedLineReader;->lastLine:Ljava/lang/String;

    goto :goto_a

    .line 153
    .restart local v5    # "wholeLine":Ljava/lang/String;
    :cond_12
    const/4 v1, 0x0

    .line 154
    .local v1, "foldedQuotedPrintableLine":Z
    sget-object v6, Lezvcard/io/text/FoldedLineReader;->foldedQuotedPrintableValueRegex:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 155
    const/4 v1, 0x1

    .line 158
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 161
    :cond_2a
    iget v6, p0, Lezvcard/io/text/FoldedLineReader;->lineCount:I

    iput v6, p0, Lezvcard/io/text/FoldedLineReader;->lastLineNum:I

    .line 162
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .local v4, "unfoldedLine":Ljava/lang/StringBuilder;
    :goto_33
    if-eqz v1, :cond_40

    invoke-super {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "line":Ljava/lang/String;
    :goto_39
    if-nez v3, :cond_45

    .line 207
    :cond_3b
    :goto_3b
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_e

    .line 164
    .end local v3    # "line":Ljava/lang/String;
    :cond_40
    invoke-direct {p0}, Lezvcard/io/text/FoldedLineReader;->readNonEmptyLine()Ljava/lang/String;

    move-result-object v3

    goto :goto_39

    .line 170
    .restart local v3    # "line":Ljava/lang/String;
    :cond_45
    if-eqz v1, :cond_63

    .line 171
    invoke-static {v3}, Lezvcard/util/StringUtils;->ltrim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 173
    const-string v6, "="

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 174
    .local v0, "endsInEquals":Z
    if-eqz v0, :cond_5d

    .line 176
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 179
    :cond_5d
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    if-eqz v0, :cond_3b

    goto :goto_33

    .line 190
    .end local v0    # "endsInEquals":Z
    :cond_63
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_8f

    invoke-virtual {v3, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_8f

    .line 193
    const/4 v2, 0x1

    .line 195
    .local v2, "lastWhitespace":I
    :goto_74
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_87

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_87

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_74

    .line 198
    :cond_87
    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 203
    .end local v2    # "lastWhitespace":I
    :cond_8f
    iput-object v3, p0, Lezvcard/io/text/FoldedLineReader;->lastLine:Ljava/lang/String;

    goto :goto_3b
.end method
