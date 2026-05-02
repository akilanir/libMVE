.class public Lbrut/androlib/res/decoder/AXmlResourceParser;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/res/XmlResourceParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;
    }
.end annotation


# static fields
.field private static final ATTRIBUTE_IX_NAME:I = 0x1

.field private static final ATTRIBUTE_IX_NAMESPACE_URI:I = 0x0

.field private static final ATTRIBUTE_IX_VALUE_DATA:I = 0x4

.field private static final ATTRIBUTE_IX_VALUE_STRING:I = 0x2

.field private static final ATTRIBUTE_IX_VALUE_TYPE:I = 0x3

.field private static final ATTRIBUTE_LENGHT:I = 0x5

.field private static final CHUNK_AXML_FILE:I = 0x80003

.field private static final CHUNK_RESOURCEIDS:I = 0x80180

.field private static final CHUNK_XML_END_NAMESPACE:I = 0x100101

.field private static final CHUNK_XML_END_TAG:I = 0x100103

.field private static final CHUNK_XML_FIRST:I = 0x100100

.field private static final CHUNK_XML_LAST:I = 0x100104

.field private static final CHUNK_XML_START_NAMESPACE:I = 0x100100

.field private static final CHUNK_XML_START_TAG:I = 0x100102

.field private static final CHUNK_XML_TEXT:I = 0x100104

.field private static final E_NOT_SUPPORTED:Ljava/lang/String; = "Method is not supported."

.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

.field private mFirstError:Lbrut/androlib/AndrolibException;

.field private m_attributes:[I

.field private m_classAttribute:I

.field private m_decreaseDepth:Z

.field private m_event:I

.field private m_idAttribute:I

.field private m_lineNumber:I

.field private m_name:I

.field private m_namespaceUri:I

.field private m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

.field private m_operational:Z

.field private m_reader:Lbrut/util/ExtDataInput;

.field private m_resourceIDs:[I

.field private m_strings:Lbrut/androlib/res/decoder/StringBlock;

.field private m_styleAttribute:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lbrut/androlib/res/decoder/AXmlResourceParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lbrut/androlib/res/decoder/AXmlResourceParser;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lbrut/androlib/res/decoder/ResAttrDecoder;

    invoke-direct {v0}, Lbrut/androlib/res/decoder/ResAttrDecoder;-><init>()V

    iput-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_operational:Z

    new-instance v0, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-direct {v0}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;-><init>()V

    iput-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-direct {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->resetEventInfo()V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2

    invoke-direct {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;-><init>()V

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->open(Ljava/io/InputStream;)V

    return-void
.end method

.method private final doNext()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v8, 0x0

    const v2, 0x100102

    const v7, 0x100100

    const/4 v0, 0x3

    const/4 v6, 0x1

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    if-nez v1, :cond_29

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    const v3, 0x80003

    invoke-virtual {v1, v3}, Lbrut/util/ExtDataInput;->skipCheckInt(I)V

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-static {v1}, Lbrut/androlib/res/decoder/StringBlock;->read(Lbrut/util/ExtDataInput;)Lbrut/androlib/res/decoder/StringBlock;

    move-result-object v1

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->increaseDepth()V

    iput-boolean v6, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_operational:Z

    :cond_29
    iget v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    if-ne v1, v6, :cond_2e

    :goto_2d
    return-void

    :cond_2e
    iget v3, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    invoke-direct {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->resetEventInfo()V

    :cond_33
    :goto_33
    iget-boolean v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_decreaseDepth:Z

    if-eqz v1, :cond_3e

    iput-boolean v8, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_decreaseDepth:Z

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->decreaseDepth()V

    :cond_3e
    if-ne v3, v0, :cond_53

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getDepth()I

    move-result v1

    if-ne v1, v6, :cond_53

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getCurrentCount()I

    move-result v1

    if-nez v1, :cond_53

    iput v6, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    goto :goto_2d

    :cond_53
    if-nez v3, :cond_88

    move v1, v2

    :goto_56
    const v4, 0x80180

    if-ne v1, v4, :cond_9c

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    const/16 v4, 0x8

    if-lt v1, v4, :cond_69

    rem-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_8f

    :cond_69
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid resource ids size ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_88
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    goto :goto_56

    :cond_8f
    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    div-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v4, v1}, Lbrut/util/ExtDataInput;->readIntArray(I)[I

    move-result-object v1

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_resourceIDs:[I

    goto :goto_33

    :cond_9c
    if-lt v1, v7, :cond_a3

    const v4, 0x100104

    if-le v1, v4, :cond_c2

    :cond_a3
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid chunk type ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c2
    if-ne v1, v2, :cond_cb

    const/4 v4, -0x1

    if-ne v3, v4, :cond_cb

    iput v8, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    goto/16 :goto_2d

    :cond_cb
    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v4}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v4}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v4

    iget-object v5, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v5}, Lbrut/util/ExtDataInput;->skipInt()V

    if-eq v1, v7, :cond_e2

    const v5, 0x100101

    if-ne v1, v5, :cond_108

    :cond_e2
    if-ne v1, v7, :cond_f7

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v4}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v4

    iget-object v5, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v5, v1, v4}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->push(II)V

    goto/16 :goto_33

    :cond_f7
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->pop()Z

    goto/16 :goto_33

    :cond_108
    iput v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_lineNumber:I

    if-ne v1, v2, :cond_171

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaceUri:I

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    ushr-int/lit8 v2, v1, 0x10

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    const v2, 0xffff

    and-int/2addr v1, v2

    iget-object v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v2}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v2

    iput v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    iget v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    ushr-int/lit8 v2, v2, 0x10

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_styleAttribute:I

    iget v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    const v3, 0xffff

    and-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    iget-object v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    mul-int/lit8 v1, v1, 0x5

    invoke-virtual {v2, v1}, Lbrut/util/ExtDataInput;->readIntArray(I)[I

    move-result-object v1

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    :goto_155
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    array-length v1, v1

    if-ge v0, v1, :cond_167

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    iget-object v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    aget v2, v2, v0

    ushr-int/lit8 v2, v2, 0x18

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x5

    goto :goto_155

    :cond_167
    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->increaseDepth()V

    const/4 v0, 0x2

    iput v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    goto/16 :goto_2d

    :cond_171
    const v4, 0x100103

    if-ne v1, v4, :cond_18c

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaceUri:I

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v1}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    iput v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    iput-boolean v6, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_decreaseDepth:Z

    goto/16 :goto_2d

    :cond_18c
    const v4, 0x100104

    if-ne v1, v4, :cond_33

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v0

    iput v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v0}, Lbrut/util/ExtDataInput;->skipInt()V

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    invoke-virtual {v0}, Lbrut/util/ExtDataInput;->skipInt()V

    const/4 v0, 0x4

    iput v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    goto/16 :goto_2d
.end method

.method private final findAttribute(Ljava/lang/String;Ljava/lang/String;)I
    .registers 9

    const/4 v1, -0x1

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    if-eqz v0, :cond_7

    if-nez p2, :cond_8

    :cond_7
    :goto_7
    return v1

    :cond_8
    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v0, p2}, Lbrut/androlib/res/decoder/StringBlock;->find(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v1, :cond_7

    if-eqz p1, :cond_33

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v0, p1}, Lbrut/androlib/res/decoder/StringBlock;->find(Ljava/lang/String;)I

    move-result v0

    :goto_18
    const/4 v2, 0x0

    :goto_19
    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    array-length v4, v4

    if-eq v2, v4, :cond_7

    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5

    if-ne v3, v4, :cond_35

    if-eq v0, v1, :cond_30

    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v5, v2, 0x0

    aget v4, v4, v5

    if-ne v0, v4, :cond_35

    :cond_30
    div-int/lit8 v1, v2, 0x5

    goto :goto_7

    :cond_33
    move v0, v1

    goto :goto_18

    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_19
.end method

.method private final getAttributeOffset(I)I
    .registers 5

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Current event is not START_TAG."

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    mul-int/lit8 v0, p1, 0x5

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    array-length v1, v1

    if-lt v0, v1, :cond_33

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid attribute index ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_33
    return v0
.end method

.method private final resetEventInfo()V
    .registers 3

    const/4 v1, -0x1

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_lineNumber:I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaceUri:I

    const/4 v0, 0x0

    iput-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    iput v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_styleAttribute:I

    return-void
.end method

.method private setFirstError(Lbrut/androlib/AndrolibException;)V
    .registers 3

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mFirstError:Lbrut/androlib/AndrolibException;

    if-nez v0, :cond_6

    iput-object p1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mFirstError:Lbrut/androlib/AndrolibException;

    :cond_6
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    const/4 v1, 0x0

    iget-boolean v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_operational:Z

    if-nez v0, :cond_6

    :goto_5
    return-void

    :cond_6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_operational:Z

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    iput-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_resourceIDs:[I

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->reset()V

    invoke-direct {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->resetEventInfo()V

    goto :goto_5
.end method

.method public defineEntityReplacementText(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Method is not supported."

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttrDecoder()Lbrut/androlib/res/decoder/ResAttrDecoder;
    .registers 2

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

    return-object v0
.end method

.method public getAttributeBooleanValue(IZ)Z
    .registers 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_c

    move v0, v1

    :goto_5
    invoke-virtual {p0, p1, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeIntValue(II)I

    move-result v0

    if-eqz v0, :cond_e

    :goto_b
    return v1

    :cond_c
    move v0, v2

    goto :goto_5

    :cond_e
    move v1, v2

    goto :goto_b
.end method

.method public getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 6

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    :goto_7
    return p3

    :cond_8
    invoke-virtual {p0, v0, p3}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeBooleanValue(IZ)Z

    move-result p3

    goto :goto_7
.end method

.method public getAttributeCount()I
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_7

    const/4 v0, -0x1

    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    array-length v0, v0

    div-int/lit8 v0, v0, 0x5

    goto :goto_6
.end method

.method public getAttributeFloatValue(IF)F
    .registers 6

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v2, v0, 0x3

    aget v1, v1, v2

    const/4 v2, 0x4

    if-ne v1, v2, :cond_17

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget v0, v1, v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p2

    :cond_17
    return p2
.end method

.method public getAttributeFloatValue(Ljava/lang/String;Ljava/lang/String;F)F
    .registers 6

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    :goto_7
    return p3

    :cond_8
    invoke-virtual {p0, v0, p3}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeFloatValue(IF)F

    move-result p3

    goto :goto_7
.end method

.method public getAttributeIntValue(II)I
    .registers 6

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v2, v0, 0x3

    aget v1, v1, v2

    const/16 v2, 0x10

    if-lt v1, v2, :cond_18

    const/16 v2, 0x1f

    if-gt v1, v2, :cond_18

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget p2, v1, v0

    :cond_18
    return p2
.end method

.method public getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 6

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    :goto_7
    return p3

    :cond_8
    invoke-virtual {p0, v0, p3}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeIntValue(II)I

    move-result p3

    goto :goto_7
.end method

.method public getAttributeListValue(I[Ljava/lang/String;I)I
    .registers 5

    const/4 v0, 0x0

    return v0
.end method

.method public getAttributeListValue(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;I)I
    .registers 6

    const/4 v0, 0x0

    return v0
.end method

.method public getAttributeName(I)Ljava/lang/String;
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x1

    aget v0, v1, v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    const-string v0, ""

    :goto_f
    return-object v0

    :cond_10
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method public getAttributeNameResource(I)I
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x1

    aget v0, v1, v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_resourceIDs:[I

    if-eqz v1, :cond_15

    if-ltz v0, :cond_15

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_resourceIDs:[I

    array-length v1, v1

    if-lt v0, v1, :cond_17

    :cond_15
    const/4 v0, 0x0

    :goto_16
    return v0

    :cond_17
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_resourceIDs:[I

    aget v0, v1, v0

    goto :goto_16
.end method

.method public getAttributeNamespace(I)Ljava/lang/String;
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x0

    aget v0, v1, v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    const-string v0, ""

    :goto_f
    return-object v0

    :cond_10
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method public getAttributePrefix(I)Ljava/lang/String;
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x0

    aget v0, v1, v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->findPrefix(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_16

    const-string v0, ""

    :goto_15
    return-object v0

    :cond_16
    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_15
.end method

.method public getAttributeResourceValue(II)I
    .registers 6

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v2, v0, 0x3

    aget v1, v1, v2

    const/4 v2, 0x1

    if-ne v1, v2, :cond_13

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget p2, v1, v0

    :cond_13
    return p2
.end method

.method public getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 6

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    :goto_7
    return p3

    :cond_8
    invoke-virtual {p0, v0, p3}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeResourceValue(II)I

    move-result p3

    goto :goto_7
.end method

.method public getAttributeType(I)Ljava/lang/String;
    .registers 3

    const-string v0, "CDATA"

    return-object v0
.end method

.method public getAttributeUnsignedIntValue(II)I
    .registers 4

    invoke-virtual {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeIntValue(II)I

    move-result v0

    return v0
.end method

.method public getAttributeUnsignedIntValue(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 6

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    :goto_7
    return p3

    :cond_8
    invoke-virtual {p0, v0, p3}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeUnsignedIntValue(II)I

    move-result p3

    goto :goto_7
.end method

.method public getAttributeValue(I)Ljava/lang/String;
    .registers 11

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v2, v0, 0x3

    aget v1, v1, v2

    iget-object v2, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v3, v0, 0x4

    aget v2, v2, v3

    iget-object v3, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x2

    aget v0, v3, v0

    iget-object v3, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

    if-eqz v3, :cond_5d

    :try_start_1a
    iget-object v3, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

    const/4 v4, -0x1

    if-ne v0, v4, :cond_29

    const/4 v0, 0x0

    :goto_20
    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeNameResource(I)I

    move-result v4

    invoke-virtual {v3, v1, v2, v0, v4}, Lbrut/androlib/res/decoder/ResAttrDecoder;->decode(IILjava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    :goto_28
    return-object v0

    :cond_29
    iget-object v4, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v4, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbrut/androlib/res/xml/ResXmlEncoders;->escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;
    :try_end_32
    .catch Lbrut/androlib/AndrolibException; {:try_start_1a .. :try_end_32} :catch_34

    move-result-object v0

    goto :goto_20

    :catch_34
    move-exception v0

    invoke-direct {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->setFirstError(Lbrut/androlib/AndrolibException;)V

    sget-object v3, Lbrut/androlib/res/decoder/AXmlResourceParser;->LOGGER:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v5, "Could not decode attr value, using undecoded value instead: ns=%s, name=%s, value=0x%08x"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5d
    invoke-static {v1, v2}, Landroid/util/TypedValue;->coerceToString(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_28
.end method

.method public getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-direct {p0, p1, p2}, Lbrut/androlib/res/decoder/AXmlResourceParser;->findAttribute(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    const/4 v0, 0x0

    :goto_8
    return-object v0

    :cond_9
    invoke-virtual {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public getAttributeValueData(I)I
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget v0, v1, v0

    return v0
.end method

.method public getAttributeValueType(I)I
    .registers 4

    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x3

    aget v0, v1, v0

    return v0
.end method

.method public getClassAttribute()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_7

    const/4 v0, 0x0

    :goto_6
    return-object v0

    :cond_7
    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_classAttribute:I

    invoke-direct {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x2

    aget v0, v1, v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getColumnNumber()I
    .registers 2

    const/4 v0, -0x1

    return v0
.end method

.method public getDepth()I
    .registers 2

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getDepth()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getEventType()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    return v0
.end method

.method public getFeature(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public getFirstError()Lbrut/androlib/AndrolibException;
    .registers 2

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mFirstError:Lbrut/androlib/AndrolibException;

    return-object v0
.end method

.method public getIdAttribute()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_7

    const/4 v0, 0x0

    :goto_6
    return-object v0

    :cond_7
    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    invoke-direct {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x2

    aget v0, v1, v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getIdAttributeResourceValue(I)I
    .registers 5

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    :cond_5
    :goto_5
    return p1

    :cond_6
    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_idAttribute:I

    invoke-direct {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v2, v0, 0x3

    aget v1, v1, v2

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget p1, v1, v0

    goto :goto_5
.end method

.method public getInputEncoding()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_lineNumber:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_11

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_11

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return-object v0

    :cond_11
    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    iget v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    invoke-virtual {v0, v1}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public getNamespace()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    iget v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaceUri:I

    invoke-virtual {v0, v1}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Method is not supported."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNamespaceCount(I)I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getAccumulatedCount(I)I

    move-result v0

    return v0
.end method

.method public getNamespacePrefix(I)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getPrefix(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespaceUri(I)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    invoke-virtual {v0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->getUri(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPositionDescription()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XML line #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaces:Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;

    iget v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_namespaceUri:I

    invoke-virtual {v0, v1}, Lbrut/androlib/res/decoder/AXmlResourceParser$NamespaceStack;->findPrefix(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const/4 v0, 0x0

    return-object v0
.end method

.method final getStrings()Lbrut/androlib/res/decoder/StringBlock;
    .registers 2

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    return-object v0
.end method

.method public getStyleAttribute()I
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_styleAttribute:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_7

    const/4 v0, 0x0

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_styleAttribute:I

    invoke-direct {p0, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getAttributeOffset(I)I

    move-result v0

    iget-object v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_attributes:[I

    add-int/lit8 v0, v0, 0x4

    aget v0, v1, v0

    goto :goto_6
.end method

.method public getText()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_c

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_strings:Lbrut/androlib/res/decoder/StringBlock;

    iget v1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_name:I

    invoke-virtual {v0, v1}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public getTextCharacters([I)[C
    .registers 6

    const/4 v3, 0x0

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getText()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_9

    const/4 v0, 0x0

    :goto_8
    return-object v0

    :cond_9
    aput v3, p1, v3

    const/4 v0, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    aput v2, p1, v0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    new-array v0, v0, [C

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v3, v2, v0, v3}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_8
.end method

.method public isAttributeDefault(I)Z
    .registers 3

    const/4 v0, 0x0

    return v0
.end method

.method public isEmptyElementTag()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public isWhitespace()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public next()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    if-nez v0, :cond_d

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Parser is not opened."

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    :cond_d
    :try_start_d
    invoke-direct {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->doNext()V

    iget v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_event:I
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_13

    return v0

    :catch_13
    move-exception v0

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->close()V

    throw v0
.end method

.method public nextTag()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->isWhitespace()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v0

    :cond_11
    const/4 v1, 0x2

    if-eq v0, v1, :cond_20

    const/4 v1, 0x3

    if-eq v0, v1, :cond_20

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Expected start or end tag."

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    :cond_20
    return v0
.end method

.method public nextText()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_11

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Parser must be on START_TAG to read next text."

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    :cond_11
    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2a

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v1

    if-eq v1, v3, :cond_2e

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Event TEXT must be immediately followed by END_TAG."

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    :cond_2a
    if-ne v0, v3, :cond_2f

    const-string v0, ""

    :cond_2e
    return-object v0

    :cond_2f
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Parser must be on START_TAG or TEXT to read text."

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public nextToken()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v0

    return v0
.end method

.method public open(Ljava/io/InputStream;)V
    .registers 4

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->close()V

    if-eqz p1, :cond_11

    new-instance v0, Lbrut/util/ExtDataInput;

    new-instance v1, Lcom/mindprod/ledatastream/LEDataInputStream;

    invoke-direct {v1, p1}, Lcom/mindprod/ledatastream/LEDataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lbrut/util/ExtDataInput;-><init>(Ljava/io/DataInput;)V

    iput-object v0, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->m_reader:Lbrut/util/ExtDataInput;

    :cond_11
    return-void
.end method

.method public require(ILjava/lang/String;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getEventType()I

    move-result v0

    if-ne p1, v0, :cond_1e

    if-eqz p2, :cond_12

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    :cond_12
    if-eqz p3, :cond_3c

    invoke-virtual {p0}, Lbrut/androlib/res/decoder/AXmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    :cond_1e
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lbrut/androlib/res/decoder/AXmlResourceParser;->TYPES:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is expected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    :cond_3c
    return-void
.end method

.method public setAttrDecoder(Lbrut/androlib/res/decoder/ResAttrDecoder;)V
    .registers 2

    iput-object p1, p0, Lbrut/androlib/res/decoder/AXmlResourceParser;->mAttrDecoder:Lbrut/androlib/res/decoder/ResAttrDecoder;

    return-void
.end method

.method public setFeature(Ljava/lang/String;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Method is not supported."

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInput(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->open(Ljava/io/InputStream;)V

    return-void
.end method

.method public setInput(Ljava/io/Reader;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Method is not supported."

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "Method is not supported."

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
