.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$3;
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
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 9
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 66
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {p1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 89
    :goto_8
    return v1

    .line 68
    :cond_9
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isComment()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 69
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_8

    .line 70
    :cond_17
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isDoctype()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 71
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v1, v2

    .line 72
    goto :goto_8

    .line 73
    :cond_22
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v3

    if-eqz v3, :cond_3f

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v3

    const-string v4, "html"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 74
    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilderState$3;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {v1, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v1

    goto :goto_8

    .line 75
    :cond_3f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v3

    if-eqz v3, :cond_66

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v3

    const-string v4, "head"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 76
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 77
    .local v0, "head":Lorg/jsoup/nodes/Element;
    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->setHeadElement(Lorg/jsoup/nodes/Element;)V

    .line 78
    sget-object v2, Lorg/jsoup/parser/HtmlTreeBuilderState$3;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_8

    .line 79
    .end local v0    # "head":Lorg/jsoup/nodes/Element;
    :cond_66
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v3

    if-eqz v3, :cond_9a

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "head"

    aput-object v5, v4, v2

    const-string v5, "body"

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "html"

    aput-object v5, v4, v1

    const/4 v1, 0x3

    const-string v5, "br"

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9a

    .line 80
    const-string v1, "head"

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 81
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v1

    goto/16 :goto_8

    .line 82
    :cond_9a
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v1

    if-eqz v1, :cond_a6

    .line 83
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v1, v2

    .line 84
    goto/16 :goto_8

    .line 86
    :cond_a6
    const-string v1, "head"

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 87
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v1

    goto/16 :goto_8
.end method
