.class abstract Lorg/jsoup/parser/Token;
.super Ljava/lang/Object;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/parser/Token$1;,
        Lorg/jsoup/parser/Token$TokenType;,
        Lorg/jsoup/parser/Token$EOF;,
        Lorg/jsoup/parser/Token$Character;,
        Lorg/jsoup/parser/Token$Comment;,
        Lorg/jsoup/parser/Token$EndTag;,
        Lorg/jsoup/parser/Token$StartTag;,
        Lorg/jsoup/parser/Token$Tag;,
        Lorg/jsoup/parser/Token$Doctype;
    }
.end annotation


# instance fields
.field type:Lorg/jsoup/parser/Token$TokenType;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/parser/Token$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/jsoup/parser/Token$1;

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/jsoup/parser/Token;-><init>()V

    return-void
.end method


# virtual methods
.method asCharacter()Lorg/jsoup/parser/Token$Character;
    .registers 1

    .prologue
    .line 260
    check-cast p0, Lorg/jsoup/parser/Token$Character;

    .end local p0    # "this":Lorg/jsoup/parser/Token;
    return-object p0
.end method

.method asComment()Lorg/jsoup/parser/Token$Comment;
    .registers 1

    .prologue
    .line 252
    check-cast p0, Lorg/jsoup/parser/Token$Comment;

    .end local p0    # "this":Lorg/jsoup/parser/Token;
    return-object p0
.end method

.method asDoctype()Lorg/jsoup/parser/Token$Doctype;
    .registers 1

    .prologue
    .line 228
    check-cast p0, Lorg/jsoup/parser/Token$Doctype;

    .end local p0    # "this":Lorg/jsoup/parser/Token;
    return-object p0
.end method

.method asEndTag()Lorg/jsoup/parser/Token$EndTag;
    .registers 1

    .prologue
    .line 244
    check-cast p0, Lorg/jsoup/parser/Token$EndTag;

    .end local p0    # "this":Lorg/jsoup/parser/Token;
    return-object p0
.end method

.method asStartTag()Lorg/jsoup/parser/Token$StartTag;
    .registers 1

    .prologue
    .line 236
    check-cast p0, Lorg/jsoup/parser/Token$StartTag;

    .end local p0    # "this":Lorg/jsoup/parser/Token;
    return-object p0
.end method

.method isCharacter()Z
    .registers 3

    .prologue
    .line 256
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->Character:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isComment()Z
    .registers 3

    .prologue
    .line 248
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->Comment:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isDoctype()Z
    .registers 3

    .prologue
    .line 224
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->Doctype:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isEOF()Z
    .registers 3

    .prologue
    .line 264
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->EOF:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isEndTag()Z
    .registers 3

    .prologue
    .line 240
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->EndTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isStartTag()Z
    .registers 3

    .prologue
    .line 232
    iget-object v0, p0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    sget-object v1, Lorg/jsoup/parser/Token$TokenType;->StartTag:Lorg/jsoup/parser/Token$TokenType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method tokenType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
