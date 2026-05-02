.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$14;
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
    .line 1085
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 1135
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method

.method private handleMissingTr(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/TreeBuilder;)Z
    .registers 6
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/TreeBuilder;

    .prologue
    .line 1139
    new-instance v1, Lorg/jsoup/parser/Token$EndTag;

    const-string v2, "tr"

    invoke-direct {v1, v2}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Lorg/jsoup/parser/TreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v0

    .line 1140
    .local v0, "processed":Z
    if-eqz v0, :cond_12

    .line 1141
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/TreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v1

    .line 1143
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method


# virtual methods
.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 13
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1087
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 1088
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v2

    .line 1089
    .local v2, "startTag":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual {v2}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 1091
    .local v1, "name":Ljava/lang/String;
    new-array v5, v7, [Ljava/lang/String;

    const-string v6, "th"

    aput-object v6, v5, v3

    const-string v6, "td"

    aput-object v6, v5, v4

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 1092
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToTableRowContext()V

    .line 1093
    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 1094
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 1095
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .end local v2    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :goto_31
    move v3, v4

    .line 1131
    .end local v1    # "name":Ljava/lang/String;
    :goto_32
    return v3

    .line 1096
    .restart local v1    # "name":Ljava/lang/String;
    .restart local v2    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_33
    const/4 v5, 0x7

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "caption"

    aput-object v6, v5, v3

    const-string v3, "col"

    aput-object v3, v5, v4

    const-string v3, "colgroup"

    aput-object v3, v5, v7

    const-string v3, "tbody"

    aput-object v3, v5, v8

    const-string v3, "tfoot"

    aput-object v3, v5, v9

    const/4 v3, 0x5

    const-string v4, "thead"

    aput-object v4, v5, v3

    const/4 v3, 0x6

    const-string v4, "tr"

    aput-object v4, v5, v3

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 1097
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->handleMissingTr(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/TreeBuilder;)Z

    move-result v3

    goto :goto_32

    .line 1099
    :cond_5f
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v3

    goto :goto_32

    .line 1101
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_64
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v5

    if-eqz v5, :cond_fe

    .line 1102
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    .line 1103
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 1105
    .restart local v1    # "name":Ljava/lang/String;
    const-string v5, "tr"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_90

    .line 1106
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_84

    .line 1107
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_32

    .line 1110
    :cond_84
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToTableRowContext()V

    .line 1111
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    .line 1112
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_31

    .line 1113
    :cond_90
    const-string v5, "table"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9d

    .line 1114
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->handleMissingTr(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/TreeBuilder;)Z

    move-result v3

    goto :goto_32

    .line 1115
    :cond_9d
    new-array v5, v8, [Ljava/lang/String;

    const-string v6, "tbody"

    aput-object v6, v5, v3

    const-string v6, "tfoot"

    aput-object v6, v5, v4

    const-string v6, "thead"

    aput-object v6, v5, v7

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_cc

    .line 1116
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_bc

    .line 1117
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_32

    .line 1120
    :cond_bc
    new-instance v3, Lorg/jsoup/parser/Token$EndTag;

    const-string v4, "tr"

    invoke-direct {v3, v4}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 1121
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v3

    goto/16 :goto_32

    .line 1122
    :cond_cc
    const/4 v5, 0x7

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "body"

    aput-object v6, v5, v3

    const-string v6, "caption"

    aput-object v6, v5, v4

    const-string v4, "col"

    aput-object v4, v5, v7

    const-string v4, "colgroup"

    aput-object v4, v5, v8

    const-string v4, "html"

    aput-object v4, v5, v9

    const/4 v4, 0x5

    const-string v6, "td"

    aput-object v6, v5, v4

    const/4 v4, 0x6

    const-string v6, "th"

    aput-object v6, v5, v4

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f8

    .line 1123
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_32

    .line 1126
    :cond_f8
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v3

    goto/16 :goto_32

    .line 1129
    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_fe
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$14;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v3

    goto/16 :goto_32
.end method
