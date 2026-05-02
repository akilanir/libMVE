.class public final Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
.super Ljava/lang/Object;
.source "KolabConfigurationXMLBuilder.java"


# instance fields
.field private final doc:Lorg/w3c/dom/Document;

.field private final rootElement:Lorg/w3c/dom/Element;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Document;Lorg/w3c/dom/Element;)V
    .registers 3
    .param p1, "doc"    # Lorg/w3c/dom/Document;
    .param p2, "rootElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    .line 34
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    .line 35
    return-void
.end method

.method public static final createInstance(Ljavax/xml/parsers/DocumentBuilder;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 5
    .param p0, "builder"    # Ljavax/xml/parsers/DocumentBuilder;

    .prologue
    .line 38
    invoke-virtual {p0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 39
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v2, "configuration"

    invoke-interface {v0, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 40
    .local v1, "root":Lorg/w3c/dom/Element;
    const-string v2, "xmlns"

    const-string v3, "http://kolab.org"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string v2, "version"

    const-string v3, "3.0"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 44
    new-instance v2, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    invoke-direct {v2, v0, v1}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;-><init>(Lorg/w3c/dom/Document;Lorg/w3c/dom/Element;)V

    return-object v2
.end method


# virtual methods
.method public build()Lorg/w3c/dom/Document;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method createTimestampString(Ljava/util/Date;)Ljava/lang/String;
    .registers 11
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    const/16 v8, 0x3a

    const/16 v7, 0x2d

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 73
    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 74
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "%1$04d"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    const/16 v2, 0x54

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xb

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 84
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const/16 v2, 0x5a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public withAuditInformation(Lorg/kore/kolab/notes/AuditInformation;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 7
    .param p1, "id"    # Lorg/kore/kolab/notes/AuditInformation;

    .prologue
    .line 60
    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getCreationDate()Ljava/sql/Timestamp;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->createTimestampString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "creation":Ljava/lang/String;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v4, "creation-date"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 62
    .local v1, "element":Lorg/w3c/dom/Element;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v3, v0}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 63
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v3, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 65
    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->createTimestampString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "modification":Ljava/lang/String;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v4, "last-modification-date"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 67
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v3, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 68
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v3, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 69
    return-object p0
.end method

.method public withColor(Lorg/kore/kolab/notes/Color;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 5
    .param p1, "color"    # Lorg/kore/kolab/notes/Color;

    .prologue
    .line 110
    if-eqz p1, :cond_1c

    .line 111
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "color"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 112
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {p1}, Lorg/kore/kolab/notes/Color;->getHexcode()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 113
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 115
    .end local v0    # "element":Lorg/w3c/dom/Element;
    :cond_1c
    return-object p0
.end method

.method public withIdentification(Lorg/kore/kolab/notes/Identification;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 5
    .param p1, "id"    # Lorg/kore/kolab/notes/Identification;

    .prologue
    .line 49
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "uid"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 50
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 51
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 53
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "prodid"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 54
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Identification;->getProductId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 55
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 56
    return-object p0
.end method

.method public withMembers(Ljava/util/Set;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;"
        }
    .end annotation

    .prologue
    .line 133
    .local p1, "members":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_40

    .line 134
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 135
    .local v1, "member":Ljava/lang/String;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v4, "member"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 136
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "urn:uuid:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v3

    invoke-interface {v0, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 137
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_a

    .line 140
    .end local v0    # "element":Lorg/w3c/dom/Element;
    .end local v1    # "member":Ljava/lang/String;
    :cond_40
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "name"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 102
    .local v0, "element":Lorg/w3c/dom/Element;
    if-eqz p1, :cond_13

    .line 103
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v1, p1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 105
    :cond_13
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 106
    return-object p0
.end method

.method public withPriority(I)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 5
    .param p1, "priority"    # I

    .prologue
    .line 126
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "priority"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 127
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 128
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 129
    return-object p0
.end method

.method public withRelationType()Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 4

    .prologue
    .line 119
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "relationType"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 120
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "tag"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 121
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 122
    return-object p0
.end method

.method public withType()Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;
    .registers 4

    .prologue
    .line 93
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "type"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 94
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->doc:Lorg/w3c/dom/Document;

    const-string v2, "relation"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 95
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->rootElement:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 97
    return-object p0
.end method
