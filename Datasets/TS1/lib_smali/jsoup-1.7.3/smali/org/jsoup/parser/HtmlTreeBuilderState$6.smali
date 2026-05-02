.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$6;
.super Lorg/jsoup/parser/HtmlTreeBuilderState;
.source "HtmlTreeBuilderState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/parser/HtmlTreeBuilderState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 195
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 5
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 241
    new-instance v0, Lorg/jsoup/parser/Token$StartTag;

    const-string v1, "body"

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 242
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 243
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 11
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v7, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 197
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {p1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 198
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    :goto_10
    move v3, v4

    .line 237
    :goto_11
    return v3

    .line 199
    :cond_12
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isComment()Z

    move-result v5

    if-eqz v5, :cond_20

    .line 200
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v3

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_10

    .line 201
    :cond_20
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isDoctype()Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 202
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_10

    .line 203
    :cond_2a
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v5

    if-eqz v5, :cond_c7

    .line 204
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v2

    .line 205
    .local v2, "startTag":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual {v2}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "name":Ljava/lang/String;
    const-string v5, "html"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 207
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v3

    goto :goto_11

    .line 208
    :cond_47
    const-string v5, "body"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 209
    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 210
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 211
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_10

    .line 212
    :cond_5b
    const-string v5, "frameset"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    .line 213
    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 214
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->InFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_10

    .line 215
    :cond_6c
    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "base"

    aput-object v6, v5, v3

    const-string v6, "basefont"

    aput-object v6, v5, v4

    const-string v6, "bgsound"

    aput-object v6, v5, v7

    const/4 v6, 0x3

    const-string v7, "link"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "meta"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "noframes"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "script"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string v7, "style"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string v7, "title"

    aput-object v7, v5, v6

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b5

    .line 216
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 217
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getHeadElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 218
    .local v0, "head":Lorg/jsoup/nodes/Element;
    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->push(Lorg/jsoup/nodes/Element;)V

    .line 219
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    .line 220
    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    goto/16 :goto_10

    .line 221
    .end local v0    # "head":Lorg/jsoup/nodes/Element;
    :cond_b5
    const-string v5, "head"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c2

    .line 222
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 225
    :cond_c2
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    goto/16 :goto_10

    .line 227
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_c7
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v5

    if-eqz v5, :cond_ef

    .line 228
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/String;

    const-string v7, "body"

    aput-object v7, v6, v3

    const-string v7, "html"

    aput-object v7, v6, v4

    invoke-static {v5, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_ea

    .line 229
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    goto/16 :goto_10

    .line 231
    :cond_ea
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 235
    :cond_ef
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$6;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    goto/16 :goto_10
.end method
