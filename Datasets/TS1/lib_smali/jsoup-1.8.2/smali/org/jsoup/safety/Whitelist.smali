.class public Lorg/jsoup/safety/Whitelist;
.super Ljava/lang/Object;
.source "Whitelist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/safety/Whitelist$TypedValue;,
        Lorg/jsoup/safety/Whitelist$Protocol;,
        Lorg/jsoup/safety/Whitelist$AttributeValue;,
        Lorg/jsoup/safety/Whitelist$AttributeKey;,
        Lorg/jsoup/safety/Whitelist$TagName;
    }
.end annotation


# instance fields
.field private attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jsoup/safety/Whitelist$TagName;",
            "Ljava/util/Set",
            "<",
            "Lorg/jsoup/safety/Whitelist$AttributeKey;",
            ">;>;"
        }
    .end annotation
.end field

.field private enforcedAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jsoup/safety/Whitelist$TagName;",
            "Ljava/util/Map",
            "<",
            "Lorg/jsoup/safety/Whitelist$AttributeKey;",
            "Lorg/jsoup/safety/Whitelist$AttributeValue;",
            ">;>;"
        }
    .end annotation
.end field

.field private preserveRelativeLinks:Z

.field private protocols:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jsoup/safety/Whitelist$TagName;",
            "Ljava/util/Map",
            "<",
            "Lorg/jsoup/safety/Whitelist$AttributeKey;",
            "Ljava/util/Set",
            "<",
            "Lorg/jsoup/safety/Whitelist$Protocol;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private tagNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jsoup/safety/Whitelist$TagName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    .line 192
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    .line 193
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    .line 194
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    .line 195
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jsoup/safety/Whitelist;->preserveRelativeLinks:Z

    .line 196
    return-void
.end method

.method public static basic()Lorg/jsoup/safety/Whitelist;
    .registers 9

    .prologue
    const/4 v4, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 108
    new-instance v0, Lorg/jsoup/safety/Whitelist;

    invoke-direct {v0}, Lorg/jsoup/safety/Whitelist;-><init>()V

    const/16 v1, 0x18

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "a"

    aput-object v2, v1, v5

    const-string v2, "b"

    aput-object v2, v1, v6

    const-string v2, "blockquote"

    aput-object v2, v1, v7

    const-string v2, "br"

    aput-object v2, v1, v8

    const-string v2, "cite"

    aput-object v2, v1, v4

    const/4 v2, 0x5

    const-string v3, "code"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "dd"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "dl"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "dt"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "em"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "i"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "li"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "ol"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "p"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "pre"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "q"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "small"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "span"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "strike"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "strong"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "sub"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "sup"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "u"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "ul"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lorg/jsoup/safety/Whitelist;->addTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "a"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "href"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "blockquote"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "cite"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "q"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "cite"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "a"

    const-string v2, "href"

    new-array v3, v4, [Ljava/lang/String;

    const-string v4, "ftp"

    aput-object v4, v3, v5

    const-string v4, "http"

    aput-object v4, v3, v6

    const-string v4, "https"

    aput-object v4, v3, v7

    const-string v4, "mailto"

    aput-object v4, v3, v8

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "blockquote"

    const-string v2, "cite"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "cite"

    const-string v2, "cite"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "a"

    const-string v2, "rel"

    const-string v3, "nofollow"

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    return-object v0
.end method

.method public static basicWithImages()Lorg/jsoup/safety/Whitelist;
    .registers 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 134
    invoke-static {}, Lorg/jsoup/safety/Whitelist;->basic()Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "img"

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Lorg/jsoup/safety/Whitelist;->addTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "img"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "align"

    aput-object v3, v2, v5

    const-string v3, "alt"

    aput-object v3, v2, v6

    const-string v3, "height"

    aput-object v3, v2, v7

    const/4 v3, 0x3

    const-string v4, "src"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "width"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "img"

    const-string v2, "src"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    return-object v0
.end method

.method private isValidAnchor(Ljava/lang/String;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 544
    const-string v0, "#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, ".*\\s.*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static none()Lorg/jsoup/safety/Whitelist;
    .registers 1

    .prologue
    .line 77
    new-instance v0, Lorg/jsoup/safety/Whitelist;

    invoke-direct {v0}, Lorg/jsoup/safety/Whitelist;-><init>()V

    return-object v0
.end method

.method public static relaxed()Lorg/jsoup/safety/Whitelist;
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 152
    new-instance v0, Lorg/jsoup/safety/Whitelist;

    invoke-direct {v0}, Lorg/jsoup/safety/Whitelist;-><init>()V

    const/16 v1, 0x2a

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "a"

    aput-object v2, v1, v5

    const-string v2, "b"

    aput-object v2, v1, v6

    const-string v2, "blockquote"

    aput-object v2, v1, v7

    const-string v2, "br"

    aput-object v2, v1, v8

    const-string v2, "caption"

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, "cite"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "code"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "col"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "colgroup"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "dd"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "div"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "dl"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "dt"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "em"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "h1"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "h2"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "h3"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "h4"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "h5"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "h6"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "i"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "img"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "li"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "ol"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "p"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "pre"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string v3, "q"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "small"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "span"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "strike"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string v3, "strong"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "sub"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "sup"

    aput-object v3, v1, v2

    const/16 v2, 0x21

    const-string v3, "table"

    aput-object v3, v1, v2

    const/16 v2, 0x22

    const-string v3, "tbody"

    aput-object v3, v1, v2

    const/16 v2, 0x23

    const-string v3, "td"

    aput-object v3, v1, v2

    const/16 v2, 0x24

    const-string v3, "tfoot"

    aput-object v3, v1, v2

    const/16 v2, 0x25

    const-string v3, "th"

    aput-object v3, v1, v2

    const/16 v2, 0x26

    const-string v3, "thead"

    aput-object v3, v1, v2

    const/16 v2, 0x27

    const-string v3, "tr"

    aput-object v3, v1, v2

    const/16 v2, 0x28

    const-string v3, "u"

    aput-object v3, v1, v2

    const/16 v2, 0x29

    const-string v3, "ul"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lorg/jsoup/safety/Whitelist;->addTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "a"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "href"

    aput-object v3, v2, v5

    const-string v3, "title"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "blockquote"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "cite"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "col"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "span"

    aput-object v3, v2, v5

    const-string v3, "width"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "colgroup"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "span"

    aput-object v3, v2, v5

    const-string v3, "width"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "img"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "align"

    aput-object v3, v2, v5

    const-string v3, "alt"

    aput-object v3, v2, v6

    const-string v3, "height"

    aput-object v3, v2, v7

    const-string v3, "src"

    aput-object v3, v2, v8

    const-string v3, "title"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "width"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "ol"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "start"

    aput-object v3, v2, v5

    const-string v3, "type"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "q"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "cite"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "table"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "summary"

    aput-object v3, v2, v5

    const-string v3, "width"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "td"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "abbr"

    aput-object v3, v2, v5

    const-string v3, "axis"

    aput-object v3, v2, v6

    const-string v3, "colspan"

    aput-object v3, v2, v7

    const-string v3, "rowspan"

    aput-object v3, v2, v8

    const-string v3, "width"

    aput-object v3, v2, v9

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "th"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "abbr"

    aput-object v3, v2, v5

    const-string v3, "axis"

    aput-object v3, v2, v6

    const-string v3, "colspan"

    aput-object v3, v2, v7

    const-string v3, "rowspan"

    aput-object v3, v2, v8

    const-string v3, "scope"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "width"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "ul"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "type"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/safety/Whitelist;->addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "a"

    const-string v2, "href"

    new-array v3, v9, [Ljava/lang/String;

    const-string v4, "ftp"

    aput-object v4, v3, v5

    const-string v4, "http"

    aput-object v4, v3, v6

    const-string v4, "https"

    aput-object v4, v3, v7

    const-string v4, "mailto"

    aput-object v4, v3, v8

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "blockquote"

    const-string v2, "cite"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "cite"

    const-string v2, "cite"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "img"

    const-string v2, "src"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    const-string v1, "q"

    const-string v2, "cite"

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "http"

    aput-object v4, v3, v5

    const-string v4, "https"

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lorg/jsoup/safety/Whitelist;->addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    return-object v0
.end method

.method public static simpleText()Lorg/jsoup/safety/Whitelist;
    .registers 4

    .prologue
    .line 87
    new-instance v0, Lorg/jsoup/safety/Whitelist;

    invoke-direct {v0}, Lorg/jsoup/safety/Whitelist;-><init>()V

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "b"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "em"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "i"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "strong"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "u"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lorg/jsoup/safety/Whitelist;->addTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;

    move-result-object v0

    return-object v0
.end method

.method private testValidProtocol(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Attribute;Ljava/util/Set;)Z
    .registers 11
    .param p1, "el"    # Lorg/jsoup/nodes/Element;
    .param p2, "attr"    # Lorg/jsoup/nodes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/nodes/Element;",
            "Lorg/jsoup/nodes/Attribute;",
            "Ljava/util/Set",
            "<",
            "Lorg/jsoup/safety/Whitelist$Protocol;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p3, "protocols":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    const/4 v4, 0x1

    .line 517
    invoke-virtual {p2}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 518
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_13

    .line 519
    invoke-virtual {p2}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 520
    :cond_13
    iget-boolean v5, p0, Lorg/jsoup/safety/Whitelist;->preserveRelativeLinks:Z

    if-nez v5, :cond_1a

    .line 521
    invoke-virtual {p2, v3}, Lorg/jsoup/nodes/Attribute;->setValue(Ljava/lang/String;)Ljava/lang/String;

    .line 523
    :cond_1a
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/safety/Whitelist$Protocol;

    .line 524
    .local v2, "protocol":Lorg/jsoup/safety/Whitelist$Protocol;
    invoke-virtual {v2}, Lorg/jsoup/safety/Whitelist$Protocol;->toString()Ljava/lang/String;

    move-result-object v1

    .line 526
    .local v1, "prot":Ljava/lang/String;
    const-string v5, "#"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 527
    invoke-direct {p0, v3}, Lorg/jsoup/safety/Whitelist;->isValidAnchor(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 540
    .end local v1    # "prot":Ljava/lang/String;
    .end local v2    # "protocol":Lorg/jsoup/safety/Whitelist$Protocol;
    :goto_3c
    return v4

    .line 534
    .restart local v1    # "prot":Ljava/lang/String;
    .restart local v2    # "protocol":Lorg/jsoup/safety/Whitelist$Protocol;
    :cond_3d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 536
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1e

    goto :goto_3c

    .line 540
    .end local v1    # "prot":Ljava/lang/String;
    .end local v2    # "protocol":Lorg/jsoup/safety/Whitelist$Protocol;
    :cond_5b
    const/4 v4, 0x0

    goto :goto_3c
.end method


# virtual methods
.method public varargs addAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 12
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "keys"    # [Ljava/lang/String;

    .prologue
    .line 252
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 253
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 254
    array-length v7, p2

    if-lez v7, :cond_39

    const/4 v7, 0x1

    :goto_a
    const-string v8, "No attributes supplied."

    invoke-static {v7, v8}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 256
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v6

    .line 257
    .local v6, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v7, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v7, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_20

    .line 258
    iget-object v7, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_20
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 260
    .local v1, "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_28
    if-ge v3, v5, :cond_3b

    aget-object v4, v0, v3

    .line 261
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 262
    invoke-static {v4}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 260
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 254
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    .end local v3    # "i$":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "len$":I
    .end local v6    # "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_39
    const/4 v7, 0x0

    goto :goto_a

    .line 264
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_3b
    iget-object v7, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 265
    iget-object v7, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 266
    .local v2, "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    invoke-interface {v2, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 270
    .end local v2    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    :goto_4e
    return-object p0

    .line 268
    :cond_4f
    iget-object v7, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v7, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4e
.end method

.method public addEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 9
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 331
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 332
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 333
    invoke-static {p3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 335
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v3

    .line 336
    .local v3, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 337
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 338
    :cond_1a
    invoke-static {p2}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v0

    .line 339
    .local v0, "attrKey":Lorg/jsoup/safety/Whitelist$AttributeKey;
    invoke-static {p3}, Lorg/jsoup/safety/Whitelist$AttributeValue;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeValue;

    move-result-object v2

    .line 341
    .local v2, "attrVal":Lorg/jsoup/safety/Whitelist$AttributeValue;
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 342
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    :goto_35
    return-object p0

    .line 344
    :cond_36
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 345
    .local v1, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35
.end method

.method public varargs addProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 14
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "protocols"    # [Ljava/lang/String;

    .prologue
    .line 411
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 412
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 413
    invoke-static {p3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 415
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v8

    .line 416
    .local v8, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    invoke-static {p2}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v1

    .line 420
    .local v1, "attrKey":Lorg/jsoup/safety/Whitelist$AttributeKey;
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_41

    .line 421
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 426
    .local v2, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    :goto_21
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4c

    .line 427
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 432
    .local v6, "protSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    :goto_2d
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_30
    if-ge v3, v4, :cond_55

    aget-object v7, v0, v3

    .line 433
    .local v7, "protocol":Ljava/lang/String;
    invoke-static {v7}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 434
    invoke-static {v7}, Lorg/jsoup/safety/Whitelist$Protocol;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$Protocol;

    move-result-object v5

    .line 435
    .local v5, "prot":Lorg/jsoup/safety/Whitelist$Protocol;
    invoke-interface {v6, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 432
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 423
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "prot":Lorg/jsoup/safety/Whitelist$Protocol;
    .end local v6    # "protSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    .end local v7    # "protocol":Ljava/lang/String;
    :cond_41
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 424
    .restart local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 429
    :cond_4c
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 430
    .restart local v6    # "protSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    invoke-interface {v2, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2d

    .line 437
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    :cond_55
    return-object p0
.end method

.method public varargs addTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 8
    .param p1, "tags"    # [Ljava/lang/String;

    .prologue
    .line 205
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 207
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_6
    if-ge v1, v2, :cond_19

    aget-object v3, v0, v1

    .line 208
    .local v3, "tagName":Ljava/lang/String;
    invoke-static {v3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 209
    iget-object v4, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-static {v3}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 207
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 211
    .end local v3    # "tagName":Ljava/lang/String;
    :cond_19
    return-object p0
.end method

.method getEnforcedAttributes(Ljava/lang/String;)Lorg/jsoup/nodes/Attributes;
    .registers 9
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 548
    new-instance v0, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 549
    .local v0, "attrs":Lorg/jsoup/nodes/Attributes;
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v4

    .line 550
    .local v4, "tag":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 551
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 552
    .local v3, "keyVals":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_45

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 553
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/safety/Whitelist$AttributeKey;

    invoke-virtual {v5}, Lorg/jsoup/safety/Whitelist$AttributeKey;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/safety/Whitelist$AttributeValue;

    invoke-virtual {v5}, Lorg/jsoup/safety/Whitelist$AttributeValue;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v6, v5}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_21

    .line 556
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "keyVals":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    :cond_45
    return-object v0
.end method

.method protected isSafeAttribute(Ljava/lang/String;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Attribute;)Z
    .registers 10
    .param p1, "tagName"    # Ljava/lang/String;
    .param p2, "el"    # Lorg/jsoup/nodes/Element;
    .param p3, "attr"    # Lorg/jsoup/nodes/Attribute;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 496
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v2

    .line 497
    .local v2, "tag":Lorg/jsoup/safety/Whitelist$TagName;
    invoke-virtual {p3}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v1

    .line 499
    .local v1, "key":Lorg/jsoup/safety/Whitelist$AttributeKey;
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 500
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 501
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 502
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 504
    .local v0, "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-direct {p0, p2, p3, v3}, Lorg/jsoup/safety/Whitelist;->testValidProtocol(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Attribute;Ljava/util/Set;)Z

    move-result v3

    if-eqz v3, :cond_49

    :cond_46
    move v3, v5

    :goto_47
    move v5, v3

    .line 511
    .end local v0    # "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    :cond_48
    :goto_48
    return v5

    .restart local v0    # "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    :cond_49
    move v3, v4

    .line 504
    goto :goto_47

    .line 511
    .end local v0    # "attrProts":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    :cond_4b
    const-string v3, ":all"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5b

    const-string v3, ":all"

    invoke-virtual {p0, v3, p2, p3}, Lorg/jsoup/safety/Whitelist;->isSafeAttribute(Ljava/lang/String;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Attribute;)Z

    move-result v3

    if-nez v3, :cond_48

    :cond_5b
    move v5, v4

    goto :goto_48
.end method

.method protected isSafeTag(Ljava/lang/String;)Z
    .registers 4
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 485
    iget-object v0, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public preserveRelativeLinks(Z)Lorg/jsoup/safety/Whitelist;
    .registers 2
    .param p1, "preserve"    # Z

    .prologue
    .line 390
    iput-boolean p1, p0, Lorg/jsoup/safety/Whitelist;->preserveRelativeLinks:Z

    .line 391
    return-object p0
.end method

.method public varargs removeAttributes(Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 13
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "keys"    # [Ljava/lang/String;

    .prologue
    .line 289
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 290
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 291
    array-length v8, p2

    if-lez v8, :cond_2c

    const/4 v8, 0x1

    :goto_a
    const-string v9, "No attributes supplied."

    invoke-static {v8, v9}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 293
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v7

    .line 294
    .local v7, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 295
    .local v1, "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1b
    if-ge v3, v5, :cond_2e

    aget-object v4, v0, v3

    .line 296
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 297
    invoke-static {v4}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 295
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 291
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    .end local v3    # "i$":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "len$":I
    .end local v7    # "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_2c
    const/4 v8, 0x0

    goto :goto_a

    .line 299
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "attributeSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    .restart local v7    # "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_2e
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v8, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_54

    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_54

    .line 300
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 301
    .local v2, "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    invoke-interface {v2, v1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 303
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_54

    .line 304
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .end local v2    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    :cond_54
    const-string v8, ":all"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 307
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_66
    :goto_66
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_89

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/safety/Whitelist$TagName;

    .line 308
    .local v6, "name":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 309
    .restart local v2    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    invoke-interface {v2, v1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 311
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_66

    .line 312
    iget-object v8, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v8, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_66

    .line 314
    .end local v2    # "currentSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$AttributeKey;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "name":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_89
    return-object p0
.end method

.method public removeEnforcedAttribute(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 7
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 359
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 360
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 362
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v2

    .line 363
    .local v2, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 364
    invoke-static {p2}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v0

    .line 365
    .local v0, "attrKey":Lorg/jsoup/safety/Whitelist$AttributeKey;
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 366
    .local v1, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 369
    iget-object v3, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .end local v0    # "attrKey":Lorg/jsoup/safety/Whitelist$AttributeKey;
    .end local v1    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Lorg/jsoup/safety/Whitelist$AttributeValue;>;"
    :cond_34
    return-object p0
.end method

.method public varargs removeProtocols(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 14
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "protocols"    # [Ljava/lang/String;

    .prologue
    .line 452
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 453
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 454
    invoke-static {p3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 456
    invoke-static {p1}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v8

    .line 457
    .local v8, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    invoke-static {p2}, Lorg/jsoup/safety/Whitelist$AttributeKey;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$AttributeKey;

    move-result-object v1

    .line 459
    .local v1, "attrKey":Lorg/jsoup/safety/Whitelist$AttributeKey;
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_55

    .line 460
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 461
    .local v2, "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_55

    .line 462
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 463
    .local v6, "protSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_30
    if-ge v3, v4, :cond_41

    aget-object v7, v0, v3

    .line 464
    .local v7, "protocol":Ljava/lang/String;
    invoke-static {v7}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 465
    invoke-static {v7}, Lorg/jsoup/safety/Whitelist$Protocol;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$Protocol;

    move-result-object v5

    .line 466
    .local v5, "prot":Lorg/jsoup/safety/Whitelist$Protocol;
    invoke-interface {v6, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 463
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 469
    .end local v5    # "prot":Lorg/jsoup/safety/Whitelist$Protocol;
    .end local v7    # "protocol":Ljava/lang/String;
    :cond_41
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_55

    .line 470
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_55

    .line 472
    iget-object v9, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v9, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "attrMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/jsoup/safety/Whitelist$AttributeKey;Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "protSet":Ljava/util/Set;, "Ljava/util/Set<Lorg/jsoup/safety/Whitelist$Protocol;>;"
    :cond_55
    return-object p0
.end method

.method public varargs removeTags([Ljava/lang/String;)Lorg/jsoup/safety/Whitelist;
    .registers 8
    .param p1, "tags"    # [Ljava/lang/String;

    .prologue
    .line 221
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 223
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_6
    if-ge v1, v2, :cond_2b

    aget-object v3, v0, v1

    .line 224
    .local v3, "tag":Ljava/lang/String;
    invoke-static {v3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 225
    invoke-static {v3}, Lorg/jsoup/safety/Whitelist$TagName;->valueOf(Ljava/lang/String;)Lorg/jsoup/safety/Whitelist$TagName;

    move-result-object v4

    .line 227
    .local v4, "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->tagNames:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 228
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->attributes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->enforcedAttributes:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    iget-object v5, p0, Lorg/jsoup/safety/Whitelist;->protocols:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 233
    .end local v3    # "tag":Ljava/lang/String;
    .end local v4    # "tagName":Lorg/jsoup/safety/Whitelist$TagName;
    :cond_2b
    return-object p0
.end method
