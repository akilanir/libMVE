.class final enum Lorg/jsoup/parser/HtmlTreeBuilderState$7;
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
    .line 246
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILorg/jsoup/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 8
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 759
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 760
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v3

    .line 761
    .local v3, "stack":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {v3}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 762
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 763
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 764
    .local v2, "node":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 765
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 766
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 767
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 768
    :cond_3a
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 777
    .end local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_3d
    const/4 v4, 0x1

    :goto_3e
    return v4

    .line 771
    .restart local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_3f
    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 772
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 773
    const/4 v4, 0x0

    goto :goto_3e
.end method

.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 45
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 248
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$24;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    move-object/from16 v40, v0

    invoke-virtual/range {v40 .. v40}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v40

    aget v39, v39, v40

    packed-switch v39, :pswitch_data_e3e

    .line 755
    :cond_11
    :goto_11
    const/16 v39, 0x1

    :goto_13
    return v39

    .line 250
    :pswitch_14
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v9

    .line 251
    .local v9, "c":Lorg/jsoup/parser/Token$Character;
    invoke-virtual {v9}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_30

    .line 253
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 254
    const/16 v39, 0x0

    goto :goto_13

    .line 255
    :cond_30
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v39

    if-eqz v39, :cond_45

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {v9}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v39

    if-eqz v39, :cond_45

    .line 256
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 257
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_11

    .line 259
    :cond_45
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 260
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    .line 261
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto :goto_11

    .line 266
    .end local v9    # "c":Lorg/jsoup/parser/Token$Character;
    :pswitch_57
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_11

    .line 270
    :pswitch_63
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 271
    const/16 v39, 0x0

    goto :goto_13

    .line 274
    :pswitch_6d
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v37

    .line 275
    .local v37, "startTag":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v26

    .line 276
    .local v26, "name":Ljava/lang/String;
    const-string v39, "html"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_be

    .line 277
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 279
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/helper/DescendableLinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/jsoup/nodes/Element;

    .line 280
    .local v19, "html":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->getAttributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, "i$":Ljava/util/Iterator;
    :cond_9a
    :goto_9a
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_11

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Attribute;

    .line 281
    .local v7, "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v7}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v19

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9a

    .line 282
    invoke-virtual/range {v19 .. v19}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_9a

    .line 284
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v19    # "html":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    :cond_be
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartToHead:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$500()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_da

    .line 285
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v39

    goto/16 :goto_13

    .line 286
    :cond_da
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_164

    .line 287
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 288
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 289
    .local v35, "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_121

    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_125

    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "body"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_125

    .line 291
    :cond_121
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 293
    :cond_125
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 294
    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jsoup/nodes/Element;

    .line 295
    .local v8, "body":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->getAttributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_142
    :goto_142
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_11

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Attribute;

    .line 296
    .restart local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v7}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v8, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_142

    .line 297
    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_142

    .line 300
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v8    # "body":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_164
    const-string v39, "frameset"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_1f0

    .line 301
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 302
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 303
    .restart local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_1ab

    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1af

    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "body"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_1af

    .line 305
    :cond_1ab
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 306
    :cond_1af
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v39

    if-nez v39, :cond_1b9

    .line 307
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 309
    :cond_1b9
    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/jsoup/nodes/Element;

    .line 310
    .local v32, "second":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v32 .. v32}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_1ce

    .line 311
    invoke-virtual/range {v32 .. v32}, Lorg/jsoup/nodes/Element;->remove()V

    .line 313
    :cond_1ce
    :goto_1ce
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1de

    .line 314
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1ce

    .line 315
    :cond_1de
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 316
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 318
    .end local v32    # "second":Lorg/jsoup/nodes/Element;
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_1f0
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_221

    .line 319
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_218

    .line 320
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 322
    :cond_218
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 323
    :cond_221
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_26e

    .line 324
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_249

    .line 325
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 327
    :cond_249
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_265

    .line 328
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 329
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    .line 331
    :cond_265
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 332
    :cond_26e
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPreListing:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2a8

    .line 333
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_296

    .line 334
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 336
    :cond_296
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 338
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 339
    :cond_2a8
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_2ec

    .line 340
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_2c5

    .line 341
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 342
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 344
    :cond_2c5
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2df

    .line 345
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 347
    :cond_2df
    const/16 v39, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v37

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;

    goto/16 :goto_11

    .line 348
    :cond_2ec
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_36d

    .line 349
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 350
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 351
    .restart local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    add-int/lit8 v20, v39, -0x1

    .local v20, "i":I
    :goto_30b
    if-lez v20, :cond_331

    .line 352
    move-object/from16 v0, v35

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 353
    .local v14, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "li"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_354

    .line 354
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "li"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 360
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_331
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_34b

    .line 361
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 363
    :cond_34b
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 357
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_354
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_36a

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_331

    .line 351
    :cond_36a
    add-int/lit8 v20, v20, -0x1

    goto :goto_30b

    .line 364
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_36d
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3f4

    .line 365
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 366
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 367
    .restart local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    add-int/lit8 v20, v39, -0x1

    .restart local v20    # "i":I
    :goto_38e
    if-lez v20, :cond_3b8

    .line 368
    move-object/from16 v0, v35

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 369
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3db

    .line 370
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v40

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 376
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_3b8
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3d2

    .line 377
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 379
    :cond_3d2
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 373
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_3db
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_3f1

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3b8

    .line 367
    :cond_3f1
    add-int/lit8 v20, v20, -0x1

    goto :goto_38e

    .line 380
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_3f4
    const-string v39, "plaintext"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_42e

    .line 381
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_41a

    .line 382
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 384
    :cond_41a
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 385
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    sget-object v40, Lorg/jsoup/parser/TokeniserState;->PLAINTEXT:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_11

    .line 386
    :cond_42e
    const-string v39, "button"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_479

    .line 387
    const-string v39, "button"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_464

    .line 389
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 390
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "button"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 391
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    goto/16 :goto_11

    .line 393
    :cond_464
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 394
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 395
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 397
    :cond_479
    const-string v39, "a"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_4d2

    .line 398
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_4c0

    .line 399
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 400
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "a"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 403
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v30

    .line 404
    .local v30, "remainingA":Lorg/jsoup/nodes/Element;
    if-eqz v30, :cond_4c0

    .line 405
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 406
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 409
    .end local v30    # "remainingA":Lorg/jsoup/nodes/Element;
    :cond_4c0
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 410
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 411
    .local v3, "a":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 412
    .end local v3    # "a":Lorg/jsoup/nodes/Element;
    :cond_4d2
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Formatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1100()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_4f2

    .line 413
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 414
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 415
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 416
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_4f2
    const-string v39, "nobr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_534

    .line 417
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 418
    const-string v39, "nobr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_525

    .line 419
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 420
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "nobr"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 421
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 423
    :cond_525
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 424
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 425
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_534
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_55a

    .line 426
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 427
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 428
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 429
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 430
    :cond_55a
    const-string v39, "table"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_5ab

    .line 431
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getDocument()Lorg/jsoup/nodes/Document;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Document;->quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;

    move-result-object v39

    sget-object v40, Lorg/jsoup/nodes/Document$QuirksMode;->quirks:Lorg/jsoup/nodes/Document$QuirksMode;

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    if-eq v0, v1, :cond_590

    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_590

    .line 432
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 434
    :cond_590
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 435
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 436
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 437
    :cond_5ab
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartEmptyFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1300()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_5ce

    .line 438
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 439
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 440
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 441
    :cond_5ce
    const-string v39, "input"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_600

    .line 442
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 443
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 444
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    const-string v39, "type"

    move-object/from16 v0, v39

    invoke-virtual {v14, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    const-string v40, "hidden"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_11

    .line 445
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 446
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_600
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartMedia:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1400()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_617

    .line 447
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 448
    :cond_617
    const-string v39, "hr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_64f

    .line 449
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_63d

    .line 450
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 452
    :cond_63d
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 453
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 454
    :cond_64f
    const-string v39, "image"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_684

    .line 455
    const-string v39, "svg"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-nez v39, :cond_67b

    .line 456
    const-string v39, "img"

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/Token$StartTag;->name(Ljava/lang/String;)Lorg/jsoup/parser/Token$Tag;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 458
    :cond_67b
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 459
    :cond_684
    const-string v39, "isindex"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7a6

    .line 461
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 462
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_6a1

    .line 463
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 465
    :cond_6a1
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 466
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "form"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 467
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "action"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_6e1

    .line 468
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v16

    .line 469
    .local v16, "form":Lorg/jsoup/nodes/Element;
    const-string v39, "action"

    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v40, v0

    const-string v41, "action"

    invoke-virtual/range {v40 .. v41}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v16

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 471
    .end local v16    # "form":Lorg/jsoup/nodes/Element;
    :cond_6e1
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "hr"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 472
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "label"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 474
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_756

    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 478
    .local v29, "prompt":Ljava/lang/String;
    :goto_717
    new-instance v39, Lorg/jsoup/parser/Token$Character;

    move-object/from16 v0, v39

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$Character;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 481
    new-instance v22, Lorg/jsoup/nodes/Attributes;

    invoke-direct/range {v22 .. v22}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 482
    .local v22, "inputAttribs":Lorg/jsoup/nodes/Attributes;
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_736
    :goto_736
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_759

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Attribute;

    .line 483
    .local v6, "attr":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v6}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartInputAttribs:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1500()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_736

    .line 484
    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_736

    .line 474
    .end local v6    # "attr":Lorg/jsoup/nodes/Attribute;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_756
    const-string v29, "This is a searchable index. Enter search keywords: "

    goto :goto_717

    .line 486
    .restart local v21    # "i$":Ljava/util/Iterator;
    .restart local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .restart local v29    # "prompt":Ljava/lang/String;
    :cond_759
    const-string v39, "name"

    const-string v40, "isindex"

    move-object/from16 v0, v22

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "input"

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 488
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "label"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 489
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "hr"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 490
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "form"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    goto/16 :goto_11

    .line 491
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_7a6
    const-string v39, "textarea"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7db

    .line 492
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 494
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    sget-object v40, Lorg/jsoup/parser/TokeniserState;->Rcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 495
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 496
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 497
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->Text:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 498
    :cond_7db
    const-string v39, "xmp"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_816

    .line 499
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_801

    .line 500
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 502
    :cond_801
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 503
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 504
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 505
    :cond_816
    const-string v39, "iframe"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_834

    .line 506
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 507
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 508
    :cond_834
    const-string v39, "noembed"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_849

    .line 510
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 511
    :cond_849
    const-string v39, "select"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_8aa

    .line 512
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 513
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 514
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 516
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->state()Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-result-object v38

    .line 517
    .local v38, "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_894

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_894

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_894

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_894

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_89f

    .line 518
    :cond_894
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelectInTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 520
    :cond_89f
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelect:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 521
    .end local v38    # "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    :cond_8aa
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartOptions:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_8e2

    .line 522
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "option"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_8d6

    .line 523
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "option"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 524
    :cond_8d6
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 525
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 526
    :cond_8e2
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartRuby:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_928

    .line 527
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_11

    .line 528
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 529
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "ruby"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_91f

    .line 530
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 531
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToBefore(Ljava/lang/String;)V

    .line 533
    :cond_91f
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 535
    :cond_928
    const-string v39, "math"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_949

    .line 536
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 538
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 539
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 540
    :cond_949
    const-string v39, "svg"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_96a

    .line 541
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 543
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 544
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 545
    :cond_96a
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartDrop:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_983

    .line 546
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 547
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 549
    :cond_983
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 550
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 555
    .end local v26    # "name":Ljava/lang/String;
    .end local v37    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :pswitch_98f
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v15

    .line 556
    .local v15, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v15}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v26

    .line 557
    .restart local v26    # "name":Ljava/lang/String;
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_9c5

    .line 558
    const-string v39, "body"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9ba

    .line 559
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 560
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 563
    :cond_9ba
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->AfterBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 565
    :cond_9c5
    const-string v39, "html"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_9ea

    .line 566
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "body"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v28

    .line 567
    .local v28, "notIgnored":Z
    if-eqz v28, :cond_11

    .line 568
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 569
    .end local v28    # "notIgnored":Z
    :cond_9ea
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1900()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_a32

    .line 570
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a0d

    .line 572
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 573
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 575
    :cond_a0d
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 576
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a29

    .line 577
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 578
    :cond_a29
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 580
    :cond_a32
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_a85

    .line 581
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v13

    .line 582
    .local v13, "currentForm":Lorg/jsoup/nodes/Element;
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFormElement(Lorg/jsoup/nodes/FormElement;)V

    .line 583
    if-eqz v13, :cond_a57

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a62

    .line 584
    :cond_a57
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 585
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 587
    :cond_a62
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 588
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a7e

    .line 589
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 591
    :cond_a7e
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    goto/16 :goto_11

    .line 593
    .end local v13    # "currentForm":Lorg/jsoup/nodes/Element;
    :cond_a85
    const-string v39, "p"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_ae3

    .line 594
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_aba

    .line 595
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 596
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 597
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 599
    :cond_aba
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 600
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_ada

    .line 601
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 602
    :cond_ada
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 604
    :cond_ae3
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_b2d

    .line 605
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inListItemScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_b04

    .line 606
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 607
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 609
    :cond_b04
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 610
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_b24

    .line 611
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 612
    :cond_b24
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 614
    :cond_b2d
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_b79

    .line 615
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_b50

    .line 616
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 617
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 619
    :cond_b50
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 620
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_b70

    .line 621
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 622
    :cond_b70
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 624
    :cond_b79
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_bcd

    .line 625
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope([Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_ba0

    .line 626
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 627
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 629
    :cond_ba0
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 630
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_bc0

    .line 631
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 632
    :cond_bc0
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose([Ljava/lang/String;)V

    goto/16 :goto_11

    .line 634
    :cond_bcd
    const-string v39, "sarcasm"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_bdf

    .line 636
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 637
    :cond_bdf
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndAdoptionFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_dbc

    .line 640
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_bef
    const/16 v39, 0x8

    move/from16 v0, v20

    move/from16 v1, v39

    if-ge v0, v1, :cond_11

    .line 641
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v17

    .line 642
    .local v17, "formatEl":Lorg/jsoup/nodes/Element;
    if-nez v17, :cond_c07

    .line 643
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 644
    :cond_c07
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_c23

    .line 645
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 646
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 647
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 648
    :cond_c23
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_c3c

    .line 649
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 650
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 651
    :cond_c3c
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_c4d

    .line 652
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 654
    :cond_c4d
    const/16 v18, 0x0

    .line 655
    .local v18, "furthestBlock":Lorg/jsoup/nodes/Element;
    const/4 v12, 0x0

    .line 656
    .local v12, "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x0

    .line 657
    .local v33, "seenFormattingElement":Z
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 660
    .restart local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v36

    .line 661
    .local v36, "stackSize":I
    const/16 v34, 0x0

    .local v34, "si":I
    :goto_c5c
    move/from16 v0, v34

    move/from16 v1, v36

    if-ge v0, v1, :cond_c95

    const/16 v39, 0x40

    move/from16 v0, v34

    move/from16 v1, v39

    if-ge v0, v1, :cond_c95

    .line 662
    move-object/from16 v0, v35

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 663
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, v17

    if-ne v14, v0, :cond_c89

    .line 664
    add-int/lit8 v39, v34, -0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    check-cast v12, Lorg/jsoup/nodes/Element;

    .line 665
    .restart local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x1

    .line 661
    :cond_c86
    add-int/lit8 v34, v34, 0x1

    goto :goto_c5c

    .line 666
    :cond_c89
    if-eqz v33, :cond_c86

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_c86

    .line 667
    move-object/from16 v18, v14

    .line 671
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_c95
    if-nez v18, :cond_cad

    .line 672
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 673
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 674
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 679
    :cond_cad
    move-object/from16 v27, v18

    .line 680
    .local v27, "node":Lorg/jsoup/nodes/Element;
    move-object/from16 v24, v18

    .line 682
    .local v24, "lastNode":Lorg/jsoup/nodes/Element;
    const/16 v23, 0x0

    .local v23, "j":I
    :goto_cb3
    const/16 v39, 0x3

    move/from16 v0, v23

    move/from16 v1, v39

    if-ge v0, v1, :cond_ce7

    .line 683
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_ccd

    .line 684
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v27

    .line 685
    :cond_ccd
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isInActiveFormattingElements(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_ce1

    .line 686
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 682
    :goto_cde
    add-int/lit8 v23, v23, 0x1

    goto :goto_cb3

    .line 688
    :cond_ce1
    move-object/from16 v0, v27

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_d49

    .line 707
    :cond_ce7
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndTableFosters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2100()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d8e

    .line 708
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_cfe

    .line 709
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 710
    :cond_cfe
    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertInFosterParent(Lorg/jsoup/nodes/Node;)V

    .line 717
    :goto_d05
    new-instance v4, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v39

    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-direct {v4, v0, v1}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 718
    .local v4, "adopter":Lorg/jsoup/nodes/Element;
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 719
    invoke-virtual/range {v18 .. v18}, Lorg/jsoup/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v39

    invoke-virtual/range {v18 .. v18}, Lorg/jsoup/nodes/Element;->childNodeSize()I

    move-result v40

    move/from16 v0, v40

    new-array v0, v0, [Lorg/jsoup/nodes/Node;

    move-object/from16 v40, v0

    invoke-interface/range {v39 .. v40}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lorg/jsoup/nodes/Node;

    .line 720
    .local v11, "childNodes":[Lorg/jsoup/nodes/Node;
    move-object v5, v11

    .local v5, "arr$":[Lorg/jsoup/nodes/Node;
    array-length v0, v5

    move/from16 v25, v0

    .local v25, "len$":I
    const/16 v21, 0x0

    .local v21, "i$":I
    :goto_d3b
    move/from16 v0, v21

    move/from16 v1, v25

    if-ge v0, v1, :cond_d9e

    aget-object v10, v5, v21

    .line 721
    .local v10, "childNode":Lorg/jsoup/nodes/Node;
    invoke-virtual {v4, v10}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 720
    add-int/lit8 v21, v21, 0x1

    goto :goto_d3b

    .line 691
    .end local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .end local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .end local v10    # "childNode":Lorg/jsoup/nodes/Node;
    .end local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .end local v21    # "i$":I
    .end local v25    # "len$":I
    :cond_d49
    new-instance v31, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v27 .. v27}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v39

    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v31

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 692
    .local v31, "replacement":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceActiveFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 693
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceOnStack(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 694
    move-object/from16 v27, v31

    .line 696
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_d7a

    .line 700
    :cond_d7a
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d83

    .line 701
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 702
    :cond_d83
    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 704
    move-object/from16 v24, v27

    goto/16 :goto_cde

    .line 712
    .end local v31    # "replacement":Lorg/jsoup/nodes/Element;
    :cond_d8e
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d97

    .line 713
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 714
    :cond_d97
    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_d05

    .line 723
    .restart local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .restart local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .restart local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .restart local v21    # "i$":I
    .restart local v25    # "len$":I
    :cond_d9e
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 724
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 726
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 727
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertOnStackAfter(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 640
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_bef

    .line 729
    .end local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .end local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .end local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .end local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    .end local v17    # "formatEl":Lorg/jsoup/nodes/Element;
    .end local v18    # "furthestBlock":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v21    # "i$":I
    .end local v23    # "j":I
    .end local v24    # "lastNode":Lorg/jsoup/nodes/Element;
    .end local v25    # "len$":I
    .end local v27    # "node":Lorg/jsoup/nodes/Element;
    .end local v33    # "seenFormattingElement":Z
    .end local v34    # "si":I
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    .end local v36    # "stackSize":I
    :cond_dbc
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_e13

    .line 730
    const-string v39, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_11

    .line 731
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_deb

    .line 732
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 733
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 735
    :cond_deb
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 736
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_e07

    .line 737
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 738
    :cond_e07
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 739
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    goto/16 :goto_11

    .line 741
    :cond_e13
    const-string v39, "br"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_e38

    .line 742
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 743
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "br"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 744
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 746
    :cond_e38
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 248
    :pswitch_data_e3e
    .packed-switch 0x1
        :pswitch_57
        :pswitch_63
        :pswitch_6d
        :pswitch_98f
        :pswitch_14
    .end packed-switch
.end method
