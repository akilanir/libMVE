.class public Lfreemarker/template/utility/DOMNodeModel;
.super Ljava/lang/Object;
.source "DOMNodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/utility/DOMNodeModel$NodeListTM;,
        Lfreemarker/template/utility/DOMNodeModel$AncestorByName;
    }
.end annotation


# static fields
.field private static equivalenceTable:Ljava/util/HashMap;


# instance fields
.field private cache:Ljava/util/HashMap;

.field private node:Lorg/w3c/dom/Node;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/template/utility/DOMNodeModel;->equivalenceTable:Ljava/util/HashMap;

    .line 83
    sget-object v0, Lfreemarker/template/utility/DOMNodeModel;->equivalenceTable:Ljava/util/HashMap;

    const-string v1, "*"

    const-string v2, "children"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lfreemarker/template/utility/DOMNodeModel;->equivalenceTable:Ljava/util/HashMap;

    const-string v1, "@*"

    const-string v2, "attributes"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/utility/DOMNodeModel;->cache:Ljava/util/HashMap;

    .line 91
    iput-object p1, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    .line 92
    return-void
.end method

.method static access$000(Lfreemarker/template/utility/DOMNodeModel;)Lorg/w3c/dom/Node;
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/utility/DOMNodeModel;

    .prologue
    .line 79
    iget-object v0, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method private static getText(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 6
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 181
    const-string v2, ""

    .line 182
    .local v2, "result":Ljava/lang/String;
    instance-of v3, p0, Lorg/w3c/dom/Text;

    if-eqz v3, :cond_d

    .line 183
    check-cast p0, Lorg/w3c/dom/Text;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v2

    .line 191
    :cond_c
    return-object v2

    .line 185
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :cond_d
    instance-of v3, p0, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_c

    .line 186
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 187
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_c

    .line 188
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/DOMNodeModel;->getText(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_16
.end method

.method private static nextElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;
    .registers 8
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 217
    invoke-interface {p0}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 218
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 219
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v2, v6, :cond_1f

    .line 220
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 221
    .local v0, "child":Lorg/w3c/dom/Node;
    instance-of v6, v0, Lorg/w3c/dom/Element;

    if-eqz v6, :cond_1c

    .line 222
    check-cast v0, Lorg/w3c/dom/Element;

    .line 238
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v1    # "children":Lorg/w3c/dom/NodeList;
    .end local v2    # "i":I
    :goto_1b
    return-object v0

    .line 219
    .restart local v0    # "child":Lorg/w3c/dom/Node;
    .restart local v1    # "children":Lorg/w3c/dom/NodeList;
    .restart local v2    # "i":I
    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 226
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v1    # "children":Lorg/w3c/dom/NodeList;
    .end local v2    # "i":I
    :cond_1f
    invoke-static {p0}, Lfreemarker/template/utility/DOMNodeModel;->nextSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 227
    .local v4, "nextSiblingElement":Lorg/w3c/dom/Element;
    if-eqz v4, :cond_27

    move-object v0, v4

    .line 228
    goto :goto_1b

    .line 230
    :cond_27
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    .line 231
    .local v5, "parent":Lorg/w3c/dom/Node;
    :goto_2b
    instance-of v6, v5, Lorg/w3c/dom/Element;

    if-eqz v6, :cond_3c

    .line 232
    invoke-static {v5}, Lfreemarker/template/utility/DOMNodeModel;->nextSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 233
    .local v3, "next":Lorg/w3c/dom/Element;
    if-eqz v3, :cond_37

    move-object v0, v3

    .line 234
    goto :goto_1b

    .line 236
    :cond_37
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    .line 237
    goto :goto_2b

    .line 238
    .end local v3    # "next":Lorg/w3c/dom/Element;
    :cond_3c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method private static nextSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;
    .registers 3
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 195
    move-object v0, p0

    .line 196
    .local v0, "next":Lorg/w3c/dom/Node;
    :cond_1
    if-eqz v0, :cond_f

    .line 197
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 198
    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    move-object v1, v0

    .line 199
    check-cast v1, Lorg/w3c/dom/Element;

    .line 202
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method private static previousElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;
    .registers 4
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 242
    invoke-static {p0}, Lfreemarker/template/utility/DOMNodeModel;->previousSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 243
    .local v1, "result":Lorg/w3c/dom/Element;
    if-eqz v1, :cond_7

    .line 250
    .end local v1    # "result":Lorg/w3c/dom/Element;
    :goto_6
    return-object v1

    .line 246
    .restart local v1    # "result":Lorg/w3c/dom/Element;
    :cond_7
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 247
    .local v0, "parent":Lorg/w3c/dom/Node;
    instance-of v2, v0, Lorg/w3c/dom/Element;

    if-eqz v2, :cond_13

    .line 248
    check-cast v0, Lorg/w3c/dom/Element;

    .end local v0    # "parent":Lorg/w3c/dom/Node;
    move-object v1, v0

    goto :goto_6

    .line 250
    .restart local v0    # "parent":Lorg/w3c/dom/Node;
    :cond_13
    const/4 v1, 0x0

    goto :goto_6
.end method

.method private static previousSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;
    .registers 3
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 206
    move-object v0, p0

    .line 207
    .local v0, "previous":Lorg/w3c/dom/Node;
    :cond_1
    if-eqz v0, :cond_f

    .line 208
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPreviousSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 209
    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    move-object v1, v0

    .line 210
    check-cast v1, Lorg/w3c/dom/Element;

    .line 213
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 14
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 95
    const/4 v8, 0x0

    .line 96
    .local v8, "result":Lfreemarker/template/TemplateModel;
    sget-object v10, Lfreemarker/template/utility/DOMNodeModel;->equivalenceTable:Ljava/util/HashMap;

    invoke-virtual {v10, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_12

    .line 97
    sget-object v10, Lfreemarker/template/utility/DOMNodeModel;->equivalenceTable:Ljava/util/HashMap;

    invoke-virtual {v10, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "key":Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    .line 99
    .restart local p1    # "key":Ljava/lang/String;
    :cond_12
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->cache:Ljava/util/HashMap;

    invoke-virtual {v10, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_22

    .line 100
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->cache:Ljava/util/HashMap;

    invoke-virtual {v10, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    check-cast v8, Lfreemarker/template/TemplateModel;

    .line 102
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_22
    if-nez v8, :cond_5a

    .line 103
    const-string v10, "attributes"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5b

    .line 104
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    .line 105
    .local v2, "attributes":Lorg/w3c/dom/NamedNodeMap;
    if-eqz v2, :cond_55

    .line 106
    new-instance v3, Lfreemarker/template/SimpleHash;

    invoke-direct {v3}, Lfreemarker/template/SimpleHash;-><init>()V

    .line 107
    .local v3, "hash":Lfreemarker/template/SimpleHash;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3a
    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v9

    if-ge v4, v9, :cond_54

    .line 108
    invoke-interface {v2, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Attr;

    .line 109
    .local v0, "att":Lorg/w3c/dom/Attr;
    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    add-int/lit8 v4, v4, 0x1

    goto :goto_3a

    .line 111
    .end local v0    # "att":Lorg/w3c/dom/Attr;
    :cond_54
    move-object v8, v3

    .line 171
    .end local v2    # "attributes":Lorg/w3c/dom/NamedNodeMap;
    .end local v3    # "hash":Lfreemarker/template/SimpleHash;
    .end local v4    # "i":I
    :cond_55
    :goto_55
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->cache:Ljava/util/HashMap;

    invoke-virtual {v9, p1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    :cond_5a
    return-object v8

    .line 114
    :cond_5b
    const/4 v10, 0x0

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x40

    if-ne v10, v11, :cond_85

    .line 115
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v9, v9, Lorg/w3c/dom/Element;

    if-eqz v9, :cond_7d

    .line 116
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    check-cast v9, Lorg/w3c/dom/Element;

    const/4 v10, 0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "attValue":Ljava/lang/String;
    new-instance v8, Lfreemarker/template/SimpleScalar;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 118
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    goto :goto_55

    .line 120
    .end local v1    # "attValue":Ljava/lang/String;
    :cond_7d
    new-instance v9, Lfreemarker/template/TemplateModelException;

    const-string v10, "Trying to get an attribute value for a non-element node"

    invoke-direct {v9, v10}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 123
    :cond_85
    const-string v10, "is_element"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_99

    .line 124
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v9, v9, Lorg/w3c/dom/Element;

    if-eqz v9, :cond_96

    sget-object v8, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_95
    goto :goto_55

    :cond_96
    sget-object v8, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_95

    .line 127
    :cond_99
    const-string v10, "is_text"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ad

    .line 128
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v9, v9, Lorg/w3c/dom/Text;

    if-eqz v9, :cond_aa

    sget-object v8, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_a9
    goto :goto_55

    :cond_aa
    sget-object v8, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_a9

    .line 131
    :cond_ad
    const-string v10, "name"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c1

    .line 132
    new-instance v8, Lfreemarker/template/SimpleScalar;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    goto :goto_55

    .line 134
    :cond_c1
    const-string v10, "children"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d5

    .line 135
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;-><init>(Lfreemarker/template/utility/DOMNodeModel;Lorg/w3c/dom/NodeList;)V

    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    goto :goto_55

    .line 137
    :cond_d5
    const-string v10, "parent"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ee

    .line 138
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v6

    .line 139
    .local v6, "parent":Lorg/w3c/dom/Node;
    if-nez v6, :cond_e8

    move-object v8, v9

    .line 140
    :goto_e6
    goto/16 :goto_55

    .line 139
    :cond_e8
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v6}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_e6

    .line 141
    .end local v6    # "parent":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_ee
    const-string v10, "ancestorByName"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_fd

    .line 142
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel$AncestorByName;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, p0}, Lfreemarker/template/utility/DOMNodeModel$AncestorByName;-><init>(Lfreemarker/template/utility/DOMNodeModel;)V

    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    goto/16 :goto_55

    .line 144
    :cond_fd
    const-string v10, "nextSibling"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_116

    .line 145
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v5

    .line 146
    .local v5, "next":Lorg/w3c/dom/Node;
    if-nez v5, :cond_110

    move-object v8, v9

    .line 147
    :goto_10e
    goto/16 :goto_55

    .line 146
    :cond_110
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v5}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_10e

    .line 148
    .end local v5    # "next":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_116
    const-string v10, "previousSibling"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_12f

    .line 149
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getPreviousSibling()Lorg/w3c/dom/Node;

    move-result-object v7

    .line 150
    .local v7, "previous":Lorg/w3c/dom/Node;
    if-nez v7, :cond_129

    move-object v8, v9

    .line 151
    :goto_127
    goto/16 :goto_55

    .line 150
    :cond_129
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v7}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_127

    .line 152
    .end local v7    # "previous":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_12f
    const-string v10, "nextSiblingElement"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_148

    .line 153
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v10}, Lfreemarker/template/utility/DOMNodeModel;->nextSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 154
    .restart local v5    # "next":Lorg/w3c/dom/Node;
    if-nez v5, :cond_142

    move-object v8, v9

    .line 155
    :goto_140
    goto/16 :goto_55

    .line 154
    :cond_142
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v5}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_140

    .line 156
    .end local v5    # "next":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_148
    const-string v10, "previousSiblingElement"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_161

    .line 157
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v10}, Lfreemarker/template/utility/DOMNodeModel;->previousSiblingElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 158
    .restart local v7    # "previous":Lorg/w3c/dom/Node;
    if-nez v7, :cond_15b

    move-object v8, v9

    .line 159
    :goto_159
    goto/16 :goto_55

    .line 158
    :cond_15b
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v7}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_159

    .line 160
    .end local v7    # "previous":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_161
    const-string v10, "nextElement"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_17a

    .line 161
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v10}, Lfreemarker/template/utility/DOMNodeModel;->nextElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 162
    .restart local v5    # "next":Lorg/w3c/dom/Node;
    if-nez v5, :cond_174

    move-object v8, v9

    .line 163
    :goto_172
    goto/16 :goto_55

    .line 162
    :cond_174
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v5}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_172

    .line 164
    .end local v5    # "next":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_17a
    const-string v10, "previousElement"

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_193

    .line 165
    iget-object v10, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v10}, Lfreemarker/template/utility/DOMNodeModel;->previousElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 166
    .restart local v7    # "previous":Lorg/w3c/dom/Node;
    if-nez v7, :cond_18d

    move-object v8, v9

    .line 167
    :goto_18b
    goto/16 :goto_55

    .line 166
    :cond_18d
    new-instance v8, Lfreemarker/template/utility/DOMNodeModel;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    invoke-direct {v8, v7}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    goto :goto_18b

    .line 168
    .end local v7    # "previous":Lorg/w3c/dom/Node;
    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    :cond_193
    const-string v9, "text"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_55

    .line 169
    new-instance v8, Lfreemarker/template/SimpleScalar;

    .end local v8    # "result":Lfreemarker/template/TemplateModel;
    iget-object v9, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v9}, Lfreemarker/template/utility/DOMNodeModel;->getText(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .restart local v8    # "result":Lfreemarker/template/TemplateModel;
    goto/16 :goto_55
.end method

.method getNodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lfreemarker/template/utility/DOMNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method setParent(Lfreemarker/template/utility/DOMNodeModel;)V
    .registers 4
    .param p1, "parent"    # Lfreemarker/template/utility/DOMNodeModel;

    .prologue
    .line 254
    if-eqz p1, :cond_9

    .line 255
    iget-object v0, p0, Lfreemarker/template/utility/DOMNodeModel;->cache:Ljava/util/HashMap;

    const-string v1, "parent"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_9
    return-void
.end method
