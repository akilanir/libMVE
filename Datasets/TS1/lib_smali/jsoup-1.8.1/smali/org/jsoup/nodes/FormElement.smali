.class public Lorg/jsoup/nodes/FormElement;
.super Lorg/jsoup/nodes/Element;
.source "FormElement.java"


# instance fields
.field private final elements:Lorg/jsoup/select/Elements;


# direct methods
.method public constructor <init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V
    .registers 5
    .param p1, "tag"    # Lorg/jsoup/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 18
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-direct {v0}, Lorg/jsoup/select/Elements;-><init>()V

    iput-object v0, p0, Lorg/jsoup/nodes/FormElement;->elements:Lorg/jsoup/select/Elements;

    .line 29
    return-void
.end method


# virtual methods
.method public addElement(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/FormElement;
    .registers 3
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jsoup/nodes/FormElement;->elements:Lorg/jsoup/select/Elements;

    invoke-virtual {v0, p1}, Lorg/jsoup/select/Elements;->add(Lorg/jsoup/nodes/Element;)Z

    .line 46
    return-object p0
.end method

.method public elements()Lorg/jsoup/select/Elements;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lorg/jsoup/nodes/FormElement;->elements:Lorg/jsoup/select/Elements;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 97
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public formData()Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/Connection$KeyVal;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/Connection$KeyVal;>;"
    iget-object v7, p0, Lorg/jsoup/nodes/FormElement;->elements:Lorg/jsoup/select/Elements;

    invoke-virtual {v7}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_67

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 79
    .local v1, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jsoup/parser/Tag;->isFormSubmittable()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 80
    const-string v7, "name"

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_b

    .line 83
    const-string v7, "select"

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5b

    .line 84
    const-string v7, "option[selected]"

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v6

    .line 85
    .local v6, "options":Lorg/jsoup/select/Elements;
    invoke-virtual {v6}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_43
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 86
    .local v5, "option":Lorg/jsoup/nodes/Element;
    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 89
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "option":Lorg/jsoup/nodes/Element;
    .end local v6    # "options":Lorg/jsoup/select/Elements;
    :cond_5b
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 92
    .end local v1    # "el":Lorg/jsoup/nodes/Element;
    .end local v4    # "name":Ljava/lang/String;
    :cond_67
    return-object v0
.end method

.method public submit()Lorg/jsoup/Connection;
    .registers 6

    .prologue
    .line 57
    const-string v3, "action"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/FormElement;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_38

    const-string v3, "action"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/FormElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "action":Ljava/lang/String;
    :goto_e
    const-string v3, "Could not determine a form action URL for submit. Ensure you set a base URI when parsing."

    invoke-static {v0, v3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v3, "method"

    invoke-virtual {p0, v3}, Lorg/jsoup/nodes/FormElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "POST"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d

    sget-object v2, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    .line 62
    .local v2, "method":Lorg/jsoup/Connection$Method;
    :goto_27
    invoke-static {v0}, Lorg/jsoup/Jsoup;->connect(Ljava/lang/String;)Lorg/jsoup/Connection;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jsoup/nodes/FormElement;->formData()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/jsoup/Connection;->data(Ljava/util/Collection;)Lorg/jsoup/Connection;

    move-result-object v3

    invoke-interface {v3, v2}, Lorg/jsoup/Connection;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection;

    move-result-object v1

    .line 66
    .local v1, "con":Lorg/jsoup/Connection;
    return-object v1

    .line 57
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "con":Lorg/jsoup/Connection;
    .end local v2    # "method":Lorg/jsoup/Connection$Method;
    :cond_38
    invoke-virtual {p0}, Lorg/jsoup/nodes/FormElement;->baseUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 59
    .restart local v0    # "action":Ljava/lang/String;
    :cond_3d
    sget-object v2, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    goto :goto_27
.end method
