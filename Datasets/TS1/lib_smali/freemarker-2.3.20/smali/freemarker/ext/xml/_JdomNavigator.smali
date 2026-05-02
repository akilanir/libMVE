.class public Lfreemarker/ext/xml/_JdomNavigator;
.super Lfreemarker/ext/xml/Navigator;
.source "_JdomNavigator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;
    }
.end annotation


# static fields
.field private static final OUTPUT:Lorg/jdom/output/XMLOutputter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    new-instance v0, Lorg/jdom/output/XMLOutputter;

    invoke-direct {v0}, Lorg/jdom/output/XMLOutputter;-><init>()V

    sput-object v0, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 86
    invoke-direct {p0}, Lfreemarker/ext/xml/Navigator;-><init>()V

    .line 87
    return-void
.end method

.method private getDescendants(Lorg/jdom/Element;Ljava/util/List;)V
    .registers 6
    .param p1, "node"    # Lorg/jdom/Element;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 202
    invoke-virtual {p1}, Lorg/jdom/Element;->getChildren()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 203
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jdom/Element;

    .line 204
    .local v1, "subnode":Lorg/jdom/Element;
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_JdomNavigator;->getDescendants(Lorg/jdom/Element;Ljava/util/List;)V

    goto :goto_8

    .line 207
    .end local v1    # "subnode":Lorg/jdom/Element;
    :cond_1b
    return-void
.end method


# virtual methods
.method createXPathEx(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator$XPathEx;
    .registers 4
    .param p1, "xpathString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 366
    :try_start_0
    new-instance v1, Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;

    invoke-direct {v1, p1}, Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 368
    :catch_6
    move-exception v0

    .line 369
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method getAsString(Ljava/lang/Object;Ljava/io/StringWriter;)V
    .registers 9
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "sw"    # Ljava/io/StringWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 94
    :try_start_0
    instance-of v3, p1, Lorg/jdom/Element;

    if-eqz v3, :cond_c

    .line 95
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/Element;Ljava/io/Writer;)V

    .line 133
    :goto_b
    return-void

    .line 97
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_c
    instance-of v3, p1, Lorg/jdom/Attribute;

    if-eqz v3, :cond_3f

    .line 98
    move-object v0, p1

    check-cast v0, Lorg/jdom/Attribute;

    move-object v1, v0

    .line 99
    .local v1, "attribute":Lorg/jdom/Attribute;
    const-string v3, " "

    invoke-virtual {p2, v3}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v1}, Lorg/jdom/Attribute;->getQualifiedName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 101
    const-string v3, "=\""

    invoke-virtual {p2, v3}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 102
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    invoke-virtual {v1}, Lorg/jdom/Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jdom/output/XMLOutputter;->escapeAttributeEntities(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 103
    const-string v3, "\""

    invoke-virtual {p2, v3}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_b

    .line 130
    .end local v1    # "attribute":Lorg/jdom/Attribute;
    .end local p1    # "node":Ljava/lang/Object;
    :catch_38
    move-exception v2

    .line 131
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lfreemarker/template/TemplateModelException;

    invoke-direct {v3, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v3

    .line 105
    .end local v2    # "e":Ljava/io/IOException;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_3f
    :try_start_3f
    instance-of v3, p1, Lorg/jdom/Text;

    if-eqz v3, :cond_4b

    .line 106
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/Text;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/Text;Ljava/io/Writer;)V

    goto :goto_b

    .line 108
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_4b
    instance-of v3, p1, Lorg/jdom/Document;

    if-eqz v3, :cond_57

    .line 109
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/Document;Ljava/io/Writer;)V

    goto :goto_b

    .line 111
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_57
    instance-of v3, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v3, :cond_63

    .line 112
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/ProcessingInstruction;Ljava/io/Writer;)V

    goto :goto_b

    .line 114
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_63
    instance-of v3, p1, Lorg/jdom/Comment;

    if-eqz v3, :cond_6f

    .line 115
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/Comment;Ljava/io/Writer;)V

    goto :goto_b

    .line 117
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_6f
    instance-of v3, p1, Lorg/jdom/CDATA;

    if-eqz v3, :cond_7b

    .line 118
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/CDATA;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/CDATA;Ljava/io/Writer;)V

    goto :goto_b

    .line 120
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_7b
    instance-of v3, p1, Lorg/jdom/DocType;

    if-eqz v3, :cond_87

    .line 121
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/DocType;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/DocType;Ljava/io/Writer;)V

    goto :goto_b

    .line 123
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_87
    instance-of v3, p1, Lorg/jdom/EntityRef;

    if-eqz v3, :cond_94

    .line 124
    sget-object v3, Lfreemarker/ext/xml/_JdomNavigator;->OUTPUT:Lorg/jdom/output/XMLOutputter;

    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {v3, p1, p2}, Lorg/jdom/output/XMLOutputter;->output(Lorg/jdom/EntityRef;Ljava/io/Writer;)V

    goto/16 :goto_b

    .line 127
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_94
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " is not a core JDOM class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_b5} :catch_38
.end method

.method getAttributes(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 12
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 154
    instance-of v4, p1, Lorg/jdom/Element;

    if-eqz v4, :cond_21

    move-object v2, p1

    .line 155
    check-cast v2, Lorg/jdom/Element;

    .line 156
    .local v2, "e":Lorg/jdom/Element;
    if-nez p2, :cond_11

    .line 157
    invoke-virtual {v2}, Lorg/jdom/Element;->getAttributes()Ljava/util/List;

    move-result-object v4

    invoke-interface {p4, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 188
    .end local v2    # "e":Lorg/jdom/Element;
    :cond_10
    :goto_10
    return-void

    .line 160
    .restart local v2    # "e":Lorg/jdom/Element;
    :cond_11
    const-string v4, ""

    invoke-static {v4, p3}, Lorg/jdom/Namespace;->getNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/jdom/Namespace;

    move-result-object v4

    invoke-virtual {v2, p2, v4}, Lorg/jdom/Element;->getAttribute(Ljava/lang/String;Lorg/jdom/Namespace;)Lorg/jdom/Attribute;

    move-result-object v0

    .line 161
    .local v0, "attr":Lorg/jdom/Attribute;
    if-eqz v0, :cond_10

    .line 162
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 165
    .end local v0    # "attr":Lorg/jdom/Attribute;
    .end local v2    # "e":Lorg/jdom/Element;
    :cond_21
    instance-of v4, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v4, :cond_63

    move-object v3, p1

    .line 166
    check-cast v3, Lorg/jdom/ProcessingInstruction;

    .line 167
    .local v3, "pi":Lorg/jdom/ProcessingInstruction;
    const-string v4, "target"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 168
    new-instance v4, Lorg/jdom/Attribute;

    const-string v5, "target"

    invoke-virtual {v3}, Lorg/jdom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 170
    :cond_3f
    const-string v4, "data"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_56

    .line 171
    new-instance v4, Lorg/jdom/Attribute;

    const-string v5, "data"

    invoke-virtual {v3}, Lorg/jdom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 174
    :cond_56
    new-instance v4, Lorg/jdom/Attribute;

    invoke-virtual {v3, p2}, Lorg/jdom/ProcessingInstruction;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p2, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 176
    .end local v3    # "pi":Lorg/jdom/ProcessingInstruction;
    :cond_63
    instance-of v4, p1, Lorg/jdom/DocType;

    if-eqz v4, :cond_10

    move-object v1, p1

    .line 177
    check-cast v1, Lorg/jdom/DocType;

    .line 178
    .local v1, "doctype":Lorg/jdom/DocType;
    const-string v4, "publicId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_81

    .line 179
    new-instance v4, Lorg/jdom/Attribute;

    const-string v5, "publicId"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getPublicID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 181
    :cond_81
    const-string v4, "systemId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_99

    .line 182
    new-instance v4, Lorg/jdom/Attribute;

    const-string v5, "systemId"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getSystemID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_10

    .line 184
    :cond_99
    const-string v4, "elementName"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 185
    new-instance v4, Lorg/jdom/Attribute;

    const-string v5, "elementName"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getElementName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_10
.end method

.method getChildren(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 8
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 136
    instance-of v2, p1, Lorg/jdom/Element;

    if-eqz v2, :cond_1f

    move-object v0, p1

    .line 137
    check-cast v0, Lorg/jdom/Element;

    .line 138
    .local v0, "e":Lorg/jdom/Element;
    if-nez p2, :cond_11

    .line 139
    invoke-virtual {v0}, Lorg/jdom/Element;->getChildren()Ljava/util/List;

    move-result-object v2

    invoke-interface {p4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 151
    .end local v0    # "e":Lorg/jdom/Element;
    .end local p1    # "node":Ljava/lang/Object;
    :cond_10
    :goto_10
    return-void

    .line 142
    .restart local v0    # "e":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_11
    const-string v2, ""

    invoke-static {v2, p3}, Lorg/jdom/Namespace;->getNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/jdom/Namespace;

    move-result-object v2

    invoke-virtual {v0, p2, v2}, Lorg/jdom/Element;->getChildren(Ljava/lang/String;Lorg/jdom/Namespace;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_10

    .line 145
    .end local v0    # "e":Lorg/jdom/Element;
    :cond_1f
    instance-of v2, p1, Lorg/jdom/Document;

    if-eqz v2, :cond_10

    .line 146
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getRootElement()Lorg/jdom/Element;

    move-result-object v1

    .line 147
    .local v1, "root":Lorg/jdom/Element;
    if-eqz p2, :cond_3f

    invoke-virtual {v1}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/xml/_JdomNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lorg/jdom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lfreemarker/ext/xml/_JdomNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 148
    :cond_3f
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method getContent(Ljava/lang/Object;Ljava/util/List;)V
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 265
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_e

    .line 266
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getContent()Ljava/util/List;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 269
    :cond_d
    :goto_d
    return-void

    .line 267
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_e
    instance-of v0, p1, Lorg/jdom/Document;

    if-eqz v0, :cond_d

    .line 268
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getContent()Ljava/util/List;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_d
.end method

.method getDescendants(Ljava/lang/Object;Ljava/util/List;)V
    .registers 5
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 191
    instance-of v1, p1, Lorg/jdom/Document;

    if-eqz v1, :cond_11

    .line 192
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getRootElement()Lorg/jdom/Element;

    move-result-object v0

    .line 193
    .local v0, "root":Lorg/jdom/Element;
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    invoke-direct {p0, v0, p2}, Lfreemarker/ext/xml/_JdomNavigator;->getDescendants(Lorg/jdom/Element;Ljava/util/List;)V

    .line 199
    .end local v0    # "root":Lorg/jdom/Element;
    :cond_10
    :goto_10
    return-void

    .line 196
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_11
    instance-of v1, p1, Lorg/jdom/Element;

    if-eqz v1, :cond_10

    .line 197
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/xml/_JdomNavigator;->getDescendants(Lorg/jdom/Element;Ljava/util/List;)V

    goto :goto_10
.end method

.method getDocument(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 232
    instance-of v2, p1, Lorg/jdom/Element;

    if-eqz v2, :cond_c

    .line 233
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    .line 254
    :cond_b
    :goto_b
    return-object v1

    .line 235
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_c
    instance-of v2, p1, Lorg/jdom/Attribute;

    if-eqz v2, :cond_1d

    .line 236
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getParent()Lorg/jdom/Element;

    move-result-object v0

    .line 237
    .local v0, "parent":Lorg/jdom/Element;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    goto :goto_b

    .line 239
    .end local v0    # "parent":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_1d
    instance-of v2, p1, Lorg/jdom/Text;

    if-eqz v2, :cond_2e

    .line 240
    check-cast p1, Lorg/jdom/Text;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Text;->getParent()Lorg/jdom/Element;

    move-result-object v0

    .line 241
    .restart local v0    # "parent":Lorg/jdom/Element;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    goto :goto_b

    .line 243
    .end local v0    # "parent":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2e
    instance-of v2, p1, Lorg/jdom/Document;

    if-eqz v2, :cond_34

    move-object v1, p1

    .line 244
    goto :goto_b

    .line 245
    :cond_34
    instance-of v2, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v2, :cond_3f

    .line 246
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    goto :goto_b

    .line 248
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_3f
    instance-of v2, p1, Lorg/jdom/EntityRef;

    if-eqz v2, :cond_4a

    .line 249
    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/EntityRef;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    goto :goto_b

    .line 251
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_4a
    instance-of v2, p1, Lorg/jdom/Comment;

    if-eqz v2, :cond_b

    .line 252
    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Comment;->getDocument()Lorg/jdom/Document;

    move-result-object v1

    goto :goto_b
.end method

.method getDocumentType(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 258
    instance-of v0, p1, Lorg/jdom/Document;

    if-eqz v0, :cond_b

    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getDocType()Lorg/jdom/DocType;

    move-result-object v0

    :goto_a
    return-object v0

    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getLocalName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 291
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 292
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v0

    .line 306
    :goto_a
    return-object v0

    .line 294
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 295
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 297
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    instance-of v0, p1, Lorg/jdom/EntityRef;

    if-eqz v0, :cond_21

    .line 298
    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/EntityRef;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 300
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_21
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_2c

    .line 301
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 303
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2c
    instance-of v0, p1, Lorg/jdom/DocType;

    if-eqz v0, :cond_37

    .line 304
    check-cast p1, Lorg/jdom/DocType;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/DocType;->getElementName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 306
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_37
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getNamespacePrefix(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 310
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 311
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getNamespacePrefix()Ljava/lang/String;

    move-result-object v0

    .line 316
    :goto_a
    return-object v0

    .line 313
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 314
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getNamespacePrefix()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 316
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getNamespaceUri(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 320
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 321
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 326
    :goto_a
    return-object v0

    .line 323
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 324
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 326
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 210
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 211
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getParent()Lorg/jdom/Element;

    move-result-object v0

    .line 228
    :goto_a
    return-object v0

    .line 213
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 214
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 216
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    instance-of v0, p1, Lorg/jdom/Text;

    if-eqz v0, :cond_21

    .line 217
    check-cast p1, Lorg/jdom/Text;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Text;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 219
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_21
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_2c

    .line 220
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 222
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2c
    instance-of v0, p1, Lorg/jdom/Comment;

    if-eqz v0, :cond_37

    .line 223
    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Comment;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 225
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_37
    instance-of v0, p1, Lorg/jdom/EntityRef;

    if-eqz v0, :cond_42

    .line 226
    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/EntityRef;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 228
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_42
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getText(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 272
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 273
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getTextTrim()Ljava/lang/String;

    move-result-object v0

    .line 287
    :goto_a
    return-object v0

    .line 275
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 276
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 278
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    instance-of v0, p1, Lorg/jdom/CDATA;

    if-eqz v0, :cond_21

    .line 279
    check-cast p1, Lorg/jdom/CDATA;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/CDATA;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 281
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_21
    instance-of v0, p1, Lorg/jdom/Comment;

    if-eqz v0, :cond_2c

    .line 282
    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Comment;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 284
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2c
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_37

    .line 285
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 287
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_37
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getType(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 330
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_7

    .line 331
    const-string v0, "attribute"

    .line 360
    :goto_6
    return-object v0

    .line 333
    :cond_7
    instance-of v0, p1, Lorg/jdom/CDATA;

    if-eqz v0, :cond_e

    .line 334
    const-string v0, "cdata"

    goto :goto_6

    .line 336
    :cond_e
    instance-of v0, p1, Lorg/jdom/Comment;

    if-eqz v0, :cond_15

    .line 337
    const-string v0, "comment"

    goto :goto_6

    .line 339
    :cond_15
    instance-of v0, p1, Lorg/jdom/Document;

    if-eqz v0, :cond_1c

    .line 340
    const-string v0, "document"

    goto :goto_6

    .line 342
    :cond_1c
    instance-of v0, p1, Lorg/jdom/DocType;

    if-eqz v0, :cond_23

    .line 343
    const-string v0, "documentType"

    goto :goto_6

    .line 345
    :cond_23
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_2a

    .line 346
    const-string v0, "element"

    goto :goto_6

    .line 348
    :cond_2a
    instance-of v0, p1, Lorg/jdom/EntityRef;

    if-eqz v0, :cond_31

    .line 349
    const-string v0, "entityReference"

    goto :goto_6

    .line 351
    :cond_31
    instance-of v0, p1, Lorg/jdom/Namespace;

    if-eqz v0, :cond_38

    .line 352
    const-string v0, "namespace"

    goto :goto_6

    .line 354
    :cond_38
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_3f

    .line 355
    const-string v0, "processingInstruction"

    goto :goto_6

    .line 357
    :cond_3f
    instance-of v0, p1, Lorg/jdom/Text;

    if-eqz v0, :cond_46

    .line 358
    const-string v0, "text"

    goto :goto_6

    .line 360
    :cond_46
    const-string v0, "unknown"

    goto :goto_6
.end method
