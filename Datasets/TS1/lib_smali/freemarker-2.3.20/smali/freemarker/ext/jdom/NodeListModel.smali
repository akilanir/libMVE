.class public Lfreemarker/ext/jdom/NodeListModel;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;
.implements Lfreemarker/template/TemplateMethodModel;
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateScalarModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;,
        Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;,
        Lfreemarker/ext/jdom/NodeListModel$TypeFilter;,
        Lfreemarker/ext/jdom/NodeListModel$NameFilter;,
        Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;,
        Lfreemarker/ext/jdom/NodeListModel$TextOp;,
        Lfreemarker/ext/jdom/NodeListModel$ContentOp;,
        Lfreemarker/ext/jdom/NodeListModel$DocTypeOp;,
        Lfreemarker/ext/jdom/NodeListModel$DocumentOp;,
        Lfreemarker/ext/jdom/NodeListModel$DescendantOrSelfOp;,
        Lfreemarker/ext/jdom/NodeListModel$DescendantOp;,
        Lfreemarker/ext/jdom/NodeListModel$AncestorOrSelfOp;,
        Lfreemarker/ext/jdom/NodeListModel$AncestorOp;,
        Lfreemarker/ext/jdom/NodeListModel$ParentOp;,
        Lfreemarker/ext/jdom/NodeListModel$CanonicalNameOp;,
        Lfreemarker/ext/jdom/NodeListModel$NamespacePrefixOp;,
        Lfreemarker/ext/jdom/NodeListModel$NamespaceUriOp;,
        Lfreemarker/ext/jdom/NodeListModel$QNameOp;,
        Lfreemarker/ext/jdom/NodeListModel$NameOp;,
        Lfreemarker/ext/jdom/NodeListModel$NamedAttributeOp;,
        Lfreemarker/ext/jdom/NodeListModel$AllAttributesOp;,
        Lfreemarker/ext/jdom/NodeListModel$NamedChildrenOp;,
        Lfreemarker/ext/jdom/NodeListModel$AllChildrenOp;,
        Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;,
        Lfreemarker/ext/jdom/NodeListModel$NodeOperator;
    }
.end annotation


# static fields
.field private static final ALL_ATTRIBUTES_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

.field private static final ALL_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

.field private static final EMPTY:Lfreemarker/ext/jdom/NodeListModel;

.field private static final NAMED_ATTRIBUTE_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

.field private static final NAMED_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

.field private static final OPERATIONS:Ljava/util/Map;

.field private static final OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

.field private static final SPECIAL_OPERATIONS:Ljava/util/Map;

.field private static final SPECIAL_OPERATION_COPY:I = 0x0

.field private static final SPECIAL_OPERATION_FILTER_NAME:I = 0x2

.field private static final SPECIAL_OPERATION_FILTER_TYPE:I = 0x3

.field private static final SPECIAL_OPERATION_PLAINTEXT:I = 0x6

.field private static final SPECIAL_OPERATION_QUERY_TYPE:I = 0x4

.field private static final SPECIAL_OPERATION_REGISTER_NAMESPACE:I = 0x5

.field private static final SPECIAL_OPERATION_UNIQUE:I = 0x1

.field private static final XPATH_CACHE:Ljava/util/Map;


# instance fields
.field private final namespaces:Ljava/util/Map;

.field private final nodes:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 130
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    invoke-direct {v0, v2}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    .line 132
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Z)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->EMPTY:Lfreemarker/ext/jdom/NodeListModel;

    .line 135
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->XPATH_CACHE:Ljava/util/Map;

    .line 137
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$NamedChildrenOp;

    invoke-direct {v0, v2}, Lfreemarker/ext/jdom/NodeListModel$NamedChildrenOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->NAMED_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

    .line 138
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$NamedAttributeOp;

    invoke-direct {v0, v2}, Lfreemarker/ext/jdom/NodeListModel$NamedAttributeOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->NAMED_ATTRIBUTE_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

    .line 139
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$AllAttributesOp;

    invoke-direct {v0, v2}, Lfreemarker/ext/jdom/NodeListModel$AllAttributesOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->ALL_ATTRIBUTES_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    .line 140
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$AllChildrenOp;

    invoke-direct {v0, v2}, Lfreemarker/ext/jdom/NodeListModel$AllChildrenOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->ALL_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    .line 141
    invoke-static {}, Lfreemarker/ext/jdom/NodeListModel;->createOperations()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->OPERATIONS:Ljava/util/Map;

    .line 142
    invoke-static {}, Lfreemarker/ext/jdom/NodeListModel;->createSpecialOperations()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jdom/NodeListModel;->SPECIAL_OPERATIONS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Ljava/util/Map;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "namespaces"    # Ljava/util/Map;

    .prologue
    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    if-nez p1, :cond_c

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_7
    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    .line 176
    iput-object p2, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    .line 177
    return-void

    .line 175
    :cond_c
    invoke-static {p1}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_7
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/util/Map;Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/util/Map;
    .param p3, "x2"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/lang/Object;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1, "nodes"    # Ljava/util/List;

    .prologue
    .line 187
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Z)V

    .line 188
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Ljava/util/Map;)V
    .registers 3
    .param p1, "nodes"    # Ljava/util/List;
    .param p2, "namespaces"    # Ljava/util/Map;

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    if-nez p1, :cond_7

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .end local p1    # "nodes":Ljava/util/List;
    :cond_7
    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    .line 207
    iput-object p2, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    .line 208
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Z)V
    .registers 4
    .param p1, "nodes"    # Ljava/util/List;
    .param p2, "copy"    # Z

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    if-eqz p2, :cond_17

    if-eqz p1, :cond_17

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, v0

    .end local p1    # "nodes":Ljava/util/List;
    :cond_d
    :goto_d
    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    .line 201
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    .line 202
    return-void

    .line 200
    .restart local p1    # "nodes":Ljava/util/List;
    :cond_17
    if-nez p1, :cond_d

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_d
.end method

.method public constructor <init>(Lorg/jdom/Document;)V
    .registers 3
    .param p1, "document"    # Lorg/jdom/Document;

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    if-nez p1, :cond_11

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_7
    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    .line 161
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    .line 162
    return-void

    .line 160
    :cond_11
    invoke-static {p1}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_7
.end method

.method public constructor <init>(Lorg/jdom/Element;)V
    .registers 3
    .param p1, "element"    # Lorg/jdom/Element;

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    if-nez p1, :cond_11

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_7
    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    .line 170
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    .line 171
    return-void

    .line 169
    :cond_11
    invoke-static {p1}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_7
.end method

.method static access$1100(Ljava/lang/Object;)Lorg/jdom/Element;
    .registers 2
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 122
    invoke-static {p0}, Lfreemarker/ext/jdom/NodeListModel;->getParent(Ljava/lang/Object;)Lorg/jdom/Element;

    move-result-object v0

    return-object v0
.end method

.method static access$2600(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;
    .registers 3
    .param p0, "x0"    # Ljava/util/List;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 122
    invoke-static {p0, p1}, Lfreemarker/ext/jdom/NodeListModel;->createNodeListModel(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;

    move-result-object v0

    return-object v0
.end method

.method static access$800(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jdom/NodeListModel;

    .prologue
    .line 122
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    return-object v0
.end method

.method static access$900(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/jdom/NodeListModel;

    .prologue
    .line 122
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    return-object v0
.end method

.method private static final createNodeListModel(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;
    .registers 4
    .param p0, "list"    # Ljava/util/List;
    .param p1, "namespaces"    # Ljava/util/Map;

    .prologue
    .line 212
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 213
    :cond_8
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 214
    sget-object v0, Lfreemarker/ext/jdom/NodeListModel;->EMPTY:Lfreemarker/ext/jdom/NodeListModel;

    .line 220
    :goto_10
    return-object v0

    .line 216
    :cond_11
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {v0, v1, p1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Ljava/util/Map;)V

    goto :goto_10

    .line 219
    :cond_19
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2b

    new-instance v0, Lfreemarker/ext/jdom/NodeListModel;

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/lang/Object;Ljava/util/Map;)V

    goto :goto_10

    .line 220
    :cond_2b
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel;

    invoke-direct {v0, p0, p1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Ljava/util/Map;)V

    goto :goto_10
.end method

.method private static final createOperations()Ljava/util/Map;
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 1090
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1092
    .local v0, "map":Ljava/util/Map;
    const-string v1, "_ancestor"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$AncestorOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AncestorOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1093
    const-string v1, "_ancestorOrSelf"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$AncestorOrSelfOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AncestorOrSelfOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1094
    const-string v1, "_attributes"

    sget-object v2, Lfreemarker/ext/jdom/NodeListModel;->ALL_ATTRIBUTES_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1095
    const-string v1, "_children"

    sget-object v2, Lfreemarker/ext/jdom/NodeListModel;->ALL_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    const-string v1, "_cname"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$CanonicalNameOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$CanonicalNameOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1097
    const-string v1, "_content"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$ContentOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$ContentOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    const-string v1, "_descendant"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1099
    const-string v1, "_descendantOrSelf"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$DescendantOrSelfOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$DescendantOrSelfOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1100
    const-string v1, "_document"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$DocumentOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$DocumentOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1101
    const-string v1, "_doctype"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$DocTypeOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$DocTypeOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1102
    const-string v1, "_name"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$NameOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$NameOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1103
    const-string v1, "_nsprefix"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$NamespacePrefixOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$NamespacePrefixOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1104
    const-string v1, "_nsuri"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$NamespaceUriOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$NamespaceUriOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    const-string v1, "_parent"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$ParentOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$ParentOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1106
    const-string v1, "_qname"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$QNameOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$QNameOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1107
    const-string v1, "_text"

    new-instance v2, Lfreemarker/ext/jdom/NodeListModel$TextOp;

    invoke-direct {v2, v3}, Lfreemarker/ext/jdom/NodeListModel$TextOp;-><init>(Lfreemarker/ext/jdom/NodeListModel$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1109
    return-object v0
.end method

.method private static final createSpecialOperations()Ljava/util/Map;
    .registers 9

    .prologue
    .line 1114
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1116
    .local v3, "map":Ljava/util/Map;
    new-instance v0, Ljava/lang/Integer;

    const/4 v8, 0x0

    invoke-direct {v0, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1117
    .local v0, "copy":Ljava/lang/Integer;
    new-instance v7, Ljava/lang/Integer;

    const/4 v8, 0x1

    invoke-direct {v7, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1118
    .local v7, "unique":Ljava/lang/Integer;
    new-instance v1, Ljava/lang/Integer;

    const/4 v8, 0x2

    invoke-direct {v1, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1119
    .local v1, "fname":Ljava/lang/Integer;
    new-instance v2, Ljava/lang/Integer;

    const/4 v8, 0x3

    invoke-direct {v2, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1120
    .local v2, "ftype":Ljava/lang/Integer;
    new-instance v6, Ljava/lang/Integer;

    const/4 v8, 0x4

    invoke-direct {v6, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1121
    .local v6, "type":Ljava/lang/Integer;
    new-instance v5, Ljava/lang/Integer;

    const/4 v8, 0x5

    invoke-direct {v5, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1122
    .local v5, "regns":Ljava/lang/Integer;
    new-instance v4, Ljava/lang/Integer;

    const/4 v8, 0x6

    invoke-direct {v4, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 1124
    .local v4, "plaintext":Ljava/lang/Integer;
    const-string v8, "_copy"

    invoke-interface {v3, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1125
    const-string v8, "_unique"

    invoke-interface {v3, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    const-string v8, "_fname"

    invoke-interface {v3, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1127
    const-string v8, "_ftype"

    invoke-interface {v3, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1128
    const-string v8, "_type"

    invoke-interface {v3, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1129
    const-string v8, "_registerNamespace"

    invoke-interface {v3, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1130
    const-string v8, "_plaintext"

    invoke-interface {v3, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    const-string v8, "x_copy"

    invoke-interface {v3, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    const-string v8, "x_unique"

    invoke-interface {v3, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1135
    const-string v8, "x_fname"

    invoke-interface {v3, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1136
    const-string v8, "x_ftype"

    invoke-interface {v3, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1137
    const-string v8, "x_type"

    invoke-interface {v3, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1139
    return-object v3
.end method

.method private static final evaluateElementOperation(Lfreemarker/ext/jdom/NodeListModel$NodeOperator;Ljava/util/List;)Ljava/util/List;
    .registers 11
    .param p0, "op"    # Lfreemarker/ext/jdom/NodeListModel$NodeOperator;
    .param p1, "nodes"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1028
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    .line 1029
    .local v7, "s":I
    new-array v5, v7, [Ljava/util/List;

    .line 1030
    .local v5, "lists":[Ljava/util/List;
    const/4 v3, 0x0

    .line 1032
    .local v3, "l":I
    const/4 v0, 0x0

    .line 1033
    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1034
    .local v2, "it":Ljava/util/Iterator;
    :cond_c
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_27

    .line 1035
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {p0, v8}, Lfreemarker/ext/jdom/NodeListModel$NodeOperator;->operate(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 1036
    .local v4, "list":Ljava/util/List;
    if-eqz v4, :cond_c

    .line 1037
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-object v4, v5, v0

    .line 1038
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v3, v8

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_c

    .line 1042
    .end local v4    # "list":Ljava/util/List;
    :cond_27
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1043
    .local v6, "retval":Ljava/util/List;
    const/4 v0, 0x0

    :goto_2d
    if-ge v0, v7, :cond_3b

    .line 1044
    aget-object v8, v5, v0

    if-eqz v8, :cond_38

    .line 1045
    aget-object v8, v5, v0

    invoke-interface {v6, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1043
    :cond_38
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 1048
    :cond_3b
    return-object v6
.end method

.method private static final evaluateNamedElementOperation(Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;Ljava/lang/String;Lorg/jdom/Namespace;Ljava/util/List;)Ljava/util/List;
    .registers 13
    .param p0, "op"    # Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespace"    # Lorg/jdom/Namespace;
    .param p3, "nodes"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1055
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v7

    .line 1056
    .local v7, "s":I
    new-array v5, v7, [Ljava/util/List;

    .line 1057
    .local v5, "lists":[Ljava/util/List;
    const/4 v3, 0x0

    .line 1059
    .local v3, "l":I
    const/4 v0, 0x0

    .line 1060
    .local v0, "i":I
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1061
    .local v2, "it":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_25

    .line 1062
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {p0, v8, p1, p2}, Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;->operate(Ljava/lang/Object;Ljava/lang/String;Lorg/jdom/Namespace;)Ljava/util/List;

    move-result-object v4

    .line 1063
    .local v4, "list":Ljava/util/List;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-object v4, v5, v0

    .line 1064
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v3, v8

    move v0, v1

    .line 1065
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_c

    .line 1067
    .end local v4    # "list":Ljava/util/List;
    :cond_25
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1068
    .local v6, "retval":Ljava/util/List;
    const/4 v0, 0x0

    :goto_2b
    if-ge v0, v7, :cond_35

    .line 1069
    aget-object v8, v5, v0

    invoke-interface {v6, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1068
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 1070
    :cond_35
    return-object v6
.end method

.method private static final getParent(Ljava/lang/Object;)Lorg/jdom/Element;
    .registers 2
    .param p0, "node"    # Ljava/lang/Object;

    .prologue
    .line 846
    instance-of v0, p0, Lorg/jdom/Element;

    if-eqz v0, :cond_b

    .line 847
    check-cast p0, Lorg/jdom/Element;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/Element;->getParent()Lorg/jdom/Element;

    move-result-object v0

    .line 861
    :goto_a
    return-object v0

    .line 848
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p0, Lorg/jdom/Attribute;

    if-eqz v0, :cond_16

    .line 849
    check-cast p0, Lorg/jdom/Attribute;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/Attribute;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 850
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/jdom/Text;

    if-eqz v0, :cond_21

    .line 851
    check-cast p0, Lorg/jdom/Text;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/Text;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 852
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_21
    instance-of v0, p0, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_2c

    .line 853
    check-cast p0, Lorg/jdom/ProcessingInstruction;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/ProcessingInstruction;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 854
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_2c
    instance-of v0, p0, Lorg/jdom/Comment;

    if-eqz v0, :cond_37

    .line 855
    check-cast p0, Lorg/jdom/Comment;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/Comment;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 856
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_37
    instance-of v0, p0, Lorg/jdom/EntityRef;

    if-eqz v0, :cond_42

    .line 857
    check-cast p0, Lorg/jdom/EntityRef;

    .end local p0    # "node":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/jdom/EntityRef;->getParent()Lorg/jdom/Element;

    move-result-object v0

    goto :goto_a

    .line 861
    .restart local p0    # "node":Ljava/lang/Object;
    :cond_42
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private getPlainText()Lfreemarker/template/SimpleScalar;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 529
    sget-object v3, Lfreemarker/ext/jdom/NodeListModel;->OPERATIONS:Ljava/util/Map;

    const-string v4, "_text"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/jdom/NodeListModel$TextOp;

    iget-object v4, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-static {v3, v4}, Lfreemarker/ext/jdom/NodeListModel;->evaluateElementOperation(Lfreemarker/ext/jdom/NodeListModel$NodeOperator;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 530
    .local v2, "list":Ljava/util/List;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 531
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 532
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_19

    .line 534
    :cond_27
    new-instance v3, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v3
.end method

.method private getType()Lfreemarker/template/TemplateModel;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 500
    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_11

    .line 501
    new-instance v2, Lfreemarker/template/SimpleScalar;

    const-string v3, ""

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 522
    :goto_10
    return-object v2

    .line 502
    :cond_11
    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 504
    .local v1, "firstNode":Ljava/lang/Object;
    instance-of v2, v1, Lorg/jdom/Element;

    if-eqz v2, :cond_2d

    .line 505
    const/16 v0, 0x65

    .line 522
    .local v0, "code":C
    :goto_1d
    new-instance v2, Lfreemarker/template/SimpleScalar;

    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [C

    aput-char v0, v4, v5

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_10

    .line 506
    .end local v0    # "code":C
    :cond_2d
    instance-of v2, v1, Lorg/jdom/Text;

    if-nez v2, :cond_35

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_38

    .line 507
    :cond_35
    const/16 v0, 0x78

    .restart local v0    # "code":C
    goto :goto_1d

    .line 508
    .end local v0    # "code":C
    :cond_38
    instance-of v2, v1, Lorg/jdom/Attribute;

    if-eqz v2, :cond_3f

    .line 509
    const/16 v0, 0x61

    .restart local v0    # "code":C
    goto :goto_1d

    .line 510
    .end local v0    # "code":C
    :cond_3f
    instance-of v2, v1, Lorg/jdom/EntityRef;

    if-eqz v2, :cond_46

    .line 511
    const/16 v0, 0x6e

    .restart local v0    # "code":C
    goto :goto_1d

    .line 512
    .end local v0    # "code":C
    :cond_46
    instance-of v2, v1, Lorg/jdom/Document;

    if-eqz v2, :cond_4d

    .line 513
    const/16 v0, 0x64

    .restart local v0    # "code":C
    goto :goto_1d

    .line 514
    .end local v0    # "code":C
    :cond_4d
    instance-of v2, v1, Lorg/jdom/DocType;

    if-eqz v2, :cond_54

    .line 515
    const/16 v0, 0x74

    .restart local v0    # "code":C
    goto :goto_1d

    .line 516
    .end local v0    # "code":C
    :cond_54
    instance-of v2, v1, Lorg/jdom/Comment;

    if-eqz v2, :cond_5b

    .line 517
    const/16 v0, 0x63

    .restart local v0    # "code":C
    goto :goto_1d

    .line 518
    .end local v0    # "code":C
    :cond_5b
    instance-of v2, v1, Lorg/jdom/ProcessingInstruction;

    if-eqz v2, :cond_62

    .line 519
    const/16 v0, 0x70

    .restart local v0    # "code":C
    goto :goto_1d

    .line 521
    .end local v0    # "code":C
    :cond_62
    const/16 v0, 0x3f

    .restart local v0    # "code":C
    goto :goto_1d
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 1248
    new-instance v0, Lorg/jdom/input/SAXBuilder;

    invoke-direct {v0}, Lorg/jdom/input/SAXBuilder;-><init>()V

    .line 1249
    .local v0, "builder":Lorg/jdom/input/SAXBuilder;
    sget-object v6, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v6}, Lorg/jdom/input/SAXBuilder;->build(Ljava/io/InputStream;)Lorg/jdom/Document;

    move-result-object v1

    .line 1250
    .local v1, "document":Lorg/jdom/Document;
    new-instance v3, Lfreemarker/template/SimpleHash;

    invoke-direct {v3}, Lfreemarker/template/SimpleHash;-><init>()V

    .line 1251
    .local v3, "model":Lfreemarker/template/SimpleHash;
    const-string v6, "document"

    new-instance v7, Lfreemarker/ext/jdom/NodeListModel;

    invoke-direct {v7, v1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Lorg/jdom/Document;)V

    invoke-virtual {v3, v6, v7}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1252
    new-instance v2, Ljava/io/FileReader;

    aget-object v6, p0, v8

    invoke-direct {v2, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 1253
    .local v2, "fr":Ljava/io/FileReader;
    new-instance v4, Lfreemarker/template/Template;

    aget-object v6, p0, v8

    invoke-direct {v4, v6, v2}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/io/Reader;)V

    .line 1254
    .local v4, "template":Lfreemarker/template/Template;
    new-instance v5, Ljava/io/OutputStreamWriter;

    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 1255
    .local v5, "w":Ljava/io/Writer;
    invoke-virtual {v4, v3, v5}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;)V

    .line 1256
    invoke-virtual {v5}, Ljava/io/Writer;->flush()V

    .line 1257
    invoke-virtual {v5}, Ljava/io/Writer;->close()V

    .line 1258
    return-void
.end method

.method private static final removeDuplicates(Ljava/util/List;)Ljava/util/List;
    .registers 8
    .param p0, "list"    # Ljava/util/List;

    .prologue
    .line 1075
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 1076
    .local v2, "s":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1077
    .local v4, "ulist":Ljava/util/ArrayList;
    new-instance v3, Ljava/util/HashSet;

    mul-int/lit8 v5, v2, 0x4

    div-int/lit8 v5, v5, 0x3

    const/high16 v6, 0x3f400000    # 0.75f

    invoke-direct {v3, v5, v6}, Ljava/util/HashSet;-><init>(IF)V

    .line 1078
    .local v3, "set":Ljava/util/Set;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1079
    .local v0, "it":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 1080
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1081
    .local v1, "o":Ljava/lang/Object;
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 1082
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 1084
    .end local v1    # "o":Ljava/lang/Object;
    :cond_2c
    invoke-virtual {v4}, Ljava/util/ArrayList;->trimToSize()V

    .line 1085
    return-object v4
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 10
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 595
    if-eqz p1, :cond_9

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_11

    .line 596
    :cond_9
    new-instance v5, Lfreemarker/template/TemplateModelException;

    const-string v6, "Exactly one argument required for execute() on NodeTemplate"

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 598
    :cond_11
    const/4 v5, 0x0

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 599
    .local v4, "xpathString":Ljava/lang/String;
    const/4 v2, 0x0

    .line 602
    .local v2, "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    :try_start_19
    sget-object v6, Lfreemarker/ext/jdom/NodeListModel;->XPATH_CACHE:Ljava/util/Map;

    monitor-enter v6
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_46

    .line 604
    :try_start_1c
    sget-object v5, Lfreemarker/ext/jdom/NodeListModel;->XPATH_CACHE:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;

    move-object v2, v0

    .line 605
    if-nez v2, :cond_33

    .line 607
    new-instance v3, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;

    invoke-direct {v3, v4}, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;-><init>(Ljava/lang/String;)V
    :try_end_2d
    .catchall {:try_start_1c .. :try_end_2d} :catchall_43

    .line 608
    .end local v2    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    .local v3, "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    :try_start_2d
    sget-object v5, Lfreemarker/ext/jdom/NodeListModel;->XPATH_CACHE:Ljava/util/Map;

    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_60

    move-object v2, v3

    .line 610
    .end local v3    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    .restart local v2    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    :cond_33
    :try_start_33
    monitor-exit v6
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_43

    .line 611
    :try_start_34
    iget-object v5, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    iget-object v6, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-virtual {v2, v5, v6}, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;->selectNodes(Ljava/lang/Object;Ljava/util/Map;)Ljava/util/List;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-static {v5, v6}, Lfreemarker/ext/jdom/NodeListModel;->createNodeListModel(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_41} :catch_46

    move-result-object v5

    return-object v5

    .line 610
    :catchall_43
    move-exception v5

    :goto_44
    :try_start_44
    monitor-exit v6
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_43

    :try_start_45
    throw v5
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_46} :catch_46

    .line 613
    :catch_46
    move-exception v1

    .line 615
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lfreemarker/template/TemplateModelException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Could not evaulate XPath expression "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 610
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    .restart local v3    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    :catchall_60
    move-exception v5

    move-object v2, v3

    .end local v3    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    .restart local v2    # "xpath":Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
    goto :goto_44
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 563
    :try_start_0
    new-instance v1, Lfreemarker/ext/jdom/NodeListModel;

    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-direct {v1, v2, v3}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/lang/Object;Ljava/util/Map;)V
    :try_end_d
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 564
    :catch_e
    move-exception v0

    .line 565
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Index out of bounds: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IndexOutOfBoundsException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 16
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    .line 398
    invoke-virtual {p0}, Lfreemarker/ext/jdom/NodeListModel;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 399
    sget-object v10, Lfreemarker/ext/jdom/NodeListModel;->EMPTY:Lfreemarker/ext/jdom/NodeListModel;

    .line 495
    :goto_b
    return-object v10

    .line 401
    :cond_c
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_33

    .line 402
    :cond_14
    new-instance v10, Lfreemarker/template/TemplateModelException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "Invalid key ["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 404
    :cond_33
    const/4 v8, 0x0

    .line 405
    .local v8, "op":Lfreemarker/ext/jdom/NodeListModel$NodeOperator;
    const/4 v6, 0x0

    .line 406
    .local v6, "nop":Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;
    const/4 v4, 0x0

    .line 408
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v10

    sparse-switch v10, :sswitch_data_156

    .line 466
    :cond_3d
    :goto_3d
    if-nez v8, :cond_44

    if-nez v6, :cond_44

    .line 467
    sget-object v6, Lfreemarker/ext/jdom/NodeListModel;->NAMED_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

    .line 468
    move-object v4, p1

    .line 471
    :cond_44
    const/4 v2, 0x0

    .line 472
    .local v2, "list":Ljava/util/List;
    if-eqz v8, :cond_fc

    .line 473
    iget-object v10, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-static {v8, v10}, Lfreemarker/ext/jdom/NodeListModel;->evaluateElementOperation(Lfreemarker/ext/jdom/NodeListModel$NodeOperator;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 495
    :goto_4d
    iget-object v10, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-static {v2, v10}, Lfreemarker/ext/jdom/NodeListModel;->createNodeListModel(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;

    move-result-object v10

    goto :goto_b

    .line 411
    .end local v2    # "list":Ljava/util/List;
    :sswitch_54
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x2

    if-ne v10, v11, :cond_63

    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x2a

    if-eq v10, v11, :cond_6a

    .line 413
    :cond_63
    sget-object v6, Lfreemarker/ext/jdom/NodeListModel;->NAMED_ATTRIBUTE_OP:Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;

    .line 414
    invoke-virtual {p1, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_3d

    .line 417
    :cond_6a
    sget-object v8, Lfreemarker/ext/jdom/NodeListModel;->ALL_ATTRIBUTES_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    .line 419
    goto :goto_3d

    .line 423
    :sswitch_6d
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-ne v10, v12, :cond_76

    .line 424
    sget-object v8, Lfreemarker/ext/jdom/NodeListModel;->ALL_CHILDREN_OP:Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    goto :goto_3d

    .line 427
    :cond_76
    new-instance v10, Lfreemarker/template/TemplateModelException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "Invalid key ["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "]"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 434
    :sswitch_95
    sget-object v10, Lfreemarker/ext/jdom/NodeListModel;->OPERATIONS:Ljava/util/Map;

    invoke-interface {v10, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "op":Lfreemarker/ext/jdom/NodeListModel$NodeOperator;
    check-cast v8, Lfreemarker/ext/jdom/NodeListModel$NodeOperator;

    .line 435
    .restart local v8    # "op":Lfreemarker/ext/jdom/NodeListModel$NodeOperator;
    if-nez v8, :cond_3d

    .line 437
    sget-object v10, Lfreemarker/ext/jdom/NodeListModel;->SPECIAL_OPERATIONS:Ljava/util/Map;

    invoke-interface {v10, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 438
    .local v9, "specop":Ljava/lang/Integer;
    if-eqz v9, :cond_3d

    .line 439
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v10

    packed-switch v10, :pswitch_data_168

    goto :goto_3d

    .line 442
    :pswitch_b1
    iget-object v12, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    monitor-enter v12

    .line 444
    :try_start_b4
    new-instance v11, Lfreemarker/ext/jdom/NodeListModel;

    iget-object v13, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    iget-object v10, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    check-cast v10, Ljava/util/HashMap;

    invoke-virtual {v10}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map;

    invoke-direct {v11, v13, v10}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Ljava/util/Map;)V

    monitor-exit v12

    move-object v10, v11

    goto/16 :goto_b

    .line 445
    :catchall_c9
    move-exception v10

    monitor-exit v12
    :try_end_cb
    .catchall {:try_start_b4 .. :try_end_cb} :catchall_c9

    throw v10

    .line 448
    :pswitch_cc
    new-instance v10, Lfreemarker/ext/jdom/NodeListModel;

    iget-object v11, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-static {v11}, Lfreemarker/ext/jdom/NodeListModel;->removeDuplicates(Ljava/util/List;)Ljava/util/List;

    move-result-object v11

    iget-object v12, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-direct {v10, v11, v12}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/util/List;Ljava/util/Map;)V

    goto/16 :goto_b

    .line 450
    :pswitch_db
    new-instance v10, Lfreemarker/ext/jdom/NodeListModel$NameFilter;

    invoke-direct {v10, p0, v11}, Lfreemarker/ext/jdom/NodeListModel$NameFilter;-><init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V

    goto/16 :goto_b

    .line 452
    :pswitch_e2
    new-instance v10, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;

    invoke-direct {v10, p0, v11}, Lfreemarker/ext/jdom/NodeListModel$TypeFilter;-><init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V

    goto/16 :goto_b

    .line 454
    :pswitch_e9
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel;->getType()Lfreemarker/template/TemplateModel;

    move-result-object v10

    goto/16 :goto_b

    .line 456
    :pswitch_ef
    new-instance v10, Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;

    invoke-direct {v10, p0, v11}, Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;-><init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V

    goto/16 :goto_b

    .line 458
    :pswitch_f6
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel;->getPlainText()Lfreemarker/template/SimpleScalar;

    move-result-object v10

    goto/16 :goto_b

    .line 475
    .end local v9    # "specop":Ljava/lang/Integer;
    .restart local v2    # "list":Ljava/util/List;
    :cond_fc
    move-object v3, v4

    .line 476
    .local v3, "localName":Ljava/lang/String;
    sget-object v5, Lorg/jdom/Namespace;->NO_NAMESPACE:Lorg/jdom/Namespace;

    .line 477
    .local v5, "namespace":Lorg/jdom/Namespace;
    const/16 v10, 0x3a

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 478
    .local v1, "colon":I
    const/4 v10, -0x1

    if-eq v1, v10, :cond_12c

    .line 479
    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v4, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 480
    invoke-virtual {v4, v13, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 481
    .local v7, "nsPrefix":Ljava/lang/String;
    iget-object v11, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    monitor-enter v11

    .line 483
    :try_start_115
    iget-object v10, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/jdom/Namespace;

    move-object v5, v0

    .line 484
    monitor-exit v11
    :try_end_120
    .catchall {:try_start_115 .. :try_end_120} :catchall_134

    .line 485
    if-nez v5, :cond_12c

    .line 486
    const-string v10, "xml"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_137

    .line 487
    sget-object v5, Lorg/jdom/Namespace;->XML_NAMESPACE:Lorg/jdom/Namespace;

    .line 493
    .end local v7    # "nsPrefix":Ljava/lang/String;
    :cond_12c
    iget-object v10, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-static {v6, v3, v5, v10}, Lfreemarker/ext/jdom/NodeListModel;->evaluateNamedElementOperation(Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;Ljava/lang/String;Lorg/jdom/Namespace;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto/16 :goto_4d

    .line 484
    .restart local v7    # "nsPrefix":Ljava/lang/String;
    :catchall_134
    move-exception v10

    :try_start_135
    monitor-exit v11
    :try_end_136
    .catchall {:try_start_135 .. :try_end_136} :catchall_134

    throw v10

    .line 489
    :cond_137
    new-instance v10, Lfreemarker/template/TemplateModelException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string v12, "Unregistered namespace prefix \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 408
    :sswitch_data_156
    .sparse-switch
        0x2a -> :sswitch_6d
        0x40 -> :sswitch_54
        0x5f -> :sswitch_95
        0x78 -> :sswitch_95
    .end sparse-switch

    .line 439
    :pswitch_data_168
    .packed-switch 0x0
        :pswitch_b1
        :pswitch_cc
        :pswitch_db
        :pswitch_e2
        :pswitch_e9
        :pswitch_ef
        :pswitch_f6
    .end packed-switch
.end method

.method public getAsString()Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 242
    invoke-virtual {p0}, Lfreemarker/ext/jdom/NodeListModel;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 243
    const-string v4, ""

    .line 275
    :goto_8
    return-object v4

    .line 245
    :cond_9
    new-instance v3, Ljava/io/StringWriter;

    iget-object v4, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    mul-int/lit16 v4, v4, 0x80

    invoke-direct {v3, v4}, Ljava/io/StringWriter;-><init>(I)V

    .line 247
    .local v3, "sw":Ljava/io/StringWriter;
    :try_start_16
    iget-object v4, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d2

    .line 248
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 249
    .local v2, "node":Ljava/lang/Object;
    instance-of v4, v2, Lorg/jdom/Element;

    if-eqz v4, :cond_3d

    .line 250
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/Element;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/Element;Ljava/io/Writer;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_31} :catch_32

    goto :goto_1c

    .line 272
    .end local v1    # "i":Ljava/util/Iterator;
    :catch_32
    move-exception v0

    .line 273
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lfreemarker/template/TemplateModelException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 251
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_3d
    :try_start_3d
    instance-of v4, v2, Lorg/jdom/Attribute;

    if-eqz v4, :cond_49

    .line 252
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/Attribute;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/Attribute;Ljava/io/Writer;)V

    goto :goto_1c

    .line 253
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_49
    instance-of v4, v2, Ljava/lang/String;

    if-eqz v4, :cond_5b

    .line 254
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->escapeElementEntities(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    goto :goto_1c

    .line 255
    :cond_5b
    instance-of v4, v2, Lorg/jdom/Text;

    if-eqz v4, :cond_67

    .line 256
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/Text;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/Text;Ljava/io/Writer;)V

    goto :goto_1c

    .line 257
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_67
    instance-of v4, v2, Lorg/jdom/Document;

    if-eqz v4, :cond_73

    .line 258
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/Document;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/Document;Ljava/io/Writer;)V

    goto :goto_1c

    .line 259
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_73
    instance-of v4, v2, Lorg/jdom/ProcessingInstruction;

    if-eqz v4, :cond_7f

    .line 260
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/ProcessingInstruction;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/ProcessingInstruction;Ljava/io/Writer;)V

    goto :goto_1c

    .line 261
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_7f
    instance-of v4, v2, Lorg/jdom/Comment;

    if-eqz v4, :cond_8b

    .line 262
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/Comment;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/Comment;Ljava/io/Writer;)V

    goto :goto_1c

    .line 263
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_8b
    instance-of v4, v2, Lorg/jdom/CDATA;

    if-eqz v4, :cond_97

    .line 264
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/CDATA;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/CDATA;Ljava/io/Writer;)V

    goto :goto_1c

    .line 265
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_97
    instance-of v4, v2, Lorg/jdom/DocType;

    if-eqz v4, :cond_a4

    .line 266
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/DocType;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/DocType;Ljava/io/Writer;)V

    goto/16 :goto_1c

    .line 267
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_a4
    instance-of v4, v2, Lorg/jdom/EntityRef;

    if-eqz v4, :cond_b1

    .line 268
    sget-object v4, Lfreemarker/ext/jdom/NodeListModel;->OUTPUT:Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;

    check-cast v2, Lorg/jdom/EntityRef;

    .end local v2    # "node":Ljava/lang/Object;
    invoke-virtual {v4, v2, v3}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->output(Lorg/jdom/EntityRef;Ljava/io/Writer;)V

    goto/16 :goto_1c

    .line 270
    .restart local v2    # "node":Ljava/lang/Object;
    :cond_b1
    new-instance v4, Lfreemarker/template/TemplateModelException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " is not a core JDOM class"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d2
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_d2} :catch_32

    .line 275
    .end local v2    # "node":Ljava/lang/Object;
    :cond_d2
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_8
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 2

    .prologue
    .line 539
    new-instance v0, Lfreemarker/ext/jdom/NodeListModel$1;

    invoke-direct {v0, p0}, Lfreemarker/ext/jdom/NodeListModel$1;-><init>(Lfreemarker/ext/jdom/NodeListModel;)V

    return-object v0
.end method

.method public registerNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 646
    iget-object v1, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    monitor-enter v1

    .line 648
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->namespaces:Ljava/util/Map;

    invoke-static {p1, p2}, Lorg/jdom/Namespace;->getNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/jdom/Namespace;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    monitor-exit v1

    .line 650
    return-void

    .line 649
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 571
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
