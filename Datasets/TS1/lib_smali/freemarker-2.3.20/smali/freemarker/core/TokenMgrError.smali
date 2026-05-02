.class public Lfreemarker/core/TokenMgrError;
.super Ljava/lang/Error;
.source "TokenMgrError.java"


# static fields
.field static final INVALID_LEXICAL_STATE:I = 0x2

.field static final LEXICAL_ERROR:I = 0x0

.field static final LOOP_DETECTED:I = 0x3

.field static final STATIC_LEXER_ERROR:I = 0x1


# instance fields
.field private columnNumber:Ljava/lang/Integer;

.field private detail:Ljava/lang/String;

.field errorCode:I

.field private lineNumber:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Error;-><init>()V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "detail"    # Ljava/lang/String;
    .param p2, "reason"    # I

    .prologue
    .line 190
    invoke-direct {p0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 191
    iput-object p1, p0, Lfreemarker/core/TokenMgrError;->detail:Ljava/lang/String;

    .line 192
    iput p2, p0, Lfreemarker/core/TokenMgrError;->errorCode:I

    .line 193
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .registers 6
    .param p1, "detail"    # Ljava/lang/String;
    .param p2, "reason"    # I
    .param p3, "errorLine"    # I
    .param p4, "errorColumn"    # I

    .prologue
    .line 199
    invoke-direct {p0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 200
    iput-object p1, p0, Lfreemarker/core/TokenMgrError;->detail:Ljava/lang/String;

    .line 201
    iput p2, p0, Lfreemarker/core/TokenMgrError;->errorCode:I

    .line 203
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/TokenMgrError;->lineNumber:Ljava/lang/Integer;

    .line 204
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p4}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/TokenMgrError;->columnNumber:Ljava/lang/Integer;

    .line 205
    return-void
.end method

.method public constructor <init>(ZIIILjava/lang/String;CI)V
    .registers 9
    .param p1, "EOFSeen"    # Z
    .param p2, "lexState"    # I
    .param p3, "errorLine"    # I
    .param p4, "errorColumn"    # I
    .param p5, "errorAfter"    # Ljava/lang/String;
    .param p6, "curChar"    # C
    .param p7, "reason"    # I

    .prologue
    .line 208
    invoke-static/range {p1 .. p6}, Lfreemarker/core/TokenMgrError;->LexicalError(ZIIILjava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p7}, Lfreemarker/core/TokenMgrError;-><init>(Ljava/lang/String;I)V

    .line 210
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/TokenMgrError;->lineNumber:Ljava/lang/Integer;

    .line 211
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p4}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/TokenMgrError;->columnNumber:Ljava/lang/Integer;

    .line 212
    return-void
.end method

.method protected static LexicalError(ZIIILjava/lang/String;C)Ljava/lang/String;
    .registers 9
    .param p0, "EOFSeen"    # Z
    .param p1, "lexState"    # I
    .param p2, "errorLine"    # I
    .param p3, "errorColumn"    # I
    .param p4, "errorAfter"    # Ljava/lang/String;
    .param p5, "curChar"    # C

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "Lexical error: encountered "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    if-eqz p0, :cond_2c

    const-string v0, "<EOF> "

    :goto_f
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "after \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p4}, Lfreemarker/core/TokenMgrError;->addEscapes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\"."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2c
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/core/TokenMgrError;->addEscapes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "), "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method protected static final addEscapes(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 107
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 109
    .local v2, "retval":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_93

    .line 110
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sparse-switch v4, :sswitch_data_98

    .line 139
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "ch":C
    const/16 v4, 0x20

    if-lt v0, v4, :cond_1f

    const/16 v4, 0x7e

    if-le v0, v4, :cond_8f

    .line 140
    :cond_1f
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "0000"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 141
    .local v3, "s":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "\\u"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    .end local v0    # "ch":C
    .end local v3    # "s":Ljava/lang/String;
    :goto_5c
    :sswitch_5c
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 115
    :sswitch_5f
    const-string v4, "\\b"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 118
    :sswitch_65
    const-string v4, "\\t"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 121
    :sswitch_6b
    const-string v4, "\\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 124
    :sswitch_71
    const-string v4, "\\f"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 127
    :sswitch_77
    const-string v4, "\\r"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 130
    :sswitch_7d
    const-string v4, "\\\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 133
    :sswitch_83
    const-string v4, "\\\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 136
    :sswitch_89
    const-string v4, "\\\\"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 143
    .restart local v0    # "ch":C
    :cond_8f
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5c

    .line 148
    .end local v0    # "ch":C
    :cond_93
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 110
    :sswitch_data_98
    .sparse-switch
        0x0 -> :sswitch_5c
        0x8 -> :sswitch_5f
        0x9 -> :sswitch_65
        0xa -> :sswitch_6b
        0xc -> :sswitch_71
        0xd -> :sswitch_77
        0x22 -> :sswitch_7d
        0x27 -> :sswitch_83
        0x5c -> :sswitch_89
    .end sparse-switch
.end method


# virtual methods
.method public getColumnNumber()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lfreemarker/core/TokenMgrError;->columnNumber:Ljava/lang/Integer;

    return-object v0
.end method

.method public getDetail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 229
    iget-object v0, p0, Lfreemarker/core/TokenMgrError;->detail:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumber()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lfreemarker/core/TokenMgrError;->lineNumber:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 179
    invoke-super {p0}, Ljava/lang/Error;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toParseException(Lfreemarker/template/Template;)Lfreemarker/core/ParseException;
    .registers 7
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    const/4 v1, 0x0

    .line 233
    new-instance v2, Lfreemarker/core/ParseException;

    invoke-virtual {p0}, Lfreemarker/core/TokenMgrError;->getDetail()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lfreemarker/core/TokenMgrError;->getLineNumber()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_27

    invoke-virtual {p0}, Lfreemarker/core/TokenMgrError;->getLineNumber()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_15
    invoke-virtual {p0}, Lfreemarker/core/TokenMgrError;->getColumnNumber()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_23

    invoke-virtual {p0}, Lfreemarker/core/TokenMgrError;->getColumnNumber()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :cond_23
    invoke-direct {v2, v3, p1, v0, v1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;II)V

    return-object v2

    :cond_27
    move v0, v1

    goto :goto_15
.end method
