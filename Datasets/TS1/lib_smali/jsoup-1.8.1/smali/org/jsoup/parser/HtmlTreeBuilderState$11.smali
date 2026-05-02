.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$11;
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
    .line 935
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 15
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 937
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v5

    if-eqz v5, :cond_52

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v5

    const-string v6, "caption"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_52

    .line 938
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    .line 939
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 940
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2d

    .line 941
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 967
    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :goto_2c
    return v3

    .line 944
    .restart local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_2d
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 945
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v3

    const-string v5, "caption"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_43

    .line 946
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 947
    :cond_43
    const-string v3, "caption"

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 948
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 949
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$11;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_50
    move v3, v4

    .line 967
    goto :goto_2c

    .line 951
    :cond_52
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v5

    if-eqz v5, :cond_93

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x9

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "caption"

    aput-object v7, v6, v3

    const-string v7, "col"

    aput-object v7, v6, v4

    const-string v7, "colgroup"

    aput-object v7, v6, v9

    const-string v7, "tbody"

    aput-object v7, v6, v10

    const-string v7, "td"

    aput-object v7, v6, v11

    const/4 v7, 0x5

    const-string v8, "tfoot"

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-string v8, "th"

    aput-object v8, v6, v7

    const/4 v7, 0x7

    const-string v8, "thead"

    aput-object v8, v6, v7

    const/16 v7, 0x8

    const-string v8, "tr"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a9

    :cond_93
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v5

    if-eqz v5, :cond_bf

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v5

    const-string v6, "table"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_bf

    .line 956
    :cond_a9
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 957
    new-instance v3, Lorg/jsoup/parser/Token$EndTag;

    const-string v5, "caption"

    invoke-direct {v3, v5}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v2

    .line 958
    .local v2, "processed":Z
    if-eqz v2, :cond_50

    .line 959
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v3

    goto/16 :goto_2c

    .line 960
    .end local v2    # "processed":Z
    :cond_bf
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v5

    if-eqz v5, :cond_10b

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "body"

    aput-object v7, v6, v3

    const-string v7, "col"

    aput-object v7, v6, v4

    const-string v4, "colgroup"

    aput-object v4, v6, v9

    const-string v4, "html"

    aput-object v4, v6, v10

    const-string v4, "tbody"

    aput-object v4, v6, v11

    const/4 v4, 0x5

    const-string v7, "td"

    aput-object v7, v6, v4

    const/4 v4, 0x6

    const-string v7, "tfoot"

    aput-object v7, v6, v4

    const/4 v4, 0x7

    const-string v7, "th"

    aput-object v7, v6, v4

    const/16 v4, 0x8

    const-string v7, "thead"

    aput-object v7, v6, v4

    const/16 v4, 0x9

    const-string v7, "tr"

    aput-object v7, v6, v4

    invoke-static {v5, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10b

    .line 962
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_2c

    .line 965
    :cond_10b
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$11;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v3

    goto/16 :goto_2c
.end method
