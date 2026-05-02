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
    .line 244
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
    .line 755
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v0

    .line 756
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v3

    .line 757
    .local v3, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .local v2, "pos":I
    :goto_12
    if-ltz v2, :cond_3b

    .line 758
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 759
    .local v1, "node":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 760
    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 761
    invoke-virtual {p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_38

    .line 762
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 763
    :cond_38
    invoke-virtual {p2, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 772
    .end local v1    # "node":Lorg/jsoup/nodes/Element;
    :cond_3b
    const/4 v4, 0x1

    :goto_3c
    return v4

    .line 766
    .restart local v1    # "node":Lorg/jsoup/nodes/Element;
    :cond_3d
    invoke-virtual {p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v4

    if-eqz v4, :cond_48

    .line 767
    invoke-virtual {p2, p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 768
    const/4 v4, 0x0

    goto :goto_3c

    .line 757
    :cond_48
    add-int/lit8 v2, v2, -0x1

    goto :goto_12
.end method

.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z
    .registers 45
    .param p1, "t"    # Lorg/jsoup/parser/Token;
    .param p2, "tb"    # Lorg/jsoup/parser/HtmlTreeBuilder;

    .prologue
    .line 246
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$24;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    move-object/from16 v40, v0

    invoke-virtual/range {v40 .. v40}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v40

    aget v39, v39, v40

    packed-switch v39, :pswitch_data_dc4

    .line 751
    :cond_11
    :goto_11
    const/16 v39, 0x1

    :goto_13
    return v39

    .line 248
    :pswitch_14
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v9

    .line 249
    .local v9, "c":Lorg/jsoup/parser/Token$Character;
    invoke-virtual {v9}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$400()Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_30

    .line 251
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 252
    const/16 v39, 0x0

    goto :goto_13

    .line 253
    :cond_30
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v39

    if-eqz v39, :cond_45

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->isWhitespace(Lorg/jsoup/parser/Token;)Z
    invoke-static {v9}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$100(Lorg/jsoup/parser/Token;)Z

    move-result v39

    if-eqz v39, :cond_45

    .line 254
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 255
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_11

    .line 257
    :cond_45
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 258
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    .line 259
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto :goto_11

    .line 264
    .end local v9    # "c":Lorg/jsoup/parser/Token$Character;
    :pswitch_57
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_11

    .line 268
    :pswitch_63
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 269
    const/16 v39, 0x0

    goto :goto_13

    .line 272
    :pswitch_6d
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v37

    .line 273
    .local v37, "startTag":Lorg/jsoup/parser/Token$StartTag;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v26

    .line 274
    .local v26, "name":Ljava/lang/String;
    const-string v39, "html"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_c0

    .line 275
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 277
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v39

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/jsoup/nodes/Element;

    .line 278
    .local v19, "html":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->getAttributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, "i$":Ljava/util/Iterator;
    :cond_9c
    :goto_9c
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_11

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Attribute;

    .line 279
    .local v7, "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v7}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v19

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9c

    .line 280
    invoke-virtual/range {v19 .. v19}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_9c

    .line 282
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v19    # "html":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    :cond_c0
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartToHead:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$500()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_dc

    .line 283
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z

    move-result v39

    goto/16 :goto_13

    .line 284
    :cond_dc
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_166

    .line 285
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 286
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v35

    .line 287
    .local v35, "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_123

    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_127

    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "body"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_127

    .line 289
    :cond_123
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 291
    :cond_127
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 292
    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jsoup/nodes/Element;

    .line 293
    .local v8, "body":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v37 .. v37}, Lorg/jsoup/parser/Token$StartTag;->getAttributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_144
    :goto_144
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_11

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Attribute;

    .line 294
    .restart local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v7}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v8, v0}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_144

    .line 295
    invoke-virtual {v8}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v0, v7}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_144

    .line 298
    .end local v7    # "attribute":Lorg/jsoup/nodes/Attribute;
    .end local v8    # "body":Lorg/jsoup/nodes/Element;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    :cond_166
    const-string v39, "frameset"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_1fc

    .line 299
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 300
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v35

    .line 301
    .restart local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-eq v0, v1, :cond_1ad

    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1b1

    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "body"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_1b1

    .line 303
    :cond_1ad
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 304
    :cond_1b1
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk()Z

    move-result v39

    if-nez v39, :cond_1bb

    .line 305
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 307
    :cond_1bb
    const/16 v39, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/jsoup/nodes/Element;

    .line 308
    .local v32, "second":Lorg/jsoup/nodes/Element;
    invoke-virtual/range {v32 .. v32}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_1d0

    .line 309
    invoke-virtual/range {v32 .. v32}, Lorg/jsoup/nodes/Element;->remove()V

    .line 311
    :cond_1d0
    :goto_1d0
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    const/16 v40, 0x1

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_1ea

    .line 312
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    add-int/lit8 v39, v39, -0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1d0

    .line 313
    :cond_1ea
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 314
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 316
    .end local v32    # "second":Lorg/jsoup/nodes/Element;
    .end local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    :cond_1fc
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_228

    .line 317
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_21f

    .line 318
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 320
    :cond_21f
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 321
    :cond_228
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_270

    .line 322
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_24b

    .line 323
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 325
    :cond_24b
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_267

    .line 326
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 327
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    .line 329
    :cond_267
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 330
    :cond_270
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartPreListing:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2a5

    .line 331
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_293

    .line 332
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 334
    :cond_293
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 336
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 337
    :cond_2a5
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_2e4

    .line 338
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_2c2

    .line 339
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 340
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 342
    :cond_2c2
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_2d7

    .line 343
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 345
    :cond_2d7
    const/16 v39, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v37

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;

    goto/16 :goto_11

    .line 346
    :cond_2e4
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_35b

    .line 347
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 348
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v35

    .line 349
    .restart local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    add-int/lit8 v20, v39, -0x1

    .local v20, "i":I
    :goto_303
    if-lez v20, :cond_324

    .line 350
    move-object/from16 v0, v35

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 351
    .local v14, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "li"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_342

    .line 352
    const-string v39, "li"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 358
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_324
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_339

    .line 359
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 361
    :cond_339
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 355
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_342
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_358

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_324

    .line 349
    :cond_358
    add-int/lit8 v20, v20, -0x1

    goto :goto_303

    .line 362
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    :cond_35b
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3d8

    .line 363
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 364
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v35

    .line 365
    .restart local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v39

    add-int/lit8 v20, v39, -0x1

    .restart local v20    # "i":I
    :goto_37c
    if-lez v20, :cond_3a1

    .line 366
    move-object/from16 v0, v35

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 367
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3bf

    .line 368
    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 374
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_3a1
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3b6

    .line 375
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 377
    :cond_3b6
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 371
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_3bf
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_3d5

    invoke-virtual {v14}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartLiBreakers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$900()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3a1

    .line 365
    :cond_3d5
    add-int/lit8 v20, v20, -0x1

    goto :goto_37c

    .line 378
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    .end local v20    # "i":I
    .end local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    :cond_3d8
    const-string v39, "plaintext"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_40d

    .line 379
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_3f9

    .line 380
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 382
    :cond_3f9
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 383
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    sget-object v40, Lorg/jsoup/parser/TokeniserState;->PLAINTEXT:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_11

    .line 384
    :cond_40d
    const-string v39, "button"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_453

    .line 385
    const-string v39, "button"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_43e

    .line 387
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 388
    const-string v39, "button"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 389
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    goto/16 :goto_11

    .line 391
    :cond_43e
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 392
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 393
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 395
    :cond_453
    const-string v39, "a"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_4a7

    .line 396
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_495

    .line 397
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 398
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 401
    const-string v39, "a"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v30

    .line 402
    .local v30, "remainingA":Lorg/jsoup/nodes/Element;
    if-eqz v30, :cond_495

    .line 403
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 404
    move-object/from16 v0, p2

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 407
    .end local v30    # "remainingA":Lorg/jsoup/nodes/Element;
    :cond_495
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 408
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 409
    .local v3, "a":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 410
    .end local v3    # "a":Lorg/jsoup/nodes/Element;
    :cond_4a7
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Formatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1100()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_4c7

    .line 411
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 412
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 413
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 414
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_4c7
    const-string v39, "nobr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_504

    .line 415
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 416
    const-string v39, "nobr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_4f5

    .line 417
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 418
    const-string v39, "nobr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 419
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 421
    :cond_4f5
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 422
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    goto/16 :goto_11

    .line 423
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_504
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_52a

    .line 424
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 425
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 426
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 427
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 428
    :cond_52a
    const-string v39, "table"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_576

    .line 429
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getDocument()Lorg/jsoup/nodes/Document;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Document;->quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;

    move-result-object v39

    sget-object v40, Lorg/jsoup/nodes/Document$QuirksMode;->quirks:Lorg/jsoup/nodes/Document$QuirksMode;

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    if-eq v0, v1, :cond_55b

    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_55b

    .line 430
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 432
    :cond_55b
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 433
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 434
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 435
    :cond_576
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartEmptyFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1300()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_599

    .line 436
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 437
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 438
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 439
    :cond_599
    const-string v39, "input"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_5cb

    .line 440
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 441
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v14

    .line 442
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    const-string v39, "type"

    move-object/from16 v0, v39

    invoke-virtual {v14, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    const-string v40, "hidden"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_11

    .line 443
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 444
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_5cb
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartMedia:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1400()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_5e2

    .line 445
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 446
    :cond_5e2
    const-string v39, "hr"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_615

    .line 447
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_603

    .line 448
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 450
    :cond_603
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 451
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    goto/16 :goto_11

    .line 452
    :cond_615
    const-string v39, "image"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_64a

    .line 453
    const-string v39, "svg"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-nez v39, :cond_641

    .line 454
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

    .line 456
    :cond_641
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 457
    :cond_64a
    const-string v39, "isindex"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_749

    .line 459
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 460
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v39

    if-eqz v39, :cond_667

    .line 461
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 463
    :cond_667
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 464
    const-string v39, "form"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 465
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "action"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_6a2

    .line 466
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v16

    .line 467
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

    .line 469
    .end local v16    # "form":Lorg/jsoup/nodes/Element;
    :cond_6a2
    const-string v39, "hr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 470
    const-string v39, "label"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 472
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_711

    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    const-string v40, "prompt"

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 476
    .local v29, "prompt":Ljava/lang/String;
    :goto_6ce
    new-instance v39, Lorg/jsoup/parser/Token$Character;

    invoke-direct/range {v39 .. v39}, Lorg/jsoup/parser/Token$Character;-><init>()V

    move-object/from16 v0, v39

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/Token$Character;->data(Ljava/lang/String;)Lorg/jsoup/parser/Token$Character;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    .line 479
    new-instance v22, Lorg/jsoup/nodes/Attributes;

    invoke-direct/range {v22 .. v22}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 480
    .local v22, "inputAttribs":Lorg/jsoup/nodes/Attributes;
    move-object/from16 v0, v37

    iget-object v0, v0, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_6f1
    :goto_6f1
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_714

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Attribute;

    .line 481
    .local v6, "attr":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v6}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartInputAttribs:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1500()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_6f1

    .line 482
    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_6f1

    .line 472
    .end local v6    # "attr":Lorg/jsoup/nodes/Attribute;
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_711
    const-string v29, "This is a searchable index. Enter search keywords: "

    goto :goto_6ce

    .line 484
    .restart local v21    # "i$":Ljava/util/Iterator;
    .restart local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .restart local v29    # "prompt":Ljava/lang/String;
    :cond_714
    const-string v39, "name"

    const-string v40, "isindex"

    move-object/from16 v0, v22

    move-object/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    const-string v39, "input"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)Z

    .line 486
    const-string v39, "label"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 487
    const-string v39, "hr"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 488
    const-string v39, "form"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    goto/16 :goto_11

    .line 489
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "inputAttribs":Lorg/jsoup/nodes/Attributes;
    .end local v29    # "prompt":Ljava/lang/String;
    :cond_749
    const-string v39, "textarea"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_77e

    .line 490
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 492
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    sget-object v40, Lorg/jsoup/parser/TokeniserState;->Rcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 493
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 494
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 495
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->Text:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 496
    :cond_77e
    const-string v39, "xmp"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7b4

    .line 497
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_79f

    .line 498
    const-string v39, "p"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 500
    :cond_79f
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 501
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 502
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 503
    :cond_7b4
    const-string v39, "iframe"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7d2

    .line 504
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 505
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 506
    :cond_7d2
    const-string v39, "noembed"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_7e7

    .line 508
    move-object/from16 v0, v37

    move-object/from16 v1, p2

    # invokes: Lorg/jsoup/parser/HtmlTreeBuilderState;->handleRawtext(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V
    invoke-static {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilderState;->access$300(Lorg/jsoup/parser/Token$StartTag;Lorg/jsoup/parser/HtmlTreeBuilder;)V

    goto/16 :goto_11

    .line 509
    :cond_7e7
    const-string v39, "select"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_848

    .line 510
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 511
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 512
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk(Z)V

    .line 514
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->state()Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-result-object v38

    .line 515
    .local v38, "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_832

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_832

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_832

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_832

    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual/range {v38 .. v39}, Lorg/jsoup/parser/HtmlTreeBuilderState;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_83d

    .line 516
    :cond_832
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelectInTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 518
    :cond_83d
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->InSelect:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 519
    .end local v38    # "state":Lorg/jsoup/parser/HtmlTreeBuilderState;
    :cond_848
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartOptions:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1600()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_87b

    .line 520
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "option"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_86f

    .line 521
    const-string v39, "option"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    .line 522
    :cond_86f
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 523
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 524
    :cond_87b
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartRuby:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_8c1

    .line 525
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_11

    .line 526
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 527
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    const-string v40, "ruby"

    invoke-virtual/range {v39 .. v40}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_8b8

    .line 528
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 529
    const-string v39, "ruby"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToBefore(Ljava/lang/String;)V

    .line 531
    :cond_8b8
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 533
    :cond_8c1
    const-string v39, "math"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_8e2

    .line 534
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 536
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 537
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 538
    :cond_8e2
    const-string v39, "svg"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_903

    .line 539
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 541
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    .line 542
    move-object/from16 v0, p2

    iget-object v0, v0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto/16 :goto_11

    .line 543
    :cond_903
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartDrop:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1800()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_91c

    .line 544
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 545
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 547
    :cond_91c
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->reconstructFormattingElements()V

    .line 548
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_11

    .line 553
    .end local v26    # "name":Ljava/lang/String;
    .end local v37    # "startTag":Lorg/jsoup/parser/Token$StartTag;
    :pswitch_928
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v15

    .line 554
    .local v15, "endTag":Lorg/jsoup/parser/Token$EndTag;
    invoke-virtual {v15}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v26

    .line 555
    .restart local v26    # "name":Ljava/lang/String;
    const-string v39, "body"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_95e

    .line 556
    const-string v39, "body"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_953

    .line 557
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 558
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 561
    :cond_953
    sget-object v39, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->AfterBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_11

    .line 563
    :cond_95e
    const-string v39, "html"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_97e

    .line 564
    const-string v39, "body"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processEndTag(Ljava/lang/String;)Z

    move-result v28

    .line 565
    .local v28, "notIgnored":Z
    if-eqz v28, :cond_11

    .line 566
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 567
    .end local v28    # "notIgnored":Z
    :cond_97e
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndClosers:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1900()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_9c6

    .line 568
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9a1

    .line 570
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 571
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 573
    :cond_9a1
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 574
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_9bd

    .line 575
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 576
    :cond_9bd
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 578
    :cond_9c6
    const-string v39, "form"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_a19

    .line 579
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFormElement()Lorg/jsoup/nodes/FormElement;

    move-result-object v13

    .line 580
    .local v13, "currentForm":Lorg/jsoup/nodes/Element;
    const/16 v39, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFormElement(Lorg/jsoup/nodes/FormElement;)V

    .line 581
    if-eqz v13, :cond_9eb

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_9f6

    .line 582
    :cond_9eb
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 583
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 585
    :cond_9f6
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 586
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a12

    .line 587
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 589
    :cond_a12
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    goto/16 :goto_11

    .line 591
    .end local v13    # "currentForm":Lorg/jsoup/nodes/Element;
    :cond_a19
    const-string v39, "p"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_a6e

    .line 592
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inButtonScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a45

    .line 593
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 594
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 595
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Lorg/jsoup/parser/HtmlTreeBuilder;->process(Lorg/jsoup/parser/Token;)Z

    move-result v39

    goto/16 :goto_13

    .line 597
    :cond_a45
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 598
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_a65

    .line 599
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 600
    :cond_a65
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 602
    :cond_a6e
    const-string v39, "li"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_ab8

    .line 603
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inListItemScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_a8f

    .line 604
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 605
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 607
    :cond_a8f
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 608
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_aaf

    .line 609
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 610
    :cond_aaf
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 612
    :cond_ab8
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->DdDt:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_b04

    .line 613
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_adb

    .line 614
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 615
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 617
    :cond_adb
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 618
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_afb

    .line 619
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 620
    :cond_afb
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 622
    :cond_b04
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_b58

    .line 623
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope([Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_b2b

    .line 624
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 625
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 627
    :cond_b2b
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 628
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_b4b

    .line 629
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 630
    :cond_b4b
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->Headings:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$700()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose([Ljava/lang/String;)V

    goto/16 :goto_11

    .line 632
    :cond_b58
    const-string v39, "sarcasm"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_b6a

    .line 634
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 635
    :cond_b6a
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndAdoptionFormatters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2000()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d47

    .line 637
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_b7a
    const/16 v39, 0x8

    move/from16 v0, v20

    move/from16 v1, v39

    if-ge v0, v1, :cond_11

    .line 638
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v17

    .line 639
    .local v17, "formatEl":Lorg/jsoup/nodes/Element;
    if-nez v17, :cond_b92

    .line 640
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 641
    :cond_b92
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_bae

    .line 642
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 643
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 644
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 645
    :cond_bae
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_bc7

    .line 646
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 647
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 648
    :cond_bc7
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_bd8

    .line 649
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 651
    :cond_bd8
    const/16 v18, 0x0

    .line 652
    .local v18, "furthestBlock":Lorg/jsoup/nodes/Element;
    const/4 v12, 0x0

    .line 653
    .local v12, "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x0

    .line 654
    .local v33, "seenFormattingElement":Z
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getStack()Ljava/util/ArrayList;

    move-result-object v35

    .line 657
    .restart local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v36

    .line 658
    .local v36, "stackSize":I
    const/16 v34, 0x0

    .local v34, "si":I
    :goto_be7
    move/from16 v0, v34

    move/from16 v1, v36

    if-ge v0, v1, :cond_c20

    const/16 v39, 0x40

    move/from16 v0, v34

    move/from16 v1, v39

    if-ge v0, v1, :cond_c20

    .line 659
    move-object/from16 v0, v35

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jsoup/nodes/Element;

    .line 660
    .restart local v14    # "el":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, v17

    if-ne v14, v0, :cond_c14

    .line 661
    add-int/lit8 v39, v34, -0x1

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    check-cast v12, Lorg/jsoup/nodes/Element;

    .line 662
    .restart local v12    # "commonAncestor":Lorg/jsoup/nodes/Element;
    const/16 v33, 0x1

    .line 658
    :cond_c11
    add-int/lit8 v34, v34, 0x1

    goto :goto_be7

    .line 663
    :cond_c14
    if-eqz v33, :cond_c11

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSpecial(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_c11

    .line 664
    move-object/from16 v18, v14

    .line 668
    .end local v14    # "el":Lorg/jsoup/nodes/Element;
    :cond_c20
    if-nez v18, :cond_c38

    .line 669
    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 670
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 671
    const/16 v39, 0x1

    goto/16 :goto_13

    .line 676
    :cond_c38
    move-object/from16 v27, v18

    .line 677
    .local v27, "node":Lorg/jsoup/nodes/Element;
    move-object/from16 v24, v18

    .line 678
    .local v24, "lastNode":Lorg/jsoup/nodes/Element;
    const/16 v23, 0x0

    .local v23, "j":I
    :goto_c3e
    const/16 v39, 0x3

    move/from16 v0, v23

    move/from16 v1, v39

    if-ge v0, v1, :cond_c72

    .line 679
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-eqz v39, :cond_c58

    .line 680
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v27

    .line 681
    :cond_c58
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isInActiveFormattingElements(Lorg/jsoup/nodes/Element;)Z

    move-result v39

    if-nez v39, :cond_c6c

    .line 682
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 678
    :goto_c69
    add-int/lit8 v23, v23, 0x1

    goto :goto_c3e

    .line 684
    :cond_c6c
    move-object/from16 v0, v27

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_cd4

    .line 703
    :cond_c72
    invoke-virtual {v12}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyEndTableFosters:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$2100()[Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d19

    .line 704
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_c89

    .line 705
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 706
    :cond_c89
    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertInFosterParent(Lorg/jsoup/nodes/Node;)V

    .line 713
    :goto_c90
    new-instance v4, Lorg/jsoup/nodes/Element;

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v39

    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->getBaseUri()Ljava/lang/String;

    move-result-object v40

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-direct {v4, v0, v1}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 714
    .local v4, "adopter":Lorg/jsoup/nodes/Element;
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v39

    invoke-virtual/range {v17 .. v17}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 715
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

    .line 716
    .local v11, "childNodes":[Lorg/jsoup/nodes/Node;
    move-object v5, v11

    .local v5, "arr$":[Lorg/jsoup/nodes/Node;
    array-length v0, v5

    move/from16 v25, v0

    .local v25, "len$":I
    const/16 v21, 0x0

    .local v21, "i$":I
    :goto_cc6
    move/from16 v0, v21

    move/from16 v1, v25

    if-ge v0, v1, :cond_d29

    aget-object v10, v5, v21

    .line 717
    .local v10, "childNode":Lorg/jsoup/nodes/Node;
    invoke-virtual {v4, v10}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 716
    add-int/lit8 v21, v21, 0x1

    goto :goto_cc6

    .line 687
    .end local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .end local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .end local v10    # "childNode":Lorg/jsoup/nodes/Node;
    .end local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .end local v21    # "i$":I
    .end local v25    # "len$":I
    :cond_cd4
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

    .line 688
    .local v31, "replacement":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceActiveFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 689
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceOnStack(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 690
    move-object/from16 v27, v31

    .line 692
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_d05

    .line 696
    :cond_d05
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d0e

    .line 697
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 698
    :cond_d0e
    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 700
    move-object/from16 v24, v27

    goto/16 :goto_c69

    .line 708
    .end local v31    # "replacement":Lorg/jsoup/nodes/Element;
    :cond_d19
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v39

    if-eqz v39, :cond_d22

    .line 709
    invoke-virtual/range {v24 .. v24}, Lorg/jsoup/nodes/Element;->remove()V

    .line 710
    :cond_d22
    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto/16 :goto_c90

    .line 719
    .restart local v4    # "adopter":Lorg/jsoup/nodes/Element;
    .restart local v5    # "arr$":[Lorg/jsoup/nodes/Node;
    .restart local v11    # "childNodes":[Lorg/jsoup/nodes/Node;
    .restart local v21    # "i$":I
    .restart local v25    # "len$":I
    :cond_d29
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 720
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V

    .line 722
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeFromStack(Lorg/jsoup/nodes/Element;)Z

    .line 723
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertOnStackAfter(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 637
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_b7a

    .line 725
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
    .end local v35    # "stack":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    .end local v36    # "stackSize":I
    :cond_d47
    # getter for: Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->InBodyStartApplets:[Ljava/lang/String;
    invoke-static {}, Lorg/jsoup/parser/HtmlTreeBuilderState$Constants;->access$1200()[Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_d9e

    .line 726
    const-string v39, "name"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_11

    .line 727
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;)Z

    move-result v39

    if-nez v39, :cond_d76

    .line 728
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 729
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 731
    :cond_d76
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags()V

    .line 732
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_d92

    .line 733
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 734
    :cond_d92
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)V

    .line 735
    invoke-virtual/range {p2 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearFormattingElementsToLastMarker()V

    goto/16 :goto_11

    .line 737
    :cond_d9e
    const-string v39, "br"

    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-eqz v39, :cond_dbe

    .line 738
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 739
    const-string v39, "br"

    move-object/from16 v0, p2

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 740
    const/16 v39, 0x0

    goto/16 :goto_13

    .line 742
    :cond_dbe
    invoke-virtual/range {p0 .. p2}, Lorg/jsoup/parser/HtmlTreeBuilderState$7;->anyOtherEndTag(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v39

    goto/16 :goto_13

    .line 246
    :pswitch_data_dc4
    .packed-switch 0x1
        :pswitch_57
        :pswitch_63
        :pswitch_6d
        :pswitch_928
        :pswitch_14
    .end packed-switch
.end method
