.class Lorg/jsoup/parser/HtmlTreeBuilder;
.super Lorg/jsoup/parser/TreeBuilder;
.source "HtmlTreeBuilder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final TagSearchButton:[Ljava/lang/String;

.field private static final TagSearchEndTags:[Ljava/lang/String;

.field private static final TagSearchList:[Ljava/lang/String;

.field private static final TagSearchSelectScope:[Ljava/lang/String;

.field private static final TagSearchSpecial:[Ljava/lang/String;

.field private static final TagSearchTableScope:[Ljava/lang/String;

.field private static final TagsScriptStyle:[Ljava/lang/String;

.field public static final TagsSearchInScope:[Ljava/lang/String;


# instance fields
.field private baseUriSetFromDoc:Z

.field private contextElement:Lorg/jsoup/nodes/Element;

.field private formElement:Lorg/jsoup/nodes/FormElement;

.field private formattingElements:Lorg/jsoup/helper/DescendableLinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jsoup/helper/DescendableLinkedList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;"
        }
    .end annotation
.end field

.field private fosterInserts:Z

.field private fragmentParsing:Z

.field private framesetOk:Z

.field private headElement:Lorg/jsoup/nodes/Element;

.field private originalState:Lorg/jsoup/parser/HtmlTreeBuilderState;

.field private pendingTableCharacters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/parser/Token$Character;",
            ">;"
        }
    .end annotation
.end field

.field private state:Lorg/jsoup/parser/HtmlTreeBuilderState;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 17
    const-class v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_26e

    move v0, v1

    :goto_e
    sput-boolean v0, Lorg/jsoup/parser/HtmlTreeBuilder;->$assertionsDisabled:Z

    .line 19
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "script"

    aput-object v3, v0, v2

    const-string v3, "style"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagsScriptStyle:[Ljava/lang/String;

    .line 20
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string v3, "applet"

    aput-object v3, v0, v2

    const-string v3, "caption"

    aput-object v3, v0, v1

    const-string v3, "html"

    aput-object v3, v0, v5

    const-string v3, "table"

    aput-object v3, v0, v6

    const-string v3, "td"

    aput-object v3, v0, v7

    const/4 v3, 0x5

    const-string v4, "th"

    aput-object v4, v0, v3

    const/4 v3, 0x6

    const-string v4, "marquee"

    aput-object v4, v0, v3

    const/4 v3, 0x7

    const-string v4, "object"

    aput-object v4, v0, v3

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    .line 21
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "ol"

    aput-object v3, v0, v2

    const-string v3, "ul"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    .line 22
    new-array v0, v1, [Ljava/lang/String;

    const-string v3, "button"

    aput-object v3, v0, v2

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    .line 23
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "html"

    aput-object v3, v0, v2

    const-string v3, "table"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    .line 24
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "optgroup"

    aput-object v3, v0, v2

    const-string v3, "option"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    .line 25
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string v3, "dd"

    aput-object v3, v0, v2

    const-string v3, "dt"

    aput-object v3, v0, v1

    const-string v3, "li"

    aput-object v3, v0, v5

    const-string v3, "option"

    aput-object v3, v0, v6

    const-string v3, "optgroup"

    aput-object v3, v0, v7

    const/4 v3, 0x5

    const-string v4, "p"

    aput-object v4, v0, v3

    const/4 v3, 0x6

    const-string v4, "rp"

    aput-object v4, v0, v3

    const/4 v3, 0x7

    const-string v4, "rt"

    aput-object v4, v0, v3

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    .line 26
    const/16 v0, 0x4f

    new-array v0, v0, [Ljava/lang/String;

    const-string v3, "address"

    aput-object v3, v0, v2

    const-string v2, "applet"

    aput-object v2, v0, v1

    const-string v1, "area"

    aput-object v1, v0, v5

    const-string v1, "article"

    aput-object v1, v0, v6

    const-string v1, "aside"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "base"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "basefont"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "bgsound"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "blockquote"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "body"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "br"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "button"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "caption"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "center"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "col"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "colgroup"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "command"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "dd"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "details"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "dir"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "div"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "dl"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "dt"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "embed"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "fieldset"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "figcaption"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "figure"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "footer"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "form"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "frame"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "frameset"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "h1"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "h2"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "h3"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "h4"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "h5"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "h6"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "head"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "header"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "hgroup"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "hr"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "html"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "iframe"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "img"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "input"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "isindex"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "li"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "link"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "listing"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "marquee"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "menu"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "meta"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "nav"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "noembed"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string v2, "noframes"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string v2, "noscript"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "object"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string v2, "ol"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "p"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string v2, "param"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "plaintext"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "pre"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "script"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string v2, "section"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "select"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "style"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "summary"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "table"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "tbody"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "td"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "textarea"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "tfoot"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "th"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "thead"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "title"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "tr"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "ul"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "wbr"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "xmp"

    aput-object v2, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSpecial:[Ljava/lang/String;

    return-void

    :cond_26e
    move v0, v2

    .line 17
    goto/16 :goto_e
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lorg/jsoup/parser/TreeBuilder;-><init>()V

    .line 38
    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 42
    new-instance v0, Lorg/jsoup/helper/DescendableLinkedList;

    invoke-direct {v0}, Lorg/jsoup/helper/DescendableLinkedList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 46
    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 47
    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 49
    return-void
.end method

.method private varargs clearStackToContext([Ljava/lang/String;)V
    .registers 6
    .param p1, "nodeNames"    # [Ljava/lang/String;

    .prologue
    .line 364
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 365
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 366
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 367
    .local v1, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 372
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_28
    return-void

    .line 370
    .restart local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_29
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6
.end method

.method private inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 6
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "baseTypes"    # [Ljava/lang/String;
    .param p3, "extraTypes"    # [Ljava/lang/String;

    .prologue
    .line 455
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0, p2, p3}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 9
    .param p1, "targetNames"    # [Ljava/lang/String;
    .param p2, "baseTypes"    # [Ljava/lang/String;
    .param p3, "extraTypes"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 459
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v4}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v2

    .line 460
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 461
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 462
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    .line 463
    .local v1, "elName":Ljava/lang/String;
    invoke-static {v1, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 464
    const/4 v3, 0x1

    .line 471
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_1e
    :goto_1e
    return v3

    .line 465
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    .restart local v1    # "elName":Ljava/lang/String;
    :cond_1f
    invoke-static {v1, p2}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 467
    if-eqz p3, :cond_7

    invoke-static {v1, p3}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_1e

    .line 470
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_2e
    const-string v4, "Should not be reachable"

    invoke-static {v4}, Lorg/jsoup/helper/Validate;->fail(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method private insertNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 244
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0}, Lorg/jsoup/helper/DescendableLinkedList;->size()I

    move-result v0

    if-nez v0, :cond_2a

    .line 245
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Document;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 252
    :goto_d
    instance-of v0, p1, Lorg/jsoup/nodes/Element;

    if-eqz v0, :cond_29

    move-object v0, p1

    check-cast v0, Lorg/jsoup/nodes/Element;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isFormListed()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 253
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    if-eqz v0, :cond_29

    .line 254
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    check-cast p1, Lorg/jsoup/nodes/Element;

    .end local p1    # "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/FormElement;->addElement(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/FormElement;

    .line 256
    :cond_29
    return-void

    .line 246
    .restart local p1    # "node":Lorg/jsoup/nodes/Node;
    :cond_2a
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->isFosterInserts()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 247
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertInFosterParent(Lorg/jsoup/nodes/Node;)V

    goto :goto_d

    .line 249
    :cond_34
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto :goto_d
.end method

.method private isElementInQueue(Lorg/jsoup/helper/DescendableLinkedList;Lorg/jsoup/nodes/Element;)Z
    .registers 6
    .param p2, "element"    # Lorg/jsoup/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/helper/DescendableLinkedList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;",
            "Lorg/jsoup/nodes/Element;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, "queue":Lorg/jsoup/helper/DescendableLinkedList;, "Lorg/jsoup/helper/DescendableLinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {p1}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 281
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 282
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 283
    .local v1, "next":Lorg/jsoup/nodes/Element;
    if-ne v1, p2, :cond_4

    .line 284
    const/4 v2, 0x1

    .line 287
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :goto_13
    return v2

    :cond_14
    const/4 v2, 0x0

    goto :goto_13
.end method

.method private isSameFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 5
    .param p1, "a"    # Lorg/jsoup/nodes/Element;
    .param p2, "b"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 598
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v0

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Attributes;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private replaceInQueue(Ljava/util/LinkedList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p2, "out"    # Lorg/jsoup/nodes/Element;
    .param p3, "in"    # Lorg/jsoup/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;",
            "Lorg/jsoup/nodes/Element;",
            "Lorg/jsoup/nodes/Element;",
            ")V"
        }
    .end annotation

    .prologue
    .line 397
    .local p1, "queue":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {p1, p2}, Ljava/util/LinkedList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 398
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_12

    const/4 v1, 0x1

    :goto_8
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 399
    invoke-virtual {p1, v0}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    .line 400
    invoke-virtual {p1, v0, p3}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 401
    return-void

    .line 398
    :cond_12
    const/4 v1, 0x0

    goto :goto_8
.end method


# virtual methods
.method aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 375
    sget-boolean v2, Lorg/jsoup/parser/HtmlTreeBuilder;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v2

    if-nez v2, :cond_10

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 376
    :cond_10
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 377
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 378
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 379
    .local v1, "next":Lorg/jsoup/nodes/Element;
    if-ne v1, p1, :cond_16

    .line 380
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 383
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :goto_2a
    return-object v2

    :cond_2b
    const/4 v2, 0x0

    goto :goto_2a
.end method

.method clearFormattingElementsToLastMarker()V
    .registers 3

    .prologue
    .line 643
    :cond_0
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v1}, Lorg/jsoup/helper/DescendableLinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_17

    .line 644
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v1}, Lorg/jsoup/helper/DescendableLinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 645
    .local v0, "el":Lorg/jsoup/nodes/Element;
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v1}, Lorg/jsoup/helper/DescendableLinkedList;->removeLast()Ljava/lang/Object;

    .line 646
    if-nez v0, :cond_0

    .line 649
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_17
    return-void
.end method

.method clearStackToTableBodyContext()V
    .registers 4

    .prologue
    .line 356
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "tbody"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "tfoot"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "thead"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 357
    return-void
.end method

.method clearStackToTableContext()V
    .registers 4

    .prologue
    .line 352
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "table"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method clearStackToTableRowContext()V
    .registers 4

    .prologue
    .line 360
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "tr"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 361
    return-void
.end method

.method error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V
    .registers 9
    .param p1, "state"    # Lorg/jsoup/parser/HtmlTreeBuilderState;

    .prologue
    .line 169
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 170
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->errors:Lorg/jsoup/parser/ParseErrorList;

    new-instance v1, Lorg/jsoup/parser/ParseError;

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->reader:Lorg/jsoup/parser/CharacterReader;

    invoke-virtual {v2}, Lorg/jsoup/parser/CharacterReader;->pos()I

    move-result v2

    const-string v3, "Unexpected token [%s] when in state [%s]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    invoke-virtual {v6}, Lorg/jsoup/parser/Token;->tokenType()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-direct {v1, v2, v3, v4}, Lorg/jsoup/parser/ParseError;-><init>(ILjava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lorg/jsoup/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_29
    return-void
.end method

.method framesetOk(Z)V
    .registers 2
    .param p1, "framesetOk"    # Z

    .prologue
    .line 137
    iput-boolean p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 138
    return-void
.end method

.method framesetOk()Z
    .registers 2

    .prologue
    .line 141
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    return v0
.end method

.method generateImpliedEndTags()V
    .registers 2

    .prologue
    .line 566
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 567
    return-void
.end method

.method generateImpliedEndTags(Ljava/lang/String;)V
    .registers 4
    .param p1, "excludeTag"    # Ljava/lang/String;

    .prologue
    .line 560
    :goto_0
    if-eqz p1, :cond_24

    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 562
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    goto :goto_0

    .line 563
    :cond_24
    return-void
.end method

.method getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "nodeName"    # Ljava/lang/String;

    .prologue
    .line 667
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 668
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 669
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 670
    .local v1, "next":Lorg/jsoup/nodes/Element;
    if-nez v1, :cond_16

    .line 675
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_14
    const/4 v1, 0x0

    :goto_15
    return-object v1

    .line 672
    .restart local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_16
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_15
.end method

.method getBaseUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    return-object v0
.end method

.method getDocument()Lorg/jsoup/nodes/Document;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    return-object v0
.end method

.method getFormElement()Lorg/jsoup/nodes/FormElement;
    .registers 2

    .prologue
    .line 531
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    return-object v0
.end method

.method getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 291
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 292
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 293
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 294
    .local v1, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 298
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :goto_1c
    return-object v1

    :cond_1d
    const/4 v1, 0x0

    goto :goto_1c
.end method

.method getHeadElement()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 519
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->headElement:Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method getPendingTableCharacters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/parser/Token$Character;",
            ">;"
        }
    .end annotation

    .prologue
    .line 543
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    return-object v0
.end method

.method getStack()Lorg/jsoup/helper/DescendableLinkedList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jsoup/helper/DescendableLinkedList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    return-object v0
.end method

.method inButtonScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 493
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inListItemScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 489
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 479
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "extras"    # [Ljava/lang/String;

    .prologue
    .line 483
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope([Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetNames"    # [Ljava/lang/String;

    .prologue
    .line 475
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inSelectScope(Ljava/lang/String;)Z
    .registers 7
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 501
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v4}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v2

    .line 502
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    .line 503
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 504
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    .line 505
    .local v1, "elName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 506
    const/4 v3, 0x1

    .line 511
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :goto_1e
    return v3

    .line 507
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    .restart local v1    # "elName":Ljava/lang/String;
    :cond_1f
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_1e

    .line 510
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_28
    const-string v4, "Should not be reachable"

    invoke-static {v4}, Lorg/jsoup/helper/Validate;->fail(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method inTableScope(Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 497
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method insert(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "startTagName"    # Ljava/lang/String;

    .prologue
    .line 190
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 191
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/nodes/Element;)V

    .line 192
    return-object v0
.end method

.method insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 7
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 176
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 177
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 178
    .local v0, "el":Lorg/jsoup/nodes/Element;
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2, v0}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 179
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v3, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 180
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    new-instance v3, Lorg/jsoup/parser/Token$EndTag;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jsoup/parser/Token$EndTag;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    move-object v1, v0

    .line 186
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .local v1, "el":Ljava/lang/Object;
    :goto_25
    return-object v1

    .line 184
    .end local v1    # "el":Ljava/lang/Object;
    :cond_26
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v2

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v4, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v2, v3, v4}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 185
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/nodes/Element;)V

    move-object v1, v0

    .line 186
    .restart local v1    # "el":Ljava/lang/Object;
    goto :goto_25
.end method

.method insert(Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 196
    invoke-direct {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 197
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0, p1}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 198
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Character;)V
    .registers 6
    .param p1, "characterToken"    # Lorg/jsoup/parser/Token$Character;

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 235
    .local v1, "tagName":Ljava/lang/String;
    const-string v2, "script"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    const-string v2, "style"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 236
    :cond_18
    new-instance v0, Lorg/jsoup/nodes/DataNode;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lorg/jsoup/nodes/DataNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .local v0, "node":Lorg/jsoup/nodes/Node;
    :goto_23
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 240
    return-void

    .line 238
    .end local v0    # "node":Lorg/jsoup/nodes/Node;
    :cond_2b
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "node":Lorg/jsoup/nodes/Node;
    goto :goto_23
.end method

.method insert(Lorg/jsoup/parser/Token$Comment;)V
    .registers 5
    .param p1, "commentToken"    # Lorg/jsoup/parser/Token$Comment;

    .prologue
    .line 227
    new-instance v0, Lorg/jsoup/nodes/Comment;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Comment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .local v0, "comment":Lorg/jsoup/nodes/Comment;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 229
    return-void
.end method

.method insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 201
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 202
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/Element;

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 203
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 204
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 205
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isKnownTag()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 206
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 213
    :cond_2b
    :goto_2b
    return-object v0

    .line 209
    :cond_2c
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->setSelfClosing()Lorg/jsoup/parser/Tag;

    .line 210
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto :goto_2b
.end method

.method insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;
    .registers 7
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;
    .param p2, "onStack"    # Z

    .prologue
    .line 217
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 218
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/FormElement;

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/FormElement;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 219
    .local v0, "el":Lorg/jsoup/nodes/FormElement;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFormElement(Lorg/jsoup/nodes/FormElement;)V

    .line 220
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 221
    if-eqz p2, :cond_1e

    .line 222
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2, v0}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 223
    :cond_1e
    return-object v0
.end method

.method insertInFosterParent(Lorg/jsoup/nodes/Node;)V
    .registers 7
    .param p1, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 687
    const/4 v0, 0x0

    .line 688
    .local v0, "fosterParent":Lorg/jsoup/nodes/Element;
    const-string v3, "table"

    invoke-virtual {p0, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 689
    .local v2, "lastTable":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x0

    .line 690
    .local v1, "isLastTableParent":Z
    if-eqz v2, :cond_23

    .line 691
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_1e

    .line 692
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 693
    const/4 v1, 0x1

    .line 700
    :goto_15
    if-eqz v1, :cond_2d

    .line 701
    invoke-static {v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 702
    invoke-virtual {v2, p1}, Lorg/jsoup/nodes/Element;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 706
    :goto_1d
    return-void

    .line 695
    :cond_1e
    invoke-virtual {p0, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    goto :goto_15

    .line 697
    :cond_23
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/jsoup/helper/DescendableLinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .restart local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    goto :goto_15

    .line 705
    :cond_2d
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto :goto_1d
.end method

.method insertMarkerToFormattingElements()V
    .registers 3

    .prologue
    .line 683
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 684
    return-void
.end method

.method insertOnStackAfter(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p1, "after"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 387
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v1, p1}, Lorg/jsoup/helper/DescendableLinkedList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 388
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_15

    const/4 v1, 0x1

    :goto_a
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 389
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2, p2}, Lorg/jsoup/helper/DescendableLinkedList;->add(ILjava/lang/Object;)V

    .line 390
    return-void

    .line 388
    :cond_15
    const/4 v1, 0x0

    goto :goto_a
.end method

.method isFosterInserts()Z
    .registers 2

    .prologue
    .line 523
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    return v0
.end method

.method isFragmentParsing()Z
    .registers 2

    .prologue
    .line 165
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    return v0
.end method

.method isInActiveFormattingElements(Lorg/jsoup/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 663
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-direct {p0, v0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isElementInQueue(Lorg/jsoup/helper/DescendableLinkedList;Lorg/jsoup/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method isSpecial(Lorg/jsoup/nodes/Element;)Z
    .registers 4
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 572
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    .line 573
    .local v0, "name":Ljava/lang/String;
    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSpecial:[Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method markInsertionMode()V
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 130
    return-void
.end method

.method maybeSetBaseUri(Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "base"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 153
    iget-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    if-eqz v1, :cond_5

    .line 162
    :cond_4
    :goto_4
    return-void

    .line 156
    :cond_5
    const-string v1, "href"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "href":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 158
    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    .line 159
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 160
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->setBaseUri(Ljava/lang/String;)V

    goto :goto_4
.end method

.method newPendingTableCharacters()V
    .registers 2

    .prologue
    .line 539
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 540
    return-void
.end method

.method onStack(Lorg/jsoup/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 276
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-direct {p0, v0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isElementInQueue(Lorg/jsoup/helper/DescendableLinkedList;Lorg/jsoup/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method originalState()Lorg/jsoup/parser/HtmlTreeBuilderState;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState:Lorg/jsoup/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    .line 53
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilderState;->Initial:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 55
    invoke-super {p0, p1, p2, p3}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Ljava/util/List;
    .registers 15
    .param p1, "inputFragment"    # Ljava/lang/String;
    .param p2, "context"    # Lorg/jsoup/nodes/Element;
    .param p3, "baseUri"    # Ljava/lang/String;
    .param p4, "errors"    # Lorg/jsoup/parser/ParseErrorList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/jsoup/nodes/Element;",
            "Ljava/lang/String;",
            "Lorg/jsoup/parser/ParseErrorList;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 60
    sget-object v5, Lorg/jsoup/parser/HtmlTreeBuilderState;->Initial:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 61
    invoke-virtual {p0, p1, p3, p4}, Lorg/jsoup/parser/HtmlTreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 62
    iput-object p2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->contextElement:Lorg/jsoup/nodes/Element;

    .line 63
    iput-boolean v7, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 64
    const/4 v4, 0x0

    .line 66
    .local v4, "root":Lorg/jsoup/nodes/Element;
    if-eqz p2, :cond_76

    .line 67
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v5

    if-eqz v5, :cond_24

    .line 68
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jsoup/nodes/Document;->quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Document;->quirksMode(Lorg/jsoup/nodes/Document$QuirksMode;)Lorg/jsoup/nodes/Document;

    .line 71
    :cond_24
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, "contextTag":Ljava/lang/String;
    new-array v5, v9, [Ljava/lang/String;

    const-string v6, "title"

    aput-object v6, v5, v8

    const-string v6, "textarea"

    aput-object v6, v5, v7

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 73
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->Rcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 85
    :goto_3f
    new-instance v4, Lorg/jsoup/nodes/Element;

    .end local v4    # "root":Lorg/jsoup/nodes/Element;
    const-string v5, "html"

    invoke-static {v5}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v5

    invoke-direct {v4, v5, p3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 86
    .restart local v4    # "root":Lorg/jsoup/nodes/Element;
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v5, v4}, Lorg/jsoup/nodes/Document;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 87
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5, v4}, Lorg/jsoup/helper/DescendableLinkedList;->push(Ljava/lang/Object;)V

    .line 88
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->resetInsertionMode()V

    .line 92
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parents()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 93
    .local v0, "contextChain":Lorg/jsoup/select/Elements;
    invoke-virtual {v0, v8, p2}, Lorg/jsoup/select/Elements;->add(ILorg/jsoup/nodes/Element;)V

    .line 94
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_62
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_76

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 95
    .local v3, "parent":Lorg/jsoup/nodes/Element;
    instance-of v5, v3, Lorg/jsoup/nodes/FormElement;

    if-eqz v5, :cond_62

    .line 96
    check-cast v3, Lorg/jsoup/nodes/FormElement;

    .end local v3    # "parent":Lorg/jsoup/nodes/Element;
    iput-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    .line 102
    .end local v0    # "contextChain":Lorg/jsoup/select/Elements;
    .end local v1    # "contextTag":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_76
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->runParser()V

    .line 103
    if-eqz p2, :cond_e2

    .line 104
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v5

    .line 106
    :goto_7f
    return-object v5

    .line 74
    .restart local v1    # "contextTag":Ljava/lang/String;
    :cond_80
    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "iframe"

    aput-object v6, v5, v8

    const-string v6, "noembed"

    aput-object v6, v5, v7

    const-string v6, "noframes"

    aput-object v6, v5, v9

    const/4 v6, 0x3

    const-string v7, "style"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "xmp"

    aput-object v7, v5, v6

    invoke-static {v1, v5}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a7

    .line 75
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->Rawtext:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_3f

    .line 76
    :cond_a7
    const-string v5, "script"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b7

    .line 77
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->ScriptData:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_3f

    .line 78
    :cond_b7
    const-string v5, "noscript"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c8

    .line 79
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 80
    :cond_c8
    const-string v5, "plaintext"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d9

    .line 81
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 83
    :cond_d9
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v6, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v5, v6}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 106
    .end local v1    # "contextTag":Ljava/lang/String;
    :cond_e2
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v5}, Lorg/jsoup/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v5

    goto :goto_7f
.end method

.method pop()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 260
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0}, Lorg/jsoup/helper/DescendableLinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "td"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {v0}, Lorg/jsoup/parser/HtmlTreeBuilderState;->name()Ljava/lang/String;

    move-result-object v0

    const-string v1, "InCell"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    .line 261
    const-string v0, "pop td not in cell"

    invoke-static {v2, v0}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 262
    :cond_28
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0}, Lorg/jsoup/helper/DescendableLinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "html"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 263
    const-string v0, "popping html!"

    invoke-static {v2, v0}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 264
    :cond_41
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0}, Lorg/jsoup/helper/DescendableLinkedList;->pollLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method popStackToBefore(Ljava/lang/String;)V
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 340
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 341
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 342
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 343
    .local v1, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 349
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_1c
    return-void

    .line 346
    .restart local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6
.end method

.method popStackToClose(Ljava/lang/String;)V
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 314
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 315
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 316
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 317
    .local v1, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 318
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 324
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_1f
    return-void

    .line 321
    .restart local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_20
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6
.end method

.method varargs popStackToClose([Ljava/lang/String;)V
    .registers 5
    .param p1, "elNames"    # [Ljava/lang/String;

    .prologue
    .line 327
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 328
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 329
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 330
    .local v1, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 331
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 337
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_1f
    return-void

    .line 334
    .restart local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_20
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_6
.end method

.method protected process(Lorg/jsoup/parser/Token;)Z
    .registers 3
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    .line 112
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, p1, p0}, Lorg/jsoup/parser/HtmlTreeBuilderState;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method

.method process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilderState;)Z
    .registers 4
    .param p1, "token"    # Lorg/jsoup/parser/Token;
    .param p2, "state"    # Lorg/jsoup/parser/HtmlTreeBuilderState;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    .line 117
    invoke-virtual {p2, p1, p0}, Lorg/jsoup/parser/HtmlTreeBuilderState;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method

.method push(Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 268
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v0, p1}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 269
    return-void
.end method

.method pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p1, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 578
    const/4 v2, 0x0

    .line 579
    .local v2, "numSeen":I
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v3}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v1

    .line 580
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 581
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 582
    .local v0, "el":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_1b

    .line 593
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_15
    :goto_15
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v3, p1}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 594
    return-void

    .line 585
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_1b
    invoke-direct {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSameFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 586
    add-int/lit8 v2, v2, 0x1

    .line 588
    :cond_23
    const/4 v3, 0x3

    if-ne v2, v3, :cond_7

    .line 589
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_15
.end method

.method reconstructFormattingElements()V
    .registers 8

    .prologue
    .line 605
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5}, Lorg/jsoup/helper/DescendableLinkedList;->size()I

    move-result v3

    .line 606
    .local v3, "size":I
    if-eqz v3, :cond_1e

    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5}, Lorg/jsoup/helper/DescendableLinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1e

    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5}, Lorg/jsoup/helper/DescendableLinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    invoke-virtual {p0, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 640
    :cond_1e
    :goto_1e
    return-void

    .line 609
    :cond_1f
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5}, Lorg/jsoup/helper/DescendableLinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 610
    .local v0, "entry":Lorg/jsoup/nodes/Element;
    add-int/lit8 v2, v3, -0x1

    .line 611
    .local v2, "pos":I
    const/4 v4, 0x0

    .line 613
    .local v4, "skip":Z
    :cond_2a
    if-nez v2, :cond_61

    .line 614
    const/4 v4, 0x1

    .line 622
    :cond_2d
    :goto_2d
    if-nez v4, :cond_39

    .line 623
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v5, v2}, Lorg/jsoup/helper/DescendableLinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "entry":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 624
    .restart local v0    # "entry":Lorg/jsoup/nodes/Element;
    :cond_39
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 627
    const/4 v4, 0x0

    .line 628
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 630
    .local v1, "newEl":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v5

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 633
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v5, v2, v1}, Lorg/jsoup/helper/DescendableLinkedList;->add(ILjava/lang/Object;)V

    .line 634
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6}, Lorg/jsoup/helper/DescendableLinkedList;->remove(I)Ljava/lang/Object;

    .line 637
    add-int/lit8 v5, v3, -0x1

    if-ne v2, v5, :cond_2d

    goto :goto_1e

    .line 617
    .end local v1    # "newEl":Lorg/jsoup/nodes/Element;
    :cond_61
    iget-object v5, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v5, v2}, Lorg/jsoup/helper/DescendableLinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "entry":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 618
    .restart local v0    # "entry":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_2d

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v5

    if-eqz v5, :cond_2a

    goto :goto_2d
.end method

.method removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V
    .registers 5
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 652
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 653
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 654
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 655
    .local v1, "next":Lorg/jsoup/nodes/Element;
    if-ne v1, p1, :cond_6

    .line 656
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 660
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :cond_17
    return-void
.end method

.method removeFromStack(Lorg/jsoup/nodes/Element;)Z
    .registers 5
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 302
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 303
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 304
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 305
    .local v1, "next":Lorg/jsoup/nodes/Element;
    if-ne v1, p1, :cond_6

    .line 306
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 307
    const/4 v2, 0x1

    .line 310
    .end local v1    # "next":Lorg/jsoup/nodes/Element;
    :goto_18
    return v2

    :cond_19
    const/4 v2, 0x0

    goto :goto_18
.end method

.method replaceActiveFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 679
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-direct {p0, v0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/LinkedList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 680
    return-void
.end method

.method replaceOnStack(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 393
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-direct {p0, v0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/LinkedList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 394
    return-void
.end method

.method resetInsertionMode()V
    .registers 6

    .prologue
    .line 404
    const/4 v1, 0x0

    .line 405
    .local v1, "last":Z
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v4}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 406
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 407
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 408
    .local v3, "node":Lorg/jsoup/nodes/Element;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1c

    .line 409
    const/4 v1, 0x1

    .line 410
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->contextElement:Lorg/jsoup/nodes/Element;

    .line 412
    :cond_1c
    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    .line 413
    .local v2, "name":Ljava/lang/String;
    const-string v4, "select"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 414
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InSelect:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 451
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "node":Lorg/jsoup/nodes/Element;
    :cond_2d
    :goto_2d
    return-void

    .line 416
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "node":Lorg/jsoup/nodes/Element;
    :cond_2e
    const-string v4, "td"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_40

    const-string v4, "td"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_46

    if-nez v1, :cond_46

    .line 417
    :cond_40
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 419
    :cond_46
    const-string v4, "tr"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_54

    .line 420
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 422
    :cond_54
    const-string v4, "tbody"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6c

    const-string v4, "thead"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6c

    const-string v4, "tfoot"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_72

    .line 423
    :cond_6c
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 425
    :cond_72
    const-string v4, "caption"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_80

    .line 426
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 428
    :cond_80
    const-string v4, "colgroup"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8e

    .line 429
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InColumnGroup:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 431
    :cond_8e
    const-string v4, "table"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9c

    .line 432
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 434
    :cond_9c
    const-string v4, "head"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_aa

    .line 435
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_2d

    .line 437
    :cond_aa
    const-string v4, "body"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b9

    .line 438
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_2d

    .line 440
    :cond_b9
    const-string v4, "frameset"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c8

    .line 441
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_2d

    .line 443
    :cond_c8
    const-string v4, "html"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d7

    .line 444
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->BeforeHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_2d

    .line 446
    :cond_d7
    if-eqz v1, :cond_7

    .line 447
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_2d
.end method

.method setFormElement(Lorg/jsoup/nodes/FormElement;)V
    .registers 2
    .param p1, "formElement"    # Lorg/jsoup/nodes/FormElement;

    .prologue
    .line 535
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    .line 536
    return-void
.end method

.method setFosterInserts(Z)V
    .registers 2
    .param p1, "fosterInserts"    # Z

    .prologue
    .line 527
    iput-boolean p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 528
    return-void
.end method

.method setHeadElement(Lorg/jsoup/nodes/Element;)V
    .registers 2
    .param p1, "headElement"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 515
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->headElement:Lorg/jsoup/nodes/Element;

    .line 516
    return-void
.end method

.method setPendingTableCharacters(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/parser/Token$Character;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 547
    .local p1, "pendingTableCharacters":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/parser/Token$Character;>;"
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 548
    return-void
.end method

.method state()Lorg/jsoup/parser/HtmlTreeBuilderState;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 710
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TreeBuilder{currentToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", currentElement="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V
    .registers 2
    .param p1, "state"    # Lorg/jsoup/parser/HtmlTreeBuilderState;

    .prologue
    .line 121
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 122
    return-void
.end method
