.class public Lfreemarker/template/DefaultObjectWrapper;
.super Lfreemarker/ext/beans/BeansWrapper;
.source "DefaultObjectWrapper.java"


# static fields
.field private static JYTHON_OBJ_CLASS:Ljava/lang/Class;

.field private static JYTHON_WRAPPER:Lfreemarker/template/ObjectWrapper;

.field private static W3C_DOM_NODE_CLASS:Ljava/lang/Class;

.field static final instance:Lfreemarker/template/DefaultObjectWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 69
    new-instance v0, Lfreemarker/template/DefaultObjectWrapper;

    invoke-direct {v0}, Lfreemarker/template/DefaultObjectWrapper;-><init>()V

    sput-object v0, Lfreemarker/template/DefaultObjectWrapper;->instance:Lfreemarker/template/DefaultObjectWrapper;

    .line 78
    :try_start_7
    const-string v0, "org.w3c.dom.Node"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/DefaultObjectWrapper;->W3C_DOM_NODE_CLASS:Ljava/lang/Class;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_f} :catch_2f

    .line 81
    :goto_f
    :try_start_f
    const-string v0, "org.python.core.PyObject"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/DefaultObjectWrapper;->JYTHON_OBJ_CLASS:Ljava/lang/Class;

    .line 82
    const-string v0, "freemarker.ext.jython.JythonWrapper"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "INSTANCE"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/ObjectWrapper;

    sput-object v0, Lfreemarker/template/DefaultObjectWrapper;->JYTHON_WRAPPER:Lfreemarker/template/ObjectWrapper;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_2c} :catch_2d

    .line 88
    :goto_2c
    return-void

    .line 85
    :catch_2d
    move-exception v0

    goto :goto_2c

    .line 79
    :catch_2f
    move-exception v0

    goto :goto_f
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 67
    invoke-direct {p0}, Lfreemarker/ext/beans/BeansWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method protected convertArray(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "arr"    # Ljava/lang/Object;

    .prologue
    .line 158
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    .line 159
    .local v2, "size":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 160
    .local v1, "list":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v2, :cond_16

    .line 161
    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 163
    :cond_16
    return-object v1
.end method

.method protected handleUnknownType(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 139
    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->W3C_DOM_NODE_CLASS:Ljava/lang/Class;

    if-eqz v0, :cond_11

    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->W3C_DOM_NODE_CLASS:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 141
    invoke-virtual {p0, p1}, Lfreemarker/template/DefaultObjectWrapper;->wrapDomNode(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 146
    :goto_10
    return-object v0

    .line 143
    :cond_11
    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->JYTHON_WRAPPER:Lfreemarker/template/ObjectWrapper;

    if-eqz v0, :cond_24

    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->JYTHON_OBJ_CLASS:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 144
    sget-object v0, Lfreemarker/template/DefaultObjectWrapper;->JYTHON_WRAPPER:Lfreemarker/template/ObjectWrapper;

    invoke-interface {v0, p1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_10

    .line 146
    :cond_24
    invoke-super {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_10
.end method

.method public wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 91
    if-nez p1, :cond_8

    .line 92
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 130
    :goto_7
    return-object v0

    .line 94
    :cond_8
    instance-of v0, p1, Lfreemarker/template/TemplateModel;

    if-eqz v0, :cond_10

    move-object v0, p1

    .line 95
    check-cast v0, Lfreemarker/template/TemplateModel;

    goto :goto_7

    .line 97
    :cond_10
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1e

    .line 98
    new-instance v1, Lfreemarker/template/SimpleScalar;

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_7

    .line 100
    :cond_1e
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_2c

    .line 101
    new-instance v1, Lfreemarker/template/SimpleNumber;

    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    move-object v0, v1

    goto :goto_7

    .line 103
    :cond_2c
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_68

    .line 104
    instance-of v0, p1, Ljava/sql/Date;

    if-eqz v0, :cond_3e

    .line 105
    new-instance v1, Lfreemarker/template/SimpleDate;

    move-object v0, p1

    check-cast v0, Ljava/sql/Date;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/sql/Date;)V

    move-object v0, v1

    goto :goto_7

    .line 107
    :cond_3e
    instance-of v0, p1, Ljava/sql/Time;

    if-eqz v0, :cond_4c

    .line 108
    new-instance v1, Lfreemarker/template/SimpleDate;

    move-object v0, p1

    check-cast v0, Ljava/sql/Time;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/sql/Time;)V

    move-object v0, v1

    goto :goto_7

    .line 110
    :cond_4c
    instance-of v0, p1, Ljava/sql/Timestamp;

    if-eqz v0, :cond_5a

    .line 111
    new-instance v1, Lfreemarker/template/SimpleDate;

    move-object v0, p1

    check-cast v0, Ljava/sql/Timestamp;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/sql/Timestamp;)V

    move-object v0, v1

    goto :goto_7

    .line 113
    :cond_5a
    new-instance v1, Lfreemarker/template/SimpleDate;

    move-object v0, p1

    check-cast v0, Ljava/util/Date;

    invoke-virtual {p0}, Lfreemarker/template/DefaultObjectWrapper;->getDefaultDateType()I

    move-result v2

    invoke-direct {v1, v0, v2}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    move-object v0, v1

    goto :goto_7

    .line 115
    :cond_68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_76

    .line 116
    invoke-virtual {p0, p1}, Lfreemarker/template/DefaultObjectWrapper;->convertArray(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 118
    :cond_76
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_84

    .line 119
    new-instance v1, Lfreemarker/template/SimpleSequence;

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-direct {v1, v0, p0}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    move-object v0, v1

    goto :goto_7

    .line 121
    :cond_84
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_93

    .line 122
    new-instance v1, Lfreemarker/template/SimpleHash;

    move-object v0, p1

    check-cast v0, Ljava/util/Map;

    invoke-direct {v1, v0, p0}, Lfreemarker/template/SimpleHash;-><init>(Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V

    move-object v0, v1

    goto/16 :goto_7

    .line 124
    :cond_93
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_a7

    .line 125
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a3

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    goto/16 :goto_7

    :cond_a3
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto/16 :goto_7

    .line 127
    :cond_a7
    instance-of v0, p1, Ljava/util/Iterator;

    if-eqz v0, :cond_b6

    .line 128
    new-instance v1, Lfreemarker/template/SimpleCollection;

    move-object v0, p1

    check-cast v0, Ljava/util/Iterator;

    invoke-direct {v1, v0, p0}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Iterator;Lfreemarker/template/ObjectWrapper;)V

    move-object v0, v1

    goto/16 :goto_7

    .line 130
    :cond_b6
    invoke-virtual {p0, p1}, Lfreemarker/template/DefaultObjectWrapper;->handleUnknownType(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto/16 :goto_7
.end method

.method public wrapDomNode(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 151
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    return-object v0
.end method
