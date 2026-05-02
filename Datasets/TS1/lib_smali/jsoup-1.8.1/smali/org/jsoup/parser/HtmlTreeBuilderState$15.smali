.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$15;
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
    .line 1146
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 1193
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method

.method private closeCell(Lorg/jsoup/parser/HtmlTreeBuilder;)V
    .registers 4
    .param p1, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 1197
    const-string v0, "td"

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1198
    new-instance v0, Lorg/jsoup/parser/Token$EndTag;

    const-string v1, "td"

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 1201
    :goto_12
    return-void

    .line 1200
    :cond_13
    new-instance v0, Lorg/jsoup/parser/Token$EndTag;

    const-string v1, "th"

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    goto :goto_12
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

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1148
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v4

    if-eqz v4, :cond_a8

    .line 1149
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    .line 1150
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 1152
    .local v1, "name":Ljava/lang/String;
    new-array v4, v7, [Ljava/lang/String;

    const-string v5, "td"

    aput-object v5, v4, v2

    const-string v5, "th"

    aput-object v5, v4, v3

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 1153
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_32

    .line 1154
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 1155
    sget-object v3, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 1189
    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :goto_31
    return v2

    .line 1158
    .restart local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_32
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 1159
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_46

    .line 1160
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 1161
    :cond_46
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 1162
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    .line 1163
    sget-object v2, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v2, v3

    .line 1189
    goto :goto_31

    .line 1164
    :cond_53
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "body"

    aput-object v5, v4, v2

    const-string v5, "caption"

    aput-object v5, v4, v3

    const-string v5, "col"

    aput-object v5, v4, v7

    const-string v5, "colgroup"

    aput-object v5, v4, v8

    const-string v5, "html"

    aput-object v5, v4, v9

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_74

    .line 1165
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_31

    .line 1167
    :cond_74
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "table"

    aput-object v5, v4, v2

    const-string v5, "tbody"

    aput-object v5, v4, v3

    const-string v3, "tfoot"

    aput-object v3, v4, v7

    const-string v3, "thead"

    aput-object v3, v4, v8

    const-string v3, "tr"

    aput-object v3, v4, v9

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a3

    .line 1168
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_9b

    .line 1169
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_31

    .line 1172
    :cond_9b
    invoke-direct {p0, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->closeCell(Lorg/jsoup/parser/HtmlTreeBuilder;)V

    .line 1173
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v2

    goto :goto_31

    .line 1175
    :cond_a3
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v2

    goto :goto_31

    .line 1177
    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_a8
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v4

    if-eqz v4, :cond_107

    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "caption"

    aput-object v6, v5, v2

    const-string v6, "col"

    aput-object v6, v5, v3

    const-string v3, "colgroup"

    aput-object v3, v5, v7

    const-string v3, "tbody"

    aput-object v3, v5, v8

    const-string v3, "td"

    aput-object v3, v5, v9

    const/4 v3, 0x5

    const-string v6, "tfoot"

    aput-object v6, v5, v3

    const/4 v3, 0x6

    const-string v6, "th"

    aput-object v6, v5, v3

    const/4 v3, 0x7

    const-string v6, "thead"

    aput-object v6, v5, v3

    const/16 v3, 0x8

    const-string v6, "tr"

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_107

    .line 1180
    const-string v3, "td"

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_fe

    const-string v3, "th"

    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_fe

    .line 1181
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_31

    .line 1184
    :cond_fe
    invoke-direct {p0, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->closeCell(Lorg/jsoup/parser/HtmlTreeBuilder;)V

    .line 1185
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v2

    goto/16 :goto_31

    .line 1187
    :cond_107
    invoke-direct {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$15;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v2

    goto/16 :goto_31
.end method
