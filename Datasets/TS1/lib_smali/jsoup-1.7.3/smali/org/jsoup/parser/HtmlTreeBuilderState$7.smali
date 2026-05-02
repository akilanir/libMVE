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
    .line 758
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v1

    .line 759
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v3

    .line 760
    .local v3, "stack":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {v3}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 761
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 762
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 763
    .local v2, "node":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 764
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 765
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 766
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 767
    :cond_3a
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 776
    .end local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_3d
    const/4 v4, 0x1

    :goto_3e
    return v4

    .line 770
    .restart local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_3f
    invoke-virtual {p2, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 771
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 772
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

    packed-switch v39, :pswitch_data_e22

    .line 754
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
    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {v9}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v39

    if-eqz v39, :cond_3f

    .line 256
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 257
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_11

    .line 259
    :cond_3f
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
    :pswitch_51
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_11

    .line 270
    :pswitch_5d
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 271
    const/16 v39, 0x0

    goto :goto_13

    .line 274
    :pswitch_67
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

    if-eqz v39, :cond_b8

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
    :cond_94
    :goto_94
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

    if-nez v39, :cond_94

    .line 282
    invoke-virtual/range {v19 .. v19}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_94

    .line 284
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v19    # "html":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    :cond_b8
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartToHead:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$500()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d4

    .line 285
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v39

    goto/16 :goto_13

    .line 286
    :cond_d4
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_15e

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

    if-eq v0, v1, :cond_11b

    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_11f

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

    if-nez v39, :cond_11f

    .line 291
    :cond_11b
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 293
    :cond_11f
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
    :cond_13c
    :goto_13c
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

    if-nez v39, :cond_13c

    .line 297
    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_13c

    .line 300
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v8    # "body":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_15e
    const-string v39, "frameset"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_1ea

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

    if-eq v0, v1, :cond_1a5

    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1a9

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

    if-nez v39, :cond_1a9

    .line 305
    :cond_1a5
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 306
    :cond_1a9
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v39

    if-nez v39, :cond_1b3

    .line 307
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 309
    :cond_1b3
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

    if-eqz v39, :cond_1c8

    .line 311
    invoke-virtual/range {v32 .. v32}, Lorg/jsoup/nodes/Element;->remove()V

    .line 313
    :cond_1c8
    :goto_1c8
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1d8

    .line 314
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_1c8

    .line 315
    :cond_1d8
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
    :cond_1ea
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_21b

    .line 319
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_212

    .line 320
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 322
    :cond_212
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 323
    :cond_21b
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_268

    .line 324
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_243

    .line 325
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 327
    :cond_243
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_25f

    .line 328
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 329
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    .line 331
    :cond_25f
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 332
    :cond_268
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPreListing:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2a2

    .line 333
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_290

    .line 334
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 336
    :cond_290
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
    :cond_2a2
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_2e6

    .line 340
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_2bf

    .line 341
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 342
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 344
    :cond_2bf
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2d9

    .line 345
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 347
    :cond_2d9
    const/16 v39, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v37

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;

    goto/16 :goto_11

    .line 348
    :cond_2e6
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_367

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
    :goto_305
    if-lez v20, :cond_32b

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

    if-eqz v39, :cond_34e

    .line 354
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "li"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 360
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_32b
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_345

    .line 361
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 363
    :cond_345
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 357
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_34e
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_364

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_32b

    .line 351
    :cond_364
    add-int/lit8 v20, v20, -0x1

    goto :goto_305

    .line 364
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_367
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3ee

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
    :goto_388
    if-lez v20, :cond_3b2

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

    if-eqz v39, :cond_3d5

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
    :cond_3b2
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3cc

    .line 377
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 379
    :cond_3cc
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 373
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_3d5
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_3eb

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3b2

    .line 367
    :cond_3eb
    add-int/lit8 v20, v20, -0x1

    goto :goto_388

    .line 380
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    :cond_3ee
    const-string v39, "plaintext"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_428

    .line 381
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_414

    .line 382
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 384
    :cond_414
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
    :cond_428
    const-string v39, "button"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_473

    .line 387
    const-string v39, "button"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_45e

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
    :cond_45e
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
    :cond_473
    const-string v39, "a"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_4cc

    .line 398
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_4ba

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
    if-eqz v30, :cond_4ba

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
    :cond_4ba
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
    :cond_4cc
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Formatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1100()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_4ec

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
    :cond_4ec
    const-string v39, "nobr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_52e

    .line 417
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 418
    const-string v39, "nobr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_51f

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
    :cond_51f
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
    :cond_52e
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_554

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
    :cond_554
    const-string v39, "table"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_5a5

    .line 431
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getDocument()Lorg/jsoup/nodes/Document;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Document;->quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;

    move-result-object v39

    sget-object v40, Lorg/jsoup/nodes/Document$QuirksMode;->quirks:Lorg/jsoup/nodes/Document$QuirksMode;

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    if-eq v0, v1, :cond_58a

    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_58a

    .line 432
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 434
    :cond_58a
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
    :cond_5a5
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartEmptyFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1300()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_5c8

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
    :cond_5c8
    const-string v39, "input"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_5fa

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
    :cond_5fa
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartMedia:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1400()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_611

    .line 447
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 448
    :cond_611
    const-string v39, "hr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_649

    .line 449
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_637

    .line 450
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 452
    :cond_637
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
    :cond_649
    const-string v39, "image"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_668

    .line 456
    const-string v39, "img"

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/Token$StartTag;->name(Ljava/lang/String;)Lorg/jsoup/parser/Token$Tag;

    .line 457
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 458
    :cond_668
    const-string v39, "isindex"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_78a

    .line 460
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 461
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_685

    .line 462
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 464
    :cond_685
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 465
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "form"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 466
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "action"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_6c5

    .line 467
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v16

    .line 468
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

    .line 470
    .end local v16    # "form":Lorg/jsoup/nodes/Element;
    :cond_6c5
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "hr"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 471
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "label"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 473
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_73a

    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 477
    .local v29, "prompt":Ljava/lang/String;
    :goto_6fb
    new-instance v39, Lorg/jsoup/parser/Token$Character;

    move-object/from16 v0, v39

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$Character;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 480
    new-instance v22, Lorg/jsoup/nodes/Attributes;

    invoke-direct/range {v22 .. v22}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 481
    .local v22, "inputAttribs":Lorg/jsoup/nodes/Attributes;
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_71a
    :goto_71a
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_73d

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Attribute;

    .line 482
    .local v6, "attr":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v6}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartInputAttribs:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1500()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_71a

    .line 483
    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_71a

    .line 473
    .end local v6    # "attr":Lorg/jsoup/nodes/Attribute;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_73a
    const-string v29, "This is a searchable index. Enter search keywords: "

    goto :goto_6fb

    .line 485
    .restart local v21    # "i$":Ljava/util/Iterator;
    .restart local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .restart local v29    # "prompt":Ljava/lang/String;
    :cond_73d
    const-string v39, "name"

    const-string v40, "isindex"

    move-object/from16 v0, v22

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "input"

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 487
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "label"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 488
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "hr"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 489
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "form"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    goto/16 :goto_11

    .line 490
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_78a
    const-string v39, "textarea"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7bf

    .line 491
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 493
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    sget-object v40, Lorg/jsoup/parser/TokeniserState;->Rcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 494
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 495
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 496
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->Text:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 497
    :cond_7bf
    const-string v39, "xmp"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7fa

    .line 498
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_7e5

    .line 499
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "p"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 501
    :cond_7e5
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 502
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 503
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 504
    :cond_7fa
    const-string v39, "iframe"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_818

    .line 505
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 506
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 507
    :cond_818
    const-string v39, "noembed"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_82d

    .line 509
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 510
    :cond_82d
    const-string v39, "select"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_88e

    .line 511
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 512
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 513
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 515
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->state()Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-result-object v38

    .line 516
    .local v38, "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_878

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_878

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_878

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_878

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_883

    .line 517
    :cond_878
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelectInTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 519
    :cond_883
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelect:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 520
    .end local v38    # "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    :cond_88e
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartOptions:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_8c6

    .line 521
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "option"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_8ba

    .line 522
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "option"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 523
    :cond_8ba
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 524
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 525
    :cond_8c6
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartRuby:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_90c

    .line 526
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_11

    .line 527
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 528
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "ruby"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_903

    .line 529
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 530
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToBefore(Ljava/lang/String;)V

    .line 532
    :cond_903
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 534
    :cond_90c
    const-string v39, "math"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_92d

    .line 535
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 537
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 538
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 539
    :cond_92d
    const-string v39, "svg"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_94e

    .line 540
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 542
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 543
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 544
    :cond_94e
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartDrop:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_967

    .line 545
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 546
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 548
    :cond_967
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 549
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 554
    .end local v26    # "name":Ljava/lang/String;
    .end local v37    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :pswitch_973
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v15

    .line 555
    .local v15, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v15}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v26

    .line 556
    .restart local v26    # "name":Ljava/lang/String;
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_9a9

    .line 557
    const-string v39, "body"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_99e

    .line 558
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 559
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 562
    :cond_99e
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->AfterBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 564
    :cond_9a9
    const-string v39, "html"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_9ce

    .line 565
    new-instance v39, Lorg/jsoup/parser/Token$EndTag;

    const-string v40, "body"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v28

    .line 566
    .local v28, "notIgnored":Z
    if-eqz v28, :cond_11

    .line 567
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 568
    .end local v28    # "notIgnored":Z
    :cond_9ce
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1900()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_a16

    .line 569
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9f1

    .line 571
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 572
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 574
    :cond_9f1
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 575
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a0d

    .line 576
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 577
    :cond_a0d
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 579
    :cond_a16
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_a69

    .line 580
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v13

    .line 581
    .local v13, "currentForm":Lorg/jsoup/nodes/Element;
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFormElement(Lorg/jsoup/nodes/FormElement;)V

    .line 582
    if-eqz v13, :cond_a3b

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a46

    .line 583
    :cond_a3b
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 584
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 586
    :cond_a46
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 587
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a62

    .line 588
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 590
    :cond_a62
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    goto/16 :goto_11

    .line 592
    .end local v13    # "currentForm":Lorg/jsoup/nodes/Element;
    :cond_a69
    const-string v39, "p"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_ac7

    .line 593
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a9e

    .line 594
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 595
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 596
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 598
    :cond_a9e
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 599
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_abe

    .line 600
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 601
    :cond_abe
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 603
    :cond_ac7
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_b11

    .line 604
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inListItemScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_ae8

    .line 605
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 606
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 608
    :cond_ae8
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 609
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_b08

    .line 610
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 611
    :cond_b08
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 613
    :cond_b11
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_b5d

    .line 614
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_b34

    .line 615
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 616
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 618
    :cond_b34
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 619
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_b54

    .line 620
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 621
    :cond_b54
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 623
    :cond_b5d
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_bb1

    .line 624
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope([Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_b84

    .line 625
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 626
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 628
    :cond_b84
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 629
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_ba4

    .line 630
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 631
    :cond_ba4
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose([Ljava/lang/String;)V

    goto/16 :goto_11

    .line 633
    :cond_bb1
    const-string v39, "sarcasm"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_bc3

    .line 635
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 636
    :cond_bc3
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndAdoptionFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_da0

    .line 639
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_bd3
    const/16 v39, 0x8

    move/from16 v0, v20

    move/from16 v1, v39

    if-ge v0, v1, :cond_11

    .line 640
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v17

    .line 641
    .local v17, "formatEl":Lorg/jsoup/nodes/Element;
    if-nez v17, :cond_beb

    .line 642
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 643
    :cond_beb
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_c07

    .line 644
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 645
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 646
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 647
    :cond_c07
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_c20

    .line 648
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 649
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 650
    :cond_c20
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_c31

    .line 651
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 653
    :cond_c31
    const/16 v18, 0x0

    .line 654
    .local v18, "furthestBlock":Lorg/jsoup/nodes/Element;
    const/4 v12, 0x0

    .line 655
    .local v12, "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x0

    .line 656
    .local v33, "seenFormattingElement":Z
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Lorg/jsoup/helper/DescendableLinkedList;

    move-result-object v35

    .line 659
    .restart local v35    # "stack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedList;->size()I

    move-result v36

    .line 660
    .local v36, "stackSize":I
    const/16 v34, 0x0

    .local v34, "si":I
    :goto_c40
    move/from16 v0, v34

    move/from16 v1, v36

    if-ge v0, v1, :cond_c79

    const/16 v39, 0x40

    move/from16 v0, v34

    move/from16 v1, v39

    if-ge v0, v1, :cond_c79

    .line 661
    move-object/from16 v0, v35

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 662
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, v17

    if-ne v14, v0, :cond_c6d

    .line 663
    add-int/lit8 v39, v34, -0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    check-cast v12, Lorg/jsoup/nodes/Element;

    .line 664
    .restart local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x1

    .line 660
    :cond_c6a
    add-int/lit8 v34, v34, 0x1

    goto :goto_c40

    .line 665
    :cond_c6d
    if-eqz v33, :cond_c6a

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_c6a

    .line 666
    move-object/from16 v18, v14

    .line 670
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_c79
    if-nez v18, :cond_c91

    .line 671
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 672
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 673
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 678
    :cond_c91
    move-object/from16 v27, v18

    .line 679
    .local v27, "node":Lorg/jsoup/nodes/Element;
    move-object/from16 v24, v18

    .line 681
    .local v24, "lastNode":Lorg/jsoup/nodes/Element;
    const/16 v23, 0x0

    .local v23, "j":I
    :goto_c97
    const/16 v39, 0x3

    move/from16 v0, v23

    move/from16 v1, v39

    if-ge v0, v1, :cond_ccb

    .line 682
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_cb1

    .line 683
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v27

    .line 684
    :cond_cb1
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isInActiveFormattingElements(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_cc5

    .line 685
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 681
    :goto_cc2
    add-int/lit8 v23, v23, 0x1

    goto :goto_c97

    .line 687
    :cond_cc5
    move-object/from16 v0, v27

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_d2d

    .line 706
    :cond_ccb
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndTableFosters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2100()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d72

    .line 707
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_ce2

    .line 708
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 709
    :cond_ce2
    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertInFosterParent(Lorg/jsoup/nodes/Node;)V

    .line 716
    :goto_ce9
    new-instance v4, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v39

    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-direct {v4, v0, v1}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 717
    .local v4, "adopter":Lorg/jsoup/nodes/Element;
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 718
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

    .line 719
    .local v11, "childNodes":[Lorg/jsoup/nodes/Node;
    move-object v5, v11

    .local v5, "arr$":[Lorg/jsoup/nodes/Node;
    array-length v0, v5

    move/from16 v25, v0

    .local v25, "len$":I
    const/16 v21, 0x0

    .local v21, "i$":I
    :goto_d1f
    move/from16 v0, v21

    move/from16 v1, v25

    if-ge v0, v1, :cond_d82

    aget-object v10, v5, v21

    .line 720
    .local v10, "childNode":Lorg/jsoup/nodes/Node;
    invoke-virtual {v4, v10}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 719
    add-int/lit8 v21, v21, 0x1

    goto :goto_d1f

    .line 690
    .end local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .end local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .end local v10    # "childNode":Lorg/jsoup/nodes/Node;
    .end local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .end local v21    # "i$":I
    .end local v25    # "len$":I
    :cond_d2d
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

    .line 691
    .local v31, "replacement":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceActiveFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 692
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceOnStack(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 693
    move-object/from16 v27, v31

    .line 695
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_d5e

    .line 699
    :cond_d5e
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d67

    .line 700
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 701
    :cond_d67
    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 703
    move-object/from16 v24, v27

    goto/16 :goto_cc2

    .line 711
    .end local v31    # "replacement":Lorg/jsoup/nodes/Element;
    :cond_d72
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d7b

    .line 712
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 713
    :cond_d7b
    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_ce9

    .line 722
    .restart local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .restart local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .restart local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .restart local v21    # "i$":I
    .restart local v25    # "len$":I
    :cond_d82
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 723
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 725
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 726
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertOnStackAfter(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 639
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_bd3

    .line 728
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
    :cond_da0
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_df7

    .line 729
    const-string v39, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_11

    .line 730
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_dcf

    .line 731
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 732
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 734
    :cond_dcf
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 735
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_deb

    .line 736
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 737
    :cond_deb
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 738
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    goto/16 :goto_11

    .line 740
    :cond_df7
    const-string v39, "br"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_e1c

    .line 741
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 742
    new-instance v39, Lorg/jsoup/parser/Token$StartTag;

    const-string v40, "br"

    invoke-direct/range {v39 .. v40}, Lorg/jsoup/parser/Token$StartTag;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 743
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 745
    :cond_e1c
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 248
    :pswitch_data_e22
    .packed-switch 0x1
        :pswitch_51
        :pswitch_5d
        :pswitch_67
        :pswitch_973
        :pswitch_14
    .end packed-switch
.end method
