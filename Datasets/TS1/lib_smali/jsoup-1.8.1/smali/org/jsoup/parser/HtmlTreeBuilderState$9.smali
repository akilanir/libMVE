.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$9;
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
    .line 799
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 10
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 887
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 888
    const/4 v0, 0x1

    .line 889
    .local v0, "processed":Z
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "table"

    aput-object v3, v2, v5

    const-string v3, "tbody"

    aput-object v3, v2, v6

    const/4 v3, 0x2

    const-string v4, "tfoot"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "thead"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "tr"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 890
    invoke-virtual {p2, v6}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 891
    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v0

    .line 892
    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 896
    :goto_3a
    return v0

    .line 894
    :cond_3b
    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v0

    goto :goto_3a
.end method

.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 13
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 801
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isCharacter()Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 802
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->newPendingTableCharacters()V

    .line 803
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 804
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InTableText:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 805
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v4

    .line 883
    :cond_19
    :goto_19
    return v4

    .line 806
    :cond_1a
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isComment()Z

    move-result v6

    if-eqz v6, :cond_28

    .line 807
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v5

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_19

    .line 809
    :cond_28
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isDoctype()Z

    move-result v6

    if-eqz v6, :cond_33

    .line 810
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v4, v5

    .line 811
    goto :goto_19

    .line 812
    :cond_33
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isStartTag()Z

    move-result v6

    if-eqz v6, :cond_140

    .line 813
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v3

    .line 814
    .local v3, "startTag":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual {v3}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 815
    .local v1, "name":Ljava/lang/String;
    const-string v6, "caption"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_58

    .line 816
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 817
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 818
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 819
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_19

    .line 820
    :cond_58
    const-string v6, "colgroup"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6c

    .line 821
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 822
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 823
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InColumnGroup:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_19

    .line 824
    :cond_6c
    const-string v6, "col"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_83

    .line 825
    new-instance v4, Lorg/jsoup/parser/Token$StartTag;

    const-string v5, "colgroup"

    invoke-direct {v4, v5}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 826
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v4

    goto :goto_19

    .line 827
    :cond_83
    new-array v6, v9, [Ljava/lang/String;

    const-string v7, "tbody"

    aput-object v7, v6, v5

    const-string v7, "tfoot"

    aput-object v7, v6, v4

    const-string v7, "thead"

    aput-object v7, v6, v8

    invoke-static {v1, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a4

    .line 828
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 829
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 830
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_19

    .line 831
    :cond_a4
    new-array v6, v9, [Ljava/lang/String;

    const-string v7, "td"

    aput-object v7, v6, v5

    const-string v7, "th"

    aput-object v7, v6, v4

    const-string v7, "tr"

    aput-object v7, v6, v8

    invoke-static {v1, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c8

    .line 832
    new-instance v4, Lorg/jsoup/parser/Token$StartTag;

    const-string v5, "tbody"

    invoke-direct {v4, v5}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 833
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v4

    goto/16 :goto_19

    .line 834
    :cond_c8
    const-string v6, "table"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e6

    .line 835
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 836
    new-instance v5, Lorg/jsoup/parser/Token$EndTag;

    const-string v6, "table"

    invoke-direct {v5, v6}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v2

    .line 837
    .local v2, "processed":Z
    if-eqz v2, :cond_19

    .line 838
    invoke-virtual {p2, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v4

    goto/16 :goto_19

    .line 839
    .end local v2    # "processed":Z
    :cond_e6
    new-array v6, v8, [Ljava/lang/String;

    const-string v7, "style"

    aput-object v7, v6, v5

    const-string v7, "script"

    aput-object v7, v6, v4

    invoke-static {v1, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_fe

    .line 840
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v4

    goto/16 :goto_19

    .line 841
    :cond_fe
    const-string v6, "input"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_121

    .line 842
    iget-object v5, v3, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v6, "type"

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "hidden"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_11c

    .line 843
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v4

    goto/16 :goto_19

    .line 845
    :cond_11c
    invoke-virtual {p2, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_19

    .line 847
    :cond_121
    const-string v6, "form"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13a

    .line 848
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 849
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v6

    if-eqz v6, :cond_135

    move v4, v5

    .line 850
    goto/16 :goto_19

    .line 852
    :cond_135
    invoke-virtual {p2, v3, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;

    goto/16 :goto_19

    .line 855
    :cond_13a
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v4

    goto/16 :goto_19

    .line 858
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :cond_140
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEndTag()Z

    move-result v6

    if-eqz v6, :cond_1b8

    .line 859
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    .line 860
    .local v0, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v0}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 862
    .restart local v1    # "name":Ljava/lang/String;
    const-string v6, "table"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16c

    .line 863
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_162

    .line 864
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v4, v5

    .line 865
    goto/16 :goto_19

    .line 867
    :cond_162
    const-string v5, "table"

    invoke-virtual {p2, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 869
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->resetInsertionMode()V

    goto/16 :goto_19

    .line 870
    :cond_16c
    const/16 v6, 0xb

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "body"

    aput-object v7, v6, v5

    const-string v7, "caption"

    aput-object v7, v6, v4

    const-string v4, "col"

    aput-object v4, v6, v8

    const-string v4, "colgroup"

    aput-object v4, v6, v9

    const/4 v4, 0x4

    const-string v7, "html"

    aput-object v7, v6, v4

    const/4 v4, 0x5

    const-string v7, "tbody"

    aput-object v7, v6, v4

    const/4 v4, 0x6

    const-string v7, "td"

    aput-object v7, v6, v4

    const/4 v4, 0x7

    const-string v7, "tfoot"

    aput-object v7, v6, v4

    const/16 v4, 0x8

    const-string v7, "th"

    aput-object v7, v6, v4

    const/16 v4, 0x9

    const-string v7, "thead"

    aput-object v7, v6, v4

    const/16 v4, 0xa

    const-string v7, "tr"

    aput-object v7, v6, v4

    invoke-static {v1, v6}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1b2

    .line 872
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    move v4, v5

    .line 873
    goto/16 :goto_19

    .line 875
    :cond_1b2
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v4

    goto/16 :goto_19

    .line 878
    .end local v0    # "endTag":Lorg/jsoup/parser/Token$EndTag;
    .end local v1    # "name":Ljava/lang/String;
    :cond_1b8
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->isEOF()Z

    move-result v5

    if-eqz v5, :cond_1d3

    .line 879
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "html"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 880
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_19

    .line 883
    :cond_1d3
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$9;->anythingElse(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v4

    goto/16 :goto_19
.end method
