.class public Lorg/jsoup/safety/Cleaner;
.super Ljava/lang/Object;
.source "Cleaner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/safety/Cleaner$ElementMeta;,
        Lorg/jsoup/safety/Cleaner$CleaningVisitor;
    }
.end annotation


# instance fields
.field private whitelist:Lorg/jsoup/safety/Whitelist;


# direct methods
.method public constructor <init>(Lorg/jsoup/safety/Whitelist;)V
    .registers 2
    .param p1, "whitelist"    # Lorg/jsoup/safety/Whitelist;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 34
    iput-object p1, p0, Lorg/jsoup/safety/Cleaner;->whitelist:Lorg/jsoup/safety/Whitelist;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lorg/jsoup/safety/Cleaner;)Lorg/jsoup/safety/Whitelist;
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/safety/Cleaner;

    .prologue
    .line 25
    iget-object v0, p0, Lorg/jsoup/safety/Cleaner;->whitelist:Lorg/jsoup/safety/Whitelist;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jsoup/safety/Cleaner;Lorg/jsoup/nodes/Element;)Lorg/jsoup/safety/Cleaner$ElementMeta;
    .registers 3
    .param p0, "x0"    # Lorg/jsoup/safety/Cleaner;
    .param p1, "x1"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lorg/jsoup/safety/Cleaner;->createSafeElement(Lorg/jsoup/nodes/Element;)Lorg/jsoup/safety/Cleaner$ElementMeta;

    move-result-object v0

    return-object v0
.end method

.method private copySafeNodes(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
    .registers 6
    .param p1, "source"    # Lorg/jsoup/nodes/Element;
    .param p2, "dest"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 120
    new-instance v0, Lorg/jsoup/safety/Cleaner$CleaningVisitor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, p2, v2}, Lorg/jsoup/safety/Cleaner$CleaningVisitor;-><init>(Lorg/jsoup/safety/Cleaner;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;Lorg/jsoup/safety/Cleaner$1;)V

    .line 121
    .local v0, "cleaningVisitor":Lorg/jsoup/safety/Cleaner$CleaningVisitor;
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    invoke-direct {v1, v0}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 122
    .local v1, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {v1, p1}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 123
    # getter for: Lorg/jsoup/safety/Cleaner$CleaningVisitor;->numDiscarded:I
    invoke-static {v0}, Lorg/jsoup/safety/Cleaner$CleaningVisitor;->access$300(Lorg/jsoup/safety/Cleaner$CleaningVisitor;)I

    move-result v2

    return v2
.end method

.method private createSafeElement(Lorg/jsoup/nodes/Element;)Lorg/jsoup/safety/Cleaner$ElementMeta;
    .registers 11
    .param p1, "sourceEl"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 127
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v6

    .line 128
    .local v6, "sourceTag":Ljava/lang/String;
    new-instance v1, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v1}, Lorg/jsoup/nodes/Attributes;-><init>()V

    .line 129
    .local v1, "destAttrs":Lorg/jsoup/nodes/Attributes;
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {v6}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v7

    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v7, v8, v1}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 130
    .local v0, "dest":Lorg/jsoup/nodes/Element;
    const/4 v3, 0x0

    .line 132
    .local v3, "numDiscarded":I
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v5

    .line 133
    .local v5, "sourceAttrs":Lorg/jsoup/nodes/Attributes;
    invoke-virtual {v5}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Attribute;

    .line 134
    .local v4, "sourceAttr":Lorg/jsoup/nodes/Attribute;
    iget-object v8, p0, Lorg/jsoup/safety/Cleaner;->whitelist:Lorg/jsoup/safety/Whitelist;

    invoke-virtual {v8, v6, p1, v4}, Lorg/jsoup/safety/Whitelist;->isSafeAttribute(Ljava/lang/String;Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Attribute;)Z

    move-result v8

    if-eqz v8, :cond_37

    .line 135
    invoke-virtual {v1, v4}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    goto :goto_1f

    .line 137
    :cond_37
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 139
    .end local v4    # "sourceAttr":Lorg/jsoup/nodes/Attribute;
    :cond_3a
    iget-object v7, p0, Lorg/jsoup/safety/Cleaner;->whitelist:Lorg/jsoup/safety/Whitelist;

    invoke-virtual {v7, v6}, Lorg/jsoup/safety/Whitelist;->getEnforcedAttributes(Ljava/lang/String;)Lorg/jsoup/nodes/Attributes;

    move-result-object v2

    .line 140
    .local v2, "enforcedAttrs":Lorg/jsoup/nodes/Attributes;
    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Attributes;->addAll(Lorg/jsoup/nodes/Attributes;)V

    .line 142
    new-instance v7, Lorg/jsoup/safety/Cleaner$ElementMeta;

    invoke-direct {v7, v0, v3}, Lorg/jsoup/safety/Cleaner$ElementMeta;-><init>(Lorg/jsoup/nodes/Element;I)V

    return-object v7
.end method


# virtual methods
.method public clean(Lorg/jsoup/nodes/Document;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p1, "dirtyDocument"    # Lorg/jsoup/nodes/Document;

    .prologue
    .line 44
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 46
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jsoup/nodes/Document;->createShell(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 47
    .local v0, "clean":Lorg/jsoup/nodes/Document;
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 48
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/jsoup/safety/Cleaner;->copySafeNodes(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I

    .line 50
    :cond_1c
    return-object v0
.end method

.method public isValid(Lorg/jsoup/nodes/Document;)Z
    .registers 6
    .param p1, "dirtyDocument"    # Lorg/jsoup/nodes/Document;

    .prologue
    .line 65
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 67
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/nodes/Document;->createShell(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 68
    .local v0, "clean":Lorg/jsoup/nodes/Document;
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lorg/jsoup/safety/Cleaner;->copySafeNodes(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I

    move-result v1

    .line 69
    .local v1, "numDiscarded":I
    if-nez v1, :cond_1b

    const/4 v2, 0x1

    :goto_1a
    return v2

    :cond_1b
    const/4 v2, 0x0

    goto :goto_1a
.end method
