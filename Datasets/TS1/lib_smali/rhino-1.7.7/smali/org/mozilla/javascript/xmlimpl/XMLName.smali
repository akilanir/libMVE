.class Lorg/mozilla/javascript/xmlimpl/XMLName;
.super Lorg/mozilla/javascript/Ref;
.source "XMLName.java"


# static fields
.field static final serialVersionUID:J = 0x352ea00d07427a41L


# instance fields
.field private isAttributeName:Z

.field private isDescendants:Z

.field private qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

.field private xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/mozilla/javascript/Ref;-><init>()V

    .line 98
    return-void
.end method

.method static accept(Ljava/lang/Object;)Z
    .registers 8
    .param p0, "nameObj"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 68
    :try_start_1
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_4
    .catch Lorg/mozilla/javascript/EcmaError; {:try_start_1 .. :try_end_4} :catch_23

    move-result-object v3

    .line 77
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 78
    .local v2, "length":I
    if-eqz v2, :cond_22

    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 80
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_16
    if-eq v1, v2, :cond_34

    .line 81
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isNCNameChar(I)Z

    move-result v5

    if-nez v5, :cond_31

    .line 89
    .end local v1    # "i":I
    .end local v2    # "length":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_22
    :goto_22
    return v4

    .line 69
    :catch_23
    move-exception v0

    .line 70
    .local v0, "ee":Lorg/mozilla/javascript/EcmaError;
    const-string v5, "TypeError"

    invoke-virtual {v0}, Lorg/mozilla/javascript/EcmaError;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_22

    .line 73
    throw v0

    .line 80
    .end local v0    # "ee":Lorg/mozilla/javascript/EcmaError;
    .restart local v1    # "i":I
    .restart local v2    # "length":I
    .restart local v3    # "name":Ljava/lang/String;
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 85
    :cond_34
    const/4 v4, 0x1

    goto :goto_22
.end method

.method private addAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 3
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 229
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addMatchingAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 230
    return-void
.end method

.method private addDescendantAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 6
    .param p1, "list"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 198
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 199
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addMatchingAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 200
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getChildren()[Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 201
    .local v0, "children":[Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    array-length v2, v0

    if-ge v1, v2, :cond_19

    .line 202
    aget-object v2, v0, v1

    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addDescendantAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 205
    .end local v0    # "children":[Lorg/mozilla/javascript/xmlimpl/XML;
    .end local v1    # "i":I
    :cond_19
    return-void
.end method

.method private addDescendantChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 7
    .param p1, "list"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 173
    move-object v2, p0

    .line 174
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v3

    if-eqz v3, :cond_24

    .line 175
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getChildren()[Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 176
    .local v0, "children":[Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v3, v0

    if-ge v1, v3, :cond_24

    .line 177
    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matches(Lorg/mozilla/javascript/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 178
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 180
    :cond_1c
    aget-object v3, v0, v1

    invoke-direct {p0, p1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addDescendantChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 176
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 183
    .end local v0    # "children":[Lorg/mozilla/javascript/xmlimpl/XML;
    .end local v1    # "i":I
    :cond_24
    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 7
    .param p0, "defaultNamespaceUri"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 122
    if-nez p1, :cond_9

    .line 123
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 125
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 126
    .local v1, "l":I
    if-eqz v1, :cond_31

    .line 127
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 128
    .local v0, "firstChar":C
    const/16 v3, 0x2a

    if-ne v0, v3, :cond_1f

    .line 129
    if-ne v1, v4, :cond_31

    .line 130
    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 139
    .end local v0    # "firstChar":C
    :goto_1e
    return-object v2

    .line 132
    .restart local v0    # "firstChar":C
    :cond_1f
    const/16 v3, 0x40

    if-ne v0, v3, :cond_31

    .line 133
    const-string v3, ""

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 134
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->setAttributeName()V

    goto :goto_1e

    .line 139
    .end local v0    # "firstChar":C
    .end local v2    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_31
    invoke-static {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    goto :goto_1e
.end method

.method static create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 2
    .param p0, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 153
    invoke-static {p0, v0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method static create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 4
    .param p0, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p1, "attribute"    # Z
    .param p2, "descendants"    # Z

    .prologue
    .line 143
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLName;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;-><init>()V

    .line 144
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    iput-object p0, v0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .line 145
    iput-boolean p1, v0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName:Z

    .line 146
    iput-boolean p2, v0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants:Z

    .line 147
    return-object v0
.end method

.method static formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 117
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method static formProperty(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 4
    .param p0, "namespace"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .param p1, "localName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 109
    if-eqz p1, :cond_b

    const-string v1, "*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/4 p1, 0x0

    .line 110
    :cond_b
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLName;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;-><init>()V

    .line 111
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-static {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    iput-object v1, v0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .line 112
    return-object v0
.end method

.method static formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 101
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLName;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;-><init>()V

    .line 102
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-static {v1, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    iput-object v1, v0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .line 103
    return-object v0
.end method

.method private static isNCNameChar(I)Z
    .registers 4
    .param p0, "c"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 42
    and-int/lit8 v2, p0, -0x80

    if-nez v2, :cond_34

    .line 44
    const/16 v2, 0x61

    if-lt p0, v2, :cond_11

    .line 45
    const/16 v2, 0x7a

    if-gt p0, v2, :cond_f

    .line 60
    :cond_e
    :goto_e
    return v0

    :cond_f
    move v0, v1

    .line 45
    goto :goto_e

    .line 46
    :cond_11
    const/16 v2, 0x41

    if-lt p0, v2, :cond_1f

    .line 47
    const/16 v2, 0x5a

    if-le p0, v2, :cond_e

    .line 50
    const/16 v2, 0x5f

    if-eq p0, v2, :cond_e

    move v0, v1

    goto :goto_e

    .line 51
    :cond_1f
    const/16 v2, 0x30

    if-lt p0, v2, :cond_29

    .line 52
    const/16 v2, 0x39

    if-le p0, v2, :cond_e

    move v0, v1

    goto :goto_e

    .line 54
    :cond_29
    const/16 v2, 0x2d

    if-eq p0, v2, :cond_31

    const/16 v2, 0x2e

    if-ne p0, v2, :cond_32

    :cond_31
    move v1, v0

    :cond_32
    move v0, v1

    goto :goto_e

    .line 56
    :cond_34
    and-int/lit16 v2, p0, -0x2000

    if-nez v2, :cond_4d

    .line 57
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v2

    if-nez v2, :cond_4a

    const/16 v2, 0xb7

    if-eq p0, v2, :cond_4a

    const/16 v2, 0x300

    if-gt v2, p0, :cond_4b

    const/16 v2, 0x36f

    if-gt p0, v2, :cond_4b

    :cond_4a
    move v1, v0

    :cond_4b
    move v0, v1

    goto :goto_e

    .line 60
    :cond_4d
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v2

    if-nez v2, :cond_5b

    const/16 v2, 0x203f

    if-gt v2, p0, :cond_5c

    const/16 v2, 0x2040

    if-gt p0, v2, :cond_5c

    :cond_5b
    move v1, v0

    :cond_5c
    move v0, v1

    goto :goto_e
.end method

.method private static isNCNameStartChar(I)Z
    .registers 4
    .param p0, "c"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 15
    and-int/lit8 v2, p0, -0x80

    if-nez v2, :cond_1f

    .line 17
    const/16 v2, 0x61

    if-lt p0, v2, :cond_11

    .line 18
    const/16 v2, 0x7a

    if-gt p0, v2, :cond_f

    .line 32
    :cond_e
    :goto_e
    return v0

    :cond_f
    move v0, v1

    .line 18
    goto :goto_e

    .line 19
    :cond_11
    const/16 v2, 0x41

    if-lt p0, v2, :cond_49

    .line 20
    const/16 v2, 0x5a

    if-le p0, v2, :cond_e

    .line 23
    const/16 v2, 0x5f

    if-eq p0, v2, :cond_e

    move v0, v1

    goto :goto_e

    .line 25
    :cond_1f
    and-int/lit16 v2, p0, -0x2000

    if-nez v2, :cond_49

    .line 26
    const/16 v2, 0xc0

    if-gt v2, p0, :cond_2b

    const/16 v2, 0xd6

    if-le p0, v2, :cond_e

    :cond_2b
    const/16 v2, 0xd8

    if-gt v2, p0, :cond_33

    const/16 v2, 0xf6

    if-le p0, v2, :cond_e

    :cond_33
    const/16 v2, 0xf8

    if-gt v2, p0, :cond_3b

    const/16 v2, 0x2ff

    if-le p0, v2, :cond_e

    :cond_3b
    const/16 v2, 0x370

    if-gt v2, p0, :cond_43

    const/16 v2, 0x37d

    if-le p0, v2, :cond_e

    :cond_43
    const/16 v2, 0x37f

    if-le v2, p0, :cond_e

    move v0, v1

    goto :goto_e

    .line 32
    :cond_49
    const/16 v2, 0x200c

    if-gt v2, p0, :cond_51

    const/16 v2, 0x200d

    if-le p0, v2, :cond_e

    :cond_51
    const/16 v2, 0x2070

    if-gt v2, p0, :cond_59

    const/16 v2, 0x218f

    if-le p0, v2, :cond_e

    :cond_59
    const/16 v2, 0x2c00

    if-gt v2, p0, :cond_61

    const/16 v2, 0x2fef

    if-le p0, v2, :cond_e

    :cond_61
    const/16 v2, 0x3001

    if-gt v2, p0, :cond_6a

    const v2, 0xd7ff

    if-le p0, v2, :cond_e

    :cond_6a
    const v2, 0xf900

    if-gt v2, p0, :cond_74

    const v2, 0xfdcf

    if-le p0, v2, :cond_e

    :cond_74
    const v2, 0xfdf0

    if-gt v2, p0, :cond_7e

    const v2, 0xfffd

    if-le p0, v2, :cond_e

    :cond_7e
    const/high16 v2, 0x10000

    if-gt v2, p0, :cond_87

    const v2, 0xeffff

    if-le p0, v2, :cond_e

    :cond_87
    move v0, v1

    goto :goto_e
.end method


# virtual methods
.method addDescendants(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 5
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 220
    move-object v0, p0

    .line 221
    .local v0, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 222
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matchDescendantAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 226
    :goto_a
    return-void

    .line 224
    :cond_b
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matchDescendantChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    goto :goto_a
.end method

.method addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 6
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 233
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 234
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addDescendants(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 248
    :goto_9
    return-void

    .line 235
    :cond_a
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 236
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    goto :goto_9

    .line 238
    :cond_14
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getChildren()[Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 239
    .local v0, "children":[Lorg/mozilla/javascript/xmlimpl/XML;
    if-eqz v0, :cond_2e

    .line 240
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    array-length v2, v0

    if-ge v1, v2, :cond_2e

    .line 241
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matches(Lorg/mozilla/javascript/xmlimpl/XML;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 242
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 240
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 246
    .end local v1    # "i":I
    :cond_2e
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    goto :goto_9
.end method

.method addMatchingAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 7
    .param p1, "list"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 186
    move-object v2, p0

    .line 187
    .local v2, "name":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 188
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XML;->getAttributes()[Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 189
    .local v0, "attributes":[Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v3, v0

    if-ge v1, v3, :cond_1f

    .line 190
    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLName;->matches(Lorg/mozilla/javascript/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 191
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 189
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 195
    .end local v0    # "attributes":[Lorg/mozilla/javascript/xmlimpl/XML;
    .end local v1    # "i":I
    :cond_1f
    return-void
.end method

.method public delete(Lorg/mozilla/javascript/Context;)Z
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    const/4 v0, 0x1

    .line 348
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-nez v1, :cond_6

    .line 352
    :cond_5
    :goto_5
    return v0

    .line 351
    :cond_6
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 352
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x0

    goto :goto_5
.end method

.method public get(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-nez v0, :cond_f

    .line 326
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 329
    :cond_f
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getMyValueOn(Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 3
    .param p1, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 251
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 252
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {p0, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 253
    return-object v0
.end method

.method public has(Lorg/mozilla/javascript/Context;)Z
    .registers 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 317
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-nez v0, :cond_6

    .line 318
    const/4 v0, 0x0

    .line 320
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v0

    goto :goto_5
.end method

.method initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V
    .registers 3
    .param p1, "xmlObject"    # Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .prologue
    .line 157
    if-nez p1, :cond_8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 158
    :cond_8
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 159
    :cond_12
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 160
    return-void
.end method

.method isAttributeName()Z
    .registers 2

    .prologue
    .line 422
    iget-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName:Z

    return v0
.end method

.method isDescendants()Z
    .registers 2

    .prologue
    .line 434
    iget-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants:Z

    return v0
.end method

.method localName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_b

    const-string v0, "*"

    .line 169
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method matchDescendantAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 4
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 209
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addDescendantAttributes(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 210
    return-object p1
.end method

.method matchDescendantChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 4
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 214
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 215
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->addDescendantChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 216
    return-object p1
.end method

.method final matches(Lorg/mozilla/javascript/xmlimpl/XML;)Z
    .registers 8
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 391
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getNodeQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    .line 392
    .local v1, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    const/4 v0, 0x0

    .line 393
    .local v0, "nodeUri":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v4

    if-eqz v4, :cond_15

    .line 394
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v4

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    .line 396
    :cond_15
    iget-boolean v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName:Z

    if-eqz v4, :cond_4e

    .line 397
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->isAttribute()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 398
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2f

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 399
    :cond_2f
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_49

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 416
    :cond_49
    :goto_49
    return v2

    :cond_4a
    move v2, v3

    .line 403
    goto :goto_49

    :cond_4c
    move v2, v3

    .line 407
    goto :goto_49

    .line 410
    :cond_4e
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_64

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_84

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_84

    .line 411
    :cond_64
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_49

    .line 412
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_84

    .line 413
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_49

    :cond_84
    move v2, v3

    .line 416
    goto :goto_49
.end method

.method final matchesElement(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Z
    .registers 4
    .param p1, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 382
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 383
    :cond_18
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 384
    :cond_32
    const/4 v0, 0x1

    .line 387
    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method

.method final matchesLocalName(Ljava/lang/String;)Z
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 378
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public set(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-nez v0, :cond_f

    .line 335
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 341
    :cond_f
    iget-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants:Z

    if-eqz v0, :cond_18

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 342
    :cond_18
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->xmlObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0, p0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 343
    return-object p2
.end method

.method setAttributeName()V
    .registers 2

    .prologue
    .line 429
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName:Z

    .line 430
    return-void
.end method

.method setIsDescendants()V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 442
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants:Z

    .line 443
    return-void
.end method

.method setMyValueOn(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)V
    .registers 11
    .param p1, "target"    # Lorg/mozilla/javascript/xmlimpl/XML;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 258
    if-nez p2, :cond_f

    .line 259
    const-string p2, "null"

    .line 264
    .end local p2    # "value":Ljava/lang/Object;
    :cond_4
    :goto_4
    move-object v4, p0

    .line 266
    .local v4, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v6

    if-eqz v6, :cond_16

    .line 267
    invoke-virtual {p1, v4, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 313
    :goto_e
    return-void

    .line 260
    .end local v4    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_f
    instance-of v6, p2, Lorg/mozilla/javascript/Undefined;

    if-eqz v6, :cond_4

    .line 261
    const-string p2, "undefined"

    .local p2, "value":Ljava/lang/String;
    goto :goto_4

    .line 268
    .end local p2    # "value":Ljava/lang/String;
    .restart local v4    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_16
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_2c

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 269
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    goto :goto_e

    .line 272
    :cond_2c
    const/4 v5, 0x0

    .line 274
    .local v5, "xmlValue":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    instance-of v6, p2, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-eqz v6, :cond_72

    move-object v5, p2

    .line 275
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 278
    instance-of v6, v5, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v6, :cond_49

    move-object v6, v5

    .line 279
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-virtual {v6}, Lorg/mozilla/javascript/xmlimpl/XML;->isAttribute()Z

    move-result v6

    if-eqz v6, :cond_49

    .line 280
    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v4, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->makeXmlFromString(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v5

    .line 285
    :cond_49
    instance-of v6, v5, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v6, :cond_7a

    .line 286
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4e
    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->length()I

    move-result v6

    if-ge v1, v6, :cond_7a

    move-object v6, v5

    .line 287
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XMLList;

    invoke-virtual {v6, v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    .line 289
    .local v3, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->isAttribute()Z

    move-result v6

    if-eqz v6, :cond_6f

    move-object v6, v5

    .line 290
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XMLList;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v4, v7}, Lorg/mozilla/javascript/xmlimpl/XML;->makeXmlFromString(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    invoke-virtual {v6, v1, v7}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 286
    :cond_6f
    add-int/lit8 v1, v1, 0x1

    goto :goto_4e

    .line 295
    .end local v1    # "i":I
    .end local v3    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_72
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v4, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->makeXmlFromString(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v5

    .line 298
    :cond_7a
    invoke-virtual {p1, v4}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    .line 300
    .local v2, "matches":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v6

    if-nez v6, :cond_88

    .line 301
    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    goto :goto_e

    .line 304
    :cond_88
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_89
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v6

    if-ge v1, v6, :cond_9d

    .line 305
    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v6

    invoke-virtual {v6}, Lorg/mozilla/javascript/xmlimpl/XML;->childIndex()I

    move-result v6

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->removeChild(I)V

    .line 304
    add-int/lit8 v1, v1, 0x1

    goto :goto_89

    .line 309
    :cond_9d
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 310
    .local v0, "firstMatch":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XML;->childIndex()I

    move-result v6

    invoke-virtual {p1, v6, v5}, Lorg/mozilla/javascript/xmlimpl/XML;->replace(ILjava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    goto/16 :goto_e
.end method

.method final toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .registers 2

    .prologue
    .line 374
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x22

    .line 358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 359
    .local v0, "buff":Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants:Z

    if-eqz v1, :cond_10

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    :cond_10
    iget-boolean v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName:Z

    if-eqz v1, :cond_19

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 361
    :cond_19
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_35

    .line 362
    const/16 v1, 0x2a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 363
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 370
    :goto_34
    return-object v1

    .line 367
    :cond_35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 369
    :cond_44
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_34
.end method

.method uri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    .line 164
    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLName;->qname:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method
