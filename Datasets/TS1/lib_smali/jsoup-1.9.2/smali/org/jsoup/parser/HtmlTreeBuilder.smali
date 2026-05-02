.class public Lorg/jsoup/parser/HtmlTreeBuilder;
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

.field public static final TagsSearchInScope:[Ljava/lang/String;


# instance fields
.field private baseUriSetFromDoc:Z

.field private contextElement:Lorg/jsoup/nodes/Element;

.field private emptyEnd:Lorg/jsoup/parser/Token$EndTag;

.field private formElement:Lorg/jsoup/nodes/FormElement;

.field private formattingElements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
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
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private specificScopeTarget:[Ljava/lang/String;

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

    .line 14
    const-class v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_262

    move v0, v1

    :goto_e
    sput-boolean v0, Lorg/jsoup/parser/HtmlTreeBuilder;->$assertionsDisabled:Z

    .line 16
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

    .line 17
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "ol"

    aput-object v3, v0, v2

    const-string v3, "ul"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    .line 18
    new-array v0, v1, [Ljava/lang/String;

    const-string v3, "button"

    aput-object v3, v0, v2

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    .line 19
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "html"

    aput-object v3, v0, v2

    const-string v3, "table"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    .line 20
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "optgroup"

    aput-object v3, v0, v2

    const-string v3, "option"

    aput-object v3, v0, v1

    sput-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    .line 21
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

    .line 22
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

    :cond_262
    move v0, v2

    .line 14
    goto/16 :goto_e
.end method

.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 46
    invoke-direct {p0}, Lorg/jsoup/parser/TreeBuilder;-><init>()V

    .line 34
    iput-boolean v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 40
    new-instance v0, Lorg/jsoup/parser/Token$EndTag;

    invoke-direct {v0}, Lorg/jsoup/parser/Token$EndTag;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->emptyEnd:Lorg/jsoup/parser/Token$EndTag;

    .line 42
    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 43
    iput-boolean v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 44
    iput-boolean v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 431
    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v1, v0, v2

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

    .line 46
    return-void
.end method

.method private varargs clearStackToContext([Ljava/lang/String;)V
    .registers 6
    .param p1, "nodeNames"    # [Ljava/lang/String;

    .prologue
    .line 345
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_28

    .line 346
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 347
    .local v0, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "html"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 352
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_28
    return-void

    .line 350
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_29
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 345
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method private inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 6
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "baseTypes"    # [Ljava/lang/String;
    .param p3, "extraTypes"    # [Ljava/lang/String;

    .prologue
    .line 434
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 435
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->specificScopeTarget:[Ljava/lang/String;

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

    .line 439
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .local v2, "pos":I
    :goto_9
    if-ltz v2, :cond_30

    .line 440
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 441
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    .line 442
    .local v1, "elName":Ljava/lang/String;
    invoke-static {v1, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 443
    const/4 v3, 0x1

    .line 450
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_1e
    :goto_1e
    return v3

    .line 444
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    .restart local v1    # "elName":Ljava/lang/String;
    :cond_1f
    invoke-static {v1, p2}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 446
    if-eqz p3, :cond_2d

    invoke-static {v1, p3}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1e

    .line 439
    :cond_2d
    add-int/lit8 v2, v2, -0x1

    goto :goto_9

    .line 449
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_30
    const-string v4, "Should not be reachable"

    invoke-static {v4}, Lorg/jsoup/helper/Validate;->fail(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method private insertNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 241
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2a

    .line 242
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Document;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 249
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

    .line 250
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    if-eqz v0, :cond_29

    .line 251
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    check-cast p1, Lorg/jsoup/nodes/Element;

    .end local p1    # "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/FormElement;->addElement(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/FormElement;

    .line 253
    :cond_29
    return-void

    .line 243
    .restart local p1    # "node":Lorg/jsoup/nodes/Node;
    :cond_2a
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->isFosterInserts()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 244
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertInFosterParent(Lorg/jsoup/nodes/Node;)V

    goto :goto_d

    .line 246
    :cond_34
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto :goto_d
.end method

.method private isElementInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;)Z
    .registers 6
    .param p2, "element"    # Lorg/jsoup/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;",
            "Lorg/jsoup/nodes/Element;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 273
    .local p1, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_6
    if-ltz v1, :cond_15

    .line 274
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 275
    .local v0, "next":Lorg/jsoup/nodes/Element;
    if-ne v0, p2, :cond_12

    .line 276
    const/4 v2, 0x1

    .line 279
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :goto_11
    return v2

    .line 273
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_12
    add-int/lit8 v1, v1, -0x1

    goto :goto_6

    .line 279
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_15
    const/4 v2, 0x0

    goto :goto_11
.end method

.method private isSameFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 5
    .param p1, "a"    # Lorg/jsoup/nodes/Element;
    .param p2, "b"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 587
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 589
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

.method private replaceInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p2, "out"    # Lorg/jsoup/nodes/Element;
    .param p3, "in"    # Lorg/jsoup/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;",
            "Lorg/jsoup/nodes/Element;",
            "Lorg/jsoup/nodes/Element;",
            ")V"
        }
    .end annotation

    .prologue
    .line 376
    .local p1, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 377
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    const/4 v1, 0x1

    :goto_8
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 378
    invoke-virtual {p1, v0, p3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 379
    return-void

    .line 377
    :cond_f
    const/4 v1, 0x0

    goto :goto_8
.end method


# virtual methods
.method aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;
    .registers 6
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 355
    sget-boolean v2, Lorg/jsoup/parser/HtmlTreeBuilder;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v2

    if-nez v2, :cond_10

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 356
    :cond_10
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_18
    if-ltz v1, :cond_32

    .line 357
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 358
    .local v0, "next":Lorg/jsoup/nodes/Element;
    if-ne v0, p1, :cond_2f

    .line 359
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 362
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :goto_2e
    return-object v2

    .line 356
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_2f
    add-int/lit8 v1, v1, -0x1

    goto :goto_18

    .line 362
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_32
    const/4 v2, 0x0

    goto :goto_2e
.end method

.method clearFormattingElementsToLastMarker()V
    .registers 3

    .prologue
    .line 632
    :cond_0
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e

    .line 633
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->removeLastFormattingElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 634
    .local v0, "el":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_0

    .line 637
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_e
    return-void
.end method

.method clearStackToTableBodyContext()V
    .registers 4

    .prologue
    .line 337
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

    .line 338
    return-void
.end method

.method clearStackToTableContext()V
    .registers 4

    .prologue
    .line 333
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "table"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method clearStackToTableRowContext()V
    .registers 4

    .prologue
    .line 341
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "tr"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->clearStackToContext([Ljava/lang/String;)V

    .line 342
    return-void
.end method

.method error(Lorg/jsoup/parser/HtmlTreeBuilderState;)V
    .registers 9
    .param p1, "state"    # Lorg/jsoup/parser/HtmlTreeBuilderState;

    .prologue
    .line 166
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0}, Lorg/jsoup/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 167
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

    .line 168
    :cond_29
    return-void
.end method

.method framesetOk(Z)V
    .registers 2
    .param p1, "framesetOk"    # Z

    .prologue
    .line 134
    iput-boolean p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    .line 135
    return-void
.end method

.method framesetOk()Z
    .registers 2

    .prologue
    .line 138
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->framesetOk:Z

    return v0
.end method

.method generateImpliedEndTags()V
    .registers 2

    .prologue
    .line 544
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->generateImpliedEndTags(Ljava/lang/String;)V

    .line 545
    return-void
.end method

.method generateImpliedEndTags(Ljava/lang/String;)V
    .registers 4
    .param p1, "excludeTag"    # Ljava/lang/String;

    .prologue
    .line 538
    :goto_0
    if-eqz p1, :cond_24

    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    .line 539
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchEndTags:[Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 540
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->pop()Lorg/jsoup/nodes/Element;

    goto :goto_0

    .line 541
    :cond_24
    return-void
.end method

.method getActiveFormattingElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "nodeName"    # Ljava/lang/String;

    .prologue
    .line 654
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_14

    .line 655
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 656
    .local v0, "next":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_16

    .line 661
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_14
    const/4 v0, 0x0

    :cond_15
    return-object v0

    .line 658
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_16
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 654
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method getBaseUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    return-object v0
.end method

.method getDocument()Lorg/jsoup/nodes/Document;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    return-object v0
.end method

.method getFormElement()Lorg/jsoup/nodes/FormElement;
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    return-object v0
.end method

.method getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 283
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_20

    .line 284
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 285
    .local v0, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 289
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :goto_1c
    return-object v0

    .line 283
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1d
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 289
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_20
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method getHeadElement()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 497
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
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 521
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    return-object v0
.end method

.method getStack()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    return-object v0
.end method

.method inButtonScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 472
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchButton:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inListItemScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 468
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchList:[Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->inScope(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope(Ljava/lang/String;)Z
    .registers 3
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 458
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
    .line 462
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagsSearchInScope:[Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method inScope([Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetNames"    # [Ljava/lang/String;

    .prologue
    .line 454
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

    .line 480
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .local v2, "pos":I
    :goto_9
    if-ltz v2, :cond_2a

    .line 481
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 482
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    .line 483
    .local v1, "elName":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 484
    const/4 v3, 0x1

    .line 489
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_1e
    :goto_1e
    return v3

    .line 485
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    .restart local v1    # "elName":Ljava/lang/String;
    :cond_1f
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSelectScope:[Ljava/lang/String;

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 480
    add-int/lit8 v2, v2, -0x1

    goto :goto_9

    .line 488
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .end local v1    # "elName":Ljava/lang/String;
    :cond_2a
    const-string v4, "Should not be reachable"

    invoke-static {v4}, Lorg/jsoup/helper/Validate;->fail(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method inTableScope(Ljava/lang/String;)Z
    .registers 4
    .param p1, "targetName"    # Ljava/lang/String;

    .prologue
    .line 476
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchTableScope:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->inSpecificScope(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 7
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 173
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 174
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 175
    .local v0, "el":Lorg/jsoup/nodes/Element;
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v3, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 177
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->emptyEnd:Lorg/jsoup/parser/Token$EndTag;

    invoke-virtual {v3}, Lorg/jsoup/parser/Token$EndTag;->reset()Lorg/jsoup/parser/Token$Tag;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Token$Tag;->name(Ljava/lang/String;)Lorg/jsoup/parser/Token$Tag;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jsoup/parser/Tokeniser;->emit(Lorg/jsoup/parser/Token;)V

    move-object v1, v0

    .line 183
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    .local v1, "el":Ljava/lang/Object;
    :goto_2a
    return-object v1

    .line 181
    .end local v1    # "el":Ljava/lang/Object;
    :cond_2b
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v2

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v4, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v2, v3, v4}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 182
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/nodes/Element;)V

    move-object v1, v0

    .line 183
    .restart local v1    # "el":Ljava/lang/Object;
    goto :goto_2a
.end method

.method insert(Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 193
    invoke-direct {p0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 194
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Character;)V
    .registers 6
    .param p1, "characterToken"    # Lorg/jsoup/parser/Token$Character;

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "tagName":Ljava/lang/String;
    const-string v2, "script"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_18

    const-string v2, "style"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 233
    :cond_18
    new-instance v0, Lorg/jsoup/nodes/DataNode;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v2, v3}, Lorg/jsoup/nodes/DataNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .local v0, "node":Lorg/jsoup/nodes/Node;
    :goto_23
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 237
    return-void

    .line 235
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
    .line 224
    new-instance v0, Lorg/jsoup/nodes/Comment;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Comment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .local v0, "comment":Lorg/jsoup/nodes/Comment;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 226
    return-void
.end method

.method insertEmpty(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 198
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 199
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/Element;

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 200
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 201
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 202
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isKnownTag()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 203
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 210
    :cond_2b
    :goto_2b
    return-object v0

    .line 206
    :cond_2c
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->setSelfClosing()Lorg/jsoup/parser/Tag;

    .line 207
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    goto :goto_2b
.end method

.method insertForm(Lorg/jsoup/parser/Token$StartTag;Z)Lorg/jsoup/nodes/FormElement;
    .registers 7
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;
    .param p2, "onStack"    # Z

    .prologue
    .line 214
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 215
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/FormElement;

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/FormElement;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 216
    .local v0, "el":Lorg/jsoup/nodes/FormElement;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->setFormElement(Lorg/jsoup/nodes/FormElement;)V

    .line 217
    invoke-direct {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 218
    if-eqz p2, :cond_1e

    .line 219
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_1e
    return-object v0
.end method

.method insertInFosterParent(Lorg/jsoup/nodes/Node;)V
    .registers 7
    .param p1, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 674
    const-string v3, "table"

    invoke-virtual {p0, v3}, Lorg/jsoup/parser/HtmlTreeBuilder;->getFromStack(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 675
    .local v2, "lastTable":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x0

    .line 676
    .local v1, "isLastTableParent":Z
    if-eqz v2, :cond_22

    .line 677
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-eqz v3, :cond_1d

    .line 678
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 679
    .local v0, "fosterParent":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x1

    .line 686
    :goto_14
    if-eqz v1, :cond_2c

    .line 687
    invoke-static {v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 688
    invoke-virtual {v2, p1}, Lorg/jsoup/nodes/Element;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 692
    :goto_1c
    return-void

    .line 681
    .end local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    :cond_1d
    invoke-virtual {p0, v2}, Lorg/jsoup/parser/HtmlTreeBuilder;->aboveOnStack(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .restart local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    goto :goto_14

    .line 683
    .end local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    :cond_22
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .restart local v0    # "fosterParent":Lorg/jsoup/nodes/Element;
    goto :goto_14

    .line 691
    :cond_2c
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto :goto_1c
.end method

.method insertMarkerToFormattingElements()V
    .registers 3

    .prologue
    .line 669
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 670
    return-void
.end method

.method insertOnStackAfter(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p1, "after"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 366
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    .line 367
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_15

    const/4 v1, 0x1

    :goto_a
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 368
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 369
    return-void

    .line 367
    :cond_15
    const/4 v1, 0x0

    goto :goto_a
.end method

.method insertStartTag(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "startTagName"    # Ljava/lang/String;

    .prologue
    .line 187
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 188
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->insert(Lorg/jsoup/nodes/Element;)V

    .line 189
    return-object v0
.end method

.method isFosterInserts()Z
    .registers 2

    .prologue
    .line 501
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    return v0
.end method

.method isFragmentParsing()Z
    .registers 2

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    return v0
.end method

.method isInActiveFormattingElements(Lorg/jsoup/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 650
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isElementInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method isSpecial(Lorg/jsoup/nodes/Element;)Z
    .registers 4
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 550
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v0

    .line 551
    .local v0, "name":Ljava/lang/String;
    sget-object v1, Lorg/jsoup/parser/HtmlTreeBuilder;->TagSearchSpecial:[Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method lastFormattingElement()Lorg/jsoup/nodes/Element;
    .registers 3

    .prologue
    .line 555
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_19

    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    :goto_18
    return-object v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method markInsertionMode()V
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 127
    return-void
.end method

.method maybeSetBaseUri(Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "base"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 150
    iget-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    if-eqz v1, :cond_5

    .line 159
    :cond_4
    :goto_4
    return-void

    .line 153
    :cond_5
    const-string v1, "href"

    invoke-virtual {p1, v1}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "href":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 155
    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUri:Ljava/lang/String;

    .line 156
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 157
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Document;->setBaseUri(Ljava/lang/String;)V

    goto :goto_4
.end method

.method newPendingTableCharacters()V
    .registers 2

    .prologue
    .line 517
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 518
    return-void
.end method

.method onStack(Lorg/jsoup/nodes/Element;)Z
    .registers 3
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 269
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1}, Lorg/jsoup/parser/HtmlTreeBuilder;->isElementInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;)Z

    move-result v0

    return v0
.end method

.method originalState()Lorg/jsoup/parser/HtmlTreeBuilderState;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->originalState:Lorg/jsoup/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    .line 50
    sget-object v0, Lorg/jsoup/parser/HtmlTreeBuilderState;->Initial:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->baseUriSetFromDoc:Z

    .line 52
    invoke-super {p0, p1, p2, p3}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Ljava/util/List;
    .registers 14
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
    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 57
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->Initial:Lorg/jsoup/parser/HtmlTreeBuilderState;

    iput-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 58
    invoke-virtual {p0, p1, p3, p4}, Lorg/jsoup/parser/HtmlTreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 59
    iput-object p2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->contextElement:Lorg/jsoup/nodes/Element;

    .line 60
    iput-boolean v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fragmentParsing:Z

    .line 61
    const/4 v3, 0x0

    .line 63
    .local v3, "root":Lorg/jsoup/nodes/Element;
    if-eqz p2, :cond_76

    .line 64
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v4

    if-eqz v4, :cond_24

    .line 65
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jsoup/nodes/Document;->quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Document;->quirksMode(Lorg/jsoup/nodes/Document$QuirksMode;)Lorg/jsoup/nodes/Document;

    .line 68
    :cond_24
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "contextTag":Ljava/lang/String;
    new-array v4, v8, [Ljava/lang/String;

    const-string v5, "title"

    aput-object v5, v4, v7

    const-string v5, "textarea"

    aput-object v5, v4, v6

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_82

    .line 70
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->Rcdata:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    .line 82
    :goto_3f
    new-instance v3, Lorg/jsoup/nodes/Element;

    .end local v3    # "root":Lorg/jsoup/nodes/Element;
    const-string v4, "html"

    invoke-static {v4}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v4

    invoke-direct {v3, v4, p3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 83
    .restart local v3    # "root":Lorg/jsoup/nodes/Element;
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Document;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 84
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->resetInsertionMode()V

    .line 89
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parents()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 90
    .local v0, "contextChain":Lorg/jsoup/select/Elements;
    invoke-virtual {v0, v7, p2}, Lorg/jsoup/select/Elements;->add(ILjava/lang/Object;)V

    .line 91
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_62
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_76

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 92
    .local v2, "parent":Lorg/jsoup/nodes/Element;
    instance-of v5, v2, Lorg/jsoup/nodes/FormElement;

    if-eqz v5, :cond_62

    .line 93
    check-cast v2, Lorg/jsoup/nodes/FormElement;

    .end local v2    # "parent":Lorg/jsoup/nodes/Element;
    iput-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    .line 99
    .end local v0    # "contextChain":Lorg/jsoup/select/Elements;
    .end local v1    # "contextTag":Ljava/lang/String;
    :cond_76
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->runParser()V

    .line 100
    if-eqz p2, :cond_e4

    if-eqz v3, :cond_e4

    .line 101
    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v4

    .line 103
    :goto_81
    return-object v4

    .line 71
    .restart local v1    # "contextTag":Ljava/lang/String;
    :cond_82
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "iframe"

    aput-object v5, v4, v7

    const-string v5, "noembed"

    aput-object v5, v4, v6

    const-string v5, "noframes"

    aput-object v5, v4, v8

    const/4 v5, 0x3

    const-string v6, "style"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "xmp"

    aput-object v6, v4, v5

    invoke-static {v1, v4}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a9

    .line 72
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->Rawtext:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_3f

    .line 73
    :cond_a9
    const-string v4, "script"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b9

    .line 74
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->ScriptData:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto :goto_3f

    .line 75
    :cond_b9
    const-string v4, "noscript"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ca

    .line 76
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 77
    :cond_ca
    const-string v4, "plaintext"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_db

    .line 78
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 80
    :cond_db
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    sget-object v5, Lorg/jsoup/parser/TokeniserState;->Data:Lorg/jsoup/parser/TokeniserState;

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tokeniser;->transition(Lorg/jsoup/parser/TokeniserState;)V

    goto/16 :goto_3f

    .line 103
    .end local v1    # "contextTag":Ljava/lang/String;
    :cond_e4
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v4

    goto :goto_81
.end method

.method pop()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 256
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 257
    .local v0, "size":I
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    return-object v1
.end method

.method popStackToBefore(Ljava/lang/String;)V
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 322
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_1c

    .line 323
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 324
    .local v0, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 330
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1c
    return-void

    .line 327
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1d
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 322
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method popStackToClose(Ljava/lang/String;)V
    .registers 5
    .param p1, "elName"    # Ljava/lang/String;

    .prologue
    .line 304
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_21

    .line 305
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 306
    .local v0, "next":Lorg/jsoup/nodes/Element;
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 307
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 310
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_21
    return-void

    .line 304
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_22
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method varargs popStackToClose([Ljava/lang/String;)V
    .registers 5
    .param p1, "elNames"    # [Ljava/lang/String;

    .prologue
    .line 313
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_21

    .line 314
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 315
    .local v0, "next":Lorg/jsoup/nodes/Element;
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 316
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/jsoup/helper/StringUtil;->in(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 319
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_21
    return-void

    .line 313
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_22
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method protected process(Lorg/jsoup/parser/Token;)Z
    .registers 3
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    .line 109
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
    .line 113
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->currentToken:Lorg/jsoup/parser/Token;

    .line 114
    invoke-virtual {p2, p1, p0}, Lorg/jsoup/parser/HtmlTreeBuilderState;->process(Lorg/jsoup/parser/Token;Lorg/jsoup/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic processStartTag(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)Z
    .registers 4

    .prologue
    .line 14
    invoke-super {p0, p1, p2}, Lorg/jsoup/parser/TreeBuilder;->processStartTag(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)Z

    move-result v0

    return v0
.end method

.method push(Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 261
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    return-void
.end method

.method pushActiveFormattingElements(Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p1, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 568
    const/4 v1, 0x0

    .line 569
    .local v1, "numSeen":I
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, "pos":I
    :goto_9
    if-ltz v2, :cond_15

    .line 570
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 571
    .local v0, "el":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_1b

    .line 582
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_15
    :goto_15
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 583
    return-void

    .line 574
    .restart local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_1b
    invoke-direct {p0, p1, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->isSameFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 575
    add-int/lit8 v1, v1, 0x1

    .line 577
    :cond_23
    const/4 v3, 0x3

    if-ne v1, v3, :cond_2c

    .line 578
    iget-object v3, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_15

    .line 569
    :cond_2c
    add-int/lit8 v2, v2, -0x1

    goto :goto_9
.end method

.method reconstructFormattingElements()V
    .registers 9

    .prologue
    .line 594
    invoke-virtual {p0}, Lorg/jsoup/parser/HtmlTreeBuilder;->lastFormattingElement()Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 595
    .local v1, "last":Lorg/jsoup/nodes/Element;
    if-eqz v1, :cond_c

    invoke-virtual {p0, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 629
    :cond_c
    :goto_c
    return-void

    .line 598
    :cond_d
    move-object v0, v1

    .line 599
    .local v0, "entry":Lorg/jsoup/nodes/Element;
    iget-object v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 600
    .local v4, "size":I
    add-int/lit8 v3, v4, -0x1

    .line 601
    .local v3, "pos":I
    const/4 v5, 0x0

    .line 603
    .local v5, "skip":Z
    :cond_17
    if-nez v3, :cond_47

    .line 604
    const/4 v5, 0x1

    .line 612
    :cond_1a
    :goto_1a
    if-nez v5, :cond_26

    .line 613
    iget-object v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "entry":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 614
    .restart local v0    # "entry":Lorg/jsoup/nodes/Element;
    :cond_26
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 617
    const/4 v5, 0x0

    .line 618
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/jsoup/parser/HtmlTreeBuilder;->insertStartTag(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 620
    .local v2, "newEl":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v6

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 623
    iget-object v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v6, v3, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 626
    add-int/lit8 v6, v4, -0x1

    if-ne v3, v6, :cond_1a

    goto :goto_c

    .line 607
    .end local v2    # "newEl":Lorg/jsoup/nodes/Element;
    :cond_47
    iget-object v6, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "entry":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 608
    .restart local v0    # "entry":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_1a

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/HtmlTreeBuilder;->onStack(Lorg/jsoup/nodes/Element;)Z

    move-result v6

    if-eqz v6, :cond_17

    goto :goto_1a
.end method

.method removeFromActiveFormattingElements(Lorg/jsoup/nodes/Element;)V
    .registers 5
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 640
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_19

    .line 641
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 642
    .local v0, "next":Lorg/jsoup/nodes/Element;
    if-ne v0, p1, :cond_1a

    .line 643
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 647
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_19
    return-void

    .line 640
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1a
    add-int/lit8 v1, v1, -0x1

    goto :goto_8
.end method

.method removeFromStack(Lorg/jsoup/nodes/Element;)Z
    .registers 5
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 293
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "pos":I
    :goto_8
    if-ltz v1, :cond_1e

    .line 294
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 295
    .local v0, "next":Lorg/jsoup/nodes/Element;
    if-ne v0, p1, :cond_1b

    .line 296
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 297
    const/4 v2, 0x1

    .line 300
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :goto_1a
    return v2

    .line 293
    .restart local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1b
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 300
    .end local v0    # "next":Lorg/jsoup/nodes/Element;
    :cond_1e
    const/4 v2, 0x0

    goto :goto_1a
.end method

.method removeLastFormattingElement()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 559
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 560
    .local v0, "size":I
    if-lez v0, :cond_13

    .line 561
    iget-object v1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 563
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method replaceActiveFormattingElement(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 665
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formattingElements:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 666
    return-void
.end method

.method replaceOnStack(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Element;
    .param p2, "in"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 372
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1, p2}, Lorg/jsoup/parser/HtmlTreeBuilder;->replaceInQueue(Ljava/util/ArrayList;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)V

    .line 373
    return-void
.end method

.method resetInsertionMode()V
    .registers 6

    .prologue
    .line 382
    const/4 v0, 0x0

    .line 383
    .local v0, "last":Z
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .local v3, "pos":I
    :goto_9
    if-ltz v3, :cond_29

    .line 384
    iget-object v4, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 385
    .local v2, "node":Lorg/jsoup/nodes/Element;
    if-nez v3, :cond_18

    .line 386
    const/4 v0, 0x1

    .line 387
    iget-object v2, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->contextElement:Lorg/jsoup/nodes/Element;

    .line 389
    :cond_18
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v1

    .line 390
    .local v1, "name":Ljava/lang/String;
    const-string v4, "select"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 391
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InSelect:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    .line 428
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_29
    :goto_29
    return-void

    .line 393
    .restart local v1    # "name":Ljava/lang/String;
    .restart local v2    # "node":Lorg/jsoup/nodes/Element;
    :cond_2a
    const-string v4, "td"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3c

    const-string v4, "th"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    if-nez v0, :cond_42

    .line 394
    :cond_3c
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InCell:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 396
    :cond_42
    const-string v4, "tr"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 397
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InRow:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 399
    :cond_50
    const-string v4, "tbody"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_68

    const-string v4, "thead"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_68

    const-string v4, "tfoot"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 400
    :cond_68
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InTableBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 402
    :cond_6e
    const-string v4, "caption"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7c

    .line 403
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InCaption:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 405
    :cond_7c
    const-string v4, "colgroup"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8a

    .line 406
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InColumnGroup:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 408
    :cond_8a
    const-string v4, "table"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_98

    .line 409
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InTable:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 411
    :cond_98
    const-string v4, "head"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a6

    .line 412
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto :goto_29

    .line 414
    :cond_a6
    const-string v4, "body"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b5

    .line 415
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_29

    .line 417
    :cond_b5
    const-string v4, "frameset"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c4

    .line 418
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InFrameset:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_29

    .line 420
    :cond_c4
    const-string v4, "html"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d3

    .line 421
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->BeforeHead:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_29

    .line 423
    :cond_d3
    if-eqz v0, :cond_dc

    .line 424
    sget-object v4, Lorg/jsoup/parser/HtmlTreeBuilderState;->InBody:Lorg/jsoup/parser/HtmlTreeBuilderState;

    invoke-virtual {p0, v4}, Lorg/jsoup/parser/HtmlTreeBuilder;->transition(Lorg/jsoup/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_29

    .line 383
    :cond_dc
    add-int/lit8 v3, v3, -0x1

    goto/16 :goto_9
.end method

.method setFormElement(Lorg/jsoup/nodes/FormElement;)V
    .registers 2
    .param p1, "formElement"    # Lorg/jsoup/nodes/FormElement;

    .prologue
    .line 513
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->formElement:Lorg/jsoup/nodes/FormElement;

    .line 514
    return-void
.end method

.method setFosterInserts(Z)V
    .registers 2
    .param p1, "fosterInserts"    # Z

    .prologue
    .line 505
    iput-boolean p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->fosterInserts:Z

    .line 506
    return-void
.end method

.method setHeadElement(Lorg/jsoup/nodes/Element;)V
    .registers 2
    .param p1, "headElement"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 493
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->headElement:Lorg/jsoup/nodes/Element;

    .line 494
    return-void
.end method

.method setPendingTableCharacters(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 525
    .local p1, "pendingTableCharacters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->pendingTableCharacters:Ljava/util/List;

    .line 526
    return-void
.end method

.method state()Lorg/jsoup/parser/HtmlTreeBuilderState;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 696
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

    .line 699
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
    .line 118
    iput-object p1, p0, Lorg/jsoup/parser/HtmlTreeBuilder;->state:Lorg/jsoup/parser/HtmlTreeBuilderState;

    .line 119
    return-void
.end method
