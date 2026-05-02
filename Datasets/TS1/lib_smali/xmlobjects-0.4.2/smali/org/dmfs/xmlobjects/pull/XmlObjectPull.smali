.class public Lorg/dmfs/xmlobjects/pull/XmlObjectPull;
.super Ljava/lang/Object;


# instance fields
.field private mContext:Lorg/dmfs/xmlobjects/XmlContext;

.field private mCurrentBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<*>;"
        }
    .end annotation
.end field

.field private final mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

.field private final mObjectStack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mParser:Lorg/xmlpull/v1/XmlPullParser;

.field private mParserContext:Lorg/dmfs/xmlobjects/pull/ParserContext;


# direct methods
.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/dmfs/xmlobjects/pull/ParserContext;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;-><init>(Lorg/xmlpull/v1/XmlPullParser;Lorg/dmfs/xmlobjects/pull/ParserContext;)V

    return-void
.end method

.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;Lorg/dmfs/xmlobjects/pull/ParserContext;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/dmfs/xmlobjects/pull/XmlPath;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-direct {v0, v1}, Lorg/dmfs/xmlobjects/pull/XmlPath;-><init>([Lorg/dmfs/xmlobjects/ElementDescriptor;)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mObjectStack:Ljava/util/LinkedList;

    iput-object p1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    iput-object p2, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParserContext:Lorg/dmfs/xmlobjects/pull/ParserContext;

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParserContext:Lorg/dmfs/xmlobjects/pull/ParserContext;

    invoke-virtual {v0, p1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setXmlPullParser(Lorg/xmlpull/v1/XmlPullParser;)V

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParserContext:Lorg/dmfs/xmlobjects/pull/ParserContext;

    invoke-virtual {v0, p0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setObjectPullParser(Lorg/dmfs/xmlobjects/pull/XmlObjectPull;)V

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    return-void
.end method

.method private pullInternal(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;ZZ)Ljava/lang/Object;
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/pull/XmlPath;",
            "ZZ)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->getContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mContext:Lorg/dmfs/xmlobjects/XmlContext;

    if-eq v1, v2, :cond_18

    invoke-virtual {p1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->getContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v1

    sget-object v2, Lorg/dmfs/xmlobjects/ElementDescriptor;->DEFAULT_CONTEXT:Lorg/dmfs/xmlobjects/XmlContext;

    if-eq v1, v2, :cond_18

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "type is from an invalid context"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_18
    iget-object v6, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParserContext:Lorg/dmfs/xmlobjects/pull/ParserContext;

    iget-object v9, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    iget-object v3, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iget-object v10, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

    iget-object v11, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mObjectStack:Ljava/util/LinkedList;

    iget-object v1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v1}, Lorg/dmfs/xmlobjects/pull/XmlPath;->peek()Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v4

    const v2, 0x7fffffff

    invoke-virtual {v11}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    move v7, v2

    move-object v8, v3

    :goto_31
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v3

    packed-switch v2, :pswitch_data_10a

    :cond_3c
    move v2, v7

    move-object v3, v8

    :goto_3e
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move v7, v2

    move-object v8, v3

    goto :goto_31

    :pswitch_44
    if-ge v3, v7, :cond_3c

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v2

    iget-object v5, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mContext:Lorg/dmfs/xmlobjects/XmlContext;

    invoke-static {v2, v4, v5}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v2

    if-eqz v2, :cond_a8

    if-eqz p4, :cond_68

    if-ne p1, v2, :cond_68

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Lorg/dmfs/xmlobjects/pull/XmlPath;->matches(Lorg/dmfs/xmlobjects/pull/XmlPath;)Z

    move-result v1

    if-eqz v1, :cond_68

    const/4 v5, 0x0

    :goto_67
    return-object v5

    :cond_68
    if-nez p2, :cond_6e

    invoke-virtual {v6, v2}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getRecycled(Lorg/dmfs/xmlobjects/ElementDescriptor;)Ljava/lang/Object;

    move-result-object p2

    :cond_6e
    invoke-virtual {v10, v2}, Lorg/dmfs/xmlobjects/pull/XmlPath;->append(Lorg/dmfs/xmlobjects/ElementDescriptor;)V

    iget-object v1, v2, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iput-object v1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    move-object/from16 v0, p2

    invoke-interface {v1, v2, v0, v6}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object v4

    const/16 p2, 0x0

    const/4 v3, 0x0

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v12

    move v8, v3

    move-object v3, v4

    :goto_84
    if-ge v8, v12, :cond_9f

    invoke-interface {v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v4

    invoke-interface {v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {v1 .. v6}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v8, 0x1

    move v8, v3

    move-object v3, v4

    goto :goto_84

    :cond_9f
    invoke-virtual {v11, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    :goto_a2
    move-object v4, v2

    move v2, v7

    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    goto :goto_3e

    :cond_a8
    move v7, v3

    move-object v2, v4

    move-object v3, v1

    move-object v1, v8

    goto :goto_a2

    :pswitch_ad
    if-ge v3, v7, :cond_ee

    if-eqz p5, :cond_bb

    add-int/lit8 v2, v3, -0x1

    invoke-virtual/range {p3 .. p3}, Lorg/dmfs/xmlobjects/pull/XmlPath;->length()I

    move-result v3

    if-ge v2, v3, :cond_bb

    const/4 v5, 0x0

    goto :goto_67

    :cond_bb
    invoke-interface {v8, v4, v1, v6}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v10}, Lorg/dmfs/xmlobjects/pull/XmlPath;->pop()Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-virtual {v11}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    invoke-virtual {v10}, Lorg/dmfs/xmlobjects/pull/XmlPath;->peek()Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v2

    invoke-virtual {v11}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v3

    if-eqz v2, :cond_108

    iget-object v1, v2, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iput-object v1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    :goto_d3
    if-ne p1, v4, :cond_e3

    if-nez p4, :cond_e3

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Lorg/dmfs/xmlobjects/pull/XmlPath;->matches(Lorg/dmfs/xmlobjects/pull/XmlPath;)Z

    move-result v8

    if-eqz v8, :cond_e3

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_67

    :cond_e3
    invoke-interface/range {v1 .. v6}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v2

    move v2, v7

    move-object v13, v3

    move-object v3, v1

    move-object v1, v13

    goto/16 :goto_3e

    :cond_ee
    if-ne v3, v7, :cond_3c

    const v7, 0x7fffffff

    move v2, v7

    move-object v3, v8

    goto/16 :goto_3e

    :pswitch_f7
    if-ge v3, v7, :cond_3c

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v8, v4, v1, v2, v6}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object v1

    move v2, v7

    move-object v3, v8

    goto/16 :goto_3e

    :pswitch_105
    const/4 v5, 0x0

    goto/16 :goto_67

    :cond_108
    move-object v1, v8

    goto :goto_d3

    :pswitch_data_10a
    .packed-switch 0x1
        :pswitch_105
        :pswitch_44
        :pswitch_ad
        :pswitch_f7
    .end packed-switch
.end method


# virtual methods
.method public getCurrentDepth()I
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v0}, Lorg/dmfs/xmlobjects/pull/XmlPath;->length()I

    move-result v0

    return v0
.end method

.method public getCurrentElementDescriptor()Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mCurrentElementDescriptorPath:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v0}, Lorg/dmfs/xmlobjects/pull/XmlPath;->peek()Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentElementQualifiedName()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    return-object v0
.end method

.method public isEndOfDocument()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x1

    iget-object v1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    if-ne v1, v0, :cond_a

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public moveToNext(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/pull/XmlPath;)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/pull/XmlPath;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pullInternal(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;ZZ)Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->isEndOfDocument()Z

    move-result v0

    if-nez v0, :cond_10

    :goto_f
    return v4

    :cond_10
    move v4, v5

    goto :goto_f
.end method

.method public moveToNextSibling(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/pull/XmlPath;)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/pull/XmlPath;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x1

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pullInternal(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;ZZ)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    invoke-virtual {p2}, Lorg/dmfs/xmlobjects/pull/XmlPath;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    if-ne v0, v1, :cond_1b

    :cond_1a
    :goto_1a
    return v4

    :cond_1b
    const/4 v4, 0x0

    goto :goto_1a
.end method

.method public pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/pull/XmlPath;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pullInternal(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;ZZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setContext(Lorg/dmfs/xmlobjects/XmlContext;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->mContext:Lorg/dmfs/xmlobjects/XmlContext;

    return-void
.end method
