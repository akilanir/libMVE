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

    invoke-virtual {v0, p1}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

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

.method public formData()Ljava/util/List;
    .registers 12
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
    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/Connection$KeyVal;>;"
    iget-object v8, p0, Lorg/jsoup/nodes/FormElement;->elements:Lorg/jsoup/select/Elements;

    invoke-virtual {v8}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_b
    :goto_b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 77
    .local v1, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v9

    invoke-virtual {v9}, Lorg/jsoup/parser/Tag;->isFormSubmittable()Z

    move-result v9

    if-eqz v9, :cond_b

    .line 78
    const-string v9, "disabled"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_b

    .line 79
    const-string v9, "name"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_b

    .line 81
    const-string v9, "type"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 83
    .local v6, "type":Ljava/lang/String;
    const-string v9, "select"

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_85

    .line 84
    const-string v9, "option[selected]"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    .line 85
    .local v4, "options":Lorg/jsoup/select/Elements;
    const/4 v5, 0x0

    .line 86
    .local v5, "set":Z
    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_52
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 87
    .local v3, "option":Lorg/jsoup/nodes/Element;
    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v10

    invoke-static {v2, v10}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    const/4 v5, 0x1

    .line 89
    goto :goto_52

    .line 90
    .end local v3    # "option":Lorg/jsoup/nodes/Element;
    :cond_6b
    if-nez v5, :cond_b

    .line 91
    const-string v9, "option"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v9

    invoke-virtual {v9}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v3

    .line 92
    .restart local v3    # "option":Lorg/jsoup/nodes/Element;
    if-eqz v3, :cond_b

    .line 93
    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 95
    .end local v3    # "option":Lorg/jsoup/nodes/Element;
    .end local v4    # "options":Lorg/jsoup/select/Elements;
    .end local v5    # "set":Z
    :cond_85
    const-string v9, "checkbox"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_95

    const-string v9, "radio"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b7

    .line 97
    :cond_95
    const-string v9, "checked"

    invoke-virtual {v1, v9}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 98
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_b4

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v7

    .line 99
    .local v7, "val":Ljava/lang/String;
    :goto_ab
    invoke-static {v2, v7}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_b

    .line 98
    .end local v7    # "val":Ljava/lang/String;
    :cond_b4
    const-string v7, "on"

    goto :goto_ab

    .line 102
    :cond_b7
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_b

    .line 105
    .end local v1    # "el":Lorg/jsoup/nodes/Element;
    .end local v2    # "name":Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_c4
    return-object v0
.end method

.method public submit()Lorg/jsoup/Connection;
    .registers 5

    .prologue
    .line 57
    const-string v2, "action"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/FormElement;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_38

    const-string v2, "action"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/FormElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "action":Ljava/lang/String;
    :goto_e
    const-string v2, "Could not determine a form action URL for submit. Ensure you set a base URI when parsing."

    invoke-static {v0, v2}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string v2, "method"

    invoke-virtual {p0, v2}, Lorg/jsoup/nodes/FormElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "POST"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    sget-object v1, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    .line 62
    .local v1, "method":Lorg/jsoup/Connection$Method;
    :goto_27
    invoke-static {v0}, Lorg/jsoup/Jsoup;->connect(Ljava/lang/String;)Lorg/jsoup/Connection;

    move-result-object v2

    .line 63
    invoke-virtual {p0}, Lorg/jsoup/nodes/FormElement;->formData()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jsoup/Connection;->data(Ljava/util/Collection;)Lorg/jsoup/Connection;

    move-result-object v2

    .line 64
    invoke-interface {v2, v1}, Lorg/jsoup/Connection;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection;

    move-result-object v2

    return-object v2

    .line 57
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "method":Lorg/jsoup/Connection$Method;
    :cond_38
    invoke-virtual {p0}, Lorg/jsoup/nodes/FormElement;->baseUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 59
    .restart local v0    # "action":Ljava/lang/String;
    :cond_3d
    sget-object v1, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    goto :goto_27
.end method
