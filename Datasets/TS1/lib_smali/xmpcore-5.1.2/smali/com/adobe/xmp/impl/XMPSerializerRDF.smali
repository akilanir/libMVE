.class public Lcom/adobe/xmp/impl/XMPSerializerRDF;
.super Ljava/lang/Object;
.source "XMPSerializerRDF.java"


# static fields
.field private static final DEFAULT_PAD:I = 0x800

.field private static final PACKET_HEADER:Ljava/lang/String; = "<?xpacket begin=\"\ufeff\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>"

.field private static final PACKET_TRAILER:Ljava/lang/String; = "<?xpacket end=\""

.field private static final PACKET_TRAILER2:Ljava/lang/String; = "\"?>"

.field static final RDF_ATTR_QUALIFIER:Ljava/util/Set;

.field private static final RDF_EMPTY_STRUCT:Ljava/lang/String; = "<rdf:Description/>"

.field private static final RDF_RDF_END:Ljava/lang/String; = "</rdf:RDF>"

.field private static final RDF_RDF_START:Ljava/lang/String; = "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"

.field private static final RDF_SCHEMA_END:Ljava/lang/String; = "</rdf:Description>"

.field private static final RDF_SCHEMA_START:Ljava/lang/String; = "<rdf:Description rdf:about="

.field private static final RDF_STRUCT_END:Ljava/lang/String; = "</rdf:Description>"

.field private static final RDF_STRUCT_START:Ljava/lang/String; = "<rdf:Description"

.field private static final RDF_XMPMETA_END:Ljava/lang/String; = "</x:xmpmeta>"

.field private static final RDF_XMPMETA_START:Ljava/lang/String; = "<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\""


# instance fields
.field private options:Lcom/adobe/xmp/options/SerializeOptions;

.field private outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

.field private padding:I

.field private unicodeSize:I

.field private writer:Ljava/io/OutputStreamWriter;

.field private xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 68
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "xml:lang"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "rdf:resource"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "rdf:ID"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "rdf:bagID"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "rdf:nodeID"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    return-void
.end method

.method private addPadding(I)V
    .registers 7
    .param p1, "tailLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 142
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getExactPacketLength()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 145
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/CountOutputStream;->getBytesWritten()I

    move-result v2

    iget v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/2addr v3, p1

    add-int v0, v2, v3

    .line 146
    .local v0, "minSize":I
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    if-le v0, v2, :cond_23

    .line 148
    new-instance v2, Lcom/adobe/xmp/XMPException;

    const-string v3, "Can\'t fit into specified packet size"

    const/16 v4, 0x6b

    invoke-direct {v2, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 151
    :cond_23
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 155
    .end local v0    # "minSize":I
    :cond_28
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    iget v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    div-int/2addr v2, v3

    iput v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 157
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getNewline()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 158
    .local v1, "newlineLen":I
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    if-lt v2, v1, :cond_61

    .line 160
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 161
    :goto_42
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    add-int/lit8 v3, v1, 0x64

    if-lt v2, v3, :cond_58

    .line 163
    const/16 v2, 0x64

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    .line 164
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 165
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    add-int/lit8 v3, v1, 0x64

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_42

    .line 167
    :cond_58
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    .line 168
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 174
    :goto_60
    return-void

    .line 172
    :cond_61
    iget v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    goto :goto_60
.end method

.method private appendNodeValue(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "forAttribute"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1289
    if-nez p1, :cond_4

    .line 1291
    const-string p1, ""

    .line 1293
    :cond_4
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/adobe/xmp/impl/Utils;->escapeXML(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1294
    return-void
.end method

.method private canBeRDFAttrProp(Lcom/adobe/xmp/impl/XMPNode;)Z
    .registers 4
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 1311
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isURI()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v0

    if-nez v0, :cond_28

    const-string v0, "[]"

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    const/4 v0, 0x1

    :goto_27
    return v0

    :cond_28
    const/4 v0, 0x0

    goto :goto_27
.end method

.method private declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V
    .registers 9
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "usedPrefixes"    # Ljava/util/Set;
    .param p4, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 874
    if-nez p2, :cond_2f

    .line 877
    new-instance v0, Lcom/adobe/xmp/impl/QName;

    invoke-direct {v0, p1}, Lcom/adobe/xmp/impl/QName;-><init>(Ljava/lang/String;)V

    .line 878
    .local v0, "qname":Lcom/adobe/xmp/impl/QName;
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/QName;->hasPrefix()Z

    move-result v1

    if-eqz v1, :cond_53

    .line 880
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/QName;->getPrefix()Ljava/lang/String;

    move-result-object p1

    .line 882
    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/adobe/xmp/XMPSchemaRegistry;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/xmp/XMPSchemaRegistry;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 884
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 892
    .end local v0    # "qname":Lcom/adobe/xmp/impl/QName;
    :cond_2f
    invoke-interface {p3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 894
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 895
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 896
    const-string v1, "xmlns:"

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 897
    invoke-direct {p0, p1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 898
    const-string v1, "=\""

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 899
    invoke-direct {p0, p2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 900
    const/16 v1, 0x22

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 901
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 903
    :cond_53
    return-void
.end method

.method private declareUsedNamespaces(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Set;I)V
    .registers 13
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "usedPrefixes"    # Ljava/util/Set;
    .param p3, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 833
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v5

    if-eqz v5, :cond_39

    .line 836
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 837
    .local v3, "prefix":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v5, p2, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 848
    .end local v3    # "prefix":Ljava/lang/String;
    :cond_25
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 850
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 851
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v0, p2, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Set;I)V

    goto :goto_29

    .line 839
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    .end local v2    # "it":Ljava/util/Iterator;
    :cond_39
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isStruct()Z

    move-result v5

    if-eqz v5, :cond_25

    .line 841
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "it":Ljava/util/Iterator;
    :goto_47
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    .line 843
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 844
    .local v1, "field":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v8, p2, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    goto :goto_47

    .line 854
    .end local v1    # "field":Lcom/adobe/xmp/impl/XMPNode;
    :cond_5b
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v2

    :goto_5f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_76

    .line 856
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    .line 857
    .local v4, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v8, p2, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 858
    invoke-direct {p0, v4, p2, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Set;I)V

    goto :goto_5f

    .line 860
    .end local v4    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_76
    return-void
.end method

.method private emitRDFArrayTag(Lcom/adobe/xmp/impl/XMPNode;ZI)V
    .registers 5
    .param p1, "arrayNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "isStartTag"    # Z
    .param p3, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1244
    if-nez p2, :cond_8

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 1246
    :cond_8
    invoke-direct {p0, p3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1247
    if-eqz p2, :cond_32

    const-string v0, "<rdf:"

    :goto_f
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1249
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1251
    const-string v0, "Alt"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1262
    :goto_21
    if-eqz p2, :cond_4b

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_4b

    .line 1264
    const-string v0, "/>"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1271
    :goto_2e
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1273
    :cond_31
    return-void

    .line 1247
    :cond_32
    const-string v0, "</rdf:"

    goto :goto_f

    .line 1253
    :cond_35
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayOrdered()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 1255
    const-string v0, "Seq"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_21

    .line 1259
    :cond_45
    const-string v0, "Bag"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_21

    .line 1268
    :cond_4b
    const-string v0, ">"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_2e
.end method

.method private endOuterRDFDescription(I)V
    .registers 3
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 934
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 935
    const-string v0, "</rdf:Description>"

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 936
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 937
    return-void
.end method

.method private serializeAsRDF()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 245
    const/4 v0, 0x0

    .line 248
    .local v0, "level":I
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v2

    if-nez v2, :cond_14

    .line 250
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 251
    const-string v2, "<?xpacket begin=\"\ufeff\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 252
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 256
    :cond_14
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitXmpMetaElement()Z

    move-result v2

    if-nez v2, :cond_41

    .line 258
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 259
    const-string v2, "<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\""

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 261
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitVersionAttribute()Z

    move-result v2

    if-nez v2, :cond_37

    .line 263
    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->getVersionInfo()Lcom/adobe/xmp/XMPVersionInfo;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/xmp/XMPVersionInfo;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 265
    :cond_37
    const-string v2, "\">"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 266
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 267
    add-int/lit8 v0, v0, 0x1

    .line 271
    :cond_41
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 272
    const-string v2, "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 273
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 276
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getUseCanonicalFormat()Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 278
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFSchemas(I)V

    .line 286
    :goto_57
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 287
    const-string v2, "</rdf:RDF>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 288
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 291
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitXmpMetaElement()Z

    move-result v2

    if-nez v2, :cond_77

    .line 293
    add-int/lit8 v0, v0, -0x1

    .line 294
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 295
    const-string v2, "</x:xmpmeta>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 296
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 299
    :cond_77
    const-string v1, ""

    .line 300
    .local v1, "tailStr":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v2

    if-nez v2, :cond_e8

    .line 302
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getBaseIndent()I

    move-result v0

    :goto_87
    if-lez v0, :cond_a7

    .line 304
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v3}, Lcom/adobe/xmp/options/SerializeOptions;->getIndent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 302
    add-int/lit8 v0, v0, -0x1

    goto :goto_87

    .line 282
    .end local v1    # "tailStr":Ljava/lang/String;
    :cond_a3
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFSchemas(I)V

    goto :goto_57

    .line 307
    .restart local v1    # "tailStr":Ljava/lang/String;
    :cond_a7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<?xpacket end=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 308
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getReadOnlyPacket()Z

    move-result v2

    if-eqz v2, :cond_e9

    const/16 v2, 0x72

    :goto_cd
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 309
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"?>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 312
    :cond_e8
    return-object v1

    .line 308
    :cond_e9
    const/16 v2, 0x77

    goto :goto_cd
.end method

.method private serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V
    .registers 16
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "useCanonicalRDF"    # Z
    .param p3, "emitAsRDFValue"    # Z
    .param p4, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 993
    const/4 v2, 0x1

    .line 994
    .local v2, "emitEndTag":Z
    const/4 v5, 0x1

    .line 999
    .local v5, "indentEndTag":Z
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1000
    .local v1, "elemName":Ljava/lang/String;
    if-eqz p3, :cond_35

    .line 1002
    const-string v1, "rdf:value"

    .line 1009
    :cond_a
    :goto_a
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1010
    const/16 v8, 0x3c

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1011
    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1013
    const/4 v3, 0x0

    .line 1014
    .local v3, "hasGeneralQualifiers":Z
    const/4 v4, 0x0

    .line 1016
    .local v4, "hasRDFResourceQual":Z
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "it":Ljava/util/Iterator;
    :cond_1b
    :goto_1b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6b

    .line 1018
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/xmp/impl/XMPNode;

    .line 1019
    .local v7, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    sget-object v8, Lcom/adobe/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_40

    .line 1021
    const/4 v3, 0x1

    goto :goto_1b

    .line 1004
    .end local v3    # "hasGeneralQualifiers":Z
    .end local v4    # "hasRDFResourceQual":Z
    .end local v6    # "it":Ljava/util/Iterator;
    .end local v7    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_35
    const-string v8, "[]"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 1006
    const-string v1, "rdf:li"

    goto :goto_a

    .line 1025
    .restart local v3    # "hasGeneralQualifiers":Z
    .restart local v4    # "hasRDFResourceQual":Z
    .restart local v6    # "it":Ljava/util/Iterator;
    .restart local v7    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_40
    const-string v8, "rdf:resource"

    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1026
    if-nez p3, :cond_1b

    .line 1028
    const/16 v8, 0x20

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1029
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1030
    const-string v8, "=\""

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1031
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-direct {p0, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1032
    const/16 v8, 0x22

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    goto :goto_1b

    .line 1039
    .end local v7    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_6b
    if-eqz v3, :cond_ed

    if-nez p3, :cond_ed

    .line 1046
    if-eqz v4, :cond_7b

    .line 1048
    new-instance v8, Lcom/adobe/xmp/XMPException;

    const-string v9, "Can\'t mix rdf:resource and general qualifiers"

    const/16 v10, 0xca

    invoke-direct {v8, v9, v10}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1054
    :cond_7b
    if-eqz p2, :cond_c0

    .line 1056
    const-string v8, ">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1057
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1059
    add-int/lit8 p4, p4, 0x1

    .line 1060
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1061
    const-string v8, "<rdf:Description"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1062
    const-string v8, ">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1068
    :goto_94
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1070
    const/4 v8, 0x1

    add-int/lit8 v9, p4, 0x1

    invoke-direct {p0, p1, p2, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    .line 1072
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v6

    :cond_a1
    :goto_a1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c6

    .line 1074
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/xmp/impl/XMPNode;

    .line 1075
    .restart local v7    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    sget-object v8, Lcom/adobe/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_a1

    .line 1077
    const/4 v8, 0x0

    add-int/lit8 v9, p4, 0x1

    invoke-direct {p0, v7, p2, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    goto :goto_a1

    .line 1066
    .end local v7    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_c0
    const-string v8, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_94

    .line 1081
    :cond_c6
    if-eqz p2, :cond_d5

    .line 1083
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1084
    const-string v8, "</rdf:Description>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1085
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1086
    add-int/lit8 p4, p4, -0x1

    .line 1219
    :cond_d5
    :goto_d5
    if-eqz v2, :cond_ec

    .line 1221
    if-eqz v5, :cond_dc

    .line 1223
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1225
    :cond_dc
    const-string v8, "</"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1226
    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1227
    const/16 v8, 0x3e

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1228
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1230
    :cond_ec
    return-void

    .line 1093
    :cond_ed
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v8

    if-nez v8, :cond_143

    .line 1097
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isURI()Z

    move-result v8

    if-eqz v8, :cond_118

    .line 1099
    const-string v8, " rdf:resource=\""

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1100
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-direct {p0, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1101
    const-string v8, "\"/>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1102
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1103
    const/4 v2, 0x0

    goto :goto_d5

    .line 1105
    :cond_118
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_12a

    const-string v8, ""

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_134

    .line 1107
    :cond_12a
    const-string v8, "/>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1108
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1109
    const/4 v2, 0x0

    goto :goto_d5

    .line 1113
    :cond_134
    const/16 v8, 0x3e

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1114
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {p0, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1115
    const/4 v5, 0x0

    goto :goto_d5

    .line 1118
    :cond_143
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v8

    if-eqz v8, :cond_187

    .line 1121
    const/16 v8, 0x3e

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1122
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1123
    const/4 v8, 0x1

    add-int/lit8 v9, p4, 0x1

    invoke-direct {p0, p1, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/adobe/xmp/impl/XMPNode;ZI)V

    .line 1124
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v8

    if-eqz v8, :cond_168

    .line 1126
    invoke-static {p1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->normalizeLangArray(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 1128
    :cond_168
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    :goto_16c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_17f

    .line 1130
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 1131
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    const/4 v8, 0x0

    add-int/lit8 v9, p4, 0x2

    invoke-direct {p0, v0, p2, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    goto :goto_16c

    .line 1133
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    :cond_17f
    const/4 v8, 0x0

    add-int/lit8 v9, p4, 0x1

    invoke-direct {p0, p1, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/adobe/xmp/impl/XMPNode;ZI)V

    goto/16 :goto_d5

    .line 1137
    :cond_187
    if-nez v4, :cond_1f9

    .line 1140
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v8

    if-nez v8, :cond_1af

    .line 1144
    if-eqz p2, :cond_1a8

    .line 1146
    const-string v8, ">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1147
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1148
    add-int/lit8 v8, p4, 0x1

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1149
    const-string v8, "<rdf:Description/>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1156
    :goto_1a3
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto/16 :goto_d5

    .line 1153
    :cond_1a8
    const-string v8, " rdf:parseType=\"Resource\"/>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1154
    const/4 v2, 0x0

    goto :goto_1a3

    .line 1162
    :cond_1af
    if-eqz p2, :cond_1e2

    .line 1164
    const-string v8, ">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1165
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1166
    add-int/lit8 p4, p4, 0x1

    .line 1167
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1168
    const-string v8, "<rdf:Description"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1169
    const-string v8, ">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1175
    :goto_1c8
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1177
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    :goto_1cf
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1e8

    .line 1179
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 1180
    .restart local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    const/4 v8, 0x0

    add-int/lit8 v9, p4, 0x1

    invoke-direct {p0, v0, p2, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    goto :goto_1cf

    .line 1173
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    :cond_1e2
    const-string v8, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_1c8

    .line 1183
    :cond_1e8
    if-eqz p2, :cond_d5

    .line 1185
    invoke-direct {p0, p4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1186
    const-string v8, "</rdf:Description>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1187
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1188
    add-int/lit8 p4, p4, -0x1

    goto/16 :goto_d5

    .line 1196
    :cond_1f9
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    :goto_1fd
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_240

    .line 1198
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 1199
    .restart local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/adobe/xmp/impl/XMPNode;)Z

    move-result v8

    if-nez v8, :cond_219

    .line 1201
    new-instance v8, Lcom/adobe/xmp/XMPException;

    const-string v9, "Can\'t mix rdf:resource and complex fields"

    const/16 v10, 0xca

    invoke-direct {v8, v9, v10}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 1204
    :cond_219
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1205
    add-int/lit8 v8, p4, 0x1

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1206
    const/16 v8, 0x20

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1207
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1208
    const-string v8, "=\""

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1209
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-direct {p0, v8, v9}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1210
    const/16 v8, 0x22

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    goto :goto_1fd

    .line 1212
    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    :cond_240
    const-string v8, "/>"

    invoke-direct {p0, v8}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1213
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1214
    const/4 v2, 0x0

    goto/16 :goto_d5
.end method

.method private serializeCanonicalRDFSchema(Lcom/adobe/xmp/impl/XMPNode;I)V
    .registers 8
    .param p1, "schemaNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 814
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 816
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 817
    .local v1, "propNode":Lcom/adobe/xmp/impl/XMPNode;
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getUseCanonicalFormat()Z

    move-result v2

    const/4 v3, 0x0

    add-int/lit8 v4, p2, 0x2

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    goto :goto_4

    .line 819
    .end local v1    # "propNode":Lcom/adobe/xmp/impl/XMPNode;
    :cond_1d
    return-void
.end method

.method private serializeCanonicalRDFSchemas(I)V
    .registers 5
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-lez v2, :cond_33

    .line 326
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-direct {p0, v2, p1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->startOuterRDFDescription(Lcom/adobe/xmp/impl/XMPNode;I)V

    .line 328
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 330
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 331
    .local v0, "currSchema":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v0, p1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFSchema(Lcom/adobe/xmp/impl/XMPNode;I)V

    goto :goto_1f

    .line 334
    .end local v0    # "currSchema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_2f
    invoke-direct {p0, p1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->endOuterRDFDescription(I)V

    .line 344
    .end local v1    # "it":Ljava/util/Iterator;
    :goto_32
    return-void

    .line 338
    :cond_33
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 339
    const-string v2, "<rdf:Description rdf:about="

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 340
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 341
    const-string v2, "/>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 342
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto :goto_32
.end method

.method private serializeCompactRDFArrayProp(Lcom/adobe/xmp/impl/XMPNode;I)V
    .registers 5
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 647
    const/16 v0, 0x3e

    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 648
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 649
    const/4 v0, 0x1

    add-int/lit8 v1, p2, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/adobe/xmp/impl/XMPNode;ZI)V

    .line 651
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 653
    invoke-static {p1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->normalizeLangArray(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 656
    :cond_1b
    add-int/lit8 v0, p2, 0x2

    invoke-direct {p0, p1, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/adobe/xmp/impl/XMPNode;I)V

    .line 658
    const/4 v0, 0x0

    add-int/lit8 v1, p2, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/adobe/xmp/impl/XMPNode;ZI)V

    .line 659
    return-void
.end method

.method private serializeCompactRDFAttrProps(Lcom/adobe/xmp/impl/XMPNode;I)Z
    .registers 8
    .param p1, "parentNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 432
    const/4 v0, 0x1

    .line 434
    .local v0, "allAreAttrs":Z
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_39

    .line 436
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 438
    .local v2, "prop":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/adobe/xmp/impl/XMPNode;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 440
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 441
    invoke-direct {p0, p2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 442
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 443
    const-string v3, "=\""

    invoke-direct {p0, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 444
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {p0, v3, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 445
    const/16 v3, 0x22

    invoke-direct {p0, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    goto :goto_5

    .line 449
    :cond_37
    const/4 v0, 0x0

    goto :goto_5

    .line 452
    .end local v2    # "prop":Lcom/adobe/xmp/impl/XMPNode;
    :cond_39
    return v0
.end method

.method private serializeCompactRDFElementProps(Lcom/adobe/xmp/impl/XMPNode;I)V
    .registers 16
    .param p1, "parentNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 508
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "it":Ljava/util/Iterator;
    :cond_5
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_cb

    .line 510
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/xmp/impl/XMPNode;

    .line 511
    .local v7, "node":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v7}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/adobe/xmp/impl/XMPNode;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 516
    const/4 v1, 0x1

    .line 517
    .local v1, "emitEndTag":Z
    const/4 v4, 0x1

    .line 522
    .local v4, "indentEndTag":Z
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    .line 523
    .local v0, "elemName":Ljava/lang/String;
    const-string v10, "[]"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_27

    .line 525
    const-string v0, "rdf:li"

    .line 528
    :cond_27
    invoke-direct {p0, p2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 529
    const/16 v10, 0x3c

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 530
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 532
    const/4 v2, 0x0

    .line 533
    .local v2, "hasGeneralQualifiers":Z
    const/4 v3, 0x0

    .line 535
    .local v3, "hasRDFResourceQual":Z
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "iq":Ljava/util/Iterator;
    :goto_38
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7a

    .line 537
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/xmp/impl/XMPNode;

    .line 538
    .local v8, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    sget-object v10, Lcom/adobe/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v8}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_52

    .line 540
    const/4 v2, 0x1

    goto :goto_38

    .line 544
    :cond_52
    const-string v10, "rdf:resource"

    invoke-virtual {v8}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 545
    const/16 v10, 0x20

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 546
    invoke-virtual {v8}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 547
    const-string v10, "=\""

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 548
    invoke-virtual {v8}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10, v12}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 549
    const/16 v10, 0x22

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    goto :goto_38

    .line 555
    .end local v8    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_7a
    if-eqz v2, :cond_98

    .line 557
    invoke-direct {p0, p2, v7}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFGeneralQualifier(ILcom/adobe/xmp/impl/XMPNode;)V

    .line 581
    :goto_7f
    if-eqz v1, :cond_5

    .line 583
    if-eqz v4, :cond_86

    .line 585
    invoke-direct {p0, p2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 587
    :cond_86
    const-string v10, "</"

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 588
    invoke-direct {p0, v0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 589
    const/16 v10, 0x3e

    invoke-direct {p0, v10}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 590
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto/16 :goto_5

    .line 562
    :cond_98
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v10

    if-nez v10, :cond_b8

    .line 564
    invoke-direct {p0, v7}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFSimpleProp(Lcom/adobe/xmp/impl/XMPNode;)[Ljava/lang/Object;

    move-result-object v9

    .line 565
    .local v9, "result":[Ljava/lang/Object;
    const/4 v10, 0x0

    aget-object v10, v9, v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 566
    aget-object v10, v9, v12

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    .line 567
    goto :goto_7f

    .line 568
    .end local v9    # "result":[Ljava/lang/Object;
    :cond_b8
    invoke-virtual {v7}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v10

    if-eqz v10, :cond_c6

    .line 570
    invoke-direct {p0, v7, p2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFArrayProp(Lcom/adobe/xmp/impl/XMPNode;I)V

    goto :goto_7f

    .line 574
    :cond_c6
    invoke-direct {p0, v7, p2, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFStructProp(Lcom/adobe/xmp/impl/XMPNode;IZ)Z

    move-result v1

    goto :goto_7f

    .line 594
    .end local v0    # "elemName":Ljava/lang/String;
    .end local v1    # "emitEndTag":Z
    .end local v2    # "hasGeneralQualifiers":Z
    .end local v3    # "hasRDFResourceQual":Z
    .end local v4    # "indentEndTag":Z
    .end local v5    # "iq":Ljava/util/Iterator;
    .end local v7    # "node":Lcom/adobe/xmp/impl/XMPNode;
    :cond_cb
    return-void
.end method

.method private serializeCompactRDFGeneralQualifier(ILcom/adobe/xmp/impl/XMPNode;)V
    .registers 8
    .param p1, "indent"    # I
    .param p2, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 769
    const-string v2, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 770
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 772
    const/4 v2, 0x1

    add-int/lit8 v3, p1, 0x1

    invoke-direct {p0, p2, v4, v2, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    .line 774
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iq":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 776
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 777
    .local v1, "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v1, v4, v4, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/adobe/xmp/impl/XMPNode;ZZI)V

    goto :goto_13

    .line 779
    .end local v1    # "qualifier":Lcom/adobe/xmp/impl/XMPNode;
    :cond_25
    return-void
.end method

.method private serializeCompactRDFSchemas(I)V
    .registers 7
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 371
    add-int/lit8 v4, p1, 0x1

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 372
    const-string v4, "<rdf:Description rdf:about="

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 373
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 376
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 377
    .local v3, "usedPrefixes":Ljava/util/Set;
    const-string v4, "xml"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 378
    const-string v4, "rdf"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 380
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_26
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_38

    .line 382
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 383
    .local v2, "schema":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v4, p1, 0x3

    invoke-direct {p0, v2, v3, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Set;I)V

    goto :goto_26

    .line 387
    .end local v2    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_38
    const/4 v0, 0x1

    .line 388
    .local v0, "allAreAttrs":Z
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    :goto_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 390
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 391
    .restart local v2    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v4, p1, 0x2

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/adobe/xmp/impl/XMPNode;I)Z

    move-result v4

    and-int/2addr v0, v4

    .line 392
    goto :goto_43

    .line 394
    .end local v2    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_57
    if-nez v0, :cond_7d

    .line 396
    const/16 v4, 0x3e

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 397
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 407
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    :goto_6b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_86

    .line 409
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 410
    .restart local v2    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    add-int/lit8 v4, p1, 0x2

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/adobe/xmp/impl/XMPNode;I)V

    goto :goto_6b

    .line 401
    .end local v2    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_7d
    const-string v4, "/>"

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 402
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 417
    :goto_85
    return-void

    .line 414
    :cond_86
    add-int/lit8 v4, p1, 0x1

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 415
    const-string v4, "</rdf:Description>"

    invoke-direct {p0, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 416
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto :goto_85
.end method

.method private serializeCompactRDFSimpleProp(Lcom/adobe/xmp/impl/XMPNode;)[Ljava/lang/Object;
    .registers 7
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 607
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 608
    .local v0, "emitEndTag":Ljava/lang/Boolean;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 610
    .local v1, "indentEndTag":Ljava/lang/Boolean;
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/options/PropertyOptions;->isURI()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 612
    const-string v2, " rdf:resource=\""

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 613
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 614
    const-string v2, "\"/>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 615
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 616
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 631
    :goto_26
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    aput-object v1, v2, v4

    return-object v2

    .line 618
    :cond_2e
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3e

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_49

    .line 620
    :cond_3e
    const-string v2, "/>"

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 621
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 622
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_26

    .line 626
    :cond_49
    const/16 v2, 0x3e

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 627
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v3}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 628
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_26
.end method

.method private serializeCompactRDFStructProp(Lcom/adobe/xmp/impl/XMPNode;IZ)Z
    .registers 12
    .param p1, "node"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .param p3, "hasRDFResourceQual"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 676
    const/4 v2, 0x0

    .line 677
    .local v2, "hasAttrFields":Z
    const/4 v3, 0x0

    .line 678
    .local v3, "hasElemFields":Z
    const/4 v0, 0x1

    .line 680
    .local v0, "emitEndTag":Z
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "ic":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 682
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 683
    .local v1, "field":Lcom/adobe/xmp/impl/XMPNode;
    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/adobe/xmp/impl/XMPNode;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 685
    const/4 v2, 0x1

    .line 692
    :goto_1a
    if-eqz v2, :cond_7

    if-eqz v3, :cond_7

    .line 698
    .end local v1    # "field":Lcom/adobe/xmp/impl/XMPNode;
    :cond_1e
    if-eqz p3, :cond_2e

    if-eqz v3, :cond_2e

    .line 700
    new-instance v5, Lcom/adobe/xmp/XMPException;

    const-string v6, "Can\'t mix rdf:resource qualifier and element fields"

    const/16 v7, 0xca

    invoke-direct {v5, v6, v7}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 689
    .restart local v1    # "field":Lcom/adobe/xmp/impl/XMPNode;
    :cond_2c
    const/4 v3, 0x1

    goto :goto_1a

    .line 705
    .end local v1    # "field":Lcom/adobe/xmp/impl/XMPNode;
    :cond_2e
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v5

    if-nez v5, :cond_3e

    .line 711
    const-string v5, " rdf:parseType=\"Resource\"/>"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 712
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 713
    const/4 v0, 0x0

    .line 750
    :goto_3d
    return v0

    .line 716
    :cond_3e
    if-nez v3, :cond_4f

    .line 720
    add-int/lit8 v5, p2, 0x1

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/adobe/xmp/impl/XMPNode;I)Z

    .line 721
    const-string v5, "/>"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 722
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 723
    const/4 v0, 0x0

    goto :goto_3d

    .line 726
    :cond_4f
    if-nez v2, :cond_5f

    .line 730
    const-string v5, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 731
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 732
    add-int/lit8 v5, p2, 0x1

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/adobe/xmp/impl/XMPNode;I)V

    goto :goto_3d

    .line 738
    :cond_5f
    const/16 v5, 0x3e

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 739
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 740
    add-int/lit8 v5, p2, 0x1

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 741
    const-string v5, "<rdf:Description"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 742
    add-int/lit8 v5, p2, 0x2

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/adobe/xmp/impl/XMPNode;I)Z

    .line 743
    const-string v5, ">"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 744
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 745
    add-int/lit8 v5, p2, 0x1

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/adobe/xmp/impl/XMPNode;I)V

    .line 746
    add-int/lit8 v5, p2, 0x1

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 747
    const-string v5, "</rdf:Description>"

    invoke-direct {p0, v5}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 748
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto :goto_3d
.end method

.method private startOuterRDFDescription(Lcom/adobe/xmp/impl/XMPNode;I)V
    .registers 5
    .param p1, "schemaNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 914
    add-int/lit8 v1, p2, 0x1

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 915
    const-string v1, "<rdf:Description rdf:about="

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 916
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 918
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 919
    .local v0, "usedPrefixes":Ljava/util/Set;
    const-string v1, "xml"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 920
    const-string v1, "rdf"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 922
    add-int/lit8 v1, p2, 0x3

    invoke-direct {p0, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/adobe/xmp/impl/XMPNode;Ljava/util/Set;I)V

    .line 924
    const/16 v1, 0x3e

    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 925
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 926
    return-void
.end method

.method private write(I)V
    .registers 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1340
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p1}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 1341
    return-void
.end method

.method private write(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1351
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1352
    return-void
.end method

.method private writeChars(IC)V
    .registers 4
    .param p1, "number"    # I
    .param p2, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1363
    :goto_0
    if-lez p1, :cond_a

    .line 1365
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p2}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 1363
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 1367
    :cond_a
    return-void
.end method

.method private writeIndent(I)V
    .registers 5
    .param p1, "times"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1326
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/adobe/xmp/options/SerializeOptions;->getBaseIndent()I

    move-result v1

    add-int v0, v1, p1

    .local v0, "i":I
    :goto_8
    if-lez v0, :cond_18

    .line 1328
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/adobe/xmp/options/SerializeOptions;->getIndent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1326
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 1330
    :cond_18
    return-void
.end method

.method private writeNewline()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1376
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/adobe/xmp/options/SerializeOptions;->getNewline()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1377
    return-void
.end method

.method private writeTreeName()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x22

    .line 352
    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 353
    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    .line 354
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_15

    .line 356
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 358
    :cond_15
    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 359
    return-void
.end method


# virtual methods
.method protected checkOptionsConsistence()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x67

    .line 183
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getEncodeUTF16BE()Z

    move-result v0

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/adobe/xmp/options/SerializeOptions;->getEncodeUTF16LE()Z

    move-result v1

    or-int/2addr v0, v1

    if-eqz v0, :cond_15

    .line 185
    const/4 v0, 0x2

    iput v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    .line 188
    :cond_15
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getExactPacketLength()Z

    move-result v0

    if-eqz v0, :cond_49

    .line 190
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/adobe/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v1

    or-int/2addr v0, v1

    if-eqz v0, :cond_34

    .line 192
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Inconsistent options for exact size serialize"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 195
    :cond_34
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getPadding()I

    move-result v0

    iget v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_6a

    .line 197
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Exact size must be a multiple of the Unicode element"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 201
    :cond_49
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getReadOnlyPacket()Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 203
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/adobe/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v1

    or-int/2addr v0, v1

    if-eqz v0, :cond_68

    .line 205
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Inconsistent options for read-only packet"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 208
    :cond_68
    iput v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 234
    :cond_6a
    :goto_6a
    return-void

    .line 210
    :cond_6b
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    if-eqz v0, :cond_86

    .line 212
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v0

    if-eqz v0, :cond_83

    .line 214
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Inconsistent options for non-packet serialize"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 217
    :cond_83
    iput v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_6a

    .line 221
    :cond_86
    iget v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    if-nez v0, :cond_90

    .line 223
    iget v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 226
    :cond_90
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/adobe/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v0

    if-eqz v0, :cond_6a

    .line 228
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    const-string v1, "http://ns.adobe.com/xap/1.0/"

    const-string v2, "Thumbnails"

    invoke-virtual {v0, v1, v2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6a

    .line 230
    iget v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    iget v1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/lit16 v1, v1, 0x2710

    add-int/2addr v0, v1

    iput v0, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_6a
.end method

.method public serialize(Lcom/adobe/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/adobe/xmp/options/SerializeOptions;)V
    .registers 9
    .param p1, "xmp"    # Lcom/adobe/xmp/XMPMeta;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "options"    # Lcom/adobe/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    new-instance v2, Lcom/adobe/xmp/impl/CountOutputStream;

    invoke-direct {v2, p2}, Lcom/adobe/xmp/impl/CountOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

    .line 103
    new-instance v2, Ljava/io/OutputStreamWriter;

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

    invoke-virtual {p3}, Lcom/adobe/xmp/options/SerializeOptions;->getEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    .line 105
    check-cast p1, Lcom/adobe/xmp/impl/XMPMetaImpl;

    .end local p1    # "xmp":Lcom/adobe/xmp/XMPMeta;
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->xmp:Lcom/adobe/xmp/impl/XMPMetaImpl;

    .line 106
    iput-object p3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->options:Lcom/adobe/xmp/options/SerializeOptions;

    .line 107
    invoke-virtual {p3}, Lcom/adobe/xmp/options/SerializeOptions;->getPadding()I

    move-result v2

    iput v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->padding:I

    .line 109
    new-instance v2, Ljava/io/OutputStreamWriter;

    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

    invoke-virtual {p3}, Lcom/adobe/xmp/options/SerializeOptions;->getEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    .line 111
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->checkOptionsConsistence()V

    .line 115
    invoke-direct {p0}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->serializeAsRDF()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "tailStr":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->addPadding(I)V

    .line 122
    invoke-direct {p0, v1}, Lcom/adobe/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 123
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 125
    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/adobe/xmp/impl/CountOutputStream;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/CountOutputStream;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4d} :catch_4e

    .line 131
    return-void

    .line 127
    .end local v1    # "tailStr":Ljava/lang/String;
    :catch_4e
    move-exception v0

    .line 129
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/adobe/xmp/XMPException;

    const-string v3, "Error writing to the OutputStream"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method
