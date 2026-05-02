.class public Lorg/dmfs/xmlobjects/pull/ParserContext;
.super Ljava/lang/Object;


# instance fields
.field private mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

.field private mParser:Lorg/xmlpull/v1/XmlPullParser;

.field private final mRecycledObjects:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mState:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mRecycledObjects:Ljava/util/Map;

    return-void
.end method

.method private getDepthStateMap(IZ)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    if-nez v0, :cond_13

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x10

    add-int/lit8 v2, p1, 0x8

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    :cond_13
    :goto_13
    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le p1, v0, :cond_22

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_22
    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz p2, :cond_30

    if-eqz v0, :cond_31

    :cond_30
    :goto_30
    return-object v0

    :cond_31
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iget-object v1, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mState:Ljava/util/List;

    add-int/lit8 v2, p1, -0x1

    invoke-interface {v1, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_30
.end method


# virtual methods
.method public getRecycled(Lorg/dmfs/xmlobjects/ElementDescriptor;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mRecycledObjects:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getState()Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    invoke-virtual {v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->getCurrentDepth()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getDepthStateMap(IZ)Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_f

    const/4 v0, 0x0

    :goto_e
    return-object v0

    :cond_f
    iget-object v1, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    invoke-virtual {v1}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->getCurrentElementDescriptor()Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_e
.end method

.method public getXmlPullParser()Lorg/xmlpull/v1/XmlPullParser;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    return-object v0
.end method

.method public recycle(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;)V"
        }
    .end annotation

    if-eqz p2, :cond_7

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mRecycledObjects:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    return-void
.end method

.method setObjectPullParser(Lorg/dmfs/xmlobjects/pull/XmlObjectPull;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    return-void
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    invoke-virtual {v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->getCurrentDepth()I

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getDepthStateMap(IZ)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mObjectPullParser:Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    invoke-virtual {v1}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->getCurrentElementDescriptor()Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method setXmlPullParser(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/xmlobjects/pull/ParserContext;->mParser:Lorg/xmlpull/v1/XmlPullParser;

    return-void
.end method
