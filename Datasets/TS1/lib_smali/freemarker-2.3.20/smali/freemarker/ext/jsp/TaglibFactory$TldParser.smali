.class final Lfreemarker/ext/jsp/TaglibFactory$TldParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "TaglibFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TldParser"
.end annotation


# instance fields
.field private buf:Ljava/lang/StringBuffer;

.field private final listeners:Ljava/util/List;

.field private locator:Lorg/xml/sax/Locator;

.field private tagClassName:Ljava/lang/String;

.field private tagName:Ljava/lang/String;

.field private final tags:Ljava/util/Map;


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 594
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 595
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tags:Ljava/util/Map;

    .line 596
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->listeners:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jsp/TaglibFactory$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jsp/TaglibFactory$1;

    .prologue
    .line 594
    invoke-direct {p0}, Lfreemarker/ext/jsp/TaglibFactory$TldParser;-><init>()V

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 5
    .param p1, "chars"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 626
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_9

    .line 627
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 629
    :cond_9
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 633
    const-string v4, "name"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 634
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagName:Ljava/lang/String;

    if-nez v4, :cond_19

    .line 635
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagName:Ljava/lang/String;

    .line 637
    :cond_19
    iput-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    .line 683
    :cond_1b
    :goto_1b
    return-void

    .line 639
    :cond_1c
    const-string v4, "tagclass"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2c

    const-string v4, "tag-class"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 640
    :cond_2c
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagClassName:Ljava/lang/String;

    .line 641
    iput-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    goto :goto_1b

    .line 643
    :cond_3b
    const-string v4, "tag"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b3

    .line 645
    :try_start_43
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagClassName:Ljava/lang/String;

    invoke-static {v4}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 647
    .local v3, "tagClass":Ljava/lang/Class;
    sget-object v4, Lfreemarker/ext/jsp/TaglibFactory;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    if-nez v4, :cond_8c

    const-string v4, "javax.servlet.jsp.tagext.Tag"

    invoke-static {v4}, Lfreemarker/ext/jsp/TaglibFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lfreemarker/ext/jsp/TaglibFactory;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    :goto_55
    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 648
    new-instance v1, Lfreemarker/ext/jsp/TagTransformModel;

    invoke-direct {v1, v3}, Lfreemarker/ext/jsp/TagTransformModel;-><init>(Ljava/lang/Class;)V

    .line 653
    .local v1, "impl":Lfreemarker/template/TemplateModel;
    :goto_60
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tags:Ljava/util/Map;

    iget-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagName:Ljava/lang/String;

    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    const/4 v4, 0x0

    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagName:Ljava/lang/String;

    .line 655
    const/4 v4, 0x0

    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagClassName:Ljava/lang/String;
    :try_end_6d
    .catch Ljava/beans/IntrospectionException; {:try_start_43 .. :try_end_6d} :catch_6e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_43 .. :try_end_6d} :catch_95

    goto :goto_1b

    .line 657
    .end local v1    # "impl":Lfreemarker/template/TemplateModel;
    .end local v3    # "tagClass":Ljava/lang/Class;
    :catch_6e
    move-exception v0

    .line 658
    .local v0, "e":Ljava/beans/IntrospectionException;
    new-instance v4, Lorg/xml/sax/SAXParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Can\'t introspect tag class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v4, v5, v6, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v4

    .line 647
    .end local v0    # "e":Ljava/beans/IntrospectionException;
    .restart local v3    # "tagClass":Ljava/lang/Class;
    :cond_8c
    :try_start_8c
    sget-object v4, Lfreemarker/ext/jsp/TaglibFactory;->class$javax$servlet$jsp$tagext$Tag:Ljava/lang/Class;

    goto :goto_55

    .line 651
    :cond_8f
    new-instance v1, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;

    invoke-direct {v1, v3}, Lfreemarker/ext/jsp/SimpleTagDirectiveModel;-><init>(Ljava/lang/Class;)V
    :try_end_94
    .catch Ljava/beans/IntrospectionException; {:try_start_8c .. :try_end_94} :catch_6e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8c .. :try_end_94} :catch_95

    .restart local v1    # "impl":Lfreemarker/template/TemplateModel;
    goto :goto_60

    .line 663
    .end local v1    # "impl":Lfreemarker/template/TemplateModel;
    .end local v3    # "tagClass":Ljava/lang/Class;
    :catch_95
    move-exception v0

    .line 664
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/xml/sax/SAXParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Can\'t find tag class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tagClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v4, v5, v6, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v4

    .line 670
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_b3
    const-string v4, "listener-class"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 671
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 672
    .local v2, "listenerClass":Ljava/lang/String;
    iput-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    .line 674
    :try_start_c7
    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->listeners:Ljava/util/List;

    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_c7 .. :try_end_d4} :catch_d6

    goto/16 :goto_1b

    .line 676
    :catch_d6
    move-exception v0

    .line 677
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/xml/sax/SAXParseException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Can\'t instantiate listener class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v4, v5, v6, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v4
.end method

.method getListeners()Ljava/util/List;
    .registers 2

    .prologue
    .line 608
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->listeners:Ljava/util/List;

    return-object v0
.end method

.method getTags()Ljava/util/Map;
    .registers 2

    .prologue
    .line 604
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->tags:Ljava/util/Map;

    return-object v0
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .registers 2
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 612
    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->locator:Lorg/xml/sax/Locator;

    .line 613
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 620
    const-string v0, "name"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "tagclass"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "tag-class"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "listener-class"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 621
    :cond_20
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$TldParser;->buf:Ljava/lang/StringBuffer;

    .line 623
    :cond_27
    return-void
.end method
